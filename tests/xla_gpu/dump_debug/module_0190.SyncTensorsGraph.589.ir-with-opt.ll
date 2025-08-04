; ModuleID = 'SyncTensorsGraph.589'
source_filename = "SyncTensorsGraph.589"
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
define ptx_kernel void @wrapped_concatenate(ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %0, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %1, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %2, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %3, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %4, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %5, ptr noalias writeonly align 128 captures(none) dereferenceable(25165824) %6) local_unnamed_addr #2 {
  %8 = addrspacecast ptr %6 to ptr addrspace(1)
  %9 = addrspacecast ptr %5 to ptr addrspace(1)
  %10 = addrspacecast ptr %4 to ptr addrspace(1)
  %11 = addrspacecast ptr %3 to ptr addrspace(1)
  %12 = addrspacecast ptr %2 to ptr addrspace(1)
  %13 = addrspacecast ptr %1 to ptr addrspace(1)
  %14 = addrspacecast ptr %0 to ptr addrspace(1)
  %15 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %16 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %17 = lshr i32 %16, 2
  %18 = icmp samesign ult i32 %16, 12288
  %19 = shl nuw nsw i32 %15, 2
  %20 = shl nuw nsw i32 %16, 9
  %21 = or disjoint i32 %19, %20
  br i1 %18, label %22, label %47

22:                                               ; preds = %7
  %23 = icmp samesign ult i32 %16, 4096
  br i1 %23, label %24, label %27

24:                                               ; preds = %22
  %25 = zext nneg i32 %21 to i64
  %26 = getelementptr inbounds bfloat, ptr addrspace(1) %14, i64 %25
  br label %79

27:                                               ; preds = %22
  %28 = icmp samesign ult i32 %16, 8192
  %29 = and i32 %20, 1536
  %30 = shl nuw nsw i32 %17, 11
  br i1 %28, label %31, label %39

31:                                               ; preds = %27
  %32 = sext i32 %19 to i64
  %33 = sext i32 %29 to i64
  %34 = sext i32 %30 to i64
  %35 = add i64 %34, %33
  %36 = add i64 %35, %32
  %37 = getelementptr bfloat, ptr addrspace(1) %13, i64 %36
  %38 = getelementptr inbounds i8, ptr addrspace(1) %37, i64 -4194304
  br label %79

39:                                               ; preds = %27
  %40 = sext i32 %19 to i64
  %41 = sext i32 %29 to i64
  %42 = sext i32 %30 to i64
  %43 = add i64 %42, %41
  %44 = add i64 %43, %40
  %45 = getelementptr bfloat, ptr addrspace(1) %12, i64 %44
  %46 = getelementptr inbounds i8, ptr addrspace(1) %45, i64 -8388608
  br label %79

47:                                               ; preds = %7
  %48 = icmp samesign ult i32 %16, 16384
  br i1 %48, label %49, label %59

49:                                               ; preds = %47
  %50 = and i32 %20, 1536
  %51 = shl nuw nsw i32 %17, 11
  %52 = sext i32 %19 to i64
  %53 = sext i32 %50 to i64
  %54 = sext i32 %51 to i64
  %55 = add i64 %54, %53
  %56 = add i64 %55, %52
  %57 = getelementptr bfloat, ptr addrspace(1) %11, i64 %56
  %58 = getelementptr inbounds i8, ptr addrspace(1) %57, i64 -12582912
  br label %79

59:                                               ; preds = %47
  %60 = icmp samesign ult i32 %16, 20480
  %61 = and i32 %20, 1536
  %62 = shl nuw nsw i32 %17, 11
  br i1 %60, label %63, label %71

63:                                               ; preds = %59
  %64 = sext i32 %19 to i64
  %65 = sext i32 %61 to i64
  %66 = sext i32 %62 to i64
  %67 = add i64 %66, %65
  %68 = add i64 %67, %64
  %69 = getelementptr bfloat, ptr addrspace(1) %10, i64 %68
  %70 = getelementptr inbounds i8, ptr addrspace(1) %69, i64 -16777216
  br label %79

71:                                               ; preds = %59
  %72 = sext i32 %19 to i64
  %73 = sext i32 %61 to i64
  %74 = sext i32 %62 to i64
  %75 = add i64 %74, %73
  %76 = add i64 %75, %72
  %77 = getelementptr bfloat, ptr addrspace(1) %9, i64 %76
  %78 = getelementptr inbounds i8, ptr addrspace(1) %77, i64 -20971520
  br label %79

79:                                               ; preds = %24, %39, %31, %49, %71, %63
  %.in = phi ptr addrspace(1) [ %26, %24 ], [ %46, %39 ], [ %38, %31 ], [ %58, %49 ], [ %78, %71 ], [ %70, %63 ]
  %80 = icmp ult i32 %16, 12288
  br i1 %80, label %81, label %109

81:                                               ; preds = %79
  %82 = icmp samesign ult i32 %16, 4096
  br i1 %82, label %83, label %87

83:                                               ; preds = %81
  %84 = zext nneg i32 %21 to i64
  %85 = getelementptr bfloat, ptr addrspace(1) %14, i64 %84
  %86 = getelementptr inbounds i8, ptr addrspace(1) %85, i64 2
  br label %144

87:                                               ; preds = %81
  %88 = icmp samesign ult i32 %16, 8192
  %89 = and i32 %20, 1536
  %90 = shl nuw nsw i32 %17, 11
  br i1 %88, label %91, label %100

91:                                               ; preds = %87
  %92 = sext i32 %19 to i64
  %93 = sext i32 %89 to i64
  %94 = sext i32 %90 to i64
  %95 = add i64 %94, %93
  %96 = add i64 %95, %92
  %97 = add i64 %96, 1
  %98 = getelementptr bfloat, ptr addrspace(1) %13, i64 %97
  %99 = getelementptr inbounds i8, ptr addrspace(1) %98, i64 -4194304
  br label %144

100:                                              ; preds = %87
  %101 = sext i32 %19 to i64
  %102 = sext i32 %89 to i64
  %103 = sext i32 %90 to i64
  %104 = add i64 %103, %102
  %105 = add i64 %104, %101
  %106 = add i64 %105, 1
  %107 = getelementptr bfloat, ptr addrspace(1) %12, i64 %106
  %108 = getelementptr inbounds i8, ptr addrspace(1) %107, i64 -8388608
  br label %144

109:                                              ; preds = %79
  %110 = icmp samesign ult i32 %16, 16384
  br i1 %110, label %111, label %122

111:                                              ; preds = %109
  %112 = and i32 %20, 1536
  %113 = shl nuw nsw i32 %17, 11
  %114 = sext i32 %19 to i64
  %115 = sext i32 %112 to i64
  %116 = sext i32 %113 to i64
  %117 = add i64 %116, %115
  %118 = add i64 %117, %114
  %119 = add i64 %118, 1
  %120 = getelementptr bfloat, ptr addrspace(1) %11, i64 %119
  %121 = getelementptr inbounds i8, ptr addrspace(1) %120, i64 -12582912
  br label %144

122:                                              ; preds = %109
  %123 = icmp samesign ult i32 %16, 20480
  %124 = and i32 %20, 1536
  %125 = shl nuw nsw i32 %17, 11
  br i1 %123, label %126, label %135

126:                                              ; preds = %122
  %127 = sext i32 %19 to i64
  %128 = sext i32 %124 to i64
  %129 = sext i32 %125 to i64
  %130 = add i64 %129, %128
  %131 = add i64 %130, %127
  %132 = add i64 %131, 1
  %133 = getelementptr bfloat, ptr addrspace(1) %10, i64 %132
  %134 = getelementptr inbounds i8, ptr addrspace(1) %133, i64 -16777216
  br label %144

135:                                              ; preds = %122
  %136 = sext i32 %19 to i64
  %137 = sext i32 %124 to i64
  %138 = sext i32 %125 to i64
  %139 = add i64 %138, %137
  %140 = add i64 %139, %136
  %141 = add i64 %140, 1
  %142 = getelementptr bfloat, ptr addrspace(1) %9, i64 %141
  %143 = getelementptr inbounds i8, ptr addrspace(1) %142, i64 -20971520
  br label %144

144:                                              ; preds = %83, %100, %91, %111, %135, %126
  %.in1 = phi ptr addrspace(1) [ %86, %83 ], [ %108, %100 ], [ %99, %91 ], [ %121, %111 ], [ %143, %135 ], [ %134, %126 ]
  %145 = icmp ult i32 %16, 12288
  br i1 %145, label %146, label %174

146:                                              ; preds = %144
  %147 = icmp samesign ult i32 %16, 4096
  br i1 %147, label %148, label %152

148:                                              ; preds = %146
  %149 = zext nneg i32 %21 to i64
  %150 = getelementptr bfloat, ptr addrspace(1) %14, i64 %149
  %151 = getelementptr inbounds i8, ptr addrspace(1) %150, i64 4
  br label %209

152:                                              ; preds = %146
  %153 = icmp samesign ult i32 %16, 8192
  %154 = and i32 %20, 1536
  %155 = shl nuw nsw i32 %17, 11
  br i1 %153, label %156, label %165

156:                                              ; preds = %152
  %157 = sext i32 %19 to i64
  %158 = sext i32 %154 to i64
  %159 = sext i32 %155 to i64
  %160 = add i64 %159, %158
  %161 = add i64 %160, %157
  %162 = add i64 %161, 2
  %163 = getelementptr bfloat, ptr addrspace(1) %13, i64 %162
  %164 = getelementptr inbounds i8, ptr addrspace(1) %163, i64 -4194304
  br label %209

165:                                              ; preds = %152
  %166 = sext i32 %19 to i64
  %167 = sext i32 %154 to i64
  %168 = sext i32 %155 to i64
  %169 = add i64 %168, %167
  %170 = add i64 %169, %166
  %171 = add i64 %170, 2
  %172 = getelementptr bfloat, ptr addrspace(1) %12, i64 %171
  %173 = getelementptr inbounds i8, ptr addrspace(1) %172, i64 -8388608
  br label %209

174:                                              ; preds = %144
  %175 = icmp samesign ult i32 %16, 16384
  br i1 %175, label %176, label %187

176:                                              ; preds = %174
  %177 = and i32 %20, 1536
  %178 = shl nuw nsw i32 %17, 11
  %179 = sext i32 %19 to i64
  %180 = sext i32 %177 to i64
  %181 = sext i32 %178 to i64
  %182 = add i64 %181, %180
  %183 = add i64 %182, %179
  %184 = add i64 %183, 2
  %185 = getelementptr bfloat, ptr addrspace(1) %11, i64 %184
  %186 = getelementptr inbounds i8, ptr addrspace(1) %185, i64 -12582912
  br label %209

187:                                              ; preds = %174
  %188 = icmp samesign ult i32 %16, 20480
  %189 = and i32 %20, 1536
  %190 = shl nuw nsw i32 %17, 11
  br i1 %188, label %191, label %200

191:                                              ; preds = %187
  %192 = sext i32 %19 to i64
  %193 = sext i32 %189 to i64
  %194 = sext i32 %190 to i64
  %195 = add i64 %194, %193
  %196 = add i64 %195, %192
  %197 = add i64 %196, 2
  %198 = getelementptr bfloat, ptr addrspace(1) %10, i64 %197
  %199 = getelementptr inbounds i8, ptr addrspace(1) %198, i64 -16777216
  br label %209

200:                                              ; preds = %187
  %201 = sext i32 %19 to i64
  %202 = sext i32 %189 to i64
  %203 = sext i32 %190 to i64
  %204 = add i64 %203, %202
  %205 = add i64 %204, %201
  %206 = add i64 %205, 2
  %207 = getelementptr bfloat, ptr addrspace(1) %9, i64 %206
  %208 = getelementptr inbounds i8, ptr addrspace(1) %207, i64 -20971520
  br label %209

209:                                              ; preds = %148, %165, %156, %176, %200, %191
  %.in2 = phi ptr addrspace(1) [ %151, %148 ], [ %173, %165 ], [ %164, %156 ], [ %186, %176 ], [ %208, %200 ], [ %199, %191 ]
  %210 = icmp ult i32 %16, 12288
  br i1 %210, label %211, label %239

211:                                              ; preds = %209
  %212 = icmp samesign ult i32 %16, 4096
  br i1 %212, label %213, label %217

213:                                              ; preds = %211
  %214 = zext nneg i32 %21 to i64
  %215 = getelementptr bfloat, ptr addrspace(1) %14, i64 %214
  %216 = getelementptr inbounds i8, ptr addrspace(1) %215, i64 6
  br label %274

217:                                              ; preds = %211
  %218 = icmp samesign ult i32 %16, 8192
  %219 = and i32 %20, 1536
  %220 = shl nuw nsw i32 %17, 11
  br i1 %218, label %221, label %230

221:                                              ; preds = %217
  %222 = sext i32 %19 to i64
  %223 = sext i32 %219 to i64
  %224 = sext i32 %220 to i64
  %225 = add i64 %224, %223
  %226 = add i64 %225, %222
  %227 = add i64 %226, 3
  %228 = getelementptr bfloat, ptr addrspace(1) %13, i64 %227
  %229 = getelementptr inbounds i8, ptr addrspace(1) %228, i64 -4194304
  br label %274

230:                                              ; preds = %217
  %231 = sext i32 %19 to i64
  %232 = sext i32 %219 to i64
  %233 = sext i32 %220 to i64
  %234 = add i64 %233, %232
  %235 = add i64 %234, %231
  %236 = add i64 %235, 3
  %237 = getelementptr bfloat, ptr addrspace(1) %12, i64 %236
  %238 = getelementptr inbounds i8, ptr addrspace(1) %237, i64 -8388608
  br label %274

239:                                              ; preds = %209
  %240 = icmp samesign ult i32 %16, 16384
  br i1 %240, label %241, label %252

241:                                              ; preds = %239
  %242 = and i32 %20, 1536
  %243 = shl nuw nsw i32 %17, 11
  %244 = sext i32 %19 to i64
  %245 = sext i32 %242 to i64
  %246 = sext i32 %243 to i64
  %247 = add i64 %246, %245
  %248 = add i64 %247, %244
  %249 = add i64 %248, 3
  %250 = getelementptr bfloat, ptr addrspace(1) %11, i64 %249
  %251 = getelementptr inbounds i8, ptr addrspace(1) %250, i64 -12582912
  br label %274

252:                                              ; preds = %239
  %253 = icmp samesign ult i32 %16, 20480
  %254 = and i32 %20, 1536
  %255 = shl nuw nsw i32 %17, 11
  br i1 %253, label %256, label %265

256:                                              ; preds = %252
  %257 = sext i32 %19 to i64
  %258 = sext i32 %254 to i64
  %259 = sext i32 %255 to i64
  %260 = add i64 %259, %258
  %261 = add i64 %260, %257
  %262 = add i64 %261, 3
  %263 = getelementptr bfloat, ptr addrspace(1) %10, i64 %262
  %264 = getelementptr inbounds i8, ptr addrspace(1) %263, i64 -16777216
  br label %274

265:                                              ; preds = %252
  %266 = sext i32 %19 to i64
  %267 = sext i32 %254 to i64
  %268 = sext i32 %255 to i64
  %269 = add i64 %268, %267
  %270 = add i64 %269, %266
  %271 = add i64 %270, 3
  %272 = getelementptr bfloat, ptr addrspace(1) %9, i64 %271
  %273 = getelementptr inbounds i8, ptr addrspace(1) %272, i64 -20971520
  br label %274

274:                                              ; preds = %213, %230, %221, %241, %265, %256
  %.in3 = phi ptr addrspace(1) [ %216, %213 ], [ %238, %230 ], [ %229, %221 ], [ %251, %241 ], [ %273, %265 ], [ %264, %256 ]
  %275 = load bfloat, ptr addrspace(1) %.in3, align 2, !invariant.load !5
  %276 = load bfloat, ptr addrspace(1) %.in, align 2, !invariant.load !5
  %277 = insertelement <4 x bfloat> poison, bfloat %276, i64 0
  %278 = load bfloat, ptr addrspace(1) %.in1, align 2, !invariant.load !5
  %279 = insertelement <4 x bfloat> %277, bfloat %278, i64 1
  %280 = load bfloat, ptr addrspace(1) %.in2, align 2, !invariant.load !5
  %281 = insertelement <4 x bfloat> %279, bfloat %280, i64 2
  %282 = insertelement <4 x bfloat> %281, bfloat %275, i64 3
  %283 = zext nneg i32 %21 to i64
  %284 = getelementptr inbounds bfloat, ptr addrspace(1) %8, i64 %283
  store <4 x bfloat> %282, ptr addrspace(1) %284, align 8
  ret void
}

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #3

define ptx_kernel void @gemm_fusion_dot_23_0(ptr noalias align 128 dereferenceable(25165824) %arg0, ptr noalias align 128 dereferenceable(196608) %arg1) local_unnamed_addr #4 {
  %arg158 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg056 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #11
  %.frozen = freeze i32 %1
  %2 = sdiv i32 %.frozen, 8
  %3 = shl nsw i32 %2, 3
  %4 = sub i32 96, %3
  %5 = tail call i32 @llvm.smin.i32(i32 %4, i32 8)
  %6 = srem i32 %1, %5
  %7 = add i32 %3, %6
  %8 = shl i32 %7, 6
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
  %25 = zext nneg i32 %17 to i64
  %26 = zext nneg i32 %18 to i64
  %27 = zext nneg i32 %19 to i64
  %28 = zext nneg i32 %20 to i64
  %29 = zext nneg i32 %21 to i64
  %30 = zext nneg i32 %22 to i64
  %31 = zext nneg i32 %23 to i64
  %32 = zext nneg i32 %24 to i64
  %33 = or disjoint i64 %9, %25
  %34 = or disjoint i64 %9, %26
  %35 = or disjoint i64 %9, %27
  %36 = or disjoint i64 %9, %28
  %37 = or disjoint i64 %9, %29
  %38 = or disjoint i64 %9, %30
  %39 = or disjoint i64 %9, %31
  %40 = or disjoint i64 %9, %32
  %41 = shl nsw i64 %33, 11
  %42 = shl nsw i64 %34, 11
  %43 = shl nsw i64 %35, 11
  %44 = shl nsw i64 %36, 11
  %45 = shl nsw i64 %37, 11
  %46 = shl nsw i64 %38, 11
  %47 = shl nsw i64 %39, 11
  %48 = shl nsw i64 %40, 11
  %49 = and i32 %10, 1
  %50 = icmp eq i32 %49, 0
  %51 = and i32 %10, 2
  %52 = icmp eq i32 %51, 0
  %53 = and i32 %10, 4
  %.not4 = icmp eq i32 %53, 0
  %54 = shl nuw nsw i32 %10, 3
  %55 = and i32 %54, 120
  %56 = zext nneg i32 %55 to i64
  %57 = or disjoint i64 %41, %56
  %58 = or disjoint i64 %42, %56
  %59 = or disjoint i64 %43, %56
  %60 = or disjoint i64 %44, %56
  %61 = or disjoint i64 %45, %56
  %62 = or disjoint i64 %46, %56
  %63 = or disjoint i64 %47, %56
  %64 = or disjoint i64 %48, %56
  %65 = getelementptr bfloat, ptr addrspace(1) %arg056, i64 %57
  %66 = getelementptr bfloat, ptr addrspace(1) %arg056, i64 %58
  %67 = getelementptr bfloat, ptr addrspace(1) %arg056, i64 %59
  %68 = getelementptr bfloat, ptr addrspace(1) %arg056, i64 %60
  %69 = getelementptr bfloat, ptr addrspace(1) %arg056, i64 %61
  %70 = getelementptr bfloat, ptr addrspace(1) %arg056, i64 %62
  %71 = getelementptr bfloat, ptr addrspace(1) %arg056, i64 %63
  %72 = getelementptr bfloat, ptr addrspace(1) %arg056, i64 %64
  %73 = select i1 %.not, i32 0, i32 136
  %74 = select i1 %13, i32 0, i32 272
  %75 = select i1 %15, i32 0, i32 544
  %76 = or disjoint i32 %73, %75
  %77 = xor i32 %76, %55
  %78 = xor i32 %77, %74
  %79 = zext nneg i32 %78 to i64
  %80 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %79
  %81 = or disjoint i32 %55, 1024
  %82 = xor i32 %76, %81
  %83 = xor i32 %82, %74
  %84 = zext nneg i32 %83 to i64
  %85 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %84
  %86 = or disjoint i32 %55, 2048
  %87 = xor i32 %76, %86
  %88 = xor i32 %87, %74
  %89 = zext nneg i32 %88 to i64
  %90 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %89
  %91 = or disjoint i32 %55, 3072
  %92 = xor i32 %76, %91
  %93 = xor i32 %92, %74
  %94 = zext nneg i32 %93 to i64
  %95 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %94
  %96 = or disjoint i32 %55, 4096
  %97 = xor i32 %76, %96
  %98 = xor i32 %97, %74
  %99 = zext nneg i32 %98 to i64
  %100 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %99
  %101 = or disjoint i32 %55, 5120
  %102 = xor i32 %76, %101
  %103 = xor i32 %102, %74
  %104 = zext nneg i32 %103 to i64
  %105 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %104
  %106 = or disjoint i32 %55, 6144
  %107 = xor i32 %76, %106
  %108 = xor i32 %107, %74
  %109 = zext nneg i32 %108 to i64
  %110 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %109
  %111 = or disjoint i32 %55, 7168
  %112 = xor i32 %76, %111
  %113 = xor i32 %112, %74
  %114 = zext nneg i32 %113 to i64
  %115 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %114
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %80, ptr addrspace(1) %65, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %85, ptr addrspace(1) %66, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %90, ptr addrspace(1) %67, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %95, ptr addrspace(1) %68, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %100, ptr addrspace(1) %69, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %105, ptr addrspace(1) %70, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %110, ptr addrspace(1) %71, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %115, ptr addrspace(1) %72, i32 16) #11
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #11
  %116 = getelementptr bfloat, ptr addrspace(1) %arg056, i64 %41
  %117 = getelementptr bfloat, ptr addrspace(1) %116, i64 %56
  %118 = getelementptr i8, ptr addrspace(1) %117, i64 256
  %119 = getelementptr bfloat, ptr addrspace(1) %arg056, i64 %42
  %120 = getelementptr bfloat, ptr addrspace(1) %119, i64 %56
  %121 = getelementptr i8, ptr addrspace(1) %120, i64 256
  %122 = getelementptr bfloat, ptr addrspace(1) %arg056, i64 %43
  %123 = getelementptr bfloat, ptr addrspace(1) %122, i64 %56
  %124 = getelementptr i8, ptr addrspace(1) %123, i64 256
  %125 = getelementptr bfloat, ptr addrspace(1) %arg056, i64 %44
  %126 = getelementptr bfloat, ptr addrspace(1) %125, i64 %56
  %127 = getelementptr i8, ptr addrspace(1) %126, i64 256
  %128 = getelementptr bfloat, ptr addrspace(1) %arg056, i64 %45
  %129 = getelementptr bfloat, ptr addrspace(1) %128, i64 %56
  %130 = getelementptr i8, ptr addrspace(1) %129, i64 256
  %131 = getelementptr bfloat, ptr addrspace(1) %arg056, i64 %46
  %132 = getelementptr bfloat, ptr addrspace(1) %131, i64 %56
  %133 = getelementptr i8, ptr addrspace(1) %132, i64 256
  %134 = getelementptr bfloat, ptr addrspace(1) %arg056, i64 %47
  %135 = getelementptr bfloat, ptr addrspace(1) %134, i64 %56
  %136 = getelementptr i8, ptr addrspace(1) %135, i64 256
  %137 = getelementptr bfloat, ptr addrspace(1) %arg056, i64 %48
  %138 = getelementptr bfloat, ptr addrspace(1) %137, i64 %56
  %139 = getelementptr i8, ptr addrspace(1) %138, i64 256
  tail call void @llvm.nvvm.barrier0()
  %140 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i64 %79
  %141 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i64 %84
  %142 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i64 %89
  %143 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i64 %94
  %144 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i64 %99
  %145 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i64 %104
  %146 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i64 %109
  %147 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i64 %114
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %140, ptr addrspace(1) %118, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %141, ptr addrspace(1) %121, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %142, ptr addrspace(1) %124, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %143, ptr addrspace(1) %127, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %144, ptr addrspace(1) %130, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %145, ptr addrspace(1) %133, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %146, ptr addrspace(1) %136, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %147, ptr addrspace(1) %139, i32 16) #11
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #11
  %148 = getelementptr i8, ptr addrspace(1) %117, i64 512
  %149 = getelementptr i8, ptr addrspace(1) %120, i64 512
  %150 = getelementptr i8, ptr addrspace(1) %123, i64 512
  %151 = getelementptr i8, ptr addrspace(1) %126, i64 512
  %152 = getelementptr i8, ptr addrspace(1) %129, i64 512
  %153 = getelementptr i8, ptr addrspace(1) %132, i64 512
  %154 = getelementptr i8, ptr addrspace(1) %135, i64 512
  %155 = getelementptr i8, ptr addrspace(1) %138, i64 512
  tail call void @llvm.nvvm.barrier0()
  %156 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %79
  %157 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %84
  %158 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %89
  %159 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %94
  %160 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %99
  %161 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %104
  %162 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %109
  %163 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %114
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %156, ptr addrspace(1) %148, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %157, ptr addrspace(1) %149, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %158, ptr addrspace(1) %150, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %159, ptr addrspace(1) %151, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %160, ptr addrspace(1) %152, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %161, ptr addrspace(1) %153, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %162, ptr addrspace(1) %154, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %163, ptr addrspace(1) %155, i32 16) #11
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #11
  tail call void asm sideeffect "cp.async.wait_group 0x2;", ""() #11
  tail call void @llvm.nvvm.barrier0()
  %164 = select i1 %50, i32 0, i32 136
  %165 = select i1 %52, i32 0, i32 272
  %166 = or disjoint i32 %164, %165
  %167 = select i1 %.not4, i32 0, i32 544
  %168 = shl nuw nsw i32 %10, 7
  %169 = and i32 %168, 1024
  %170 = or disjoint i32 %167, %169
  %171 = or disjoint i32 %170, %166
  %172 = lshr exact i32 %11, 1
  %173 = xor i32 %171, %172
  %174 = shl nuw nsw i32 %12, 6
  %175 = or disjoint i32 %173, %174
  %176 = select i1 %15, i32 0, i32 4096
  %177 = or disjoint i32 %175, %176
  %178 = zext nneg i32 %177 to i64
  %179 = or disjoint i32 %164, 16
  %180 = xor i32 %179, %165
  %181 = or disjoint i32 %169, %180
  %182 = or disjoint i32 %181, %167
  %183 = or disjoint i32 %174, %172
  %184 = or disjoint i32 %183, %176
  %185 = xor i32 %184, %182
  %186 = zext nneg i32 %185 to i64
  %187 = or disjoint i32 %166, 32
  %188 = xor i32 %187, %167
  %189 = or disjoint i32 %188, %169
  %190 = xor i32 %184, %189
  %191 = zext nneg i32 %190 to i64
  %192 = or disjoint i32 %164, 48
  %193 = or disjoint i32 %167, %165
  %194 = xor i32 %193, %192
  %195 = or disjoint i32 %194, %169
  %196 = xor i32 %184, %195
  %197 = zext nneg i32 %196 to i64
  %198 = or disjoint i32 %171, 64
  %199 = xor i32 %184, %198
  %200 = zext nneg i32 %199 to i64
  %201 = or disjoint i32 %164, 80
  %202 = xor i32 %201, %165
  %203 = or disjoint i32 %169, %202
  %204 = or disjoint i32 %203, %167
  %205 = xor i32 %184, %204
  %206 = zext nneg i32 %205 to i64
  %207 = or disjoint i32 %166, 96
  %208 = xor i32 %207, %167
  %209 = or disjoint i32 %208, %169
  %210 = xor i32 %184, %209
  %211 = zext nneg i32 %210 to i64
  %212 = or disjoint i32 %164, 112
  %213 = xor i32 %193, %212
  %214 = or disjoint i32 %213, %169
  %215 = xor i32 %184, %214
  %216 = zext nneg i32 %215 to i64
  %217 = trunc i32 %10 to i4
  %218 = zext i4 %217 to i64
  %219 = shl nuw nsw i64 %218, 4
  %220 = add i32 %16, %14
  %221 = add i32 %220, 56
  %222 = zext nneg i32 %221 to i64
  %223 = add i64 %9, %222
  %224 = shl nsw i64 %223, 12
  %225 = add nuw nsw i64 %224, 768
  %scevgep = getelementptr i8, ptr addrspace(1) %arg056, i64 %225
  %226 = add i32 %220, 48
  %227 = zext nneg i32 %226 to i64
  %228 = add i64 %9, %227
  %229 = shl nsw i64 %228, 12
  %230 = add nuw nsw i64 %229, 768
  %scevgep62 = getelementptr i8, ptr addrspace(1) %arg056, i64 %230
  %231 = add i32 %220, 40
  %232 = zext nneg i32 %231 to i64
  %233 = add i64 %9, %232
  %234 = shl nsw i64 %233, 12
  %235 = add nuw nsw i64 %234, 768
  %scevgep66 = getelementptr i8, ptr addrspace(1) %arg056, i64 %235
  %236 = add i32 %220, 32
  %237 = zext nneg i32 %236 to i64
  %238 = add i64 %9, %237
  %239 = shl nsw i64 %238, 12
  %240 = add nuw nsw i64 %239, 768
  %scevgep70 = getelementptr i8, ptr addrspace(1) %arg056, i64 %240
  %241 = add i32 %220, 24
  %242 = zext nneg i32 %241 to i64
  %243 = add i64 %9, %242
  %244 = shl nsw i64 %243, 12
  %245 = add nuw nsw i64 %244, 768
  %scevgep74 = getelementptr i8, ptr addrspace(1) %arg056, i64 %245
  %246 = add i32 %220, 16
  %247 = zext nneg i32 %246 to i64
  %248 = add i64 %9, %247
  %249 = shl nsw i64 %248, 12
  %250 = add nuw nsw i64 %249, 768
  %scevgep78 = getelementptr i8, ptr addrspace(1) %arg056, i64 %250
  %251 = add i32 %220, 8
  %252 = zext nneg i32 %251 to i64
  %253 = add i64 %9, %252
  %254 = shl nsw i64 %253, 12
  %255 = add nuw nsw i64 %254, 768
  %scevgep82 = getelementptr i8, ptr addrspace(1) %arg056, i64 %255
  %256 = zext nneg i32 %220 to i64
  %257 = add i64 %9, %256
  %258 = shl nsw i64 %257, 12
  %259 = add nuw nsw i64 %258, 768
  %scevgep86 = getelementptr i8, ptr addrspace(1) %arg056, i64 %259
  br label %260

260:                                              ; preds = %0, %260
  %lsr.iv90 = phi i32 [ -128, %0 ], [ %265, %260 ]
  %lsr.iv87 = phi ptr addrspace(1) [ %scevgep86, %0 ], [ %scevgep88, %260 ]
  %lsr.iv83 = phi ptr addrspace(1) [ %scevgep82, %0 ], [ %scevgep84, %260 ]
  %lsr.iv79 = phi ptr addrspace(1) [ %scevgep78, %0 ], [ %scevgep80, %260 ]
  %lsr.iv75 = phi ptr addrspace(1) [ %scevgep74, %0 ], [ %scevgep76, %260 ]
  %lsr.iv71 = phi ptr addrspace(1) [ %scevgep70, %0 ], [ %scevgep72, %260 ]
  %lsr.iv67 = phi ptr addrspace(1) [ %scevgep66, %0 ], [ %scevgep68, %260 ]
  %lsr.iv63 = phi ptr addrspace(1) [ %scevgep62, %0 ], [ %scevgep64, %260 ]
  %lsr.iv = phi ptr addrspace(1) [ %scevgep, %0 ], [ %scevgep60, %260 ]
  %261 = phi ptr addrspace(3) [ @global_smem, %0 ], [ %447, %260 ]
  %262 = phi i32 [ 0, %0 ], [ %444, %260 ]
  %263 = phi i32 [ 2, %0 ], [ %429, %260 ]
  %264 = phi { float, float, float, float, float, float, float, float } [ zeroinitializer, %0 ], [ %426, %260 ]
  %265 = add i32 %lsr.iv90, 128
  %266 = icmp samesign ult i32 %265, 1664
  %267 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %261, i64 %178
  %268 = ptrtoint ptr addrspace(3) %267 to i64
  %269 = trunc i64 %268 to i32
  %270 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %269) #11
  %271 = extractvalue { i32, i32, i32, i32 } %270, 0
  %272 = extractvalue { i32, i32, i32, i32 } %270, 1
  %273 = extractvalue { i32, i32, i32, i32 } %270, 2
  %274 = extractvalue { i32, i32, i32, i32 } %270, 3
  %275 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %261, i64 %186
  %276 = ptrtoint ptr addrspace(3) %275 to i64
  %277 = trunc i64 %276 to i32
  %278 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %277) #11
  %279 = extractvalue { i32, i32, i32, i32 } %278, 0
  %280 = extractvalue { i32, i32, i32, i32 } %278, 1
  %281 = extractvalue { i32, i32, i32, i32 } %278, 2
  %282 = extractvalue { i32, i32, i32, i32 } %278, 3
  %283 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %261, i64 %191
  %284 = ptrtoint ptr addrspace(3) %283 to i64
  %285 = trunc i64 %284 to i32
  %286 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %285) #11
  %287 = extractvalue { i32, i32, i32, i32 } %286, 0
  %288 = extractvalue { i32, i32, i32, i32 } %286, 1
  %289 = extractvalue { i32, i32, i32, i32 } %286, 2
  %290 = extractvalue { i32, i32, i32, i32 } %286, 3
  %291 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %261, i64 %197
  %292 = ptrtoint ptr addrspace(3) %291 to i64
  %293 = trunc i64 %292 to i32
  %294 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %293) #11
  %295 = extractvalue { i32, i32, i32, i32 } %294, 0
  %296 = extractvalue { i32, i32, i32, i32 } %294, 1
  %297 = extractvalue { i32, i32, i32, i32 } %294, 2
  %298 = extractvalue { i32, i32, i32, i32 } %294, 3
  %299 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %261, i64 %200
  %300 = ptrtoint ptr addrspace(3) %299 to i64
  %301 = trunc i64 %300 to i32
  %302 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %301) #11
  %303 = extractvalue { i32, i32, i32, i32 } %302, 0
  %304 = extractvalue { i32, i32, i32, i32 } %302, 1
  %305 = extractvalue { i32, i32, i32, i32 } %302, 2
  %306 = extractvalue { i32, i32, i32, i32 } %302, 3
  %307 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %261, i64 %206
  %308 = ptrtoint ptr addrspace(3) %307 to i64
  %309 = trunc i64 %308 to i32
  %310 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %309) #11
  %311 = extractvalue { i32, i32, i32, i32 } %310, 0
  %312 = extractvalue { i32, i32, i32, i32 } %310, 1
  %313 = extractvalue { i32, i32, i32, i32 } %310, 2
  %314 = extractvalue { i32, i32, i32, i32 } %310, 3
  %315 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %261, i64 %211
  %316 = ptrtoint ptr addrspace(3) %315 to i64
  %317 = trunc i64 %316 to i32
  %318 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %317) #11
  %319 = extractvalue { i32, i32, i32, i32 } %318, 0
  %320 = extractvalue { i32, i32, i32, i32 } %318, 1
  %321 = extractvalue { i32, i32, i32, i32 } %318, 2
  %322 = extractvalue { i32, i32, i32, i32 } %318, 3
  %323 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %261, i64 %216
  %324 = ptrtoint ptr addrspace(3) %323 to i64
  %325 = trunc i64 %324 to i32
  %326 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %325) #11
  %327 = extractvalue { i32, i32, i32, i32 } %326, 0
  %328 = extractvalue { i32, i32, i32, i32 } %326, 1
  %329 = extractvalue { i32, i32, i32, i32 } %326, 2
  %330 = extractvalue { i32, i32, i32, i32 } %326, 3
  %331 = extractvalue { float, float, float, float, float, float, float, float } %264, 0
  %332 = extractvalue { float, float, float, float, float, float, float, float } %264, 1
  %333 = extractvalue { float, float, float, float, float, float, float, float } %264, 2
  %334 = extractvalue { float, float, float, float, float, float, float, float } %264, 3
  %335 = extractvalue { float, float, float, float, float, float, float, float } %264, 4
  %336 = extractvalue { float, float, float, float, float, float, float, float } %264, 5
  %337 = extractvalue { float, float, float, float, float, float, float, float } %264, 6
  %338 = extractvalue { float, float, float, float, float, float, float, float } %264, 7
  %339 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %331, float %332, float %333, float %334, i32 %271, i32 %272, i32 %273, i32 %274, i32 0, i32 0) #11
  %340 = extractvalue { float, float, float, float } %339, 0
  %341 = extractvalue { float, float, float, float } %339, 1
  %342 = extractvalue { float, float, float, float } %339, 2
  %343 = extractvalue { float, float, float, float } %339, 3
  %344 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %335, float %336, float %337, float %338, i32 %271, i32 %272, i32 %273, i32 %274, i32 0, i32 0) #11
  %345 = extractvalue { float, float, float, float } %344, 0
  %346 = extractvalue { float, float, float, float } %344, 1
  %347 = extractvalue { float, float, float, float } %344, 2
  %348 = extractvalue { float, float, float, float } %344, 3
  %349 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %340, float %341, float %342, float %343, i32 %279, i32 %280, i32 %281, i32 %282, i32 0, i32 0) #11
  %350 = extractvalue { float, float, float, float } %349, 0
  %351 = extractvalue { float, float, float, float } %349, 1
  %352 = extractvalue { float, float, float, float } %349, 2
  %353 = extractvalue { float, float, float, float } %349, 3
  %354 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %345, float %346, float %347, float %348, i32 %279, i32 %280, i32 %281, i32 %282, i32 0, i32 0) #11
  %355 = extractvalue { float, float, float, float } %354, 0
  %356 = extractvalue { float, float, float, float } %354, 1
  %357 = extractvalue { float, float, float, float } %354, 2
  %358 = extractvalue { float, float, float, float } %354, 3
  %359 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %350, float %351, float %352, float %353, i32 %287, i32 %288, i32 %289, i32 %290, i32 0, i32 0) #11
  %360 = extractvalue { float, float, float, float } %359, 0
  %361 = extractvalue { float, float, float, float } %359, 1
  %362 = extractvalue { float, float, float, float } %359, 2
  %363 = extractvalue { float, float, float, float } %359, 3
  %364 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %355, float %356, float %357, float %358, i32 %287, i32 %288, i32 %289, i32 %290, i32 0, i32 0) #11
  %365 = extractvalue { float, float, float, float } %364, 0
  %366 = extractvalue { float, float, float, float } %364, 1
  %367 = extractvalue { float, float, float, float } %364, 2
  %368 = extractvalue { float, float, float, float } %364, 3
  %369 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %360, float %361, float %362, float %363, i32 %295, i32 %296, i32 %297, i32 %298, i32 0, i32 0) #11
  %370 = extractvalue { float, float, float, float } %369, 0
  %371 = extractvalue { float, float, float, float } %369, 1
  %372 = extractvalue { float, float, float, float } %369, 2
  %373 = extractvalue { float, float, float, float } %369, 3
  %374 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %365, float %366, float %367, float %368, i32 %295, i32 %296, i32 %297, i32 %298, i32 0, i32 0) #11
  %375 = extractvalue { float, float, float, float } %374, 0
  %376 = extractvalue { float, float, float, float } %374, 1
  %377 = extractvalue { float, float, float, float } %374, 2
  %378 = extractvalue { float, float, float, float } %374, 3
  %379 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %370, float %371, float %372, float %373, i32 %303, i32 %304, i32 %305, i32 %306, i32 0, i32 0) #11
  %380 = extractvalue { float, float, float, float } %379, 0
  %381 = extractvalue { float, float, float, float } %379, 1
  %382 = extractvalue { float, float, float, float } %379, 2
  %383 = extractvalue { float, float, float, float } %379, 3
  %384 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %375, float %376, float %377, float %378, i32 %303, i32 %304, i32 %305, i32 %306, i32 0, i32 0) #11
  %385 = extractvalue { float, float, float, float } %384, 0
  %386 = extractvalue { float, float, float, float } %384, 1
  %387 = extractvalue { float, float, float, float } %384, 2
  %388 = extractvalue { float, float, float, float } %384, 3
  %389 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %380, float %381, float %382, float %383, i32 %311, i32 %312, i32 %313, i32 %314, i32 0, i32 0) #11
  %390 = extractvalue { float, float, float, float } %389, 0
  %391 = extractvalue { float, float, float, float } %389, 1
  %392 = extractvalue { float, float, float, float } %389, 2
  %393 = extractvalue { float, float, float, float } %389, 3
  %394 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %385, float %386, float %387, float %388, i32 %311, i32 %312, i32 %313, i32 %314, i32 0, i32 0) #11
  %395 = extractvalue { float, float, float, float } %394, 0
  %396 = extractvalue { float, float, float, float } %394, 1
  %397 = extractvalue { float, float, float, float } %394, 2
  %398 = extractvalue { float, float, float, float } %394, 3
  %399 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %390, float %391, float %392, float %393, i32 %319, i32 %320, i32 %321, i32 %322, i32 0, i32 0) #11
  %400 = extractvalue { float, float, float, float } %399, 0
  %401 = extractvalue { float, float, float, float } %399, 1
  %402 = extractvalue { float, float, float, float } %399, 2
  %403 = extractvalue { float, float, float, float } %399, 3
  %404 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %395, float %396, float %397, float %398, i32 %319, i32 %320, i32 %321, i32 %322, i32 0, i32 0) #11
  %405 = extractvalue { float, float, float, float } %404, 0
  %406 = extractvalue { float, float, float, float } %404, 1
  %407 = extractvalue { float, float, float, float } %404, 2
  %408 = extractvalue { float, float, float, float } %404, 3
  %409 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %400, float %401, float %402, float %403, i32 %327, i32 %328, i32 %329, i32 %330, i32 0, i32 0) #11
  %410 = extractvalue { float, float, float, float } %409, 0
  %411 = extractvalue { float, float, float, float } %409, 1
  %412 = extractvalue { float, float, float, float } %409, 2
  %413 = extractvalue { float, float, float, float } %409, 3
  %414 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %405, float %406, float %407, float %408, i32 %327, i32 %328, i32 %329, i32 %330, i32 0, i32 0) #11
  %415 = extractvalue { float, float, float, float } %414, 0
  %416 = extractvalue { float, float, float, float } %414, 1
  %417 = extractvalue { float, float, float, float } %414, 2
  %418 = extractvalue { float, float, float, float } %414, 3
  %419 = insertvalue { float, float, float, float, float, float, float, float } undef, float %410, 0
  %420 = insertvalue { float, float, float, float, float, float, float, float } %419, float %411, 1
  %421 = insertvalue { float, float, float, float, float, float, float, float } %420, float %412, 2
  %422 = insertvalue { float, float, float, float, float, float, float, float } %421, float %413, 3
  %423 = insertvalue { float, float, float, float, float, float, float, float } %422, float %415, 4
  %424 = insertvalue { float, float, float, float, float, float, float, float } %423, float %416, 5
  %425 = insertvalue { float, float, float, float, float, float, float, float } %424, float %417, 6
  %426 = insertvalue { float, float, float, float, float, float, float, float } %425, float %418, 7
  %427 = add i32 %263, 1
  %428 = icmp slt i32 %427, 3
  %429 = select i1 %428, i32 %427, i32 0
  %scevgep89 = getelementptr i8, ptr addrspace(1) %lsr.iv87, i64 %219
  %scevgep85 = getelementptr i8, ptr addrspace(1) %lsr.iv83, i64 %219
  %scevgep81 = getelementptr i8, ptr addrspace(1) %lsr.iv79, i64 %219
  %scevgep77 = getelementptr i8, ptr addrspace(1) %lsr.iv75, i64 %219
  %scevgep73 = getelementptr i8, ptr addrspace(1) %lsr.iv71, i64 %219
  %scevgep69 = getelementptr i8, ptr addrspace(1) %lsr.iv67, i64 %219
  %scevgep65 = getelementptr i8, ptr addrspace(1) %lsr.iv63, i64 %219
  %scevgep61 = getelementptr i8, ptr addrspace(1) %lsr.iv, i64 %219
  %430 = shl i32 %429, 13
  %431 = sext i32 %430 to i64
  %432 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %431
  tail call void @llvm.nvvm.barrier0()
  %433 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %432, i64 %79
  %434 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %432, i64 %84
  %435 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %432, i64 %89
  %436 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %432, i64 %94
  %437 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %432, i64 %99
  %438 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %432, i64 %104
  %439 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %432, i64 %109
  %440 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %432, i64 %114
  %441 = select i1 %266, i32 16, i32 0
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %433, ptr addrspace(1) %scevgep89, i32 %441) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %434, ptr addrspace(1) %scevgep85, i32 %441) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %435, ptr addrspace(1) %scevgep81, i32 %441) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %436, ptr addrspace(1) %scevgep77, i32 %441) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %437, ptr addrspace(1) %scevgep73, i32 %441) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %438, ptr addrspace(1) %scevgep69, i32 %441) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %439, ptr addrspace(1) %scevgep65, i32 %441) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %440, ptr addrspace(1) %scevgep61, i32 %441) #11
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #11
  %442 = add i32 %262, 1
  %443 = icmp slt i32 %442, 3
  %444 = select i1 %443, i32 %442, i32 0
  tail call void asm sideeffect "cp.async.wait_group 0x2;", ""() #11
  tail call void @llvm.nvvm.barrier0()
  %445 = shl i32 %444, 13
  %446 = sext i32 %445 to i64
  %447 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %446
  %scevgep60 = getelementptr i8, ptr addrspace(1) %lsr.iv, i64 256
  %scevgep64 = getelementptr i8, ptr addrspace(1) %lsr.iv63, i64 256
  %scevgep68 = getelementptr i8, ptr addrspace(1) %lsr.iv67, i64 256
  %scevgep72 = getelementptr i8, ptr addrspace(1) %lsr.iv71, i64 256
  %scevgep76 = getelementptr i8, ptr addrspace(1) %lsr.iv75, i64 256
  %scevgep80 = getelementptr i8, ptr addrspace(1) %lsr.iv79, i64 256
  %scevgep84 = getelementptr i8, ptr addrspace(1) %lsr.iv83, i64 256
  %scevgep88 = getelementptr i8, ptr addrspace(1) %lsr.iv87, i64 256
  %448 = icmp samesign ult i32 %265, 1920
  br i1 %448, label %260, label %449

449:                                              ; preds = %260
  %450 = icmp ult i32 %10, 64
  %451 = and i32 %54, 56
  %452 = mul i32 %2, 8
  %.decomposed = sub i32 %.frozen, %452
  %453 = sdiv i32 %.decomposed, %5
  tail call void asm sideeffect "cp.async.wait_group 0x0;", ""() #11
  tail call void @llvm.nvvm.barrier0()
  %454 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %410) #11
  %455 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %411) #11
  %456 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %412) #11
  %457 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %413) #11
  %458 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %415) #11
  %459 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %416) #11
  %460 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %417) #11
  %461 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %418) #11
  %462 = shl nsw i32 %453, 4
  %463 = sext i32 %462 to i64
  %464 = zext nneg i32 %451 to i64
  %465 = or disjoint i64 %9, %464
  %466 = lshr i32 %10, 3
  %467 = and i32 %466, 7
  %468 = select i1 %450, i32 0, i32 8
  %469 = or disjoint i32 %467, %468
  %470 = zext nneg i32 %469 to i64
  %471 = or disjoint i64 %463, %470
  %472 = getelementptr bfloat, ptr addrspace(1) %arg158, i64 %465
  %.idx = mul nsw i64 %471, 12288
  %473 = getelementptr i8, ptr addrspace(1) %472, i64 %.idx
  %474 = and i32 %168, 384
  %475 = lshr i32 %10, 2
  %476 = and i32 %475, 7
  %477 = lshr exact i32 %12, 1
  %478 = select i1 %450, i32 0, i32 32
  %479 = or disjoint i32 %477, %478
  %480 = or disjoint i32 %479, %476
  %481 = or disjoint i32 %480, %474
  %482 = and i32 %54, 504
  %483 = select i1 %450, i32 0, i32 512
  %484 = or disjoint i32 %482, %483
  %485 = lshr exact i32 %474, 3
  %486 = add nuw nsw i32 %481, %485
  %487 = zext nneg i32 %486 to i64
  %488 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %487
  %489 = bitcast bfloat %454 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %488, <1 x i16> %489, i1 true) #11
  %490 = or disjoint i32 %481, 64
  %491 = lshr i32 %490, 3
  %492 = and i32 %491, 268435448
  %493 = zext nneg i32 %492 to i64
  %494 = zext nneg i32 %481 to i64
  %495 = add i64 %493, %494
  %496 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %495
  %497 = getelementptr inbounds i8, ptr addrspace(3) %496, i64 128
  %498 = bitcast bfloat %455 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %497, <1 x i16> %498, i1 true) #11
  %499 = zext nneg i32 %485 to i64
  %500 = add i64 %499, %494
  %501 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %500
  %502 = getelementptr inbounds i8, ptr addrspace(3) %501, i64 16
  %503 = bitcast bfloat %456 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %502, <1 x i16> %503, i1 true) #11
  %504 = or disjoint i32 %481, 72
  %505 = lshr i32 %504, 3
  %506 = and i32 %505, 268435448
  %507 = zext nneg i32 %506 to i64
  %508 = add i64 %507, %494
  %509 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %508
  %510 = getelementptr inbounds i8, ptr addrspace(3) %509, i64 144
  %511 = bitcast bfloat %457 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %510, <1 x i16> %511, i1 true) #11
  %512 = or disjoint i32 %481, 512
  %513 = lshr i32 %512, 3
  %514 = and i32 %513, 268435448
  %515 = zext nneg i32 %514 to i64
  %516 = add i64 %515, %494
  %517 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %516
  %518 = getelementptr inbounds i8, ptr addrspace(3) %517, i64 1024
  %519 = bitcast bfloat %458 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %518, <1 x i16> %519, i1 true) #11
  %520 = or disjoint i32 %481, 576
  %521 = lshr i32 %520, 3
  %522 = and i32 %521, 268435448
  %523 = zext nneg i32 %522 to i64
  %524 = add i64 %523, %494
  %525 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %524
  %526 = getelementptr inbounds i8, ptr addrspace(3) %525, i64 1152
  %527 = bitcast bfloat %459 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %526, <1 x i16> %527, i1 true) #11
  %528 = or disjoint i32 %481, 520
  %529 = lshr i32 %528, 3
  %530 = and i32 %529, 268435448
  %531 = zext nneg i32 %530 to i64
  %532 = add i64 %531, %494
  %533 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %532
  %534 = getelementptr inbounds i8, ptr addrspace(3) %533, i64 1040
  %535 = bitcast bfloat %460 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %534, <1 x i16> %535, i1 true) #11
  %536 = or disjoint i32 %481, 584
  %537 = lshr i32 %536, 3
  %538 = and i32 %537, 268435448
  %539 = zext nneg i32 %538 to i64
  %540 = add i64 %539, %494
  %541 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %540
  %542 = getelementptr inbounds i8, ptr addrspace(3) %541, i64 1168
  %543 = bitcast bfloat %461 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %542, <1 x i16> %543, i1 true) #11
  tail call void @llvm.nvvm.barrier0()
  %544 = lshr exact i32 %484, 3
  %545 = and i32 %544, 120
  %546 = add nuw nsw i32 %545, %484
  %547 = zext nneg i32 %546 to i64
  %548 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %547
  %549 = load <4 x i32>, ptr addrspace(3) %548, align 16
  %.extract91 = extractelement <4 x i32> %549, i32 0
  %.extract1692 = extractelement <4 x i32> %549, i32 1
  %.extract1893 = extractelement <4 x i32> %549, i32 2
  %.extract2094 = extractelement <4 x i32> %549, i32 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract91, i32 %.extract1692, i32 %.extract1893, i32 %.extract2094, ptr addrspace(1) %473) #11
  ret void
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #5

define ptx_kernel void @fusion_90(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(32768) %arg1, ptr noalias align 128 dereferenceable(196608) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4) local_unnamed_addr #6 {
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
  %6 = mul i64 %3, 6144
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
  %53 = getelementptr i8, ptr addrspace(1) %52, i64 10240
  %54 = shl nuw nsw i32 %9, 3
  %55 = and i32 %54, 248
  %56 = select i1 %14, i32 0, i32 256
  %57 = or disjoint i32 %55, %56
  %58 = zext nneg i32 %57 to i64
  %59 = getelementptr bfloat, ptr addrspace(1) %52, i64 %58
  %60 = getelementptr i8, ptr addrspace(1) %59, i64 10240
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
define ptx_kernel void @loop_convert_fusion_5(ptr noalias readonly align 128 captures(none) dereferenceable(196608) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(98304) %1) local_unnamed_addr #0 {
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

define ptx_kernel void @fusion_88(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(196608) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5) local_unnamed_addr #6 {
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
  %6 = mul i64 %3, 6144
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
  %19 = getelementptr i8, ptr addrspace(1) %18, i64 8192
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
  %48 = getelementptr i8, ptr addrspace(1) %18, i64 10240
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
  %90 = getelementptr i8, ptr addrspace(1) %89, i64 8192
  %91 = shl nuw nsw i32 %9, 3
  %92 = and i32 %91, 248
  %93 = select i1 %14, i32 0, i32 256
  %94 = or disjoint i32 %92, %93
  %95 = zext nneg i32 %94 to i64
  %96 = getelementptr bfloat, ptr addrspace(1) %89, i64 %95
  %97 = getelementptr i8, ptr addrspace(1) %96, i64 8192
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
  %204 = getelementptr i8, ptr addrspace(1) %89, i64 10240
  %205 = getelementptr i8, ptr addrspace(1) %96, i64 10240
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

define ptx_kernel void @fusion_86(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(196608) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6) local_unnamed_addr #6 {
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #11
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 12288
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
  %176 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %68
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
  %283 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %68
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

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_add_fusion(ptr noalias readonly align 128 captures(none) dereferenceable(196608) %0, ptr noalias readonly align 128 captures(none) dereferenceable(32768) %1, ptr noalias readonly align 128 captures(none) dereferenceable(32768) %2, ptr noalias readonly align 128 captures(none) dereferenceable(32768) %3, ptr noalias readonly align 128 captures(none) dereferenceable(32768) %4, ptr noalias writeonly align 128 captures(none) dereferenceable(65536) %5) local_unnamed_addr #0 {
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
  %21 = getelementptr inbounds bfloat, ptr addrspace(1) %9, i64 %20
  %22 = load bfloat, ptr addrspace(1) %21, align 2, !invariant.load !5
  %23 = getelementptr inbounds bfloat, ptr addrspace(1) %8, i64 %20
  %24 = load bfloat, ptr addrspace(1) %23, align 2, !invariant.load !5
  %25 = mul nuw nsw i32 %15, 6144
  %26 = zext nneg i32 %18 to i64
  %27 = zext nneg i32 %25 to i64
  %28 = add i64 %27, %26
  %29 = getelementptr bfloat, ptr addrspace(1) %12, i64 %28
  %30 = getelementptr inbounds i8, ptr addrspace(1) %29, i64 10240
  %31 = load bfloat, ptr addrspace(1) %30, align 2, !invariant.load !5, !alias.scope !14
  %32 = fpext bfloat %31 to float
  %33 = fpext bfloat %22 to float
  %34 = fpext bfloat %24 to float
  %35 = fadd float %33, %32
  %36 = getelementptr inbounds bfloat, ptr addrspace(1) %10, i64 %20
  %37 = load bfloat, ptr addrspace(1) %36, align 2, !invariant.load !5
  %38 = getelementptr inbounds i8, ptr addrspace(1) %29, i64 8192
  %39 = load bfloat, ptr addrspace(1) %38, align 2, !invariant.load !5, !alias.scope !17
  %40 = fpext bfloat %39 to float
  %41 = fadd float %35, %34
  %42 = fpext bfloat %37 to float
  %43 = fadd float %41, %40
  %44 = getelementptr inbounds bfloat, ptr addrspace(1) %11, i64 %20
  %45 = load bfloat, ptr addrspace(1) %44, align 2, !invariant.load !5
  %46 = getelementptr inbounds i8, ptr addrspace(1) %29, i64 6144
  %47 = load bfloat, ptr addrspace(1) %46, align 2, !invariant.load !5, !alias.scope !20
  %48 = fpext bfloat %47 to float
  %49 = fadd float %43, %42
  %50 = fpext bfloat %45 to float
  %51 = fadd float %49, %48
  %52 = getelementptr inbounds i8, ptr addrspace(1) %29, i64 4096
  %53 = load bfloat, ptr addrspace(1) %52, align 2, !invariant.load !5, !alias.scope !23
  %54 = fpext bfloat %53 to float
  %55 = fadd float %51, %50
  %56 = fadd float %55, %54
  %57 = getelementptr inbounds float, ptr addrspace(1) %7, i64 %20
  store float %56, ptr addrspace(1) %57, align 4
  ret void
}

define ptx_kernel void @fusion_84(ptr noalias align 128 dereferenceable(65536) %arg0, ptr noalias align 16 dereferenceable(4) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3) local_unnamed_addr #6 {
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

define ptx_kernel void @fusion_82(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(196608) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5) local_unnamed_addr #6 {
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #11
  %2 = sext i32 %1 to i64
  %3 = mul nsw i64 %2, 6144
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

define ptx_kernel void @fusion_80(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(196608) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6) local_unnamed_addr #6 {
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #11
  %2 = sext i32 %1 to i64
  %3 = mul nsw i64 %2, 6144
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
  %67 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %66
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
  %174 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %66
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
  %227 = getelementptr float, ptr addrspace(1) %arg25, i64 %66
  %228 = getelementptr float, ptr addrspace(1) %227, i64 %13
  %229 = getelementptr i8, ptr addrspace(1) %228, i64 16
  %230 = getelementptr i8, ptr addrspace(1) %228, i64 2048
  %231 = getelementptr i8, ptr addrspace(1) %228, i64 2064
  %232 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %228) #11
  %233 = extractvalue { i32, i32, i32, i32 } %232, 0
  %234 = extractvalue { i32, i32, i32, i32 } %232, 1
  %235 = extractvalue { i32, i32, i32, i32 } %232, 2
  %236 = extractvalue { i32, i32, i32, i32 } %232, 3
  %237 = bitcast i32 %233 to float
  %238 = bitcast i32 %234 to float
  %239 = bitcast i32 %235 to float
  %240 = bitcast i32 %236 to float
  %241 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %229) #11
  %242 = extractvalue { i32, i32, i32, i32 } %241, 0
  %243 = extractvalue { i32, i32, i32, i32 } %241, 1
  %244 = extractvalue { i32, i32, i32, i32 } %241, 2
  %245 = extractvalue { i32, i32, i32, i32 } %241, 3
  %246 = bitcast i32 %242 to float
  %247 = bitcast i32 %243 to float
  %248 = bitcast i32 %244 to float
  %249 = bitcast i32 %245 to float
  %250 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %230) #11
  %251 = extractvalue { i32, i32, i32, i32 } %250, 0
  %252 = extractvalue { i32, i32, i32, i32 } %250, 1
  %253 = extractvalue { i32, i32, i32, i32 } %250, 2
  %254 = extractvalue { i32, i32, i32, i32 } %250, 3
  %255 = bitcast i32 %251 to float
  %256 = bitcast i32 %252 to float
  %257 = bitcast i32 %253 to float
  %258 = bitcast i32 %254 to float
  %259 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %231) #11
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %385, <1 x i32> %386, i1 %383) #11
  tail call void @llvm.nvvm.barrier0()
  %387 = icmp samesign ult i32 %5, 2
  %388 = zext nneg i32 %5 to i64
  %389 = getelementptr float, ptr addrspace(3) @global_smem, i64 %388
  %390 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %389, i1 %387) #11
  %391 = bitcast i32 %390 to float
  %392 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %390, i32 1, i32 31)
  %393 = bitcast i32 %392 to float
  %394 = fadd float %391, %393
  %395 = icmp eq i32 %5, 0
  %396 = bitcast float %394 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %389, <1 x i32> %396, i1 %395) #11
  tail call void @llvm.nvvm.barrier0()
  %397 = load float, ptr addrspace(3) @global_smem, align 16
  %398 = fmul float %397, 0x3F50000000000000
  %399 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #11
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
  %421 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %419) #11
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
  %438 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %420) #11
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
  %455 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %430) #11
  %456 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %431) #11
  %457 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %432) #11
  %458 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %433) #11
  %459 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %434) #11
  %460 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %435) #11
  %461 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %436) #11
  %462 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %437) #11
  %463 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %447) #11
  %464 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %448) #11
  %465 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %449) #11
  %466 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %450) #11
  %467 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %451) #11
  %468 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %452) #11
  %469 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %453) #11
  %470 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %454) #11
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
  %502 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %486) #11
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %508, i32 %511, i32 %514, i32 %517, ptr addrspace(1) %504) #11
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %520, i32 %523, i32 %526, i32 %529, ptr addrspace(1) %505) #11
  ret void
}

define ptx_kernel void @fusion_78(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(32768) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(65536) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(196608) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6, ptr noalias align 128 dereferenceable(32768) %arg7) local_unnamed_addr #6 {
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
  %66 = mul nsw i64 %2, 6144
  %67 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %66
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
  %120 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %3
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
  %227 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %3
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
  %280 = getelementptr float, ptr addrspace(1) %arg37, i64 %3
  %281 = getelementptr float, ptr addrspace(1) %280, i64 %13
  %282 = getelementptr i8, ptr addrspace(1) %281, i64 16
  %283 = getelementptr i8, ptr addrspace(1) %281, i64 2048
  %284 = getelementptr i8, ptr addrspace(1) %281, i64 2064
  %285 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %281) #11
  %286 = extractvalue { i32, i32, i32, i32 } %285, 0
  %287 = extractvalue { i32, i32, i32, i32 } %285, 1
  %288 = extractvalue { i32, i32, i32, i32 } %285, 2
  %289 = extractvalue { i32, i32, i32, i32 } %285, 3
  %290 = bitcast i32 %286 to float
  %291 = bitcast i32 %287 to float
  %292 = bitcast i32 %288 to float
  %293 = bitcast i32 %289 to float
  %294 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %282) #11
  %295 = extractvalue { i32, i32, i32, i32 } %294, 0
  %296 = extractvalue { i32, i32, i32, i32 } %294, 1
  %297 = extractvalue { i32, i32, i32, i32 } %294, 2
  %298 = extractvalue { i32, i32, i32, i32 } %294, 3
  %299 = bitcast i32 %295 to float
  %300 = bitcast i32 %296 to float
  %301 = bitcast i32 %297 to float
  %302 = bitcast i32 %298 to float
  %303 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %283) #11
  %304 = extractvalue { i32, i32, i32, i32 } %303, 0
  %305 = extractvalue { i32, i32, i32, i32 } %303, 1
  %306 = extractvalue { i32, i32, i32, i32 } %303, 2
  %307 = extractvalue { i32, i32, i32, i32 } %303, 3
  %308 = bitcast i32 %304 to float
  %309 = bitcast i32 %305 to float
  %310 = bitcast i32 %306 to float
  %311 = bitcast i32 %307 to float
  %312 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %284) #11
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %454, <1 x i32> %455, i1 %452) #11
  tail call void @llvm.nvvm.barrier0()
  %456 = icmp samesign ult i32 %5, 2
  %457 = zext nneg i32 %5 to i64
  %458 = getelementptr float, ptr addrspace(3) @global_smem, i64 %457
  %459 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %458, i1 %456) #11
  %460 = bitcast i32 %459 to float
  %461 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %459, i32 1, i32 31)
  %462 = bitcast i32 %461 to float
  %463 = fadd float %460, %462
  %464 = icmp eq i32 %5, 0
  %465 = bitcast float %463 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %458, <1 x i32> %465, i1 %464) #11
  tail call void @llvm.nvvm.barrier0()
  %466 = load float, ptr addrspace(3) @global_smem, align 16
  %467 = fmul float %466, 0x3F50000000000000
  %468 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #11
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
  %490 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %488) #11
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
  %507 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %489) #11
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
  %524 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %499) #11
  %525 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %500) #11
  %526 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %501) #11
  %527 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %502) #11
  %528 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %503) #11
  %529 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %504) #11
  %530 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %505) #11
  %531 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %506) #11
  %532 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %516) #11
  %533 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %517) #11
  %534 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %518) #11
  %535 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %519) #11
  %536 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %520) #11
  %537 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %521) #11
  %538 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %522) #11
  %539 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %523) #11
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
  %571 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %555) #11
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %577, i32 %580, i32 %583, i32 %586, ptr addrspace(1) %573) #11
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %589, i32 %592, i32 %595, i32 %598, ptr addrspace(1) %574) #11
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

define ptx_kernel void @triton_softmax_8_0(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2) local_unnamed_addr #7 {
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
!6 = !{i32 0, i32 24576}
!7 = !{i32 0, i32 384}
!8 = !{!9}
!9 = distinct !{!9, !10, !"fused_convert_5_param_0_221: argument 0"}
!10 = distinct !{!10, !"fused_convert_5_param_0_221"}
!11 = !{!12}
!12 = distinct !{!12, !13, !"fused_convert_5_param_0_221: argument 0"}
!13 = distinct !{!13, !"fused_convert_5_param_0_221"}
!14 = !{!15}
!15 = distinct !{!15, !16, !"fused_add_convert_342_14: argument 0"}
!16 = distinct !{!16, !"fused_add_convert_342_14"}
!17 = !{!18}
!18 = distinct !{!18, !19, !"fused_add_convert_342_14: argument 0"}
!19 = distinct !{!19, !"fused_add_convert_342_14"}
!20 = !{!21}
!21 = distinct !{!21, !22, !"fused_add_convert_342_14: argument 0"}
!22 = distinct !{!22, !"fused_add_convert_342_14"}
!23 = !{!24}
!24 = distinct !{!24, !25, !"fused_add_convert_342_14: argument 0"}
!25 = distinct !{!25, !"fused_add_convert_342_14"}
!26 = !{i32 0, i32 64}
!27 = !{!28}
!28 = distinct !{!28, !29, !"fused_concatenate_convert_432_17: argument 0"}
!29 = distinct !{!29, !"fused_concatenate_convert_432_17"}
!30 = !{!31}
!31 = distinct !{!31, !29, !"fused_concatenate_convert_432_17: argument 1"}
!32 = !{!33}
!33 = distinct !{!33, !34, !"fused_concatenate_convert_432_17: argument 0"}
!34 = distinct !{!34, !"fused_concatenate_convert_432_17"}
!35 = !{!36}
!36 = distinct !{!36, !34, !"fused_concatenate_convert_432_17: argument 1"}
!37 = !{i32 0, i32 135456}

; ModuleID = 'SyncTensorsGraph.1551'
source_filename = "SyncTensorsGraph.1551"
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

define ptx_kernel void @wrapped_concatenate(ptr noalias align 16 dereferenceable(4194304) %0, ptr noalias align 16 dereferenceable(4194304) %1, ptr noalias align 16 dereferenceable(4194304) %2, ptr noalias align 16 dereferenceable(4194304) %3, ptr noalias align 16 dereferenceable(4194304) %4, ptr noalias align 16 dereferenceable(4194304) %5, ptr noalias align 16 dereferenceable(4194304) %6, ptr noalias align 16 dereferenceable(4194304) %7, ptr noalias align 16 dereferenceable(4194304) %8, ptr noalias align 16 dereferenceable(4194304) %9, ptr noalias align 16 dereferenceable(4194304) %10, ptr noalias align 16 dereferenceable(4194304) %11, ptr noalias align 16 dereferenceable(4194304) %12, ptr noalias align 16 dereferenceable(4194304) %13, ptr noalias align 16 dereferenceable(4194304) %14, ptr noalias align 16 dereferenceable(4194304) %15, ptr noalias align 16 dereferenceable(4194304) %16, ptr noalias align 16 dereferenceable(4194304) %17, ptr noalias align 16 dereferenceable(4194304) %18, ptr noalias align 128 dereferenceable(79691776) %19) #0 {
  %21 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %22 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %23 = udiv i32 %22, 16
  %24 = icmp ult i32 %23, 9216
  br i1 %24, label %25, label %142

25:                                               ; preds = %20
  %26 = icmp ult i32 %23, 4096
  br i1 %26, label %27, label %74

27:                                               ; preds = %25
  %28 = icmp ult i32 %23, 2048
  br i1 %28, label %29, label %48

29:                                               ; preds = %27
  %30 = icmp ult i32 %23, 1024
  br i1 %30, label %31, label %36

31:                                               ; preds = %29
  %32 = mul i32 %22, 128
  %33 = add i32 %32, %21
  %34 = getelementptr inbounds bfloat, ptr %0, i32 %33
  %35 = load bfloat, ptr %34, align 2, !invariant.load !3
  br label %45

36:                                               ; preds = %29
  %37 = sub i32 %23, 1024
  %38 = urem i32 %22, 16
  %39 = mul i32 %38, 128
  %40 = add i32 %39, %21
  %41 = mul i32 %37, 2048
  %42 = add i32 %40, %41
  %43 = getelementptr inbounds bfloat, ptr %1, i32 %42
  %44 = load bfloat, ptr %43, align 2, !invariant.load !3
  br label %45

45:                                               ; preds = %31, %36
  %46 = phi bfloat [ %44, %36 ], [ %35, %31 ]
  br label %47

47:                                               ; preds = %45
  br label %71

48:                                               ; preds = %27
  %49 = icmp ult i32 %23, 3072
  br i1 %49, label %50, label %59

50:                                               ; preds = %48
  %51 = sub i32 %23, 2048
  %52 = urem i32 %22, 16
  %53 = mul i32 %52, 128
  %54 = add i32 %53, %21
  %55 = mul i32 %51, 2048
  %56 = add i32 %54, %55
  %57 = getelementptr inbounds bfloat, ptr %2, i32 %56
  %58 = load bfloat, ptr %57, align 2, !invariant.load !3
  br label %68

59:                                               ; preds = %48
  %60 = sub i32 %23, 3072
  %61 = urem i32 %22, 16
  %62 = mul i32 %61, 128
  %63 = add i32 %62, %21
  %64 = mul i32 %60, 2048
  %65 = add i32 %63, %64
  %66 = getelementptr inbounds bfloat, ptr %3, i32 %65
  %67 = load bfloat, ptr %66, align 2, !invariant.load !3
  br label %68

68:                                               ; preds = %50, %59
  %69 = phi bfloat [ %67, %59 ], [ %58, %50 ]
  br label %70

70:                                               ; preds = %68
  br label %71

71:                                               ; preds = %47, %70
  %72 = phi bfloat [ %69, %70 ], [ %46, %47 ]
  br label %73

73:                                               ; preds = %71
  br label %139

74:                                               ; preds = %25
  %75 = icmp ult i32 %23, 6144
  br i1 %75, label %76, label %99

76:                                               ; preds = %74
  %77 = icmp ult i32 %23, 5120
  br i1 %77, label %78, label %87

78:                                               ; preds = %76
  %79 = sub i32 %23, 4096
  %80 = urem i32 %22, 16
  %81 = mul i32 %80, 128
  %82 = add i32 %81, %21
  %83 = mul i32 %79, 2048
  %84 = add i32 %82, %83
  %85 = getelementptr inbounds bfloat, ptr %4, i32 %84
  %86 = load bfloat, ptr %85, align 2, !invariant.load !3
  br label %96

87:                                               ; preds = %76
  %88 = sub i32 %23, 5120
  %89 = urem i32 %22, 16
  %90 = mul i32 %89, 128
  %91 = add i32 %90, %21
  %92 = mul i32 %88, 2048
  %93 = add i32 %91, %92
  %94 = getelementptr inbounds bfloat, ptr %5, i32 %93
  %95 = load bfloat, ptr %94, align 2, !invariant.load !3
  br label %96

96:                                               ; preds = %78, %87
  %97 = phi bfloat [ %95, %87 ], [ %86, %78 ]
  br label %98

98:                                               ; preds = %96
  br label %136

99:                                               ; preds = %74
  %100 = icmp ult i32 %23, 7168
  br i1 %100, label %101, label %110

101:                                              ; preds = %99
  %102 = sub i32 %23, 6144
  %103 = urem i32 %22, 16
  %104 = mul i32 %103, 128
  %105 = add i32 %104, %21
  %106 = mul i32 %102, 2048
  %107 = add i32 %105, %106
  %108 = getelementptr inbounds bfloat, ptr %6, i32 %107
  %109 = load bfloat, ptr %108, align 2, !invariant.load !3
  br label %133

110:                                              ; preds = %99
  %111 = icmp ult i32 %23, 8192
  br i1 %111, label %112, label %121

112:                                              ; preds = %110
  %113 = sub i32 %23, 7168
  %114 = urem i32 %22, 16
  %115 = mul i32 %114, 128
  %116 = add i32 %115, %21
  %117 = mul i32 %113, 2048
  %118 = add i32 %116, %117
  %119 = getelementptr inbounds bfloat, ptr %7, i32 %118
  %120 = load bfloat, ptr %119, align 2, !invariant.load !3
  br label %130

121:                                              ; preds = %110
  %122 = sub i32 %23, 8192
  %123 = urem i32 %22, 16
  %124 = mul i32 %123, 128
  %125 = add i32 %124, %21
  %126 = mul i32 %122, 2048
  %127 = add i32 %125, %126
  %128 = getelementptr inbounds bfloat, ptr %8, i32 %127
  %129 = load bfloat, ptr %128, align 2, !invariant.load !3
  br label %130

130:                                              ; preds = %112, %121
  %131 = phi bfloat [ %129, %121 ], [ %120, %112 ]
  br label %132

132:                                              ; preds = %130
  br label %133

133:                                              ; preds = %101, %132
  %134 = phi bfloat [ %131, %132 ], [ %109, %101 ]
  br label %135

135:                                              ; preds = %133
  br label %136

136:                                              ; preds = %98, %135
  %137 = phi bfloat [ %134, %135 ], [ %97, %98 ]
  br label %138

138:                                              ; preds = %136
  br label %139

139:                                              ; preds = %73, %138
  %140 = phi bfloat [ %137, %138 ], [ %72, %73 ]
  br label %141

141:                                              ; preds = %139
  br label %277

142:                                              ; preds = %20
  %143 = icmp ult i32 %23, 14336
  br i1 %143, label %144, label %209

144:                                              ; preds = %142
  %145 = icmp ult i32 %23, 11264
  br i1 %145, label %146, label %169

146:                                              ; preds = %144
  %147 = icmp ult i32 %23, 10240
  br i1 %147, label %148, label %157

148:                                              ; preds = %146
  %149 = sub i32 %23, 9216
  %150 = urem i32 %22, 16
  %151 = mul i32 %150, 128
  %152 = add i32 %151, %21
  %153 = mul i32 %149, 2048
  %154 = add i32 %152, %153
  %155 = getelementptr inbounds bfloat, ptr %9, i32 %154
  %156 = load bfloat, ptr %155, align 2, !invariant.load !3
  br label %166

157:                                              ; preds = %146
  %158 = sub i32 %23, 10240
  %159 = urem i32 %22, 16
  %160 = mul i32 %159, 128
  %161 = add i32 %160, %21
  %162 = mul i32 %158, 2048
  %163 = add i32 %161, %162
  %164 = getelementptr inbounds bfloat, ptr %10, i32 %163
  %165 = load bfloat, ptr %164, align 2, !invariant.load !3
  br label %166

166:                                              ; preds = %148, %157
  %167 = phi bfloat [ %165, %157 ], [ %156, %148 ]
  br label %168

168:                                              ; preds = %166
  br label %206

169:                                              ; preds = %144
  %170 = icmp ult i32 %23, 12288
  br i1 %170, label %171, label %180

171:                                              ; preds = %169
  %172 = sub i32 %23, 11264
  %173 = urem i32 %22, 16
  %174 = mul i32 %173, 128
  %175 = add i32 %174, %21
  %176 = mul i32 %172, 2048
  %177 = add i32 %175, %176
  %178 = getelementptr inbounds bfloat, ptr %11, i32 %177
  %179 = load bfloat, ptr %178, align 2, !invariant.load !3
  br label %203

180:                                              ; preds = %169
  %181 = icmp ult i32 %23, 13312
  br i1 %181, label %182, label %191

182:                                              ; preds = %180
  %183 = sub i32 %23, 12288
  %184 = urem i32 %22, 16
  %185 = mul i32 %184, 128
  %186 = add i32 %185, %21
  %187 = mul i32 %183, 2048
  %188 = add i32 %186, %187
  %189 = getelementptr inbounds bfloat, ptr %12, i32 %188
  %190 = load bfloat, ptr %189, align 2, !invariant.load !3
  br label %200

191:                                              ; preds = %180
  %192 = sub i32 %23, 13312
  %193 = urem i32 %22, 16
  %194 = mul i32 %193, 128
  %195 = add i32 %194, %21
  %196 = mul i32 %192, 2048
  %197 = add i32 %195, %196
  %198 = getelementptr inbounds bfloat, ptr %13, i32 %197
  %199 = load bfloat, ptr %198, align 2, !invariant.load !3
  br label %200

200:                                              ; preds = %182, %191
  %201 = phi bfloat [ %199, %191 ], [ %190, %182 ]
  br label %202

202:                                              ; preds = %200
  br label %203

203:                                              ; preds = %171, %202
  %204 = phi bfloat [ %201, %202 ], [ %179, %171 ]
  br label %205

205:                                              ; preds = %203
  br label %206

206:                                              ; preds = %168, %205
  %207 = phi bfloat [ %204, %205 ], [ %167, %168 ]
  br label %208

208:                                              ; preds = %206
  br label %274

209:                                              ; preds = %142
  %210 = icmp ult i32 %23, 16384
  br i1 %210, label %211, label %234

211:                                              ; preds = %209
  %212 = icmp ult i32 %23, 15360
  br i1 %212, label %213, label %222

213:                                              ; preds = %211
  %214 = sub i32 %23, 14336
  %215 = urem i32 %22, 16
  %216 = mul i32 %215, 128
  %217 = add i32 %216, %21
  %218 = mul i32 %214, 2048
  %219 = add i32 %217, %218
  %220 = getelementptr inbounds bfloat, ptr %14, i32 %219
  %221 = load bfloat, ptr %220, align 2, !invariant.load !3
  br label %231

222:                                              ; preds = %211
  %223 = sub i32 %23, 15360
  %224 = urem i32 %22, 16
  %225 = mul i32 %224, 128
  %226 = add i32 %225, %21
  %227 = mul i32 %223, 2048
  %228 = add i32 %226, %227
  %229 = getelementptr inbounds bfloat, ptr %15, i32 %228
  %230 = load bfloat, ptr %229, align 2, !invariant.load !3
  br label %231

231:                                              ; preds = %213, %222
  %232 = phi bfloat [ %230, %222 ], [ %221, %213 ]
  br label %233

233:                                              ; preds = %231
  br label %271

234:                                              ; preds = %209
  %235 = icmp ult i32 %23, 17408
  br i1 %235, label %236, label %245

236:                                              ; preds = %234
  %237 = sub i32 %23, 16384
  %238 = urem i32 %22, 16
  %239 = mul i32 %238, 128
  %240 = add i32 %239, %21
  %241 = mul i32 %237, 2048
  %242 = add i32 %240, %241
  %243 = getelementptr inbounds bfloat, ptr %16, i32 %242
  %244 = load bfloat, ptr %243, align 2, !invariant.load !3
  br label %268

245:                                              ; preds = %234
  %246 = icmp ult i32 %23, 18432
  br i1 %246, label %247, label %256

247:                                              ; preds = %245
  %248 = sub i32 %23, 17408
  %249 = urem i32 %22, 16
  %250 = mul i32 %249, 128
  %251 = add i32 %250, %21
  %252 = mul i32 %248, 2048
  %253 = add i32 %251, %252
  %254 = getelementptr inbounds bfloat, ptr %17, i32 %253
  %255 = load bfloat, ptr %254, align 2, !invariant.load !3
  br label %265

256:                                              ; preds = %245
  %257 = sub i32 %23, 18432
  %258 = urem i32 %22, 16
  %259 = mul i32 %258, 128
  %260 = add i32 %259, %21
  %261 = mul i32 %257, 2048
  %262 = add i32 %260, %261
  %263 = getelementptr inbounds bfloat, ptr %18, i32 %262
  %264 = load bfloat, ptr %263, align 2, !invariant.load !3
  br label %265

265:                                              ; preds = %247, %256
  %266 = phi bfloat [ %264, %256 ], [ %255, %247 ]
  br label %267

267:                                              ; preds = %265
  br label %268

268:                                              ; preds = %236, %267
  %269 = phi bfloat [ %266, %267 ], [ %244, %236 ]
  br label %270

270:                                              ; preds = %268
  br label %271

271:                                              ; preds = %233, %270
  %272 = phi bfloat [ %269, %270 ], [ %232, %233 ]
  br label %273

273:                                              ; preds = %271
  br label %274

274:                                              ; preds = %208, %273
  %275 = phi bfloat [ %272, %273 ], [ %207, %208 ]
  br label %276

276:                                              ; preds = %274
  br label %277

277:                                              ; preds = %141, %276
  %278 = phi bfloat [ %275, %276 ], [ %140, %141 ]
  br label %279

279:                                              ; preds = %277
  %280 = mul i32 %22, 128
  %281 = add i32 %280, %21
  %282 = getelementptr inbounds bfloat, ptr %19, i32 %281
  store bfloat %278, ptr %282, align 2
  ret void
}

declare ptx_kernel void @gemm_fusion_dot_76_0_impl(ptr, ptr, ptr) #2

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #3

define ptx_kernel void @gemm_fusion_dot_76_0(ptr noalias align 128 dereferenceable(79691776) %arg0, ptr noalias align 128 dereferenceable(2490368) %arg1) #4 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr null to ptr addrspace(1)
  %4 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %5 = sdiv i32 %4, 608
  %6 = mul i32 %5, 8
  %7 = sub i32 1, %6
  %8 = icmp slt i32 %7, 8
  %9 = select i1 %8, i32 %7, i32 8
  %10 = srem i32 %4, %9
  %11 = add i32 %6, %10
  %12 = srem i32 %4, 608
  %13 = sdiv i32 %12, %9
  %14 = mul i32 %13, 256
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
  %50 = and i32 %37, 4
  %51 = icmp eq i32 %50, 0
  %52 = select i1 %51, i32 0, i32 8
  %53 = xor i32 %49, %52
  %54 = xor i32 %53, 0
  %55 = xor i32 %53, 16
  %56 = xor i32 %53, 32
  %57 = xor i32 %53, 48
  %58 = xor i32 %53, 64
  %59 = xor i32 %53, 80
  %60 = xor i32 %53, 96
  %61 = xor i32 %53, 112
  %62 = xor i32 %53, 128
  %63 = xor i32 %53, 144
  %64 = xor i32 %53, 160
  %65 = xor i32 %53, 176
  %66 = xor i32 %53, 192
  %67 = xor i32 %53, 208
  %68 = xor i32 %53, 224
  %69 = xor i32 %53, 240
  %70 = add i32 %54, 0
  %71 = add i32 %55, 0
  %72 = add i32 %56, 0
  %73 = add i32 %57, 0
  %74 = add i32 %58, 0
  %75 = add i32 %59, 0
  %76 = add i32 %60, 0
  %77 = add i32 %61, 0
  %78 = add i32 %62, 0
  %79 = add i32 %63, 0
  %80 = add i32 %64, 0
  %81 = add i32 %65, 0
  %82 = add i32 %66, 0
  %83 = add i32 %67, 0
  %84 = add i32 %68, 0
  %85 = add i32 %69, 0
  %86 = sext i32 %70 to i64
  %87 = sext i32 %71 to i64
  %88 = sext i32 %72 to i64
  %89 = sext i32 %73 to i64
  %90 = sext i32 %74 to i64
  %91 = sext i32 %75 to i64
  %92 = sext i32 %76 to i64
  %93 = sext i32 %77 to i64
  %94 = sext i32 %78 to i64
  %95 = sext i32 %79 to i64
  %96 = sext i32 %80 to i64
  %97 = sext i32 %81 to i64
  %98 = sext i32 %82 to i64
  %99 = sext i32 %83 to i64
  %100 = sext i32 %84 to i64
  %101 = sext i32 %85 to i64
  %102 = add i64 %15, %86
  %103 = add i64 %15, %87
  %104 = add i64 %15, %88
  %105 = add i64 %15, %89
  %106 = add i64 %15, %90
  %107 = add i64 %15, %91
  %108 = add i64 %15, %92
  %109 = add i64 %15, %93
  %110 = add i64 %15, %94
  %111 = add i64 %15, %95
  %112 = add i64 %15, %96
  %113 = add i64 %15, %97
  %114 = add i64 %15, %98
  %115 = add i64 %15, %99
  %116 = add i64 %15, %100
  %117 = add i64 %15, %101
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
  %130 = mul i64 %114, 2048
  %131 = mul i64 %115, 2048
  %132 = mul i64 %116, 2048
  %133 = mul i64 %117, 2048
  %134 = add i64 %36, %118
  %135 = add i64 %36, %119
  %136 = add i64 %36, %120
  %137 = add i64 %36, %121
  %138 = add i64 %36, %122
  %139 = add i64 %36, %123
  %140 = add i64 %36, %124
  %141 = add i64 %36, %125
  %142 = add i64 %36, %126
  %143 = add i64 %36, %127
  %144 = add i64 %36, %128
  %145 = add i64 %36, %129
  %146 = add i64 %36, %130
  %147 = add i64 %36, %131
  %148 = add i64 %36, %132
  %149 = add i64 %36, %133
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
  %162 = getelementptr bfloat, ptr addrspace(1) %1, i64 %146
  %163 = getelementptr bfloat, ptr addrspace(1) %1, i64 %147
  %164 = getelementptr bfloat, ptr addrspace(1) %1, i64 %148
  %165 = getelementptr bfloat, ptr addrspace(1) %1, i64 %149
  %166 = select i1 %39, i32 0, i32 136
  %167 = xor i32 %33, %166
  %168 = select i1 %43, i32 0, i32 272
  %169 = xor i32 %167, %168
  %170 = select i1 %47, i32 0, i32 544
  %171 = xor i32 %169, %170
  %172 = select i1 %51, i32 0, i32 1024
  %173 = xor i32 %171, %172
  %174 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %173
  %175 = xor i32 2048, %20
  %176 = xor i32 %175, %24
  %177 = xor i32 %176, %28
  %178 = xor i32 %177, %32
  %179 = xor i32 %178, %166
  %180 = xor i32 %179, %168
  %181 = xor i32 %180, %170
  %182 = xor i32 %181, %172
  %183 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %182
  %184 = xor i32 4096, %20
  %185 = xor i32 %184, %24
  %186 = xor i32 %185, %28
  %187 = xor i32 %186, %32
  %188 = xor i32 %187, %166
  %189 = xor i32 %188, %168
  %190 = xor i32 %189, %170
  %191 = xor i32 %190, %172
  %192 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %191
  %193 = xor i32 6144, %20
  %194 = xor i32 %193, %24
  %195 = xor i32 %194, %28
  %196 = xor i32 %195, %32
  %197 = xor i32 %196, %166
  %198 = xor i32 %197, %168
  %199 = xor i32 %198, %170
  %200 = xor i32 %199, %172
  %201 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %200
  %202 = xor i32 8192, %20
  %203 = xor i32 %202, %24
  %204 = xor i32 %203, %28
  %205 = xor i32 %204, %32
  %206 = xor i32 %205, %166
  %207 = xor i32 %206, %168
  %208 = xor i32 %207, %170
  %209 = xor i32 %208, %172
  %210 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %209
  %211 = xor i32 10240, %20
  %212 = xor i32 %211, %24
  %213 = xor i32 %212, %28
  %214 = xor i32 %213, %32
  %215 = xor i32 %214, %166
  %216 = xor i32 %215, %168
  %217 = xor i32 %216, %170
  %218 = xor i32 %217, %172
  %219 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %218
  %220 = xor i32 12288, %20
  %221 = xor i32 %220, %24
  %222 = xor i32 %221, %28
  %223 = xor i32 %222, %32
  %224 = xor i32 %223, %166
  %225 = xor i32 %224, %168
  %226 = xor i32 %225, %170
  %227 = xor i32 %226, %172
  %228 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %227
  %229 = xor i32 14336, %20
  %230 = xor i32 %229, %24
  %231 = xor i32 %230, %28
  %232 = xor i32 %231, %32
  %233 = xor i32 %232, %166
  %234 = xor i32 %233, %168
  %235 = xor i32 %234, %170
  %236 = xor i32 %235, %172
  %237 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %236
  %238 = xor i32 16384, %20
  %239 = xor i32 %238, %24
  %240 = xor i32 %239, %28
  %241 = xor i32 %240, %32
  %242 = xor i32 %241, %166
  %243 = xor i32 %242, %168
  %244 = xor i32 %243, %170
  %245 = xor i32 %244, %172
  %246 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %245
  %247 = xor i32 18432, %20
  %248 = xor i32 %247, %24
  %249 = xor i32 %248, %28
  %250 = xor i32 %249, %32
  %251 = xor i32 %250, %166
  %252 = xor i32 %251, %168
  %253 = xor i32 %252, %170
  %254 = xor i32 %253, %172
  %255 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %254
  %256 = xor i32 20480, %20
  %257 = xor i32 %256, %24
  %258 = xor i32 %257, %28
  %259 = xor i32 %258, %32
  %260 = xor i32 %259, %166
  %261 = xor i32 %260, %168
  %262 = xor i32 %261, %170
  %263 = xor i32 %262, %172
  %264 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %263
  %265 = xor i32 22528, %20
  %266 = xor i32 %265, %24
  %267 = xor i32 %266, %28
  %268 = xor i32 %267, %32
  %269 = xor i32 %268, %166
  %270 = xor i32 %269, %168
  %271 = xor i32 %270, %170
  %272 = xor i32 %271, %172
  %273 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %272
  %274 = xor i32 24576, %20
  %275 = xor i32 %274, %24
  %276 = xor i32 %275, %28
  %277 = xor i32 %276, %32
  %278 = xor i32 %277, %166
  %279 = xor i32 %278, %168
  %280 = xor i32 %279, %170
  %281 = xor i32 %280, %172
  %282 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %281
  %283 = xor i32 26624, %20
  %284 = xor i32 %283, %24
  %285 = xor i32 %284, %28
  %286 = xor i32 %285, %32
  %287 = xor i32 %286, %166
  %288 = xor i32 %287, %168
  %289 = xor i32 %288, %170
  %290 = xor i32 %289, %172
  %291 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %290
  %292 = xor i32 28672, %20
  %293 = xor i32 %292, %24
  %294 = xor i32 %293, %28
  %295 = xor i32 %294, %32
  %296 = xor i32 %295, %166
  %297 = xor i32 %296, %168
  %298 = xor i32 %297, %170
  %299 = xor i32 %298, %172
  %300 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %299
  %301 = xor i32 30720, %20
  %302 = xor i32 %301, %24
  %303 = xor i32 %302, %28
  %304 = xor i32 %303, %32
  %305 = xor i32 %304, %166
  %306 = xor i32 %305, %168
  %307 = xor i32 %306, %170
  %308 = xor i32 %307, %172
  %309 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %308
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %174, ptr addrspace(1) %150, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %183, ptr addrspace(1) %151, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %192, ptr addrspace(1) %152, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %201, ptr addrspace(1) %153, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %210, ptr addrspace(1) %154, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %219, ptr addrspace(1) %155, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %228, ptr addrspace(1) %156, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %237, ptr addrspace(1) %157, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %246, ptr addrspace(1) %158, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %255, ptr addrspace(1) %159, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %264, ptr addrspace(1) %160, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %273, ptr addrspace(1) %161, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %282, ptr addrspace(1) %162, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %291, ptr addrspace(1) %163, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %300, ptr addrspace(1) %164, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %309, ptr addrspace(1) %165, i32 16)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  %310 = add i64 %36, 128
  %311 = add i64 %310, %118
  %312 = add i64 %310, %119
  %313 = add i64 %310, %120
  %314 = add i64 %310, %121
  %315 = add i64 %310, %122
  %316 = add i64 %310, %123
  %317 = add i64 %310, %124
  %318 = add i64 %310, %125
  %319 = add i64 %310, %126
  %320 = add i64 %310, %127
  %321 = add i64 %310, %128
  %322 = add i64 %310, %129
  %323 = add i64 %310, %130
  %324 = add i64 %310, %131
  %325 = add i64 %310, %132
  %326 = add i64 %310, %133
  %327 = getelementptr bfloat, ptr addrspace(1) %1, i64 %311
  %328 = getelementptr bfloat, ptr addrspace(1) %1, i64 %312
  %329 = getelementptr bfloat, ptr addrspace(1) %1, i64 %313
  %330 = getelementptr bfloat, ptr addrspace(1) %1, i64 %314
  %331 = getelementptr bfloat, ptr addrspace(1) %1, i64 %315
  %332 = getelementptr bfloat, ptr addrspace(1) %1, i64 %316
  %333 = getelementptr bfloat, ptr addrspace(1) %1, i64 %317
  %334 = getelementptr bfloat, ptr addrspace(1) %1, i64 %318
  %335 = getelementptr bfloat, ptr addrspace(1) %1, i64 %319
  %336 = getelementptr bfloat, ptr addrspace(1) %1, i64 %320
  %337 = getelementptr bfloat, ptr addrspace(1) %1, i64 %321
  %338 = getelementptr bfloat, ptr addrspace(1) %1, i64 %322
  %339 = getelementptr bfloat, ptr addrspace(1) %1, i64 %323
  %340 = getelementptr bfloat, ptr addrspace(1) %1, i64 %324
  %341 = getelementptr bfloat, ptr addrspace(1) %1, i64 %325
  %342 = getelementptr bfloat, ptr addrspace(1) %1, i64 %326
  call void @llvm.nvvm.barrier0()
  %343 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %173
  %344 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %182
  %345 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %191
  %346 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %200
  %347 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %209
  %348 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %218
  %349 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %227
  %350 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %236
  %351 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %245
  %352 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %254
  %353 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %263
  %354 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %272
  %355 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %281
  %356 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %290
  %357 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %299
  %358 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %308
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %343, ptr addrspace(1) %327, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %344, ptr addrspace(1) %328, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %345, ptr addrspace(1) %329, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %346, ptr addrspace(1) %330, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %347, ptr addrspace(1) %331, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %348, ptr addrspace(1) %332, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %349, ptr addrspace(1) %333, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %350, ptr addrspace(1) %334, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %351, ptr addrspace(1) %335, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %352, ptr addrspace(1) %336, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %353, ptr addrspace(1) %337, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %354, ptr addrspace(1) %338, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %355, ptr addrspace(1) %339, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %356, ptr addrspace(1) %340, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %357, ptr addrspace(1) %341, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %358, ptr addrspace(1) %342, i32 16)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  call void asm sideeffect "cp.async.wait_group 0x1;", ""()
  call void @llvm.nvvm.barrier0()
  br label %359

359:                                              ; preds = %367, %0
  %360 = phi i32 [ %1840, %367 ], [ 0, %0 ]
  %361 = phi i64 [ %1770, %367 ], [ 128, %0 ]
  %362 = phi { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } [ %1769, %367 ], [ zeroinitializer, %0 ]
  %363 = phi i32 [ %1773, %367 ], [ 1, %0 ]
  %364 = phi i32 [ %1831, %367 ], [ 0, %0 ]
  %365 = phi { ptr addrspace(3), i32, i32 } [ %1839, %367 ], [ { ptr addrspace(3) @global_smem, i32 0, i32 0 }, %0 ]
  %366 = icmp slt i32 %360, 2048
  br i1 %366, label %367, label %1841

367:                                              ; preds = %359
  %368 = icmp slt i32 %360, 1792
  %369 = extractvalue { ptr addrspace(3), i32, i32 } %365, 0
  %370 = select i1 %19, i32 0, i32 136
  %371 = xor i32 0, %370
  %372 = select i1 %23, i32 0, i32 272
  %373 = xor i32 %371, %372
  %374 = select i1 %27, i32 0, i32 544
  %375 = xor i32 %373, %374
  %376 = select i1 %31, i32 0, i32 8
  %377 = xor i32 %375, %376
  %378 = select i1 %39, i32 0, i32 16
  %379 = xor i32 %377, %378
  %380 = select i1 %43, i32 0, i32 1024
  %381 = xor i32 %379, %380
  %382 = select i1 %47, i32 0, i32 2048
  %383 = xor i32 %381, %382
  %384 = select i1 %51, i32 0, i32 4096
  %385 = xor i32 %383, %384
  %386 = getelementptr inbounds bfloat, ptr addrspace(3) %369, i32 %385
  %387 = ptrtoint ptr addrspace(3) %386 to i32
  %388 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %387)
  %389 = extractvalue { i32, i32, i32, i32 } %388, 0
  %390 = extractvalue { i32, i32, i32, i32 } %388, 1
  %391 = extractvalue { i32, i32, i32, i32 } %388, 2
  %392 = extractvalue { i32, i32, i32, i32 } %388, 3
  %393 = xor i32 32, %370
  %394 = xor i32 %393, %372
  %395 = xor i32 %394, %374
  %396 = xor i32 %395, %376
  %397 = xor i32 %396, %378
  %398 = xor i32 %397, %380
  %399 = xor i32 %398, %382
  %400 = xor i32 %399, %384
  %401 = getelementptr inbounds bfloat, ptr addrspace(3) %369, i32 %400
  %402 = ptrtoint ptr addrspace(3) %401 to i32
  %403 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %402)
  %404 = extractvalue { i32, i32, i32, i32 } %403, 0
  %405 = extractvalue { i32, i32, i32, i32 } %403, 1
  %406 = extractvalue { i32, i32, i32, i32 } %403, 2
  %407 = extractvalue { i32, i32, i32, i32 } %403, 3
  %408 = xor i32 64, %370
  %409 = xor i32 %408, %372
  %410 = xor i32 %409, %374
  %411 = xor i32 %410, %376
  %412 = xor i32 %411, %378
  %413 = xor i32 %412, %380
  %414 = xor i32 %413, %382
  %415 = xor i32 %414, %384
  %416 = getelementptr inbounds bfloat, ptr addrspace(3) %369, i32 %415
  %417 = ptrtoint ptr addrspace(3) %416 to i32
  %418 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %417)
  %419 = extractvalue { i32, i32, i32, i32 } %418, 0
  %420 = extractvalue { i32, i32, i32, i32 } %418, 1
  %421 = extractvalue { i32, i32, i32, i32 } %418, 2
  %422 = extractvalue { i32, i32, i32, i32 } %418, 3
  %423 = xor i32 96, %370
  %424 = xor i32 %423, %372
  %425 = xor i32 %424, %374
  %426 = xor i32 %425, %376
  %427 = xor i32 %426, %378
  %428 = xor i32 %427, %380
  %429 = xor i32 %428, %382
  %430 = xor i32 %429, %384
  %431 = getelementptr inbounds bfloat, ptr addrspace(3) %369, i32 %430
  %432 = ptrtoint ptr addrspace(3) %431 to i32
  %433 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %432)
  %434 = extractvalue { i32, i32, i32, i32 } %433, 0
  %435 = extractvalue { i32, i32, i32, i32 } %433, 1
  %436 = extractvalue { i32, i32, i32, i32 } %433, 2
  %437 = extractvalue { i32, i32, i32, i32 } %433, 3
  %438 = xor i32 8192, %370
  %439 = xor i32 %438, %372
  %440 = xor i32 %439, %374
  %441 = xor i32 %440, %376
  %442 = xor i32 %441, %378
  %443 = xor i32 %442, %380
  %444 = xor i32 %443, %382
  %445 = xor i32 %444, %384
  %446 = getelementptr inbounds bfloat, ptr addrspace(3) %369, i32 %445
  %447 = ptrtoint ptr addrspace(3) %446 to i32
  %448 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %447)
  %449 = extractvalue { i32, i32, i32, i32 } %448, 0
  %450 = extractvalue { i32, i32, i32, i32 } %448, 1
  %451 = extractvalue { i32, i32, i32, i32 } %448, 2
  %452 = extractvalue { i32, i32, i32, i32 } %448, 3
  %453 = xor i32 8224, %370
  %454 = xor i32 %453, %372
  %455 = xor i32 %454, %374
  %456 = xor i32 %455, %376
  %457 = xor i32 %456, %378
  %458 = xor i32 %457, %380
  %459 = xor i32 %458, %382
  %460 = xor i32 %459, %384
  %461 = getelementptr inbounds bfloat, ptr addrspace(3) %369, i32 %460
  %462 = ptrtoint ptr addrspace(3) %461 to i32
  %463 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %462)
  %464 = extractvalue { i32, i32, i32, i32 } %463, 0
  %465 = extractvalue { i32, i32, i32, i32 } %463, 1
  %466 = extractvalue { i32, i32, i32, i32 } %463, 2
  %467 = extractvalue { i32, i32, i32, i32 } %463, 3
  %468 = xor i32 8256, %370
  %469 = xor i32 %468, %372
  %470 = xor i32 %469, %374
  %471 = xor i32 %470, %376
  %472 = xor i32 %471, %378
  %473 = xor i32 %472, %380
  %474 = xor i32 %473, %382
  %475 = xor i32 %474, %384
  %476 = getelementptr inbounds bfloat, ptr addrspace(3) %369, i32 %475
  %477 = ptrtoint ptr addrspace(3) %476 to i32
  %478 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %477)
  %479 = extractvalue { i32, i32, i32, i32 } %478, 0
  %480 = extractvalue { i32, i32, i32, i32 } %478, 1
  %481 = extractvalue { i32, i32, i32, i32 } %478, 2
  %482 = extractvalue { i32, i32, i32, i32 } %478, 3
  %483 = xor i32 8288, %370
  %484 = xor i32 %483, %372
  %485 = xor i32 %484, %374
  %486 = xor i32 %485, %376
  %487 = xor i32 %486, %378
  %488 = xor i32 %487, %380
  %489 = xor i32 %488, %382
  %490 = xor i32 %489, %384
  %491 = getelementptr inbounds bfloat, ptr addrspace(3) %369, i32 %490
  %492 = ptrtoint ptr addrspace(3) %491 to i32
  %493 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %492)
  %494 = extractvalue { i32, i32, i32, i32 } %493, 0
  %495 = extractvalue { i32, i32, i32, i32 } %493, 1
  %496 = extractvalue { i32, i32, i32, i32 } %493, 2
  %497 = extractvalue { i32, i32, i32, i32 } %493, 3
  %498 = xor i32 16384, %370
  %499 = xor i32 %498, %372
  %500 = xor i32 %499, %374
  %501 = xor i32 %500, %376
  %502 = xor i32 %501, %378
  %503 = xor i32 %502, %380
  %504 = xor i32 %503, %382
  %505 = xor i32 %504, %384
  %506 = getelementptr inbounds bfloat, ptr addrspace(3) %369, i32 %505
  %507 = ptrtoint ptr addrspace(3) %506 to i32
  %508 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %507)
  %509 = extractvalue { i32, i32, i32, i32 } %508, 0
  %510 = extractvalue { i32, i32, i32, i32 } %508, 1
  %511 = extractvalue { i32, i32, i32, i32 } %508, 2
  %512 = extractvalue { i32, i32, i32, i32 } %508, 3
  %513 = xor i32 16416, %370
  %514 = xor i32 %513, %372
  %515 = xor i32 %514, %374
  %516 = xor i32 %515, %376
  %517 = xor i32 %516, %378
  %518 = xor i32 %517, %380
  %519 = xor i32 %518, %382
  %520 = xor i32 %519, %384
  %521 = getelementptr inbounds bfloat, ptr addrspace(3) %369, i32 %520
  %522 = ptrtoint ptr addrspace(3) %521 to i32
  %523 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %522)
  %524 = extractvalue { i32, i32, i32, i32 } %523, 0
  %525 = extractvalue { i32, i32, i32, i32 } %523, 1
  %526 = extractvalue { i32, i32, i32, i32 } %523, 2
  %527 = extractvalue { i32, i32, i32, i32 } %523, 3
  %528 = xor i32 16448, %370
  %529 = xor i32 %528, %372
  %530 = xor i32 %529, %374
  %531 = xor i32 %530, %376
  %532 = xor i32 %531, %378
  %533 = xor i32 %532, %380
  %534 = xor i32 %533, %382
  %535 = xor i32 %534, %384
  %536 = getelementptr inbounds bfloat, ptr addrspace(3) %369, i32 %535
  %537 = ptrtoint ptr addrspace(3) %536 to i32
  %538 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %537)
  %539 = extractvalue { i32, i32, i32, i32 } %538, 0
  %540 = extractvalue { i32, i32, i32, i32 } %538, 1
  %541 = extractvalue { i32, i32, i32, i32 } %538, 2
  %542 = extractvalue { i32, i32, i32, i32 } %538, 3
  %543 = xor i32 16480, %370
  %544 = xor i32 %543, %372
  %545 = xor i32 %544, %374
  %546 = xor i32 %545, %376
  %547 = xor i32 %546, %378
  %548 = xor i32 %547, %380
  %549 = xor i32 %548, %382
  %550 = xor i32 %549, %384
  %551 = getelementptr inbounds bfloat, ptr addrspace(3) %369, i32 %550
  %552 = ptrtoint ptr addrspace(3) %551 to i32
  %553 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %552)
  %554 = extractvalue { i32, i32, i32, i32 } %553, 0
  %555 = extractvalue { i32, i32, i32, i32 } %553, 1
  %556 = extractvalue { i32, i32, i32, i32 } %553, 2
  %557 = extractvalue { i32, i32, i32, i32 } %553, 3
  %558 = xor i32 24576, %370
  %559 = xor i32 %558, %372
  %560 = xor i32 %559, %374
  %561 = xor i32 %560, %376
  %562 = xor i32 %561, %378
  %563 = xor i32 %562, %380
  %564 = xor i32 %563, %382
  %565 = xor i32 %564, %384
  %566 = getelementptr inbounds bfloat, ptr addrspace(3) %369, i32 %565
  %567 = ptrtoint ptr addrspace(3) %566 to i32
  %568 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %567)
  %569 = extractvalue { i32, i32, i32, i32 } %568, 0
  %570 = extractvalue { i32, i32, i32, i32 } %568, 1
  %571 = extractvalue { i32, i32, i32, i32 } %568, 2
  %572 = extractvalue { i32, i32, i32, i32 } %568, 3
  %573 = xor i32 24608, %370
  %574 = xor i32 %573, %372
  %575 = xor i32 %574, %374
  %576 = xor i32 %575, %376
  %577 = xor i32 %576, %378
  %578 = xor i32 %577, %380
  %579 = xor i32 %578, %382
  %580 = xor i32 %579, %384
  %581 = getelementptr inbounds bfloat, ptr addrspace(3) %369, i32 %580
  %582 = ptrtoint ptr addrspace(3) %581 to i32
  %583 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %582)
  %584 = extractvalue { i32, i32, i32, i32 } %583, 0
  %585 = extractvalue { i32, i32, i32, i32 } %583, 1
  %586 = extractvalue { i32, i32, i32, i32 } %583, 2
  %587 = extractvalue { i32, i32, i32, i32 } %583, 3
  %588 = xor i32 24640, %370
  %589 = xor i32 %588, %372
  %590 = xor i32 %589, %374
  %591 = xor i32 %590, %376
  %592 = xor i32 %591, %378
  %593 = xor i32 %592, %380
  %594 = xor i32 %593, %382
  %595 = xor i32 %594, %384
  %596 = getelementptr inbounds bfloat, ptr addrspace(3) %369, i32 %595
  %597 = ptrtoint ptr addrspace(3) %596 to i32
  %598 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %597)
  %599 = extractvalue { i32, i32, i32, i32 } %598, 0
  %600 = extractvalue { i32, i32, i32, i32 } %598, 1
  %601 = extractvalue { i32, i32, i32, i32 } %598, 2
  %602 = extractvalue { i32, i32, i32, i32 } %598, 3
  %603 = xor i32 24672, %370
  %604 = xor i32 %603, %372
  %605 = xor i32 %604, %374
  %606 = xor i32 %605, %376
  %607 = xor i32 %606, %378
  %608 = xor i32 %607, %380
  %609 = xor i32 %608, %382
  %610 = xor i32 %609, %384
  %611 = getelementptr inbounds bfloat, ptr addrspace(3) %369, i32 %610
  %612 = ptrtoint ptr addrspace(3) %611 to i32
  %613 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %612)
  %614 = extractvalue { i32, i32, i32, i32 } %613, 0
  %615 = extractvalue { i32, i32, i32, i32 } %613, 1
  %616 = extractvalue { i32, i32, i32, i32 } %613, 2
  %617 = extractvalue { i32, i32, i32, i32 } %613, 3
  %618 = bitcast i32 %389 to <2 x bfloat>
  %619 = extractelement <2 x bfloat> %618, i32 0
  %620 = extractelement <2 x bfloat> %618, i32 1
  %621 = bitcast i32 %390 to <2 x bfloat>
  %622 = extractelement <2 x bfloat> %621, i32 0
  %623 = extractelement <2 x bfloat> %621, i32 1
  %624 = bitcast i32 %391 to <2 x bfloat>
  %625 = extractelement <2 x bfloat> %624, i32 0
  %626 = extractelement <2 x bfloat> %624, i32 1
  %627 = bitcast i32 %392 to <2 x bfloat>
  %628 = extractelement <2 x bfloat> %627, i32 0
  %629 = extractelement <2 x bfloat> %627, i32 1
  %630 = bitcast i32 %404 to <2 x bfloat>
  %631 = extractelement <2 x bfloat> %630, i32 0
  %632 = extractelement <2 x bfloat> %630, i32 1
  %633 = bitcast i32 %405 to <2 x bfloat>
  %634 = extractelement <2 x bfloat> %633, i32 0
  %635 = extractelement <2 x bfloat> %633, i32 1
  %636 = bitcast i32 %406 to <2 x bfloat>
  %637 = extractelement <2 x bfloat> %636, i32 0
  %638 = extractelement <2 x bfloat> %636, i32 1
  %639 = bitcast i32 %407 to <2 x bfloat>
  %640 = extractelement <2 x bfloat> %639, i32 0
  %641 = extractelement <2 x bfloat> %639, i32 1
  %642 = bitcast i32 %419 to <2 x bfloat>
  %643 = extractelement <2 x bfloat> %642, i32 0
  %644 = extractelement <2 x bfloat> %642, i32 1
  %645 = bitcast i32 %420 to <2 x bfloat>
  %646 = extractelement <2 x bfloat> %645, i32 0
  %647 = extractelement <2 x bfloat> %645, i32 1
  %648 = bitcast i32 %421 to <2 x bfloat>
  %649 = extractelement <2 x bfloat> %648, i32 0
  %650 = extractelement <2 x bfloat> %648, i32 1
  %651 = bitcast i32 %422 to <2 x bfloat>
  %652 = extractelement <2 x bfloat> %651, i32 0
  %653 = extractelement <2 x bfloat> %651, i32 1
  %654 = bitcast i32 %434 to <2 x bfloat>
  %655 = extractelement <2 x bfloat> %654, i32 0
  %656 = extractelement <2 x bfloat> %654, i32 1
  %657 = bitcast i32 %435 to <2 x bfloat>
  %658 = extractelement <2 x bfloat> %657, i32 0
  %659 = extractelement <2 x bfloat> %657, i32 1
  %660 = bitcast i32 %436 to <2 x bfloat>
  %661 = extractelement <2 x bfloat> %660, i32 0
  %662 = extractelement <2 x bfloat> %660, i32 1
  %663 = bitcast i32 %437 to <2 x bfloat>
  %664 = extractelement <2 x bfloat> %663, i32 0
  %665 = extractelement <2 x bfloat> %663, i32 1
  %666 = bitcast i32 %449 to <2 x bfloat>
  %667 = extractelement <2 x bfloat> %666, i32 0
  %668 = extractelement <2 x bfloat> %666, i32 1
  %669 = bitcast i32 %450 to <2 x bfloat>
  %670 = extractelement <2 x bfloat> %669, i32 0
  %671 = extractelement <2 x bfloat> %669, i32 1
  %672 = bitcast i32 %451 to <2 x bfloat>
  %673 = extractelement <2 x bfloat> %672, i32 0
  %674 = extractelement <2 x bfloat> %672, i32 1
  %675 = bitcast i32 %452 to <2 x bfloat>
  %676 = extractelement <2 x bfloat> %675, i32 0
  %677 = extractelement <2 x bfloat> %675, i32 1
  %678 = bitcast i32 %464 to <2 x bfloat>
  %679 = extractelement <2 x bfloat> %678, i32 0
  %680 = extractelement <2 x bfloat> %678, i32 1
  %681 = bitcast i32 %465 to <2 x bfloat>
  %682 = extractelement <2 x bfloat> %681, i32 0
  %683 = extractelement <2 x bfloat> %681, i32 1
  %684 = bitcast i32 %466 to <2 x bfloat>
  %685 = extractelement <2 x bfloat> %684, i32 0
  %686 = extractelement <2 x bfloat> %684, i32 1
  %687 = bitcast i32 %467 to <2 x bfloat>
  %688 = extractelement <2 x bfloat> %687, i32 0
  %689 = extractelement <2 x bfloat> %687, i32 1
  %690 = bitcast i32 %479 to <2 x bfloat>
  %691 = extractelement <2 x bfloat> %690, i32 0
  %692 = extractelement <2 x bfloat> %690, i32 1
  %693 = bitcast i32 %480 to <2 x bfloat>
  %694 = extractelement <2 x bfloat> %693, i32 0
  %695 = extractelement <2 x bfloat> %693, i32 1
  %696 = bitcast i32 %481 to <2 x bfloat>
  %697 = extractelement <2 x bfloat> %696, i32 0
  %698 = extractelement <2 x bfloat> %696, i32 1
  %699 = bitcast i32 %482 to <2 x bfloat>
  %700 = extractelement <2 x bfloat> %699, i32 0
  %701 = extractelement <2 x bfloat> %699, i32 1
  %702 = bitcast i32 %494 to <2 x bfloat>
  %703 = extractelement <2 x bfloat> %702, i32 0
  %704 = extractelement <2 x bfloat> %702, i32 1
  %705 = bitcast i32 %495 to <2 x bfloat>
  %706 = extractelement <2 x bfloat> %705, i32 0
  %707 = extractelement <2 x bfloat> %705, i32 1
  %708 = bitcast i32 %496 to <2 x bfloat>
  %709 = extractelement <2 x bfloat> %708, i32 0
  %710 = extractelement <2 x bfloat> %708, i32 1
  %711 = bitcast i32 %497 to <2 x bfloat>
  %712 = extractelement <2 x bfloat> %711, i32 0
  %713 = extractelement <2 x bfloat> %711, i32 1
  %714 = bitcast i32 %509 to <2 x bfloat>
  %715 = extractelement <2 x bfloat> %714, i32 0
  %716 = extractelement <2 x bfloat> %714, i32 1
  %717 = bitcast i32 %510 to <2 x bfloat>
  %718 = extractelement <2 x bfloat> %717, i32 0
  %719 = extractelement <2 x bfloat> %717, i32 1
  %720 = bitcast i32 %511 to <2 x bfloat>
  %721 = extractelement <2 x bfloat> %720, i32 0
  %722 = extractelement <2 x bfloat> %720, i32 1
  %723 = bitcast i32 %512 to <2 x bfloat>
  %724 = extractelement <2 x bfloat> %723, i32 0
  %725 = extractelement <2 x bfloat> %723, i32 1
  %726 = bitcast i32 %524 to <2 x bfloat>
  %727 = extractelement <2 x bfloat> %726, i32 0
  %728 = extractelement <2 x bfloat> %726, i32 1
  %729 = bitcast i32 %525 to <2 x bfloat>
  %730 = extractelement <2 x bfloat> %729, i32 0
  %731 = extractelement <2 x bfloat> %729, i32 1
  %732 = bitcast i32 %526 to <2 x bfloat>
  %733 = extractelement <2 x bfloat> %732, i32 0
  %734 = extractelement <2 x bfloat> %732, i32 1
  %735 = bitcast i32 %527 to <2 x bfloat>
  %736 = extractelement <2 x bfloat> %735, i32 0
  %737 = extractelement <2 x bfloat> %735, i32 1
  %738 = bitcast i32 %539 to <2 x bfloat>
  %739 = extractelement <2 x bfloat> %738, i32 0
  %740 = extractelement <2 x bfloat> %738, i32 1
  %741 = bitcast i32 %540 to <2 x bfloat>
  %742 = extractelement <2 x bfloat> %741, i32 0
  %743 = extractelement <2 x bfloat> %741, i32 1
  %744 = bitcast i32 %541 to <2 x bfloat>
  %745 = extractelement <2 x bfloat> %744, i32 0
  %746 = extractelement <2 x bfloat> %744, i32 1
  %747 = bitcast i32 %542 to <2 x bfloat>
  %748 = extractelement <2 x bfloat> %747, i32 0
  %749 = extractelement <2 x bfloat> %747, i32 1
  %750 = bitcast i32 %554 to <2 x bfloat>
  %751 = extractelement <2 x bfloat> %750, i32 0
  %752 = extractelement <2 x bfloat> %750, i32 1
  %753 = bitcast i32 %555 to <2 x bfloat>
  %754 = extractelement <2 x bfloat> %753, i32 0
  %755 = extractelement <2 x bfloat> %753, i32 1
  %756 = bitcast i32 %556 to <2 x bfloat>
  %757 = extractelement <2 x bfloat> %756, i32 0
  %758 = extractelement <2 x bfloat> %756, i32 1
  %759 = bitcast i32 %557 to <2 x bfloat>
  %760 = extractelement <2 x bfloat> %759, i32 0
  %761 = extractelement <2 x bfloat> %759, i32 1
  %762 = bitcast i32 %569 to <2 x bfloat>
  %763 = extractelement <2 x bfloat> %762, i32 0
  %764 = extractelement <2 x bfloat> %762, i32 1
  %765 = bitcast i32 %570 to <2 x bfloat>
  %766 = extractelement <2 x bfloat> %765, i32 0
  %767 = extractelement <2 x bfloat> %765, i32 1
  %768 = bitcast i32 %571 to <2 x bfloat>
  %769 = extractelement <2 x bfloat> %768, i32 0
  %770 = extractelement <2 x bfloat> %768, i32 1
  %771 = bitcast i32 %572 to <2 x bfloat>
  %772 = extractelement <2 x bfloat> %771, i32 0
  %773 = extractelement <2 x bfloat> %771, i32 1
  %774 = bitcast i32 %584 to <2 x bfloat>
  %775 = extractelement <2 x bfloat> %774, i32 0
  %776 = extractelement <2 x bfloat> %774, i32 1
  %777 = bitcast i32 %585 to <2 x bfloat>
  %778 = extractelement <2 x bfloat> %777, i32 0
  %779 = extractelement <2 x bfloat> %777, i32 1
  %780 = bitcast i32 %586 to <2 x bfloat>
  %781 = extractelement <2 x bfloat> %780, i32 0
  %782 = extractelement <2 x bfloat> %780, i32 1
  %783 = bitcast i32 %587 to <2 x bfloat>
  %784 = extractelement <2 x bfloat> %783, i32 0
  %785 = extractelement <2 x bfloat> %783, i32 1
  %786 = bitcast i32 %599 to <2 x bfloat>
  %787 = extractelement <2 x bfloat> %786, i32 0
  %788 = extractelement <2 x bfloat> %786, i32 1
  %789 = bitcast i32 %600 to <2 x bfloat>
  %790 = extractelement <2 x bfloat> %789, i32 0
  %791 = extractelement <2 x bfloat> %789, i32 1
  %792 = bitcast i32 %601 to <2 x bfloat>
  %793 = extractelement <2 x bfloat> %792, i32 0
  %794 = extractelement <2 x bfloat> %792, i32 1
  %795 = bitcast i32 %602 to <2 x bfloat>
  %796 = extractelement <2 x bfloat> %795, i32 0
  %797 = extractelement <2 x bfloat> %795, i32 1
  %798 = bitcast i32 %614 to <2 x bfloat>
  %799 = extractelement <2 x bfloat> %798, i32 0
  %800 = extractelement <2 x bfloat> %798, i32 1
  %801 = bitcast i32 %615 to <2 x bfloat>
  %802 = extractelement <2 x bfloat> %801, i32 0
  %803 = extractelement <2 x bfloat> %801, i32 1
  %804 = bitcast i32 %616 to <2 x bfloat>
  %805 = extractelement <2 x bfloat> %804, i32 0
  %806 = extractelement <2 x bfloat> %804, i32 1
  %807 = bitcast i32 %617 to <2 x bfloat>
  %808 = extractelement <2 x bfloat> %807, i32 0
  %809 = extractelement <2 x bfloat> %807, i32 1
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
  %828 = insertelement <2 x bfloat> undef, bfloat %637, i32 0
  %829 = insertelement <2 x bfloat> %828, bfloat %638, i32 1
  %830 = bitcast <2 x bfloat> %829 to i32
  %831 = insertelement <2 x bfloat> undef, bfloat %640, i32 0
  %832 = insertelement <2 x bfloat> %831, bfloat %641, i32 1
  %833 = bitcast <2 x bfloat> %832 to i32
  %834 = insertelement <2 x bfloat> undef, bfloat %643, i32 0
  %835 = insertelement <2 x bfloat> %834, bfloat %644, i32 1
  %836 = bitcast <2 x bfloat> %835 to i32
  %837 = insertelement <2 x bfloat> undef, bfloat %646, i32 0
  %838 = insertelement <2 x bfloat> %837, bfloat %647, i32 1
  %839 = bitcast <2 x bfloat> %838 to i32
  %840 = insertelement <2 x bfloat> undef, bfloat %649, i32 0
  %841 = insertelement <2 x bfloat> %840, bfloat %650, i32 1
  %842 = bitcast <2 x bfloat> %841 to i32
  %843 = insertelement <2 x bfloat> undef, bfloat %652, i32 0
  %844 = insertelement <2 x bfloat> %843, bfloat %653, i32 1
  %845 = bitcast <2 x bfloat> %844 to i32
  %846 = insertelement <2 x bfloat> undef, bfloat %655, i32 0
  %847 = insertelement <2 x bfloat> %846, bfloat %656, i32 1
  %848 = bitcast <2 x bfloat> %847 to i32
  %849 = insertelement <2 x bfloat> undef, bfloat %658, i32 0
  %850 = insertelement <2 x bfloat> %849, bfloat %659, i32 1
  %851 = bitcast <2 x bfloat> %850 to i32
  %852 = insertelement <2 x bfloat> undef, bfloat %661, i32 0
  %853 = insertelement <2 x bfloat> %852, bfloat %662, i32 1
  %854 = bitcast <2 x bfloat> %853 to i32
  %855 = insertelement <2 x bfloat> undef, bfloat %664, i32 0
  %856 = insertelement <2 x bfloat> %855, bfloat %665, i32 1
  %857 = bitcast <2 x bfloat> %856 to i32
  %858 = insertelement <2 x bfloat> undef, bfloat %667, i32 0
  %859 = insertelement <2 x bfloat> %858, bfloat %668, i32 1
  %860 = bitcast <2 x bfloat> %859 to i32
  %861 = insertelement <2 x bfloat> undef, bfloat %670, i32 0
  %862 = insertelement <2 x bfloat> %861, bfloat %671, i32 1
  %863 = bitcast <2 x bfloat> %862 to i32
  %864 = insertelement <2 x bfloat> undef, bfloat %673, i32 0
  %865 = insertelement <2 x bfloat> %864, bfloat %674, i32 1
  %866 = bitcast <2 x bfloat> %865 to i32
  %867 = insertelement <2 x bfloat> undef, bfloat %676, i32 0
  %868 = insertelement <2 x bfloat> %867, bfloat %677, i32 1
  %869 = bitcast <2 x bfloat> %868 to i32
  %870 = insertelement <2 x bfloat> undef, bfloat %679, i32 0
  %871 = insertelement <2 x bfloat> %870, bfloat %680, i32 1
  %872 = bitcast <2 x bfloat> %871 to i32
  %873 = insertelement <2 x bfloat> undef, bfloat %682, i32 0
  %874 = insertelement <2 x bfloat> %873, bfloat %683, i32 1
  %875 = bitcast <2 x bfloat> %874 to i32
  %876 = insertelement <2 x bfloat> undef, bfloat %685, i32 0
  %877 = insertelement <2 x bfloat> %876, bfloat %686, i32 1
  %878 = bitcast <2 x bfloat> %877 to i32
  %879 = insertelement <2 x bfloat> undef, bfloat %688, i32 0
  %880 = insertelement <2 x bfloat> %879, bfloat %689, i32 1
  %881 = bitcast <2 x bfloat> %880 to i32
  %882 = insertelement <2 x bfloat> undef, bfloat %691, i32 0
  %883 = insertelement <2 x bfloat> %882, bfloat %692, i32 1
  %884 = bitcast <2 x bfloat> %883 to i32
  %885 = insertelement <2 x bfloat> undef, bfloat %694, i32 0
  %886 = insertelement <2 x bfloat> %885, bfloat %695, i32 1
  %887 = bitcast <2 x bfloat> %886 to i32
  %888 = insertelement <2 x bfloat> undef, bfloat %697, i32 0
  %889 = insertelement <2 x bfloat> %888, bfloat %698, i32 1
  %890 = bitcast <2 x bfloat> %889 to i32
  %891 = insertelement <2 x bfloat> undef, bfloat %700, i32 0
  %892 = insertelement <2 x bfloat> %891, bfloat %701, i32 1
  %893 = bitcast <2 x bfloat> %892 to i32
  %894 = insertelement <2 x bfloat> undef, bfloat %703, i32 0
  %895 = insertelement <2 x bfloat> %894, bfloat %704, i32 1
  %896 = bitcast <2 x bfloat> %895 to i32
  %897 = insertelement <2 x bfloat> undef, bfloat %706, i32 0
  %898 = insertelement <2 x bfloat> %897, bfloat %707, i32 1
  %899 = bitcast <2 x bfloat> %898 to i32
  %900 = insertelement <2 x bfloat> undef, bfloat %709, i32 0
  %901 = insertelement <2 x bfloat> %900, bfloat %710, i32 1
  %902 = bitcast <2 x bfloat> %901 to i32
  %903 = insertelement <2 x bfloat> undef, bfloat %712, i32 0
  %904 = insertelement <2 x bfloat> %903, bfloat %713, i32 1
  %905 = bitcast <2 x bfloat> %904 to i32
  %906 = insertelement <2 x bfloat> undef, bfloat %715, i32 0
  %907 = insertelement <2 x bfloat> %906, bfloat %716, i32 1
  %908 = bitcast <2 x bfloat> %907 to i32
  %909 = insertelement <2 x bfloat> undef, bfloat %718, i32 0
  %910 = insertelement <2 x bfloat> %909, bfloat %719, i32 1
  %911 = bitcast <2 x bfloat> %910 to i32
  %912 = insertelement <2 x bfloat> undef, bfloat %721, i32 0
  %913 = insertelement <2 x bfloat> %912, bfloat %722, i32 1
  %914 = bitcast <2 x bfloat> %913 to i32
  %915 = insertelement <2 x bfloat> undef, bfloat %724, i32 0
  %916 = insertelement <2 x bfloat> %915, bfloat %725, i32 1
  %917 = bitcast <2 x bfloat> %916 to i32
  %918 = insertelement <2 x bfloat> undef, bfloat %727, i32 0
  %919 = insertelement <2 x bfloat> %918, bfloat %728, i32 1
  %920 = bitcast <2 x bfloat> %919 to i32
  %921 = insertelement <2 x bfloat> undef, bfloat %730, i32 0
  %922 = insertelement <2 x bfloat> %921, bfloat %731, i32 1
  %923 = bitcast <2 x bfloat> %922 to i32
  %924 = insertelement <2 x bfloat> undef, bfloat %733, i32 0
  %925 = insertelement <2 x bfloat> %924, bfloat %734, i32 1
  %926 = bitcast <2 x bfloat> %925 to i32
  %927 = insertelement <2 x bfloat> undef, bfloat %736, i32 0
  %928 = insertelement <2 x bfloat> %927, bfloat %737, i32 1
  %929 = bitcast <2 x bfloat> %928 to i32
  %930 = insertelement <2 x bfloat> undef, bfloat %739, i32 0
  %931 = insertelement <2 x bfloat> %930, bfloat %740, i32 1
  %932 = bitcast <2 x bfloat> %931 to i32
  %933 = insertelement <2 x bfloat> undef, bfloat %742, i32 0
  %934 = insertelement <2 x bfloat> %933, bfloat %743, i32 1
  %935 = bitcast <2 x bfloat> %934 to i32
  %936 = insertelement <2 x bfloat> undef, bfloat %745, i32 0
  %937 = insertelement <2 x bfloat> %936, bfloat %746, i32 1
  %938 = bitcast <2 x bfloat> %937 to i32
  %939 = insertelement <2 x bfloat> undef, bfloat %748, i32 0
  %940 = insertelement <2 x bfloat> %939, bfloat %749, i32 1
  %941 = bitcast <2 x bfloat> %940 to i32
  %942 = insertelement <2 x bfloat> undef, bfloat %751, i32 0
  %943 = insertelement <2 x bfloat> %942, bfloat %752, i32 1
  %944 = bitcast <2 x bfloat> %943 to i32
  %945 = insertelement <2 x bfloat> undef, bfloat %754, i32 0
  %946 = insertelement <2 x bfloat> %945, bfloat %755, i32 1
  %947 = bitcast <2 x bfloat> %946 to i32
  %948 = insertelement <2 x bfloat> undef, bfloat %757, i32 0
  %949 = insertelement <2 x bfloat> %948, bfloat %758, i32 1
  %950 = bitcast <2 x bfloat> %949 to i32
  %951 = insertelement <2 x bfloat> undef, bfloat %760, i32 0
  %952 = insertelement <2 x bfloat> %951, bfloat %761, i32 1
  %953 = bitcast <2 x bfloat> %952 to i32
  %954 = insertelement <2 x bfloat> undef, bfloat %763, i32 0
  %955 = insertelement <2 x bfloat> %954, bfloat %764, i32 1
  %956 = bitcast <2 x bfloat> %955 to i32
  %957 = insertelement <2 x bfloat> undef, bfloat %766, i32 0
  %958 = insertelement <2 x bfloat> %957, bfloat %767, i32 1
  %959 = bitcast <2 x bfloat> %958 to i32
  %960 = insertelement <2 x bfloat> undef, bfloat %769, i32 0
  %961 = insertelement <2 x bfloat> %960, bfloat %770, i32 1
  %962 = bitcast <2 x bfloat> %961 to i32
  %963 = insertelement <2 x bfloat> undef, bfloat %772, i32 0
  %964 = insertelement <2 x bfloat> %963, bfloat %773, i32 1
  %965 = bitcast <2 x bfloat> %964 to i32
  %966 = insertelement <2 x bfloat> undef, bfloat %775, i32 0
  %967 = insertelement <2 x bfloat> %966, bfloat %776, i32 1
  %968 = bitcast <2 x bfloat> %967 to i32
  %969 = insertelement <2 x bfloat> undef, bfloat %778, i32 0
  %970 = insertelement <2 x bfloat> %969, bfloat %779, i32 1
  %971 = bitcast <2 x bfloat> %970 to i32
  %972 = insertelement <2 x bfloat> undef, bfloat %781, i32 0
  %973 = insertelement <2 x bfloat> %972, bfloat %782, i32 1
  %974 = bitcast <2 x bfloat> %973 to i32
  %975 = insertelement <2 x bfloat> undef, bfloat %784, i32 0
  %976 = insertelement <2 x bfloat> %975, bfloat %785, i32 1
  %977 = bitcast <2 x bfloat> %976 to i32
  %978 = insertelement <2 x bfloat> undef, bfloat %787, i32 0
  %979 = insertelement <2 x bfloat> %978, bfloat %788, i32 1
  %980 = bitcast <2 x bfloat> %979 to i32
  %981 = insertelement <2 x bfloat> undef, bfloat %790, i32 0
  %982 = insertelement <2 x bfloat> %981, bfloat %791, i32 1
  %983 = bitcast <2 x bfloat> %982 to i32
  %984 = insertelement <2 x bfloat> undef, bfloat %793, i32 0
  %985 = insertelement <2 x bfloat> %984, bfloat %794, i32 1
  %986 = bitcast <2 x bfloat> %985 to i32
  %987 = insertelement <2 x bfloat> undef, bfloat %796, i32 0
  %988 = insertelement <2 x bfloat> %987, bfloat %797, i32 1
  %989 = bitcast <2 x bfloat> %988 to i32
  %990 = insertelement <2 x bfloat> undef, bfloat %799, i32 0
  %991 = insertelement <2 x bfloat> %990, bfloat %800, i32 1
  %992 = bitcast <2 x bfloat> %991 to i32
  %993 = insertelement <2 x bfloat> undef, bfloat %802, i32 0
  %994 = insertelement <2 x bfloat> %993, bfloat %803, i32 1
  %995 = bitcast <2 x bfloat> %994 to i32
  %996 = insertelement <2 x bfloat> undef, bfloat %805, i32 0
  %997 = insertelement <2 x bfloat> %996, bfloat %806, i32 1
  %998 = bitcast <2 x bfloat> %997 to i32
  %999 = insertelement <2 x bfloat> undef, bfloat %808, i32 0
  %1000 = insertelement <2 x bfloat> %999, bfloat %809, i32 1
  %1001 = bitcast <2 x bfloat> %1000 to i32
  %1002 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 0
  %1003 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 1
  %1004 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 2
  %1005 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 3
  %1006 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 4
  %1007 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 5
  %1008 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 6
  %1009 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 7
  %1010 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 8
  %1011 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 9
  %1012 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 10
  %1013 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 11
  %1014 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 12
  %1015 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 13
  %1016 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 14
  %1017 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 15
  %1018 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 16
  %1019 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 17
  %1020 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 18
  %1021 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 19
  %1022 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 20
  %1023 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 21
  %1024 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 22
  %1025 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 23
  %1026 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 24
  %1027 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 25
  %1028 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 26
  %1029 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 27
  %1030 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 28
  %1031 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 29
  %1032 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 30
  %1033 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 31
  %1034 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 32
  %1035 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 33
  %1036 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 34
  %1037 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 35
  %1038 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 36
  %1039 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 37
  %1040 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 38
  %1041 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 39
  %1042 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 40
  %1043 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 41
  %1044 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 42
  %1045 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 43
  %1046 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 44
  %1047 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 45
  %1048 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 46
  %1049 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 47
  %1050 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 48
  %1051 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 49
  %1052 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 50
  %1053 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 51
  %1054 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 52
  %1055 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 53
  %1056 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 54
  %1057 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 55
  %1058 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 56
  %1059 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 57
  %1060 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 58
  %1061 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 59
  %1062 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 60
  %1063 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 61
  %1064 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 62
  %1065 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 63
  %1066 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1002, float %1003, float %1004, float %1005, i32 0, i32 0, i32 0, i32 0, i32 %812, i32 %815)
  %1067 = extractvalue { float, float, float, float } %1066, 0
  %1068 = extractvalue { float, float, float, float } %1066, 1
  %1069 = extractvalue { float, float, float, float } %1066, 2
  %1070 = extractvalue { float, float, float, float } %1066, 3
  %1071 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1006, float %1007, float %1008, float %1009, i32 0, i32 0, i32 0, i32 0, i32 %860, i32 %863)
  %1072 = extractvalue { float, float, float, float } %1071, 0
  %1073 = extractvalue { float, float, float, float } %1071, 1
  %1074 = extractvalue { float, float, float, float } %1071, 2
  %1075 = extractvalue { float, float, float, float } %1071, 3
  %1076 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1010, float %1011, float %1012, float %1013, i32 0, i32 0, i32 0, i32 0, i32 %908, i32 %911)
  %1077 = extractvalue { float, float, float, float } %1076, 0
  %1078 = extractvalue { float, float, float, float } %1076, 1
  %1079 = extractvalue { float, float, float, float } %1076, 2
  %1080 = extractvalue { float, float, float, float } %1076, 3
  %1081 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1014, float %1015, float %1016, float %1017, i32 0, i32 0, i32 0, i32 0, i32 %956, i32 %959)
  %1082 = extractvalue { float, float, float, float } %1081, 0
  %1083 = extractvalue { float, float, float, float } %1081, 1
  %1084 = extractvalue { float, float, float, float } %1081, 2
  %1085 = extractvalue { float, float, float, float } %1081, 3
  %1086 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1018, float %1019, float %1020, float %1021, i32 0, i32 0, i32 0, i32 0, i32 %812, i32 %815)
  %1087 = extractvalue { float, float, float, float } %1086, 0
  %1088 = extractvalue { float, float, float, float } %1086, 1
  %1089 = extractvalue { float, float, float, float } %1086, 2
  %1090 = extractvalue { float, float, float, float } %1086, 3
  %1091 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1022, float %1023, float %1024, float %1025, i32 0, i32 0, i32 0, i32 0, i32 %860, i32 %863)
  %1092 = extractvalue { float, float, float, float } %1091, 0
  %1093 = extractvalue { float, float, float, float } %1091, 1
  %1094 = extractvalue { float, float, float, float } %1091, 2
  %1095 = extractvalue { float, float, float, float } %1091, 3
  %1096 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1026, float %1027, float %1028, float %1029, i32 0, i32 0, i32 0, i32 0, i32 %908, i32 %911)
  %1097 = extractvalue { float, float, float, float } %1096, 0
  %1098 = extractvalue { float, float, float, float } %1096, 1
  %1099 = extractvalue { float, float, float, float } %1096, 2
  %1100 = extractvalue { float, float, float, float } %1096, 3
  %1101 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1030, float %1031, float %1032, float %1033, i32 0, i32 0, i32 0, i32 0, i32 %956, i32 %959)
  %1102 = extractvalue { float, float, float, float } %1101, 0
  %1103 = extractvalue { float, float, float, float } %1101, 1
  %1104 = extractvalue { float, float, float, float } %1101, 2
  %1105 = extractvalue { float, float, float, float } %1101, 3
  %1106 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1034, float %1035, float %1036, float %1037, i32 0, i32 0, i32 0, i32 0, i32 %812, i32 %815)
  %1107 = extractvalue { float, float, float, float } %1106, 0
  %1108 = extractvalue { float, float, float, float } %1106, 1
  %1109 = extractvalue { float, float, float, float } %1106, 2
  %1110 = extractvalue { float, float, float, float } %1106, 3
  %1111 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1038, float %1039, float %1040, float %1041, i32 0, i32 0, i32 0, i32 0, i32 %860, i32 %863)
  %1112 = extractvalue { float, float, float, float } %1111, 0
  %1113 = extractvalue { float, float, float, float } %1111, 1
  %1114 = extractvalue { float, float, float, float } %1111, 2
  %1115 = extractvalue { float, float, float, float } %1111, 3
  %1116 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1042, float %1043, float %1044, float %1045, i32 0, i32 0, i32 0, i32 0, i32 %908, i32 %911)
  %1117 = extractvalue { float, float, float, float } %1116, 0
  %1118 = extractvalue { float, float, float, float } %1116, 1
  %1119 = extractvalue { float, float, float, float } %1116, 2
  %1120 = extractvalue { float, float, float, float } %1116, 3
  %1121 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1046, float %1047, float %1048, float %1049, i32 0, i32 0, i32 0, i32 0, i32 %956, i32 %959)
  %1122 = extractvalue { float, float, float, float } %1121, 0
  %1123 = extractvalue { float, float, float, float } %1121, 1
  %1124 = extractvalue { float, float, float, float } %1121, 2
  %1125 = extractvalue { float, float, float, float } %1121, 3
  %1126 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1050, float %1051, float %1052, float %1053, i32 0, i32 0, i32 0, i32 0, i32 %812, i32 %815)
  %1127 = extractvalue { float, float, float, float } %1126, 0
  %1128 = extractvalue { float, float, float, float } %1126, 1
  %1129 = extractvalue { float, float, float, float } %1126, 2
  %1130 = extractvalue { float, float, float, float } %1126, 3
  %1131 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1054, float %1055, float %1056, float %1057, i32 0, i32 0, i32 0, i32 0, i32 %860, i32 %863)
  %1132 = extractvalue { float, float, float, float } %1131, 0
  %1133 = extractvalue { float, float, float, float } %1131, 1
  %1134 = extractvalue { float, float, float, float } %1131, 2
  %1135 = extractvalue { float, float, float, float } %1131, 3
  %1136 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1058, float %1059, float %1060, float %1061, i32 0, i32 0, i32 0, i32 0, i32 %908, i32 %911)
  %1137 = extractvalue { float, float, float, float } %1136, 0
  %1138 = extractvalue { float, float, float, float } %1136, 1
  %1139 = extractvalue { float, float, float, float } %1136, 2
  %1140 = extractvalue { float, float, float, float } %1136, 3
  %1141 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1062, float %1063, float %1064, float %1065, i32 0, i32 0, i32 0, i32 0, i32 %956, i32 %959)
  %1142 = extractvalue { float, float, float, float } %1141, 0
  %1143 = extractvalue { float, float, float, float } %1141, 1
  %1144 = extractvalue { float, float, float, float } %1141, 2
  %1145 = extractvalue { float, float, float, float } %1141, 3
  %1146 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1067, float %1068, float %1069, float %1070, i32 0, i32 0, i32 0, i32 0, i32 %818, i32 %821)
  %1147 = extractvalue { float, float, float, float } %1146, 0
  %1148 = extractvalue { float, float, float, float } %1146, 1
  %1149 = extractvalue { float, float, float, float } %1146, 2
  %1150 = extractvalue { float, float, float, float } %1146, 3
  %1151 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1072, float %1073, float %1074, float %1075, i32 0, i32 0, i32 0, i32 0, i32 %866, i32 %869)
  %1152 = extractvalue { float, float, float, float } %1151, 0
  %1153 = extractvalue { float, float, float, float } %1151, 1
  %1154 = extractvalue { float, float, float, float } %1151, 2
  %1155 = extractvalue { float, float, float, float } %1151, 3
  %1156 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1077, float %1078, float %1079, float %1080, i32 0, i32 0, i32 0, i32 0, i32 %914, i32 %917)
  %1157 = extractvalue { float, float, float, float } %1156, 0
  %1158 = extractvalue { float, float, float, float } %1156, 1
  %1159 = extractvalue { float, float, float, float } %1156, 2
  %1160 = extractvalue { float, float, float, float } %1156, 3
  %1161 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1082, float %1083, float %1084, float %1085, i32 0, i32 0, i32 0, i32 0, i32 %962, i32 %965)
  %1162 = extractvalue { float, float, float, float } %1161, 0
  %1163 = extractvalue { float, float, float, float } %1161, 1
  %1164 = extractvalue { float, float, float, float } %1161, 2
  %1165 = extractvalue { float, float, float, float } %1161, 3
  %1166 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1087, float %1088, float %1089, float %1090, i32 0, i32 0, i32 0, i32 0, i32 %818, i32 %821)
  %1167 = extractvalue { float, float, float, float } %1166, 0
  %1168 = extractvalue { float, float, float, float } %1166, 1
  %1169 = extractvalue { float, float, float, float } %1166, 2
  %1170 = extractvalue { float, float, float, float } %1166, 3
  %1171 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1092, float %1093, float %1094, float %1095, i32 0, i32 0, i32 0, i32 0, i32 %866, i32 %869)
  %1172 = extractvalue { float, float, float, float } %1171, 0
  %1173 = extractvalue { float, float, float, float } %1171, 1
  %1174 = extractvalue { float, float, float, float } %1171, 2
  %1175 = extractvalue { float, float, float, float } %1171, 3
  %1176 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1097, float %1098, float %1099, float %1100, i32 0, i32 0, i32 0, i32 0, i32 %914, i32 %917)
  %1177 = extractvalue { float, float, float, float } %1176, 0
  %1178 = extractvalue { float, float, float, float } %1176, 1
  %1179 = extractvalue { float, float, float, float } %1176, 2
  %1180 = extractvalue { float, float, float, float } %1176, 3
  %1181 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1102, float %1103, float %1104, float %1105, i32 0, i32 0, i32 0, i32 0, i32 %962, i32 %965)
  %1182 = extractvalue { float, float, float, float } %1181, 0
  %1183 = extractvalue { float, float, float, float } %1181, 1
  %1184 = extractvalue { float, float, float, float } %1181, 2
  %1185 = extractvalue { float, float, float, float } %1181, 3
  %1186 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1107, float %1108, float %1109, float %1110, i32 0, i32 0, i32 0, i32 0, i32 %818, i32 %821)
  %1187 = extractvalue { float, float, float, float } %1186, 0
  %1188 = extractvalue { float, float, float, float } %1186, 1
  %1189 = extractvalue { float, float, float, float } %1186, 2
  %1190 = extractvalue { float, float, float, float } %1186, 3
  %1191 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1112, float %1113, float %1114, float %1115, i32 0, i32 0, i32 0, i32 0, i32 %866, i32 %869)
  %1192 = extractvalue { float, float, float, float } %1191, 0
  %1193 = extractvalue { float, float, float, float } %1191, 1
  %1194 = extractvalue { float, float, float, float } %1191, 2
  %1195 = extractvalue { float, float, float, float } %1191, 3
  %1196 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1117, float %1118, float %1119, float %1120, i32 0, i32 0, i32 0, i32 0, i32 %914, i32 %917)
  %1197 = extractvalue { float, float, float, float } %1196, 0
  %1198 = extractvalue { float, float, float, float } %1196, 1
  %1199 = extractvalue { float, float, float, float } %1196, 2
  %1200 = extractvalue { float, float, float, float } %1196, 3
  %1201 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1122, float %1123, float %1124, float %1125, i32 0, i32 0, i32 0, i32 0, i32 %962, i32 %965)
  %1202 = extractvalue { float, float, float, float } %1201, 0
  %1203 = extractvalue { float, float, float, float } %1201, 1
  %1204 = extractvalue { float, float, float, float } %1201, 2
  %1205 = extractvalue { float, float, float, float } %1201, 3
  %1206 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1127, float %1128, float %1129, float %1130, i32 0, i32 0, i32 0, i32 0, i32 %818, i32 %821)
  %1207 = extractvalue { float, float, float, float } %1206, 0
  %1208 = extractvalue { float, float, float, float } %1206, 1
  %1209 = extractvalue { float, float, float, float } %1206, 2
  %1210 = extractvalue { float, float, float, float } %1206, 3
  %1211 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1132, float %1133, float %1134, float %1135, i32 0, i32 0, i32 0, i32 0, i32 %866, i32 %869)
  %1212 = extractvalue { float, float, float, float } %1211, 0
  %1213 = extractvalue { float, float, float, float } %1211, 1
  %1214 = extractvalue { float, float, float, float } %1211, 2
  %1215 = extractvalue { float, float, float, float } %1211, 3
  %1216 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1137, float %1138, float %1139, float %1140, i32 0, i32 0, i32 0, i32 0, i32 %914, i32 %917)
  %1217 = extractvalue { float, float, float, float } %1216, 0
  %1218 = extractvalue { float, float, float, float } %1216, 1
  %1219 = extractvalue { float, float, float, float } %1216, 2
  %1220 = extractvalue { float, float, float, float } %1216, 3
  %1221 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1142, float %1143, float %1144, float %1145, i32 0, i32 0, i32 0, i32 0, i32 %962, i32 %965)
  %1222 = extractvalue { float, float, float, float } %1221, 0
  %1223 = extractvalue { float, float, float, float } %1221, 1
  %1224 = extractvalue { float, float, float, float } %1221, 2
  %1225 = extractvalue { float, float, float, float } %1221, 3
  %1226 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1147, float %1148, float %1149, float %1150, i32 0, i32 0, i32 0, i32 0, i32 %824, i32 %827)
  %1227 = extractvalue { float, float, float, float } %1226, 0
  %1228 = extractvalue { float, float, float, float } %1226, 1
  %1229 = extractvalue { float, float, float, float } %1226, 2
  %1230 = extractvalue { float, float, float, float } %1226, 3
  %1231 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1152, float %1153, float %1154, float %1155, i32 0, i32 0, i32 0, i32 0, i32 %872, i32 %875)
  %1232 = extractvalue { float, float, float, float } %1231, 0
  %1233 = extractvalue { float, float, float, float } %1231, 1
  %1234 = extractvalue { float, float, float, float } %1231, 2
  %1235 = extractvalue { float, float, float, float } %1231, 3
  %1236 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1157, float %1158, float %1159, float %1160, i32 0, i32 0, i32 0, i32 0, i32 %920, i32 %923)
  %1237 = extractvalue { float, float, float, float } %1236, 0
  %1238 = extractvalue { float, float, float, float } %1236, 1
  %1239 = extractvalue { float, float, float, float } %1236, 2
  %1240 = extractvalue { float, float, float, float } %1236, 3
  %1241 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1162, float %1163, float %1164, float %1165, i32 0, i32 0, i32 0, i32 0, i32 %968, i32 %971)
  %1242 = extractvalue { float, float, float, float } %1241, 0
  %1243 = extractvalue { float, float, float, float } %1241, 1
  %1244 = extractvalue { float, float, float, float } %1241, 2
  %1245 = extractvalue { float, float, float, float } %1241, 3
  %1246 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1167, float %1168, float %1169, float %1170, i32 0, i32 0, i32 0, i32 0, i32 %824, i32 %827)
  %1247 = extractvalue { float, float, float, float } %1246, 0
  %1248 = extractvalue { float, float, float, float } %1246, 1
  %1249 = extractvalue { float, float, float, float } %1246, 2
  %1250 = extractvalue { float, float, float, float } %1246, 3
  %1251 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1172, float %1173, float %1174, float %1175, i32 0, i32 0, i32 0, i32 0, i32 %872, i32 %875)
  %1252 = extractvalue { float, float, float, float } %1251, 0
  %1253 = extractvalue { float, float, float, float } %1251, 1
  %1254 = extractvalue { float, float, float, float } %1251, 2
  %1255 = extractvalue { float, float, float, float } %1251, 3
  %1256 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1177, float %1178, float %1179, float %1180, i32 0, i32 0, i32 0, i32 0, i32 %920, i32 %923)
  %1257 = extractvalue { float, float, float, float } %1256, 0
  %1258 = extractvalue { float, float, float, float } %1256, 1
  %1259 = extractvalue { float, float, float, float } %1256, 2
  %1260 = extractvalue { float, float, float, float } %1256, 3
  %1261 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1182, float %1183, float %1184, float %1185, i32 0, i32 0, i32 0, i32 0, i32 %968, i32 %971)
  %1262 = extractvalue { float, float, float, float } %1261, 0
  %1263 = extractvalue { float, float, float, float } %1261, 1
  %1264 = extractvalue { float, float, float, float } %1261, 2
  %1265 = extractvalue { float, float, float, float } %1261, 3
  %1266 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1187, float %1188, float %1189, float %1190, i32 0, i32 0, i32 0, i32 0, i32 %824, i32 %827)
  %1267 = extractvalue { float, float, float, float } %1266, 0
  %1268 = extractvalue { float, float, float, float } %1266, 1
  %1269 = extractvalue { float, float, float, float } %1266, 2
  %1270 = extractvalue { float, float, float, float } %1266, 3
  %1271 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1192, float %1193, float %1194, float %1195, i32 0, i32 0, i32 0, i32 0, i32 %872, i32 %875)
  %1272 = extractvalue { float, float, float, float } %1271, 0
  %1273 = extractvalue { float, float, float, float } %1271, 1
  %1274 = extractvalue { float, float, float, float } %1271, 2
  %1275 = extractvalue { float, float, float, float } %1271, 3
  %1276 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1197, float %1198, float %1199, float %1200, i32 0, i32 0, i32 0, i32 0, i32 %920, i32 %923)
  %1277 = extractvalue { float, float, float, float } %1276, 0
  %1278 = extractvalue { float, float, float, float } %1276, 1
  %1279 = extractvalue { float, float, float, float } %1276, 2
  %1280 = extractvalue { float, float, float, float } %1276, 3
  %1281 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1202, float %1203, float %1204, float %1205, i32 0, i32 0, i32 0, i32 0, i32 %968, i32 %971)
  %1282 = extractvalue { float, float, float, float } %1281, 0
  %1283 = extractvalue { float, float, float, float } %1281, 1
  %1284 = extractvalue { float, float, float, float } %1281, 2
  %1285 = extractvalue { float, float, float, float } %1281, 3
  %1286 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1207, float %1208, float %1209, float %1210, i32 0, i32 0, i32 0, i32 0, i32 %824, i32 %827)
  %1287 = extractvalue { float, float, float, float } %1286, 0
  %1288 = extractvalue { float, float, float, float } %1286, 1
  %1289 = extractvalue { float, float, float, float } %1286, 2
  %1290 = extractvalue { float, float, float, float } %1286, 3
  %1291 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1212, float %1213, float %1214, float %1215, i32 0, i32 0, i32 0, i32 0, i32 %872, i32 %875)
  %1292 = extractvalue { float, float, float, float } %1291, 0
  %1293 = extractvalue { float, float, float, float } %1291, 1
  %1294 = extractvalue { float, float, float, float } %1291, 2
  %1295 = extractvalue { float, float, float, float } %1291, 3
  %1296 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1217, float %1218, float %1219, float %1220, i32 0, i32 0, i32 0, i32 0, i32 %920, i32 %923)
  %1297 = extractvalue { float, float, float, float } %1296, 0
  %1298 = extractvalue { float, float, float, float } %1296, 1
  %1299 = extractvalue { float, float, float, float } %1296, 2
  %1300 = extractvalue { float, float, float, float } %1296, 3
  %1301 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1222, float %1223, float %1224, float %1225, i32 0, i32 0, i32 0, i32 0, i32 %968, i32 %971)
  %1302 = extractvalue { float, float, float, float } %1301, 0
  %1303 = extractvalue { float, float, float, float } %1301, 1
  %1304 = extractvalue { float, float, float, float } %1301, 2
  %1305 = extractvalue { float, float, float, float } %1301, 3
  %1306 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1227, float %1228, float %1229, float %1230, i32 0, i32 0, i32 0, i32 0, i32 %830, i32 %833)
  %1307 = extractvalue { float, float, float, float } %1306, 0
  %1308 = extractvalue { float, float, float, float } %1306, 1
  %1309 = extractvalue { float, float, float, float } %1306, 2
  %1310 = extractvalue { float, float, float, float } %1306, 3
  %1311 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1232, float %1233, float %1234, float %1235, i32 0, i32 0, i32 0, i32 0, i32 %878, i32 %881)
  %1312 = extractvalue { float, float, float, float } %1311, 0
  %1313 = extractvalue { float, float, float, float } %1311, 1
  %1314 = extractvalue { float, float, float, float } %1311, 2
  %1315 = extractvalue { float, float, float, float } %1311, 3
  %1316 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1237, float %1238, float %1239, float %1240, i32 0, i32 0, i32 0, i32 0, i32 %926, i32 %929)
  %1317 = extractvalue { float, float, float, float } %1316, 0
  %1318 = extractvalue { float, float, float, float } %1316, 1
  %1319 = extractvalue { float, float, float, float } %1316, 2
  %1320 = extractvalue { float, float, float, float } %1316, 3
  %1321 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1242, float %1243, float %1244, float %1245, i32 0, i32 0, i32 0, i32 0, i32 %974, i32 %977)
  %1322 = extractvalue { float, float, float, float } %1321, 0
  %1323 = extractvalue { float, float, float, float } %1321, 1
  %1324 = extractvalue { float, float, float, float } %1321, 2
  %1325 = extractvalue { float, float, float, float } %1321, 3
  %1326 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1247, float %1248, float %1249, float %1250, i32 0, i32 0, i32 0, i32 0, i32 %830, i32 %833)
  %1327 = extractvalue { float, float, float, float } %1326, 0
  %1328 = extractvalue { float, float, float, float } %1326, 1
  %1329 = extractvalue { float, float, float, float } %1326, 2
  %1330 = extractvalue { float, float, float, float } %1326, 3
  %1331 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1252, float %1253, float %1254, float %1255, i32 0, i32 0, i32 0, i32 0, i32 %878, i32 %881)
  %1332 = extractvalue { float, float, float, float } %1331, 0
  %1333 = extractvalue { float, float, float, float } %1331, 1
  %1334 = extractvalue { float, float, float, float } %1331, 2
  %1335 = extractvalue { float, float, float, float } %1331, 3
  %1336 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1257, float %1258, float %1259, float %1260, i32 0, i32 0, i32 0, i32 0, i32 %926, i32 %929)
  %1337 = extractvalue { float, float, float, float } %1336, 0
  %1338 = extractvalue { float, float, float, float } %1336, 1
  %1339 = extractvalue { float, float, float, float } %1336, 2
  %1340 = extractvalue { float, float, float, float } %1336, 3
  %1341 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1262, float %1263, float %1264, float %1265, i32 0, i32 0, i32 0, i32 0, i32 %974, i32 %977)
  %1342 = extractvalue { float, float, float, float } %1341, 0
  %1343 = extractvalue { float, float, float, float } %1341, 1
  %1344 = extractvalue { float, float, float, float } %1341, 2
  %1345 = extractvalue { float, float, float, float } %1341, 3
  %1346 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1267, float %1268, float %1269, float %1270, i32 0, i32 0, i32 0, i32 0, i32 %830, i32 %833)
  %1347 = extractvalue { float, float, float, float } %1346, 0
  %1348 = extractvalue { float, float, float, float } %1346, 1
  %1349 = extractvalue { float, float, float, float } %1346, 2
  %1350 = extractvalue { float, float, float, float } %1346, 3
  %1351 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1272, float %1273, float %1274, float %1275, i32 0, i32 0, i32 0, i32 0, i32 %878, i32 %881)
  %1352 = extractvalue { float, float, float, float } %1351, 0
  %1353 = extractvalue { float, float, float, float } %1351, 1
  %1354 = extractvalue { float, float, float, float } %1351, 2
  %1355 = extractvalue { float, float, float, float } %1351, 3
  %1356 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1277, float %1278, float %1279, float %1280, i32 0, i32 0, i32 0, i32 0, i32 %926, i32 %929)
  %1357 = extractvalue { float, float, float, float } %1356, 0
  %1358 = extractvalue { float, float, float, float } %1356, 1
  %1359 = extractvalue { float, float, float, float } %1356, 2
  %1360 = extractvalue { float, float, float, float } %1356, 3
  %1361 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1282, float %1283, float %1284, float %1285, i32 0, i32 0, i32 0, i32 0, i32 %974, i32 %977)
  %1362 = extractvalue { float, float, float, float } %1361, 0
  %1363 = extractvalue { float, float, float, float } %1361, 1
  %1364 = extractvalue { float, float, float, float } %1361, 2
  %1365 = extractvalue { float, float, float, float } %1361, 3
  %1366 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1287, float %1288, float %1289, float %1290, i32 0, i32 0, i32 0, i32 0, i32 %830, i32 %833)
  %1367 = extractvalue { float, float, float, float } %1366, 0
  %1368 = extractvalue { float, float, float, float } %1366, 1
  %1369 = extractvalue { float, float, float, float } %1366, 2
  %1370 = extractvalue { float, float, float, float } %1366, 3
  %1371 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1292, float %1293, float %1294, float %1295, i32 0, i32 0, i32 0, i32 0, i32 %878, i32 %881)
  %1372 = extractvalue { float, float, float, float } %1371, 0
  %1373 = extractvalue { float, float, float, float } %1371, 1
  %1374 = extractvalue { float, float, float, float } %1371, 2
  %1375 = extractvalue { float, float, float, float } %1371, 3
  %1376 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1297, float %1298, float %1299, float %1300, i32 0, i32 0, i32 0, i32 0, i32 %926, i32 %929)
  %1377 = extractvalue { float, float, float, float } %1376, 0
  %1378 = extractvalue { float, float, float, float } %1376, 1
  %1379 = extractvalue { float, float, float, float } %1376, 2
  %1380 = extractvalue { float, float, float, float } %1376, 3
  %1381 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1302, float %1303, float %1304, float %1305, i32 0, i32 0, i32 0, i32 0, i32 %974, i32 %977)
  %1382 = extractvalue { float, float, float, float } %1381, 0
  %1383 = extractvalue { float, float, float, float } %1381, 1
  %1384 = extractvalue { float, float, float, float } %1381, 2
  %1385 = extractvalue { float, float, float, float } %1381, 3
  %1386 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1307, float %1308, float %1309, float %1310, i32 0, i32 0, i32 0, i32 0, i32 %836, i32 %839)
  %1387 = extractvalue { float, float, float, float } %1386, 0
  %1388 = extractvalue { float, float, float, float } %1386, 1
  %1389 = extractvalue { float, float, float, float } %1386, 2
  %1390 = extractvalue { float, float, float, float } %1386, 3
  %1391 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1312, float %1313, float %1314, float %1315, i32 0, i32 0, i32 0, i32 0, i32 %884, i32 %887)
  %1392 = extractvalue { float, float, float, float } %1391, 0
  %1393 = extractvalue { float, float, float, float } %1391, 1
  %1394 = extractvalue { float, float, float, float } %1391, 2
  %1395 = extractvalue { float, float, float, float } %1391, 3
  %1396 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1317, float %1318, float %1319, float %1320, i32 0, i32 0, i32 0, i32 0, i32 %932, i32 %935)
  %1397 = extractvalue { float, float, float, float } %1396, 0
  %1398 = extractvalue { float, float, float, float } %1396, 1
  %1399 = extractvalue { float, float, float, float } %1396, 2
  %1400 = extractvalue { float, float, float, float } %1396, 3
  %1401 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1322, float %1323, float %1324, float %1325, i32 0, i32 0, i32 0, i32 0, i32 %980, i32 %983)
  %1402 = extractvalue { float, float, float, float } %1401, 0
  %1403 = extractvalue { float, float, float, float } %1401, 1
  %1404 = extractvalue { float, float, float, float } %1401, 2
  %1405 = extractvalue { float, float, float, float } %1401, 3
  %1406 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1327, float %1328, float %1329, float %1330, i32 0, i32 0, i32 0, i32 0, i32 %836, i32 %839)
  %1407 = extractvalue { float, float, float, float } %1406, 0
  %1408 = extractvalue { float, float, float, float } %1406, 1
  %1409 = extractvalue { float, float, float, float } %1406, 2
  %1410 = extractvalue { float, float, float, float } %1406, 3
  %1411 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1332, float %1333, float %1334, float %1335, i32 0, i32 0, i32 0, i32 0, i32 %884, i32 %887)
  %1412 = extractvalue { float, float, float, float } %1411, 0
  %1413 = extractvalue { float, float, float, float } %1411, 1
  %1414 = extractvalue { float, float, float, float } %1411, 2
  %1415 = extractvalue { float, float, float, float } %1411, 3
  %1416 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1337, float %1338, float %1339, float %1340, i32 0, i32 0, i32 0, i32 0, i32 %932, i32 %935)
  %1417 = extractvalue { float, float, float, float } %1416, 0
  %1418 = extractvalue { float, float, float, float } %1416, 1
  %1419 = extractvalue { float, float, float, float } %1416, 2
  %1420 = extractvalue { float, float, float, float } %1416, 3
  %1421 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1342, float %1343, float %1344, float %1345, i32 0, i32 0, i32 0, i32 0, i32 %980, i32 %983)
  %1422 = extractvalue { float, float, float, float } %1421, 0
  %1423 = extractvalue { float, float, float, float } %1421, 1
  %1424 = extractvalue { float, float, float, float } %1421, 2
  %1425 = extractvalue { float, float, float, float } %1421, 3
  %1426 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1347, float %1348, float %1349, float %1350, i32 0, i32 0, i32 0, i32 0, i32 %836, i32 %839)
  %1427 = extractvalue { float, float, float, float } %1426, 0
  %1428 = extractvalue { float, float, float, float } %1426, 1
  %1429 = extractvalue { float, float, float, float } %1426, 2
  %1430 = extractvalue { float, float, float, float } %1426, 3
  %1431 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1352, float %1353, float %1354, float %1355, i32 0, i32 0, i32 0, i32 0, i32 %884, i32 %887)
  %1432 = extractvalue { float, float, float, float } %1431, 0
  %1433 = extractvalue { float, float, float, float } %1431, 1
  %1434 = extractvalue { float, float, float, float } %1431, 2
  %1435 = extractvalue { float, float, float, float } %1431, 3
  %1436 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1357, float %1358, float %1359, float %1360, i32 0, i32 0, i32 0, i32 0, i32 %932, i32 %935)
  %1437 = extractvalue { float, float, float, float } %1436, 0
  %1438 = extractvalue { float, float, float, float } %1436, 1
  %1439 = extractvalue { float, float, float, float } %1436, 2
  %1440 = extractvalue { float, float, float, float } %1436, 3
  %1441 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1362, float %1363, float %1364, float %1365, i32 0, i32 0, i32 0, i32 0, i32 %980, i32 %983)
  %1442 = extractvalue { float, float, float, float } %1441, 0
  %1443 = extractvalue { float, float, float, float } %1441, 1
  %1444 = extractvalue { float, float, float, float } %1441, 2
  %1445 = extractvalue { float, float, float, float } %1441, 3
  %1446 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1367, float %1368, float %1369, float %1370, i32 0, i32 0, i32 0, i32 0, i32 %836, i32 %839)
  %1447 = extractvalue { float, float, float, float } %1446, 0
  %1448 = extractvalue { float, float, float, float } %1446, 1
  %1449 = extractvalue { float, float, float, float } %1446, 2
  %1450 = extractvalue { float, float, float, float } %1446, 3
  %1451 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1372, float %1373, float %1374, float %1375, i32 0, i32 0, i32 0, i32 0, i32 %884, i32 %887)
  %1452 = extractvalue { float, float, float, float } %1451, 0
  %1453 = extractvalue { float, float, float, float } %1451, 1
  %1454 = extractvalue { float, float, float, float } %1451, 2
  %1455 = extractvalue { float, float, float, float } %1451, 3
  %1456 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1377, float %1378, float %1379, float %1380, i32 0, i32 0, i32 0, i32 0, i32 %932, i32 %935)
  %1457 = extractvalue { float, float, float, float } %1456, 0
  %1458 = extractvalue { float, float, float, float } %1456, 1
  %1459 = extractvalue { float, float, float, float } %1456, 2
  %1460 = extractvalue { float, float, float, float } %1456, 3
  %1461 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1382, float %1383, float %1384, float %1385, i32 0, i32 0, i32 0, i32 0, i32 %980, i32 %983)
  %1462 = extractvalue { float, float, float, float } %1461, 0
  %1463 = extractvalue { float, float, float, float } %1461, 1
  %1464 = extractvalue { float, float, float, float } %1461, 2
  %1465 = extractvalue { float, float, float, float } %1461, 3
  %1466 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1387, float %1388, float %1389, float %1390, i32 0, i32 0, i32 0, i32 0, i32 %842, i32 %845)
  %1467 = extractvalue { float, float, float, float } %1466, 0
  %1468 = extractvalue { float, float, float, float } %1466, 1
  %1469 = extractvalue { float, float, float, float } %1466, 2
  %1470 = extractvalue { float, float, float, float } %1466, 3
  %1471 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1392, float %1393, float %1394, float %1395, i32 0, i32 0, i32 0, i32 0, i32 %890, i32 %893)
  %1472 = extractvalue { float, float, float, float } %1471, 0
  %1473 = extractvalue { float, float, float, float } %1471, 1
  %1474 = extractvalue { float, float, float, float } %1471, 2
  %1475 = extractvalue { float, float, float, float } %1471, 3
  %1476 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1397, float %1398, float %1399, float %1400, i32 0, i32 0, i32 0, i32 0, i32 %938, i32 %941)
  %1477 = extractvalue { float, float, float, float } %1476, 0
  %1478 = extractvalue { float, float, float, float } %1476, 1
  %1479 = extractvalue { float, float, float, float } %1476, 2
  %1480 = extractvalue { float, float, float, float } %1476, 3
  %1481 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1402, float %1403, float %1404, float %1405, i32 0, i32 0, i32 0, i32 0, i32 %986, i32 %989)
  %1482 = extractvalue { float, float, float, float } %1481, 0
  %1483 = extractvalue { float, float, float, float } %1481, 1
  %1484 = extractvalue { float, float, float, float } %1481, 2
  %1485 = extractvalue { float, float, float, float } %1481, 3
  %1486 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1407, float %1408, float %1409, float %1410, i32 0, i32 0, i32 0, i32 0, i32 %842, i32 %845)
  %1487 = extractvalue { float, float, float, float } %1486, 0
  %1488 = extractvalue { float, float, float, float } %1486, 1
  %1489 = extractvalue { float, float, float, float } %1486, 2
  %1490 = extractvalue { float, float, float, float } %1486, 3
  %1491 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1412, float %1413, float %1414, float %1415, i32 0, i32 0, i32 0, i32 0, i32 %890, i32 %893)
  %1492 = extractvalue { float, float, float, float } %1491, 0
  %1493 = extractvalue { float, float, float, float } %1491, 1
  %1494 = extractvalue { float, float, float, float } %1491, 2
  %1495 = extractvalue { float, float, float, float } %1491, 3
  %1496 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1417, float %1418, float %1419, float %1420, i32 0, i32 0, i32 0, i32 0, i32 %938, i32 %941)
  %1497 = extractvalue { float, float, float, float } %1496, 0
  %1498 = extractvalue { float, float, float, float } %1496, 1
  %1499 = extractvalue { float, float, float, float } %1496, 2
  %1500 = extractvalue { float, float, float, float } %1496, 3
  %1501 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1422, float %1423, float %1424, float %1425, i32 0, i32 0, i32 0, i32 0, i32 %986, i32 %989)
  %1502 = extractvalue { float, float, float, float } %1501, 0
  %1503 = extractvalue { float, float, float, float } %1501, 1
  %1504 = extractvalue { float, float, float, float } %1501, 2
  %1505 = extractvalue { float, float, float, float } %1501, 3
  %1506 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1427, float %1428, float %1429, float %1430, i32 0, i32 0, i32 0, i32 0, i32 %842, i32 %845)
  %1507 = extractvalue { float, float, float, float } %1506, 0
  %1508 = extractvalue { float, float, float, float } %1506, 1
  %1509 = extractvalue { float, float, float, float } %1506, 2
  %1510 = extractvalue { float, float, float, float } %1506, 3
  %1511 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1432, float %1433, float %1434, float %1435, i32 0, i32 0, i32 0, i32 0, i32 %890, i32 %893)
  %1512 = extractvalue { float, float, float, float } %1511, 0
  %1513 = extractvalue { float, float, float, float } %1511, 1
  %1514 = extractvalue { float, float, float, float } %1511, 2
  %1515 = extractvalue { float, float, float, float } %1511, 3
  %1516 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1437, float %1438, float %1439, float %1440, i32 0, i32 0, i32 0, i32 0, i32 %938, i32 %941)
  %1517 = extractvalue { float, float, float, float } %1516, 0
  %1518 = extractvalue { float, float, float, float } %1516, 1
  %1519 = extractvalue { float, float, float, float } %1516, 2
  %1520 = extractvalue { float, float, float, float } %1516, 3
  %1521 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1442, float %1443, float %1444, float %1445, i32 0, i32 0, i32 0, i32 0, i32 %986, i32 %989)
  %1522 = extractvalue { float, float, float, float } %1521, 0
  %1523 = extractvalue { float, float, float, float } %1521, 1
  %1524 = extractvalue { float, float, float, float } %1521, 2
  %1525 = extractvalue { float, float, float, float } %1521, 3
  %1526 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1447, float %1448, float %1449, float %1450, i32 0, i32 0, i32 0, i32 0, i32 %842, i32 %845)
  %1527 = extractvalue { float, float, float, float } %1526, 0
  %1528 = extractvalue { float, float, float, float } %1526, 1
  %1529 = extractvalue { float, float, float, float } %1526, 2
  %1530 = extractvalue { float, float, float, float } %1526, 3
  %1531 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1452, float %1453, float %1454, float %1455, i32 0, i32 0, i32 0, i32 0, i32 %890, i32 %893)
  %1532 = extractvalue { float, float, float, float } %1531, 0
  %1533 = extractvalue { float, float, float, float } %1531, 1
  %1534 = extractvalue { float, float, float, float } %1531, 2
  %1535 = extractvalue { float, float, float, float } %1531, 3
  %1536 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1457, float %1458, float %1459, float %1460, i32 0, i32 0, i32 0, i32 0, i32 %938, i32 %941)
  %1537 = extractvalue { float, float, float, float } %1536, 0
  %1538 = extractvalue { float, float, float, float } %1536, 1
  %1539 = extractvalue { float, float, float, float } %1536, 2
  %1540 = extractvalue { float, float, float, float } %1536, 3
  %1541 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1462, float %1463, float %1464, float %1465, i32 0, i32 0, i32 0, i32 0, i32 %986, i32 %989)
  %1542 = extractvalue { float, float, float, float } %1541, 0
  %1543 = extractvalue { float, float, float, float } %1541, 1
  %1544 = extractvalue { float, float, float, float } %1541, 2
  %1545 = extractvalue { float, float, float, float } %1541, 3
  %1546 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1467, float %1468, float %1469, float %1470, i32 0, i32 0, i32 0, i32 0, i32 %848, i32 %851)
  %1547 = extractvalue { float, float, float, float } %1546, 0
  %1548 = extractvalue { float, float, float, float } %1546, 1
  %1549 = extractvalue { float, float, float, float } %1546, 2
  %1550 = extractvalue { float, float, float, float } %1546, 3
  %1551 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1472, float %1473, float %1474, float %1475, i32 0, i32 0, i32 0, i32 0, i32 %896, i32 %899)
  %1552 = extractvalue { float, float, float, float } %1551, 0
  %1553 = extractvalue { float, float, float, float } %1551, 1
  %1554 = extractvalue { float, float, float, float } %1551, 2
  %1555 = extractvalue { float, float, float, float } %1551, 3
  %1556 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1477, float %1478, float %1479, float %1480, i32 0, i32 0, i32 0, i32 0, i32 %944, i32 %947)
  %1557 = extractvalue { float, float, float, float } %1556, 0
  %1558 = extractvalue { float, float, float, float } %1556, 1
  %1559 = extractvalue { float, float, float, float } %1556, 2
  %1560 = extractvalue { float, float, float, float } %1556, 3
  %1561 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1482, float %1483, float %1484, float %1485, i32 0, i32 0, i32 0, i32 0, i32 %992, i32 %995)
  %1562 = extractvalue { float, float, float, float } %1561, 0
  %1563 = extractvalue { float, float, float, float } %1561, 1
  %1564 = extractvalue { float, float, float, float } %1561, 2
  %1565 = extractvalue { float, float, float, float } %1561, 3
  %1566 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1487, float %1488, float %1489, float %1490, i32 0, i32 0, i32 0, i32 0, i32 %848, i32 %851)
  %1567 = extractvalue { float, float, float, float } %1566, 0
  %1568 = extractvalue { float, float, float, float } %1566, 1
  %1569 = extractvalue { float, float, float, float } %1566, 2
  %1570 = extractvalue { float, float, float, float } %1566, 3
  %1571 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1492, float %1493, float %1494, float %1495, i32 0, i32 0, i32 0, i32 0, i32 %896, i32 %899)
  %1572 = extractvalue { float, float, float, float } %1571, 0
  %1573 = extractvalue { float, float, float, float } %1571, 1
  %1574 = extractvalue { float, float, float, float } %1571, 2
  %1575 = extractvalue { float, float, float, float } %1571, 3
  %1576 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1497, float %1498, float %1499, float %1500, i32 0, i32 0, i32 0, i32 0, i32 %944, i32 %947)
  %1577 = extractvalue { float, float, float, float } %1576, 0
  %1578 = extractvalue { float, float, float, float } %1576, 1
  %1579 = extractvalue { float, float, float, float } %1576, 2
  %1580 = extractvalue { float, float, float, float } %1576, 3
  %1581 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1502, float %1503, float %1504, float %1505, i32 0, i32 0, i32 0, i32 0, i32 %992, i32 %995)
  %1582 = extractvalue { float, float, float, float } %1581, 0
  %1583 = extractvalue { float, float, float, float } %1581, 1
  %1584 = extractvalue { float, float, float, float } %1581, 2
  %1585 = extractvalue { float, float, float, float } %1581, 3
  %1586 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1507, float %1508, float %1509, float %1510, i32 0, i32 0, i32 0, i32 0, i32 %848, i32 %851)
  %1587 = extractvalue { float, float, float, float } %1586, 0
  %1588 = extractvalue { float, float, float, float } %1586, 1
  %1589 = extractvalue { float, float, float, float } %1586, 2
  %1590 = extractvalue { float, float, float, float } %1586, 3
  %1591 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1512, float %1513, float %1514, float %1515, i32 0, i32 0, i32 0, i32 0, i32 %896, i32 %899)
  %1592 = extractvalue { float, float, float, float } %1591, 0
  %1593 = extractvalue { float, float, float, float } %1591, 1
  %1594 = extractvalue { float, float, float, float } %1591, 2
  %1595 = extractvalue { float, float, float, float } %1591, 3
  %1596 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1517, float %1518, float %1519, float %1520, i32 0, i32 0, i32 0, i32 0, i32 %944, i32 %947)
  %1597 = extractvalue { float, float, float, float } %1596, 0
  %1598 = extractvalue { float, float, float, float } %1596, 1
  %1599 = extractvalue { float, float, float, float } %1596, 2
  %1600 = extractvalue { float, float, float, float } %1596, 3
  %1601 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1522, float %1523, float %1524, float %1525, i32 0, i32 0, i32 0, i32 0, i32 %992, i32 %995)
  %1602 = extractvalue { float, float, float, float } %1601, 0
  %1603 = extractvalue { float, float, float, float } %1601, 1
  %1604 = extractvalue { float, float, float, float } %1601, 2
  %1605 = extractvalue { float, float, float, float } %1601, 3
  %1606 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1527, float %1528, float %1529, float %1530, i32 0, i32 0, i32 0, i32 0, i32 %848, i32 %851)
  %1607 = extractvalue { float, float, float, float } %1606, 0
  %1608 = extractvalue { float, float, float, float } %1606, 1
  %1609 = extractvalue { float, float, float, float } %1606, 2
  %1610 = extractvalue { float, float, float, float } %1606, 3
  %1611 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1532, float %1533, float %1534, float %1535, i32 0, i32 0, i32 0, i32 0, i32 %896, i32 %899)
  %1612 = extractvalue { float, float, float, float } %1611, 0
  %1613 = extractvalue { float, float, float, float } %1611, 1
  %1614 = extractvalue { float, float, float, float } %1611, 2
  %1615 = extractvalue { float, float, float, float } %1611, 3
  %1616 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1537, float %1538, float %1539, float %1540, i32 0, i32 0, i32 0, i32 0, i32 %944, i32 %947)
  %1617 = extractvalue { float, float, float, float } %1616, 0
  %1618 = extractvalue { float, float, float, float } %1616, 1
  %1619 = extractvalue { float, float, float, float } %1616, 2
  %1620 = extractvalue { float, float, float, float } %1616, 3
  %1621 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1542, float %1543, float %1544, float %1545, i32 0, i32 0, i32 0, i32 0, i32 %992, i32 %995)
  %1622 = extractvalue { float, float, float, float } %1621, 0
  %1623 = extractvalue { float, float, float, float } %1621, 1
  %1624 = extractvalue { float, float, float, float } %1621, 2
  %1625 = extractvalue { float, float, float, float } %1621, 3
  %1626 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1547, float %1548, float %1549, float %1550, i32 0, i32 0, i32 0, i32 0, i32 %854, i32 %857)
  %1627 = extractvalue { float, float, float, float } %1626, 0
  %1628 = extractvalue { float, float, float, float } %1626, 1
  %1629 = extractvalue { float, float, float, float } %1626, 2
  %1630 = extractvalue { float, float, float, float } %1626, 3
  %1631 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1552, float %1553, float %1554, float %1555, i32 0, i32 0, i32 0, i32 0, i32 %902, i32 %905)
  %1632 = extractvalue { float, float, float, float } %1631, 0
  %1633 = extractvalue { float, float, float, float } %1631, 1
  %1634 = extractvalue { float, float, float, float } %1631, 2
  %1635 = extractvalue { float, float, float, float } %1631, 3
  %1636 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1557, float %1558, float %1559, float %1560, i32 0, i32 0, i32 0, i32 0, i32 %950, i32 %953)
  %1637 = extractvalue { float, float, float, float } %1636, 0
  %1638 = extractvalue { float, float, float, float } %1636, 1
  %1639 = extractvalue { float, float, float, float } %1636, 2
  %1640 = extractvalue { float, float, float, float } %1636, 3
  %1641 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1562, float %1563, float %1564, float %1565, i32 0, i32 0, i32 0, i32 0, i32 %998, i32 %1001)
  %1642 = extractvalue { float, float, float, float } %1641, 0
  %1643 = extractvalue { float, float, float, float } %1641, 1
  %1644 = extractvalue { float, float, float, float } %1641, 2
  %1645 = extractvalue { float, float, float, float } %1641, 3
  %1646 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1567, float %1568, float %1569, float %1570, i32 0, i32 0, i32 0, i32 0, i32 %854, i32 %857)
  %1647 = extractvalue { float, float, float, float } %1646, 0
  %1648 = extractvalue { float, float, float, float } %1646, 1
  %1649 = extractvalue { float, float, float, float } %1646, 2
  %1650 = extractvalue { float, float, float, float } %1646, 3
  %1651 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1572, float %1573, float %1574, float %1575, i32 0, i32 0, i32 0, i32 0, i32 %902, i32 %905)
  %1652 = extractvalue { float, float, float, float } %1651, 0
  %1653 = extractvalue { float, float, float, float } %1651, 1
  %1654 = extractvalue { float, float, float, float } %1651, 2
  %1655 = extractvalue { float, float, float, float } %1651, 3
  %1656 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1577, float %1578, float %1579, float %1580, i32 0, i32 0, i32 0, i32 0, i32 %950, i32 %953)
  %1657 = extractvalue { float, float, float, float } %1656, 0
  %1658 = extractvalue { float, float, float, float } %1656, 1
  %1659 = extractvalue { float, float, float, float } %1656, 2
  %1660 = extractvalue { float, float, float, float } %1656, 3
  %1661 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1582, float %1583, float %1584, float %1585, i32 0, i32 0, i32 0, i32 0, i32 %998, i32 %1001)
  %1662 = extractvalue { float, float, float, float } %1661, 0
  %1663 = extractvalue { float, float, float, float } %1661, 1
  %1664 = extractvalue { float, float, float, float } %1661, 2
  %1665 = extractvalue { float, float, float, float } %1661, 3
  %1666 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1587, float %1588, float %1589, float %1590, i32 0, i32 0, i32 0, i32 0, i32 %854, i32 %857)
  %1667 = extractvalue { float, float, float, float } %1666, 0
  %1668 = extractvalue { float, float, float, float } %1666, 1
  %1669 = extractvalue { float, float, float, float } %1666, 2
  %1670 = extractvalue { float, float, float, float } %1666, 3
  %1671 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1592, float %1593, float %1594, float %1595, i32 0, i32 0, i32 0, i32 0, i32 %902, i32 %905)
  %1672 = extractvalue { float, float, float, float } %1671, 0
  %1673 = extractvalue { float, float, float, float } %1671, 1
  %1674 = extractvalue { float, float, float, float } %1671, 2
  %1675 = extractvalue { float, float, float, float } %1671, 3
  %1676 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1597, float %1598, float %1599, float %1600, i32 0, i32 0, i32 0, i32 0, i32 %950, i32 %953)
  %1677 = extractvalue { float, float, float, float } %1676, 0
  %1678 = extractvalue { float, float, float, float } %1676, 1
  %1679 = extractvalue { float, float, float, float } %1676, 2
  %1680 = extractvalue { float, float, float, float } %1676, 3
  %1681 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1602, float %1603, float %1604, float %1605, i32 0, i32 0, i32 0, i32 0, i32 %998, i32 %1001)
  %1682 = extractvalue { float, float, float, float } %1681, 0
  %1683 = extractvalue { float, float, float, float } %1681, 1
  %1684 = extractvalue { float, float, float, float } %1681, 2
  %1685 = extractvalue { float, float, float, float } %1681, 3
  %1686 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1607, float %1608, float %1609, float %1610, i32 0, i32 0, i32 0, i32 0, i32 %854, i32 %857)
  %1687 = extractvalue { float, float, float, float } %1686, 0
  %1688 = extractvalue { float, float, float, float } %1686, 1
  %1689 = extractvalue { float, float, float, float } %1686, 2
  %1690 = extractvalue { float, float, float, float } %1686, 3
  %1691 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1612, float %1613, float %1614, float %1615, i32 0, i32 0, i32 0, i32 0, i32 %902, i32 %905)
  %1692 = extractvalue { float, float, float, float } %1691, 0
  %1693 = extractvalue { float, float, float, float } %1691, 1
  %1694 = extractvalue { float, float, float, float } %1691, 2
  %1695 = extractvalue { float, float, float, float } %1691, 3
  %1696 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1617, float %1618, float %1619, float %1620, i32 0, i32 0, i32 0, i32 0, i32 %950, i32 %953)
  %1697 = extractvalue { float, float, float, float } %1696, 0
  %1698 = extractvalue { float, float, float, float } %1696, 1
  %1699 = extractvalue { float, float, float, float } %1696, 2
  %1700 = extractvalue { float, float, float, float } %1696, 3
  %1701 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1622, float %1623, float %1624, float %1625, i32 0, i32 0, i32 0, i32 0, i32 %998, i32 %1001)
  %1702 = extractvalue { float, float, float, float } %1701, 0
  %1703 = extractvalue { float, float, float, float } %1701, 1
  %1704 = extractvalue { float, float, float, float } %1701, 2
  %1705 = extractvalue { float, float, float, float } %1701, 3
  %1706 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } undef, float %1627, 0
  %1707 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1706, float %1628, 1
  %1708 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1707, float %1629, 2
  %1709 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1708, float %1630, 3
  %1710 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1709, float %1632, 4
  %1711 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1710, float %1633, 5
  %1712 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1711, float %1634, 6
  %1713 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1712, float %1635, 7
  %1714 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1713, float %1637, 8
  %1715 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1714, float %1638, 9
  %1716 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1715, float %1639, 10
  %1717 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1716, float %1640, 11
  %1718 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1717, float %1642, 12
  %1719 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1718, float %1643, 13
  %1720 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1719, float %1644, 14
  %1721 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1720, float %1645, 15
  %1722 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1721, float %1647, 16
  %1723 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1722, float %1648, 17
  %1724 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1723, float %1649, 18
  %1725 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1724, float %1650, 19
  %1726 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1725, float %1652, 20
  %1727 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1726, float %1653, 21
  %1728 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1727, float %1654, 22
  %1729 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1728, float %1655, 23
  %1730 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1729, float %1657, 24
  %1731 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1730, float %1658, 25
  %1732 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1731, float %1659, 26
  %1733 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1732, float %1660, 27
  %1734 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1733, float %1662, 28
  %1735 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1734, float %1663, 29
  %1736 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1735, float %1664, 30
  %1737 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1736, float %1665, 31
  %1738 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1737, float %1667, 32
  %1739 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1738, float %1668, 33
  %1740 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1739, float %1669, 34
  %1741 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1740, float %1670, 35
  %1742 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1741, float %1672, 36
  %1743 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1742, float %1673, 37
  %1744 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1743, float %1674, 38
  %1745 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1744, float %1675, 39
  %1746 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1745, float %1677, 40
  %1747 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1746, float %1678, 41
  %1748 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1747, float %1679, 42
  %1749 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1748, float %1680, 43
  %1750 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1749, float %1682, 44
  %1751 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1750, float %1683, 45
  %1752 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1751, float %1684, 46
  %1753 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1752, float %1685, 47
  %1754 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1753, float %1687, 48
  %1755 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1754, float %1688, 49
  %1756 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1755, float %1689, 50
  %1757 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1756, float %1690, 51
  %1758 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1757, float %1692, 52
  %1759 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1758, float %1693, 53
  %1760 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1759, float %1694, 54
  %1761 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1760, float %1695, 55
  %1762 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1761, float %1697, 56
  %1763 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1762, float %1698, 57
  %1764 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1763, float %1699, 58
  %1765 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1764, float %1700, 59
  %1766 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1765, float %1702, 60
  %1767 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1766, float %1703, 61
  %1768 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1767, float %1704, 62
  %1769 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1768, float %1705, 63
  %1770 = add i64 %361, 128
  %1771 = add i32 %363, 1
  %1772 = icmp slt i32 %1771, 2
  %1773 = select i1 %1772, i32 %1771, i32 0
  %1774 = add i64 %1770, %36
  %1775 = add i64 %1774, %118
  %1776 = add i64 %1774, %119
  %1777 = add i64 %1774, %120
  %1778 = add i64 %1774, %121
  %1779 = add i64 %1774, %122
  %1780 = add i64 %1774, %123
  %1781 = add i64 %1774, %124
  %1782 = add i64 %1774, %125
  %1783 = add i64 %1774, %126
  %1784 = add i64 %1774, %127
  %1785 = add i64 %1774, %128
  %1786 = add i64 %1774, %129
  %1787 = add i64 %1774, %130
  %1788 = add i64 %1774, %131
  %1789 = add i64 %1774, %132
  %1790 = add i64 %1774, %133
  %1791 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1775
  %1792 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1776
  %1793 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1777
  %1794 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1778
  %1795 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1779
  %1796 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1780
  %1797 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1781
  %1798 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1782
  %1799 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1783
  %1800 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1784
  %1801 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1785
  %1802 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1786
  %1803 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1787
  %1804 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1788
  %1805 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1789
  %1806 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1790
  %1807 = mul i32 %1773, 32768
  %1808 = add i32 %1807, 0
  %1809 = add i32 %1808, 0
  %1810 = add i32 %1809, 0
  %1811 = getelementptr bfloat, ptr addrspace(3) @global_smem, i32 %1810
  call void @llvm.nvvm.barrier0()
  %1812 = getelementptr inbounds bfloat, ptr addrspace(3) %1811, i32 %173
  %1813 = getelementptr inbounds bfloat, ptr addrspace(3) %1811, i32 %182
  %1814 = getelementptr inbounds bfloat, ptr addrspace(3) %1811, i32 %191
  %1815 = getelementptr inbounds bfloat, ptr addrspace(3) %1811, i32 %200
  %1816 = getelementptr inbounds bfloat, ptr addrspace(3) %1811, i32 %209
  %1817 = getelementptr inbounds bfloat, ptr addrspace(3) %1811, i32 %218
  %1818 = getelementptr inbounds bfloat, ptr addrspace(3) %1811, i32 %227
  %1819 = getelementptr inbounds bfloat, ptr addrspace(3) %1811, i32 %236
  %1820 = getelementptr inbounds bfloat, ptr addrspace(3) %1811, i32 %245
  %1821 = getelementptr inbounds bfloat, ptr addrspace(3) %1811, i32 %254
  %1822 = getelementptr inbounds bfloat, ptr addrspace(3) %1811, i32 %263
  %1823 = getelementptr inbounds bfloat, ptr addrspace(3) %1811, i32 %272
  %1824 = getelementptr inbounds bfloat, ptr addrspace(3) %1811, i32 %281
  %1825 = getelementptr inbounds bfloat, ptr addrspace(3) %1811, i32 %290
  %1826 = getelementptr inbounds bfloat, ptr addrspace(3) %1811, i32 %299
  %1827 = getelementptr inbounds bfloat, ptr addrspace(3) %1811, i32 %308
  %1828 = select i1 %368, i32 16, i32 0
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1812, ptr addrspace(1) %1791, i32 %1828)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1813, ptr addrspace(1) %1792, i32 %1828)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1814, ptr addrspace(1) %1793, i32 %1828)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1815, ptr addrspace(1) %1794, i32 %1828)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1816, ptr addrspace(1) %1795, i32 %1828)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1817, ptr addrspace(1) %1796, i32 %1828)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1818, ptr addrspace(1) %1797, i32 %1828)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1819, ptr addrspace(1) %1798, i32 %1828)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1820, ptr addrspace(1) %1799, i32 %1828)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1821, ptr addrspace(1) %1800, i32 %1828)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1822, ptr addrspace(1) %1801, i32 %1828)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1823, ptr addrspace(1) %1802, i32 %1828)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1824, ptr addrspace(1) %1803, i32 %1828)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1825, ptr addrspace(1) %1804, i32 %1828)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1826, ptr addrspace(1) %1805, i32 %1828)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1827, ptr addrspace(1) %1806, i32 %1828)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  %1829 = add i32 %364, 1
  %1830 = icmp slt i32 %1829, 2
  %1831 = select i1 %1830, i32 %1829, i32 0
  call void asm sideeffect "cp.async.wait_group 0x1;", ""()
  call void @llvm.nvvm.barrier0()
  %1832 = mul i32 %1831, 32768
  %1833 = add i32 %1832, 0
  %1834 = add i32 %1833, 0
  %1835 = add i32 %1834, 0
  %1836 = getelementptr bfloat, ptr addrspace(3) @global_smem, i32 %1835
  %1837 = insertvalue { ptr addrspace(3), i32, i32 } undef, ptr addrspace(3) %1836, 0
  %1838 = insertvalue { ptr addrspace(3), i32, i32 } %1837, i32 0, 1
  %1839 = insertvalue { ptr addrspace(3), i32, i32 } %1838, i32 0, 2
  %1840 = add i32 %360, 128
  br label %359

1841:                                             ; preds = %359
  call void asm sideeffect "cp.async.wait_group 0x0;", ""()
  call void @llvm.nvvm.barrier0()
  %1842 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 0
  %1843 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 1
  %1844 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 2
  %1845 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 3
  %1846 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 4
  %1847 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 5
  %1848 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 6
  %1849 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 7
  %1850 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 8
  %1851 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 9
  %1852 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 10
  %1853 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 11
  %1854 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 12
  %1855 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 13
  %1856 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 14
  %1857 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 15
  %1858 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 16
  %1859 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 17
  %1860 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 18
  %1861 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 19
  %1862 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 20
  %1863 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 21
  %1864 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 22
  %1865 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 23
  %1866 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 24
  %1867 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 25
  %1868 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 26
  %1869 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 27
  %1870 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 28
  %1871 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 29
  %1872 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 30
  %1873 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 31
  %1874 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 32
  %1875 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 33
  %1876 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 34
  %1877 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 35
  %1878 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 36
  %1879 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 37
  %1880 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 38
  %1881 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 39
  %1882 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 40
  %1883 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 41
  %1884 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 42
  %1885 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 43
  %1886 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 44
  %1887 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 45
  %1888 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 46
  %1889 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 47
  %1890 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 48
  %1891 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 49
  %1892 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 50
  %1893 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 51
  %1894 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 52
  %1895 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 53
  %1896 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 54
  %1897 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 55
  %1898 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 56
  %1899 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 57
  %1900 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 58
  %1901 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 59
  %1902 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 60
  %1903 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 61
  %1904 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 62
  %1905 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, 63
  %1906 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1842)
  %1907 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1843)
  %1908 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1844)
  %1909 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1845)
  %1910 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1846)
  %1911 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1847)
  %1912 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1848)
  %1913 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1849)
  %1914 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1850)
  %1915 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1851)
  %1916 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1852)
  %1917 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1853)
  %1918 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1854)
  %1919 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1855)
  %1920 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1856)
  %1921 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1857)
  %1922 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1858)
  %1923 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1859)
  %1924 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1860)
  %1925 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1861)
  %1926 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1862)
  %1927 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1863)
  %1928 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1864)
  %1929 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1865)
  %1930 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1866)
  %1931 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1867)
  %1932 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1868)
  %1933 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1869)
  %1934 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1870)
  %1935 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1871)
  %1936 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1872)
  %1937 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1873)
  %1938 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1874)
  %1939 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1875)
  %1940 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1876)
  %1941 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1877)
  %1942 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1878)
  %1943 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1879)
  %1944 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1880)
  %1945 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1881)
  %1946 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1882)
  %1947 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1883)
  %1948 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1884)
  %1949 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1885)
  %1950 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1886)
  %1951 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1887)
  %1952 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1888)
  %1953 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1889)
  %1954 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1890)
  %1955 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1891)
  %1956 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1892)
  %1957 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1893)
  %1958 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1894)
  %1959 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1895)
  %1960 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1896)
  %1961 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1897)
  %1962 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1898)
  %1963 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1899)
  %1964 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1900)
  %1965 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1901)
  %1966 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1902)
  %1967 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1903)
  %1968 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1904)
  %1969 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1905)
  %1970 = mul i32 %11, 64
  %1971 = sext i32 %1970 to i64
  %1972 = select i1 %43, i32 0, i32 1
  %1973 = xor i32 0, %1972
  %1974 = select i1 %47, i32 0, i32 2
  %1975 = xor i32 %1973, %1974
  %1976 = select i1 %51, i32 0, i32 4
  %1977 = xor i32 %1975, %1976
  %1978 = xor i32 %1977, 0
  %1979 = xor i32 %1977, 8
  %1980 = xor i32 %1977, 16
  %1981 = xor i32 %1977, 24
  %1982 = xor i32 %1977, 32
  %1983 = xor i32 %1977, 40
  %1984 = xor i32 %1977, 48
  %1985 = xor i32 %1977, 56
  %1986 = add i32 %1978, 0
  %1987 = add i32 %1979, 0
  %1988 = add i32 %1980, 0
  %1989 = add i32 %1981, 0
  %1990 = add i32 %1982, 0
  %1991 = add i32 %1983, 0
  %1992 = add i32 %1984, 0
  %1993 = add i32 %1985, 0
  %1994 = sext i32 %1986 to i64
  %1995 = sext i32 %1987 to i64
  %1996 = sext i32 %1988 to i64
  %1997 = sext i32 %1989 to i64
  %1998 = sext i32 %1990 to i64
  %1999 = sext i32 %1991 to i64
  %2000 = sext i32 %1992 to i64
  %2001 = sext i32 %1993 to i64
  %2002 = add i64 %1971, %1994
  %2003 = add i64 %1971, %1995
  %2004 = add i64 %1971, %1996
  %2005 = add i64 %1971, %1997
  %2006 = add i64 %1971, %1998
  %2007 = add i64 %1971, %1999
  %2008 = add i64 %1971, %2000
  %2009 = add i64 %1971, %2001
  %2010 = mul i64 %2002, 19456
  %2011 = mul i64 %2003, 19456
  %2012 = mul i64 %2004, 19456
  %2013 = mul i64 %2005, 19456
  %2014 = mul i64 %2006, 19456
  %2015 = mul i64 %2007, 19456
  %2016 = mul i64 %2008, 19456
  %2017 = mul i64 %2009, 19456
  %2018 = select i1 %39, i32 0, i32 128
  %2019 = xor i32 %33, %2018
  %2020 = xor i32 %2019, 0
  %2021 = add i32 %2020, 0
  %2022 = sext i32 %2021 to i64
  %2023 = add i64 %15, %2022
  %2024 = add i64 %2010, %2023
  %2025 = add i64 %2011, %2023
  %2026 = add i64 %2012, %2023
  %2027 = add i64 %2013, %2023
  %2028 = add i64 %2014, %2023
  %2029 = add i64 %2015, %2023
  %2030 = add i64 %2016, %2023
  %2031 = add i64 %2017, %2023
  %2032 = getelementptr bfloat, ptr addrspace(1) %2, i64 %2024
  %2033 = getelementptr bfloat, ptr addrspace(1) %2, i64 %2025
  %2034 = getelementptr bfloat, ptr addrspace(1) %2, i64 %2026
  %2035 = getelementptr bfloat, ptr addrspace(1) %2, i64 %2027
  %2036 = getelementptr bfloat, ptr addrspace(1) %2, i64 %2028
  %2037 = getelementptr bfloat, ptr addrspace(1) %2, i64 %2029
  %2038 = getelementptr bfloat, ptr addrspace(1) %2, i64 %2030
  %2039 = getelementptr bfloat, ptr addrspace(1) %2, i64 %2031
  %2040 = select i1 %19, i32 0, i32 2
  %2041 = xor i32 0, %2040
  %2042 = select i1 %23, i32 0, i32 4
  %2043 = xor i32 %2041, %2042
  %2044 = select i1 %27, i32 0, i32 256
  %2045 = xor i32 %2043, %2044
  %2046 = select i1 %31, i32 0, i32 512
  %2047 = xor i32 %2045, %2046
  %2048 = select i1 %39, i32 0, i32 1024
  %2049 = xor i32 %2047, %2048
  %2050 = select i1 %43, i32 0, i32 8
  %2051 = xor i32 %2049, %2050
  %2052 = select i1 %47, i32 0, i32 16
  %2053 = xor i32 %2051, %2052
  %2054 = select i1 %51, i32 0, i32 32
  %2055 = xor i32 %2053, %2054
  %2056 = select i1 %43, i32 0, i32 256
  %2057 = xor i32 %2019, %2056
  %2058 = select i1 %47, i32 0, i32 512
  %2059 = xor i32 %2057, %2058
  %2060 = xor i32 %2059, %172
  %2061 = xor i32 %2055, 0
  %2062 = lshr i32 %2061, 8
  %2063 = shl i32 %2062, 3
  %2064 = add i32 %2063, %2061
  %2065 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %2064
  %2066 = insertelement <2 x bfloat> undef, bfloat %1906, i32 0
  %2067 = insertelement <2 x bfloat> %2066, bfloat %1907, i32 1
  %2068 = extractelement <2 x bfloat> %2067, i32 0
  %2069 = extractelement <2 x bfloat> %2067, i32 1
  %2070 = bitcast bfloat %2068 to i16
  %2071 = bitcast bfloat %2069 to i16
  %2072 = insertelement <2 x i16> undef, i16 %2070, i32 0
  %2073 = insertelement <2 x i16> %2072, i16 %2071, i32 1
  %2074 = extractelement <2 x i16> %2073, i32 0
  %2075 = extractelement <2 x i16> %2073, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %2065, i16 %2074, i16 %2075, i1 true)
  %2076 = xor i32 %2055, 2048
  %2077 = lshr i32 %2076, 8
  %2078 = shl i32 %2077, 3
  %2079 = add i32 %2078, %2076
  %2080 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %2079
  %2081 = insertelement <2 x bfloat> undef, bfloat %1908, i32 0
  %2082 = insertelement <2 x bfloat> %2081, bfloat %1909, i32 1
  %2083 = extractelement <2 x bfloat> %2082, i32 0
  %2084 = extractelement <2 x bfloat> %2082, i32 1
  %2085 = bitcast bfloat %2083 to i16
  %2086 = bitcast bfloat %2084 to i16
  %2087 = insertelement <2 x i16> undef, i16 %2085, i32 0
  %2088 = insertelement <2 x i16> %2087, i16 %2086, i32 1
  %2089 = extractelement <2 x i16> %2088, i32 0
  %2090 = extractelement <2 x i16> %2088, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %2080, i16 %2089, i16 %2090, i1 true)
  %2091 = xor i32 %2055, 64
  %2092 = lshr i32 %2091, 8
  %2093 = shl i32 %2092, 3
  %2094 = add i32 %2093, %2091
  %2095 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %2094
  %2096 = insertelement <2 x bfloat> undef, bfloat %1910, i32 0
  %2097 = insertelement <2 x bfloat> %2096, bfloat %1911, i32 1
  %2098 = extractelement <2 x bfloat> %2097, i32 0
  %2099 = extractelement <2 x bfloat> %2097, i32 1
  %2100 = bitcast bfloat %2098 to i16
  %2101 = bitcast bfloat %2099 to i16
  %2102 = insertelement <2 x i16> undef, i16 %2100, i32 0
  %2103 = insertelement <2 x i16> %2102, i16 %2101, i32 1
  %2104 = extractelement <2 x i16> %2103, i32 0
  %2105 = extractelement <2 x i16> %2103, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %2095, i16 %2104, i16 %2105, i1 true)
  %2106 = xor i32 %2055, 2112
  %2107 = lshr i32 %2106, 8
  %2108 = shl i32 %2107, 3
  %2109 = add i32 %2108, %2106
  %2110 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %2109
  %2111 = insertelement <2 x bfloat> undef, bfloat %1912, i32 0
  %2112 = insertelement <2 x bfloat> %2111, bfloat %1913, i32 1
  %2113 = extractelement <2 x bfloat> %2112, i32 0
  %2114 = extractelement <2 x bfloat> %2112, i32 1
  %2115 = bitcast bfloat %2113 to i16
  %2116 = bitcast bfloat %2114 to i16
  %2117 = insertelement <2 x i16> undef, i16 %2115, i32 0
  %2118 = insertelement <2 x i16> %2117, i16 %2116, i32 1
  %2119 = extractelement <2 x i16> %2118, i32 0
  %2120 = extractelement <2 x i16> %2118, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %2110, i16 %2119, i16 %2120, i1 true)
  %2121 = xor i32 %2055, 128
  %2122 = lshr i32 %2121, 8
  %2123 = shl i32 %2122, 3
  %2124 = add i32 %2123, %2121
  %2125 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %2124
  %2126 = insertelement <2 x bfloat> undef, bfloat %1914, i32 0
  %2127 = insertelement <2 x bfloat> %2126, bfloat %1915, i32 1
  %2128 = extractelement <2 x bfloat> %2127, i32 0
  %2129 = extractelement <2 x bfloat> %2127, i32 1
  %2130 = bitcast bfloat %2128 to i16
  %2131 = bitcast bfloat %2129 to i16
  %2132 = insertelement <2 x i16> undef, i16 %2130, i32 0
  %2133 = insertelement <2 x i16> %2132, i16 %2131, i32 1
  %2134 = extractelement <2 x i16> %2133, i32 0
  %2135 = extractelement <2 x i16> %2133, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %2125, i16 %2134, i16 %2135, i1 true)
  %2136 = xor i32 %2055, 2176
  %2137 = lshr i32 %2136, 8
  %2138 = shl i32 %2137, 3
  %2139 = add i32 %2138, %2136
  %2140 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %2139
  %2141 = insertelement <2 x bfloat> undef, bfloat %1916, i32 0
  %2142 = insertelement <2 x bfloat> %2141, bfloat %1917, i32 1
  %2143 = extractelement <2 x bfloat> %2142, i32 0
  %2144 = extractelement <2 x bfloat> %2142, i32 1
  %2145 = bitcast bfloat %2143 to i16
  %2146 = bitcast bfloat %2144 to i16
  %2147 = insertelement <2 x i16> undef, i16 %2145, i32 0
  %2148 = insertelement <2 x i16> %2147, i16 %2146, i32 1
  %2149 = extractelement <2 x i16> %2148, i32 0
  %2150 = extractelement <2 x i16> %2148, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %2140, i16 %2149, i16 %2150, i1 true)
  %2151 = xor i32 %2055, 192
  %2152 = lshr i32 %2151, 8
  %2153 = shl i32 %2152, 3
  %2154 = add i32 %2153, %2151
  %2155 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %2154
  %2156 = insertelement <2 x bfloat> undef, bfloat %1918, i32 0
  %2157 = insertelement <2 x bfloat> %2156, bfloat %1919, i32 1
  %2158 = extractelement <2 x bfloat> %2157, i32 0
  %2159 = extractelement <2 x bfloat> %2157, i32 1
  %2160 = bitcast bfloat %2158 to i16
  %2161 = bitcast bfloat %2159 to i16
  %2162 = insertelement <2 x i16> undef, i16 %2160, i32 0
  %2163 = insertelement <2 x i16> %2162, i16 %2161, i32 1
  %2164 = extractelement <2 x i16> %2163, i32 0
  %2165 = extractelement <2 x i16> %2163, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %2155, i16 %2164, i16 %2165, i1 true)
  %2166 = xor i32 %2055, 2240
  %2167 = lshr i32 %2166, 8
  %2168 = shl i32 %2167, 3
  %2169 = add i32 %2168, %2166
  %2170 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %2169
  %2171 = insertelement <2 x bfloat> undef, bfloat %1920, i32 0
  %2172 = insertelement <2 x bfloat> %2171, bfloat %1921, i32 1
  %2173 = extractelement <2 x bfloat> %2172, i32 0
  %2174 = extractelement <2 x bfloat> %2172, i32 1
  %2175 = bitcast bfloat %2173 to i16
  %2176 = bitcast bfloat %2174 to i16
  %2177 = insertelement <2 x i16> undef, i16 %2175, i32 0
  %2178 = insertelement <2 x i16> %2177, i16 %2176, i32 1
  %2179 = extractelement <2 x i16> %2178, i32 0
  %2180 = extractelement <2 x i16> %2178, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %2170, i16 %2179, i16 %2180, i1 true)
  call void @llvm.nvvm.barrier0()
  %2181 = xor i32 %2060, 0
  %2182 = lshr i32 %2181, 8
  %2183 = shl i32 %2182, 3
  %2184 = add i32 %2183, %2181
  %2185 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %2184
  %2186 = load <4 x i32>, ptr addrspace(3) %2185, align 16
  %2187 = extractelement <4 x i32> %2186, i32 0
  %2188 = extractelement <4 x i32> %2186, i32 1
  %2189 = extractelement <4 x i32> %2186, i32 2
  %2190 = extractelement <4 x i32> %2186, i32 3
  %2191 = insertelement <4 x i32> undef, i32 %2187, i32 0
  %2192 = insertelement <4 x i32> %2191, i32 %2188, i32 1
  %2193 = insertelement <4 x i32> %2192, i32 %2189, i32 2
  %2194 = insertelement <4 x i32> %2193, i32 %2190, i32 3
  %2195 = extractelement <4 x i32> %2194, i32 0
  %2196 = extractelement <4 x i32> %2194, i32 1
  %2197 = extractelement <4 x i32> %2194, i32 2
  %2198 = extractelement <4 x i32> %2194, i32 3
  %2199 = bitcast i32 %2195 to <2 x i16>
  %2200 = extractelement <2 x i16> %2199, i32 0
  %2201 = extractelement <2 x i16> %2199, i32 1
  %2202 = bitcast i32 %2196 to <2 x i16>
  %2203 = extractelement <2 x i16> %2202, i32 0
  %2204 = extractelement <2 x i16> %2202, i32 1
  %2205 = bitcast i32 %2197 to <2 x i16>
  %2206 = extractelement <2 x i16> %2205, i32 0
  %2207 = extractelement <2 x i16> %2205, i32 1
  %2208 = bitcast i32 %2198 to <2 x i16>
  %2209 = extractelement <2 x i16> %2208, i32 0
  %2210 = extractelement <2 x i16> %2208, i32 1
  %2211 = insertelement <8 x i16> undef, i16 %2200, i32 0
  %2212 = insertelement <8 x i16> %2211, i16 %2201, i32 1
  %2213 = insertelement <8 x i16> %2212, i16 %2203, i32 2
  %2214 = insertelement <8 x i16> %2213, i16 %2204, i32 3
  %2215 = insertelement <8 x i16> %2214, i16 %2206, i32 4
  %2216 = insertelement <8 x i16> %2215, i16 %2207, i32 5
  %2217 = insertelement <8 x i16> %2216, i16 %2209, i32 6
  %2218 = insertelement <8 x i16> %2217, i16 %2210, i32 7
  %2219 = extractelement <8 x i16> %2218, i32 0
  %2220 = extractelement <8 x i16> %2218, i32 1
  %2221 = extractelement <8 x i16> %2218, i32 2
  %2222 = extractelement <8 x i16> %2218, i32 3
  %2223 = extractelement <8 x i16> %2218, i32 4
  %2224 = extractelement <8 x i16> %2218, i32 5
  %2225 = extractelement <8 x i16> %2218, i32 6
  %2226 = extractelement <8 x i16> %2218, i32 7
  %2227 = bitcast i16 %2219 to bfloat
  %2228 = bitcast i16 %2220 to bfloat
  %2229 = bitcast i16 %2221 to bfloat
  %2230 = bitcast i16 %2222 to bfloat
  %2231 = bitcast i16 %2223 to bfloat
  %2232 = bitcast i16 %2224 to bfloat
  %2233 = bitcast i16 %2225 to bfloat
  %2234 = bitcast i16 %2226 to bfloat
  %2235 = insertelement <8 x bfloat> undef, bfloat %2227, i32 0
  %2236 = insertelement <8 x bfloat> %2235, bfloat %2228, i32 1
  %2237 = insertelement <8 x bfloat> %2236, bfloat %2229, i32 2
  %2238 = insertelement <8 x bfloat> %2237, bfloat %2230, i32 3
  %2239 = insertelement <8 x bfloat> %2238, bfloat %2231, i32 4
  %2240 = insertelement <8 x bfloat> %2239, bfloat %2232, i32 5
  %2241 = insertelement <8 x bfloat> %2240, bfloat %2233, i32 6
  %2242 = insertelement <8 x bfloat> %2241, bfloat %2234, i32 7
  %2243 = extractelement <8 x bfloat> %2242, i32 0
  %2244 = extractelement <8 x bfloat> %2242, i32 1
  %2245 = extractelement <8 x bfloat> %2242, i32 2
  %2246 = extractelement <8 x bfloat> %2242, i32 3
  %2247 = extractelement <8 x bfloat> %2242, i32 4
  %2248 = extractelement <8 x bfloat> %2242, i32 5
  %2249 = extractelement <8 x bfloat> %2242, i32 6
  %2250 = extractelement <8 x bfloat> %2242, i32 7
  %2251 = xor i32 %2060, 2048
  %2252 = lshr i32 %2251, 8
  %2253 = shl i32 %2252, 3
  %2254 = add i32 %2253, %2251
  %2255 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %2254
  %2256 = load <4 x i32>, ptr addrspace(3) %2255, align 16
  %2257 = extractelement <4 x i32> %2256, i32 0
  %2258 = extractelement <4 x i32> %2256, i32 1
  %2259 = extractelement <4 x i32> %2256, i32 2
  %2260 = extractelement <4 x i32> %2256, i32 3
  %2261 = insertelement <4 x i32> undef, i32 %2257, i32 0
  %2262 = insertelement <4 x i32> %2261, i32 %2258, i32 1
  %2263 = insertelement <4 x i32> %2262, i32 %2259, i32 2
  %2264 = insertelement <4 x i32> %2263, i32 %2260, i32 3
  %2265 = extractelement <4 x i32> %2264, i32 0
  %2266 = extractelement <4 x i32> %2264, i32 1
  %2267 = extractelement <4 x i32> %2264, i32 2
  %2268 = extractelement <4 x i32> %2264, i32 3
  %2269 = bitcast i32 %2265 to <2 x i16>
  %2270 = extractelement <2 x i16> %2269, i32 0
  %2271 = extractelement <2 x i16> %2269, i32 1
  %2272 = bitcast i32 %2266 to <2 x i16>
  %2273 = extractelement <2 x i16> %2272, i32 0
  %2274 = extractelement <2 x i16> %2272, i32 1
  %2275 = bitcast i32 %2267 to <2 x i16>
  %2276 = extractelement <2 x i16> %2275, i32 0
  %2277 = extractelement <2 x i16> %2275, i32 1
  %2278 = bitcast i32 %2268 to <2 x i16>
  %2279 = extractelement <2 x i16> %2278, i32 0
  %2280 = extractelement <2 x i16> %2278, i32 1
  %2281 = insertelement <8 x i16> undef, i16 %2270, i32 0
  %2282 = insertelement <8 x i16> %2281, i16 %2271, i32 1
  %2283 = insertelement <8 x i16> %2282, i16 %2273, i32 2
  %2284 = insertelement <8 x i16> %2283, i16 %2274, i32 3
  %2285 = insertelement <8 x i16> %2284, i16 %2276, i32 4
  %2286 = insertelement <8 x i16> %2285, i16 %2277, i32 5
  %2287 = insertelement <8 x i16> %2286, i16 %2279, i32 6
  %2288 = insertelement <8 x i16> %2287, i16 %2280, i32 7
  %2289 = extractelement <8 x i16> %2288, i32 0
  %2290 = extractelement <8 x i16> %2288, i32 1
  %2291 = extractelement <8 x i16> %2288, i32 2
  %2292 = extractelement <8 x i16> %2288, i32 3
  %2293 = extractelement <8 x i16> %2288, i32 4
  %2294 = extractelement <8 x i16> %2288, i32 5
  %2295 = extractelement <8 x i16> %2288, i32 6
  %2296 = extractelement <8 x i16> %2288, i32 7
  %2297 = bitcast i16 %2289 to bfloat
  %2298 = bitcast i16 %2290 to bfloat
  %2299 = bitcast i16 %2291 to bfloat
  %2300 = bitcast i16 %2292 to bfloat
  %2301 = bitcast i16 %2293 to bfloat
  %2302 = bitcast i16 %2294 to bfloat
  %2303 = bitcast i16 %2295 to bfloat
  %2304 = bitcast i16 %2296 to bfloat
  %2305 = insertelement <8 x bfloat> undef, bfloat %2297, i32 0
  %2306 = insertelement <8 x bfloat> %2305, bfloat %2298, i32 1
  %2307 = insertelement <8 x bfloat> %2306, bfloat %2299, i32 2
  %2308 = insertelement <8 x bfloat> %2307, bfloat %2300, i32 3
  %2309 = insertelement <8 x bfloat> %2308, bfloat %2301, i32 4
  %2310 = insertelement <8 x bfloat> %2309, bfloat %2302, i32 5
  %2311 = insertelement <8 x bfloat> %2310, bfloat %2303, i32 6
  %2312 = insertelement <8 x bfloat> %2311, bfloat %2304, i32 7
  %2313 = extractelement <8 x bfloat> %2312, i32 0
  %2314 = extractelement <8 x bfloat> %2312, i32 1
  %2315 = extractelement <8 x bfloat> %2312, i32 2
  %2316 = extractelement <8 x bfloat> %2312, i32 3
  %2317 = extractelement <8 x bfloat> %2312, i32 4
  %2318 = extractelement <8 x bfloat> %2312, i32 5
  %2319 = extractelement <8 x bfloat> %2312, i32 6
  %2320 = extractelement <8 x bfloat> %2312, i32 7
  call void @llvm.nvvm.barrier0()
  %2321 = insertelement <2 x bfloat> undef, bfloat %1922, i32 0
  %2322 = insertelement <2 x bfloat> %2321, bfloat %1923, i32 1
  %2323 = extractelement <2 x bfloat> %2322, i32 0
  %2324 = extractelement <2 x bfloat> %2322, i32 1
  %2325 = bitcast bfloat %2323 to i16
  %2326 = bitcast bfloat %2324 to i16
  %2327 = insertelement <2 x i16> undef, i16 %2325, i32 0
  %2328 = insertelement <2 x i16> %2327, i16 %2326, i32 1
  %2329 = extractelement <2 x i16> %2328, i32 0
  %2330 = extractelement <2 x i16> %2328, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %2065, i16 %2329, i16 %2330, i1 true)
  %2331 = insertelement <2 x bfloat> undef, bfloat %1924, i32 0
  %2332 = insertelement <2 x bfloat> %2331, bfloat %1925, i32 1
  %2333 = extractelement <2 x bfloat> %2332, i32 0
  %2334 = extractelement <2 x bfloat> %2332, i32 1
  %2335 = bitcast bfloat %2333 to i16
  %2336 = bitcast bfloat %2334 to i16
  %2337 = insertelement <2 x i16> undef, i16 %2335, i32 0
  %2338 = insertelement <2 x i16> %2337, i16 %2336, i32 1
  %2339 = extractelement <2 x i16> %2338, i32 0
  %2340 = extractelement <2 x i16> %2338, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %2080, i16 %2339, i16 %2340, i1 true)
  %2341 = insertelement <2 x bfloat> undef, bfloat %1926, i32 0
  %2342 = insertelement <2 x bfloat> %2341, bfloat %1927, i32 1
  %2343 = extractelement <2 x bfloat> %2342, i32 0
  %2344 = extractelement <2 x bfloat> %2342, i32 1
  %2345 = bitcast bfloat %2343 to i16
  %2346 = bitcast bfloat %2344 to i16
  %2347 = insertelement <2 x i16> undef, i16 %2345, i32 0
  %2348 = insertelement <2 x i16> %2347, i16 %2346, i32 1
  %2349 = extractelement <2 x i16> %2348, i32 0
  %2350 = extractelement <2 x i16> %2348, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %2095, i16 %2349, i16 %2350, i1 true)
  %2351 = insertelement <2 x bfloat> undef, bfloat %1928, i32 0
  %2352 = insertelement <2 x bfloat> %2351, bfloat %1929, i32 1
  %2353 = extractelement <2 x bfloat> %2352, i32 0
  %2354 = extractelement <2 x bfloat> %2352, i32 1
  %2355 = bitcast bfloat %2353 to i16
  %2356 = bitcast bfloat %2354 to i16
  %2357 = insertelement <2 x i16> undef, i16 %2355, i32 0
  %2358 = insertelement <2 x i16> %2357, i16 %2356, i32 1
  %2359 = extractelement <2 x i16> %2358, i32 0
  %2360 = extractelement <2 x i16> %2358, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %2110, i16 %2359, i16 %2360, i1 true)
  %2361 = insertelement <2 x bfloat> undef, bfloat %1930, i32 0
  %2362 = insertelement <2 x bfloat> %2361, bfloat %1931, i32 1
  %2363 = extractelement <2 x bfloat> %2362, i32 0
  %2364 = extractelement <2 x bfloat> %2362, i32 1
  %2365 = bitcast bfloat %2363 to i16
  %2366 = bitcast bfloat %2364 to i16
  %2367 = insertelement <2 x i16> undef, i16 %2365, i32 0
  %2368 = insertelement <2 x i16> %2367, i16 %2366, i32 1
  %2369 = extractelement <2 x i16> %2368, i32 0
  %2370 = extractelement <2 x i16> %2368, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %2125, i16 %2369, i16 %2370, i1 true)
  %2371 = insertelement <2 x bfloat> undef, bfloat %1932, i32 0
  %2372 = insertelement <2 x bfloat> %2371, bfloat %1933, i32 1
  %2373 = extractelement <2 x bfloat> %2372, i32 0
  %2374 = extractelement <2 x bfloat> %2372, i32 1
  %2375 = bitcast bfloat %2373 to i16
  %2376 = bitcast bfloat %2374 to i16
  %2377 = insertelement <2 x i16> undef, i16 %2375, i32 0
  %2378 = insertelement <2 x i16> %2377, i16 %2376, i32 1
  %2379 = extractelement <2 x i16> %2378, i32 0
  %2380 = extractelement <2 x i16> %2378, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %2140, i16 %2379, i16 %2380, i1 true)
  %2381 = insertelement <2 x bfloat> undef, bfloat %1934, i32 0
  %2382 = insertelement <2 x bfloat> %2381, bfloat %1935, i32 1
  %2383 = extractelement <2 x bfloat> %2382, i32 0
  %2384 = extractelement <2 x bfloat> %2382, i32 1
  %2385 = bitcast bfloat %2383 to i16
  %2386 = bitcast bfloat %2384 to i16
  %2387 = insertelement <2 x i16> undef, i16 %2385, i32 0
  %2388 = insertelement <2 x i16> %2387, i16 %2386, i32 1
  %2389 = extractelement <2 x i16> %2388, i32 0
  %2390 = extractelement <2 x i16> %2388, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %2155, i16 %2389, i16 %2390, i1 true)
  %2391 = insertelement <2 x bfloat> undef, bfloat %1936, i32 0
  %2392 = insertelement <2 x bfloat> %2391, bfloat %1937, i32 1
  %2393 = extractelement <2 x bfloat> %2392, i32 0
  %2394 = extractelement <2 x bfloat> %2392, i32 1
  %2395 = bitcast bfloat %2393 to i16
  %2396 = bitcast bfloat %2394 to i16
  %2397 = insertelement <2 x i16> undef, i16 %2395, i32 0
  %2398 = insertelement <2 x i16> %2397, i16 %2396, i32 1
  %2399 = extractelement <2 x i16> %2398, i32 0
  %2400 = extractelement <2 x i16> %2398, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %2170, i16 %2399, i16 %2400, i1 true)
  call void @llvm.nvvm.barrier0()
  %2401 = load <4 x i32>, ptr addrspace(3) %2185, align 16
  %2402 = extractelement <4 x i32> %2401, i32 0
  %2403 = extractelement <4 x i32> %2401, i32 1
  %2404 = extractelement <4 x i32> %2401, i32 2
  %2405 = extractelement <4 x i32> %2401, i32 3
  %2406 = insertelement <4 x i32> undef, i32 %2402, i32 0
  %2407 = insertelement <4 x i32> %2406, i32 %2403, i32 1
  %2408 = insertelement <4 x i32> %2407, i32 %2404, i32 2
  %2409 = insertelement <4 x i32> %2408, i32 %2405, i32 3
  %2410 = extractelement <4 x i32> %2409, i32 0
  %2411 = extractelement <4 x i32> %2409, i32 1
  %2412 = extractelement <4 x i32> %2409, i32 2
  %2413 = extractelement <4 x i32> %2409, i32 3
  %2414 = bitcast i32 %2410 to <2 x i16>
  %2415 = extractelement <2 x i16> %2414, i32 0
  %2416 = extractelement <2 x i16> %2414, i32 1
  %2417 = bitcast i32 %2411 to <2 x i16>
  %2418 = extractelement <2 x i16> %2417, i32 0
  %2419 = extractelement <2 x i16> %2417, i32 1
  %2420 = bitcast i32 %2412 to <2 x i16>
  %2421 = extractelement <2 x i16> %2420, i32 0
  %2422 = extractelement <2 x i16> %2420, i32 1
  %2423 = bitcast i32 %2413 to <2 x i16>
  %2424 = extractelement <2 x i16> %2423, i32 0
  %2425 = extractelement <2 x i16> %2423, i32 1
  %2426 = insertelement <8 x i16> undef, i16 %2415, i32 0
  %2427 = insertelement <8 x i16> %2426, i16 %2416, i32 1
  %2428 = insertelement <8 x i16> %2427, i16 %2418, i32 2
  %2429 = insertelement <8 x i16> %2428, i16 %2419, i32 3
  %2430 = insertelement <8 x i16> %2429, i16 %2421, i32 4
  %2431 = insertelement <8 x i16> %2430, i16 %2422, i32 5
  %2432 = insertelement <8 x i16> %2431, i16 %2424, i32 6
  %2433 = insertelement <8 x i16> %2432, i16 %2425, i32 7
  %2434 = extractelement <8 x i16> %2433, i32 0
  %2435 = extractelement <8 x i16> %2433, i32 1
  %2436 = extractelement <8 x i16> %2433, i32 2
  %2437 = extractelement <8 x i16> %2433, i32 3
  %2438 = extractelement <8 x i16> %2433, i32 4
  %2439 = extractelement <8 x i16> %2433, i32 5
  %2440 = extractelement <8 x i16> %2433, i32 6
  %2441 = extractelement <8 x i16> %2433, i32 7
  %2442 = bitcast i16 %2434 to bfloat
  %2443 = bitcast i16 %2435 to bfloat
  %2444 = bitcast i16 %2436 to bfloat
  %2445 = bitcast i16 %2437 to bfloat
  %2446 = bitcast i16 %2438 to bfloat
  %2447 = bitcast i16 %2439 to bfloat
  %2448 = bitcast i16 %2440 to bfloat
  %2449 = bitcast i16 %2441 to bfloat
  %2450 = insertelement <8 x bfloat> undef, bfloat %2442, i32 0
  %2451 = insertelement <8 x bfloat> %2450, bfloat %2443, i32 1
  %2452 = insertelement <8 x bfloat> %2451, bfloat %2444, i32 2
  %2453 = insertelement <8 x bfloat> %2452, bfloat %2445, i32 3
  %2454 = insertelement <8 x bfloat> %2453, bfloat %2446, i32 4
  %2455 = insertelement <8 x bfloat> %2454, bfloat %2447, i32 5
  %2456 = insertelement <8 x bfloat> %2455, bfloat %2448, i32 6
  %2457 = insertelement <8 x bfloat> %2456, bfloat %2449, i32 7
  %2458 = extractelement <8 x bfloat> %2457, i32 0
  %2459 = extractelement <8 x bfloat> %2457, i32 1
  %2460 = extractelement <8 x bfloat> %2457, i32 2
  %2461 = extractelement <8 x bfloat> %2457, i32 3
  %2462 = extractelement <8 x bfloat> %2457, i32 4
  %2463 = extractelement <8 x bfloat> %2457, i32 5
  %2464 = extractelement <8 x bfloat> %2457, i32 6
  %2465 = extractelement <8 x bfloat> %2457, i32 7
  %2466 = load <4 x i32>, ptr addrspace(3) %2255, align 16
  %2467 = extractelement <4 x i32> %2466, i32 0
  %2468 = extractelement <4 x i32> %2466, i32 1
  %2469 = extractelement <4 x i32> %2466, i32 2
  %2470 = extractelement <4 x i32> %2466, i32 3
  %2471 = insertelement <4 x i32> undef, i32 %2467, i32 0
  %2472 = insertelement <4 x i32> %2471, i32 %2468, i32 1
  %2473 = insertelement <4 x i32> %2472, i32 %2469, i32 2
  %2474 = insertelement <4 x i32> %2473, i32 %2470, i32 3
  %2475 = extractelement <4 x i32> %2474, i32 0
  %2476 = extractelement <4 x i32> %2474, i32 1
  %2477 = extractelement <4 x i32> %2474, i32 2
  %2478 = extractelement <4 x i32> %2474, i32 3
  %2479 = bitcast i32 %2475 to <2 x i16>
  %2480 = extractelement <2 x i16> %2479, i32 0
  %2481 = extractelement <2 x i16> %2479, i32 1
  %2482 = bitcast i32 %2476 to <2 x i16>
  %2483 = extractelement <2 x i16> %2482, i32 0
  %2484 = extractelement <2 x i16> %2482, i32 1
  %2485 = bitcast i32 %2477 to <2 x i16>
  %2486 = extractelement <2 x i16> %2485, i32 0
  %2487 = extractelement <2 x i16> %2485, i32 1
  %2488 = bitcast i32 %2478 to <2 x i16>
  %2489 = extractelement <2 x i16> %2488, i32 0
  %2490 = extractelement <2 x i16> %2488, i32 1
  %2491 = insertelement <8 x i16> undef, i16 %2480, i32 0
  %2492 = insertelement <8 x i16> %2491, i16 %2481, i32 1
  %2493 = insertelement <8 x i16> %2492, i16 %2483, i32 2
  %2494 = insertelement <8 x i16> %2493, i16 %2484, i32 3
  %2495 = insertelement <8 x i16> %2494, i16 %2486, i32 4
  %2496 = insertelement <8 x i16> %2495, i16 %2487, i32 5
  %2497 = insertelement <8 x i16> %2496, i16 %2489, i32 6
  %2498 = insertelement <8 x i16> %2497, i16 %2490, i32 7
  %2499 = extractelement <8 x i16> %2498, i32 0
  %2500 = extractelement <8 x i16> %2498, i32 1
  %2501 = extractelement <8 x i16> %2498, i32 2
  %2502 = extractelement <8 x i16> %2498, i32 3
  %2503 = extractelement <8 x i16> %2498, i32 4
  %2504 = extractelement <8 x i16> %2498, i32 5
  %2505 = extractelement <8 x i16> %2498, i32 6
  %2506 = extractelement <8 x i16> %2498, i32 7
  %2507 = bitcast i16 %2499 to bfloat
  %2508 = bitcast i16 %2500 to bfloat
  %2509 = bitcast i16 %2501 to bfloat
  %2510 = bitcast i16 %2502 to bfloat
  %2511 = bitcast i16 %2503 to bfloat
  %2512 = bitcast i16 %2504 to bfloat
  %2513 = bitcast i16 %2505 to bfloat
  %2514 = bitcast i16 %2506 to bfloat
  %2515 = insertelement <8 x bfloat> undef, bfloat %2507, i32 0
  %2516 = insertelement <8 x bfloat> %2515, bfloat %2508, i32 1
  %2517 = insertelement <8 x bfloat> %2516, bfloat %2509, i32 2
  %2518 = insertelement <8 x bfloat> %2517, bfloat %2510, i32 3
  %2519 = insertelement <8 x bfloat> %2518, bfloat %2511, i32 4
  %2520 = insertelement <8 x bfloat> %2519, bfloat %2512, i32 5
  %2521 = insertelement <8 x bfloat> %2520, bfloat %2513, i32 6
  %2522 = insertelement <8 x bfloat> %2521, bfloat %2514, i32 7
  %2523 = extractelement <8 x bfloat> %2522, i32 0
  %2524 = extractelement <8 x bfloat> %2522, i32 1
  %2525 = extractelement <8 x bfloat> %2522, i32 2
  %2526 = extractelement <8 x bfloat> %2522, i32 3
  %2527 = extractelement <8 x bfloat> %2522, i32 4
  %2528 = extractelement <8 x bfloat> %2522, i32 5
  %2529 = extractelement <8 x bfloat> %2522, i32 6
  %2530 = extractelement <8 x bfloat> %2522, i32 7
  call void @llvm.nvvm.barrier0()
  %2531 = insertelement <2 x bfloat> undef, bfloat %1938, i32 0
  %2532 = insertelement <2 x bfloat> %2531, bfloat %1939, i32 1
  %2533 = extractelement <2 x bfloat> %2532, i32 0
  %2534 = extractelement <2 x bfloat> %2532, i32 1
  %2535 = bitcast bfloat %2533 to i16
  %2536 = bitcast bfloat %2534 to i16
  %2537 = insertelement <2 x i16> undef, i16 %2535, i32 0
  %2538 = insertelement <2 x i16> %2537, i16 %2536, i32 1
  %2539 = extractelement <2 x i16> %2538, i32 0
  %2540 = extractelement <2 x i16> %2538, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %2065, i16 %2539, i16 %2540, i1 true)
  %2541 = insertelement <2 x bfloat> undef, bfloat %1940, i32 0
  %2542 = insertelement <2 x bfloat> %2541, bfloat %1941, i32 1
  %2543 = extractelement <2 x bfloat> %2542, i32 0
  %2544 = extractelement <2 x bfloat> %2542, i32 1
  %2545 = bitcast bfloat %2543 to i16
  %2546 = bitcast bfloat %2544 to i16
  %2547 = insertelement <2 x i16> undef, i16 %2545, i32 0
  %2548 = insertelement <2 x i16> %2547, i16 %2546, i32 1
  %2549 = extractelement <2 x i16> %2548, i32 0
  %2550 = extractelement <2 x i16> %2548, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %2080, i16 %2549, i16 %2550, i1 true)
  %2551 = insertelement <2 x bfloat> undef, bfloat %1942, i32 0
  %2552 = insertelement <2 x bfloat> %2551, bfloat %1943, i32 1
  %2553 = extractelement <2 x bfloat> %2552, i32 0
  %2554 = extractelement <2 x bfloat> %2552, i32 1
  %2555 = bitcast bfloat %2553 to i16
  %2556 = bitcast bfloat %2554 to i16
  %2557 = insertelement <2 x i16> undef, i16 %2555, i32 0
  %2558 = insertelement <2 x i16> %2557, i16 %2556, i32 1
  %2559 = extractelement <2 x i16> %2558, i32 0
  %2560 = extractelement <2 x i16> %2558, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %2095, i16 %2559, i16 %2560, i1 true)
  %2561 = insertelement <2 x bfloat> undef, bfloat %1944, i32 0
  %2562 = insertelement <2 x bfloat> %2561, bfloat %1945, i32 1
  %2563 = extractelement <2 x bfloat> %2562, i32 0
  %2564 = extractelement <2 x bfloat> %2562, i32 1
  %2565 = bitcast bfloat %2563 to i16
  %2566 = bitcast bfloat %2564 to i16
  %2567 = insertelement <2 x i16> undef, i16 %2565, i32 0
  %2568 = insertelement <2 x i16> %2567, i16 %2566, i32 1
  %2569 = extractelement <2 x i16> %2568, i32 0
  %2570 = extractelement <2 x i16> %2568, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %2110, i16 %2569, i16 %2570, i1 true)
  %2571 = insertelement <2 x bfloat> undef, bfloat %1946, i32 0
  %2572 = insertelement <2 x bfloat> %2571, bfloat %1947, i32 1
  %2573 = extractelement <2 x bfloat> %2572, i32 0
  %2574 = extractelement <2 x bfloat> %2572, i32 1
  %2575 = bitcast bfloat %2573 to i16
  %2576 = bitcast bfloat %2574 to i16
  %2577 = insertelement <2 x i16> undef, i16 %2575, i32 0
  %2578 = insertelement <2 x i16> %2577, i16 %2576, i32 1
  %2579 = extractelement <2 x i16> %2578, i32 0
  %2580 = extractelement <2 x i16> %2578, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %2125, i16 %2579, i16 %2580, i1 true)
  %2581 = insertelement <2 x bfloat> undef, bfloat %1948, i32 0
  %2582 = insertelement <2 x bfloat> %2581, bfloat %1949, i32 1
  %2583 = extractelement <2 x bfloat> %2582, i32 0
  %2584 = extractelement <2 x bfloat> %2582, i32 1
  %2585 = bitcast bfloat %2583 to i16
  %2586 = bitcast bfloat %2584 to i16
  %2587 = insertelement <2 x i16> undef, i16 %2585, i32 0
  %2588 = insertelement <2 x i16> %2587, i16 %2586, i32 1
  %2589 = extractelement <2 x i16> %2588, i32 0
  %2590 = extractelement <2 x i16> %2588, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %2140, i16 %2589, i16 %2590, i1 true)
  %2591 = insertelement <2 x bfloat> undef, bfloat %1950, i32 0
  %2592 = insertelement <2 x bfloat> %2591, bfloat %1951, i32 1
  %2593 = extractelement <2 x bfloat> %2592, i32 0
  %2594 = extractelement <2 x bfloat> %2592, i32 1
  %2595 = bitcast bfloat %2593 to i16
  %2596 = bitcast bfloat %2594 to i16
  %2597 = insertelement <2 x i16> undef, i16 %2595, i32 0
  %2598 = insertelement <2 x i16> %2597, i16 %2596, i32 1
  %2599 = extractelement <2 x i16> %2598, i32 0
  %2600 = extractelement <2 x i16> %2598, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %2155, i16 %2599, i16 %2600, i1 true)
  %2601 = insertelement <2 x bfloat> undef, bfloat %1952, i32 0
  %2602 = insertelement <2 x bfloat> %2601, bfloat %1953, i32 1
  %2603 = extractelement <2 x bfloat> %2602, i32 0
  %2604 = extractelement <2 x bfloat> %2602, i32 1
  %2605 = bitcast bfloat %2603 to i16
  %2606 = bitcast bfloat %2604 to i16
  %2607 = insertelement <2 x i16> undef, i16 %2605, i32 0
  %2608 = insertelement <2 x i16> %2607, i16 %2606, i32 1
  %2609 = extractelement <2 x i16> %2608, i32 0
  %2610 = extractelement <2 x i16> %2608, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %2170, i16 %2609, i16 %2610, i1 true)
  call void @llvm.nvvm.barrier0()
  %2611 = load <4 x i32>, ptr addrspace(3) %2185, align 16
  %2612 = extractelement <4 x i32> %2611, i32 0
  %2613 = extractelement <4 x i32> %2611, i32 1
  %2614 = extractelement <4 x i32> %2611, i32 2
  %2615 = extractelement <4 x i32> %2611, i32 3
  %2616 = insertelement <4 x i32> undef, i32 %2612, i32 0
  %2617 = insertelement <4 x i32> %2616, i32 %2613, i32 1
  %2618 = insertelement <4 x i32> %2617, i32 %2614, i32 2
  %2619 = insertelement <4 x i32> %2618, i32 %2615, i32 3
  %2620 = extractelement <4 x i32> %2619, i32 0
  %2621 = extractelement <4 x i32> %2619, i32 1
  %2622 = extractelement <4 x i32> %2619, i32 2
  %2623 = extractelement <4 x i32> %2619, i32 3
  %2624 = bitcast i32 %2620 to <2 x i16>
  %2625 = extractelement <2 x i16> %2624, i32 0
  %2626 = extractelement <2 x i16> %2624, i32 1
  %2627 = bitcast i32 %2621 to <2 x i16>
  %2628 = extractelement <2 x i16> %2627, i32 0
  %2629 = extractelement <2 x i16> %2627, i32 1
  %2630 = bitcast i32 %2622 to <2 x i16>
  %2631 = extractelement <2 x i16> %2630, i32 0
  %2632 = extractelement <2 x i16> %2630, i32 1
  %2633 = bitcast i32 %2623 to <2 x i16>
  %2634 = extractelement <2 x i16> %2633, i32 0
  %2635 = extractelement <2 x i16> %2633, i32 1
  %2636 = insertelement <8 x i16> undef, i16 %2625, i32 0
  %2637 = insertelement <8 x i16> %2636, i16 %2626, i32 1
  %2638 = insertelement <8 x i16> %2637, i16 %2628, i32 2
  %2639 = insertelement <8 x i16> %2638, i16 %2629, i32 3
  %2640 = insertelement <8 x i16> %2639, i16 %2631, i32 4
  %2641 = insertelement <8 x i16> %2640, i16 %2632, i32 5
  %2642 = insertelement <8 x i16> %2641, i16 %2634, i32 6
  %2643 = insertelement <8 x i16> %2642, i16 %2635, i32 7
  %2644 = extractelement <8 x i16> %2643, i32 0
  %2645 = extractelement <8 x i16> %2643, i32 1
  %2646 = extractelement <8 x i16> %2643, i32 2
  %2647 = extractelement <8 x i16> %2643, i32 3
  %2648 = extractelement <8 x i16> %2643, i32 4
  %2649 = extractelement <8 x i16> %2643, i32 5
  %2650 = extractelement <8 x i16> %2643, i32 6
  %2651 = extractelement <8 x i16> %2643, i32 7
  %2652 = bitcast i16 %2644 to bfloat
  %2653 = bitcast i16 %2645 to bfloat
  %2654 = bitcast i16 %2646 to bfloat
  %2655 = bitcast i16 %2647 to bfloat
  %2656 = bitcast i16 %2648 to bfloat
  %2657 = bitcast i16 %2649 to bfloat
  %2658 = bitcast i16 %2650 to bfloat
  %2659 = bitcast i16 %2651 to bfloat
  %2660 = insertelement <8 x bfloat> undef, bfloat %2652, i32 0
  %2661 = insertelement <8 x bfloat> %2660, bfloat %2653, i32 1
  %2662 = insertelement <8 x bfloat> %2661, bfloat %2654, i32 2
  %2663 = insertelement <8 x bfloat> %2662, bfloat %2655, i32 3
  %2664 = insertelement <8 x bfloat> %2663, bfloat %2656, i32 4
  %2665 = insertelement <8 x bfloat> %2664, bfloat %2657, i32 5
  %2666 = insertelement <8 x bfloat> %2665, bfloat %2658, i32 6
  %2667 = insertelement <8 x bfloat> %2666, bfloat %2659, i32 7
  %2668 = extractelement <8 x bfloat> %2667, i32 0
  %2669 = extractelement <8 x bfloat> %2667, i32 1
  %2670 = extractelement <8 x bfloat> %2667, i32 2
  %2671 = extractelement <8 x bfloat> %2667, i32 3
  %2672 = extractelement <8 x bfloat> %2667, i32 4
  %2673 = extractelement <8 x bfloat> %2667, i32 5
  %2674 = extractelement <8 x bfloat> %2667, i32 6
  %2675 = extractelement <8 x bfloat> %2667, i32 7
  %2676 = load <4 x i32>, ptr addrspace(3) %2255, align 16
  %2677 = extractelement <4 x i32> %2676, i32 0
  %2678 = extractelement <4 x i32> %2676, i32 1
  %2679 = extractelement <4 x i32> %2676, i32 2
  %2680 = extractelement <4 x i32> %2676, i32 3
  %2681 = insertelement <4 x i32> undef, i32 %2677, i32 0
  %2682 = insertelement <4 x i32> %2681, i32 %2678, i32 1
  %2683 = insertelement <4 x i32> %2682, i32 %2679, i32 2
  %2684 = insertelement <4 x i32> %2683, i32 %2680, i32 3
  %2685 = extractelement <4 x i32> %2684, i32 0
  %2686 = extractelement <4 x i32> %2684, i32 1
  %2687 = extractelement <4 x i32> %2684, i32 2
  %2688 = extractelement <4 x i32> %2684, i32 3
  %2689 = bitcast i32 %2685 to <2 x i16>
  %2690 = extractelement <2 x i16> %2689, i32 0
  %2691 = extractelement <2 x i16> %2689, i32 1
  %2692 = bitcast i32 %2686 to <2 x i16>
  %2693 = extractelement <2 x i16> %2692, i32 0
  %2694 = extractelement <2 x i16> %2692, i32 1
  %2695 = bitcast i32 %2687 to <2 x i16>
  %2696 = extractelement <2 x i16> %2695, i32 0
  %2697 = extractelement <2 x i16> %2695, i32 1
  %2698 = bitcast i32 %2688 to <2 x i16>
  %2699 = extractelement <2 x i16> %2698, i32 0
  %2700 = extractelement <2 x i16> %2698, i32 1
  %2701 = insertelement <8 x i16> undef, i16 %2690, i32 0
  %2702 = insertelement <8 x i16> %2701, i16 %2691, i32 1
  %2703 = insertelement <8 x i16> %2702, i16 %2693, i32 2
  %2704 = insertelement <8 x i16> %2703, i16 %2694, i32 3
  %2705 = insertelement <8 x i16> %2704, i16 %2696, i32 4
  %2706 = insertelement <8 x i16> %2705, i16 %2697, i32 5
  %2707 = insertelement <8 x i16> %2706, i16 %2699, i32 6
  %2708 = insertelement <8 x i16> %2707, i16 %2700, i32 7
  %2709 = extractelement <8 x i16> %2708, i32 0
  %2710 = extractelement <8 x i16> %2708, i32 1
  %2711 = extractelement <8 x i16> %2708, i32 2
  %2712 = extractelement <8 x i16> %2708, i32 3
  %2713 = extractelement <8 x i16> %2708, i32 4
  %2714 = extractelement <8 x i16> %2708, i32 5
  %2715 = extractelement <8 x i16> %2708, i32 6
  %2716 = extractelement <8 x i16> %2708, i32 7
  %2717 = bitcast i16 %2709 to bfloat
  %2718 = bitcast i16 %2710 to bfloat
  %2719 = bitcast i16 %2711 to bfloat
  %2720 = bitcast i16 %2712 to bfloat
  %2721 = bitcast i16 %2713 to bfloat
  %2722 = bitcast i16 %2714 to bfloat
  %2723 = bitcast i16 %2715 to bfloat
  %2724 = bitcast i16 %2716 to bfloat
  %2725 = insertelement <8 x bfloat> undef, bfloat %2717, i32 0
  %2726 = insertelement <8 x bfloat> %2725, bfloat %2718, i32 1
  %2727 = insertelement <8 x bfloat> %2726, bfloat %2719, i32 2
  %2728 = insertelement <8 x bfloat> %2727, bfloat %2720, i32 3
  %2729 = insertelement <8 x bfloat> %2728, bfloat %2721, i32 4
  %2730 = insertelement <8 x bfloat> %2729, bfloat %2722, i32 5
  %2731 = insertelement <8 x bfloat> %2730, bfloat %2723, i32 6
  %2732 = insertelement <8 x bfloat> %2731, bfloat %2724, i32 7
  %2733 = extractelement <8 x bfloat> %2732, i32 0
  %2734 = extractelement <8 x bfloat> %2732, i32 1
  %2735 = extractelement <8 x bfloat> %2732, i32 2
  %2736 = extractelement <8 x bfloat> %2732, i32 3
  %2737 = extractelement <8 x bfloat> %2732, i32 4
  %2738 = extractelement <8 x bfloat> %2732, i32 5
  %2739 = extractelement <8 x bfloat> %2732, i32 6
  %2740 = extractelement <8 x bfloat> %2732, i32 7
  call void @llvm.nvvm.barrier0()
  %2741 = insertelement <2 x bfloat> undef, bfloat %1954, i32 0
  %2742 = insertelement <2 x bfloat> %2741, bfloat %1955, i32 1
  %2743 = extractelement <2 x bfloat> %2742, i32 0
  %2744 = extractelement <2 x bfloat> %2742, i32 1
  %2745 = bitcast bfloat %2743 to i16
  %2746 = bitcast bfloat %2744 to i16
  %2747 = insertelement <2 x i16> undef, i16 %2745, i32 0
  %2748 = insertelement <2 x i16> %2747, i16 %2746, i32 1
  %2749 = extractelement <2 x i16> %2748, i32 0
  %2750 = extractelement <2 x i16> %2748, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %2065, i16 %2749, i16 %2750, i1 true)
  %2751 = insertelement <2 x bfloat> undef, bfloat %1956, i32 0
  %2752 = insertelement <2 x bfloat> %2751, bfloat %1957, i32 1
  %2753 = extractelement <2 x bfloat> %2752, i32 0
  %2754 = extractelement <2 x bfloat> %2752, i32 1
  %2755 = bitcast bfloat %2753 to i16
  %2756 = bitcast bfloat %2754 to i16
  %2757 = insertelement <2 x i16> undef, i16 %2755, i32 0
  %2758 = insertelement <2 x i16> %2757, i16 %2756, i32 1
  %2759 = extractelement <2 x i16> %2758, i32 0
  %2760 = extractelement <2 x i16> %2758, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %2080, i16 %2759, i16 %2760, i1 true)
  %2761 = insertelement <2 x bfloat> undef, bfloat %1958, i32 0
  %2762 = insertelement <2 x bfloat> %2761, bfloat %1959, i32 1
  %2763 = extractelement <2 x bfloat> %2762, i32 0
  %2764 = extractelement <2 x bfloat> %2762, i32 1
  %2765 = bitcast bfloat %2763 to i16
  %2766 = bitcast bfloat %2764 to i16
  %2767 = insertelement <2 x i16> undef, i16 %2765, i32 0
  %2768 = insertelement <2 x i16> %2767, i16 %2766, i32 1
  %2769 = extractelement <2 x i16> %2768, i32 0
  %2770 = extractelement <2 x i16> %2768, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %2095, i16 %2769, i16 %2770, i1 true)
  %2771 = insertelement <2 x bfloat> undef, bfloat %1960, i32 0
  %2772 = insertelement <2 x bfloat> %2771, bfloat %1961, i32 1
  %2773 = extractelement <2 x bfloat> %2772, i32 0
  %2774 = extractelement <2 x bfloat> %2772, i32 1
  %2775 = bitcast bfloat %2773 to i16
  %2776 = bitcast bfloat %2774 to i16
  %2777 = insertelement <2 x i16> undef, i16 %2775, i32 0
  %2778 = insertelement <2 x i16> %2777, i16 %2776, i32 1
  %2779 = extractelement <2 x i16> %2778, i32 0
  %2780 = extractelement <2 x i16> %2778, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %2110, i16 %2779, i16 %2780, i1 true)
  %2781 = insertelement <2 x bfloat> undef, bfloat %1962, i32 0
  %2782 = insertelement <2 x bfloat> %2781, bfloat %1963, i32 1
  %2783 = extractelement <2 x bfloat> %2782, i32 0
  %2784 = extractelement <2 x bfloat> %2782, i32 1
  %2785 = bitcast bfloat %2783 to i16
  %2786 = bitcast bfloat %2784 to i16
  %2787 = insertelement <2 x i16> undef, i16 %2785, i32 0
  %2788 = insertelement <2 x i16> %2787, i16 %2786, i32 1
  %2789 = extractelement <2 x i16> %2788, i32 0
  %2790 = extractelement <2 x i16> %2788, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %2125, i16 %2789, i16 %2790, i1 true)
  %2791 = insertelement <2 x bfloat> undef, bfloat %1964, i32 0
  %2792 = insertelement <2 x bfloat> %2791, bfloat %1965, i32 1
  %2793 = extractelement <2 x bfloat> %2792, i32 0
  %2794 = extractelement <2 x bfloat> %2792, i32 1
  %2795 = bitcast bfloat %2793 to i16
  %2796 = bitcast bfloat %2794 to i16
  %2797 = insertelement <2 x i16> undef, i16 %2795, i32 0
  %2798 = insertelement <2 x i16> %2797, i16 %2796, i32 1
  %2799 = extractelement <2 x i16> %2798, i32 0
  %2800 = extractelement <2 x i16> %2798, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %2140, i16 %2799, i16 %2800, i1 true)
  %2801 = insertelement <2 x bfloat> undef, bfloat %1966, i32 0
  %2802 = insertelement <2 x bfloat> %2801, bfloat %1967, i32 1
  %2803 = extractelement <2 x bfloat> %2802, i32 0
  %2804 = extractelement <2 x bfloat> %2802, i32 1
  %2805 = bitcast bfloat %2803 to i16
  %2806 = bitcast bfloat %2804 to i16
  %2807 = insertelement <2 x i16> undef, i16 %2805, i32 0
  %2808 = insertelement <2 x i16> %2807, i16 %2806, i32 1
  %2809 = extractelement <2 x i16> %2808, i32 0
  %2810 = extractelement <2 x i16> %2808, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %2155, i16 %2809, i16 %2810, i1 true)
  %2811 = insertelement <2 x bfloat> undef, bfloat %1968, i32 0
  %2812 = insertelement <2 x bfloat> %2811, bfloat %1969, i32 1
  %2813 = extractelement <2 x bfloat> %2812, i32 0
  %2814 = extractelement <2 x bfloat> %2812, i32 1
  %2815 = bitcast bfloat %2813 to i16
  %2816 = bitcast bfloat %2814 to i16
  %2817 = insertelement <2 x i16> undef, i16 %2815, i32 0
  %2818 = insertelement <2 x i16> %2817, i16 %2816, i32 1
  %2819 = extractelement <2 x i16> %2818, i32 0
  %2820 = extractelement <2 x i16> %2818, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %2170, i16 %2819, i16 %2820, i1 true)
  call void @llvm.nvvm.barrier0()
  %2821 = load <4 x i32>, ptr addrspace(3) %2185, align 16
  %2822 = extractelement <4 x i32> %2821, i32 0
  %2823 = extractelement <4 x i32> %2821, i32 1
  %2824 = extractelement <4 x i32> %2821, i32 2
  %2825 = extractelement <4 x i32> %2821, i32 3
  %2826 = insertelement <4 x i32> undef, i32 %2822, i32 0
  %2827 = insertelement <4 x i32> %2826, i32 %2823, i32 1
  %2828 = insertelement <4 x i32> %2827, i32 %2824, i32 2
  %2829 = insertelement <4 x i32> %2828, i32 %2825, i32 3
  %2830 = extractelement <4 x i32> %2829, i32 0
  %2831 = extractelement <4 x i32> %2829, i32 1
  %2832 = extractelement <4 x i32> %2829, i32 2
  %2833 = extractelement <4 x i32> %2829, i32 3
  %2834 = bitcast i32 %2830 to <2 x i16>
  %2835 = extractelement <2 x i16> %2834, i32 0
  %2836 = extractelement <2 x i16> %2834, i32 1
  %2837 = bitcast i32 %2831 to <2 x i16>
  %2838 = extractelement <2 x i16> %2837, i32 0
  %2839 = extractelement <2 x i16> %2837, i32 1
  %2840 = bitcast i32 %2832 to <2 x i16>
  %2841 = extractelement <2 x i16> %2840, i32 0
  %2842 = extractelement <2 x i16> %2840, i32 1
  %2843 = bitcast i32 %2833 to <2 x i16>
  %2844 = extractelement <2 x i16> %2843, i32 0
  %2845 = extractelement <2 x i16> %2843, i32 1
  %2846 = insertelement <8 x i16> undef, i16 %2835, i32 0
  %2847 = insertelement <8 x i16> %2846, i16 %2836, i32 1
  %2848 = insertelement <8 x i16> %2847, i16 %2838, i32 2
  %2849 = insertelement <8 x i16> %2848, i16 %2839, i32 3
  %2850 = insertelement <8 x i16> %2849, i16 %2841, i32 4
  %2851 = insertelement <8 x i16> %2850, i16 %2842, i32 5
  %2852 = insertelement <8 x i16> %2851, i16 %2844, i32 6
  %2853 = insertelement <8 x i16> %2852, i16 %2845, i32 7
  %2854 = extractelement <8 x i16> %2853, i32 0
  %2855 = extractelement <8 x i16> %2853, i32 1
  %2856 = extractelement <8 x i16> %2853, i32 2
  %2857 = extractelement <8 x i16> %2853, i32 3
  %2858 = extractelement <8 x i16> %2853, i32 4
  %2859 = extractelement <8 x i16> %2853, i32 5
  %2860 = extractelement <8 x i16> %2853, i32 6
  %2861 = extractelement <8 x i16> %2853, i32 7
  %2862 = bitcast i16 %2854 to bfloat
  %2863 = bitcast i16 %2855 to bfloat
  %2864 = bitcast i16 %2856 to bfloat
  %2865 = bitcast i16 %2857 to bfloat
  %2866 = bitcast i16 %2858 to bfloat
  %2867 = bitcast i16 %2859 to bfloat
  %2868 = bitcast i16 %2860 to bfloat
  %2869 = bitcast i16 %2861 to bfloat
  %2870 = insertelement <8 x bfloat> undef, bfloat %2862, i32 0
  %2871 = insertelement <8 x bfloat> %2870, bfloat %2863, i32 1
  %2872 = insertelement <8 x bfloat> %2871, bfloat %2864, i32 2
  %2873 = insertelement <8 x bfloat> %2872, bfloat %2865, i32 3
  %2874 = insertelement <8 x bfloat> %2873, bfloat %2866, i32 4
  %2875 = insertelement <8 x bfloat> %2874, bfloat %2867, i32 5
  %2876 = insertelement <8 x bfloat> %2875, bfloat %2868, i32 6
  %2877 = insertelement <8 x bfloat> %2876, bfloat %2869, i32 7
  %2878 = extractelement <8 x bfloat> %2877, i32 0
  %2879 = extractelement <8 x bfloat> %2877, i32 1
  %2880 = extractelement <8 x bfloat> %2877, i32 2
  %2881 = extractelement <8 x bfloat> %2877, i32 3
  %2882 = extractelement <8 x bfloat> %2877, i32 4
  %2883 = extractelement <8 x bfloat> %2877, i32 5
  %2884 = extractelement <8 x bfloat> %2877, i32 6
  %2885 = extractelement <8 x bfloat> %2877, i32 7
  %2886 = load <4 x i32>, ptr addrspace(3) %2255, align 16
  %2887 = extractelement <4 x i32> %2886, i32 0
  %2888 = extractelement <4 x i32> %2886, i32 1
  %2889 = extractelement <4 x i32> %2886, i32 2
  %2890 = extractelement <4 x i32> %2886, i32 3
  %2891 = insertelement <4 x i32> undef, i32 %2887, i32 0
  %2892 = insertelement <4 x i32> %2891, i32 %2888, i32 1
  %2893 = insertelement <4 x i32> %2892, i32 %2889, i32 2
  %2894 = insertelement <4 x i32> %2893, i32 %2890, i32 3
  %2895 = extractelement <4 x i32> %2894, i32 0
  %2896 = extractelement <4 x i32> %2894, i32 1
  %2897 = extractelement <4 x i32> %2894, i32 2
  %2898 = extractelement <4 x i32> %2894, i32 3
  %2899 = bitcast i32 %2895 to <2 x i16>
  %2900 = extractelement <2 x i16> %2899, i32 0
  %2901 = extractelement <2 x i16> %2899, i32 1
  %2902 = bitcast i32 %2896 to <2 x i16>
  %2903 = extractelement <2 x i16> %2902, i32 0
  %2904 = extractelement <2 x i16> %2902, i32 1
  %2905 = bitcast i32 %2897 to <2 x i16>
  %2906 = extractelement <2 x i16> %2905, i32 0
  %2907 = extractelement <2 x i16> %2905, i32 1
  %2908 = bitcast i32 %2898 to <2 x i16>
  %2909 = extractelement <2 x i16> %2908, i32 0
  %2910 = extractelement <2 x i16> %2908, i32 1
  %2911 = insertelement <8 x i16> undef, i16 %2900, i32 0
  %2912 = insertelement <8 x i16> %2911, i16 %2901, i32 1
  %2913 = insertelement <8 x i16> %2912, i16 %2903, i32 2
  %2914 = insertelement <8 x i16> %2913, i16 %2904, i32 3
  %2915 = insertelement <8 x i16> %2914, i16 %2906, i32 4
  %2916 = insertelement <8 x i16> %2915, i16 %2907, i32 5
  %2917 = insertelement <8 x i16> %2916, i16 %2909, i32 6
  %2918 = insertelement <8 x i16> %2917, i16 %2910, i32 7
  %2919 = extractelement <8 x i16> %2918, i32 0
  %2920 = extractelement <8 x i16> %2918, i32 1
  %2921 = extractelement <8 x i16> %2918, i32 2
  %2922 = extractelement <8 x i16> %2918, i32 3
  %2923 = extractelement <8 x i16> %2918, i32 4
  %2924 = extractelement <8 x i16> %2918, i32 5
  %2925 = extractelement <8 x i16> %2918, i32 6
  %2926 = extractelement <8 x i16> %2918, i32 7
  %2927 = bitcast i16 %2919 to bfloat
  %2928 = bitcast i16 %2920 to bfloat
  %2929 = bitcast i16 %2921 to bfloat
  %2930 = bitcast i16 %2922 to bfloat
  %2931 = bitcast i16 %2923 to bfloat
  %2932 = bitcast i16 %2924 to bfloat
  %2933 = bitcast i16 %2925 to bfloat
  %2934 = bitcast i16 %2926 to bfloat
  %2935 = insertelement <8 x bfloat> undef, bfloat %2927, i32 0
  %2936 = insertelement <8 x bfloat> %2935, bfloat %2928, i32 1
  %2937 = insertelement <8 x bfloat> %2936, bfloat %2929, i32 2
  %2938 = insertelement <8 x bfloat> %2937, bfloat %2930, i32 3
  %2939 = insertelement <8 x bfloat> %2938, bfloat %2931, i32 4
  %2940 = insertelement <8 x bfloat> %2939, bfloat %2932, i32 5
  %2941 = insertelement <8 x bfloat> %2940, bfloat %2933, i32 6
  %2942 = insertelement <8 x bfloat> %2941, bfloat %2934, i32 7
  %2943 = extractelement <8 x bfloat> %2942, i32 0
  %2944 = extractelement <8 x bfloat> %2942, i32 1
  %2945 = extractelement <8 x bfloat> %2942, i32 2
  %2946 = extractelement <8 x bfloat> %2942, i32 3
  %2947 = extractelement <8 x bfloat> %2942, i32 4
  %2948 = extractelement <8 x bfloat> %2942, i32 5
  %2949 = extractelement <8 x bfloat> %2942, i32 6
  %2950 = extractelement <8 x bfloat> %2942, i32 7
  %2951 = insertelement <2 x bfloat> undef, bfloat %2243, i32 0
  %2952 = insertelement <2 x bfloat> %2951, bfloat %2244, i32 1
  %2953 = bitcast <2 x bfloat> %2952 to i32
  %2954 = insertelement <2 x bfloat> undef, bfloat %2245, i32 0
  %2955 = insertelement <2 x bfloat> %2954, bfloat %2246, i32 1
  %2956 = bitcast <2 x bfloat> %2955 to i32
  %2957 = insertelement <2 x bfloat> undef, bfloat %2247, i32 0
  %2958 = insertelement <2 x bfloat> %2957, bfloat %2248, i32 1
  %2959 = bitcast <2 x bfloat> %2958 to i32
  %2960 = insertelement <2 x bfloat> undef, bfloat %2249, i32 0
  %2961 = insertelement <2 x bfloat> %2960, bfloat %2250, i32 1
  %2962 = bitcast <2 x bfloat> %2961 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %2953, i32 %2956, i32 %2959, i32 %2962, ptr addrspace(1) %2032)
  %2963 = insertelement <2 x bfloat> undef, bfloat %2313, i32 0
  %2964 = insertelement <2 x bfloat> %2963, bfloat %2314, i32 1
  %2965 = bitcast <2 x bfloat> %2964 to i32
  %2966 = insertelement <2 x bfloat> undef, bfloat %2315, i32 0
  %2967 = insertelement <2 x bfloat> %2966, bfloat %2316, i32 1
  %2968 = bitcast <2 x bfloat> %2967 to i32
  %2969 = insertelement <2 x bfloat> undef, bfloat %2317, i32 0
  %2970 = insertelement <2 x bfloat> %2969, bfloat %2318, i32 1
  %2971 = bitcast <2 x bfloat> %2970 to i32
  %2972 = insertelement <2 x bfloat> undef, bfloat %2319, i32 0
  %2973 = insertelement <2 x bfloat> %2972, bfloat %2320, i32 1
  %2974 = bitcast <2 x bfloat> %2973 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %2965, i32 %2968, i32 %2971, i32 %2974, ptr addrspace(1) %2033)
  %2975 = insertelement <2 x bfloat> undef, bfloat %2458, i32 0
  %2976 = insertelement <2 x bfloat> %2975, bfloat %2459, i32 1
  %2977 = bitcast <2 x bfloat> %2976 to i32
  %2978 = insertelement <2 x bfloat> undef, bfloat %2460, i32 0
  %2979 = insertelement <2 x bfloat> %2978, bfloat %2461, i32 1
  %2980 = bitcast <2 x bfloat> %2979 to i32
  %2981 = insertelement <2 x bfloat> undef, bfloat %2462, i32 0
  %2982 = insertelement <2 x bfloat> %2981, bfloat %2463, i32 1
  %2983 = bitcast <2 x bfloat> %2982 to i32
  %2984 = insertelement <2 x bfloat> undef, bfloat %2464, i32 0
  %2985 = insertelement <2 x bfloat> %2984, bfloat %2465, i32 1
  %2986 = bitcast <2 x bfloat> %2985 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %2977, i32 %2980, i32 %2983, i32 %2986, ptr addrspace(1) %2034)
  %2987 = insertelement <2 x bfloat> undef, bfloat %2523, i32 0
  %2988 = insertelement <2 x bfloat> %2987, bfloat %2524, i32 1
  %2989 = bitcast <2 x bfloat> %2988 to i32
  %2990 = insertelement <2 x bfloat> undef, bfloat %2525, i32 0
  %2991 = insertelement <2 x bfloat> %2990, bfloat %2526, i32 1
  %2992 = bitcast <2 x bfloat> %2991 to i32
  %2993 = insertelement <2 x bfloat> undef, bfloat %2527, i32 0
  %2994 = insertelement <2 x bfloat> %2993, bfloat %2528, i32 1
  %2995 = bitcast <2 x bfloat> %2994 to i32
  %2996 = insertelement <2 x bfloat> undef, bfloat %2529, i32 0
  %2997 = insertelement <2 x bfloat> %2996, bfloat %2530, i32 1
  %2998 = bitcast <2 x bfloat> %2997 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %2989, i32 %2992, i32 %2995, i32 %2998, ptr addrspace(1) %2035)
  %2999 = insertelement <2 x bfloat> undef, bfloat %2668, i32 0
  %3000 = insertelement <2 x bfloat> %2999, bfloat %2669, i32 1
  %3001 = bitcast <2 x bfloat> %3000 to i32
  %3002 = insertelement <2 x bfloat> undef, bfloat %2670, i32 0
  %3003 = insertelement <2 x bfloat> %3002, bfloat %2671, i32 1
  %3004 = bitcast <2 x bfloat> %3003 to i32
  %3005 = insertelement <2 x bfloat> undef, bfloat %2672, i32 0
  %3006 = insertelement <2 x bfloat> %3005, bfloat %2673, i32 1
  %3007 = bitcast <2 x bfloat> %3006 to i32
  %3008 = insertelement <2 x bfloat> undef, bfloat %2674, i32 0
  %3009 = insertelement <2 x bfloat> %3008, bfloat %2675, i32 1
  %3010 = bitcast <2 x bfloat> %3009 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %3001, i32 %3004, i32 %3007, i32 %3010, ptr addrspace(1) %2036)
  %3011 = insertelement <2 x bfloat> undef, bfloat %2733, i32 0
  %3012 = insertelement <2 x bfloat> %3011, bfloat %2734, i32 1
  %3013 = bitcast <2 x bfloat> %3012 to i32
  %3014 = insertelement <2 x bfloat> undef, bfloat %2735, i32 0
  %3015 = insertelement <2 x bfloat> %3014, bfloat %2736, i32 1
  %3016 = bitcast <2 x bfloat> %3015 to i32
  %3017 = insertelement <2 x bfloat> undef, bfloat %2737, i32 0
  %3018 = insertelement <2 x bfloat> %3017, bfloat %2738, i32 1
  %3019 = bitcast <2 x bfloat> %3018 to i32
  %3020 = insertelement <2 x bfloat> undef, bfloat %2739, i32 0
  %3021 = insertelement <2 x bfloat> %3020, bfloat %2740, i32 1
  %3022 = bitcast <2 x bfloat> %3021 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %3013, i32 %3016, i32 %3019, i32 %3022, ptr addrspace(1) %2037)
  %3023 = insertelement <2 x bfloat> undef, bfloat %2878, i32 0
  %3024 = insertelement <2 x bfloat> %3023, bfloat %2879, i32 1
  %3025 = bitcast <2 x bfloat> %3024 to i32
  %3026 = insertelement <2 x bfloat> undef, bfloat %2880, i32 0
  %3027 = insertelement <2 x bfloat> %3026, bfloat %2881, i32 1
  %3028 = bitcast <2 x bfloat> %3027 to i32
  %3029 = insertelement <2 x bfloat> undef, bfloat %2882, i32 0
  %3030 = insertelement <2 x bfloat> %3029, bfloat %2883, i32 1
  %3031 = bitcast <2 x bfloat> %3030 to i32
  %3032 = insertelement <2 x bfloat> undef, bfloat %2884, i32 0
  %3033 = insertelement <2 x bfloat> %3032, bfloat %2885, i32 1
  %3034 = bitcast <2 x bfloat> %3033 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %3025, i32 %3028, i32 %3031, i32 %3034, ptr addrspace(1) %2038)
  %3035 = insertelement <2 x bfloat> undef, bfloat %2943, i32 0
  %3036 = insertelement <2 x bfloat> %3035, bfloat %2944, i32 1
  %3037 = bitcast <2 x bfloat> %3036 to i32
  %3038 = insertelement <2 x bfloat> undef, bfloat %2945, i32 0
  %3039 = insertelement <2 x bfloat> %3038, bfloat %2946, i32 1
  %3040 = bitcast <2 x bfloat> %3039 to i32
  %3041 = insertelement <2 x bfloat> undef, bfloat %2947, i32 0
  %3042 = insertelement <2 x bfloat> %3041, bfloat %2948, i32 1
  %3043 = bitcast <2 x bfloat> %3042 to i32
  %3044 = insertelement <2 x bfloat> undef, bfloat %2949, i32 0
  %3045 = insertelement <2 x bfloat> %3044, bfloat %2950, i32 1
  %3046 = bitcast <2 x bfloat> %3045 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %3037, i32 %3040, i32 %3043, i32 %3046, ptr addrspace(1) %2039)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_243_impl(ptr, ptr, ptr, ptr, ptr, ptr) #5

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #6

declare float @__nv_rsqrtf(float)

define ptx_kernel void @fusion_243(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(2490368) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4) #7 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %6 = addrspacecast ptr null to ptr addrspace(1)
  %7 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %8 = sext i32 %7 to i64
  %9 = mul i64 %8, 19456
  %10 = add i64 %9, 18432
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

define ptx_kernel void @loop_convert_fusion_18(ptr noalias align 128 dereferenceable(786432) %0, ptr noalias align 128 dereferenceable(393216) %1) #0 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %5 = udiv i32 %4, 24
  %6 = urem i32 %4, 24
  %7 = mul i32 %6, 128
  %8 = add i32 %7, %3
  %9 = call bfloat @fused_convert_18_param_0_564(ptr %0, i32 %5, i32 %8)
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
  %20 = call bfloat @fused_convert_18_param_0_564(ptr %0, i32 %5, i32 %19)
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

define internal bfloat @fused_convert_18_param_0_564(ptr noalias %0, i32 %1, i32 %2) {
  %4 = mul i32 %1, 6144
  %5 = add i32 %4, %2
  %6 = getelementptr inbounds bfloat, ptr %0, i32 %5
  %7 = load bfloat, ptr %6, align 2, !invariant.load !3
  ret bfloat %7
}

declare float @__nv_fast_expf(float)

declare ptx_kernel void @fusion_242_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr) #5

define ptx_kernel void @fusion_242(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(2490368) %arg2, ptr noalias align 128 dereferenceable(131072) %arg3, ptr noalias align 16 dereferenceable(2048) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5) #7 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %6 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %7 = addrspacecast ptr null to ptr addrspace(1)
  %8 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %9 = sext i32 %8 to i64
  %10 = mul i64 %9, 19456
  %11 = add i64 %10, 17408
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
  %152 = add i64 %10, 18432
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

declare ptx_kernel void @fusion_241_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #5

define ptx_kernel void @fusion_241(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(2490368) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6) #7 {
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
  %11 = mul i64 %10, 19456
  %12 = add i64 %11, 16384
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
  %153 = add i64 %11, 17408
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
  %260 = add i64 %11, 18432
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

declare ptx_kernel void @fusion_240_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #5

define ptx_kernel void @fusion_240(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(2490368) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6, ptr noalias align 128 dereferenceable(131072) %arg7) #7 {
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
  %12 = mul i64 %11, 19456
  %13 = add i64 %12, 15360
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
  %154 = add i64 %12, 16384
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
  %261 = add i64 %12, 17408
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
  %368 = add i64 %12, 18432
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

define ptx_kernel void @loop_add_fusion(ptr noalias align 128 dereferenceable(2490368) %0, ptr noalias align 128 dereferenceable(131072) %1, ptr noalias align 128 dereferenceable(131072) %2, ptr noalias align 128 dereferenceable(131072) %3, ptr noalias align 128 dereferenceable(131072) %4, ptr noalias align 128 dereferenceable(131072) %5, ptr noalias align 128 dereferenceable(262144) %6) #0 {
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %10 = udiv i32 %9, 8
  %11 = urem i32 %9, 8
  %12 = mul i32 %11, 128
  %13 = add i32 %12, %8
  %14 = mul i32 %9, 128
  %15 = add i32 %14, %8
  %16 = getelementptr inbounds bfloat, ptr %3, i32 %15
  %17 = load bfloat, ptr %16, align 2, !invariant.load !3
  %18 = getelementptr inbounds bfloat, ptr %4, i32 %15
  %19 = load bfloat, ptr %18, align 2, !invariant.load !3
  %20 = add i32 %13, 18432
  %21 = call float @fused_add_convert_926_29(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %10, i32 %20)
  %22 = fpext bfloat %17 to float
  %23 = fpext bfloat %19 to float
  %24 = fadd float %21, %22
  %25 = getelementptr inbounds bfloat, ptr %5, i32 %15
  %26 = load bfloat, ptr %25, align 2, !invariant.load !3
  %27 = add i32 %13, 17408
  %28 = call float @fused_add_convert_926_29(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %10, i32 %27)
  %29 = fadd float %23, %24
  %30 = fpext bfloat %26 to float
  %31 = fadd float %28, %29
  %32 = getelementptr inbounds bfloat, ptr %2, i32 %15
  %33 = load bfloat, ptr %32, align 2, !invariant.load !3
  %34 = add i32 %13, 16384
  %35 = call float @fused_add_convert_926_29(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %10, i32 %34)
  %36 = fadd float %30, %31
  %37 = fpext bfloat %33 to float
  %38 = fadd float %35, %36
  %39 = getelementptr inbounds bfloat, ptr %1, i32 %15
  %40 = load bfloat, ptr %39, align 2, !invariant.load !3
  %41 = add i32 %13, 15360
  %42 = call float @fused_add_convert_926_29(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %10, i32 %41)
  %43 = fadd float %37, %38
  %44 = fpext bfloat %40 to float
  %45 = fadd float %42, %43
  %46 = add i32 %13, 14336
  %47 = call float @fused_add_convert_926_29(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %10, i32 %46)
  %48 = fadd float %44, %45
  %49 = fadd float %47, %48
  %50 = getelementptr inbounds float, ptr %6, i32 %15
  store float %49, ptr %50, align 4
  ret void
}

define internal float @fused_add_convert_926_29(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, i32 %6, i32 %7) {
  %9 = mul i32 %6, 19456
  %10 = add i32 %9, %7
  %11 = getelementptr inbounds bfloat, ptr %0, i32 %10
  %12 = load bfloat, ptr %11, align 2, !invariant.load !3
  %13 = fpext bfloat %12 to float
  ret float %13
}

declare ptx_kernel void @fusion_239_impl(ptr, ptr, ptr, ptr, ptr) #5

define ptx_kernel void @fusion_239(ptr noalias align 128 dereferenceable(262144) %arg0, ptr noalias align 16 dereferenceable(4) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(131072) %arg3) #7 {
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

declare ptx_kernel void @fusion_238_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr) #5

define ptx_kernel void @fusion_238(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(262144) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(2490368) %arg3, ptr noalias align 16 dereferenceable(2048) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5) #7 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %6 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %7 = addrspacecast ptr null to ptr addrspace(1)
  %8 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %9 = sext i32 %8 to i64
  %10 = mul i64 %9, 19456
  %11 = add i64 %10, 13312
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

declare ptx_kernel void @fusion_237_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #5

define ptx_kernel void @fusion_237(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(262144) %arg2, ptr noalias align 128 dereferenceable(131072) %arg3, ptr noalias align 128 dereferenceable(2490368) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6) #7 {
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
  %11 = mul i64 %10, 19456
  %12 = add i64 %11, 12288
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
  %159 = add i64 %11, 13312
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

declare ptx_kernel void @fusion_236_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #5

define ptx_kernel void @fusion_236(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(2490368) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(262144) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6, ptr noalias align 128 dereferenceable(131072) %arg7) #7 {
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
  %12 = mul i64 %11, 19456
  %13 = add i64 %12, 11264
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
  %107 = getelementptr bfloat, ptr addrspace(1) %2, i64 %106
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
  %160 = add i64 %12, 12288
  %161 = getelementptr bfloat, ptr addrspace(1) %3, i64 %160
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
  %267 = add i64 %12, 13312
  %268 = getelementptr bfloat, ptr addrspace(1) %3, i64 %267
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
  %630 = getelementptr bfloat, ptr addrspace(1) %4, i64 %50
  %631 = getelementptr bfloat, ptr addrspace(1) %4, i64 %52
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

define ptx_kernel void @loop_add_fusion_1(ptr noalias align 128 dereferenceable(2490368) %0, ptr noalias align 128 dereferenceable(131072) %1, ptr noalias align 128 dereferenceable(131072) %2, ptr noalias align 128 dereferenceable(262144) %3, ptr noalias align 128 dereferenceable(131072) %4, ptr noalias align 128 dereferenceable(131072) %5) #0 {
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %9 = udiv i32 %8, 8
  %10 = urem i32 %8, 8
  %11 = mul i32 %10, 128
  %12 = add i32 %11, %7
  %13 = mul i32 %8, 128
  %14 = add i32 %13, %7
  %15 = getelementptr inbounds bfloat, ptr %4, i32 %14
  %16 = load bfloat, ptr %15, align 2, !invariant.load !3
  %17 = fpext bfloat %16 to float
  %18 = getelementptr inbounds float, ptr %3, i32 %14
  %19 = load float, ptr %18, align 4
  %20 = getelementptr inbounds bfloat, ptr %5, i32 %14
  %21 = load bfloat, ptr %20, align 2, !invariant.load !3
  %22 = add i32 %12, 13312
  %23 = call float @fused_add_1_convert_926_37(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %9, i32 %22)
  %24 = fadd float %17, %19
  %25 = fpext bfloat %21 to float
  %26 = fadd float %23, %24
  %27 = getelementptr inbounds bfloat, ptr %2, i32 %14
  %28 = load bfloat, ptr %27, align 2, !invariant.load !3
  %29 = add i32 %12, 12288
  %30 = call float @fused_add_1_convert_926_37(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %9, i32 %29)
  %31 = fadd float %25, %26
  %32 = fpext bfloat %28 to float
  %33 = fadd float %30, %31
  %34 = getelementptr inbounds bfloat, ptr %1, i32 %14
  %35 = load bfloat, ptr %34, align 2, !invariant.load !3
  %36 = add i32 %12, 11264
  %37 = call float @fused_add_1_convert_926_37(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %9, i32 %36)
  %38 = fadd float %32, %33
  %39 = fpext bfloat %35 to float
  %40 = fadd float %37, %38
  %41 = add i32 %12, 10240
  %42 = call float @fused_add_1_convert_926_37(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %9, i32 %41)
  %43 = fadd float %39, %40
  %44 = fadd float %42, %43
  store float %44, ptr %18, align 4
  ret void
}

define internal float @fused_add_1_convert_926_37(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, i32 %6, i32 %7) {
  %9 = mul i32 %6, 19456
  %10 = add i32 %9, %7
  %11 = getelementptr inbounds bfloat, ptr %0, i32 %10
  %12 = load bfloat, ptr %11, align 2, !invariant.load !3
  %13 = fpext bfloat %12 to float
  ret float %13
}

declare ptx_kernel void @fusion_234_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr) #5

define ptx_kernel void @fusion_234(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(262144) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(2490368) %arg3, ptr noalias align 16 dereferenceable(2048) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5) #7 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %6 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %7 = addrspacecast ptr null to ptr addrspace(1)
  %8 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %9 = sext i32 %8 to i64
  %10 = mul i64 %9, 19456
  %11 = add i64 %10, 9216
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

declare ptx_kernel void @fusion_233_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #5

define ptx_kernel void @fusion_233(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(262144) %arg2, ptr noalias align 128 dereferenceable(131072) %arg3, ptr noalias align 128 dereferenceable(2490368) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6) #7 {
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
  %11 = mul i64 %10, 19456
  %12 = add i64 %11, 8192
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
  %159 = add i64 %11, 9216
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

declare ptx_kernel void @fusion_232_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #5

define ptx_kernel void @fusion_232(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(2490368) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(262144) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6, ptr noalias align 128 dereferenceable(131072) %arg7) #7 {
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
  %12 = mul i64 %11, 19456
  %13 = add i64 %12, 7168
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
  %107 = getelementptr bfloat, ptr addrspace(1) %2, i64 %106
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
  %160 = add i64 %12, 8192
  %161 = getelementptr bfloat, ptr addrspace(1) %3, i64 %160
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
  %267 = add i64 %12, 9216
  %268 = getelementptr bfloat, ptr addrspace(1) %3, i64 %267
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
  %630 = getelementptr bfloat, ptr addrspace(1) %4, i64 %50
  %631 = getelementptr bfloat, ptr addrspace(1) %4, i64 %52
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

define ptx_kernel void @loop_add_fusion_2(ptr noalias align 128 dereferenceable(2490368) %0, ptr noalias align 128 dereferenceable(131072) %1, ptr noalias align 128 dereferenceable(131072) %2, ptr noalias align 128 dereferenceable(262144) %3, ptr noalias align 128 dereferenceable(131072) %4, ptr noalias align 128 dereferenceable(131072) %5) #0 {
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %9 = udiv i32 %8, 8
  %10 = urem i32 %8, 8
  %11 = mul i32 %10, 128
  %12 = add i32 %11, %7
  %13 = mul i32 %8, 128
  %14 = add i32 %13, %7
  %15 = getelementptr inbounds bfloat, ptr %4, i32 %14
  %16 = load bfloat, ptr %15, align 2, !invariant.load !3
  %17 = fpext bfloat %16 to float
  %18 = getelementptr inbounds float, ptr %3, i32 %14
  %19 = load float, ptr %18, align 4
  %20 = getelementptr inbounds bfloat, ptr %5, i32 %14
  %21 = load bfloat, ptr %20, align 2, !invariant.load !3
  %22 = add i32 %12, 9216
  %23 = call float @fused_add_2_convert_926_45(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %9, i32 %22)
  %24 = fadd float %17, %19
  %25 = fpext bfloat %21 to float
  %26 = fadd float %23, %24
  %27 = getelementptr inbounds bfloat, ptr %2, i32 %14
  %28 = load bfloat, ptr %27, align 2, !invariant.load !3
  %29 = add i32 %12, 8192
  %30 = call float @fused_add_2_convert_926_45(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %9, i32 %29)
  %31 = fadd float %25, %26
  %32 = fpext bfloat %28 to float
  %33 = fadd float %30, %31
  %34 = getelementptr inbounds bfloat, ptr %1, i32 %14
  %35 = load bfloat, ptr %34, align 2, !invariant.load !3
  %36 = add i32 %12, 7168
  %37 = call float @fused_add_2_convert_926_45(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %9, i32 %36)
  %38 = fadd float %32, %33
  %39 = fpext bfloat %35 to float
  %40 = fadd float %37, %38
  %41 = add i32 %12, 6144
  %42 = call float @fused_add_2_convert_926_45(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %9, i32 %41)
  %43 = fadd float %39, %40
  %44 = fadd float %42, %43
  store float %44, ptr %18, align 4
  ret void
}

define internal float @fused_add_2_convert_926_45(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, i32 %6, i32 %7) {
  %9 = mul i32 %6, 19456
  %10 = add i32 %9, %7
  %11 = getelementptr inbounds bfloat, ptr %0, i32 %10
  %12 = load bfloat, ptr %11, align 2, !invariant.load !3
  %13 = fpext bfloat %12 to float
  ret float %13
}

declare ptx_kernel void @fusion_230_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr) #5

define ptx_kernel void @fusion_230(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(262144) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(2490368) %arg3, ptr noalias align 16 dereferenceable(2048) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5) #7 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %6 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %7 = addrspacecast ptr null to ptr addrspace(1)
  %8 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %9 = sext i32 %8 to i64
  %10 = mul i64 %9, 19456
  %11 = add i64 %10, 5120
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

declare ptx_kernel void @fusion_229_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #5

define ptx_kernel void @fusion_229(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(262144) %arg2, ptr noalias align 128 dereferenceable(131072) %arg3, ptr noalias align 128 dereferenceable(2490368) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6) #7 {
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
  %11 = mul i64 %10, 19456
  %12 = add i64 %11, 4096
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
  %159 = add i64 %11, 5120
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

declare ptx_kernel void @fusion_228_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #5

define ptx_kernel void @fusion_228(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(2490368) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(262144) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6, ptr noalias align 128 dereferenceable(131072) %arg7) #7 {
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
  %12 = mul i64 %11, 19456
  %13 = add i64 %12, 3072
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
  %107 = getelementptr bfloat, ptr addrspace(1) %2, i64 %106
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
  %160 = add i64 %12, 4096
  %161 = getelementptr bfloat, ptr addrspace(1) %3, i64 %160
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
  %267 = add i64 %12, 5120
  %268 = getelementptr bfloat, ptr addrspace(1) %3, i64 %267
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
  %630 = getelementptr bfloat, ptr addrspace(1) %4, i64 %50
  %631 = getelementptr bfloat, ptr addrspace(1) %4, i64 %52
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

define ptx_kernel void @loop_add_fusion_3(ptr noalias align 128 dereferenceable(2490368) %0, ptr noalias align 128 dereferenceable(131072) %1, ptr noalias align 128 dereferenceable(131072) %2, ptr noalias align 128 dereferenceable(262144) %3, ptr noalias align 128 dereferenceable(131072) %4, ptr noalias align 128 dereferenceable(131072) %5) #0 {
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %9 = udiv i32 %8, 8
  %10 = urem i32 %8, 8
  %11 = mul i32 %10, 128
  %12 = add i32 %11, %7
  %13 = mul i32 %8, 128
  %14 = add i32 %13, %7
  %15 = getelementptr inbounds bfloat, ptr %4, i32 %14
  %16 = load bfloat, ptr %15, align 2, !invariant.load !3
  %17 = fpext bfloat %16 to float
  %18 = getelementptr inbounds float, ptr %3, i32 %14
  %19 = load float, ptr %18, align 4
  %20 = getelementptr inbounds bfloat, ptr %5, i32 %14
  %21 = load bfloat, ptr %20, align 2, !invariant.load !3
  %22 = add i32 %12, 5120
  %23 = call float @fused_add_3_convert_926_53(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %9, i32 %22)
  %24 = fadd float %17, %19
  %25 = fpext bfloat %21 to float
  %26 = fadd float %23, %24
  %27 = getelementptr inbounds bfloat, ptr %2, i32 %14
  %28 = load bfloat, ptr %27, align 2, !invariant.load !3
  %29 = add i32 %12, 4096
  %30 = call float @fused_add_3_convert_926_53(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %9, i32 %29)
  %31 = fadd float %25, %26
  %32 = fpext bfloat %28 to float
  %33 = fadd float %30, %31
  %34 = getelementptr inbounds bfloat, ptr %1, i32 %14
  %35 = load bfloat, ptr %34, align 2, !invariant.load !3
  %36 = add i32 %12, 3072
  %37 = call float @fused_add_3_convert_926_53(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %9, i32 %36)
  %38 = fadd float %32, %33
  %39 = fpext bfloat %35 to float
  %40 = fadd float %37, %38
  %41 = add i32 %12, 2048
  %42 = call float @fused_add_3_convert_926_53(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %9, i32 %41)
  %43 = fadd float %39, %40
  %44 = fadd float %42, %43
  store float %44, ptr %18, align 4
  ret void
}

define internal float @fused_add_3_convert_926_53(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, i32 %6, i32 %7) {
  %9 = mul i32 %6, 19456
  %10 = add i32 %9, %7
  %11 = getelementptr inbounds bfloat, ptr %0, i32 %10
  %12 = load bfloat, ptr %11, align 2, !invariant.load !3
  %13 = fpext bfloat %12 to float
  ret float %13
}

declare ptx_kernel void @fusion_226_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr) #5

define ptx_kernel void @fusion_226(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(262144) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(2490368) %arg3, ptr noalias align 16 dereferenceable(2048) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5) #7 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %6 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %7 = addrspacecast ptr null to ptr addrspace(1)
  %8 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %9 = sext i32 %8 to i64
  %10 = mul i64 %9, 19456
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

declare ptx_kernel void @fusion_225_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #5

define ptx_kernel void @fusion_225(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(262144) %arg2, ptr noalias align 128 dereferenceable(131072) %arg3, ptr noalias align 128 dereferenceable(2490368) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6) #7 {
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
  %11 = mul i64 %10, 19456
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

declare ptx_kernel void @fusion_223_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #5

define ptx_kernel void @fusion_223(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(262144) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4, ptr noalias align 128 dereferenceable(2490368) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6, ptr noalias align 128 dereferenceable(131072) %arg7) #7 {
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
  %105 = mul i64 %11, 19456
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

declare ptx_kernel void @triton_softmax_21_0_impl(ptr, ptr, ptr, ptr) #5

define ptx_kernel void @triton_softmax_21_0(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(524288) %arg1, ptr noalias align 128 dereferenceable(262144) %arg2) #7 {
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
  %21 = call float @fused_concatenate_convert_1199_7(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %9)
  %22 = fmul float %20, %21
  %23 = add i32 %9, 64
  %24 = add i32 %14, 64
  %25 = getelementptr inbounds float, ptr %0, i32 %24
  %26 = load float, ptr %25, align 4, !invariant.load !3
  %27 = getelementptr inbounds bfloat, ptr %1, i32 %23
  %28 = load bfloat, ptr %27, align 2, !invariant.load !3
  %29 = fpext bfloat %28 to float
  %30 = fmul float %26, %29
  %31 = call float @fused_concatenate_convert_1199_7(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %23)
  %32 = fmul float %30, %31
  %33 = fsub float %22, %32
  %34 = fptrunc float %33 to bfloat
  %35 = getelementptr inbounds bfloat, ptr %4, i32 %14
  store bfloat %34, ptr %35, align 2
  %36 = load float, ptr %25, align 4, !invariant.load !3
  %37 = load bfloat, ptr %27, align 2, !invariant.load !3
  %38 = fpext bfloat %37 to float
  %39 = fmul float %36, %38
  %40 = call float @fused_concatenate_convert_1199_7(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %9)
  %41 = fmul float %39, %40
  %42 = load float, ptr %15, align 4, !invariant.load !3
  %43 = load bfloat, ptr %17, align 2, !invariant.load !3
  %44 = fpext bfloat %43 to float
  %45 = fmul float %42, %44
  %46 = call float @fused_concatenate_convert_1199_7(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %23)
  %47 = fmul float %45, %46
  %48 = fadd float %41, %47
  %49 = fptrunc float %48 to bfloat
  %50 = getelementptr inbounds bfloat, ptr %4, i32 %24
  store bfloat %49, ptr %50, align 2
  ret void
}

define internal float @fused_concatenate_convert_1199_7(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, i32 %4, i32 %5) {
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
attributes #2 = { "nvvm.reqntid"="256" }
attributes #3 = { convergent nocallback nounwind }
attributes #4 = { "nvvm.reqntid"="256,1,1" }
attributes #5 = { "nvvm.reqntid"="64" }
attributes #6 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #7 = { "nvvm.reqntid"="64,1,1" }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 0, i32 128}
!2 = !{i32 0, i32 512}
!3 = !{}
!4 = !{i32 0, i32 311296}
!5 = !{i32 0, i32 1536}
!6 = !{i32 0, i32 256}
!7 = !{i32 0, i32 135456}

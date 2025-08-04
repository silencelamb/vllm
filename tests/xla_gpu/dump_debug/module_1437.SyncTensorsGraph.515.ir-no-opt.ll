; ModuleID = 'SyncTensorsGraph.515'
source_filename = "SyncTensorsGraph.515"
target datalayout = "e-p6:32:32-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@global_smem = external addrspace(3) global [0 x i8], align 16

define ptx_kernel void @loop_gather_fusion(ptr noalias align 16 dereferenceable(311164928) %0, ptr noalias align 16 dereferenceable(128) %1, ptr noalias align 128 dereferenceable(65536) %2) #0 {
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

define ptx_kernel void @wrapped_concatenate(ptr noalias align 16 dereferenceable(4194304) %0, ptr noalias align 16 dereferenceable(4194304) %1, ptr noalias align 16 dereferenceable(4194304) %2, ptr noalias align 16 dereferenceable(4194304) %3, ptr noalias align 16 dereferenceable(4194304) %4, ptr noalias align 128 dereferenceable(20971520) %5) #0 {
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %9 = udiv i32 %8, 4
  %10 = icmp ult i32 %9, 2048
  %11 = mul i32 %7, 4
  %12 = mul i32 %8, 512
  %13 = add i32 %11, %12
  br i1 %10, label %14, label %31

14:                                               ; preds = %6
  %15 = icmp ult i32 %9, 1024
  br i1 %15, label %16, label %19

16:                                               ; preds = %14
  %17 = getelementptr inbounds bfloat, ptr %0, i32 %13
  %18 = load bfloat, ptr %17, align 2, !invariant.load !3
  br label %28

19:                                               ; preds = %14
  %20 = sub i32 %9, 1024
  %21 = urem i32 %8, 4
  %22 = mul i32 %21, 512
  %23 = add i32 %22, %11
  %24 = mul i32 %20, 2048
  %25 = add i32 %23, %24
  %26 = getelementptr inbounds bfloat, ptr %1, i32 %25
  %27 = load bfloat, ptr %26, align 2, !invariant.load !3
  br label %28

28:                                               ; preds = %16, %19
  %29 = phi bfloat [ %27, %19 ], [ %18, %16 ]
  br label %30

30:                                               ; preds = %28
  br label %68

31:                                               ; preds = %6
  %32 = icmp ult i32 %9, 3072
  br i1 %32, label %33, label %42

33:                                               ; preds = %31
  %34 = sub i32 %9, 2048
  %35 = urem i32 %8, 4
  %36 = mul i32 %35, 512
  %37 = add i32 %36, %11
  %38 = mul i32 %34, 2048
  %39 = add i32 %37, %38
  %40 = getelementptr inbounds bfloat, ptr %2, i32 %39
  %41 = load bfloat, ptr %40, align 2, !invariant.load !3
  br label %65

42:                                               ; preds = %31
  %43 = icmp ult i32 %9, 4096
  br i1 %43, label %44, label %53

44:                                               ; preds = %42
  %45 = sub i32 %9, 3072
  %46 = urem i32 %8, 4
  %47 = mul i32 %46, 512
  %48 = add i32 %47, %11
  %49 = mul i32 %45, 2048
  %50 = add i32 %48, %49
  %51 = getelementptr inbounds bfloat, ptr %3, i32 %50
  %52 = load bfloat, ptr %51, align 2, !invariant.load !3
  br label %62

53:                                               ; preds = %42
  %54 = sub i32 %9, 4096
  %55 = urem i32 %8, 4
  %56 = mul i32 %55, 512
  %57 = add i32 %56, %11
  %58 = mul i32 %54, 2048
  %59 = add i32 %57, %58
  %60 = getelementptr inbounds bfloat, ptr %4, i32 %59
  %61 = load bfloat, ptr %60, align 2, !invariant.load !3
  br label %62

62:                                               ; preds = %44, %53
  %63 = phi bfloat [ %61, %53 ], [ %52, %44 ]
  br label %64

64:                                               ; preds = %62
  br label %65

65:                                               ; preds = %33, %64
  %66 = phi bfloat [ %63, %64 ], [ %41, %33 ]
  br label %67

67:                                               ; preds = %65
  br label %68

68:                                               ; preds = %30, %67
  %69 = phi bfloat [ %66, %67 ], [ %29, %30 ]
  br label %70

70:                                               ; preds = %68
  %71 = insertelement <4 x bfloat> zeroinitializer, bfloat %69, i64 0
  br i1 %10, label %72, label %91

72:                                               ; preds = %70
  %73 = icmp ult i32 %9, 1024
  br i1 %73, label %74, label %78

74:                                               ; preds = %72
  %75 = add i32 %13, 1
  %76 = getelementptr inbounds bfloat, ptr %0, i32 %75
  %77 = load bfloat, ptr %76, align 2, !invariant.load !3
  br label %88

78:                                               ; preds = %72
  %79 = sub i32 %9, 1024
  %80 = urem i32 %8, 4
  %81 = mul i32 %80, 512
  %82 = add i32 %81, %11
  %83 = mul i32 %79, 2048
  %84 = add i32 %82, %83
  %85 = add i32 %84, 1
  %86 = getelementptr inbounds bfloat, ptr %1, i32 %85
  %87 = load bfloat, ptr %86, align 2, !invariant.load !3
  br label %88

88:                                               ; preds = %74, %78
  %89 = phi bfloat [ %87, %78 ], [ %77, %74 ]
  br label %90

90:                                               ; preds = %88
  br label %131

91:                                               ; preds = %70
  %92 = icmp ult i32 %9, 3072
  br i1 %92, label %93, label %103

93:                                               ; preds = %91
  %94 = sub i32 %9, 2048
  %95 = urem i32 %8, 4
  %96 = mul i32 %95, 512
  %97 = add i32 %96, %11
  %98 = mul i32 %94, 2048
  %99 = add i32 %97, %98
  %100 = add i32 %99, 1
  %101 = getelementptr inbounds bfloat, ptr %2, i32 %100
  %102 = load bfloat, ptr %101, align 2, !invariant.load !3
  br label %128

103:                                              ; preds = %91
  %104 = icmp ult i32 %9, 4096
  br i1 %104, label %105, label %115

105:                                              ; preds = %103
  %106 = sub i32 %9, 3072
  %107 = urem i32 %8, 4
  %108 = mul i32 %107, 512
  %109 = add i32 %108, %11
  %110 = mul i32 %106, 2048
  %111 = add i32 %109, %110
  %112 = add i32 %111, 1
  %113 = getelementptr inbounds bfloat, ptr %3, i32 %112
  %114 = load bfloat, ptr %113, align 2, !invariant.load !3
  br label %125

115:                                              ; preds = %103
  %116 = sub i32 %9, 4096
  %117 = urem i32 %8, 4
  %118 = mul i32 %117, 512
  %119 = add i32 %118, %11
  %120 = mul i32 %116, 2048
  %121 = add i32 %119, %120
  %122 = add i32 %121, 1
  %123 = getelementptr inbounds bfloat, ptr %4, i32 %122
  %124 = load bfloat, ptr %123, align 2, !invariant.load !3
  br label %125

125:                                              ; preds = %105, %115
  %126 = phi bfloat [ %124, %115 ], [ %114, %105 ]
  br label %127

127:                                              ; preds = %125
  br label %128

128:                                              ; preds = %93, %127
  %129 = phi bfloat [ %126, %127 ], [ %102, %93 ]
  br label %130

130:                                              ; preds = %128
  br label %131

131:                                              ; preds = %90, %130
  %132 = phi bfloat [ %129, %130 ], [ %89, %90 ]
  br label %133

133:                                              ; preds = %131
  %134 = insertelement <4 x bfloat> %71, bfloat %132, i64 1
  br i1 %10, label %135, label %154

135:                                              ; preds = %133
  %136 = icmp ult i32 %9, 1024
  br i1 %136, label %137, label %141

137:                                              ; preds = %135
  %138 = add i32 %13, 2
  %139 = getelementptr inbounds bfloat, ptr %0, i32 %138
  %140 = load bfloat, ptr %139, align 2, !invariant.load !3
  br label %151

141:                                              ; preds = %135
  %142 = sub i32 %9, 1024
  %143 = urem i32 %8, 4
  %144 = mul i32 %143, 512
  %145 = add i32 %144, %11
  %146 = mul i32 %142, 2048
  %147 = add i32 %145, %146
  %148 = add i32 %147, 2
  %149 = getelementptr inbounds bfloat, ptr %1, i32 %148
  %150 = load bfloat, ptr %149, align 2, !invariant.load !3
  br label %151

151:                                              ; preds = %137, %141
  %152 = phi bfloat [ %150, %141 ], [ %140, %137 ]
  br label %153

153:                                              ; preds = %151
  br label %194

154:                                              ; preds = %133
  %155 = icmp ult i32 %9, 3072
  br i1 %155, label %156, label %166

156:                                              ; preds = %154
  %157 = sub i32 %9, 2048
  %158 = urem i32 %8, 4
  %159 = mul i32 %158, 512
  %160 = add i32 %159, %11
  %161 = mul i32 %157, 2048
  %162 = add i32 %160, %161
  %163 = add i32 %162, 2
  %164 = getelementptr inbounds bfloat, ptr %2, i32 %163
  %165 = load bfloat, ptr %164, align 2, !invariant.load !3
  br label %191

166:                                              ; preds = %154
  %167 = icmp ult i32 %9, 4096
  br i1 %167, label %168, label %178

168:                                              ; preds = %166
  %169 = sub i32 %9, 3072
  %170 = urem i32 %8, 4
  %171 = mul i32 %170, 512
  %172 = add i32 %171, %11
  %173 = mul i32 %169, 2048
  %174 = add i32 %172, %173
  %175 = add i32 %174, 2
  %176 = getelementptr inbounds bfloat, ptr %3, i32 %175
  %177 = load bfloat, ptr %176, align 2, !invariant.load !3
  br label %188

178:                                              ; preds = %166
  %179 = sub i32 %9, 4096
  %180 = urem i32 %8, 4
  %181 = mul i32 %180, 512
  %182 = add i32 %181, %11
  %183 = mul i32 %179, 2048
  %184 = add i32 %182, %183
  %185 = add i32 %184, 2
  %186 = getelementptr inbounds bfloat, ptr %4, i32 %185
  %187 = load bfloat, ptr %186, align 2, !invariant.load !3
  br label %188

188:                                              ; preds = %168, %178
  %189 = phi bfloat [ %187, %178 ], [ %177, %168 ]
  br label %190

190:                                              ; preds = %188
  br label %191

191:                                              ; preds = %156, %190
  %192 = phi bfloat [ %189, %190 ], [ %165, %156 ]
  br label %193

193:                                              ; preds = %191
  br label %194

194:                                              ; preds = %153, %193
  %195 = phi bfloat [ %192, %193 ], [ %152, %153 ]
  br label %196

196:                                              ; preds = %194
  %197 = insertelement <4 x bfloat> %134, bfloat %195, i64 2
  br i1 %10, label %198, label %217

198:                                              ; preds = %196
  %199 = icmp ult i32 %9, 1024
  br i1 %199, label %200, label %204

200:                                              ; preds = %198
  %201 = add i32 %13, 3
  %202 = getelementptr inbounds bfloat, ptr %0, i32 %201
  %203 = load bfloat, ptr %202, align 2, !invariant.load !3
  br label %214

204:                                              ; preds = %198
  %205 = sub i32 %9, 1024
  %206 = urem i32 %8, 4
  %207 = mul i32 %206, 512
  %208 = add i32 %207, %11
  %209 = mul i32 %205, 2048
  %210 = add i32 %208, %209
  %211 = add i32 %210, 3
  %212 = getelementptr inbounds bfloat, ptr %1, i32 %211
  %213 = load bfloat, ptr %212, align 2, !invariant.load !3
  br label %214

214:                                              ; preds = %200, %204
  %215 = phi bfloat [ %213, %204 ], [ %203, %200 ]
  br label %216

216:                                              ; preds = %214
  br label %257

217:                                              ; preds = %196
  %218 = icmp ult i32 %9, 3072
  br i1 %218, label %219, label %229

219:                                              ; preds = %217
  %220 = sub i32 %9, 2048
  %221 = urem i32 %8, 4
  %222 = mul i32 %221, 512
  %223 = add i32 %222, %11
  %224 = mul i32 %220, 2048
  %225 = add i32 %223, %224
  %226 = add i32 %225, 3
  %227 = getelementptr inbounds bfloat, ptr %2, i32 %226
  %228 = load bfloat, ptr %227, align 2, !invariant.load !3
  br label %254

229:                                              ; preds = %217
  %230 = icmp ult i32 %9, 4096
  br i1 %230, label %231, label %241

231:                                              ; preds = %229
  %232 = sub i32 %9, 3072
  %233 = urem i32 %8, 4
  %234 = mul i32 %233, 512
  %235 = add i32 %234, %11
  %236 = mul i32 %232, 2048
  %237 = add i32 %235, %236
  %238 = add i32 %237, 3
  %239 = getelementptr inbounds bfloat, ptr %3, i32 %238
  %240 = load bfloat, ptr %239, align 2, !invariant.load !3
  br label %251

241:                                              ; preds = %229
  %242 = sub i32 %9, 4096
  %243 = urem i32 %8, 4
  %244 = mul i32 %243, 512
  %245 = add i32 %244, %11
  %246 = mul i32 %242, 2048
  %247 = add i32 %245, %246
  %248 = add i32 %247, 3
  %249 = getelementptr inbounds bfloat, ptr %4, i32 %248
  %250 = load bfloat, ptr %249, align 2, !invariant.load !3
  br label %251

251:                                              ; preds = %231, %241
  %252 = phi bfloat [ %250, %241 ], [ %240, %231 ]
  br label %253

253:                                              ; preds = %251
  br label %254

254:                                              ; preds = %219, %253
  %255 = phi bfloat [ %252, %253 ], [ %228, %219 ]
  br label %256

256:                                              ; preds = %254
  br label %257

257:                                              ; preds = %216, %256
  %258 = phi bfloat [ %255, %256 ], [ %215, %216 ]
  br label %259

259:                                              ; preds = %257
  %260 = insertelement <4 x bfloat> %197, bfloat %258, i64 3
  %261 = getelementptr inbounds bfloat, ptr %5, i32 %13
  store <4 x bfloat> %260, ptr %261, align 8
  ret void
}

declare ptx_kernel void @gemm_fusion_dot_19_0_impl(ptr, ptr, ptr) #2

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #3

define ptx_kernel void @gemm_fusion_dot_19_0(ptr noalias align 128 dereferenceable(20971520) %arg0, ptr noalias align 128 dereferenceable(327680) %arg1) #0 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr null to ptr addrspace(1)
  %4 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %5 = sdiv i32 %4, 8
  %6 = mul i32 %5, 8
  %7 = sub i32 320, %6
  %8 = icmp slt i32 %7, 8
  %9 = select i1 %8, i32 %7, i32 8
  %10 = srem i32 %4, %9
  %11 = add i32 %6, %10
  %12 = srem i32 %4, 8
  %13 = sdiv i32 %12, %9
  %14 = mul i32 %11, 16
  %15 = sext i32 %14 to i64
  %16 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %17 = udiv i32 %16, 32
  %18 = and i32 %17, 1
  %19 = icmp eq i32 %18, 0
  %20 = select i1 %19, i32 0, i32 1
  %21 = xor i32 0, %20
  %22 = and i32 %17, 2
  %23 = icmp eq i32 %22, 0
  %24 = select i1 %23, i32 0, i32 2
  %25 = xor i32 %21, %24
  %26 = xor i32 %25, 0
  %27 = xor i32 %25, 4
  %28 = xor i32 %25, 8
  %29 = xor i32 %25, 12
  %30 = add i32 %26, 0
  %31 = add i32 %27, 0
  %32 = add i32 %28, 0
  %33 = add i32 %29, 0
  %34 = sext i32 %30 to i64
  %35 = sext i32 %31 to i64
  %36 = sext i32 %32 to i64
  %37 = sext i32 %33 to i64
  %38 = add i64 %15, %34
  %39 = add i64 %15, %35
  %40 = add i64 %15, %36
  %41 = add i64 %15, %37
  %42 = mul i64 %38, 2048
  %43 = mul i64 %39, 2048
  %44 = mul i64 %40, 2048
  %45 = mul i64 %41, 2048
  %46 = urem i32 %16, 32
  %47 = and i32 %46, 1
  %48 = icmp eq i32 %47, 0
  %49 = select i1 %48, i32 0, i32 8
  %50 = xor i32 0, %49
  %51 = and i32 %46, 2
  %52 = icmp eq i32 %51, 0
  %53 = select i1 %52, i32 0, i32 16
  %54 = xor i32 %50, %53
  %55 = and i32 %46, 4
  %56 = icmp eq i32 %55, 0
  %57 = select i1 %56, i32 0, i32 32
  %58 = xor i32 %54, %57
  %59 = and i32 %46, 8
  %60 = icmp eq i32 %59, 0
  %61 = select i1 %60, i32 0, i32 64
  %62 = xor i32 %58, %61
  %63 = and i32 %46, 16
  %64 = icmp eq i32 %63, 0
  %65 = select i1 %64, i32 0, i32 128
  %66 = xor i32 %62, %65
  %67 = xor i32 %66, 0
  %68 = add i32 %67, 0
  %69 = sext i32 %68 to i64
  br label %70

70:                                               ; preds = %75, %0
  %71 = phi i32 [ %884, %75 ], [ 0, %0 ]
  %72 = phi i64 [ %214, %75 ], [ 0, %0 ]
  %73 = phi { float, float, float, float } [ %883, %75 ], [ zeroinitializer, %0 ]
  %74 = icmp slt i32 %71, 2048
  br i1 %74, label %75, label %885

75:                                               ; preds = %70
  %76 = add i64 %72, %69
  %77 = add i64 %42, %76
  %78 = add i64 %43, %76
  %79 = add i64 %44, %76
  %80 = add i64 %45, %76
  %81 = getelementptr bfloat, ptr addrspace(1) %1, i64 %77
  %82 = getelementptr bfloat, ptr addrspace(1) %1, i64 %78
  %83 = getelementptr bfloat, ptr addrspace(1) %1, i64 %79
  %84 = getelementptr bfloat, ptr addrspace(1) %1, i64 %80
  %85 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %81)
  %86 = extractvalue { i32, i32, i32, i32 } %85, 0
  %87 = bitcast i32 %86 to <2 x bfloat>
  %88 = extractvalue { i32, i32, i32, i32 } %85, 1
  %89 = bitcast i32 %88 to <2 x bfloat>
  %90 = extractvalue { i32, i32, i32, i32 } %85, 2
  %91 = bitcast i32 %90 to <2 x bfloat>
  %92 = extractvalue { i32, i32, i32, i32 } %85, 3
  %93 = bitcast i32 %92 to <2 x bfloat>
  %94 = extractelement <2 x bfloat> %87, i32 0
  %95 = extractelement <2 x bfloat> %87, i32 1
  %96 = extractelement <2 x bfloat> %89, i32 0
  %97 = extractelement <2 x bfloat> %89, i32 1
  %98 = extractelement <2 x bfloat> %91, i32 0
  %99 = extractelement <2 x bfloat> %91, i32 1
  %100 = extractelement <2 x bfloat> %93, i32 0
  %101 = extractelement <2 x bfloat> %93, i32 1
  %102 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %82)
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
  %119 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %83)
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
  %136 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %84)
  %137 = extractvalue { i32, i32, i32, i32 } %136, 0
  %138 = bitcast i32 %137 to <2 x bfloat>
  %139 = extractvalue { i32, i32, i32, i32 } %136, 1
  %140 = bitcast i32 %139 to <2 x bfloat>
  %141 = extractvalue { i32, i32, i32, i32 } %136, 2
  %142 = bitcast i32 %141 to <2 x bfloat>
  %143 = extractvalue { i32, i32, i32, i32 } %136, 3
  %144 = bitcast i32 %143 to <2 x bfloat>
  %145 = extractelement <2 x bfloat> %138, i32 0
  %146 = extractelement <2 x bfloat> %138, i32 1
  %147 = extractelement <2 x bfloat> %140, i32 0
  %148 = extractelement <2 x bfloat> %140, i32 1
  %149 = extractelement <2 x bfloat> %142, i32 0
  %150 = extractelement <2 x bfloat> %142, i32 1
  %151 = extractelement <2 x bfloat> %144, i32 0
  %152 = extractelement <2 x bfloat> %144, i32 1
  call void @llvm.nvvm.barrier0()
  %153 = select i1 %19, i32 0, i32 264
  %154 = xor i32 %66, %153
  %155 = select i1 %23, i32 0, i32 528
  %156 = xor i32 %154, %155
  %157 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %156
  %158 = insertelement <8 x bfloat> undef, bfloat %94, i32 0
  %159 = insertelement <8 x bfloat> %158, bfloat %95, i32 1
  %160 = insertelement <8 x bfloat> %159, bfloat %96, i32 2
  %161 = insertelement <8 x bfloat> %160, bfloat %97, i32 3
  %162 = insertelement <8 x bfloat> %161, bfloat %98, i32 4
  %163 = insertelement <8 x bfloat> %162, bfloat %99, i32 5
  %164 = insertelement <8 x bfloat> %163, bfloat %100, i32 6
  %165 = insertelement <8 x bfloat> %164, bfloat %101, i32 7
  store <8 x bfloat> %165, ptr addrspace(3) %157, align 16
  %166 = xor i32 1056, %49
  %167 = xor i32 %166, %53
  %168 = xor i32 %167, %57
  %169 = xor i32 %168, %61
  %170 = xor i32 %169, %65
  %171 = xor i32 %170, %153
  %172 = xor i32 %171, %155
  %173 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %172
  %174 = insertelement <8 x bfloat> undef, bfloat %111, i32 0
  %175 = insertelement <8 x bfloat> %174, bfloat %112, i32 1
  %176 = insertelement <8 x bfloat> %175, bfloat %113, i32 2
  %177 = insertelement <8 x bfloat> %176, bfloat %114, i32 3
  %178 = insertelement <8 x bfloat> %177, bfloat %115, i32 4
  %179 = insertelement <8 x bfloat> %178, bfloat %116, i32 5
  %180 = insertelement <8 x bfloat> %179, bfloat %117, i32 6
  %181 = insertelement <8 x bfloat> %180, bfloat %118, i32 7
  store <8 x bfloat> %181, ptr addrspace(3) %173, align 16
  %182 = xor i32 2048, %49
  %183 = xor i32 %182, %53
  %184 = xor i32 %183, %57
  %185 = xor i32 %184, %61
  %186 = xor i32 %185, %65
  %187 = xor i32 %186, %153
  %188 = xor i32 %187, %155
  %189 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %188
  %190 = insertelement <8 x bfloat> undef, bfloat %128, i32 0
  %191 = insertelement <8 x bfloat> %190, bfloat %129, i32 1
  %192 = insertelement <8 x bfloat> %191, bfloat %130, i32 2
  %193 = insertelement <8 x bfloat> %192, bfloat %131, i32 3
  %194 = insertelement <8 x bfloat> %193, bfloat %132, i32 4
  %195 = insertelement <8 x bfloat> %194, bfloat %133, i32 5
  %196 = insertelement <8 x bfloat> %195, bfloat %134, i32 6
  %197 = insertelement <8 x bfloat> %196, bfloat %135, i32 7
  store <8 x bfloat> %197, ptr addrspace(3) %189, align 16
  %198 = xor i32 3104, %49
  %199 = xor i32 %198, %53
  %200 = xor i32 %199, %57
  %201 = xor i32 %200, %61
  %202 = xor i32 %201, %65
  %203 = xor i32 %202, %153
  %204 = xor i32 %203, %155
  %205 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %204
  %206 = insertelement <8 x bfloat> undef, bfloat %145, i32 0
  %207 = insertelement <8 x bfloat> %206, bfloat %146, i32 1
  %208 = insertelement <8 x bfloat> %207, bfloat %147, i32 2
  %209 = insertelement <8 x bfloat> %208, bfloat %148, i32 3
  %210 = insertelement <8 x bfloat> %209, bfloat %149, i32 4
  %211 = insertelement <8 x bfloat> %210, bfloat %150, i32 5
  %212 = insertelement <8 x bfloat> %211, bfloat %151, i32 6
  %213 = insertelement <8 x bfloat> %212, bfloat %152, i32 7
  store <8 x bfloat> %213, ptr addrspace(3) %205, align 16
  %214 = add i64 %72, 256
  call void @llvm.nvvm.barrier0()
  %215 = select i1 %48, i32 0, i32 264
  %216 = xor i32 0, %215
  %217 = select i1 %52, i32 0, i32 528
  %218 = xor i32 %216, %217
  %219 = select i1 %56, i32 0, i32 1056
  %220 = xor i32 %218, %219
  %221 = select i1 %60, i32 0, i32 2048
  %222 = xor i32 %220, %221
  %223 = select i1 %64, i32 0, i32 8
  %224 = xor i32 %222, %223
  %225 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %224
  %226 = ptrtoint ptr addrspace(3) %225 to i32
  %227 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %226)
  %228 = extractvalue { i32, i32, i32, i32 } %227, 0
  %229 = extractvalue { i32, i32, i32, i32 } %227, 1
  %230 = extractvalue { i32, i32, i32, i32 } %227, 2
  %231 = extractvalue { i32, i32, i32, i32 } %227, 3
  %232 = xor i32 16, %215
  %233 = xor i32 %232, %217
  %234 = xor i32 %233, %219
  %235 = xor i32 %234, %221
  %236 = xor i32 %235, %223
  %237 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %236
  %238 = ptrtoint ptr addrspace(3) %237 to i32
  %239 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %238)
  %240 = extractvalue { i32, i32, i32, i32 } %239, 0
  %241 = extractvalue { i32, i32, i32, i32 } %239, 1
  %242 = extractvalue { i32, i32, i32, i32 } %239, 2
  %243 = extractvalue { i32, i32, i32, i32 } %239, 3
  %244 = xor i32 32, %215
  %245 = xor i32 %244, %217
  %246 = xor i32 %245, %219
  %247 = xor i32 %246, %221
  %248 = xor i32 %247, %223
  %249 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %248
  %250 = ptrtoint ptr addrspace(3) %249 to i32
  %251 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %250)
  %252 = extractvalue { i32, i32, i32, i32 } %251, 0
  %253 = extractvalue { i32, i32, i32, i32 } %251, 1
  %254 = extractvalue { i32, i32, i32, i32 } %251, 2
  %255 = extractvalue { i32, i32, i32, i32 } %251, 3
  %256 = xor i32 48, %215
  %257 = xor i32 %256, %217
  %258 = xor i32 %257, %219
  %259 = xor i32 %258, %221
  %260 = xor i32 %259, %223
  %261 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %260
  %262 = ptrtoint ptr addrspace(3) %261 to i32
  %263 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %262)
  %264 = extractvalue { i32, i32, i32, i32 } %263, 0
  %265 = extractvalue { i32, i32, i32, i32 } %263, 1
  %266 = extractvalue { i32, i32, i32, i32 } %263, 2
  %267 = extractvalue { i32, i32, i32, i32 } %263, 3
  %268 = xor i32 64, %215
  %269 = xor i32 %268, %217
  %270 = xor i32 %269, %219
  %271 = xor i32 %270, %221
  %272 = xor i32 %271, %223
  %273 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %272
  %274 = ptrtoint ptr addrspace(3) %273 to i32
  %275 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %274)
  %276 = extractvalue { i32, i32, i32, i32 } %275, 0
  %277 = extractvalue { i32, i32, i32, i32 } %275, 1
  %278 = extractvalue { i32, i32, i32, i32 } %275, 2
  %279 = extractvalue { i32, i32, i32, i32 } %275, 3
  %280 = xor i32 80, %215
  %281 = xor i32 %280, %217
  %282 = xor i32 %281, %219
  %283 = xor i32 %282, %221
  %284 = xor i32 %283, %223
  %285 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %284
  %286 = ptrtoint ptr addrspace(3) %285 to i32
  %287 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %286)
  %288 = extractvalue { i32, i32, i32, i32 } %287, 0
  %289 = extractvalue { i32, i32, i32, i32 } %287, 1
  %290 = extractvalue { i32, i32, i32, i32 } %287, 2
  %291 = extractvalue { i32, i32, i32, i32 } %287, 3
  %292 = xor i32 96, %215
  %293 = xor i32 %292, %217
  %294 = xor i32 %293, %219
  %295 = xor i32 %294, %221
  %296 = xor i32 %295, %223
  %297 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %296
  %298 = ptrtoint ptr addrspace(3) %297 to i32
  %299 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %298)
  %300 = extractvalue { i32, i32, i32, i32 } %299, 0
  %301 = extractvalue { i32, i32, i32, i32 } %299, 1
  %302 = extractvalue { i32, i32, i32, i32 } %299, 2
  %303 = extractvalue { i32, i32, i32, i32 } %299, 3
  %304 = xor i32 112, %215
  %305 = xor i32 %304, %217
  %306 = xor i32 %305, %219
  %307 = xor i32 %306, %221
  %308 = xor i32 %307, %223
  %309 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %308
  %310 = ptrtoint ptr addrspace(3) %309 to i32
  %311 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %310)
  %312 = extractvalue { i32, i32, i32, i32 } %311, 0
  %313 = extractvalue { i32, i32, i32, i32 } %311, 1
  %314 = extractvalue { i32, i32, i32, i32 } %311, 2
  %315 = extractvalue { i32, i32, i32, i32 } %311, 3
  %316 = xor i32 128, %215
  %317 = xor i32 %316, %217
  %318 = xor i32 %317, %219
  %319 = xor i32 %318, %221
  %320 = xor i32 %319, %223
  %321 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %320
  %322 = ptrtoint ptr addrspace(3) %321 to i32
  %323 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %322)
  %324 = extractvalue { i32, i32, i32, i32 } %323, 0
  %325 = extractvalue { i32, i32, i32, i32 } %323, 1
  %326 = extractvalue { i32, i32, i32, i32 } %323, 2
  %327 = extractvalue { i32, i32, i32, i32 } %323, 3
  %328 = xor i32 144, %215
  %329 = xor i32 %328, %217
  %330 = xor i32 %329, %219
  %331 = xor i32 %330, %221
  %332 = xor i32 %331, %223
  %333 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %332
  %334 = ptrtoint ptr addrspace(3) %333 to i32
  %335 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %334)
  %336 = extractvalue { i32, i32, i32, i32 } %335, 0
  %337 = extractvalue { i32, i32, i32, i32 } %335, 1
  %338 = extractvalue { i32, i32, i32, i32 } %335, 2
  %339 = extractvalue { i32, i32, i32, i32 } %335, 3
  %340 = xor i32 160, %215
  %341 = xor i32 %340, %217
  %342 = xor i32 %341, %219
  %343 = xor i32 %342, %221
  %344 = xor i32 %343, %223
  %345 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %344
  %346 = ptrtoint ptr addrspace(3) %345 to i32
  %347 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %346)
  %348 = extractvalue { i32, i32, i32, i32 } %347, 0
  %349 = extractvalue { i32, i32, i32, i32 } %347, 1
  %350 = extractvalue { i32, i32, i32, i32 } %347, 2
  %351 = extractvalue { i32, i32, i32, i32 } %347, 3
  %352 = xor i32 176, %215
  %353 = xor i32 %352, %217
  %354 = xor i32 %353, %219
  %355 = xor i32 %354, %221
  %356 = xor i32 %355, %223
  %357 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %356
  %358 = ptrtoint ptr addrspace(3) %357 to i32
  %359 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %358)
  %360 = extractvalue { i32, i32, i32, i32 } %359, 0
  %361 = extractvalue { i32, i32, i32, i32 } %359, 1
  %362 = extractvalue { i32, i32, i32, i32 } %359, 2
  %363 = extractvalue { i32, i32, i32, i32 } %359, 3
  %364 = xor i32 192, %215
  %365 = xor i32 %364, %217
  %366 = xor i32 %365, %219
  %367 = xor i32 %366, %221
  %368 = xor i32 %367, %223
  %369 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %368
  %370 = ptrtoint ptr addrspace(3) %369 to i32
  %371 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %370)
  %372 = extractvalue { i32, i32, i32, i32 } %371, 0
  %373 = extractvalue { i32, i32, i32, i32 } %371, 1
  %374 = extractvalue { i32, i32, i32, i32 } %371, 2
  %375 = extractvalue { i32, i32, i32, i32 } %371, 3
  %376 = xor i32 208, %215
  %377 = xor i32 %376, %217
  %378 = xor i32 %377, %219
  %379 = xor i32 %378, %221
  %380 = xor i32 %379, %223
  %381 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %380
  %382 = ptrtoint ptr addrspace(3) %381 to i32
  %383 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %382)
  %384 = extractvalue { i32, i32, i32, i32 } %383, 0
  %385 = extractvalue { i32, i32, i32, i32 } %383, 1
  %386 = extractvalue { i32, i32, i32, i32 } %383, 2
  %387 = extractvalue { i32, i32, i32, i32 } %383, 3
  %388 = xor i32 224, %215
  %389 = xor i32 %388, %217
  %390 = xor i32 %389, %219
  %391 = xor i32 %390, %221
  %392 = xor i32 %391, %223
  %393 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %392
  %394 = ptrtoint ptr addrspace(3) %393 to i32
  %395 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %394)
  %396 = extractvalue { i32, i32, i32, i32 } %395, 0
  %397 = extractvalue { i32, i32, i32, i32 } %395, 1
  %398 = extractvalue { i32, i32, i32, i32 } %395, 2
  %399 = extractvalue { i32, i32, i32, i32 } %395, 3
  %400 = xor i32 240, %215
  %401 = xor i32 %400, %217
  %402 = xor i32 %401, %219
  %403 = xor i32 %402, %221
  %404 = xor i32 %403, %223
  %405 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %404
  %406 = ptrtoint ptr addrspace(3) %405 to i32
  %407 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %406)
  %408 = extractvalue { i32, i32, i32, i32 } %407, 0
  %409 = extractvalue { i32, i32, i32, i32 } %407, 1
  %410 = extractvalue { i32, i32, i32, i32 } %407, 2
  %411 = extractvalue { i32, i32, i32, i32 } %407, 3
  %412 = bitcast i32 %228 to <2 x bfloat>
  %413 = extractelement <2 x bfloat> %412, i32 0
  %414 = extractelement <2 x bfloat> %412, i32 1
  %415 = bitcast i32 %229 to <2 x bfloat>
  %416 = extractelement <2 x bfloat> %415, i32 0
  %417 = extractelement <2 x bfloat> %415, i32 1
  %418 = bitcast i32 %230 to <2 x bfloat>
  %419 = extractelement <2 x bfloat> %418, i32 0
  %420 = extractelement <2 x bfloat> %418, i32 1
  %421 = bitcast i32 %231 to <2 x bfloat>
  %422 = extractelement <2 x bfloat> %421, i32 0
  %423 = extractelement <2 x bfloat> %421, i32 1
  %424 = bitcast i32 %240 to <2 x bfloat>
  %425 = extractelement <2 x bfloat> %424, i32 0
  %426 = extractelement <2 x bfloat> %424, i32 1
  %427 = bitcast i32 %241 to <2 x bfloat>
  %428 = extractelement <2 x bfloat> %427, i32 0
  %429 = extractelement <2 x bfloat> %427, i32 1
  %430 = bitcast i32 %242 to <2 x bfloat>
  %431 = extractelement <2 x bfloat> %430, i32 0
  %432 = extractelement <2 x bfloat> %430, i32 1
  %433 = bitcast i32 %243 to <2 x bfloat>
  %434 = extractelement <2 x bfloat> %433, i32 0
  %435 = extractelement <2 x bfloat> %433, i32 1
  %436 = bitcast i32 %252 to <2 x bfloat>
  %437 = extractelement <2 x bfloat> %436, i32 0
  %438 = extractelement <2 x bfloat> %436, i32 1
  %439 = bitcast i32 %253 to <2 x bfloat>
  %440 = extractelement <2 x bfloat> %439, i32 0
  %441 = extractelement <2 x bfloat> %439, i32 1
  %442 = bitcast i32 %254 to <2 x bfloat>
  %443 = extractelement <2 x bfloat> %442, i32 0
  %444 = extractelement <2 x bfloat> %442, i32 1
  %445 = bitcast i32 %255 to <2 x bfloat>
  %446 = extractelement <2 x bfloat> %445, i32 0
  %447 = extractelement <2 x bfloat> %445, i32 1
  %448 = bitcast i32 %264 to <2 x bfloat>
  %449 = extractelement <2 x bfloat> %448, i32 0
  %450 = extractelement <2 x bfloat> %448, i32 1
  %451 = bitcast i32 %265 to <2 x bfloat>
  %452 = extractelement <2 x bfloat> %451, i32 0
  %453 = extractelement <2 x bfloat> %451, i32 1
  %454 = bitcast i32 %266 to <2 x bfloat>
  %455 = extractelement <2 x bfloat> %454, i32 0
  %456 = extractelement <2 x bfloat> %454, i32 1
  %457 = bitcast i32 %267 to <2 x bfloat>
  %458 = extractelement <2 x bfloat> %457, i32 0
  %459 = extractelement <2 x bfloat> %457, i32 1
  %460 = bitcast i32 %276 to <2 x bfloat>
  %461 = extractelement <2 x bfloat> %460, i32 0
  %462 = extractelement <2 x bfloat> %460, i32 1
  %463 = bitcast i32 %277 to <2 x bfloat>
  %464 = extractelement <2 x bfloat> %463, i32 0
  %465 = extractelement <2 x bfloat> %463, i32 1
  %466 = bitcast i32 %278 to <2 x bfloat>
  %467 = extractelement <2 x bfloat> %466, i32 0
  %468 = extractelement <2 x bfloat> %466, i32 1
  %469 = bitcast i32 %279 to <2 x bfloat>
  %470 = extractelement <2 x bfloat> %469, i32 0
  %471 = extractelement <2 x bfloat> %469, i32 1
  %472 = bitcast i32 %288 to <2 x bfloat>
  %473 = extractelement <2 x bfloat> %472, i32 0
  %474 = extractelement <2 x bfloat> %472, i32 1
  %475 = bitcast i32 %289 to <2 x bfloat>
  %476 = extractelement <2 x bfloat> %475, i32 0
  %477 = extractelement <2 x bfloat> %475, i32 1
  %478 = bitcast i32 %290 to <2 x bfloat>
  %479 = extractelement <2 x bfloat> %478, i32 0
  %480 = extractelement <2 x bfloat> %478, i32 1
  %481 = bitcast i32 %291 to <2 x bfloat>
  %482 = extractelement <2 x bfloat> %481, i32 0
  %483 = extractelement <2 x bfloat> %481, i32 1
  %484 = bitcast i32 %300 to <2 x bfloat>
  %485 = extractelement <2 x bfloat> %484, i32 0
  %486 = extractelement <2 x bfloat> %484, i32 1
  %487 = bitcast i32 %301 to <2 x bfloat>
  %488 = extractelement <2 x bfloat> %487, i32 0
  %489 = extractelement <2 x bfloat> %487, i32 1
  %490 = bitcast i32 %302 to <2 x bfloat>
  %491 = extractelement <2 x bfloat> %490, i32 0
  %492 = extractelement <2 x bfloat> %490, i32 1
  %493 = bitcast i32 %303 to <2 x bfloat>
  %494 = extractelement <2 x bfloat> %493, i32 0
  %495 = extractelement <2 x bfloat> %493, i32 1
  %496 = bitcast i32 %312 to <2 x bfloat>
  %497 = extractelement <2 x bfloat> %496, i32 0
  %498 = extractelement <2 x bfloat> %496, i32 1
  %499 = bitcast i32 %313 to <2 x bfloat>
  %500 = extractelement <2 x bfloat> %499, i32 0
  %501 = extractelement <2 x bfloat> %499, i32 1
  %502 = bitcast i32 %314 to <2 x bfloat>
  %503 = extractelement <2 x bfloat> %502, i32 0
  %504 = extractelement <2 x bfloat> %502, i32 1
  %505 = bitcast i32 %315 to <2 x bfloat>
  %506 = extractelement <2 x bfloat> %505, i32 0
  %507 = extractelement <2 x bfloat> %505, i32 1
  %508 = bitcast i32 %324 to <2 x bfloat>
  %509 = extractelement <2 x bfloat> %508, i32 0
  %510 = extractelement <2 x bfloat> %508, i32 1
  %511 = bitcast i32 %325 to <2 x bfloat>
  %512 = extractelement <2 x bfloat> %511, i32 0
  %513 = extractelement <2 x bfloat> %511, i32 1
  %514 = bitcast i32 %326 to <2 x bfloat>
  %515 = extractelement <2 x bfloat> %514, i32 0
  %516 = extractelement <2 x bfloat> %514, i32 1
  %517 = bitcast i32 %327 to <2 x bfloat>
  %518 = extractelement <2 x bfloat> %517, i32 0
  %519 = extractelement <2 x bfloat> %517, i32 1
  %520 = bitcast i32 %336 to <2 x bfloat>
  %521 = extractelement <2 x bfloat> %520, i32 0
  %522 = extractelement <2 x bfloat> %520, i32 1
  %523 = bitcast i32 %337 to <2 x bfloat>
  %524 = extractelement <2 x bfloat> %523, i32 0
  %525 = extractelement <2 x bfloat> %523, i32 1
  %526 = bitcast i32 %338 to <2 x bfloat>
  %527 = extractelement <2 x bfloat> %526, i32 0
  %528 = extractelement <2 x bfloat> %526, i32 1
  %529 = bitcast i32 %339 to <2 x bfloat>
  %530 = extractelement <2 x bfloat> %529, i32 0
  %531 = extractelement <2 x bfloat> %529, i32 1
  %532 = bitcast i32 %348 to <2 x bfloat>
  %533 = extractelement <2 x bfloat> %532, i32 0
  %534 = extractelement <2 x bfloat> %532, i32 1
  %535 = bitcast i32 %349 to <2 x bfloat>
  %536 = extractelement <2 x bfloat> %535, i32 0
  %537 = extractelement <2 x bfloat> %535, i32 1
  %538 = bitcast i32 %350 to <2 x bfloat>
  %539 = extractelement <2 x bfloat> %538, i32 0
  %540 = extractelement <2 x bfloat> %538, i32 1
  %541 = bitcast i32 %351 to <2 x bfloat>
  %542 = extractelement <2 x bfloat> %541, i32 0
  %543 = extractelement <2 x bfloat> %541, i32 1
  %544 = bitcast i32 %360 to <2 x bfloat>
  %545 = extractelement <2 x bfloat> %544, i32 0
  %546 = extractelement <2 x bfloat> %544, i32 1
  %547 = bitcast i32 %361 to <2 x bfloat>
  %548 = extractelement <2 x bfloat> %547, i32 0
  %549 = extractelement <2 x bfloat> %547, i32 1
  %550 = bitcast i32 %362 to <2 x bfloat>
  %551 = extractelement <2 x bfloat> %550, i32 0
  %552 = extractelement <2 x bfloat> %550, i32 1
  %553 = bitcast i32 %363 to <2 x bfloat>
  %554 = extractelement <2 x bfloat> %553, i32 0
  %555 = extractelement <2 x bfloat> %553, i32 1
  %556 = bitcast i32 %372 to <2 x bfloat>
  %557 = extractelement <2 x bfloat> %556, i32 0
  %558 = extractelement <2 x bfloat> %556, i32 1
  %559 = bitcast i32 %373 to <2 x bfloat>
  %560 = extractelement <2 x bfloat> %559, i32 0
  %561 = extractelement <2 x bfloat> %559, i32 1
  %562 = bitcast i32 %374 to <2 x bfloat>
  %563 = extractelement <2 x bfloat> %562, i32 0
  %564 = extractelement <2 x bfloat> %562, i32 1
  %565 = bitcast i32 %375 to <2 x bfloat>
  %566 = extractelement <2 x bfloat> %565, i32 0
  %567 = extractelement <2 x bfloat> %565, i32 1
  %568 = bitcast i32 %384 to <2 x bfloat>
  %569 = extractelement <2 x bfloat> %568, i32 0
  %570 = extractelement <2 x bfloat> %568, i32 1
  %571 = bitcast i32 %385 to <2 x bfloat>
  %572 = extractelement <2 x bfloat> %571, i32 0
  %573 = extractelement <2 x bfloat> %571, i32 1
  %574 = bitcast i32 %386 to <2 x bfloat>
  %575 = extractelement <2 x bfloat> %574, i32 0
  %576 = extractelement <2 x bfloat> %574, i32 1
  %577 = bitcast i32 %387 to <2 x bfloat>
  %578 = extractelement <2 x bfloat> %577, i32 0
  %579 = extractelement <2 x bfloat> %577, i32 1
  %580 = bitcast i32 %396 to <2 x bfloat>
  %581 = extractelement <2 x bfloat> %580, i32 0
  %582 = extractelement <2 x bfloat> %580, i32 1
  %583 = bitcast i32 %397 to <2 x bfloat>
  %584 = extractelement <2 x bfloat> %583, i32 0
  %585 = extractelement <2 x bfloat> %583, i32 1
  %586 = bitcast i32 %398 to <2 x bfloat>
  %587 = extractelement <2 x bfloat> %586, i32 0
  %588 = extractelement <2 x bfloat> %586, i32 1
  %589 = bitcast i32 %399 to <2 x bfloat>
  %590 = extractelement <2 x bfloat> %589, i32 0
  %591 = extractelement <2 x bfloat> %589, i32 1
  %592 = bitcast i32 %408 to <2 x bfloat>
  %593 = extractelement <2 x bfloat> %592, i32 0
  %594 = extractelement <2 x bfloat> %592, i32 1
  %595 = bitcast i32 %409 to <2 x bfloat>
  %596 = extractelement <2 x bfloat> %595, i32 0
  %597 = extractelement <2 x bfloat> %595, i32 1
  %598 = bitcast i32 %410 to <2 x bfloat>
  %599 = extractelement <2 x bfloat> %598, i32 0
  %600 = extractelement <2 x bfloat> %598, i32 1
  %601 = bitcast i32 %411 to <2 x bfloat>
  %602 = extractelement <2 x bfloat> %601, i32 0
  %603 = extractelement <2 x bfloat> %601, i32 1
  %604 = insertelement <2 x bfloat> undef, bfloat %413, i32 0
  %605 = insertelement <2 x bfloat> %604, bfloat %414, i32 1
  %606 = bitcast <2 x bfloat> %605 to i32
  %607 = insertelement <2 x bfloat> undef, bfloat %416, i32 0
  %608 = insertelement <2 x bfloat> %607, bfloat %417, i32 1
  %609 = bitcast <2 x bfloat> %608 to i32
  %610 = insertelement <2 x bfloat> undef, bfloat %419, i32 0
  %611 = insertelement <2 x bfloat> %610, bfloat %420, i32 1
  %612 = bitcast <2 x bfloat> %611 to i32
  %613 = insertelement <2 x bfloat> undef, bfloat %422, i32 0
  %614 = insertelement <2 x bfloat> %613, bfloat %423, i32 1
  %615 = bitcast <2 x bfloat> %614 to i32
  %616 = insertelement <2 x bfloat> undef, bfloat %425, i32 0
  %617 = insertelement <2 x bfloat> %616, bfloat %426, i32 1
  %618 = bitcast <2 x bfloat> %617 to i32
  %619 = insertelement <2 x bfloat> undef, bfloat %428, i32 0
  %620 = insertelement <2 x bfloat> %619, bfloat %429, i32 1
  %621 = bitcast <2 x bfloat> %620 to i32
  %622 = insertelement <2 x bfloat> undef, bfloat %431, i32 0
  %623 = insertelement <2 x bfloat> %622, bfloat %432, i32 1
  %624 = bitcast <2 x bfloat> %623 to i32
  %625 = insertelement <2 x bfloat> undef, bfloat %434, i32 0
  %626 = insertelement <2 x bfloat> %625, bfloat %435, i32 1
  %627 = bitcast <2 x bfloat> %626 to i32
  %628 = insertelement <2 x bfloat> undef, bfloat %437, i32 0
  %629 = insertelement <2 x bfloat> %628, bfloat %438, i32 1
  %630 = bitcast <2 x bfloat> %629 to i32
  %631 = insertelement <2 x bfloat> undef, bfloat %440, i32 0
  %632 = insertelement <2 x bfloat> %631, bfloat %441, i32 1
  %633 = bitcast <2 x bfloat> %632 to i32
  %634 = insertelement <2 x bfloat> undef, bfloat %443, i32 0
  %635 = insertelement <2 x bfloat> %634, bfloat %444, i32 1
  %636 = bitcast <2 x bfloat> %635 to i32
  %637 = insertelement <2 x bfloat> undef, bfloat %446, i32 0
  %638 = insertelement <2 x bfloat> %637, bfloat %447, i32 1
  %639 = bitcast <2 x bfloat> %638 to i32
  %640 = insertelement <2 x bfloat> undef, bfloat %449, i32 0
  %641 = insertelement <2 x bfloat> %640, bfloat %450, i32 1
  %642 = bitcast <2 x bfloat> %641 to i32
  %643 = insertelement <2 x bfloat> undef, bfloat %452, i32 0
  %644 = insertelement <2 x bfloat> %643, bfloat %453, i32 1
  %645 = bitcast <2 x bfloat> %644 to i32
  %646 = insertelement <2 x bfloat> undef, bfloat %455, i32 0
  %647 = insertelement <2 x bfloat> %646, bfloat %456, i32 1
  %648 = bitcast <2 x bfloat> %647 to i32
  %649 = insertelement <2 x bfloat> undef, bfloat %458, i32 0
  %650 = insertelement <2 x bfloat> %649, bfloat %459, i32 1
  %651 = bitcast <2 x bfloat> %650 to i32
  %652 = insertelement <2 x bfloat> undef, bfloat %461, i32 0
  %653 = insertelement <2 x bfloat> %652, bfloat %462, i32 1
  %654 = bitcast <2 x bfloat> %653 to i32
  %655 = insertelement <2 x bfloat> undef, bfloat %464, i32 0
  %656 = insertelement <2 x bfloat> %655, bfloat %465, i32 1
  %657 = bitcast <2 x bfloat> %656 to i32
  %658 = insertelement <2 x bfloat> undef, bfloat %467, i32 0
  %659 = insertelement <2 x bfloat> %658, bfloat %468, i32 1
  %660 = bitcast <2 x bfloat> %659 to i32
  %661 = insertelement <2 x bfloat> undef, bfloat %470, i32 0
  %662 = insertelement <2 x bfloat> %661, bfloat %471, i32 1
  %663 = bitcast <2 x bfloat> %662 to i32
  %664 = insertelement <2 x bfloat> undef, bfloat %473, i32 0
  %665 = insertelement <2 x bfloat> %664, bfloat %474, i32 1
  %666 = bitcast <2 x bfloat> %665 to i32
  %667 = insertelement <2 x bfloat> undef, bfloat %476, i32 0
  %668 = insertelement <2 x bfloat> %667, bfloat %477, i32 1
  %669 = bitcast <2 x bfloat> %668 to i32
  %670 = insertelement <2 x bfloat> undef, bfloat %479, i32 0
  %671 = insertelement <2 x bfloat> %670, bfloat %480, i32 1
  %672 = bitcast <2 x bfloat> %671 to i32
  %673 = insertelement <2 x bfloat> undef, bfloat %482, i32 0
  %674 = insertelement <2 x bfloat> %673, bfloat %483, i32 1
  %675 = bitcast <2 x bfloat> %674 to i32
  %676 = insertelement <2 x bfloat> undef, bfloat %485, i32 0
  %677 = insertelement <2 x bfloat> %676, bfloat %486, i32 1
  %678 = bitcast <2 x bfloat> %677 to i32
  %679 = insertelement <2 x bfloat> undef, bfloat %488, i32 0
  %680 = insertelement <2 x bfloat> %679, bfloat %489, i32 1
  %681 = bitcast <2 x bfloat> %680 to i32
  %682 = insertelement <2 x bfloat> undef, bfloat %491, i32 0
  %683 = insertelement <2 x bfloat> %682, bfloat %492, i32 1
  %684 = bitcast <2 x bfloat> %683 to i32
  %685 = insertelement <2 x bfloat> undef, bfloat %494, i32 0
  %686 = insertelement <2 x bfloat> %685, bfloat %495, i32 1
  %687 = bitcast <2 x bfloat> %686 to i32
  %688 = insertelement <2 x bfloat> undef, bfloat %497, i32 0
  %689 = insertelement <2 x bfloat> %688, bfloat %498, i32 1
  %690 = bitcast <2 x bfloat> %689 to i32
  %691 = insertelement <2 x bfloat> undef, bfloat %500, i32 0
  %692 = insertelement <2 x bfloat> %691, bfloat %501, i32 1
  %693 = bitcast <2 x bfloat> %692 to i32
  %694 = insertelement <2 x bfloat> undef, bfloat %503, i32 0
  %695 = insertelement <2 x bfloat> %694, bfloat %504, i32 1
  %696 = bitcast <2 x bfloat> %695 to i32
  %697 = insertelement <2 x bfloat> undef, bfloat %506, i32 0
  %698 = insertelement <2 x bfloat> %697, bfloat %507, i32 1
  %699 = bitcast <2 x bfloat> %698 to i32
  %700 = insertelement <2 x bfloat> undef, bfloat %509, i32 0
  %701 = insertelement <2 x bfloat> %700, bfloat %510, i32 1
  %702 = bitcast <2 x bfloat> %701 to i32
  %703 = insertelement <2 x bfloat> undef, bfloat %512, i32 0
  %704 = insertelement <2 x bfloat> %703, bfloat %513, i32 1
  %705 = bitcast <2 x bfloat> %704 to i32
  %706 = insertelement <2 x bfloat> undef, bfloat %515, i32 0
  %707 = insertelement <2 x bfloat> %706, bfloat %516, i32 1
  %708 = bitcast <2 x bfloat> %707 to i32
  %709 = insertelement <2 x bfloat> undef, bfloat %518, i32 0
  %710 = insertelement <2 x bfloat> %709, bfloat %519, i32 1
  %711 = bitcast <2 x bfloat> %710 to i32
  %712 = insertelement <2 x bfloat> undef, bfloat %521, i32 0
  %713 = insertelement <2 x bfloat> %712, bfloat %522, i32 1
  %714 = bitcast <2 x bfloat> %713 to i32
  %715 = insertelement <2 x bfloat> undef, bfloat %524, i32 0
  %716 = insertelement <2 x bfloat> %715, bfloat %525, i32 1
  %717 = bitcast <2 x bfloat> %716 to i32
  %718 = insertelement <2 x bfloat> undef, bfloat %527, i32 0
  %719 = insertelement <2 x bfloat> %718, bfloat %528, i32 1
  %720 = bitcast <2 x bfloat> %719 to i32
  %721 = insertelement <2 x bfloat> undef, bfloat %530, i32 0
  %722 = insertelement <2 x bfloat> %721, bfloat %531, i32 1
  %723 = bitcast <2 x bfloat> %722 to i32
  %724 = insertelement <2 x bfloat> undef, bfloat %533, i32 0
  %725 = insertelement <2 x bfloat> %724, bfloat %534, i32 1
  %726 = bitcast <2 x bfloat> %725 to i32
  %727 = insertelement <2 x bfloat> undef, bfloat %536, i32 0
  %728 = insertelement <2 x bfloat> %727, bfloat %537, i32 1
  %729 = bitcast <2 x bfloat> %728 to i32
  %730 = insertelement <2 x bfloat> undef, bfloat %539, i32 0
  %731 = insertelement <2 x bfloat> %730, bfloat %540, i32 1
  %732 = bitcast <2 x bfloat> %731 to i32
  %733 = insertelement <2 x bfloat> undef, bfloat %542, i32 0
  %734 = insertelement <2 x bfloat> %733, bfloat %543, i32 1
  %735 = bitcast <2 x bfloat> %734 to i32
  %736 = insertelement <2 x bfloat> undef, bfloat %545, i32 0
  %737 = insertelement <2 x bfloat> %736, bfloat %546, i32 1
  %738 = bitcast <2 x bfloat> %737 to i32
  %739 = insertelement <2 x bfloat> undef, bfloat %548, i32 0
  %740 = insertelement <2 x bfloat> %739, bfloat %549, i32 1
  %741 = bitcast <2 x bfloat> %740 to i32
  %742 = insertelement <2 x bfloat> undef, bfloat %551, i32 0
  %743 = insertelement <2 x bfloat> %742, bfloat %552, i32 1
  %744 = bitcast <2 x bfloat> %743 to i32
  %745 = insertelement <2 x bfloat> undef, bfloat %554, i32 0
  %746 = insertelement <2 x bfloat> %745, bfloat %555, i32 1
  %747 = bitcast <2 x bfloat> %746 to i32
  %748 = insertelement <2 x bfloat> undef, bfloat %557, i32 0
  %749 = insertelement <2 x bfloat> %748, bfloat %558, i32 1
  %750 = bitcast <2 x bfloat> %749 to i32
  %751 = insertelement <2 x bfloat> undef, bfloat %560, i32 0
  %752 = insertelement <2 x bfloat> %751, bfloat %561, i32 1
  %753 = bitcast <2 x bfloat> %752 to i32
  %754 = insertelement <2 x bfloat> undef, bfloat %563, i32 0
  %755 = insertelement <2 x bfloat> %754, bfloat %564, i32 1
  %756 = bitcast <2 x bfloat> %755 to i32
  %757 = insertelement <2 x bfloat> undef, bfloat %566, i32 0
  %758 = insertelement <2 x bfloat> %757, bfloat %567, i32 1
  %759 = bitcast <2 x bfloat> %758 to i32
  %760 = insertelement <2 x bfloat> undef, bfloat %569, i32 0
  %761 = insertelement <2 x bfloat> %760, bfloat %570, i32 1
  %762 = bitcast <2 x bfloat> %761 to i32
  %763 = insertelement <2 x bfloat> undef, bfloat %572, i32 0
  %764 = insertelement <2 x bfloat> %763, bfloat %573, i32 1
  %765 = bitcast <2 x bfloat> %764 to i32
  %766 = insertelement <2 x bfloat> undef, bfloat %575, i32 0
  %767 = insertelement <2 x bfloat> %766, bfloat %576, i32 1
  %768 = bitcast <2 x bfloat> %767 to i32
  %769 = insertelement <2 x bfloat> undef, bfloat %578, i32 0
  %770 = insertelement <2 x bfloat> %769, bfloat %579, i32 1
  %771 = bitcast <2 x bfloat> %770 to i32
  %772 = insertelement <2 x bfloat> undef, bfloat %581, i32 0
  %773 = insertelement <2 x bfloat> %772, bfloat %582, i32 1
  %774 = bitcast <2 x bfloat> %773 to i32
  %775 = insertelement <2 x bfloat> undef, bfloat %584, i32 0
  %776 = insertelement <2 x bfloat> %775, bfloat %585, i32 1
  %777 = bitcast <2 x bfloat> %776 to i32
  %778 = insertelement <2 x bfloat> undef, bfloat %587, i32 0
  %779 = insertelement <2 x bfloat> %778, bfloat %588, i32 1
  %780 = bitcast <2 x bfloat> %779 to i32
  %781 = insertelement <2 x bfloat> undef, bfloat %590, i32 0
  %782 = insertelement <2 x bfloat> %781, bfloat %591, i32 1
  %783 = bitcast <2 x bfloat> %782 to i32
  %784 = insertelement <2 x bfloat> undef, bfloat %593, i32 0
  %785 = insertelement <2 x bfloat> %784, bfloat %594, i32 1
  %786 = bitcast <2 x bfloat> %785 to i32
  %787 = insertelement <2 x bfloat> undef, bfloat %596, i32 0
  %788 = insertelement <2 x bfloat> %787, bfloat %597, i32 1
  %789 = bitcast <2 x bfloat> %788 to i32
  %790 = insertelement <2 x bfloat> undef, bfloat %599, i32 0
  %791 = insertelement <2 x bfloat> %790, bfloat %600, i32 1
  %792 = bitcast <2 x bfloat> %791 to i32
  %793 = insertelement <2 x bfloat> undef, bfloat %602, i32 0
  %794 = insertelement <2 x bfloat> %793, bfloat %603, i32 1
  %795 = bitcast <2 x bfloat> %794 to i32
  %796 = extractvalue { float, float, float, float } %73, 0
  %797 = extractvalue { float, float, float, float } %73, 1
  %798 = extractvalue { float, float, float, float } %73, 2
  %799 = extractvalue { float, float, float, float } %73, 3
  %800 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %796, float %797, float %798, float %799, i32 %606, i32 %609, i32 %612, i32 %615, i32 0, i32 0)
  %801 = extractvalue { float, float, float, float } %800, 0
  %802 = extractvalue { float, float, float, float } %800, 1
  %803 = extractvalue { float, float, float, float } %800, 2
  %804 = extractvalue { float, float, float, float } %800, 3
  %805 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %801, float %802, float %803, float %804, i32 %618, i32 %621, i32 %624, i32 %627, i32 0, i32 0)
  %806 = extractvalue { float, float, float, float } %805, 0
  %807 = extractvalue { float, float, float, float } %805, 1
  %808 = extractvalue { float, float, float, float } %805, 2
  %809 = extractvalue { float, float, float, float } %805, 3
  %810 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %806, float %807, float %808, float %809, i32 %630, i32 %633, i32 %636, i32 %639, i32 0, i32 0)
  %811 = extractvalue { float, float, float, float } %810, 0
  %812 = extractvalue { float, float, float, float } %810, 1
  %813 = extractvalue { float, float, float, float } %810, 2
  %814 = extractvalue { float, float, float, float } %810, 3
  %815 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %811, float %812, float %813, float %814, i32 %642, i32 %645, i32 %648, i32 %651, i32 0, i32 0)
  %816 = extractvalue { float, float, float, float } %815, 0
  %817 = extractvalue { float, float, float, float } %815, 1
  %818 = extractvalue { float, float, float, float } %815, 2
  %819 = extractvalue { float, float, float, float } %815, 3
  %820 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %816, float %817, float %818, float %819, i32 %654, i32 %657, i32 %660, i32 %663, i32 0, i32 0)
  %821 = extractvalue { float, float, float, float } %820, 0
  %822 = extractvalue { float, float, float, float } %820, 1
  %823 = extractvalue { float, float, float, float } %820, 2
  %824 = extractvalue { float, float, float, float } %820, 3
  %825 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %821, float %822, float %823, float %824, i32 %666, i32 %669, i32 %672, i32 %675, i32 0, i32 0)
  %826 = extractvalue { float, float, float, float } %825, 0
  %827 = extractvalue { float, float, float, float } %825, 1
  %828 = extractvalue { float, float, float, float } %825, 2
  %829 = extractvalue { float, float, float, float } %825, 3
  %830 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %826, float %827, float %828, float %829, i32 %678, i32 %681, i32 %684, i32 %687, i32 0, i32 0)
  %831 = extractvalue { float, float, float, float } %830, 0
  %832 = extractvalue { float, float, float, float } %830, 1
  %833 = extractvalue { float, float, float, float } %830, 2
  %834 = extractvalue { float, float, float, float } %830, 3
  %835 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %831, float %832, float %833, float %834, i32 %690, i32 %693, i32 %696, i32 %699, i32 0, i32 0)
  %836 = extractvalue { float, float, float, float } %835, 0
  %837 = extractvalue { float, float, float, float } %835, 1
  %838 = extractvalue { float, float, float, float } %835, 2
  %839 = extractvalue { float, float, float, float } %835, 3
  %840 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %836, float %837, float %838, float %839, i32 %702, i32 %705, i32 %708, i32 %711, i32 0, i32 0)
  %841 = extractvalue { float, float, float, float } %840, 0
  %842 = extractvalue { float, float, float, float } %840, 1
  %843 = extractvalue { float, float, float, float } %840, 2
  %844 = extractvalue { float, float, float, float } %840, 3
  %845 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %841, float %842, float %843, float %844, i32 %714, i32 %717, i32 %720, i32 %723, i32 0, i32 0)
  %846 = extractvalue { float, float, float, float } %845, 0
  %847 = extractvalue { float, float, float, float } %845, 1
  %848 = extractvalue { float, float, float, float } %845, 2
  %849 = extractvalue { float, float, float, float } %845, 3
  %850 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %846, float %847, float %848, float %849, i32 %726, i32 %729, i32 %732, i32 %735, i32 0, i32 0)
  %851 = extractvalue { float, float, float, float } %850, 0
  %852 = extractvalue { float, float, float, float } %850, 1
  %853 = extractvalue { float, float, float, float } %850, 2
  %854 = extractvalue { float, float, float, float } %850, 3
  %855 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %851, float %852, float %853, float %854, i32 %738, i32 %741, i32 %744, i32 %747, i32 0, i32 0)
  %856 = extractvalue { float, float, float, float } %855, 0
  %857 = extractvalue { float, float, float, float } %855, 1
  %858 = extractvalue { float, float, float, float } %855, 2
  %859 = extractvalue { float, float, float, float } %855, 3
  %860 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %856, float %857, float %858, float %859, i32 %750, i32 %753, i32 %756, i32 %759, i32 0, i32 0)
  %861 = extractvalue { float, float, float, float } %860, 0
  %862 = extractvalue { float, float, float, float } %860, 1
  %863 = extractvalue { float, float, float, float } %860, 2
  %864 = extractvalue { float, float, float, float } %860, 3
  %865 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %861, float %862, float %863, float %864, i32 %762, i32 %765, i32 %768, i32 %771, i32 0, i32 0)
  %866 = extractvalue { float, float, float, float } %865, 0
  %867 = extractvalue { float, float, float, float } %865, 1
  %868 = extractvalue { float, float, float, float } %865, 2
  %869 = extractvalue { float, float, float, float } %865, 3
  %870 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %866, float %867, float %868, float %869, i32 %774, i32 %777, i32 %780, i32 %783, i32 0, i32 0)
  %871 = extractvalue { float, float, float, float } %870, 0
  %872 = extractvalue { float, float, float, float } %870, 1
  %873 = extractvalue { float, float, float, float } %870, 2
  %874 = extractvalue { float, float, float, float } %870, 3
  %875 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %871, float %872, float %873, float %874, i32 %786, i32 %789, i32 %792, i32 %795, i32 0, i32 0)
  %876 = extractvalue { float, float, float, float } %875, 0
  %877 = extractvalue { float, float, float, float } %875, 1
  %878 = extractvalue { float, float, float, float } %875, 2
  %879 = extractvalue { float, float, float, float } %875, 3
  %880 = insertvalue { float, float, float, float } undef, float %876, 0
  %881 = insertvalue { float, float, float, float } %880, float %877, 1
  %882 = insertvalue { float, float, float, float } %881, float %878, 2
  %883 = insertvalue { float, float, float, float } %882, float %879, 3
  %884 = add i32 %71, 256
  br label %70

885:                                              ; preds = %70
  %886 = extractvalue { float, float, float, float } %73, 0
  %887 = extractvalue { float, float, float, float } %73, 1
  %888 = extractvalue { float, float, float, float } %73, 2
  %889 = extractvalue { float, float, float, float } %73, 3
  %890 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %886)
  %891 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %887)
  %892 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %888)
  %893 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %889)
  %894 = mul i32 %13, 32
  %895 = sext i32 %894 to i64
  %896 = select i1 %48, i32 0, i32 4
  %897 = xor i32 0, %896
  %898 = select i1 %52, i32 0, i32 8
  %899 = xor i32 %897, %898
  %900 = xor i32 %899, 0
  %901 = add i32 %900, 0
  %902 = sext i32 %901 to i64
  %903 = add i64 %15, %902
  %904 = select i1 %56, i32 0, i32 1
  %905 = xor i32 0, %904
  %906 = select i1 %60, i32 0, i32 2
  %907 = xor i32 %905, %906
  %908 = select i1 %64, i32 0, i32 4
  %909 = xor i32 %907, %908
  %910 = select i1 %19, i32 0, i32 8
  %911 = xor i32 %909, %910
  %912 = select i1 %23, i32 0, i32 16
  %913 = xor i32 %911, %912
  %914 = xor i32 %913, 0
  %915 = add i32 %914, 0
  %916 = sext i32 %915 to i64
  %917 = add i64 %895, %916
  %918 = mul i64 %917, 5120
  %919 = add i64 %903, %918
  %920 = getelementptr bfloat, ptr addrspace(1) %2, i64 %919
  call void @llvm.nvvm.barrier0()
  %921 = select i1 %48, i32 0, i32 32
  %922 = xor i32 0, %921
  %923 = select i1 %52, i32 0, i32 64
  %924 = xor i32 %922, %923
  %925 = xor i32 %924, %904
  %926 = xor i32 %925, %906
  %927 = xor i32 %926, %908
  %928 = select i1 %19, i32 0, i32 128
  %929 = xor i32 %927, %928
  %930 = select i1 %23, i32 0, i32 256
  %931 = xor i32 %929, %930
  %932 = select i1 %56, i32 0, i32 16
  %933 = xor i32 %899, %932
  %934 = select i1 %60, i32 0, i32 32
  %935 = xor i32 %933, %934
  %936 = select i1 %64, i32 0, i32 64
  %937 = xor i32 %935, %936
  %938 = xor i32 %937, %928
  %939 = xor i32 %938, %930
  %940 = xor i32 %931, 0
  %941 = lshr i32 %940, 4
  %942 = shl i32 %941, 2
  %943 = add i32 %942, %940
  %944 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %943
  %945 = insertelement <1 x bfloat> undef, bfloat %890, i32 0
  %946 = extractelement <1 x bfloat> %945, i32 0
  %947 = bitcast bfloat %946 to i16
  %948 = insertelement <1 x i16> undef, i16 %947, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %944, <1 x i16> %948, i1 true)
  %949 = xor i32 %931, 16
  %950 = lshr i32 %949, 4
  %951 = shl i32 %950, 2
  %952 = add i32 %951, %949
  %953 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %952
  %954 = insertelement <1 x bfloat> undef, bfloat %891, i32 0
  %955 = extractelement <1 x bfloat> %954, i32 0
  %956 = bitcast bfloat %955 to i16
  %957 = insertelement <1 x i16> undef, i16 %956, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %953, <1 x i16> %957, i1 true)
  %958 = xor i32 %931, 8
  %959 = lshr i32 %958, 4
  %960 = shl i32 %959, 2
  %961 = add i32 %960, %958
  %962 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %961
  %963 = insertelement <1 x bfloat> undef, bfloat %892, i32 0
  %964 = extractelement <1 x bfloat> %963, i32 0
  %965 = bitcast bfloat %964 to i16
  %966 = insertelement <1 x i16> undef, i16 %965, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %962, <1 x i16> %966, i1 true)
  %967 = xor i32 %931, 24
  %968 = lshr i32 %967, 4
  %969 = shl i32 %968, 2
  %970 = add i32 %969, %967
  %971 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %970
  %972 = insertelement <1 x bfloat> undef, bfloat %893, i32 0
  %973 = extractelement <1 x bfloat> %972, i32 0
  %974 = bitcast bfloat %973 to i16
  %975 = insertelement <1 x i16> undef, i16 %974, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %971, <1 x i16> %975, i1 true)
  call void @llvm.nvvm.barrier0()
  %976 = xor i32 %939, 0
  %977 = lshr i32 %976, 4
  %978 = shl i32 %977, 2
  %979 = add i32 %978, %976
  %980 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %979
  %981 = load <4 x i16>, ptr addrspace(3) %980, align 8
  %982 = extractelement <4 x i16> %981, i32 0
  %983 = extractelement <4 x i16> %981, i32 1
  %984 = extractelement <4 x i16> %981, i32 2
  %985 = extractelement <4 x i16> %981, i32 3
  %986 = insertelement <4 x i16> undef, i16 %982, i32 0
  %987 = insertelement <4 x i16> %986, i16 %983, i32 1
  %988 = insertelement <4 x i16> %987, i16 %984, i32 2
  %989 = insertelement <4 x i16> %988, i16 %985, i32 3
  %990 = extractelement <4 x i16> %989, i32 0
  %991 = extractelement <4 x i16> %989, i32 1
  %992 = extractelement <4 x i16> %989, i32 2
  %993 = extractelement <4 x i16> %989, i32 3
  %994 = bitcast i16 %990 to bfloat
  %995 = bitcast i16 %991 to bfloat
  %996 = bitcast i16 %992 to bfloat
  %997 = bitcast i16 %993 to bfloat
  %998 = insertelement <4 x bfloat> undef, bfloat %994, i32 0
  %999 = insertelement <4 x bfloat> %998, bfloat %995, i32 1
  %1000 = insertelement <4 x bfloat> %999, bfloat %996, i32 2
  %1001 = insertelement <4 x bfloat> %1000, bfloat %997, i32 3
  %1002 = extractelement <4 x bfloat> %1001, i32 0
  %1003 = extractelement <4 x bfloat> %1001, i32 1
  %1004 = extractelement <4 x bfloat> %1001, i32 2
  %1005 = extractelement <4 x bfloat> %1001, i32 3
  %1006 = insertelement <2 x bfloat> undef, bfloat %1002, i32 0
  %1007 = insertelement <2 x bfloat> %1006, bfloat %1003, i32 1
  %1008 = bitcast <2 x bfloat> %1007 to i32
  %1009 = insertelement <2 x bfloat> undef, bfloat %1004, i32 0
  %1010 = insertelement <2 x bfloat> %1009, bfloat %1005, i32 1
  %1011 = bitcast <2 x bfloat> %1010 to i32
  call void asm sideeffect "st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l"(i32 %1008, i32 %1011, ptr addrspace(1) %920)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_74_impl(ptr, ptr, ptr, ptr, ptr, ptr) #4

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #5

declare float @__nv_rsqrtf(float)

define ptx_kernel void @fusion_74(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(65536) %arg1, ptr noalias align 128 dereferenceable(327680) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(65536) %arg4) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %6 = addrspacecast ptr null to ptr addrspace(1)
  %7 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %8 = sext i32 %7 to i64
  %9 = mul i64 %8, 5120
  %10 = add i64 %9, 4096
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

define ptx_kernel void @loop_convert_fusion(ptr noalias align 128 dereferenceable(393216) %0, ptr noalias align 128 dereferenceable(196608) %1) #0 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %5 = udiv i32 %4, 24
  %6 = urem i32 %4, 24
  %7 = mul i32 %6, 128
  %8 = add i32 %7, %3
  %9 = call bfloat @fused_convert_param_0_258(ptr %0, i32 %5, i32 %8)
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
  %20 = call bfloat @fused_convert_param_0_258(ptr %0, i32 %5, i32 %19)
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

define internal bfloat @fused_convert_param_0_258(ptr noalias %0, i32 %1, i32 %2) {
  %4 = mul i32 %1, 6144
  %5 = add i32 %4, %2
  %6 = getelementptr inbounds bfloat, ptr %0, i32 %5
  %7 = load bfloat, ptr %6, align 2, !invariant.load !3
  ret bfloat %7
}

declare float @__nv_fast_expf(float)

declare ptx_kernel void @fusion_75_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_75(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(327680) %arg3, ptr noalias align 128 dereferenceable(65536) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %6 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %7 = addrspacecast ptr null to ptr addrspace(1)
  %8 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %9 = sext i32 %8 to i64
  %10 = mul i64 %9, 5120
  %11 = add i64 %10, 3072
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
  %152 = add i64 %10, 4096
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

declare ptx_kernel void @fusion_76_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_76(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(327680) %arg3, ptr noalias align 128 dereferenceable(65536) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5, ptr noalias align 128 dereferenceable(65536) %arg6) #6 {
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
  %11 = mul i64 %10, 5120
  %12 = add i64 %11, 2048
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
  %153 = add i64 %11, 3072
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
  %260 = add i64 %11, 4096
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

declare ptx_kernel void @fusion_77_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_77(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(327680) %arg3, ptr noalias align 128 dereferenceable(65536) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5, ptr noalias align 128 dereferenceable(65536) %arg6, ptr noalias align 128 dereferenceable(65536) %arg7) #6 {
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
  %12 = mul i64 %11, 5120
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
  %101 = getelementptr bfloat, ptr addrspace(1) %3, i64 %100
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
  %154 = add i64 %12, 2048
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
  %261 = add i64 %12, 3072
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
  %368 = add i64 %12, 4096
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

declare ptx_kernel void @fusion_78_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_78(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(327680) %arg3, ptr noalias align 128 dereferenceable(65536) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5, ptr noalias align 128 dereferenceable(65536) %arg6, ptr noalias align 128 dereferenceable(65536) %arg7, ptr noalias align 128 dereferenceable(65536) %arg8) #6 {
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
  %13 = mul i64 %12, 5120
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
  %100 = mul i64 %12, 1024
  %101 = getelementptr bfloat, ptr addrspace(1) %5, i64 %100
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
  %154 = add i64 %13, 1024
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
  %208 = getelementptr bfloat, ptr addrspace(1) %3, i64 %100
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
  %261 = add i64 %13, 2048
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
  %315 = getelementptr bfloat, ptr addrspace(1) %8, i64 %100
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
  %368 = add i64 %13, 3072
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
  %422 = getelementptr bfloat, ptr addrspace(1) %7, i64 %100
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
  %475 = add i64 %13, 4096
  %476 = getelementptr bfloat, ptr addrspace(1) %4, i64 %475
  %477 = getelementptr bfloat, ptr addrspace(1) %476, i64 %46
  %478 = getelementptr bfloat, ptr addrspace(1) %476, i64 %47
  %479 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %477)
  %480 = extractvalue { i32, i32, i32, i32 } %479, 0
  %481 = bitcast i32 %480 to <2 x bfloat>
  %482 = extractvalue { i32, i32, i32, i32 } %479, 1
  %483 = bitcast i32 %482 to <2 x bfloat>
  %484 = extractvalue { i32, i32, i32, i32 } %479, 2
  %485 = bitcast i32 %484 to <2 x bfloat>
  %486 = extractvalue { i32, i32, i32, i32 } %479, 3
  %487 = bitcast i32 %486 to <2 x bfloat>
  %488 = extractelement <2 x bfloat> %481, i32 0
  %489 = extractelement <2 x bfloat> %481, i32 1
  %490 = extractelement <2 x bfloat> %483, i32 0
  %491 = extractelement <2 x bfloat> %483, i32 1
  %492 = extractelement <2 x bfloat> %485, i32 0
  %493 = extractelement <2 x bfloat> %485, i32 1
  %494 = extractelement <2 x bfloat> %487, i32 0
  %495 = extractelement <2 x bfloat> %487, i32 1
  %496 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %478)
  %497 = extractvalue { i32, i32, i32, i32 } %496, 0
  %498 = bitcast i32 %497 to <2 x bfloat>
  %499 = extractvalue { i32, i32, i32, i32 } %496, 1
  %500 = bitcast i32 %499 to <2 x bfloat>
  %501 = extractvalue { i32, i32, i32, i32 } %496, 2
  %502 = bitcast i32 %501 to <2 x bfloat>
  %503 = extractvalue { i32, i32, i32, i32 } %496, 3
  %504 = bitcast i32 %503 to <2 x bfloat>
  %505 = extractelement <2 x bfloat> %498, i32 0
  %506 = extractelement <2 x bfloat> %498, i32 1
  %507 = extractelement <2 x bfloat> %500, i32 0
  %508 = extractelement <2 x bfloat> %500, i32 1
  %509 = extractelement <2 x bfloat> %502, i32 0
  %510 = extractelement <2 x bfloat> %502, i32 1
  %511 = extractelement <2 x bfloat> %504, i32 0
  %512 = extractelement <2 x bfloat> %504, i32 1
  %513 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %488)
  %514 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %489)
  %515 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %490)
  %516 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %491)
  %517 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %492)
  %518 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %493)
  %519 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %494)
  %520 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %495)
  %521 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %505)
  %522 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %506)
  %523 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %507)
  %524 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %508)
  %525 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %509)
  %526 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %510)
  %527 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %511)
  %528 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %512)
  %529 = getelementptr bfloat, ptr addrspace(1) %6, i64 %100
  %530 = getelementptr bfloat, ptr addrspace(1) %529, i64 %46
  %531 = getelementptr bfloat, ptr addrspace(1) %529, i64 %47
  %532 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %530)
  %533 = extractvalue { i32, i32, i32, i32 } %532, 0
  %534 = bitcast i32 %533 to <2 x bfloat>
  %535 = extractvalue { i32, i32, i32, i32 } %532, 1
  %536 = bitcast i32 %535 to <2 x bfloat>
  %537 = extractvalue { i32, i32, i32, i32 } %532, 2
  %538 = bitcast i32 %537 to <2 x bfloat>
  %539 = extractvalue { i32, i32, i32, i32 } %532, 3
  %540 = bitcast i32 %539 to <2 x bfloat>
  %541 = extractelement <2 x bfloat> %534, i32 0
  %542 = extractelement <2 x bfloat> %534, i32 1
  %543 = extractelement <2 x bfloat> %536, i32 0
  %544 = extractelement <2 x bfloat> %536, i32 1
  %545 = extractelement <2 x bfloat> %538, i32 0
  %546 = extractelement <2 x bfloat> %538, i32 1
  %547 = extractelement <2 x bfloat> %540, i32 0
  %548 = extractelement <2 x bfloat> %540, i32 1
  %549 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %531)
  %550 = extractvalue { i32, i32, i32, i32 } %549, 0
  %551 = bitcast i32 %550 to <2 x bfloat>
  %552 = extractvalue { i32, i32, i32, i32 } %549, 1
  %553 = bitcast i32 %552 to <2 x bfloat>
  %554 = extractvalue { i32, i32, i32, i32 } %549, 2
  %555 = bitcast i32 %554 to <2 x bfloat>
  %556 = extractvalue { i32, i32, i32, i32 } %549, 3
  %557 = bitcast i32 %556 to <2 x bfloat>
  %558 = extractelement <2 x bfloat> %551, i32 0
  %559 = extractelement <2 x bfloat> %551, i32 1
  %560 = extractelement <2 x bfloat> %553, i32 0
  %561 = extractelement <2 x bfloat> %553, i32 1
  %562 = extractelement <2 x bfloat> %555, i32 0
  %563 = extractelement <2 x bfloat> %555, i32 1
  %564 = extractelement <2 x bfloat> %557, i32 0
  %565 = extractelement <2 x bfloat> %557, i32 1
  %566 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %541)
  %567 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %542)
  %568 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %543)
  %569 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %544)
  %570 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %545)
  %571 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %546)
  %572 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %547)
  %573 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %548)
  %574 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %558)
  %575 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %559)
  %576 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %560)
  %577 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %561)
  %578 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %562)
  %579 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %563)
  %580 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %564)
  %581 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %565)
  %582 = fadd float %513, %566
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
  %598 = fadd float %459, %582
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
  %614 = fadd float %406, %598
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
  %630 = fadd float %352, %614
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
  %646 = fadd float %299, %630
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
  %662 = fadd float %245, %646
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
  %678 = fadd float %192, %662
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
  %694 = fadd float %138, %678
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
  %710 = fadd float %84, %694
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
  %726 = fmul float %710, %710
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
  %742 = fadd float %726, %727
  %743 = fadd float %742, %728
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
  %757 = bitcast float %756 to i32
  %758 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %757, i32 16, i32 31)
  %759 = bitcast i32 %758 to float
  %760 = fadd float %756, %759
  %761 = bitcast float %760 to i32
  %762 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %761, i32 8, i32 31)
  %763 = bitcast i32 %762 to float
  %764 = fadd float %760, %763
  %765 = bitcast float %764 to i32
  %766 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %765, i32 4, i32 31)
  %767 = bitcast i32 %766 to float
  %768 = fadd float %764, %767
  %769 = bitcast float %768 to i32
  %770 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %769, i32 2, i32 31)
  %771 = bitcast i32 %770 to float
  %772 = fadd float %768, %771
  %773 = bitcast float %772 to i32
  %774 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %773, i32 1, i32 31)
  %775 = bitcast i32 %774 to float
  %776 = fadd float %772, %775
  %777 = urem i32 %16, 32
  %778 = urem i32 %17, 2
  %779 = icmp eq i32 %777, 0
  %780 = and i1 true, %779
  %781 = add i32 0, %778
  %782 = getelementptr float, ptr addrspace(3) @global_smem, i32 %781
  %783 = insertelement <1 x float> undef, float %776, i32 0
  %784 = extractelement <1 x float> %783, i32 0
  %785 = bitcast float %784 to i32
  %786 = insertelement <1 x i32> undef, i32 %785, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %782, <1 x i32> %786, i1 %780)
  call void @llvm.nvvm.barrier0()
  %787 = icmp slt i32 %15, 2
  %788 = getelementptr float, ptr addrspace(3) @global_smem, i32 %15
  %789 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %788, i1 %787)
  %790 = insertelement <1 x i32> undef, i32 %789, i32 0
  %791 = extractelement <1 x i32> %790, i32 0
  %792 = bitcast i32 %791 to float
  %793 = insertelement <1 x float> undef, float %792, i32 0
  %794 = extractelement <1 x float> %793, i32 0
  %795 = bitcast float %794 to i32
  %796 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %795, i32 1, i32 31)
  %797 = bitcast i32 %796 to float
  %798 = fadd float %794, %797
  %799 = urem i32 %16, 2
  %800 = icmp eq i32 %799, 0
  %801 = and i1 %787, %800
  %802 = insertelement <1 x float> undef, float %798, i32 0
  %803 = extractelement <1 x float> %802, i32 0
  %804 = bitcast float %803 to i32
  %805 = insertelement <1 x i32> undef, i32 %804, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %788, <1 x i32> %805, i1 %801)
  call void @llvm.nvvm.barrier0()
  %806 = load float, ptr addrspace(3) @global_smem, align 4
  %807 = fmul float %806, 0x3F50000000000000
  %808 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %809 = bitcast i32 %808 to <1 x float>
  %810 = extractelement <1 x float> %809, i32 0
  %811 = fadd float %807, %810
  %812 = call float @__nv_rsqrtf(float %811)
  %813 = fmul float %710, %812
  %814 = fmul float %711, %812
  %815 = fmul float %712, %812
  %816 = fmul float %713, %812
  %817 = fmul float %714, %812
  %818 = fmul float %715, %812
  %819 = fmul float %716, %812
  %820 = fmul float %717, %812
  %821 = fmul float %718, %812
  %822 = fmul float %719, %812
  %823 = fmul float %720, %812
  %824 = fmul float %721, %812
  %825 = fmul float %722, %812
  %826 = fmul float %723, %812
  %827 = fmul float %724, %812
  %828 = fmul float %725, %812
  %829 = getelementptr bfloat, ptr addrspace(1) %2, i64 %46
  %830 = getelementptr bfloat, ptr addrspace(1) %2, i64 %47
  %831 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %829)
  %832 = extractvalue { i32, i32, i32, i32 } %831, 0
  %833 = bitcast i32 %832 to <2 x bfloat>
  %834 = extractvalue { i32, i32, i32, i32 } %831, 1
  %835 = bitcast i32 %834 to <2 x bfloat>
  %836 = extractvalue { i32, i32, i32, i32 } %831, 2
  %837 = bitcast i32 %836 to <2 x bfloat>
  %838 = extractvalue { i32, i32, i32, i32 } %831, 3
  %839 = bitcast i32 %838 to <2 x bfloat>
  %840 = extractelement <2 x bfloat> %833, i32 0
  %841 = extractelement <2 x bfloat> %833, i32 1
  %842 = extractelement <2 x bfloat> %835, i32 0
  %843 = extractelement <2 x bfloat> %835, i32 1
  %844 = extractelement <2 x bfloat> %837, i32 0
  %845 = extractelement <2 x bfloat> %837, i32 1
  %846 = extractelement <2 x bfloat> %839, i32 0
  %847 = extractelement <2 x bfloat> %839, i32 1
  %848 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %830)
  %849 = extractvalue { i32, i32, i32, i32 } %848, 0
  %850 = bitcast i32 %849 to <2 x bfloat>
  %851 = extractvalue { i32, i32, i32, i32 } %848, 1
  %852 = bitcast i32 %851 to <2 x bfloat>
  %853 = extractvalue { i32, i32, i32, i32 } %848, 2
  %854 = bitcast i32 %853 to <2 x bfloat>
  %855 = extractvalue { i32, i32, i32, i32 } %848, 3
  %856 = bitcast i32 %855 to <2 x bfloat>
  %857 = extractelement <2 x bfloat> %850, i32 0
  %858 = extractelement <2 x bfloat> %850, i32 1
  %859 = extractelement <2 x bfloat> %852, i32 0
  %860 = extractelement <2 x bfloat> %852, i32 1
  %861 = extractelement <2 x bfloat> %854, i32 0
  %862 = extractelement <2 x bfloat> %854, i32 1
  %863 = extractelement <2 x bfloat> %856, i32 0
  %864 = extractelement <2 x bfloat> %856, i32 1
  %865 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %840)
  %866 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %841)
  %867 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %842)
  %868 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %843)
  %869 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %844)
  %870 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %845)
  %871 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %846)
  %872 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %847)
  %873 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %857)
  %874 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %858)
  %875 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %859)
  %876 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %860)
  %877 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %861)
  %878 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %862)
  %879 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %863)
  %880 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %864)
  %881 = fmul float %813, %865
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
  %897 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %881)
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
  %913 = getelementptr bfloat, ptr addrspace(1) %9, i64 %100
  %914 = getelementptr bfloat, ptr addrspace(1) %913, i64 %46
  %915 = getelementptr bfloat, ptr addrspace(1) %913, i64 %47
  %916 = insertelement <2 x bfloat> undef, bfloat %897, i32 0
  %917 = insertelement <2 x bfloat> %916, bfloat %898, i32 1
  %918 = bitcast <2 x bfloat> %917 to i32
  %919 = insertelement <2 x bfloat> undef, bfloat %899, i32 0
  %920 = insertelement <2 x bfloat> %919, bfloat %900, i32 1
  %921 = bitcast <2 x bfloat> %920 to i32
  %922 = insertelement <2 x bfloat> undef, bfloat %901, i32 0
  %923 = insertelement <2 x bfloat> %922, bfloat %902, i32 1
  %924 = bitcast <2 x bfloat> %923 to i32
  %925 = insertelement <2 x bfloat> undef, bfloat %903, i32 0
  %926 = insertelement <2 x bfloat> %925, bfloat %904, i32 1
  %927 = bitcast <2 x bfloat> %926 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %918, i32 %921, i32 %924, i32 %927, ptr addrspace(1) %914)
  %928 = insertelement <2 x bfloat> undef, bfloat %905, i32 0
  %929 = insertelement <2 x bfloat> %928, bfloat %906, i32 1
  %930 = bitcast <2 x bfloat> %929 to i32
  %931 = insertelement <2 x bfloat> undef, bfloat %907, i32 0
  %932 = insertelement <2 x bfloat> %931, bfloat %908, i32 1
  %933 = bitcast <2 x bfloat> %932 to i32
  %934 = insertelement <2 x bfloat> undef, bfloat %909, i32 0
  %935 = insertelement <2 x bfloat> %934, bfloat %910, i32 1
  %936 = bitcast <2 x bfloat> %935 to i32
  %937 = insertelement <2 x bfloat> undef, bfloat %911, i32 0
  %938 = insertelement <2 x bfloat> %937, bfloat %912, i32 1
  %939 = bitcast <2 x bfloat> %938 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %930, i32 %933, i32 %936, i32 %939, ptr addrspace(1) %915)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_79_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_79(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(65536) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(65536) %arg3, ptr noalias align 128 dereferenceable(327680) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5, ptr noalias align 128 dereferenceable(65536) %arg6, ptr noalias align 128 dereferenceable(65536) %arg7, ptr noalias align 128 dereferenceable(65536) %arg8, ptr noalias align 128 dereferenceable(65536) %arg9) #6 {
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
  %101 = mul i64 %13, 5120
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
  %155 = getelementptr bfloat, ptr addrspace(1) %6, i64 %14
  %156 = getelementptr bfloat, ptr addrspace(1) %155, i64 %47
  %157 = getelementptr bfloat, ptr addrspace(1) %155, i64 %48
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
  %208 = add i64 %101, 1024
  %209 = getelementptr bfloat, ptr addrspace(1) %5, i64 %208
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
  %262 = getelementptr bfloat, ptr addrspace(1) %4, i64 %14
  %263 = getelementptr bfloat, ptr addrspace(1) %262, i64 %47
  %264 = getelementptr bfloat, ptr addrspace(1) %262, i64 %48
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
  %315 = add i64 %101, 2048
  %316 = getelementptr bfloat, ptr addrspace(1) %5, i64 %315
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
  %369 = getelementptr bfloat, ptr addrspace(1) %9, i64 %14
  %370 = getelementptr bfloat, ptr addrspace(1) %369, i64 %47
  %371 = getelementptr bfloat, ptr addrspace(1) %369, i64 %48
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
  %422 = add i64 %101, 3072
  %423 = getelementptr bfloat, ptr addrspace(1) %5, i64 %422
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
  %476 = getelementptr bfloat, ptr addrspace(1) %8, i64 %14
  %477 = getelementptr bfloat, ptr addrspace(1) %476, i64 %47
  %478 = getelementptr bfloat, ptr addrspace(1) %476, i64 %48
  %479 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %477)
  %480 = extractvalue { i32, i32, i32, i32 } %479, 0
  %481 = bitcast i32 %480 to <2 x bfloat>
  %482 = extractvalue { i32, i32, i32, i32 } %479, 1
  %483 = bitcast i32 %482 to <2 x bfloat>
  %484 = extractvalue { i32, i32, i32, i32 } %479, 2
  %485 = bitcast i32 %484 to <2 x bfloat>
  %486 = extractvalue { i32, i32, i32, i32 } %479, 3
  %487 = bitcast i32 %486 to <2 x bfloat>
  %488 = extractelement <2 x bfloat> %481, i32 0
  %489 = extractelement <2 x bfloat> %481, i32 1
  %490 = extractelement <2 x bfloat> %483, i32 0
  %491 = extractelement <2 x bfloat> %483, i32 1
  %492 = extractelement <2 x bfloat> %485, i32 0
  %493 = extractelement <2 x bfloat> %485, i32 1
  %494 = extractelement <2 x bfloat> %487, i32 0
  %495 = extractelement <2 x bfloat> %487, i32 1
  %496 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %478)
  %497 = extractvalue { i32, i32, i32, i32 } %496, 0
  %498 = bitcast i32 %497 to <2 x bfloat>
  %499 = extractvalue { i32, i32, i32, i32 } %496, 1
  %500 = bitcast i32 %499 to <2 x bfloat>
  %501 = extractvalue { i32, i32, i32, i32 } %496, 2
  %502 = bitcast i32 %501 to <2 x bfloat>
  %503 = extractvalue { i32, i32, i32, i32 } %496, 3
  %504 = bitcast i32 %503 to <2 x bfloat>
  %505 = extractelement <2 x bfloat> %498, i32 0
  %506 = extractelement <2 x bfloat> %498, i32 1
  %507 = extractelement <2 x bfloat> %500, i32 0
  %508 = extractelement <2 x bfloat> %500, i32 1
  %509 = extractelement <2 x bfloat> %502, i32 0
  %510 = extractelement <2 x bfloat> %502, i32 1
  %511 = extractelement <2 x bfloat> %504, i32 0
  %512 = extractelement <2 x bfloat> %504, i32 1
  %513 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %488)
  %514 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %489)
  %515 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %490)
  %516 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %491)
  %517 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %492)
  %518 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %493)
  %519 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %494)
  %520 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %495)
  %521 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %505)
  %522 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %506)
  %523 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %507)
  %524 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %508)
  %525 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %509)
  %526 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %510)
  %527 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %511)
  %528 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %512)
  %529 = add i64 %101, 4096
  %530 = getelementptr bfloat, ptr addrspace(1) %5, i64 %529
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
  %583 = getelementptr bfloat, ptr addrspace(1) %7, i64 %14
  %584 = getelementptr bfloat, ptr addrspace(1) %583, i64 %47
  %585 = getelementptr bfloat, ptr addrspace(1) %583, i64 %48
  %586 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %584)
  %587 = extractvalue { i32, i32, i32, i32 } %586, 0
  %588 = bitcast i32 %587 to <2 x bfloat>
  %589 = extractvalue { i32, i32, i32, i32 } %586, 1
  %590 = bitcast i32 %589 to <2 x bfloat>
  %591 = extractvalue { i32, i32, i32, i32 } %586, 2
  %592 = bitcast i32 %591 to <2 x bfloat>
  %593 = extractvalue { i32, i32, i32, i32 } %586, 3
  %594 = bitcast i32 %593 to <2 x bfloat>
  %595 = extractelement <2 x bfloat> %588, i32 0
  %596 = extractelement <2 x bfloat> %588, i32 1
  %597 = extractelement <2 x bfloat> %590, i32 0
  %598 = extractelement <2 x bfloat> %590, i32 1
  %599 = extractelement <2 x bfloat> %592, i32 0
  %600 = extractelement <2 x bfloat> %592, i32 1
  %601 = extractelement <2 x bfloat> %594, i32 0
  %602 = extractelement <2 x bfloat> %594, i32 1
  %603 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %585)
  %604 = extractvalue { i32, i32, i32, i32 } %603, 0
  %605 = bitcast i32 %604 to <2 x bfloat>
  %606 = extractvalue { i32, i32, i32, i32 } %603, 1
  %607 = bitcast i32 %606 to <2 x bfloat>
  %608 = extractvalue { i32, i32, i32, i32 } %603, 2
  %609 = bitcast i32 %608 to <2 x bfloat>
  %610 = extractvalue { i32, i32, i32, i32 } %603, 3
  %611 = bitcast i32 %610 to <2 x bfloat>
  %612 = extractelement <2 x bfloat> %605, i32 0
  %613 = extractelement <2 x bfloat> %605, i32 1
  %614 = extractelement <2 x bfloat> %607, i32 0
  %615 = extractelement <2 x bfloat> %607, i32 1
  %616 = extractelement <2 x bfloat> %609, i32 0
  %617 = extractelement <2 x bfloat> %609, i32 1
  %618 = extractelement <2 x bfloat> %611, i32 0
  %619 = extractelement <2 x bfloat> %611, i32 1
  %620 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %595)
  %621 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %596)
  %622 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %597)
  %623 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %598)
  %624 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %599)
  %625 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %600)
  %626 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %601)
  %627 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %602)
  %628 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %612)
  %629 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %613)
  %630 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %614)
  %631 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %615)
  %632 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %616)
  %633 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %617)
  %634 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %618)
  %635 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %619)
  %636 = fadd float %567, %620
  %637 = fadd float %568, %621
  %638 = fadd float %569, %622
  %639 = fadd float %570, %623
  %640 = fadd float %571, %624
  %641 = fadd float %572, %625
  %642 = fadd float %573, %626
  %643 = fadd float %574, %627
  %644 = fadd float %575, %628
  %645 = fadd float %576, %629
  %646 = fadd float %577, %630
  %647 = fadd float %578, %631
  %648 = fadd float %579, %632
  %649 = fadd float %580, %633
  %650 = fadd float %581, %634
  %651 = fadd float %582, %635
  %652 = fadd float %513, %636
  %653 = fadd float %514, %637
  %654 = fadd float %515, %638
  %655 = fadd float %516, %639
  %656 = fadd float %517, %640
  %657 = fadd float %518, %641
  %658 = fadd float %519, %642
  %659 = fadd float %520, %643
  %660 = fadd float %521, %644
  %661 = fadd float %522, %645
  %662 = fadd float %523, %646
  %663 = fadd float %524, %647
  %664 = fadd float %525, %648
  %665 = fadd float %526, %649
  %666 = fadd float %527, %650
  %667 = fadd float %528, %651
  %668 = fadd float %460, %652
  %669 = fadd float %461, %653
  %670 = fadd float %462, %654
  %671 = fadd float %463, %655
  %672 = fadd float %464, %656
  %673 = fadd float %465, %657
  %674 = fadd float %466, %658
  %675 = fadd float %467, %659
  %676 = fadd float %468, %660
  %677 = fadd float %469, %661
  %678 = fadd float %470, %662
  %679 = fadd float %471, %663
  %680 = fadd float %472, %664
  %681 = fadd float %473, %665
  %682 = fadd float %474, %666
  %683 = fadd float %475, %667
  %684 = fadd float %406, %668
  %685 = fadd float %407, %669
  %686 = fadd float %408, %670
  %687 = fadd float %409, %671
  %688 = fadd float %410, %672
  %689 = fadd float %411, %673
  %690 = fadd float %412, %674
  %691 = fadd float %413, %675
  %692 = fadd float %414, %676
  %693 = fadd float %415, %677
  %694 = fadd float %416, %678
  %695 = fadd float %417, %679
  %696 = fadd float %418, %680
  %697 = fadd float %419, %681
  %698 = fadd float %420, %682
  %699 = fadd float %421, %683
  %700 = fadd float %353, %684
  %701 = fadd float %354, %685
  %702 = fadd float %355, %686
  %703 = fadd float %356, %687
  %704 = fadd float %357, %688
  %705 = fadd float %358, %689
  %706 = fadd float %359, %690
  %707 = fadd float %360, %691
  %708 = fadd float %361, %692
  %709 = fadd float %362, %693
  %710 = fadd float %363, %694
  %711 = fadd float %364, %695
  %712 = fadd float %365, %696
  %713 = fadd float %366, %697
  %714 = fadd float %367, %698
  %715 = fadd float %368, %699
  %716 = fadd float %299, %700
  %717 = fadd float %300, %701
  %718 = fadd float %301, %702
  %719 = fadd float %302, %703
  %720 = fadd float %303, %704
  %721 = fadd float %304, %705
  %722 = fadd float %305, %706
  %723 = fadd float %306, %707
  %724 = fadd float %307, %708
  %725 = fadd float %308, %709
  %726 = fadd float %309, %710
  %727 = fadd float %310, %711
  %728 = fadd float %311, %712
  %729 = fadd float %312, %713
  %730 = fadd float %313, %714
  %731 = fadd float %314, %715
  %732 = fadd float %246, %716
  %733 = fadd float %247, %717
  %734 = fadd float %248, %718
  %735 = fadd float %249, %719
  %736 = fadd float %250, %720
  %737 = fadd float %251, %721
  %738 = fadd float %252, %722
  %739 = fadd float %253, %723
  %740 = fadd float %254, %724
  %741 = fadd float %255, %725
  %742 = fadd float %256, %726
  %743 = fadd float %257, %727
  %744 = fadd float %258, %728
  %745 = fadd float %259, %729
  %746 = fadd float %260, %730
  %747 = fadd float %261, %731
  %748 = fadd float %192, %732
  %749 = fadd float %193, %733
  %750 = fadd float %194, %734
  %751 = fadd float %195, %735
  %752 = fadd float %196, %736
  %753 = fadd float %197, %737
  %754 = fadd float %198, %738
  %755 = fadd float %199, %739
  %756 = fadd float %200, %740
  %757 = fadd float %201, %741
  %758 = fadd float %202, %742
  %759 = fadd float %203, %743
  %760 = fadd float %204, %744
  %761 = fadd float %205, %745
  %762 = fadd float %206, %746
  %763 = fadd float %207, %747
  %764 = fadd float %139, %748
  %765 = fadd float %140, %749
  %766 = fadd float %141, %750
  %767 = fadd float %142, %751
  %768 = fadd float %143, %752
  %769 = fadd float %144, %753
  %770 = fadd float %145, %754
  %771 = fadd float %146, %755
  %772 = fadd float %147, %756
  %773 = fadd float %148, %757
  %774 = fadd float %149, %758
  %775 = fadd float %150, %759
  %776 = fadd float %151, %760
  %777 = fadd float %152, %761
  %778 = fadd float %153, %762
  %779 = fadd float %154, %763
  %780 = fadd float %85, %764
  %781 = fadd float %86, %765
  %782 = fadd float %87, %766
  %783 = fadd float %88, %767
  %784 = fadd float %89, %768
  %785 = fadd float %90, %769
  %786 = fadd float %91, %770
  %787 = fadd float %92, %771
  %788 = fadd float %93, %772
  %789 = fadd float %94, %773
  %790 = fadd float %95, %774
  %791 = fadd float %96, %775
  %792 = fadd float %97, %776
  %793 = fadd float %98, %777
  %794 = fadd float %99, %778
  %795 = fadd float %100, %779
  %796 = fmul float %780, %780
  %797 = fmul float %781, %781
  %798 = fmul float %782, %782
  %799 = fmul float %783, %783
  %800 = fmul float %784, %784
  %801 = fmul float %785, %785
  %802 = fmul float %786, %786
  %803 = fmul float %787, %787
  %804 = fmul float %788, %788
  %805 = fmul float %789, %789
  %806 = fmul float %790, %790
  %807 = fmul float %791, %791
  %808 = fmul float %792, %792
  %809 = fmul float %793, %793
  %810 = fmul float %794, %794
  %811 = fmul float %795, %795
  %812 = fadd float %796, %797
  %813 = fadd float %812, %798
  %814 = fadd float %813, %799
  %815 = fadd float %814, %800
  %816 = fadd float %815, %801
  %817 = fadd float %816, %802
  %818 = fadd float %817, %803
  %819 = fadd float %818, %804
  %820 = fadd float %819, %805
  %821 = fadd float %820, %806
  %822 = fadd float %821, %807
  %823 = fadd float %822, %808
  %824 = fadd float %823, %809
  %825 = fadd float %824, %810
  %826 = fadd float %825, %811
  %827 = bitcast float %826 to i32
  %828 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %827, i32 16, i32 31)
  %829 = bitcast i32 %828 to float
  %830 = fadd float %826, %829
  %831 = bitcast float %830 to i32
  %832 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %831, i32 8, i32 31)
  %833 = bitcast i32 %832 to float
  %834 = fadd float %830, %833
  %835 = bitcast float %834 to i32
  %836 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %835, i32 4, i32 31)
  %837 = bitcast i32 %836 to float
  %838 = fadd float %834, %837
  %839 = bitcast float %838 to i32
  %840 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %839, i32 2, i32 31)
  %841 = bitcast i32 %840 to float
  %842 = fadd float %838, %841
  %843 = bitcast float %842 to i32
  %844 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %843, i32 1, i32 31)
  %845 = bitcast i32 %844 to float
  %846 = fadd float %842, %845
  %847 = urem i32 %17, 32
  %848 = urem i32 %18, 2
  %849 = icmp eq i32 %847, 0
  %850 = and i1 true, %849
  %851 = add i32 0, %848
  %852 = getelementptr float, ptr addrspace(3) @global_smem, i32 %851
  %853 = insertelement <1 x float> undef, float %846, i32 0
  %854 = extractelement <1 x float> %853, i32 0
  %855 = bitcast float %854 to i32
  %856 = insertelement <1 x i32> undef, i32 %855, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %852, <1 x i32> %856, i1 %850)
  call void @llvm.nvvm.barrier0()
  %857 = icmp slt i32 %16, 2
  %858 = getelementptr float, ptr addrspace(3) @global_smem, i32 %16
  %859 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %858, i1 %857)
  %860 = insertelement <1 x i32> undef, i32 %859, i32 0
  %861 = extractelement <1 x i32> %860, i32 0
  %862 = bitcast i32 %861 to float
  %863 = insertelement <1 x float> undef, float %862, i32 0
  %864 = extractelement <1 x float> %863, i32 0
  %865 = bitcast float %864 to i32
  %866 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %865, i32 1, i32 31)
  %867 = bitcast i32 %866 to float
  %868 = fadd float %864, %867
  %869 = urem i32 %17, 2
  %870 = icmp eq i32 %869, 0
  %871 = and i1 %857, %870
  %872 = insertelement <1 x float> undef, float %868, i32 0
  %873 = extractelement <1 x float> %872, i32 0
  %874 = bitcast float %873 to i32
  %875 = insertelement <1 x i32> undef, i32 %874, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %858, <1 x i32> %875, i1 %871)
  call void @llvm.nvvm.barrier0()
  %876 = load float, ptr addrspace(3) @global_smem, align 4
  %877 = fmul float %876, 0x3F50000000000000
  %878 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %879 = bitcast i32 %878 to <1 x float>
  %880 = extractelement <1 x float> %879, i32 0
  %881 = fadd float %877, %880
  %882 = call float @__nv_rsqrtf(float %881)
  %883 = fmul float %780, %882
  %884 = fmul float %781, %882
  %885 = fmul float %782, %882
  %886 = fmul float %783, %882
  %887 = fmul float %784, %882
  %888 = fmul float %785, %882
  %889 = fmul float %786, %882
  %890 = fmul float %787, %882
  %891 = fmul float %788, %882
  %892 = fmul float %789, %882
  %893 = fmul float %790, %882
  %894 = fmul float %791, %882
  %895 = fmul float %792, %882
  %896 = fmul float %793, %882
  %897 = fmul float %794, %882
  %898 = fmul float %795, %882
  %899 = getelementptr bfloat, ptr addrspace(1) %3, i64 %47
  %900 = getelementptr bfloat, ptr addrspace(1) %3, i64 %48
  %901 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %899)
  %902 = extractvalue { i32, i32, i32, i32 } %901, 0
  %903 = bitcast i32 %902 to <2 x bfloat>
  %904 = extractvalue { i32, i32, i32, i32 } %901, 1
  %905 = bitcast i32 %904 to <2 x bfloat>
  %906 = extractvalue { i32, i32, i32, i32 } %901, 2
  %907 = bitcast i32 %906 to <2 x bfloat>
  %908 = extractvalue { i32, i32, i32, i32 } %901, 3
  %909 = bitcast i32 %908 to <2 x bfloat>
  %910 = extractelement <2 x bfloat> %903, i32 0
  %911 = extractelement <2 x bfloat> %903, i32 1
  %912 = extractelement <2 x bfloat> %905, i32 0
  %913 = extractelement <2 x bfloat> %905, i32 1
  %914 = extractelement <2 x bfloat> %907, i32 0
  %915 = extractelement <2 x bfloat> %907, i32 1
  %916 = extractelement <2 x bfloat> %909, i32 0
  %917 = extractelement <2 x bfloat> %909, i32 1
  %918 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %900)
  %919 = extractvalue { i32, i32, i32, i32 } %918, 0
  %920 = bitcast i32 %919 to <2 x bfloat>
  %921 = extractvalue { i32, i32, i32, i32 } %918, 1
  %922 = bitcast i32 %921 to <2 x bfloat>
  %923 = extractvalue { i32, i32, i32, i32 } %918, 2
  %924 = bitcast i32 %923 to <2 x bfloat>
  %925 = extractvalue { i32, i32, i32, i32 } %918, 3
  %926 = bitcast i32 %925 to <2 x bfloat>
  %927 = extractelement <2 x bfloat> %920, i32 0
  %928 = extractelement <2 x bfloat> %920, i32 1
  %929 = extractelement <2 x bfloat> %922, i32 0
  %930 = extractelement <2 x bfloat> %922, i32 1
  %931 = extractelement <2 x bfloat> %924, i32 0
  %932 = extractelement <2 x bfloat> %924, i32 1
  %933 = extractelement <2 x bfloat> %926, i32 0
  %934 = extractelement <2 x bfloat> %926, i32 1
  %935 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %910)
  %936 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %911)
  %937 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %912)
  %938 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %913)
  %939 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %914)
  %940 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %915)
  %941 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %916)
  %942 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %917)
  %943 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %927)
  %944 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %928)
  %945 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %929)
  %946 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %930)
  %947 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %931)
  %948 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %932)
  %949 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %933)
  %950 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %934)
  %951 = fmul float %883, %935
  %952 = fmul float %884, %936
  %953 = fmul float %885, %937
  %954 = fmul float %886, %938
  %955 = fmul float %887, %939
  %956 = fmul float %888, %940
  %957 = fmul float %889, %941
  %958 = fmul float %890, %942
  %959 = fmul float %891, %943
  %960 = fmul float %892, %944
  %961 = fmul float %893, %945
  %962 = fmul float %894, %946
  %963 = fmul float %895, %947
  %964 = fmul float %896, %948
  %965 = fmul float %897, %949
  %966 = fmul float %898, %950
  %967 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %951)
  %968 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %952)
  %969 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %953)
  %970 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %954)
  %971 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %955)
  %972 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %956)
  %973 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %957)
  %974 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %958)
  %975 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %959)
  %976 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %960)
  %977 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %961)
  %978 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %962)
  %979 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %963)
  %980 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %964)
  %981 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %965)
  %982 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %966)
  %983 = getelementptr bfloat, ptr addrspace(1) %10, i64 %14
  %984 = getelementptr bfloat, ptr addrspace(1) %983, i64 %47
  %985 = getelementptr bfloat, ptr addrspace(1) %983, i64 %48
  %986 = insertelement <2 x bfloat> undef, bfloat %967, i32 0
  %987 = insertelement <2 x bfloat> %986, bfloat %968, i32 1
  %988 = bitcast <2 x bfloat> %987 to i32
  %989 = insertelement <2 x bfloat> undef, bfloat %969, i32 0
  %990 = insertelement <2 x bfloat> %989, bfloat %970, i32 1
  %991 = bitcast <2 x bfloat> %990 to i32
  %992 = insertelement <2 x bfloat> undef, bfloat %971, i32 0
  %993 = insertelement <2 x bfloat> %992, bfloat %972, i32 1
  %994 = bitcast <2 x bfloat> %993 to i32
  %995 = insertelement <2 x bfloat> undef, bfloat %973, i32 0
  %996 = insertelement <2 x bfloat> %995, bfloat %974, i32 1
  %997 = bitcast <2 x bfloat> %996 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %988, i32 %991, i32 %994, i32 %997, ptr addrspace(1) %984)
  %998 = insertelement <2 x bfloat> undef, bfloat %975, i32 0
  %999 = insertelement <2 x bfloat> %998, bfloat %976, i32 1
  %1000 = bitcast <2 x bfloat> %999 to i32
  %1001 = insertelement <2 x bfloat> undef, bfloat %977, i32 0
  %1002 = insertelement <2 x bfloat> %1001, bfloat %978, i32 1
  %1003 = bitcast <2 x bfloat> %1002 to i32
  %1004 = insertelement <2 x bfloat> undef, bfloat %979, i32 0
  %1005 = insertelement <2 x bfloat> %1004, bfloat %980, i32 1
  %1006 = bitcast <2 x bfloat> %1005 to i32
  %1007 = insertelement <2 x bfloat> undef, bfloat %981, i32 0
  %1008 = insertelement <2 x bfloat> %1007, bfloat %982, i32 1
  %1009 = bitcast <2 x bfloat> %1008 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %1000, i32 %1003, i32 %1006, i32 %1009, ptr addrspace(1) %985)
  ret void

entry:                                            ; No predecessors!
  ret void
}

define ptx_kernel void @wrapped_slice(ptr noalias align 128 dereferenceable(262144) %0, ptr noalias align 128 dereferenceable(65536) %1) #0 {
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

declare ptx_kernel void @fusion_67_impl(ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_67(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(262144) %arg1, ptr noalias align 16 dereferenceable(256) %arg2, ptr noalias align 128 dereferenceable(131072) %arg3) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr null to ptr addrspace(1)
  %6 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %7 = sext i32 %6 to i64
  %8 = urem i64 %7, 2
  %9 = mul i64 %8, 512
  %10 = udiv i64 %7, 2
  %11 = mul i64 %10, 4096
  %12 = add i64 %9, %11
  %13 = add i64 %12, 2048
  %14 = getelementptr bfloat, ptr addrspace(1) %2, i64 %13
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
  %43 = add i32 %42, 0
  %44 = sext i32 %43 to i64
  %45 = getelementptr bfloat, ptr addrspace(1) %14, i64 %44
  %46 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %45)
  %47 = extractvalue { i32, i32, i32, i32 } %46, 0
  %48 = bitcast i32 %47 to <2 x bfloat>
  %49 = extractvalue { i32, i32, i32, i32 } %46, 1
  %50 = bitcast i32 %49 to <2 x bfloat>
  %51 = extractvalue { i32, i32, i32, i32 } %46, 2
  %52 = bitcast i32 %51 to <2 x bfloat>
  %53 = extractvalue { i32, i32, i32, i32 } %46, 3
  %54 = bitcast i32 %53 to <2 x bfloat>
  %55 = extractelement <2 x bfloat> %48, i32 0
  %56 = extractelement <2 x bfloat> %48, i32 1
  %57 = extractelement <2 x bfloat> %50, i32 0
  %58 = extractelement <2 x bfloat> %50, i32 1
  %59 = extractelement <2 x bfloat> %52, i32 0
  %60 = extractelement <2 x bfloat> %52, i32 1
  %61 = extractelement <2 x bfloat> %54, i32 0
  %62 = extractelement <2 x bfloat> %54, i32 1
  %63 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %55)
  %64 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %56)
  %65 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %57)
  %66 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %58)
  %67 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %59)
  %68 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %60)
  %69 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %61)
  %70 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %62)
  %71 = fmul float %63, %63
  %72 = fmul float %64, %64
  %73 = fmul float %65, %65
  %74 = fmul float %66, %66
  %75 = fmul float %67, %67
  %76 = fmul float %68, %68
  %77 = fmul float %69, %69
  %78 = fmul float %70, %70
  %79 = fadd float %71, %72
  %80 = fadd float %79, %73
  %81 = fadd float %80, %74
  %82 = fadd float %81, %75
  %83 = fadd float %82, %76
  %84 = fadd float %83, %77
  %85 = fadd float %84, %78
  %86 = bitcast float %85 to i32
  %87 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %86, i32 8, i32 31)
  %88 = bitcast i32 %87 to float
  %89 = fadd float %85, %88
  %90 = bitcast float %89 to i32
  %91 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %90, i32 4, i32 31)
  %92 = bitcast i32 %91 to float
  %93 = fadd float %89, %92
  %94 = bitcast float %93 to i32
  %95 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %94, i32 2, i32 31)
  %96 = bitcast i32 %95 to float
  %97 = fadd float %93, %96
  %98 = bitcast float %97 to i32
  %99 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %98, i32 1, i32 31)
  %100 = bitcast i32 %99 to float
  %101 = fadd float %97, %100
  %102 = fmul float %101, 7.812500e-03
  %103 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %104 = bitcast i32 %103 to <1 x float>
  %105 = extractelement <1 x float> %104, i32 0
  %106 = fadd float %102, %105
  %107 = call float @__nv_rsqrtf(float %106)
  %108 = fmul float %63, %107
  %109 = fmul float %64, %107
  %110 = fmul float %65, %107
  %111 = fmul float %66, %107
  %112 = fmul float %67, %107
  %113 = fmul float %68, %107
  %114 = fmul float %69, %107
  %115 = fmul float %70, %107
  %116 = select i1 %19, i32 0, i32 2
  %117 = xor i32 0, %116
  %118 = select i1 %23, i32 0, i32 4
  %119 = xor i32 %117, %118
  %120 = select i1 %27, i32 0, i32 8
  %121 = xor i32 %119, %120
  %122 = select i1 %31, i32 0, i32 16
  %123 = xor i32 %121, %122
  %124 = select i1 %35, i32 0, i32 32
  %125 = xor i32 %123, %124
  %126 = select i1 %39, i32 0, i32 64
  %127 = xor i32 %125, %126
  %128 = xor i32 %127, 0
  %129 = add i32 %128, 0
  %130 = select i1 %19, i32 0, i32 4
  %131 = xor i32 0, %130
  %132 = select i1 %23, i32 0, i32 8
  %133 = xor i32 %131, %132
  %134 = select i1 %27, i32 0, i32 16
  %135 = xor i32 %133, %134
  %136 = select i1 %31, i32 0, i32 32
  %137 = xor i32 %135, %136
  %138 = select i1 %35, i32 0, i32 64
  %139 = xor i32 %137, %138
  %140 = xor i32 %139, 0
  %141 = add i32 %140, 0
  %142 = sext i32 %129 to i64
  %143 = sext i32 %141 to i64
  %144 = getelementptr bfloat, ptr addrspace(1) %3, i64 %142
  %145 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %144)
  %146 = bitcast i32 %145 to <2 x bfloat>
  %147 = extractelement <2 x bfloat> %146, i32 0
  %148 = extractelement <2 x bfloat> %146, i32 1
  %149 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %128
  %150 = insertelement <2 x bfloat> undef, bfloat %147, i32 0
  %151 = insertelement <2 x bfloat> %150, bfloat %148, i32 1
  %152 = extractelement <2 x bfloat> %151, i32 0
  %153 = extractelement <2 x bfloat> %151, i32 1
  %154 = bitcast bfloat %152 to i16
  %155 = bitcast bfloat %153 to i16
  %156 = insertelement <2 x i16> undef, i16 %154, i32 0
  %157 = insertelement <2 x i16> %156, i16 %155, i32 1
  %158 = extractelement <2 x i16> %157, i32 0
  %159 = extractelement <2 x i16> %157, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %149, i16 %158, i16 %159, i1 true)
  call void @llvm.nvvm.barrier0()
  %160 = xor i32 %33, 0
  %161 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %160
  %162 = load <4 x i32>, ptr addrspace(3) %161, align 16
  %163 = extractelement <4 x i32> %162, i32 0
  %164 = extractelement <4 x i32> %162, i32 1
  %165 = extractelement <4 x i32> %162, i32 2
  %166 = extractelement <4 x i32> %162, i32 3
  %167 = insertelement <4 x i32> undef, i32 %163, i32 0
  %168 = insertelement <4 x i32> %167, i32 %164, i32 1
  %169 = insertelement <4 x i32> %168, i32 %165, i32 2
  %170 = insertelement <4 x i32> %169, i32 %166, i32 3
  %171 = extractelement <4 x i32> %170, i32 0
  %172 = extractelement <4 x i32> %170, i32 1
  %173 = extractelement <4 x i32> %170, i32 2
  %174 = extractelement <4 x i32> %170, i32 3
  %175 = bitcast i32 %171 to <2 x i16>
  %176 = extractelement <2 x i16> %175, i32 0
  %177 = extractelement <2 x i16> %175, i32 1
  %178 = bitcast i32 %172 to <2 x i16>
  %179 = extractelement <2 x i16> %178, i32 0
  %180 = extractelement <2 x i16> %178, i32 1
  %181 = bitcast i32 %173 to <2 x i16>
  %182 = extractelement <2 x i16> %181, i32 0
  %183 = extractelement <2 x i16> %181, i32 1
  %184 = bitcast i32 %174 to <2 x i16>
  %185 = extractelement <2 x i16> %184, i32 0
  %186 = extractelement <2 x i16> %184, i32 1
  %187 = insertelement <8 x i16> undef, i16 %176, i32 0
  %188 = insertelement <8 x i16> %187, i16 %177, i32 1
  %189 = insertelement <8 x i16> %188, i16 %179, i32 2
  %190 = insertelement <8 x i16> %189, i16 %180, i32 3
  %191 = insertelement <8 x i16> %190, i16 %182, i32 4
  %192 = insertelement <8 x i16> %191, i16 %183, i32 5
  %193 = insertelement <8 x i16> %192, i16 %185, i32 6
  %194 = insertelement <8 x i16> %193, i16 %186, i32 7
  %195 = extractelement <8 x i16> %194, i32 0
  %196 = extractelement <8 x i16> %194, i32 1
  %197 = extractelement <8 x i16> %194, i32 2
  %198 = extractelement <8 x i16> %194, i32 3
  %199 = extractelement <8 x i16> %194, i32 4
  %200 = extractelement <8 x i16> %194, i32 5
  %201 = extractelement <8 x i16> %194, i32 6
  %202 = extractelement <8 x i16> %194, i32 7
  %203 = bitcast i16 %195 to bfloat
  %204 = bitcast i16 %196 to bfloat
  %205 = bitcast i16 %197 to bfloat
  %206 = bitcast i16 %198 to bfloat
  %207 = bitcast i16 %199 to bfloat
  %208 = bitcast i16 %200 to bfloat
  %209 = bitcast i16 %201 to bfloat
  %210 = bitcast i16 %202 to bfloat
  %211 = insertelement <8 x bfloat> undef, bfloat %203, i32 0
  %212 = insertelement <8 x bfloat> %211, bfloat %204, i32 1
  %213 = insertelement <8 x bfloat> %212, bfloat %205, i32 2
  %214 = insertelement <8 x bfloat> %213, bfloat %206, i32 3
  %215 = insertelement <8 x bfloat> %214, bfloat %207, i32 4
  %216 = insertelement <8 x bfloat> %215, bfloat %208, i32 5
  %217 = insertelement <8 x bfloat> %216, bfloat %209, i32 6
  %218 = insertelement <8 x bfloat> %217, bfloat %210, i32 7
  %219 = extractelement <8 x bfloat> %218, i32 0
  %220 = extractelement <8 x bfloat> %218, i32 1
  %221 = extractelement <8 x bfloat> %218, i32 2
  %222 = extractelement <8 x bfloat> %218, i32 3
  %223 = extractelement <8 x bfloat> %218, i32 4
  %224 = extractelement <8 x bfloat> %218, i32 5
  %225 = extractelement <8 x bfloat> %218, i32 6
  %226 = extractelement <8 x bfloat> %218, i32 7
  %227 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %219)
  %228 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %220)
  %229 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %221)
  %230 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %222)
  %231 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %223)
  %232 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %224)
  %233 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %225)
  %234 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %226)
  %235 = fmul float %108, %227
  %236 = fmul float %109, %228
  %237 = fmul float %110, %229
  %238 = fmul float %111, %230
  %239 = fmul float %112, %231
  %240 = fmul float %113, %232
  %241 = fmul float %114, %233
  %242 = fmul float %115, %234
  %243 = mul i64 %7, 512
  %244 = getelementptr float, ptr addrspace(1) %4, i64 %243
  %245 = select i1 %39, i32 0, i32 1
  %246 = xor i32 0, %245
  %247 = xor i32 %246, 0
  %248 = xor i32 %246, 2
  %249 = add i32 %247, 0
  %250 = add i32 %248, 0
  %251 = sext i32 %249 to i64
  %252 = sext i32 %250 to i64
  %253 = mul i64 %251, 128
  %254 = mul i64 %252, 128
  %255 = add i64 %253, %143
  %256 = add i64 %254, %143
  %257 = getelementptr float, ptr addrspace(1) %244, i64 %255
  %258 = getelementptr float, ptr addrspace(1) %244, i64 %256
  call void @llvm.nvvm.barrier0()
  %259 = select i1 %39, i32 0, i32 128
  %260 = xor i32 %139, %259
  %261 = lshr i32 %42, 7
  %262 = shl i32 %261, 3
  %263 = add i32 %262, %42
  %264 = getelementptr inbounds float, ptr addrspace(3) @global_smem, i32 %263
  %265 = insertelement <8 x float> undef, float %235, i32 0
  %266 = insertelement <8 x float> %265, float %236, i32 1
  %267 = insertelement <8 x float> %266, float %237, i32 2
  %268 = insertelement <8 x float> %267, float %238, i32 3
  %269 = insertelement <8 x float> %268, float %239, i32 4
  %270 = insertelement <8 x float> %269, float %240, i32 5
  %271 = insertelement <8 x float> %270, float %241, i32 6
  %272 = insertelement <8 x float> %271, float %242, i32 7
  %273 = extractelement <8 x float> %272, i32 0
  %274 = extractelement <8 x float> %272, i32 1
  %275 = extractelement <8 x float> %272, i32 2
  %276 = extractelement <8 x float> %272, i32 3
  %277 = extractelement <8 x float> %272, i32 4
  %278 = extractelement <8 x float> %272, i32 5
  %279 = extractelement <8 x float> %272, i32 6
  %280 = extractelement <8 x float> %272, i32 7
  %281 = bitcast float %273 to i32
  %282 = bitcast float %274 to i32
  %283 = bitcast float %275 to i32
  %284 = bitcast float %276 to i32
  %285 = bitcast float %277 to i32
  %286 = bitcast float %278 to i32
  %287 = bitcast float %279 to i32
  %288 = bitcast float %280 to i32
  %289 = insertelement <8 x i32> undef, i32 %281, i32 0
  %290 = insertelement <8 x i32> %289, i32 %282, i32 1
  %291 = insertelement <8 x i32> %290, i32 %283, i32 2
  %292 = insertelement <8 x i32> %291, i32 %284, i32 3
  %293 = insertelement <8 x i32> %292, i32 %285, i32 4
  %294 = insertelement <8 x i32> %293, i32 %286, i32 5
  %295 = insertelement <8 x i32> %294, i32 %287, i32 6
  %296 = insertelement <8 x i32> %295, i32 %288, i32 7
  %297 = extractelement <8 x i32> %296, i32 0
  %298 = extractelement <8 x i32> %296, i32 1
  %299 = extractelement <8 x i32> %296, i32 2
  %300 = extractelement <8 x i32> %296, i32 3
  %301 = extractelement <8 x i32> %296, i32 4
  %302 = extractelement <8 x i32> %296, i32 5
  %303 = extractelement <8 x i32> %296, i32 6
  %304 = extractelement <8 x i32> %296, i32 7
  %305 = insertelement <4 x i32> undef, i32 %297, i32 0
  %306 = insertelement <4 x i32> %305, i32 %298, i32 1
  %307 = insertelement <4 x i32> %306, i32 %299, i32 2
  %308 = insertelement <4 x i32> %307, i32 %300, i32 3
  %309 = extractelement <4 x i32> %308, i32 0
  %310 = extractelement <4 x i32> %308, i32 1
  %311 = extractelement <4 x i32> %308, i32 2
  %312 = extractelement <4 x i32> %308, i32 3
  call void asm sideeffect "@$5 st.shared.v4.b32 [ $0 + 0 ], { $1, $2, $3, $4 };", "r,r,r,r,r,b"(ptr addrspace(3) %264, i32 %309, i32 %310, i32 %311, i32 %312, i1 true)
  %313 = getelementptr inbounds i32, ptr addrspace(3) %264, i32 4
  %314 = insertelement <4 x i32> undef, i32 %301, i32 0
  %315 = insertelement <4 x i32> %314, i32 %302, i32 1
  %316 = insertelement <4 x i32> %315, i32 %303, i32 2
  %317 = insertelement <4 x i32> %316, i32 %304, i32 3
  %318 = extractelement <4 x i32> %317, i32 0
  %319 = extractelement <4 x i32> %317, i32 1
  %320 = extractelement <4 x i32> %317, i32 2
  %321 = extractelement <4 x i32> %317, i32 3
  call void asm sideeffect "@$5 st.shared.v4.b32 [ $0 + 0 ], { $1, $2, $3, $4 };", "r,r,r,r,r,b"(ptr addrspace(3) %313, i32 %318, i32 %319, i32 %320, i32 %321, i1 true)
  call void @llvm.nvvm.barrier0()
  %322 = xor i32 %260, 0
  %323 = lshr i32 %322, 7
  %324 = shl i32 %323, 3
  %325 = add i32 %324, %322
  %326 = getelementptr inbounds float, ptr addrspace(3) @global_smem, i32 %325
  %327 = load <4 x i32>, ptr addrspace(3) %326, align 16
  %328 = extractelement <4 x i32> %327, i32 0
  %329 = extractelement <4 x i32> %327, i32 1
  %330 = extractelement <4 x i32> %327, i32 2
  %331 = extractelement <4 x i32> %327, i32 3
  %332 = insertelement <4 x i32> undef, i32 %328, i32 0
  %333 = insertelement <4 x i32> %332, i32 %329, i32 1
  %334 = insertelement <4 x i32> %333, i32 %330, i32 2
  %335 = insertelement <4 x i32> %334, i32 %331, i32 3
  %336 = extractelement <4 x i32> %335, i32 0
  %337 = extractelement <4 x i32> %335, i32 1
  %338 = extractelement <4 x i32> %335, i32 2
  %339 = extractelement <4 x i32> %335, i32 3
  %340 = bitcast i32 %336 to float
  %341 = bitcast i32 %337 to float
  %342 = bitcast i32 %338 to float
  %343 = bitcast i32 %339 to float
  %344 = insertelement <4 x float> undef, float %340, i32 0
  %345 = insertelement <4 x float> %344, float %341, i32 1
  %346 = insertelement <4 x float> %345, float %342, i32 2
  %347 = insertelement <4 x float> %346, float %343, i32 3
  %348 = extractelement <4 x float> %347, i32 0
  %349 = extractelement <4 x float> %347, i32 1
  %350 = extractelement <4 x float> %347, i32 2
  %351 = extractelement <4 x float> %347, i32 3
  %352 = xor i32 %260, 256
  %353 = lshr i32 %352, 7
  %354 = shl i32 %353, 3
  %355 = add i32 %354, %352
  %356 = getelementptr inbounds float, ptr addrspace(3) @global_smem, i32 %355
  %357 = load <4 x i32>, ptr addrspace(3) %356, align 16
  %358 = extractelement <4 x i32> %357, i32 0
  %359 = extractelement <4 x i32> %357, i32 1
  %360 = extractelement <4 x i32> %357, i32 2
  %361 = extractelement <4 x i32> %357, i32 3
  %362 = insertelement <4 x i32> undef, i32 %358, i32 0
  %363 = insertelement <4 x i32> %362, i32 %359, i32 1
  %364 = insertelement <4 x i32> %363, i32 %360, i32 2
  %365 = insertelement <4 x i32> %364, i32 %361, i32 3
  %366 = extractelement <4 x i32> %365, i32 0
  %367 = extractelement <4 x i32> %365, i32 1
  %368 = extractelement <4 x i32> %365, i32 2
  %369 = extractelement <4 x i32> %365, i32 3
  %370 = bitcast i32 %366 to float
  %371 = bitcast i32 %367 to float
  %372 = bitcast i32 %368 to float
  %373 = bitcast i32 %369 to float
  %374 = insertelement <4 x float> undef, float %370, i32 0
  %375 = insertelement <4 x float> %374, float %371, i32 1
  %376 = insertelement <4 x float> %375, float %372, i32 2
  %377 = insertelement <4 x float> %376, float %373, i32 3
  %378 = extractelement <4 x float> %377, i32 0
  %379 = extractelement <4 x float> %377, i32 1
  %380 = extractelement <4 x float> %377, i32 2
  %381 = extractelement <4 x float> %377, i32 3
  %382 = insertelement <1 x float> undef, float %348, i32 0
  %383 = bitcast <1 x float> %382 to i32
  %384 = insertelement <1 x float> undef, float %349, i32 0
  %385 = bitcast <1 x float> %384 to i32
  %386 = insertelement <1 x float> undef, float %350, i32 0
  %387 = bitcast <1 x float> %386 to i32
  %388 = insertelement <1 x float> undef, float %351, i32 0
  %389 = bitcast <1 x float> %388 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %383, i32 %385, i32 %387, i32 %389, ptr addrspace(1) %257)
  %390 = insertelement <1 x float> undef, float %378, i32 0
  %391 = bitcast <1 x float> %390 to i32
  %392 = insertelement <1 x float> undef, float %379, i32 0
  %393 = bitcast <1 x float> %392 to i32
  %394 = insertelement <1 x float> undef, float %380, i32 0
  %395 = bitcast <1 x float> %394 to i32
  %396 = insertelement <1 x float> undef, float %381, i32 0
  %397 = bitcast <1 x float> %396 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %391, i32 %393, i32 %395, i32 %397, ptr addrspace(1) %258)
  ret void

entry:                                            ; No predecessors!
  ret void
}

define ptx_kernel void @input_concatenate_fusion(ptr noalias align 128 dereferenceable(131072) %0, ptr noalias align 16 dereferenceable(10485760) %1, ptr noalias align 16 dereferenceable(128) %2, ptr noalias align 128 dereferenceable(65536) %3) #0 {
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !1
  %7 = udiv i32 %6, 4
  %8 = urem i32 %5, 64
  %9 = udiv i32 %5, 64
  %10 = mul i32 %9, 128
  %11 = mul i32 %6, 256
  %12 = add i32 %10, %11
  %13 = add i32 %12, %8
  %14 = getelementptr inbounds float, ptr %0, i32 %13
  %15 = load float, ptr %14, align 4, !invariant.load !3
  %16 = call float @fused_concatenate_convert_375_7(ptr %0, ptr %1, ptr %2, i32 %7, i32 %8)
  %17 = fmul float %15, %16
  %18 = add i32 %8, 64
  %19 = add i32 %13, 64
  %20 = getelementptr inbounds float, ptr %0, i32 %19
  %21 = load float, ptr %20, align 4, !invariant.load !3
  %22 = call float @fused_concatenate_convert_375_7(ptr %0, ptr %1, ptr %2, i32 %7, i32 %18)
  %23 = fmul float %21, %22
  %24 = fsub float %17, %23
  %25 = fptrunc float %24 to bfloat
  %26 = getelementptr inbounds bfloat, ptr %3, i32 %13
  store bfloat %25, ptr %26, align 2
  %27 = load float, ptr %20, align 4, !invariant.load !3
  %28 = call float @fused_concatenate_convert_375_7(ptr %0, ptr %1, ptr %2, i32 %7, i32 %8)
  %29 = fmul float %27, %28
  %30 = load float, ptr %14, align 4, !invariant.load !3
  %31 = call float @fused_concatenate_convert_375_7(ptr %0, ptr %1, ptr %2, i32 %7, i32 %18)
  %32 = fmul float %30, %31
  %33 = fadd float %29, %32
  %34 = fptrunc float %33 to bfloat
  %35 = getelementptr inbounds bfloat, ptr %3, i32 %19
  store bfloat %34, ptr %35, align 2
  ret void
}

define internal float @fused_concatenate_convert_375_7(ptr noalias %0, ptr noalias %1, ptr noalias %2, i32 %3, i32 %4) {
  %6 = getelementptr inbounds i32, ptr %2, i32 %3
  %7 = load i32, ptr %6, align 4, !invariant.load !3
  %8 = call i32 @llvm.smin.i32(i32 %7, i32 40959)
  %9 = call i32 @llvm.smax.i32(i32 %8, i32 0)
  %10 = mul i32 %9, 128
  %11 = add i32 %10, %4
  %12 = getelementptr inbounds bfloat, ptr %1, i32 %11
  %13 = load bfloat, ptr %12, align 2, !invariant.load !3
  %14 = fpext bfloat %13 to float
  ret float %14
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
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
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
!2 = !{i32 0, i32 256}
!3 = !{}
!4 = !{i32 0, i32 20480}
!5 = !{i32 0, i32 768}
!6 = !{i32 0, i32 135456}

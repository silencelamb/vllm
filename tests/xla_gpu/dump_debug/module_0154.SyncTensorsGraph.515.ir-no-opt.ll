; ModuleID = 'SyncTensorsGraph.515'
source_filename = "SyncTensorsGraph.515"
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

define ptx_kernel void @wrapped_concatenate(ptr noalias align 16 dereferenceable(4194304) %0, ptr noalias align 16 dereferenceable(4194304) %1, ptr noalias align 16 dereferenceable(4194304) %2, ptr noalias align 16 dereferenceable(4194304) %3, ptr noalias align 16 dereferenceable(4194304) %4, ptr noalias align 128 dereferenceable(20971520) %5) #0 {
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !3
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
  %18 = load bfloat, ptr %17, align 2, !invariant.load !2
  br label %28

19:                                               ; preds = %14
  %20 = sub i32 %9, 1024
  %21 = urem i32 %8, 4
  %22 = mul i32 %21, 512
  %23 = add i32 %22, %11
  %24 = mul i32 %20, 2048
  %25 = add i32 %23, %24
  %26 = getelementptr inbounds bfloat, ptr %1, i32 %25
  %27 = load bfloat, ptr %26, align 2, !invariant.load !2
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
  %41 = load bfloat, ptr %40, align 2, !invariant.load !2
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
  %52 = load bfloat, ptr %51, align 2, !invariant.load !2
  br label %62

53:                                               ; preds = %42
  %54 = sub i32 %9, 4096
  %55 = urem i32 %8, 4
  %56 = mul i32 %55, 512
  %57 = add i32 %56, %11
  %58 = mul i32 %54, 2048
  %59 = add i32 %57, %58
  %60 = getelementptr inbounds bfloat, ptr %4, i32 %59
  %61 = load bfloat, ptr %60, align 2, !invariant.load !2
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
  %77 = load bfloat, ptr %76, align 2, !invariant.load !2
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
  %87 = load bfloat, ptr %86, align 2, !invariant.load !2
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
  %102 = load bfloat, ptr %101, align 2, !invariant.load !2
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
  %114 = load bfloat, ptr %113, align 2, !invariant.load !2
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
  %124 = load bfloat, ptr %123, align 2, !invariant.load !2
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
  %140 = load bfloat, ptr %139, align 2, !invariant.load !2
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
  %150 = load bfloat, ptr %149, align 2, !invariant.load !2
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
  %165 = load bfloat, ptr %164, align 2, !invariant.load !2
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
  %177 = load bfloat, ptr %176, align 2, !invariant.load !2
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
  %187 = load bfloat, ptr %186, align 2, !invariant.load !2
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
  %203 = load bfloat, ptr %202, align 2, !invariant.load !2
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
  %213 = load bfloat, ptr %212, align 2, !invariant.load !2
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
  %228 = load bfloat, ptr %227, align 2, !invariant.load !2
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
  %240 = load bfloat, ptr %239, align 2, !invariant.load !2
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
  %250 = load bfloat, ptr %249, align 2, !invariant.load !2
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

define ptx_kernel void @gemm_fusion_dot_19_0(ptr noalias align 128 dereferenceable(20971520) %arg0, ptr noalias align 128 dereferenceable(163840) %arg1) #0 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr null to ptr addrspace(1)
  %4 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %5 = sdiv i32 %4, 8
  %6 = mul i32 %5, 8
  %7 = sub i32 40, %6
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
  %1314 = mul i64 %1312, 5120
  %1315 = mul i64 %1313, 5120
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

declare ptx_kernel void @fusion_77_impl(ptr, ptr, ptr, ptr, ptr, ptr) #4

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #5

declare float @__nv_rsqrtf(float)

define ptx_kernel void @fusion_77(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(32768) %arg1, ptr noalias align 128 dereferenceable(163840) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4) #6 {
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
  %12 = mul i64 %9, 5120
  %13 = add i64 %11, %12
  %14 = add i64 %13, 4096
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
  %80 = add i64 %12, 4096
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

define ptx_kernel void @loop_convert_fusion_4(ptr noalias align 128 dereferenceable(196608) %0, ptr noalias align 128 dereferenceable(98304) %1) #0 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %5 = udiv i32 %4, 24
  %6 = urem i32 %4, 24
  %7 = mul i32 %6, 128
  %8 = add i32 %7, %3
  %9 = call bfloat @fused_convert_4_param_0_201(ptr %0, i32 %5, i32 %8)
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
  %20 = call bfloat @fused_convert_4_param_0_201(ptr %0, i32 %5, i32 %19)
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

define internal bfloat @fused_convert_4_param_0_201(ptr noalias %0, i32 %1, i32 %2) {
  %4 = mul i32 %1, 6144
  %5 = add i32 %4, %2
  %6 = getelementptr inbounds bfloat, ptr %0, i32 %5
  %7 = load bfloat, ptr %6, align 2, !invariant.load !2
  ret bfloat %7
}

declare float @__nv_fast_expf(float)

declare ptx_kernel void @fusion_75_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_75(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(163840) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5) #6 {
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
  %13 = mul i64 %10, 5120
  %14 = add i64 %12, %13
  %15 = add i64 %14, 3072
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
  %77 = add i64 %14, 4096
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
  %120 = add i64 %13, 3072
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
  %246 = add i64 %13, 4096
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

declare ptx_kernel void @fusion_73_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_73(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(163840) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6) #6 {
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

declare ptx_kernel void @fusion_71_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_71(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(163840) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6, ptr noalias align 128 dereferenceable(32768) %arg7) #6 {
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

declare ptx_kernel void @fusion_69_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_69(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(163840) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6, ptr noalias align 128 dereferenceable(32768) %arg7, ptr noalias align 128 dereferenceable(32768) %arg8) #6 {
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

declare ptx_kernel void @fusion_67_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_67(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(32768) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(163840) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6, ptr noalias align 128 dereferenceable(32768) %arg7, ptr noalias align 128 dereferenceable(32768) %arg8, ptr noalias align 128 dereferenceable(32768) %arg9) #6 {
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

declare ptx_kernel void @triton_softmax_7_0_impl(ptr, ptr, ptr, ptr) #7

define ptx_kernel void @triton_softmax_7_0(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2) #8 {
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
  %21 = call float @fused_concatenate_convert_375_17(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %9)
  %22 = fmul float %20, %21
  %23 = add i32 %9, 64
  %24 = add i32 %14, 64
  %25 = getelementptr inbounds float, ptr %0, i32 %24
  %26 = load float, ptr %25, align 4, !invariant.load !2
  %27 = getelementptr inbounds bfloat, ptr %1, i32 %23
  %28 = load bfloat, ptr %27, align 2, !invariant.load !2
  %29 = fpext bfloat %28 to float
  %30 = fmul float %26, %29
  %31 = call float @fused_concatenate_convert_375_17(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %23)
  %32 = fmul float %30, %31
  %33 = fsub float %22, %32
  %34 = fptrunc float %33 to bfloat
  %35 = getelementptr inbounds bfloat, ptr %4, i32 %14
  store bfloat %34, ptr %35, align 2
  %36 = load float, ptr %25, align 4, !invariant.load !2
  %37 = load bfloat, ptr %27, align 2, !invariant.load !2
  %38 = fpext bfloat %37 to float
  %39 = fmul float %36, %38
  %40 = call float @fused_concatenate_convert_375_17(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %9)
  %41 = fmul float %39, %40
  %42 = load float, ptr %15, align 4, !invariant.load !2
  %43 = load bfloat, ptr %17, align 2, !invariant.load !2
  %44 = fpext bfloat %43 to float
  %45 = fmul float %42, %44
  %46 = call float @fused_concatenate_convert_375_17(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %23)
  %47 = fmul float %45, %46
  %48 = fadd float %41, %47
  %49 = fptrunc float %48 to bfloat
  %50 = getelementptr inbounds bfloat, ptr %4, i32 %24
  store bfloat %49, ptr %50, align 2
  ret void
}

define internal float @fused_concatenate_convert_375_17(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, i32 %4, i32 %5) {
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
!3 = !{i32 0, i32 20480}
!4 = !{i32 0, i32 384}
!5 = !{i32 0, i32 64}
!6 = !{i32 0, i32 135456}

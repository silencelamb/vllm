; ModuleID = 'SyncTensorsGraph.515'
source_filename = "SyncTensorsGraph.515"
target datalayout = "e-p6:32:32-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@global_smem = external addrspace(3) global [0 x i8], align 16

define ptx_kernel void @loop_gather_fusion(ptr noalias align 16 dereferenceable(311164928) %0, ptr noalias align 16 dereferenceable(512) %1, ptr noalias align 128 dereferenceable(262144) %2) #0 {
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

define ptx_kernel void @gemm_fusion_dot_19_0(ptr noalias align 128 dereferenceable(20971520) %arg0, ptr noalias align 128 dereferenceable(1310720) %arg1) #0 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr null to ptr addrspace(1)
  %4 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %5 = sdiv i32 %4, 1280
  %6 = mul i32 %5, 8
  %7 = sub i32 2, %6
  %8 = icmp slt i32 %7, 8
  %9 = select i1 %8, i32 %7, i32 8
  %10 = srem i32 %4, %9
  %11 = add i32 %6, %10
  %12 = srem i32 %4, 1280
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
  %454 = mul i64 %452, 5120
  %455 = mul i64 %453, 5120
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

declare ptx_kernel void @fusion_82_impl(ptr, ptr, ptr, ptr, ptr, ptr) #4

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #5

declare float @__nv_rsqrtf(float)

define ptx_kernel void @fusion_82(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(262144) %arg1, ptr noalias align 128 dereferenceable(1310720) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(262144) %arg4) #6 {
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

define ptx_kernel void @loop_convert_fusion(ptr noalias align 128 dereferenceable(1572864) %0, ptr noalias align 128 dereferenceable(786432) %1) #0 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %5 = udiv i32 %4, 6
  %6 = mul i32 %3, 4
  %7 = mul i32 %4, 512
  %8 = add i32 %6, %7
  %9 = urem i32 %4, 6
  %10 = mul i32 %9, 512
  %11 = add i32 %10, %6
  %12 = call bfloat @fused_convert_param_0_271(ptr %0, i32 %5, i32 %11)
  %13 = fpext bfloat %12 to float
  %14 = fneg float %13
  %15 = fptrunc float %14 to bfloat
  %16 = fpext bfloat %15 to float
  %17 = call float @__nv_fast_expf(float %16)
  %18 = fptrunc float %17 to bfloat
  %19 = fpext bfloat %18 to float
  %20 = fadd float %19, 1.000000e+00
  %21 = fdiv float 1.000000e+00, %20
  %22 = add i32 %11, 3072
  %23 = call bfloat @fused_convert_param_0_271(ptr %0, i32 %5, i32 %22)
  %24 = fmul float %13, %21
  %25 = fpext bfloat %23 to float
  %26 = fmul float %24, %25
  %27 = fptrunc float %26 to bfloat
  %28 = insertelement <4 x bfloat> zeroinitializer, bfloat %27, i64 0
  %29 = add i32 %11, 1
  %30 = call bfloat @fused_convert_param_0_271(ptr %0, i32 %5, i32 %29)
  %31 = fpext bfloat %30 to float
  %32 = fneg float %31
  %33 = fptrunc float %32 to bfloat
  %34 = fpext bfloat %33 to float
  %35 = call float @__nv_fast_expf(float %34)
  %36 = fptrunc float %35 to bfloat
  %37 = fpext bfloat %36 to float
  %38 = fadd float %37, 1.000000e+00
  %39 = fdiv float 1.000000e+00, %38
  %40 = add i32 %29, 3072
  %41 = call bfloat @fused_convert_param_0_271(ptr %0, i32 %5, i32 %40)
  %42 = fmul float %31, %39
  %43 = fpext bfloat %41 to float
  %44 = fmul float %42, %43
  %45 = fptrunc float %44 to bfloat
  %46 = insertelement <4 x bfloat> %28, bfloat %45, i64 1
  %47 = add i32 %11, 2
  %48 = call bfloat @fused_convert_param_0_271(ptr %0, i32 %5, i32 %47)
  %49 = fpext bfloat %48 to float
  %50 = fneg float %49
  %51 = fptrunc float %50 to bfloat
  %52 = fpext bfloat %51 to float
  %53 = call float @__nv_fast_expf(float %52)
  %54 = fptrunc float %53 to bfloat
  %55 = fpext bfloat %54 to float
  %56 = fadd float %55, 1.000000e+00
  %57 = fdiv float 1.000000e+00, %56
  %58 = add i32 %47, 3072
  %59 = call bfloat @fused_convert_param_0_271(ptr %0, i32 %5, i32 %58)
  %60 = fmul float %49, %57
  %61 = fpext bfloat %59 to float
  %62 = fmul float %60, %61
  %63 = fptrunc float %62 to bfloat
  %64 = insertelement <4 x bfloat> %46, bfloat %63, i64 2
  %65 = add i32 %11, 3
  %66 = call bfloat @fused_convert_param_0_271(ptr %0, i32 %5, i32 %65)
  %67 = fpext bfloat %66 to float
  %68 = fneg float %67
  %69 = fptrunc float %68 to bfloat
  %70 = fpext bfloat %69 to float
  %71 = call float @__nv_fast_expf(float %70)
  %72 = fptrunc float %71 to bfloat
  %73 = fpext bfloat %72 to float
  %74 = fadd float %73, 1.000000e+00
  %75 = fdiv float 1.000000e+00, %74
  %76 = add i32 %65, 3072
  %77 = call bfloat @fused_convert_param_0_271(ptr %0, i32 %5, i32 %76)
  %78 = fmul float %67, %75
  %79 = fpext bfloat %77 to float
  %80 = fmul float %78, %79
  %81 = fptrunc float %80 to bfloat
  %82 = insertelement <4 x bfloat> %64, bfloat %81, i64 3
  %83 = getelementptr inbounds bfloat, ptr %1, i32 %8
  store <4 x bfloat> %82, ptr %83, align 8
  ret void
}

define internal bfloat @fused_convert_param_0_271(ptr noalias %0, i32 %1, i32 %2) {
  %4 = mul i32 %1, 6144
  %5 = add i32 %4, %2
  %6 = getelementptr inbounds bfloat, ptr %0, i32 %5
  %7 = load bfloat, ptr %6, align 2, !invariant.load !3
  ret bfloat %7
}

declare float @__nv_fast_expf(float)

declare ptx_kernel void @fusion_80_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_80(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(262144) %arg1, ptr noalias align 128 dereferenceable(1310720) %arg2, ptr noalias align 128 dereferenceable(262144) %arg3, ptr noalias align 16 dereferenceable(2048) %arg4, ptr noalias align 128 dereferenceable(262144) %arg5) #6 {
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
  %152 = add i64 %10, 4096
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

define ptx_kernel void @loop_add_fusion(ptr noalias align 128 dereferenceable(1310720) %0, ptr noalias align 128 dereferenceable(262144) %1, ptr noalias align 128 dereferenceable(262144) %2, ptr noalias align 128 dereferenceable(262144) %3, ptr noalias align 128 dereferenceable(524288) %4) #0 {
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %8 = udiv i32 %7, 8
  %9 = urem i32 %7, 8
  %10 = mul i32 %9, 128
  %11 = add i32 %10, %6
  %12 = mul i32 %7, 128
  %13 = add i32 %12, %6
  %14 = getelementptr inbounds bfloat, ptr %2, i32 %13
  %15 = load bfloat, ptr %14, align 2, !invariant.load !3
  %16 = getelementptr inbounds bfloat, ptr %3, i32 %13
  %17 = load bfloat, ptr %16, align 2, !invariant.load !3
  %18 = add i32 %11, 4096
  %19 = call float @fused_add_convert_293_11(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %18)
  %20 = fpext bfloat %15 to float
  %21 = fpext bfloat %17 to float
  %22 = fadd float %19, %20
  %23 = getelementptr inbounds bfloat, ptr %1, i32 %13
  %24 = load bfloat, ptr %23, align 2, !invariant.load !3
  %25 = add i32 %11, 3072
  %26 = call float @fused_add_convert_293_11(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %25)
  %27 = fadd float %21, %22
  %28 = fpext bfloat %24 to float
  %29 = fadd float %26, %27
  %30 = add i32 %11, 2048
  %31 = call float @fused_add_convert_293_11(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %30)
  %32 = fadd float %28, %29
  %33 = fadd float %31, %32
  %34 = getelementptr inbounds float, ptr %4, i32 %13
  store float %33, ptr %34, align 4
  ret void
}

define internal float @fused_add_convert_293_11(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, i32 %4, i32 %5) {
  %7 = mul i32 %4, 5120
  %8 = add i32 %7, %5
  %9 = getelementptr inbounds bfloat, ptr %0, i32 %8
  %10 = load bfloat, ptr %9, align 2, !invariant.load !3
  %11 = fpext bfloat %10 to float
  ret float %11
}

declare ptx_kernel void @fusion_78_impl(ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_78(ptr noalias align 128 dereferenceable(524288) %arg0, ptr noalias align 16 dereferenceable(4) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(262144) %arg3) #6 {
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

declare ptx_kernel void @fusion_76_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_76(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(524288) %arg1, ptr noalias align 128 dereferenceable(262144) %arg2, ptr noalias align 128 dereferenceable(1310720) %arg3, ptr noalias align 16 dereferenceable(2048) %arg4, ptr noalias align 128 dereferenceable(262144) %arg5) #6 {
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

declare ptx_kernel void @fusion_74_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_74(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(524288) %arg2, ptr noalias align 128 dereferenceable(262144) %arg3, ptr noalias align 128 dereferenceable(1310720) %arg4, ptr noalias align 128 dereferenceable(262144) %arg5, ptr noalias align 128 dereferenceable(262144) %arg6) #6 {
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

declare ptx_kernel void @fusion_72_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_72(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(262144) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(524288) %arg3, ptr noalias align 128 dereferenceable(262144) %arg4, ptr noalias align 128 dereferenceable(1310720) %arg5, ptr noalias align 128 dereferenceable(262144) %arg6, ptr noalias align 128 dereferenceable(262144) %arg7) #6 {
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
  %105 = mul i64 %11, 5120
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

define ptx_kernel void @wrapped_slice(ptr noalias align 128 dereferenceable(1048576) %0, ptr noalias align 128 dereferenceable(262144) %1) #0 {
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

declare ptx_kernel void @triton_softmax_7_0_impl(ptr, ptr, ptr, ptr) #4

define ptx_kernel void @triton_softmax_7_0(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(1048576) %arg1, ptr noalias align 128 dereferenceable(524288) %arg2) #6 {
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

define ptx_kernel void @input_concatenate_fusion(ptr noalias align 128 dereferenceable(524288) %0, ptr noalias align 16 dereferenceable(256) %1, ptr noalias align 16 dereferenceable(10485760) %2, ptr noalias align 16 dereferenceable(512) %3, ptr noalias align 128 dereferenceable(262144) %4) #0 {
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
  %21 = call float @fused_concatenate_convert_375_7(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %9)
  %22 = fmul float %20, %21
  %23 = add i32 %9, 64
  %24 = add i32 %14, 64
  %25 = getelementptr inbounds float, ptr %0, i32 %24
  %26 = load float, ptr %25, align 4, !invariant.load !3
  %27 = getelementptr inbounds bfloat, ptr %1, i32 %23
  %28 = load bfloat, ptr %27, align 2, !invariant.load !3
  %29 = fpext bfloat %28 to float
  %30 = fmul float %26, %29
  %31 = call float @fused_concatenate_convert_375_7(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %23)
  %32 = fmul float %30, %31
  %33 = fsub float %22, %32
  %34 = fptrunc float %33 to bfloat
  %35 = getelementptr inbounds bfloat, ptr %4, i32 %14
  store bfloat %34, ptr %35, align 2
  %36 = load float, ptr %25, align 4, !invariant.load !3
  %37 = load bfloat, ptr %27, align 2, !invariant.load !3
  %38 = fpext bfloat %37 to float
  %39 = fmul float %36, %38
  %40 = call float @fused_concatenate_convert_375_7(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %9)
  %41 = fmul float %39, %40
  %42 = load float, ptr %15, align 4, !invariant.load !3
  %43 = load bfloat, ptr %17, align 2, !invariant.load !3
  %44 = fpext bfloat %43 to float
  %45 = fmul float %42, %44
  %46 = call float @fused_concatenate_convert_375_7(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %23)
  %47 = fmul float %45, %46
  %48 = fadd float %41, %47
  %49 = fptrunc float %48 to bfloat
  %50 = getelementptr inbounds bfloat, ptr %4, i32 %24
  store bfloat %49, ptr %50, align 2
  ret void
}

define internal float @fused_concatenate_convert_375_7(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, i32 %4, i32 %5) {
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
!2 = !{i32 0, i32 1024}
!3 = !{}
!4 = !{i32 0, i32 20480}
!5 = !{i32 0, i32 768}
!6 = !{i32 0, i32 512}
!7 = !{i32 0, i32 135456}

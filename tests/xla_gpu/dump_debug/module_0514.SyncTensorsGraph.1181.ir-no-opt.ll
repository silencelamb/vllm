; ModuleID = 'SyncTensorsGraph.1181'
source_filename = "SyncTensorsGraph.1181"
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

define ptx_kernel void @wrapped_concatenate(ptr noalias align 16 dereferenceable(4194304) %0, ptr noalias align 16 dereferenceable(4194304) %1, ptr noalias align 16 dereferenceable(4194304) %2, ptr noalias align 16 dereferenceable(4194304) %3, ptr noalias align 16 dereferenceable(4194304) %4, ptr noalias align 16 dereferenceable(4194304) %5, ptr noalias align 16 dereferenceable(4194304) %6, ptr noalias align 16 dereferenceable(4194304) %7, ptr noalias align 16 dereferenceable(4194304) %8, ptr noalias align 16 dereferenceable(4194304) %9, ptr noalias align 16 dereferenceable(4194304) %10, ptr noalias align 16 dereferenceable(4194304) %11, ptr noalias align 16 dereferenceable(4194304) %12, ptr noalias align 16 dereferenceable(4194304) %13, ptr noalias align 128 dereferenceable(58720256) %14) #0 {
  %16 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !3
  %18 = udiv i32 %17, 16
  %19 = icmp ult i32 %18, 7168
  br i1 %19, label %20, label %109

20:                                               ; preds = %15
  %21 = icmp ult i32 %18, 3072
  br i1 %21, label %22, label %55

22:                                               ; preds = %20
  %23 = icmp ult i32 %18, 1024
  br i1 %23, label %24, label %29

24:                                               ; preds = %22
  %25 = mul i32 %17, 128
  %26 = add i32 %25, %16
  %27 = getelementptr inbounds bfloat, ptr %0, i32 %26
  %28 = load bfloat, ptr %27, align 2, !invariant.load !2
  br label %52

29:                                               ; preds = %22
  %30 = icmp ult i32 %18, 2048
  br i1 %30, label %31, label %40

31:                                               ; preds = %29
  %32 = sub i32 %18, 1024
  %33 = urem i32 %17, 16
  %34 = mul i32 %33, 128
  %35 = add i32 %34, %16
  %36 = mul i32 %32, 2048
  %37 = add i32 %35, %36
  %38 = getelementptr inbounds bfloat, ptr %1, i32 %37
  %39 = load bfloat, ptr %38, align 2, !invariant.load !2
  br label %49

40:                                               ; preds = %29
  %41 = sub i32 %18, 2048
  %42 = urem i32 %17, 16
  %43 = mul i32 %42, 128
  %44 = add i32 %43, %16
  %45 = mul i32 %41, 2048
  %46 = add i32 %44, %45
  %47 = getelementptr inbounds bfloat, ptr %2, i32 %46
  %48 = load bfloat, ptr %47, align 2, !invariant.load !2
  br label %49

49:                                               ; preds = %31, %40
  %50 = phi bfloat [ %48, %40 ], [ %39, %31 ]
  br label %51

51:                                               ; preds = %49
  br label %52

52:                                               ; preds = %24, %51
  %53 = phi bfloat [ %50, %51 ], [ %28, %24 ]
  br label %54

54:                                               ; preds = %52
  br label %106

55:                                               ; preds = %20
  %56 = icmp ult i32 %18, 5120
  br i1 %56, label %57, label %80

57:                                               ; preds = %55
  %58 = icmp ult i32 %18, 4096
  br i1 %58, label %59, label %68

59:                                               ; preds = %57
  %60 = sub i32 %18, 3072
  %61 = urem i32 %17, 16
  %62 = mul i32 %61, 128
  %63 = add i32 %62, %16
  %64 = mul i32 %60, 2048
  %65 = add i32 %63, %64
  %66 = getelementptr inbounds bfloat, ptr %3, i32 %65
  %67 = load bfloat, ptr %66, align 2, !invariant.load !2
  br label %77

68:                                               ; preds = %57
  %69 = sub i32 %18, 4096
  %70 = urem i32 %17, 16
  %71 = mul i32 %70, 128
  %72 = add i32 %71, %16
  %73 = mul i32 %69, 2048
  %74 = add i32 %72, %73
  %75 = getelementptr inbounds bfloat, ptr %4, i32 %74
  %76 = load bfloat, ptr %75, align 2, !invariant.load !2
  br label %77

77:                                               ; preds = %59, %68
  %78 = phi bfloat [ %76, %68 ], [ %67, %59 ]
  br label %79

79:                                               ; preds = %77
  br label %103

80:                                               ; preds = %55
  %81 = icmp ult i32 %18, 6144
  br i1 %81, label %82, label %91

82:                                               ; preds = %80
  %83 = sub i32 %18, 5120
  %84 = urem i32 %17, 16
  %85 = mul i32 %84, 128
  %86 = add i32 %85, %16
  %87 = mul i32 %83, 2048
  %88 = add i32 %86, %87
  %89 = getelementptr inbounds bfloat, ptr %5, i32 %88
  %90 = load bfloat, ptr %89, align 2, !invariant.load !2
  br label %100

91:                                               ; preds = %80
  %92 = sub i32 %18, 6144
  %93 = urem i32 %17, 16
  %94 = mul i32 %93, 128
  %95 = add i32 %94, %16
  %96 = mul i32 %92, 2048
  %97 = add i32 %95, %96
  %98 = getelementptr inbounds bfloat, ptr %6, i32 %97
  %99 = load bfloat, ptr %98, align 2, !invariant.load !2
  br label %100

100:                                              ; preds = %82, %91
  %101 = phi bfloat [ %99, %91 ], [ %90, %82 ]
  br label %102

102:                                              ; preds = %100
  br label %103

103:                                              ; preds = %79, %102
  %104 = phi bfloat [ %101, %102 ], [ %78, %79 ]
  br label %105

105:                                              ; preds = %103
  br label %106

106:                                              ; preds = %54, %105
  %107 = phi bfloat [ %104, %105 ], [ %53, %54 ]
  br label %108

108:                                              ; preds = %106
  br label %202

109:                                              ; preds = %15
  %110 = icmp ult i32 %18, 10240
  br i1 %110, label %111, label %148

111:                                              ; preds = %109
  %112 = icmp ult i32 %18, 8192
  br i1 %112, label %113, label %122

113:                                              ; preds = %111
  %114 = sub i32 %18, 7168
  %115 = urem i32 %17, 16
  %116 = mul i32 %115, 128
  %117 = add i32 %116, %16
  %118 = mul i32 %114, 2048
  %119 = add i32 %117, %118
  %120 = getelementptr inbounds bfloat, ptr %7, i32 %119
  %121 = load bfloat, ptr %120, align 2, !invariant.load !2
  br label %145

122:                                              ; preds = %111
  %123 = icmp ult i32 %18, 9216
  br i1 %123, label %124, label %133

124:                                              ; preds = %122
  %125 = sub i32 %18, 8192
  %126 = urem i32 %17, 16
  %127 = mul i32 %126, 128
  %128 = add i32 %127, %16
  %129 = mul i32 %125, 2048
  %130 = add i32 %128, %129
  %131 = getelementptr inbounds bfloat, ptr %8, i32 %130
  %132 = load bfloat, ptr %131, align 2, !invariant.load !2
  br label %142

133:                                              ; preds = %122
  %134 = sub i32 %18, 9216
  %135 = urem i32 %17, 16
  %136 = mul i32 %135, 128
  %137 = add i32 %136, %16
  %138 = mul i32 %134, 2048
  %139 = add i32 %137, %138
  %140 = getelementptr inbounds bfloat, ptr %9, i32 %139
  %141 = load bfloat, ptr %140, align 2, !invariant.load !2
  br label %142

142:                                              ; preds = %124, %133
  %143 = phi bfloat [ %141, %133 ], [ %132, %124 ]
  br label %144

144:                                              ; preds = %142
  br label %145

145:                                              ; preds = %113, %144
  %146 = phi bfloat [ %143, %144 ], [ %121, %113 ]
  br label %147

147:                                              ; preds = %145
  br label %199

148:                                              ; preds = %109
  %149 = icmp ult i32 %18, 12288
  br i1 %149, label %150, label %173

150:                                              ; preds = %148
  %151 = icmp ult i32 %18, 11264
  br i1 %151, label %152, label %161

152:                                              ; preds = %150
  %153 = sub i32 %18, 10240
  %154 = urem i32 %17, 16
  %155 = mul i32 %154, 128
  %156 = add i32 %155, %16
  %157 = mul i32 %153, 2048
  %158 = add i32 %156, %157
  %159 = getelementptr inbounds bfloat, ptr %10, i32 %158
  %160 = load bfloat, ptr %159, align 2, !invariant.load !2
  br label %170

161:                                              ; preds = %150
  %162 = sub i32 %18, 11264
  %163 = urem i32 %17, 16
  %164 = mul i32 %163, 128
  %165 = add i32 %164, %16
  %166 = mul i32 %162, 2048
  %167 = add i32 %165, %166
  %168 = getelementptr inbounds bfloat, ptr %11, i32 %167
  %169 = load bfloat, ptr %168, align 2, !invariant.load !2
  br label %170

170:                                              ; preds = %152, %161
  %171 = phi bfloat [ %169, %161 ], [ %160, %152 ]
  br label %172

172:                                              ; preds = %170
  br label %196

173:                                              ; preds = %148
  %174 = icmp ult i32 %18, 13312
  br i1 %174, label %175, label %184

175:                                              ; preds = %173
  %176 = sub i32 %18, 12288
  %177 = urem i32 %17, 16
  %178 = mul i32 %177, 128
  %179 = add i32 %178, %16
  %180 = mul i32 %176, 2048
  %181 = add i32 %179, %180
  %182 = getelementptr inbounds bfloat, ptr %12, i32 %181
  %183 = load bfloat, ptr %182, align 2, !invariant.load !2
  br label %193

184:                                              ; preds = %173
  %185 = sub i32 %18, 13312
  %186 = urem i32 %17, 16
  %187 = mul i32 %186, 128
  %188 = add i32 %187, %16
  %189 = mul i32 %185, 2048
  %190 = add i32 %188, %189
  %191 = getelementptr inbounds bfloat, ptr %13, i32 %190
  %192 = load bfloat, ptr %191, align 2, !invariant.load !2
  br label %193

193:                                              ; preds = %175, %184
  %194 = phi bfloat [ %192, %184 ], [ %183, %175 ]
  br label %195

195:                                              ; preds = %193
  br label %196

196:                                              ; preds = %172, %195
  %197 = phi bfloat [ %194, %195 ], [ %171, %172 ]
  br label %198

198:                                              ; preds = %196
  br label %199

199:                                              ; preds = %147, %198
  %200 = phi bfloat [ %197, %198 ], [ %146, %147 ]
  br label %201

201:                                              ; preds = %199
  br label %202

202:                                              ; preds = %108, %201
  %203 = phi bfloat [ %200, %201 ], [ %107, %108 ]
  br label %204

204:                                              ; preds = %202
  %205 = mul i32 %17, 128
  %206 = add i32 %205, %16
  %207 = getelementptr inbounds bfloat, ptr %14, i32 %206
  store bfloat %203, ptr %207, align 2
  ret void
}

declare ptx_kernel void @gemm_fusion_dot_56_0_impl(ptr, ptr, ptr) #2

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #3

define ptx_kernel void @gemm_fusion_dot_56_0(ptr noalias align 128 dereferenceable(58720256) %arg0, ptr noalias align 128 dereferenceable(458752) %arg1) #0 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr null to ptr addrspace(1)
  %4 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %5 = sdiv i32 %4, 8
  %6 = mul i32 %5, 8
  %7 = sub i32 224, %6
  %8 = icmp slt i32 %7, 8
  %9 = select i1 %8, i32 %7, i32 8
  %10 = srem i32 %4, %9
  %11 = add i32 %6, %10
  %12 = srem i32 %4, 8
  %13 = sdiv i32 %12, %9
  %14 = mul i32 %11, 64
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
  %39 = add i32 %31, 0
  %40 = add i32 %32, 0
  %41 = add i32 %33, 0
  %42 = add i32 %34, 0
  %43 = add i32 %35, 0
  %44 = add i32 %36, 0
  %45 = add i32 %37, 0
  %46 = add i32 %38, 0
  %47 = sext i32 %39 to i64
  %48 = sext i32 %40 to i64
  %49 = sext i32 %41 to i64
  %50 = sext i32 %42 to i64
  %51 = sext i32 %43 to i64
  %52 = sext i32 %44 to i64
  %53 = sext i32 %45 to i64
  %54 = sext i32 %46 to i64
  %55 = add i64 %15, %47
  %56 = add i64 %15, %48
  %57 = add i64 %15, %49
  %58 = add i64 %15, %50
  %59 = add i64 %15, %51
  %60 = add i64 %15, %52
  %61 = add i64 %15, %53
  %62 = add i64 %15, %54
  %63 = mul i64 %55, 2048
  %64 = mul i64 %56, 2048
  %65 = mul i64 %57, 2048
  %66 = mul i64 %58, 2048
  %67 = mul i64 %59, 2048
  %68 = mul i64 %60, 2048
  %69 = mul i64 %61, 2048
  %70 = mul i64 %62, 2048
  %71 = and i32 %17, 1
  %72 = icmp eq i32 %71, 0
  %73 = select i1 %72, i32 0, i32 8
  %74 = xor i32 0, %73
  %75 = and i32 %17, 2
  %76 = icmp eq i32 %75, 0
  %77 = select i1 %76, i32 0, i32 16
  %78 = xor i32 %74, %77
  %79 = and i32 %17, 4
  %80 = icmp eq i32 %79, 0
  %81 = select i1 %80, i32 0, i32 32
  %82 = xor i32 %78, %81
  %83 = and i32 %17, 8
  %84 = icmp eq i32 %83, 0
  %85 = select i1 %84, i32 0, i32 64
  %86 = xor i32 %82, %85
  %87 = xor i32 %86, 0
  %88 = add i32 %87, 0
  %89 = sext i32 %88 to i64
  %90 = add i64 %63, %89
  %91 = add i64 %64, %89
  %92 = add i64 %65, %89
  %93 = add i64 %66, %89
  %94 = add i64 %67, %89
  %95 = add i64 %68, %89
  %96 = add i64 %69, %89
  %97 = add i64 %70, %89
  %98 = getelementptr bfloat, ptr addrspace(1) %1, i64 %90
  %99 = getelementptr bfloat, ptr addrspace(1) %1, i64 %91
  %100 = getelementptr bfloat, ptr addrspace(1) %1, i64 %92
  %101 = getelementptr bfloat, ptr addrspace(1) %1, i64 %93
  %102 = getelementptr bfloat, ptr addrspace(1) %1, i64 %94
  %103 = getelementptr bfloat, ptr addrspace(1) %1, i64 %95
  %104 = getelementptr bfloat, ptr addrspace(1) %1, i64 %96
  %105 = getelementptr bfloat, ptr addrspace(1) %1, i64 %97
  %106 = select i1 %20, i32 0, i32 136
  %107 = xor i32 %86, %106
  %108 = select i1 %24, i32 0, i32 272
  %109 = xor i32 %107, %108
  %110 = select i1 %28, i32 0, i32 544
  %111 = xor i32 %109, %110
  %112 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %111
  %113 = xor i32 1024, %73
  %114 = xor i32 %113, %77
  %115 = xor i32 %114, %81
  %116 = xor i32 %115, %85
  %117 = xor i32 %116, %106
  %118 = xor i32 %117, %108
  %119 = xor i32 %118, %110
  %120 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %119
  %121 = xor i32 2048, %73
  %122 = xor i32 %121, %77
  %123 = xor i32 %122, %81
  %124 = xor i32 %123, %85
  %125 = xor i32 %124, %106
  %126 = xor i32 %125, %108
  %127 = xor i32 %126, %110
  %128 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %127
  %129 = xor i32 3072, %73
  %130 = xor i32 %129, %77
  %131 = xor i32 %130, %81
  %132 = xor i32 %131, %85
  %133 = xor i32 %132, %106
  %134 = xor i32 %133, %108
  %135 = xor i32 %134, %110
  %136 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %135
  %137 = xor i32 4096, %73
  %138 = xor i32 %137, %77
  %139 = xor i32 %138, %81
  %140 = xor i32 %139, %85
  %141 = xor i32 %140, %106
  %142 = xor i32 %141, %108
  %143 = xor i32 %142, %110
  %144 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %143
  %145 = xor i32 5120, %73
  %146 = xor i32 %145, %77
  %147 = xor i32 %146, %81
  %148 = xor i32 %147, %85
  %149 = xor i32 %148, %106
  %150 = xor i32 %149, %108
  %151 = xor i32 %150, %110
  %152 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %151
  %153 = xor i32 6144, %73
  %154 = xor i32 %153, %77
  %155 = xor i32 %154, %81
  %156 = xor i32 %155, %85
  %157 = xor i32 %156, %106
  %158 = xor i32 %157, %108
  %159 = xor i32 %158, %110
  %160 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %159
  %161 = xor i32 7168, %73
  %162 = xor i32 %161, %77
  %163 = xor i32 %162, %81
  %164 = xor i32 %163, %85
  %165 = xor i32 %164, %106
  %166 = xor i32 %165, %108
  %167 = xor i32 %166, %110
  %168 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %167
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %112, ptr addrspace(1) %98, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %120, ptr addrspace(1) %99, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %128, ptr addrspace(1) %100, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %136, ptr addrspace(1) %101, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %144, ptr addrspace(1) %102, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %152, ptr addrspace(1) %103, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %160, ptr addrspace(1) %104, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %168, ptr addrspace(1) %105, i32 16)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  %169 = add i64 %89, 128
  %170 = add i64 %63, %169
  %171 = add i64 %64, %169
  %172 = add i64 %65, %169
  %173 = add i64 %66, %169
  %174 = add i64 %67, %169
  %175 = add i64 %68, %169
  %176 = add i64 %69, %169
  %177 = add i64 %70, %169
  %178 = getelementptr bfloat, ptr addrspace(1) %1, i64 %170
  %179 = getelementptr bfloat, ptr addrspace(1) %1, i64 %171
  %180 = getelementptr bfloat, ptr addrspace(1) %1, i64 %172
  %181 = getelementptr bfloat, ptr addrspace(1) %1, i64 %173
  %182 = getelementptr bfloat, ptr addrspace(1) %1, i64 %174
  %183 = getelementptr bfloat, ptr addrspace(1) %1, i64 %175
  %184 = getelementptr bfloat, ptr addrspace(1) %1, i64 %176
  %185 = getelementptr bfloat, ptr addrspace(1) %1, i64 %177
  call void @llvm.nvvm.barrier0()
  %186 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i32 %111
  %187 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i32 %119
  %188 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i32 %127
  %189 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i32 %135
  %190 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i32 %143
  %191 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i32 %151
  %192 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i32 %159
  %193 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i32 %167
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %186, ptr addrspace(1) %178, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %187, ptr addrspace(1) %179, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %188, ptr addrspace(1) %180, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %189, ptr addrspace(1) %181, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %190, ptr addrspace(1) %182, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %191, ptr addrspace(1) %183, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %192, ptr addrspace(1) %184, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %193, ptr addrspace(1) %185, i32 16)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  %194 = add i64 %89, 256
  %195 = add i64 %63, %194
  %196 = add i64 %64, %194
  %197 = add i64 %65, %194
  %198 = add i64 %66, %194
  %199 = add i64 %67, %194
  %200 = add i64 %68, %194
  %201 = add i64 %69, %194
  %202 = add i64 %70, %194
  %203 = getelementptr bfloat, ptr addrspace(1) %1, i64 %195
  %204 = getelementptr bfloat, ptr addrspace(1) %1, i64 %196
  %205 = getelementptr bfloat, ptr addrspace(1) %1, i64 %197
  %206 = getelementptr bfloat, ptr addrspace(1) %1, i64 %198
  %207 = getelementptr bfloat, ptr addrspace(1) %1, i64 %199
  %208 = getelementptr bfloat, ptr addrspace(1) %1, i64 %200
  %209 = getelementptr bfloat, ptr addrspace(1) %1, i64 %201
  %210 = getelementptr bfloat, ptr addrspace(1) %1, i64 %202
  call void @llvm.nvvm.barrier0()
  %211 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %111
  %212 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %119
  %213 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %127
  %214 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %135
  %215 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %143
  %216 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %151
  %217 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %159
  %218 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %167
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %211, ptr addrspace(1) %203, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %212, ptr addrspace(1) %204, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %213, ptr addrspace(1) %205, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %214, ptr addrspace(1) %206, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %215, ptr addrspace(1) %207, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %216, ptr addrspace(1) %208, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %217, ptr addrspace(1) %209, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %218, ptr addrspace(1) %210, i32 16)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  call void asm sideeffect "cp.async.wait_group 0x2;", ""()
  call void @llvm.nvvm.barrier0()
  br label %219

219:                                              ; preds = %227, %0
  %220 = phi i32 [ %683, %227 ], [ 0, %0 ]
  %221 = phi i64 [ %637, %227 ], [ 256, %0 ]
  %222 = phi { float, float, float, float, float, float, float, float } [ %636, %227 ], [ zeroinitializer, %0 ]
  %223 = phi i32 [ %640, %227 ], [ 2, %0 ]
  %224 = phi i32 [ %674, %227 ], [ 0, %0 ]
  %225 = phi { ptr addrspace(3), i32, i32 } [ %682, %227 ], [ { ptr addrspace(3) @global_smem, i32 0, i32 0 }, %0 ]
  %226 = icmp slt i32 %220, 2048
  br i1 %226, label %227, label %684

227:                                              ; preds = %219
  %228 = icmp slt i32 %220, 1664
  %229 = extractvalue { ptr addrspace(3), i32, i32 } %225, 0
  %230 = select i1 %72, i32 0, i32 136
  %231 = xor i32 0, %230
  %232 = select i1 %76, i32 0, i32 272
  %233 = xor i32 %231, %232
  %234 = select i1 %80, i32 0, i32 544
  %235 = xor i32 %233, %234
  %236 = select i1 %84, i32 0, i32 1024
  %237 = xor i32 %235, %236
  %238 = select i1 %20, i32 0, i32 8
  %239 = xor i32 %237, %238
  %240 = select i1 %24, i32 0, i32 2048
  %241 = xor i32 %239, %240
  %242 = select i1 %28, i32 0, i32 4096
  %243 = xor i32 %241, %242
  %244 = getelementptr inbounds bfloat, ptr addrspace(3) %229, i32 %243
  %245 = ptrtoint ptr addrspace(3) %244 to i32
  %246 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %245)
  %247 = extractvalue { i32, i32, i32, i32 } %246, 0
  %248 = extractvalue { i32, i32, i32, i32 } %246, 1
  %249 = extractvalue { i32, i32, i32, i32 } %246, 2
  %250 = extractvalue { i32, i32, i32, i32 } %246, 3
  %251 = xor i32 16, %230
  %252 = xor i32 %251, %232
  %253 = xor i32 %252, %234
  %254 = xor i32 %253, %236
  %255 = xor i32 %254, %238
  %256 = xor i32 %255, %240
  %257 = xor i32 %256, %242
  %258 = getelementptr inbounds bfloat, ptr addrspace(3) %229, i32 %257
  %259 = ptrtoint ptr addrspace(3) %258 to i32
  %260 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %259)
  %261 = extractvalue { i32, i32, i32, i32 } %260, 0
  %262 = extractvalue { i32, i32, i32, i32 } %260, 1
  %263 = extractvalue { i32, i32, i32, i32 } %260, 2
  %264 = extractvalue { i32, i32, i32, i32 } %260, 3
  %265 = xor i32 32, %230
  %266 = xor i32 %265, %232
  %267 = xor i32 %266, %234
  %268 = xor i32 %267, %236
  %269 = xor i32 %268, %238
  %270 = xor i32 %269, %240
  %271 = xor i32 %270, %242
  %272 = getelementptr inbounds bfloat, ptr addrspace(3) %229, i32 %271
  %273 = ptrtoint ptr addrspace(3) %272 to i32
  %274 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %273)
  %275 = extractvalue { i32, i32, i32, i32 } %274, 0
  %276 = extractvalue { i32, i32, i32, i32 } %274, 1
  %277 = extractvalue { i32, i32, i32, i32 } %274, 2
  %278 = extractvalue { i32, i32, i32, i32 } %274, 3
  %279 = xor i32 48, %230
  %280 = xor i32 %279, %232
  %281 = xor i32 %280, %234
  %282 = xor i32 %281, %236
  %283 = xor i32 %282, %238
  %284 = xor i32 %283, %240
  %285 = xor i32 %284, %242
  %286 = getelementptr inbounds bfloat, ptr addrspace(3) %229, i32 %285
  %287 = ptrtoint ptr addrspace(3) %286 to i32
  %288 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %287)
  %289 = extractvalue { i32, i32, i32, i32 } %288, 0
  %290 = extractvalue { i32, i32, i32, i32 } %288, 1
  %291 = extractvalue { i32, i32, i32, i32 } %288, 2
  %292 = extractvalue { i32, i32, i32, i32 } %288, 3
  %293 = xor i32 64, %230
  %294 = xor i32 %293, %232
  %295 = xor i32 %294, %234
  %296 = xor i32 %295, %236
  %297 = xor i32 %296, %238
  %298 = xor i32 %297, %240
  %299 = xor i32 %298, %242
  %300 = getelementptr inbounds bfloat, ptr addrspace(3) %229, i32 %299
  %301 = ptrtoint ptr addrspace(3) %300 to i32
  %302 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %301)
  %303 = extractvalue { i32, i32, i32, i32 } %302, 0
  %304 = extractvalue { i32, i32, i32, i32 } %302, 1
  %305 = extractvalue { i32, i32, i32, i32 } %302, 2
  %306 = extractvalue { i32, i32, i32, i32 } %302, 3
  %307 = xor i32 80, %230
  %308 = xor i32 %307, %232
  %309 = xor i32 %308, %234
  %310 = xor i32 %309, %236
  %311 = xor i32 %310, %238
  %312 = xor i32 %311, %240
  %313 = xor i32 %312, %242
  %314 = getelementptr inbounds bfloat, ptr addrspace(3) %229, i32 %313
  %315 = ptrtoint ptr addrspace(3) %314 to i32
  %316 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %315)
  %317 = extractvalue { i32, i32, i32, i32 } %316, 0
  %318 = extractvalue { i32, i32, i32, i32 } %316, 1
  %319 = extractvalue { i32, i32, i32, i32 } %316, 2
  %320 = extractvalue { i32, i32, i32, i32 } %316, 3
  %321 = xor i32 96, %230
  %322 = xor i32 %321, %232
  %323 = xor i32 %322, %234
  %324 = xor i32 %323, %236
  %325 = xor i32 %324, %238
  %326 = xor i32 %325, %240
  %327 = xor i32 %326, %242
  %328 = getelementptr inbounds bfloat, ptr addrspace(3) %229, i32 %327
  %329 = ptrtoint ptr addrspace(3) %328 to i32
  %330 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %329)
  %331 = extractvalue { i32, i32, i32, i32 } %330, 0
  %332 = extractvalue { i32, i32, i32, i32 } %330, 1
  %333 = extractvalue { i32, i32, i32, i32 } %330, 2
  %334 = extractvalue { i32, i32, i32, i32 } %330, 3
  %335 = xor i32 112, %230
  %336 = xor i32 %335, %232
  %337 = xor i32 %336, %234
  %338 = xor i32 %337, %236
  %339 = xor i32 %338, %238
  %340 = xor i32 %339, %240
  %341 = xor i32 %340, %242
  %342 = getelementptr inbounds bfloat, ptr addrspace(3) %229, i32 %341
  %343 = ptrtoint ptr addrspace(3) %342 to i32
  %344 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %343)
  %345 = extractvalue { i32, i32, i32, i32 } %344, 0
  %346 = extractvalue { i32, i32, i32, i32 } %344, 1
  %347 = extractvalue { i32, i32, i32, i32 } %344, 2
  %348 = extractvalue { i32, i32, i32, i32 } %344, 3
  %349 = bitcast i32 %247 to <2 x bfloat>
  %350 = extractelement <2 x bfloat> %349, i32 0
  %351 = extractelement <2 x bfloat> %349, i32 1
  %352 = bitcast i32 %248 to <2 x bfloat>
  %353 = extractelement <2 x bfloat> %352, i32 0
  %354 = extractelement <2 x bfloat> %352, i32 1
  %355 = bitcast i32 %249 to <2 x bfloat>
  %356 = extractelement <2 x bfloat> %355, i32 0
  %357 = extractelement <2 x bfloat> %355, i32 1
  %358 = bitcast i32 %250 to <2 x bfloat>
  %359 = extractelement <2 x bfloat> %358, i32 0
  %360 = extractelement <2 x bfloat> %358, i32 1
  %361 = bitcast i32 %261 to <2 x bfloat>
  %362 = extractelement <2 x bfloat> %361, i32 0
  %363 = extractelement <2 x bfloat> %361, i32 1
  %364 = bitcast i32 %262 to <2 x bfloat>
  %365 = extractelement <2 x bfloat> %364, i32 0
  %366 = extractelement <2 x bfloat> %364, i32 1
  %367 = bitcast i32 %263 to <2 x bfloat>
  %368 = extractelement <2 x bfloat> %367, i32 0
  %369 = extractelement <2 x bfloat> %367, i32 1
  %370 = bitcast i32 %264 to <2 x bfloat>
  %371 = extractelement <2 x bfloat> %370, i32 0
  %372 = extractelement <2 x bfloat> %370, i32 1
  %373 = bitcast i32 %275 to <2 x bfloat>
  %374 = extractelement <2 x bfloat> %373, i32 0
  %375 = extractelement <2 x bfloat> %373, i32 1
  %376 = bitcast i32 %276 to <2 x bfloat>
  %377 = extractelement <2 x bfloat> %376, i32 0
  %378 = extractelement <2 x bfloat> %376, i32 1
  %379 = bitcast i32 %277 to <2 x bfloat>
  %380 = extractelement <2 x bfloat> %379, i32 0
  %381 = extractelement <2 x bfloat> %379, i32 1
  %382 = bitcast i32 %278 to <2 x bfloat>
  %383 = extractelement <2 x bfloat> %382, i32 0
  %384 = extractelement <2 x bfloat> %382, i32 1
  %385 = bitcast i32 %289 to <2 x bfloat>
  %386 = extractelement <2 x bfloat> %385, i32 0
  %387 = extractelement <2 x bfloat> %385, i32 1
  %388 = bitcast i32 %290 to <2 x bfloat>
  %389 = extractelement <2 x bfloat> %388, i32 0
  %390 = extractelement <2 x bfloat> %388, i32 1
  %391 = bitcast i32 %291 to <2 x bfloat>
  %392 = extractelement <2 x bfloat> %391, i32 0
  %393 = extractelement <2 x bfloat> %391, i32 1
  %394 = bitcast i32 %292 to <2 x bfloat>
  %395 = extractelement <2 x bfloat> %394, i32 0
  %396 = extractelement <2 x bfloat> %394, i32 1
  %397 = bitcast i32 %303 to <2 x bfloat>
  %398 = extractelement <2 x bfloat> %397, i32 0
  %399 = extractelement <2 x bfloat> %397, i32 1
  %400 = bitcast i32 %304 to <2 x bfloat>
  %401 = extractelement <2 x bfloat> %400, i32 0
  %402 = extractelement <2 x bfloat> %400, i32 1
  %403 = bitcast i32 %305 to <2 x bfloat>
  %404 = extractelement <2 x bfloat> %403, i32 0
  %405 = extractelement <2 x bfloat> %403, i32 1
  %406 = bitcast i32 %306 to <2 x bfloat>
  %407 = extractelement <2 x bfloat> %406, i32 0
  %408 = extractelement <2 x bfloat> %406, i32 1
  %409 = bitcast i32 %317 to <2 x bfloat>
  %410 = extractelement <2 x bfloat> %409, i32 0
  %411 = extractelement <2 x bfloat> %409, i32 1
  %412 = bitcast i32 %318 to <2 x bfloat>
  %413 = extractelement <2 x bfloat> %412, i32 0
  %414 = extractelement <2 x bfloat> %412, i32 1
  %415 = bitcast i32 %319 to <2 x bfloat>
  %416 = extractelement <2 x bfloat> %415, i32 0
  %417 = extractelement <2 x bfloat> %415, i32 1
  %418 = bitcast i32 %320 to <2 x bfloat>
  %419 = extractelement <2 x bfloat> %418, i32 0
  %420 = extractelement <2 x bfloat> %418, i32 1
  %421 = bitcast i32 %331 to <2 x bfloat>
  %422 = extractelement <2 x bfloat> %421, i32 0
  %423 = extractelement <2 x bfloat> %421, i32 1
  %424 = bitcast i32 %332 to <2 x bfloat>
  %425 = extractelement <2 x bfloat> %424, i32 0
  %426 = extractelement <2 x bfloat> %424, i32 1
  %427 = bitcast i32 %333 to <2 x bfloat>
  %428 = extractelement <2 x bfloat> %427, i32 0
  %429 = extractelement <2 x bfloat> %427, i32 1
  %430 = bitcast i32 %334 to <2 x bfloat>
  %431 = extractelement <2 x bfloat> %430, i32 0
  %432 = extractelement <2 x bfloat> %430, i32 1
  %433 = bitcast i32 %345 to <2 x bfloat>
  %434 = extractelement <2 x bfloat> %433, i32 0
  %435 = extractelement <2 x bfloat> %433, i32 1
  %436 = bitcast i32 %346 to <2 x bfloat>
  %437 = extractelement <2 x bfloat> %436, i32 0
  %438 = extractelement <2 x bfloat> %436, i32 1
  %439 = bitcast i32 %347 to <2 x bfloat>
  %440 = extractelement <2 x bfloat> %439, i32 0
  %441 = extractelement <2 x bfloat> %439, i32 1
  %442 = bitcast i32 %348 to <2 x bfloat>
  %443 = extractelement <2 x bfloat> %442, i32 0
  %444 = extractelement <2 x bfloat> %442, i32 1
  %445 = insertelement <2 x bfloat> undef, bfloat %350, i32 0
  %446 = insertelement <2 x bfloat> %445, bfloat %351, i32 1
  %447 = bitcast <2 x bfloat> %446 to i32
  %448 = insertelement <2 x bfloat> undef, bfloat %353, i32 0
  %449 = insertelement <2 x bfloat> %448, bfloat %354, i32 1
  %450 = bitcast <2 x bfloat> %449 to i32
  %451 = insertelement <2 x bfloat> undef, bfloat %356, i32 0
  %452 = insertelement <2 x bfloat> %451, bfloat %357, i32 1
  %453 = bitcast <2 x bfloat> %452 to i32
  %454 = insertelement <2 x bfloat> undef, bfloat %359, i32 0
  %455 = insertelement <2 x bfloat> %454, bfloat %360, i32 1
  %456 = bitcast <2 x bfloat> %455 to i32
  %457 = insertelement <2 x bfloat> undef, bfloat %362, i32 0
  %458 = insertelement <2 x bfloat> %457, bfloat %363, i32 1
  %459 = bitcast <2 x bfloat> %458 to i32
  %460 = insertelement <2 x bfloat> undef, bfloat %365, i32 0
  %461 = insertelement <2 x bfloat> %460, bfloat %366, i32 1
  %462 = bitcast <2 x bfloat> %461 to i32
  %463 = insertelement <2 x bfloat> undef, bfloat %368, i32 0
  %464 = insertelement <2 x bfloat> %463, bfloat %369, i32 1
  %465 = bitcast <2 x bfloat> %464 to i32
  %466 = insertelement <2 x bfloat> undef, bfloat %371, i32 0
  %467 = insertelement <2 x bfloat> %466, bfloat %372, i32 1
  %468 = bitcast <2 x bfloat> %467 to i32
  %469 = insertelement <2 x bfloat> undef, bfloat %374, i32 0
  %470 = insertelement <2 x bfloat> %469, bfloat %375, i32 1
  %471 = bitcast <2 x bfloat> %470 to i32
  %472 = insertelement <2 x bfloat> undef, bfloat %377, i32 0
  %473 = insertelement <2 x bfloat> %472, bfloat %378, i32 1
  %474 = bitcast <2 x bfloat> %473 to i32
  %475 = insertelement <2 x bfloat> undef, bfloat %380, i32 0
  %476 = insertelement <2 x bfloat> %475, bfloat %381, i32 1
  %477 = bitcast <2 x bfloat> %476 to i32
  %478 = insertelement <2 x bfloat> undef, bfloat %383, i32 0
  %479 = insertelement <2 x bfloat> %478, bfloat %384, i32 1
  %480 = bitcast <2 x bfloat> %479 to i32
  %481 = insertelement <2 x bfloat> undef, bfloat %386, i32 0
  %482 = insertelement <2 x bfloat> %481, bfloat %387, i32 1
  %483 = bitcast <2 x bfloat> %482 to i32
  %484 = insertelement <2 x bfloat> undef, bfloat %389, i32 0
  %485 = insertelement <2 x bfloat> %484, bfloat %390, i32 1
  %486 = bitcast <2 x bfloat> %485 to i32
  %487 = insertelement <2 x bfloat> undef, bfloat %392, i32 0
  %488 = insertelement <2 x bfloat> %487, bfloat %393, i32 1
  %489 = bitcast <2 x bfloat> %488 to i32
  %490 = insertelement <2 x bfloat> undef, bfloat %395, i32 0
  %491 = insertelement <2 x bfloat> %490, bfloat %396, i32 1
  %492 = bitcast <2 x bfloat> %491 to i32
  %493 = insertelement <2 x bfloat> undef, bfloat %398, i32 0
  %494 = insertelement <2 x bfloat> %493, bfloat %399, i32 1
  %495 = bitcast <2 x bfloat> %494 to i32
  %496 = insertelement <2 x bfloat> undef, bfloat %401, i32 0
  %497 = insertelement <2 x bfloat> %496, bfloat %402, i32 1
  %498 = bitcast <2 x bfloat> %497 to i32
  %499 = insertelement <2 x bfloat> undef, bfloat %404, i32 0
  %500 = insertelement <2 x bfloat> %499, bfloat %405, i32 1
  %501 = bitcast <2 x bfloat> %500 to i32
  %502 = insertelement <2 x bfloat> undef, bfloat %407, i32 0
  %503 = insertelement <2 x bfloat> %502, bfloat %408, i32 1
  %504 = bitcast <2 x bfloat> %503 to i32
  %505 = insertelement <2 x bfloat> undef, bfloat %410, i32 0
  %506 = insertelement <2 x bfloat> %505, bfloat %411, i32 1
  %507 = bitcast <2 x bfloat> %506 to i32
  %508 = insertelement <2 x bfloat> undef, bfloat %413, i32 0
  %509 = insertelement <2 x bfloat> %508, bfloat %414, i32 1
  %510 = bitcast <2 x bfloat> %509 to i32
  %511 = insertelement <2 x bfloat> undef, bfloat %416, i32 0
  %512 = insertelement <2 x bfloat> %511, bfloat %417, i32 1
  %513 = bitcast <2 x bfloat> %512 to i32
  %514 = insertelement <2 x bfloat> undef, bfloat %419, i32 0
  %515 = insertelement <2 x bfloat> %514, bfloat %420, i32 1
  %516 = bitcast <2 x bfloat> %515 to i32
  %517 = insertelement <2 x bfloat> undef, bfloat %422, i32 0
  %518 = insertelement <2 x bfloat> %517, bfloat %423, i32 1
  %519 = bitcast <2 x bfloat> %518 to i32
  %520 = insertelement <2 x bfloat> undef, bfloat %425, i32 0
  %521 = insertelement <2 x bfloat> %520, bfloat %426, i32 1
  %522 = bitcast <2 x bfloat> %521 to i32
  %523 = insertelement <2 x bfloat> undef, bfloat %428, i32 0
  %524 = insertelement <2 x bfloat> %523, bfloat %429, i32 1
  %525 = bitcast <2 x bfloat> %524 to i32
  %526 = insertelement <2 x bfloat> undef, bfloat %431, i32 0
  %527 = insertelement <2 x bfloat> %526, bfloat %432, i32 1
  %528 = bitcast <2 x bfloat> %527 to i32
  %529 = insertelement <2 x bfloat> undef, bfloat %434, i32 0
  %530 = insertelement <2 x bfloat> %529, bfloat %435, i32 1
  %531 = bitcast <2 x bfloat> %530 to i32
  %532 = insertelement <2 x bfloat> undef, bfloat %437, i32 0
  %533 = insertelement <2 x bfloat> %532, bfloat %438, i32 1
  %534 = bitcast <2 x bfloat> %533 to i32
  %535 = insertelement <2 x bfloat> undef, bfloat %440, i32 0
  %536 = insertelement <2 x bfloat> %535, bfloat %441, i32 1
  %537 = bitcast <2 x bfloat> %536 to i32
  %538 = insertelement <2 x bfloat> undef, bfloat %443, i32 0
  %539 = insertelement <2 x bfloat> %538, bfloat %444, i32 1
  %540 = bitcast <2 x bfloat> %539 to i32
  %541 = extractvalue { float, float, float, float, float, float, float, float } %222, 0
  %542 = extractvalue { float, float, float, float, float, float, float, float } %222, 1
  %543 = extractvalue { float, float, float, float, float, float, float, float } %222, 2
  %544 = extractvalue { float, float, float, float, float, float, float, float } %222, 3
  %545 = extractvalue { float, float, float, float, float, float, float, float } %222, 4
  %546 = extractvalue { float, float, float, float, float, float, float, float } %222, 5
  %547 = extractvalue { float, float, float, float, float, float, float, float } %222, 6
  %548 = extractvalue { float, float, float, float, float, float, float, float } %222, 7
  %549 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %541, float %542, float %543, float %544, i32 %447, i32 %450, i32 %453, i32 %456, i32 0, i32 0)
  %550 = extractvalue { float, float, float, float } %549, 0
  %551 = extractvalue { float, float, float, float } %549, 1
  %552 = extractvalue { float, float, float, float } %549, 2
  %553 = extractvalue { float, float, float, float } %549, 3
  %554 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %545, float %546, float %547, float %548, i32 %447, i32 %450, i32 %453, i32 %456, i32 0, i32 0)
  %555 = extractvalue { float, float, float, float } %554, 0
  %556 = extractvalue { float, float, float, float } %554, 1
  %557 = extractvalue { float, float, float, float } %554, 2
  %558 = extractvalue { float, float, float, float } %554, 3
  %559 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %550, float %551, float %552, float %553, i32 %459, i32 %462, i32 %465, i32 %468, i32 0, i32 0)
  %560 = extractvalue { float, float, float, float } %559, 0
  %561 = extractvalue { float, float, float, float } %559, 1
  %562 = extractvalue { float, float, float, float } %559, 2
  %563 = extractvalue { float, float, float, float } %559, 3
  %564 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %555, float %556, float %557, float %558, i32 %459, i32 %462, i32 %465, i32 %468, i32 0, i32 0)
  %565 = extractvalue { float, float, float, float } %564, 0
  %566 = extractvalue { float, float, float, float } %564, 1
  %567 = extractvalue { float, float, float, float } %564, 2
  %568 = extractvalue { float, float, float, float } %564, 3
  %569 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %560, float %561, float %562, float %563, i32 %471, i32 %474, i32 %477, i32 %480, i32 0, i32 0)
  %570 = extractvalue { float, float, float, float } %569, 0
  %571 = extractvalue { float, float, float, float } %569, 1
  %572 = extractvalue { float, float, float, float } %569, 2
  %573 = extractvalue { float, float, float, float } %569, 3
  %574 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %565, float %566, float %567, float %568, i32 %471, i32 %474, i32 %477, i32 %480, i32 0, i32 0)
  %575 = extractvalue { float, float, float, float } %574, 0
  %576 = extractvalue { float, float, float, float } %574, 1
  %577 = extractvalue { float, float, float, float } %574, 2
  %578 = extractvalue { float, float, float, float } %574, 3
  %579 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %570, float %571, float %572, float %573, i32 %483, i32 %486, i32 %489, i32 %492, i32 0, i32 0)
  %580 = extractvalue { float, float, float, float } %579, 0
  %581 = extractvalue { float, float, float, float } %579, 1
  %582 = extractvalue { float, float, float, float } %579, 2
  %583 = extractvalue { float, float, float, float } %579, 3
  %584 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %575, float %576, float %577, float %578, i32 %483, i32 %486, i32 %489, i32 %492, i32 0, i32 0)
  %585 = extractvalue { float, float, float, float } %584, 0
  %586 = extractvalue { float, float, float, float } %584, 1
  %587 = extractvalue { float, float, float, float } %584, 2
  %588 = extractvalue { float, float, float, float } %584, 3
  %589 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %580, float %581, float %582, float %583, i32 %495, i32 %498, i32 %501, i32 %504, i32 0, i32 0)
  %590 = extractvalue { float, float, float, float } %589, 0
  %591 = extractvalue { float, float, float, float } %589, 1
  %592 = extractvalue { float, float, float, float } %589, 2
  %593 = extractvalue { float, float, float, float } %589, 3
  %594 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %585, float %586, float %587, float %588, i32 %495, i32 %498, i32 %501, i32 %504, i32 0, i32 0)
  %595 = extractvalue { float, float, float, float } %594, 0
  %596 = extractvalue { float, float, float, float } %594, 1
  %597 = extractvalue { float, float, float, float } %594, 2
  %598 = extractvalue { float, float, float, float } %594, 3
  %599 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %590, float %591, float %592, float %593, i32 %507, i32 %510, i32 %513, i32 %516, i32 0, i32 0)
  %600 = extractvalue { float, float, float, float } %599, 0
  %601 = extractvalue { float, float, float, float } %599, 1
  %602 = extractvalue { float, float, float, float } %599, 2
  %603 = extractvalue { float, float, float, float } %599, 3
  %604 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %595, float %596, float %597, float %598, i32 %507, i32 %510, i32 %513, i32 %516, i32 0, i32 0)
  %605 = extractvalue { float, float, float, float } %604, 0
  %606 = extractvalue { float, float, float, float } %604, 1
  %607 = extractvalue { float, float, float, float } %604, 2
  %608 = extractvalue { float, float, float, float } %604, 3
  %609 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %600, float %601, float %602, float %603, i32 %519, i32 %522, i32 %525, i32 %528, i32 0, i32 0)
  %610 = extractvalue { float, float, float, float } %609, 0
  %611 = extractvalue { float, float, float, float } %609, 1
  %612 = extractvalue { float, float, float, float } %609, 2
  %613 = extractvalue { float, float, float, float } %609, 3
  %614 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %605, float %606, float %607, float %608, i32 %519, i32 %522, i32 %525, i32 %528, i32 0, i32 0)
  %615 = extractvalue { float, float, float, float } %614, 0
  %616 = extractvalue { float, float, float, float } %614, 1
  %617 = extractvalue { float, float, float, float } %614, 2
  %618 = extractvalue { float, float, float, float } %614, 3
  %619 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %610, float %611, float %612, float %613, i32 %531, i32 %534, i32 %537, i32 %540, i32 0, i32 0)
  %620 = extractvalue { float, float, float, float } %619, 0
  %621 = extractvalue { float, float, float, float } %619, 1
  %622 = extractvalue { float, float, float, float } %619, 2
  %623 = extractvalue { float, float, float, float } %619, 3
  %624 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %615, float %616, float %617, float %618, i32 %531, i32 %534, i32 %537, i32 %540, i32 0, i32 0)
  %625 = extractvalue { float, float, float, float } %624, 0
  %626 = extractvalue { float, float, float, float } %624, 1
  %627 = extractvalue { float, float, float, float } %624, 2
  %628 = extractvalue { float, float, float, float } %624, 3
  %629 = insertvalue { float, float, float, float, float, float, float, float } undef, float %620, 0
  %630 = insertvalue { float, float, float, float, float, float, float, float } %629, float %621, 1
  %631 = insertvalue { float, float, float, float, float, float, float, float } %630, float %622, 2
  %632 = insertvalue { float, float, float, float, float, float, float, float } %631, float %623, 3
  %633 = insertvalue { float, float, float, float, float, float, float, float } %632, float %625, 4
  %634 = insertvalue { float, float, float, float, float, float, float, float } %633, float %626, 5
  %635 = insertvalue { float, float, float, float, float, float, float, float } %634, float %627, 6
  %636 = insertvalue { float, float, float, float, float, float, float, float } %635, float %628, 7
  %637 = add i64 %221, 128
  %638 = add i32 %223, 1
  %639 = icmp slt i32 %638, 3
  %640 = select i1 %639, i32 %638, i32 0
  %641 = add i64 %637, %89
  %642 = add i64 %63, %641
  %643 = add i64 %64, %641
  %644 = add i64 %65, %641
  %645 = add i64 %66, %641
  %646 = add i64 %67, %641
  %647 = add i64 %68, %641
  %648 = add i64 %69, %641
  %649 = add i64 %70, %641
  %650 = getelementptr bfloat, ptr addrspace(1) %1, i64 %642
  %651 = getelementptr bfloat, ptr addrspace(1) %1, i64 %643
  %652 = getelementptr bfloat, ptr addrspace(1) %1, i64 %644
  %653 = getelementptr bfloat, ptr addrspace(1) %1, i64 %645
  %654 = getelementptr bfloat, ptr addrspace(1) %1, i64 %646
  %655 = getelementptr bfloat, ptr addrspace(1) %1, i64 %647
  %656 = getelementptr bfloat, ptr addrspace(1) %1, i64 %648
  %657 = getelementptr bfloat, ptr addrspace(1) %1, i64 %649
  %658 = mul i32 %640, 8192
  %659 = add i32 %658, 0
  %660 = add i32 %659, 0
  %661 = add i32 %660, 0
  %662 = getelementptr bfloat, ptr addrspace(3) @global_smem, i32 %661
  call void @llvm.nvvm.barrier0()
  %663 = getelementptr inbounds bfloat, ptr addrspace(3) %662, i32 %111
  %664 = getelementptr inbounds bfloat, ptr addrspace(3) %662, i32 %119
  %665 = getelementptr inbounds bfloat, ptr addrspace(3) %662, i32 %127
  %666 = getelementptr inbounds bfloat, ptr addrspace(3) %662, i32 %135
  %667 = getelementptr inbounds bfloat, ptr addrspace(3) %662, i32 %143
  %668 = getelementptr inbounds bfloat, ptr addrspace(3) %662, i32 %151
  %669 = getelementptr inbounds bfloat, ptr addrspace(3) %662, i32 %159
  %670 = getelementptr inbounds bfloat, ptr addrspace(3) %662, i32 %167
  %671 = select i1 %228, i32 16, i32 0
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %663, ptr addrspace(1) %650, i32 %671)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %664, ptr addrspace(1) %651, i32 %671)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %665, ptr addrspace(1) %652, i32 %671)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %666, ptr addrspace(1) %653, i32 %671)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %667, ptr addrspace(1) %654, i32 %671)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %668, ptr addrspace(1) %655, i32 %671)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %669, ptr addrspace(1) %656, i32 %671)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %670, ptr addrspace(1) %657, i32 %671)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  %672 = add i32 %224, 1
  %673 = icmp slt i32 %672, 3
  %674 = select i1 %673, i32 %672, i32 0
  call void asm sideeffect "cp.async.wait_group 0x2;", ""()
  call void @llvm.nvvm.barrier0()
  %675 = mul i32 %674, 8192
  %676 = add i32 %675, 0
  %677 = add i32 %676, 0
  %678 = add i32 %677, 0
  %679 = getelementptr bfloat, ptr addrspace(3) @global_smem, i32 %678
  %680 = insertvalue { ptr addrspace(3), i32, i32 } undef, ptr addrspace(3) %679, 0
  %681 = insertvalue { ptr addrspace(3), i32, i32 } %680, i32 0, 1
  %682 = insertvalue { ptr addrspace(3), i32, i32 } %681, i32 0, 2
  %683 = add i32 %220, 128
  br label %219

684:                                              ; preds = %219
  call void asm sideeffect "cp.async.wait_group 0x0;", ""()
  call void @llvm.nvvm.barrier0()
  %685 = extractvalue { float, float, float, float, float, float, float, float } %222, 0
  %686 = extractvalue { float, float, float, float, float, float, float, float } %222, 1
  %687 = extractvalue { float, float, float, float, float, float, float, float } %222, 2
  %688 = extractvalue { float, float, float, float, float, float, float, float } %222, 3
  %689 = extractvalue { float, float, float, float, float, float, float, float } %222, 4
  %690 = extractvalue { float, float, float, float, float, float, float, float } %222, 5
  %691 = extractvalue { float, float, float, float, float, float, float, float } %222, 6
  %692 = extractvalue { float, float, float, float, float, float, float, float } %222, 7
  %693 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %685)
  %694 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %686)
  %695 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %687)
  %696 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %688)
  %697 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %689)
  %698 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %690)
  %699 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %691)
  %700 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %692)
  %701 = mul i32 %13, 16
  %702 = sext i32 %701 to i64
  %703 = xor i32 %82, 0
  %704 = add i32 %703, 0
  %705 = sext i32 %704 to i64
  %706 = add i64 %15, %705
  %707 = select i1 %84, i32 0, i32 1
  %708 = xor i32 0, %707
  %709 = select i1 %20, i32 0, i32 2
  %710 = xor i32 %708, %709
  %711 = select i1 %24, i32 0, i32 4
  %712 = xor i32 %710, %711
  %713 = select i1 %28, i32 0, i32 8
  %714 = xor i32 %712, %713
  %715 = xor i32 %714, 0
  %716 = add i32 %715, 0
  %717 = sext i32 %716 to i64
  %718 = add i64 %702, %717
  %719 = mul i64 %718, 14336
  %720 = add i64 %706, %719
  %721 = getelementptr bfloat, ptr addrspace(1) %2, i64 %720
  %722 = select i1 %72, i32 0, i32 128
  %723 = xor i32 0, %722
  %724 = select i1 %76, i32 0, i32 256
  %725 = xor i32 %723, %724
  %726 = select i1 %80, i32 0, i32 1
  %727 = xor i32 %725, %726
  %728 = select i1 %84, i32 0, i32 2
  %729 = xor i32 %727, %728
  %730 = select i1 %20, i32 0, i32 4
  %731 = xor i32 %729, %730
  %732 = select i1 %24, i32 0, i32 16
  %733 = xor i32 %731, %732
  %734 = select i1 %28, i32 0, i32 32
  %735 = xor i32 %733, %734
  %736 = select i1 %20, i32 0, i32 128
  %737 = xor i32 %86, %736
  %738 = select i1 %24, i32 0, i32 256
  %739 = xor i32 %737, %738
  %740 = select i1 %28, i32 0, i32 512
  %741 = xor i32 %739, %740
  %742 = xor i32 %735, 0
  %743 = lshr i32 %742, 6
  %744 = shl i32 %743, 3
  %745 = add i32 %744, %742
  %746 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %745
  %747 = insertelement <1 x bfloat> undef, bfloat %693, i32 0
  %748 = extractelement <1 x bfloat> %747, i32 0
  %749 = bitcast bfloat %748 to i16
  %750 = insertelement <1 x i16> undef, i16 %749, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %746, <1 x i16> %750, i1 true)
  %751 = xor i32 %735, 64
  %752 = lshr i32 %751, 6
  %753 = shl i32 %752, 3
  %754 = add i32 %753, %751
  %755 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %754
  %756 = insertelement <1 x bfloat> undef, bfloat %694, i32 0
  %757 = extractelement <1 x bfloat> %756, i32 0
  %758 = bitcast bfloat %757 to i16
  %759 = insertelement <1 x i16> undef, i16 %758, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %755, <1 x i16> %759, i1 true)
  %760 = xor i32 %735, 8
  %761 = lshr i32 %760, 6
  %762 = shl i32 %761, 3
  %763 = add i32 %762, %760
  %764 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %763
  %765 = insertelement <1 x bfloat> undef, bfloat %695, i32 0
  %766 = extractelement <1 x bfloat> %765, i32 0
  %767 = bitcast bfloat %766 to i16
  %768 = insertelement <1 x i16> undef, i16 %767, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %764, <1 x i16> %768, i1 true)
  %769 = xor i32 %735, 72
  %770 = lshr i32 %769, 6
  %771 = shl i32 %770, 3
  %772 = add i32 %771, %769
  %773 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %772
  %774 = insertelement <1 x bfloat> undef, bfloat %696, i32 0
  %775 = extractelement <1 x bfloat> %774, i32 0
  %776 = bitcast bfloat %775 to i16
  %777 = insertelement <1 x i16> undef, i16 %776, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %773, <1 x i16> %777, i1 true)
  %778 = xor i32 %735, 512
  %779 = lshr i32 %778, 6
  %780 = shl i32 %779, 3
  %781 = add i32 %780, %778
  %782 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %781
  %783 = insertelement <1 x bfloat> undef, bfloat %697, i32 0
  %784 = extractelement <1 x bfloat> %783, i32 0
  %785 = bitcast bfloat %784 to i16
  %786 = insertelement <1 x i16> undef, i16 %785, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %782, <1 x i16> %786, i1 true)
  %787 = xor i32 %735, 576
  %788 = lshr i32 %787, 6
  %789 = shl i32 %788, 3
  %790 = add i32 %789, %787
  %791 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %790
  %792 = insertelement <1 x bfloat> undef, bfloat %698, i32 0
  %793 = extractelement <1 x bfloat> %792, i32 0
  %794 = bitcast bfloat %793 to i16
  %795 = insertelement <1 x i16> undef, i16 %794, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %791, <1 x i16> %795, i1 true)
  %796 = xor i32 %735, 520
  %797 = lshr i32 %796, 6
  %798 = shl i32 %797, 3
  %799 = add i32 %798, %796
  %800 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %799
  %801 = insertelement <1 x bfloat> undef, bfloat %699, i32 0
  %802 = extractelement <1 x bfloat> %801, i32 0
  %803 = bitcast bfloat %802 to i16
  %804 = insertelement <1 x i16> undef, i16 %803, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %800, <1 x i16> %804, i1 true)
  %805 = xor i32 %735, 584
  %806 = lshr i32 %805, 6
  %807 = shl i32 %806, 3
  %808 = add i32 %807, %805
  %809 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %808
  %810 = insertelement <1 x bfloat> undef, bfloat %700, i32 0
  %811 = extractelement <1 x bfloat> %810, i32 0
  %812 = bitcast bfloat %811 to i16
  %813 = insertelement <1 x i16> undef, i16 %812, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %809, <1 x i16> %813, i1 true)
  call void @llvm.nvvm.barrier0()
  %814 = xor i32 %741, 0
  %815 = lshr i32 %814, 6
  %816 = shl i32 %815, 3
  %817 = add i32 %816, %814
  %818 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %817
  %819 = load <4 x i32>, ptr addrspace(3) %818, align 16
  %820 = extractelement <4 x i32> %819, i32 0
  %821 = extractelement <4 x i32> %819, i32 1
  %822 = extractelement <4 x i32> %819, i32 2
  %823 = extractelement <4 x i32> %819, i32 3
  %824 = insertelement <4 x i32> undef, i32 %820, i32 0
  %825 = insertelement <4 x i32> %824, i32 %821, i32 1
  %826 = insertelement <4 x i32> %825, i32 %822, i32 2
  %827 = insertelement <4 x i32> %826, i32 %823, i32 3
  %828 = extractelement <4 x i32> %827, i32 0
  %829 = extractelement <4 x i32> %827, i32 1
  %830 = extractelement <4 x i32> %827, i32 2
  %831 = extractelement <4 x i32> %827, i32 3
  %832 = bitcast i32 %828 to <2 x i16>
  %833 = extractelement <2 x i16> %832, i32 0
  %834 = extractelement <2 x i16> %832, i32 1
  %835 = bitcast i32 %829 to <2 x i16>
  %836 = extractelement <2 x i16> %835, i32 0
  %837 = extractelement <2 x i16> %835, i32 1
  %838 = bitcast i32 %830 to <2 x i16>
  %839 = extractelement <2 x i16> %838, i32 0
  %840 = extractelement <2 x i16> %838, i32 1
  %841 = bitcast i32 %831 to <2 x i16>
  %842 = extractelement <2 x i16> %841, i32 0
  %843 = extractelement <2 x i16> %841, i32 1
  %844 = insertelement <8 x i16> undef, i16 %833, i32 0
  %845 = insertelement <8 x i16> %844, i16 %834, i32 1
  %846 = insertelement <8 x i16> %845, i16 %836, i32 2
  %847 = insertelement <8 x i16> %846, i16 %837, i32 3
  %848 = insertelement <8 x i16> %847, i16 %839, i32 4
  %849 = insertelement <8 x i16> %848, i16 %840, i32 5
  %850 = insertelement <8 x i16> %849, i16 %842, i32 6
  %851 = insertelement <8 x i16> %850, i16 %843, i32 7
  %852 = extractelement <8 x i16> %851, i32 0
  %853 = extractelement <8 x i16> %851, i32 1
  %854 = extractelement <8 x i16> %851, i32 2
  %855 = extractelement <8 x i16> %851, i32 3
  %856 = extractelement <8 x i16> %851, i32 4
  %857 = extractelement <8 x i16> %851, i32 5
  %858 = extractelement <8 x i16> %851, i32 6
  %859 = extractelement <8 x i16> %851, i32 7
  %860 = bitcast i16 %852 to bfloat
  %861 = bitcast i16 %853 to bfloat
  %862 = bitcast i16 %854 to bfloat
  %863 = bitcast i16 %855 to bfloat
  %864 = bitcast i16 %856 to bfloat
  %865 = bitcast i16 %857 to bfloat
  %866 = bitcast i16 %858 to bfloat
  %867 = bitcast i16 %859 to bfloat
  %868 = insertelement <8 x bfloat> undef, bfloat %860, i32 0
  %869 = insertelement <8 x bfloat> %868, bfloat %861, i32 1
  %870 = insertelement <8 x bfloat> %869, bfloat %862, i32 2
  %871 = insertelement <8 x bfloat> %870, bfloat %863, i32 3
  %872 = insertelement <8 x bfloat> %871, bfloat %864, i32 4
  %873 = insertelement <8 x bfloat> %872, bfloat %865, i32 5
  %874 = insertelement <8 x bfloat> %873, bfloat %866, i32 6
  %875 = insertelement <8 x bfloat> %874, bfloat %867, i32 7
  %876 = extractelement <8 x bfloat> %875, i32 0
  %877 = extractelement <8 x bfloat> %875, i32 1
  %878 = extractelement <8 x bfloat> %875, i32 2
  %879 = extractelement <8 x bfloat> %875, i32 3
  %880 = extractelement <8 x bfloat> %875, i32 4
  %881 = extractelement <8 x bfloat> %875, i32 5
  %882 = extractelement <8 x bfloat> %875, i32 6
  %883 = extractelement <8 x bfloat> %875, i32 7
  %884 = insertelement <2 x bfloat> undef, bfloat %876, i32 0
  %885 = insertelement <2 x bfloat> %884, bfloat %877, i32 1
  %886 = bitcast <2 x bfloat> %885 to i32
  %887 = insertelement <2 x bfloat> undef, bfloat %878, i32 0
  %888 = insertelement <2 x bfloat> %887, bfloat %879, i32 1
  %889 = bitcast <2 x bfloat> %888 to i32
  %890 = insertelement <2 x bfloat> undef, bfloat %880, i32 0
  %891 = insertelement <2 x bfloat> %890, bfloat %881, i32 1
  %892 = bitcast <2 x bfloat> %891 to i32
  %893 = insertelement <2 x bfloat> undef, bfloat %882, i32 0
  %894 = insertelement <2 x bfloat> %893, bfloat %883, i32 1
  %895 = bitcast <2 x bfloat> %894 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %886, i32 %889, i32 %892, i32 %895, ptr addrspace(1) %721)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_194_impl(ptr, ptr, ptr, ptr, ptr, ptr) #4

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #5

declare float @__nv_rsqrtf(float)

define ptx_kernel void @fusion_194(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(32768) %arg1, ptr noalias align 128 dereferenceable(458752) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4) #6 {
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
  %12 = mul i64 %9, 14336
  %13 = add i64 %11, %12
  %14 = add i64 %13, 13312
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
  %80 = add i64 %12, 13312
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

define ptx_kernel void @loop_convert_fusion_13(ptr noalias align 128 dereferenceable(196608) %0, ptr noalias align 128 dereferenceable(98304) %1) #0 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %5 = udiv i32 %4, 24
  %6 = urem i32 %4, 24
  %7 = mul i32 %6, 128
  %8 = add i32 %7, %3
  %9 = call bfloat @fused_convert_13_param_0_645(ptr %0, i32 %5, i32 %8)
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
  %20 = call bfloat @fused_convert_13_param_0_645(ptr %0, i32 %5, i32 %19)
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

define internal bfloat @fused_convert_13_param_0_645(ptr noalias %0, i32 %1, i32 %2) {
  %4 = mul i32 %1, 6144
  %5 = add i32 %4, %2
  %6 = getelementptr inbounds bfloat, ptr %0, i32 %5
  %7 = load bfloat, ptr %6, align 2, !invariant.load !2
  ret bfloat %7
}

declare float @__nv_fast_expf(float)

declare ptx_kernel void @fusion_192_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_192(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(458752) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %6 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %7 = addrspacecast ptr null to ptr addrspace(1)
  %8 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %9 = sext i32 %8 to i64
  %10 = mul i64 %9, 14336
  %11 = add i64 %10, 12288
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
  %152 = add i64 %10, 13312
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

declare ptx_kernel void @fusion_190_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_190(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(458752) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6) #6 {
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
  %11 = mul i64 %10, 14336
  %12 = add i64 %11, 11264
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
  %100 = getelementptr bfloat, ptr addrspace(1) %3, i64 %99
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
  %153 = add i64 %11, 12288
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
  %207 = getelementptr bfloat, ptr addrspace(1) %6, i64 %99
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
  %260 = add i64 %11, 13312
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
  %314 = getelementptr bfloat, ptr addrspace(1) %5, i64 %99
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

define ptx_kernel void @loop_add_fusion(ptr noalias align 128 dereferenceable(458752) %0, ptr noalias align 128 dereferenceable(32768) %1, ptr noalias align 128 dereferenceable(32768) %2, ptr noalias align 128 dereferenceable(32768) %3, ptr noalias align 128 dereferenceable(32768) %4, ptr noalias align 128 dereferenceable(65536) %5) #0 {
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !1
  %9 = udiv i32 %8, 8
  %10 = urem i32 %8, 8
  %11 = mul i32 %10, 128
  %12 = add i32 %11, %7
  %13 = mul i32 %8, 128
  %14 = add i32 %13, %7
  %15 = getelementptr inbounds bfloat, ptr %3, i32 %14
  %16 = load bfloat, ptr %15, align 2, !invariant.load !2
  %17 = getelementptr inbounds bfloat, ptr %4, i32 %14
  %18 = load bfloat, ptr %17, align 2, !invariant.load !2
  %19 = add i32 %12, 13312
  %20 = call float @fused_add_convert_701_22(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, i32 %9, i32 %19)
  %21 = fpext bfloat %16 to float
  %22 = fpext bfloat %18 to float
  %23 = fadd float %20, %21
  %24 = getelementptr inbounds bfloat, ptr %2, i32 %14
  %25 = load bfloat, ptr %24, align 2, !invariant.load !2
  %26 = add i32 %12, 12288
  %27 = call float @fused_add_convert_701_22(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, i32 %9, i32 %26)
  %28 = fadd float %22, %23
  %29 = fpext bfloat %25 to float
  %30 = fadd float %27, %28
  %31 = getelementptr inbounds bfloat, ptr %1, i32 %14
  %32 = load bfloat, ptr %31, align 2, !invariant.load !2
  %33 = add i32 %12, 11264
  %34 = call float @fused_add_convert_701_22(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, i32 %9, i32 %33)
  %35 = fadd float %29, %30
  %36 = fpext bfloat %32 to float
  %37 = fadd float %34, %35
  %38 = add i32 %12, 10240
  %39 = call float @fused_add_convert_701_22(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, i32 %9, i32 %38)
  %40 = fadd float %36, %37
  %41 = fadd float %39, %40
  %42 = getelementptr inbounds float, ptr %5, i32 %14
  store float %41, ptr %42, align 4
  ret void
}

define internal float @fused_add_convert_701_22(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, i32 %5, i32 %6) {
  %8 = mul i32 %5, 14336
  %9 = add i32 %8, %6
  %10 = getelementptr inbounds bfloat, ptr %0, i32 %9
  %11 = load bfloat, ptr %10, align 2, !invariant.load !2
  %12 = fpext bfloat %11 to float
  ret float %12
}

declare ptx_kernel void @fusion_188_impl(ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_188(ptr noalias align 128 dereferenceable(65536) %arg0, ptr noalias align 16 dereferenceable(4) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr null to ptr addrspace(1)
  %6 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %7 = sext i32 %6 to i64
  %8 = udiv i64 %7, 8
  %9 = urem i64 %7, 8
  %10 = mul i64 %9, 128
  %11 = mul i64 %7, 128
  %12 = getelementptr float, ptr addrspace(1) %1, i64 %11
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %14 = urem i32 %13, 32
  %15 = udiv i32 %13, 32
  %16 = and i32 %14, 1
  %17 = icmp eq i32 %16, 0
  %18 = select i1 %17, i32 0, i32 2
  %19 = xor i32 0, %18
  %20 = and i32 %14, 2
  %21 = icmp eq i32 %20, 0
  %22 = select i1 %21, i32 0, i32 4
  %23 = xor i32 %19, %22
  %24 = and i32 %14, 4
  %25 = icmp eq i32 %24, 0
  %26 = select i1 %25, i32 0, i32 8
  %27 = xor i32 %23, %26
  %28 = and i32 %14, 8
  %29 = icmp eq i32 %28, 0
  %30 = select i1 %29, i32 0, i32 16
  %31 = xor i32 %27, %30
  %32 = and i32 %14, 16
  %33 = icmp eq i32 %32, 0
  %34 = select i1 %33, i32 0, i32 32
  %35 = xor i32 %31, %34
  %36 = and i32 %15, 1
  %37 = icmp eq i32 %36, 0
  %38 = select i1 %37, i32 0, i32 64
  %39 = xor i32 %35, %38
  %40 = xor i32 %39, 0
  %41 = add i32 %40, 0
  %42 = sext i32 %41 to i64
  %43 = getelementptr float, ptr addrspace(1) %12, i64 %42
  %44 = call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %43)
  %45 = extractvalue { i32, i32 } %44, 0
  %46 = bitcast i32 %45 to <1 x float>
  %47 = extractvalue { i32, i32 } %44, 1
  %48 = bitcast i32 %47 to <1 x float>
  %49 = extractelement <1 x float> %46, i32 0
  %50 = extractelement <1 x float> %48, i32 0
  %51 = mul i64 %8, 1024
  %52 = getelementptr float, ptr addrspace(1) %1, i64 %51
  %53 = select i1 %17, i32 0, i32 4
  %54 = xor i32 0, %53
  %55 = select i1 %21, i32 0, i32 8
  %56 = xor i32 %54, %55
  %57 = select i1 %25, i32 0, i32 16
  %58 = xor i32 %56, %57
  %59 = select i1 %29, i32 0, i32 32
  %60 = xor i32 %58, %59
  %61 = select i1 %33, i32 0, i32 64
  %62 = xor i32 %60, %61
  %63 = select i1 %37, i32 0, i32 128
  %64 = xor i32 %62, %63
  %65 = xor i32 %64, 0
  %66 = xor i32 %64, 256
  %67 = xor i32 %64, 512
  %68 = xor i32 %64, 768
  %69 = add i32 %65, 0
  %70 = add i32 %66, 0
  %71 = add i32 %67, 0
  %72 = add i32 %68, 0
  %73 = sext i32 %69 to i64
  %74 = sext i32 %70 to i64
  %75 = sext i32 %71 to i64
  %76 = sext i32 %72 to i64
  %77 = getelementptr float, ptr addrspace(1) %52, i64 %73
  %78 = getelementptr float, ptr addrspace(1) %52, i64 %74
  %79 = getelementptr float, ptr addrspace(1) %52, i64 %75
  %80 = getelementptr float, ptr addrspace(1) %52, i64 %76
  %81 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %77)
  %82 = extractvalue { i32, i32, i32, i32 } %81, 0
  %83 = bitcast i32 %82 to <1 x float>
  %84 = extractvalue { i32, i32, i32, i32 } %81, 1
  %85 = bitcast i32 %84 to <1 x float>
  %86 = extractvalue { i32, i32, i32, i32 } %81, 2
  %87 = bitcast i32 %86 to <1 x float>
  %88 = extractvalue { i32, i32, i32, i32 } %81, 3
  %89 = bitcast i32 %88 to <1 x float>
  %90 = extractelement <1 x float> %83, i32 0
  %91 = extractelement <1 x float> %85, i32 0
  %92 = extractelement <1 x float> %87, i32 0
  %93 = extractelement <1 x float> %89, i32 0
  %94 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %78)
  %95 = extractvalue { i32, i32, i32, i32 } %94, 0
  %96 = bitcast i32 %95 to <1 x float>
  %97 = extractvalue { i32, i32, i32, i32 } %94, 1
  %98 = bitcast i32 %97 to <1 x float>
  %99 = extractvalue { i32, i32, i32, i32 } %94, 2
  %100 = bitcast i32 %99 to <1 x float>
  %101 = extractvalue { i32, i32, i32, i32 } %94, 3
  %102 = bitcast i32 %101 to <1 x float>
  %103 = extractelement <1 x float> %96, i32 0
  %104 = extractelement <1 x float> %98, i32 0
  %105 = extractelement <1 x float> %100, i32 0
  %106 = extractelement <1 x float> %102, i32 0
  %107 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %79)
  %108 = extractvalue { i32, i32, i32, i32 } %107, 0
  %109 = bitcast i32 %108 to <1 x float>
  %110 = extractvalue { i32, i32, i32, i32 } %107, 1
  %111 = bitcast i32 %110 to <1 x float>
  %112 = extractvalue { i32, i32, i32, i32 } %107, 2
  %113 = bitcast i32 %112 to <1 x float>
  %114 = extractvalue { i32, i32, i32, i32 } %107, 3
  %115 = bitcast i32 %114 to <1 x float>
  %116 = extractelement <1 x float> %109, i32 0
  %117 = extractelement <1 x float> %111, i32 0
  %118 = extractelement <1 x float> %113, i32 0
  %119 = extractelement <1 x float> %115, i32 0
  %120 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %80)
  %121 = extractvalue { i32, i32, i32, i32 } %120, 0
  %122 = bitcast i32 %121 to <1 x float>
  %123 = extractvalue { i32, i32, i32, i32 } %120, 1
  %124 = bitcast i32 %123 to <1 x float>
  %125 = extractvalue { i32, i32, i32, i32 } %120, 2
  %126 = bitcast i32 %125 to <1 x float>
  %127 = extractvalue { i32, i32, i32, i32 } %120, 3
  %128 = bitcast i32 %127 to <1 x float>
  %129 = extractelement <1 x float> %122, i32 0
  %130 = extractelement <1 x float> %124, i32 0
  %131 = extractelement <1 x float> %126, i32 0
  %132 = extractelement <1 x float> %128, i32 0
  %133 = fmul float %90, %90
  %134 = fmul float %91, %91
  %135 = fmul float %92, %92
  %136 = fmul float %93, %93
  %137 = fmul float %103, %103
  %138 = fmul float %104, %104
  %139 = fmul float %105, %105
  %140 = fmul float %106, %106
  %141 = fmul float %116, %116
  %142 = fmul float %117, %117
  %143 = fmul float %118, %118
  %144 = fmul float %119, %119
  %145 = fmul float %129, %129
  %146 = fmul float %130, %130
  %147 = fmul float %131, %131
  %148 = fmul float %132, %132
  %149 = fadd float %133, %134
  %150 = fadd float %149, %135
  %151 = fadd float %150, %136
  %152 = fadd float %151, %137
  %153 = fadd float %152, %138
  %154 = fadd float %153, %139
  %155 = fadd float %154, %140
  %156 = fadd float %155, %141
  %157 = fadd float %156, %142
  %158 = fadd float %157, %143
  %159 = fadd float %158, %144
  %160 = fadd float %159, %145
  %161 = fadd float %160, %146
  %162 = fadd float %161, %147
  %163 = fadd float %162, %148
  %164 = bitcast float %163 to i32
  %165 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %164, i32 16, i32 31)
  %166 = bitcast i32 %165 to float
  %167 = fadd float %163, %166
  %168 = bitcast float %167 to i32
  %169 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %168, i32 8, i32 31)
  %170 = bitcast i32 %169 to float
  %171 = fadd float %167, %170
  %172 = bitcast float %171 to i32
  %173 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %172, i32 4, i32 31)
  %174 = bitcast i32 %173 to float
  %175 = fadd float %171, %174
  %176 = bitcast float %175 to i32
  %177 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %176, i32 2, i32 31)
  %178 = bitcast i32 %177 to float
  %179 = fadd float %175, %178
  %180 = bitcast float %179 to i32
  %181 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %180, i32 1, i32 31)
  %182 = bitcast i32 %181 to float
  %183 = fadd float %179, %182
  %184 = urem i32 %14, 32
  %185 = urem i32 %15, 2
  %186 = icmp eq i32 %184, 0
  %187 = and i1 true, %186
  %188 = add i32 0, %185
  %189 = getelementptr float, ptr addrspace(3) @global_smem, i32 %188
  %190 = insertelement <1 x float> undef, float %183, i32 0
  %191 = extractelement <1 x float> %190, i32 0
  %192 = bitcast float %191 to i32
  %193 = insertelement <1 x i32> undef, i32 %192, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %189, <1 x i32> %193, i1 %187)
  call void @llvm.nvvm.barrier0()
  %194 = icmp slt i32 %13, 2
  %195 = getelementptr float, ptr addrspace(3) @global_smem, i32 %13
  %196 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %195, i1 %194)
  %197 = insertelement <1 x i32> undef, i32 %196, i32 0
  %198 = extractelement <1 x i32> %197, i32 0
  %199 = bitcast i32 %198 to float
  %200 = insertelement <1 x float> undef, float %199, i32 0
  %201 = extractelement <1 x float> %200, i32 0
  %202 = bitcast float %201 to i32
  %203 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %202, i32 1, i32 31)
  %204 = bitcast i32 %203 to float
  %205 = fadd float %201, %204
  %206 = urem i32 %14, 2
  %207 = icmp eq i32 %206, 0
  %208 = and i1 %194, %207
  %209 = insertelement <1 x float> undef, float %205, i32 0
  %210 = extractelement <1 x float> %209, i32 0
  %211 = bitcast float %210 to i32
  %212 = insertelement <1 x i32> undef, i32 %211, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %195, <1 x i32> %212, i1 %208)
  call void @llvm.nvvm.barrier0()
  %213 = load float, ptr addrspace(3) @global_smem, align 4
  %214 = fmul float %213, 0x3F50000000000000
  %215 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %2)
  %216 = bitcast i32 %215 to <1 x float>
  %217 = extractelement <1 x float> %216, i32 0
  %218 = fadd float %214, %217
  %219 = call float @__nv_rsqrtf(float %218)
  %220 = fmul float %49, %219
  %221 = fmul float %50, %219
  %222 = getelementptr bfloat, ptr addrspace(1) %3, i64 %10
  %223 = getelementptr bfloat, ptr addrspace(1) %222, i64 %42
  %224 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %223)
  %225 = bitcast i32 %224 to <2 x bfloat>
  %226 = extractelement <2 x bfloat> %225, i32 0
  %227 = extractelement <2 x bfloat> %225, i32 1
  %228 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %226)
  %229 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %227)
  %230 = fmul float %220, %228
  %231 = fmul float %221, %229
  %232 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %230)
  %233 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %231)
  %234 = getelementptr bfloat, ptr addrspace(1) %4, i64 %11
  %235 = getelementptr bfloat, ptr addrspace(1) %234, i64 %42
  %236 = insertelement <2 x bfloat> undef, bfloat %232, i32 0
  %237 = insertelement <2 x bfloat> %236, bfloat %233, i32 1
  %238 = bitcast <2 x bfloat> %237 to i32
  call void asm sideeffect "st.global.b32 [ $1 + 0 ], { $0 };", "r,l"(i32 %238, ptr addrspace(1) %235)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_186_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_186(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(458752) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %6 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %7 = addrspacecast ptr null to ptr addrspace(1)
  %8 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %9 = sext i32 %8 to i64
  %10 = mul i64 %9, 14336
  %11 = add i64 %10, 9216
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
  %104 = mul i64 %9, 1024
  %105 = getelementptr bfloat, ptr addrspace(1) %4, i64 %104
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
  %158 = getelementptr float, ptr addrspace(1) %3, i64 %104
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
  %350 = getelementptr bfloat, ptr addrspace(1) %2, i64 %48
  %351 = getelementptr bfloat, ptr addrspace(1) %2, i64 %50
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

declare ptx_kernel void @fusion_184_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_184(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(458752) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6) #6 {
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
  %11 = mul i64 %10, 14336
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

declare ptx_kernel void @fusion_182_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_182(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(458752) %arg3, ptr noalias align 128 dereferenceable(65536) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6, ptr noalias align 128 dereferenceable(32768) %arg7) #6 {
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
  %12 = mul i64 %11, 14336
  %13 = add i64 %12, 7168
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
  %107 = getelementptr bfloat, ptr addrspace(1) %3, i64 %106
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
  %161 = getelementptr bfloat, ptr addrspace(1) %4, i64 %160
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
  %268 = getelementptr bfloat, ptr addrspace(1) %4, i64 %267
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
  %630 = getelementptr bfloat, ptr addrspace(1) %2, i64 %50
  %631 = getelementptr bfloat, ptr addrspace(1) %2, i64 %52
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

define ptx_kernel void @loop_add_fusion_1(ptr noalias align 128 dereferenceable(458752) %0, ptr noalias align 128 dereferenceable(32768) %1, ptr noalias align 128 dereferenceable(32768) %2, ptr noalias align 128 dereferenceable(65536) %3, ptr noalias align 128 dereferenceable(32768) %4, ptr noalias align 128 dereferenceable(32768) %5) #0 {
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !1
  %9 = udiv i32 %8, 8
  %10 = urem i32 %8, 8
  %11 = mul i32 %10, 128
  %12 = add i32 %11, %7
  %13 = mul i32 %8, 128
  %14 = add i32 %13, %7
  %15 = getelementptr inbounds bfloat, ptr %4, i32 %14
  %16 = load bfloat, ptr %15, align 2, !invariant.load !2
  %17 = fpext bfloat %16 to float
  %18 = getelementptr inbounds float, ptr %3, i32 %14
  %19 = load float, ptr %18, align 4
  %20 = getelementptr inbounds bfloat, ptr %5, i32 %14
  %21 = load bfloat, ptr %20, align 2, !invariant.load !2
  %22 = add i32 %12, 9216
  %23 = call float @fused_add_1_convert_701_30(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %9, i32 %22)
  %24 = fadd float %17, %19
  %25 = fpext bfloat %21 to float
  %26 = fadd float %23, %24
  %27 = getelementptr inbounds bfloat, ptr %2, i32 %14
  %28 = load bfloat, ptr %27, align 2, !invariant.load !2
  %29 = add i32 %12, 8192
  %30 = call float @fused_add_1_convert_701_30(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %9, i32 %29)
  %31 = fadd float %25, %26
  %32 = fpext bfloat %28 to float
  %33 = fadd float %30, %31
  %34 = getelementptr inbounds bfloat, ptr %1, i32 %14
  %35 = load bfloat, ptr %34, align 2, !invariant.load !2
  %36 = add i32 %12, 7168
  %37 = call float @fused_add_1_convert_701_30(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %9, i32 %36)
  %38 = fadd float %32, %33
  %39 = fpext bfloat %35 to float
  %40 = fadd float %37, %38
  %41 = add i32 %12, 6144
  %42 = call float @fused_add_1_convert_701_30(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %9, i32 %41)
  %43 = fadd float %39, %40
  %44 = fadd float %42, %43
  store float %44, ptr %18, align 4
  ret void
}

define internal float @fused_add_1_convert_701_30(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, i32 %6, i32 %7) {
  %9 = mul i32 %6, 14336
  %10 = add i32 %9, %7
  %11 = getelementptr inbounds bfloat, ptr %0, i32 %10
  %12 = load bfloat, ptr %11, align 2, !invariant.load !2
  %13 = fpext bfloat %12 to float
  ret float %13
}

declare ptx_kernel void @fusion_178_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_178(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(458752) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %6 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %7 = addrspacecast ptr null to ptr addrspace(1)
  %8 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %9 = sext i32 %8 to i64
  %10 = mul i64 %9, 14336
  %11 = add i64 %10, 5120
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
  %104 = mul i64 %9, 1024
  %105 = getelementptr bfloat, ptr addrspace(1) %4, i64 %104
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
  %158 = getelementptr float, ptr addrspace(1) %3, i64 %104
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
  %350 = getelementptr bfloat, ptr addrspace(1) %2, i64 %48
  %351 = getelementptr bfloat, ptr addrspace(1) %2, i64 %50
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

declare ptx_kernel void @fusion_176_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_176(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(458752) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6) #6 {
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
  %11 = mul i64 %10, 14336
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

declare ptx_kernel void @fusion_174_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_174(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(458752) %arg3, ptr noalias align 128 dereferenceable(65536) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6, ptr noalias align 128 dereferenceable(32768) %arg7) #6 {
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
  %12 = mul i64 %11, 14336
  %13 = add i64 %12, 3072
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
  %107 = getelementptr bfloat, ptr addrspace(1) %3, i64 %106
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
  %161 = getelementptr bfloat, ptr addrspace(1) %4, i64 %160
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
  %268 = getelementptr bfloat, ptr addrspace(1) %4, i64 %267
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
  %630 = getelementptr bfloat, ptr addrspace(1) %2, i64 %50
  %631 = getelementptr bfloat, ptr addrspace(1) %2, i64 %52
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

define ptx_kernel void @loop_add_fusion_2(ptr noalias align 128 dereferenceable(458752) %0, ptr noalias align 128 dereferenceable(32768) %1, ptr noalias align 128 dereferenceable(32768) %2, ptr noalias align 128 dereferenceable(65536) %3, ptr noalias align 128 dereferenceable(32768) %4, ptr noalias align 128 dereferenceable(32768) %5) #0 {
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !1
  %9 = udiv i32 %8, 8
  %10 = urem i32 %8, 8
  %11 = mul i32 %10, 128
  %12 = add i32 %11, %7
  %13 = mul i32 %8, 128
  %14 = add i32 %13, %7
  %15 = getelementptr inbounds bfloat, ptr %4, i32 %14
  %16 = load bfloat, ptr %15, align 2, !invariant.load !2
  %17 = fpext bfloat %16 to float
  %18 = getelementptr inbounds float, ptr %3, i32 %14
  %19 = load float, ptr %18, align 4
  %20 = getelementptr inbounds bfloat, ptr %5, i32 %14
  %21 = load bfloat, ptr %20, align 2, !invariant.load !2
  %22 = add i32 %12, 5120
  %23 = call float @fused_add_2_convert_701_38(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %9, i32 %22)
  %24 = fadd float %17, %19
  %25 = fpext bfloat %21 to float
  %26 = fadd float %23, %24
  %27 = getelementptr inbounds bfloat, ptr %2, i32 %14
  %28 = load bfloat, ptr %27, align 2, !invariant.load !2
  %29 = add i32 %12, 4096
  %30 = call float @fused_add_2_convert_701_38(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %9, i32 %29)
  %31 = fadd float %25, %26
  %32 = fpext bfloat %28 to float
  %33 = fadd float %30, %31
  %34 = getelementptr inbounds bfloat, ptr %1, i32 %14
  %35 = load bfloat, ptr %34, align 2, !invariant.load !2
  %36 = add i32 %12, 3072
  %37 = call float @fused_add_2_convert_701_38(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %9, i32 %36)
  %38 = fadd float %32, %33
  %39 = fpext bfloat %35 to float
  %40 = fadd float %37, %38
  %41 = add i32 %12, 2048
  %42 = call float @fused_add_2_convert_701_38(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %9, i32 %41)
  %43 = fadd float %39, %40
  %44 = fadd float %42, %43
  store float %44, ptr %18, align 4
  ret void
}

define internal float @fused_add_2_convert_701_38(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, i32 %6, i32 %7) {
  %9 = mul i32 %6, 14336
  %10 = add i32 %9, %7
  %11 = getelementptr inbounds bfloat, ptr %0, i32 %10
  %12 = load bfloat, ptr %11, align 2, !invariant.load !2
  %13 = fpext bfloat %12 to float
  ret float %13
}

declare ptx_kernel void @fusion_170_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_170(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(458752) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %6 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %7 = addrspacecast ptr null to ptr addrspace(1)
  %8 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %9 = sext i32 %8 to i64
  %10 = mul i64 %9, 14336
  %11 = add i64 %10, 1024
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
  %104 = mul i64 %9, 1024
  %105 = getelementptr bfloat, ptr addrspace(1) %4, i64 %104
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
  %158 = getelementptr float, ptr addrspace(1) %3, i64 %104
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
  %350 = getelementptr bfloat, ptr addrspace(1) %2, i64 %48
  %351 = getelementptr bfloat, ptr addrspace(1) %2, i64 %50
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

declare ptx_kernel void @fusion_168_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_168(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(458752) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6) #6 {
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
  %11 = mul i64 %10, 14336
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

declare ptx_kernel void @fusion_166_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_166(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(32768) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(65536) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(458752) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6, ptr noalias align 128 dereferenceable(32768) %arg7) #6 {
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
  %105 = mul i64 %11, 14336
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

declare ptx_kernel void @triton_softmax_16_0_impl(ptr, ptr, ptr, ptr) #7

define ptx_kernel void @triton_softmax_16_0(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2) #8 {
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
  %21 = call float @fused_concatenate_convert_906_17(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %9)
  %22 = fmul float %20, %21
  %23 = add i32 %9, 64
  %24 = add i32 %14, 64
  %25 = getelementptr inbounds float, ptr %0, i32 %24
  %26 = load float, ptr %25, align 4, !invariant.load !2
  %27 = getelementptr inbounds bfloat, ptr %1, i32 %23
  %28 = load bfloat, ptr %27, align 2, !invariant.load !2
  %29 = fpext bfloat %28 to float
  %30 = fmul float %26, %29
  %31 = call float @fused_concatenate_convert_906_17(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %23)
  %32 = fmul float %30, %31
  %33 = fsub float %22, %32
  %34 = fptrunc float %33 to bfloat
  %35 = getelementptr inbounds bfloat, ptr %4, i32 %14
  store bfloat %34, ptr %35, align 2
  %36 = load float, ptr %25, align 4, !invariant.load !2
  %37 = load bfloat, ptr %27, align 2, !invariant.load !2
  %38 = fpext bfloat %37 to float
  %39 = fmul float %36, %38
  %40 = call float @fused_concatenate_convert_906_17(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %9)
  %41 = fmul float %39, %40
  %42 = load float, ptr %15, align 4, !invariant.load !2
  %43 = load bfloat, ptr %17, align 2, !invariant.load !2
  %44 = fpext bfloat %43 to float
  %45 = fmul float %42, %44
  %46 = call float @fused_concatenate_convert_906_17(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %23)
  %47 = fmul float %45, %46
  %48 = fadd float %41, %47
  %49 = fptrunc float %48 to bfloat
  %50 = getelementptr inbounds bfloat, ptr %4, i32 %24
  store bfloat %49, ptr %50, align 2
  ret void
}

define internal float @fused_concatenate_convert_906_17(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, i32 %4, i32 %5) {
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
!3 = !{i32 0, i32 229376}
!4 = !{i32 0, i32 384}
!5 = !{i32 0, i32 64}
!6 = !{i32 0, i32 135456}

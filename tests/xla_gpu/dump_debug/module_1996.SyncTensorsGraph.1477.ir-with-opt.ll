; ModuleID = 'SyncTensorsGraph.1477'
source_filename = "SyncTensorsGraph.1477"
target datalayout = "e-p6:32:32-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@global_smem = external addrspace(3) global [0 x i8], align 16

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_gather_fusion(ptr noalias readonly align 16 captures(none) dereferenceable(311164928) %0, ptr noalias readonly align 16 captures(none) dereferenceable(128) %1, ptr noalias writeonly align 128 captures(none) dereferenceable(65536) %2) local_unnamed_addr #0 {
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
define ptx_kernel void @wrapped_concatenate(ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %0, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %1, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %2, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %3, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %4, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %5, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %6, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %7, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %8, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %9, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %10, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %11, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %12, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %13, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %14, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %15, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %16, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %17, ptr noalias writeonly align 128 captures(none) dereferenceable(75497472) %18) local_unnamed_addr #2 {
  %20 = addrspacecast ptr %18 to ptr addrspace(1)
  %21 = addrspacecast ptr %17 to ptr addrspace(1)
  %22 = addrspacecast ptr %16 to ptr addrspace(1)
  %23 = addrspacecast ptr %15 to ptr addrspace(1)
  %24 = addrspacecast ptr %14 to ptr addrspace(1)
  %25 = addrspacecast ptr %13 to ptr addrspace(1)
  %26 = addrspacecast ptr %12 to ptr addrspace(1)
  %27 = addrspacecast ptr %11 to ptr addrspace(1)
  %28 = addrspacecast ptr %10 to ptr addrspace(1)
  %29 = addrspacecast ptr %9 to ptr addrspace(1)
  %30 = addrspacecast ptr %8 to ptr addrspace(1)
  %31 = addrspacecast ptr %7 to ptr addrspace(1)
  %32 = addrspacecast ptr %6 to ptr addrspace(1)
  %33 = addrspacecast ptr %5 to ptr addrspace(1)
  %34 = addrspacecast ptr %4 to ptr addrspace(1)
  %35 = addrspacecast ptr %3 to ptr addrspace(1)
  %36 = addrspacecast ptr %2 to ptr addrspace(1)
  %37 = addrspacecast ptr %1 to ptr addrspace(1)
  %38 = addrspacecast ptr %0 to ptr addrspace(1)
  %39 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %40 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !7
  %41 = lshr i32 %40, 4
  %42 = icmp samesign ult i32 %40, 147456
  br i1 %42, label %43, label %141

43:                                               ; preds = %19
  %44 = icmp samesign ult i32 %40, 65536
  br i1 %44, label %45, label %84

45:                                               ; preds = %43
  %46 = icmp samesign ult i32 %40, 32768
  %47 = shl nuw nsw i32 %40, 7
  br i1 %46, label %48, label %64

48:                                               ; preds = %45
  %49 = icmp samesign ult i32 %40, 16384
  br i1 %49, label %50, label %54

50:                                               ; preds = %48
  %51 = or disjoint i32 %47, %39
  %52 = zext nneg i32 %51 to i64
  %53 = getelementptr inbounds bfloat, ptr addrspace(1) %38, i64 %52
  br label %241

54:                                               ; preds = %48
  %55 = and i32 %47, 1920
  %56 = shl nuw nsw i32 %41, 11
  %57 = sext i32 %39 to i64
  %58 = sext i32 %55 to i64
  %59 = sext i32 %56 to i64
  %60 = add i64 %59, %58
  %61 = add i64 %60, %57
  %62 = getelementptr bfloat, ptr addrspace(1) %37, i64 %61
  %63 = getelementptr inbounds i8, ptr addrspace(1) %62, i64 -4194304
  br label %241

64:                                               ; preds = %45
  %65 = icmp samesign ult i32 %40, 49152
  %66 = and i32 %47, 1920
  %67 = shl nuw nsw i32 %41, 11
  br i1 %65, label %68, label %76

68:                                               ; preds = %64
  %69 = sext i32 %39 to i64
  %70 = sext i32 %66 to i64
  %71 = sext i32 %67 to i64
  %72 = add i64 %71, %70
  %73 = add i64 %72, %69
  %74 = getelementptr bfloat, ptr addrspace(1) %36, i64 %73
  %75 = getelementptr inbounds i8, ptr addrspace(1) %74, i64 -8388608
  br label %241

76:                                               ; preds = %64
  %77 = sext i32 %39 to i64
  %78 = sext i32 %66 to i64
  %79 = sext i32 %67 to i64
  %80 = add i64 %79, %78
  %81 = add i64 %80, %77
  %82 = getelementptr bfloat, ptr addrspace(1) %35, i64 %81
  %83 = getelementptr inbounds i8, ptr addrspace(1) %82, i64 -12582912
  br label %241

84:                                               ; preds = %43
  %85 = icmp samesign ult i32 %40, 98304
  br i1 %85, label %86, label %107

86:                                               ; preds = %84
  %87 = icmp samesign ult i32 %40, 81920
  %88 = shl nuw nsw i32 %40, 7
  %89 = and i32 %88, 1920
  %90 = shl nuw nsw i32 %41, 11
  br i1 %87, label %91, label %99

91:                                               ; preds = %86
  %92 = sext i32 %39 to i64
  %93 = sext i32 %89 to i64
  %94 = sext i32 %90 to i64
  %95 = add i64 %94, %93
  %96 = add i64 %95, %92
  %97 = getelementptr bfloat, ptr addrspace(1) %34, i64 %96
  %98 = getelementptr inbounds i8, ptr addrspace(1) %97, i64 -16777216
  br label %241

99:                                               ; preds = %86
  %100 = sext i32 %39 to i64
  %101 = sext i32 %89 to i64
  %102 = sext i32 %90 to i64
  %103 = add i64 %102, %101
  %104 = add i64 %103, %100
  %105 = getelementptr bfloat, ptr addrspace(1) %33, i64 %104
  %106 = getelementptr inbounds i8, ptr addrspace(1) %105, i64 -20971520
  br label %241

107:                                              ; preds = %84
  %108 = icmp samesign ult i32 %40, 114688
  br i1 %108, label %109, label %120

109:                                              ; preds = %107
  %110 = shl nuw nsw i32 %40, 7
  %111 = and i32 %110, 1920
  %112 = shl nuw nsw i32 %41, 11
  %113 = sext i32 %39 to i64
  %114 = sext i32 %111 to i64
  %115 = sext i32 %112 to i64
  %116 = add i64 %115, %114
  %117 = add i64 %116, %113
  %118 = getelementptr bfloat, ptr addrspace(1) %32, i64 %117
  %119 = getelementptr inbounds i8, ptr addrspace(1) %118, i64 -25165824
  br label %241

120:                                              ; preds = %107
  %121 = icmp samesign ult i32 %40, 131072
  %122 = shl nuw nsw i32 %40, 7
  %123 = and i32 %122, 1920
  %124 = shl nuw nsw i32 %41, 11
  br i1 %121, label %125, label %133

125:                                              ; preds = %120
  %126 = sext i32 %39 to i64
  %127 = sext i32 %123 to i64
  %128 = sext i32 %124 to i64
  %129 = add i64 %128, %127
  %130 = add i64 %129, %126
  %131 = getelementptr bfloat, ptr addrspace(1) %31, i64 %130
  %132 = getelementptr inbounds i8, ptr addrspace(1) %131, i64 -29360128
  br label %241

133:                                              ; preds = %120
  %134 = sext i32 %39 to i64
  %135 = sext i32 %123 to i64
  %136 = sext i32 %124 to i64
  %137 = add i64 %136, %135
  %138 = add i64 %137, %134
  %139 = getelementptr bfloat, ptr addrspace(1) %30, i64 %138
  %140 = getelementptr inbounds i8, ptr addrspace(1) %139, i64 -33554432
  br label %241

141:                                              ; preds = %19
  %142 = icmp samesign ult i32 %40, 212992
  br i1 %142, label %143, label %184

143:                                              ; preds = %141
  %144 = icmp samesign ult i32 %40, 180224
  %145 = shl nuw nsw i32 %40, 7
  %146 = and i32 %145, 1920
  %147 = shl nuw nsw i32 %41, 11
  br i1 %144, label %148, label %166

148:                                              ; preds = %143
  %149 = icmp samesign ult i32 %40, 163840
  br i1 %149, label %150, label %158

150:                                              ; preds = %148
  %151 = sext i32 %39 to i64
  %152 = sext i32 %146 to i64
  %153 = sext i32 %147 to i64
  %154 = add i64 %153, %152
  %155 = add i64 %154, %151
  %156 = getelementptr bfloat, ptr addrspace(1) %29, i64 %155
  %157 = getelementptr inbounds i8, ptr addrspace(1) %156, i64 -37748736
  br label %241

158:                                              ; preds = %148
  %159 = sext i32 %39 to i64
  %160 = sext i32 %146 to i64
  %161 = sext i32 %147 to i64
  %162 = add i64 %161, %160
  %163 = add i64 %162, %159
  %164 = getelementptr bfloat, ptr addrspace(1) %28, i64 %163
  %165 = getelementptr inbounds i8, ptr addrspace(1) %164, i64 -41943040
  br label %241

166:                                              ; preds = %143
  %167 = icmp samesign ult i32 %40, 196608
  br i1 %167, label %168, label %176

168:                                              ; preds = %166
  %169 = sext i32 %39 to i64
  %170 = sext i32 %146 to i64
  %171 = sext i32 %147 to i64
  %172 = add i64 %171, %170
  %173 = add i64 %172, %169
  %174 = getelementptr bfloat, ptr addrspace(1) %27, i64 %173
  %175 = getelementptr inbounds i8, ptr addrspace(1) %174, i64 -46137344
  br label %241

176:                                              ; preds = %166
  %177 = sext i32 %39 to i64
  %178 = sext i32 %146 to i64
  %179 = sext i32 %147 to i64
  %180 = add i64 %179, %178
  %181 = add i64 %180, %177
  %182 = getelementptr bfloat, ptr addrspace(1) %26, i64 %181
  %183 = getelementptr inbounds i8, ptr addrspace(1) %182, i64 -50331648
  br label %241

184:                                              ; preds = %141
  %185 = icmp samesign ult i32 %40, 245760
  br i1 %185, label %186, label %207

186:                                              ; preds = %184
  %187 = icmp samesign ult i32 %40, 229376
  %188 = shl nuw nsw i32 %40, 7
  %189 = and i32 %188, 1920
  %190 = shl nuw nsw i32 %41, 11
  br i1 %187, label %191, label %199

191:                                              ; preds = %186
  %192 = sext i32 %39 to i64
  %193 = sext i32 %189 to i64
  %194 = sext i32 %190 to i64
  %195 = add i64 %194, %193
  %196 = add i64 %195, %192
  %197 = getelementptr bfloat, ptr addrspace(1) %25, i64 %196
  %198 = getelementptr inbounds i8, ptr addrspace(1) %197, i64 -54525952
  br label %241

199:                                              ; preds = %186
  %200 = sext i32 %39 to i64
  %201 = sext i32 %189 to i64
  %202 = sext i32 %190 to i64
  %203 = add i64 %202, %201
  %204 = add i64 %203, %200
  %205 = getelementptr bfloat, ptr addrspace(1) %24, i64 %204
  %206 = getelementptr inbounds i8, ptr addrspace(1) %205, i64 -58720256
  br label %241

207:                                              ; preds = %184
  %208 = icmp samesign ult i32 %40, 262144
  br i1 %208, label %209, label %220

209:                                              ; preds = %207
  %210 = shl nuw nsw i32 %40, 7
  %211 = and i32 %210, 1920
  %212 = shl nuw nsw i32 %41, 11
  %213 = sext i32 %39 to i64
  %214 = sext i32 %211 to i64
  %215 = sext i32 %212 to i64
  %216 = add i64 %215, %214
  %217 = add i64 %216, %213
  %218 = getelementptr bfloat, ptr addrspace(1) %23, i64 %217
  %219 = getelementptr inbounds i8, ptr addrspace(1) %218, i64 -62914560
  br label %241

220:                                              ; preds = %207
  %221 = icmp samesign ult i32 %40, 278528
  %222 = shl nuw nsw i32 %40, 7
  %223 = and i32 %222, 1920
  %224 = shl nuw nsw i32 %41, 11
  br i1 %221, label %225, label %233

225:                                              ; preds = %220
  %226 = sext i32 %39 to i64
  %227 = sext i32 %223 to i64
  %228 = sext i32 %224 to i64
  %229 = add i64 %228, %227
  %230 = add i64 %229, %226
  %231 = getelementptr bfloat, ptr addrspace(1) %22, i64 %230
  %232 = getelementptr inbounds i8, ptr addrspace(1) %231, i64 -67108864
  br label %241

233:                                              ; preds = %220
  %234 = sext i32 %39 to i64
  %235 = sext i32 %223 to i64
  %236 = sext i32 %224 to i64
  %237 = add i64 %236, %235
  %238 = add i64 %237, %234
  %239 = getelementptr bfloat, ptr addrspace(1) %21, i64 %238
  %240 = getelementptr inbounds i8, ptr addrspace(1) %239, i64 -71303168
  br label %241

241:                                              ; preds = %54, %50, %76, %68, %99, %91, %109, %133, %125, %158, %150, %176, %168, %199, %191, %209, %233, %225
  %.pre-phi = phi i32 [ %47, %54 ], [ %47, %50 ], [ %47, %76 ], [ %47, %68 ], [ %88, %99 ], [ %88, %91 ], [ %110, %109 ], [ %122, %133 ], [ %122, %125 ], [ %145, %158 ], [ %145, %150 ], [ %145, %176 ], [ %145, %168 ], [ %188, %199 ], [ %188, %191 ], [ %210, %209 ], [ %222, %233 ], [ %222, %225 ]
  %.in = phi ptr addrspace(1) [ %63, %54 ], [ %53, %50 ], [ %83, %76 ], [ %75, %68 ], [ %106, %99 ], [ %98, %91 ], [ %119, %109 ], [ %140, %133 ], [ %132, %125 ], [ %165, %158 ], [ %157, %150 ], [ %183, %176 ], [ %175, %168 ], [ %206, %199 ], [ %198, %191 ], [ %219, %209 ], [ %240, %233 ], [ %232, %225 ]
  %242 = load bfloat, ptr addrspace(1) %.in, align 2, !invariant.load !6
  %243 = or disjoint i32 %.pre-phi, %39
  %244 = zext nneg i32 %243 to i64
  %245 = getelementptr inbounds bfloat, ptr addrspace(1) %20, i64 %244
  store bfloat %242, ptr addrspace(1) %245, align 2
  ret void
}

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #3

define ptx_kernel void @gemm_fusion_dot_72_0(ptr noalias align 128 dereferenceable(75497472) %arg0, ptr noalias align 128 dereferenceable(1179648) %arg1) local_unnamed_addr #4 {
  %arg1119 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0117 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %.frozen = freeze i32 %1
  %2 = sdiv i32 %.frozen, 8
  %3 = shl nsw i32 %2, 3
  %4 = sub i32 288, %3
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
  %.not5 = icmp eq i32 %53, 0
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
  %65 = getelementptr bfloat, ptr addrspace(1) %arg0117, i64 %57
  %66 = getelementptr bfloat, ptr addrspace(1) %arg0117, i64 %58
  %67 = getelementptr bfloat, ptr addrspace(1) %arg0117, i64 %59
  %68 = getelementptr bfloat, ptr addrspace(1) %arg0117, i64 %60
  %69 = getelementptr bfloat, ptr addrspace(1) %arg0117, i64 %61
  %70 = getelementptr bfloat, ptr addrspace(1) %arg0117, i64 %62
  %71 = getelementptr bfloat, ptr addrspace(1) %arg0117, i64 %63
  %72 = getelementptr bfloat, ptr addrspace(1) %arg0117, i64 %64
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
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %80, ptr addrspace(1) %65, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %85, ptr addrspace(1) %66, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %90, ptr addrspace(1) %67, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %95, ptr addrspace(1) %68, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %100, ptr addrspace(1) %69, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %105, ptr addrspace(1) %70, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %110, ptr addrspace(1) %71, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %115, ptr addrspace(1) %72, i32 16) #10
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #10
  %116 = getelementptr bfloat, ptr addrspace(1) %arg0117, i64 %41
  %117 = getelementptr bfloat, ptr addrspace(1) %116, i64 %56
  %118 = getelementptr i8, ptr addrspace(1) %117, i64 256
  %119 = getelementptr bfloat, ptr addrspace(1) %arg0117, i64 %42
  %120 = getelementptr bfloat, ptr addrspace(1) %119, i64 %56
  %121 = getelementptr i8, ptr addrspace(1) %120, i64 256
  %122 = getelementptr bfloat, ptr addrspace(1) %arg0117, i64 %43
  %123 = getelementptr bfloat, ptr addrspace(1) %122, i64 %56
  %124 = getelementptr i8, ptr addrspace(1) %123, i64 256
  %125 = getelementptr bfloat, ptr addrspace(1) %arg0117, i64 %44
  %126 = getelementptr bfloat, ptr addrspace(1) %125, i64 %56
  %127 = getelementptr i8, ptr addrspace(1) %126, i64 256
  %128 = getelementptr bfloat, ptr addrspace(1) %arg0117, i64 %45
  %129 = getelementptr bfloat, ptr addrspace(1) %128, i64 %56
  %130 = getelementptr i8, ptr addrspace(1) %129, i64 256
  %131 = getelementptr bfloat, ptr addrspace(1) %arg0117, i64 %46
  %132 = getelementptr bfloat, ptr addrspace(1) %131, i64 %56
  %133 = getelementptr i8, ptr addrspace(1) %132, i64 256
  %134 = getelementptr bfloat, ptr addrspace(1) %arg0117, i64 %47
  %135 = getelementptr bfloat, ptr addrspace(1) %134, i64 %56
  %136 = getelementptr i8, ptr addrspace(1) %135, i64 256
  %137 = getelementptr bfloat, ptr addrspace(1) %arg0117, i64 %48
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
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %140, ptr addrspace(1) %118, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %141, ptr addrspace(1) %121, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %142, ptr addrspace(1) %124, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %143, ptr addrspace(1) %127, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %144, ptr addrspace(1) %130, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %145, ptr addrspace(1) %133, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %146, ptr addrspace(1) %136, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %147, ptr addrspace(1) %139, i32 16) #10
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #10
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
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %156, ptr addrspace(1) %148, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %157, ptr addrspace(1) %149, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %158, ptr addrspace(1) %150, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %159, ptr addrspace(1) %151, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %160, ptr addrspace(1) %152, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %161, ptr addrspace(1) %153, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %162, ptr addrspace(1) %154, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %163, ptr addrspace(1) %155, i32 16) #10
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #10
  tail call void asm sideeffect "cp.async.wait_group 0x2;", ""() #10
  tail call void @llvm.nvvm.barrier0()
  %164 = select i1 %50, i32 0, i32 136
  %165 = select i1 %52, i32 0, i32 272
  %166 = or disjoint i32 %164, %165
  %167 = select i1 %.not5, i32 0, i32 544
  %168 = shl nuw nsw i32 %10, 7
  %169 = and i32 %168, 1024
  %170 = or disjoint i32 %167, %169
  %171 = or disjoint i32 %170, %166
  %172 = lshr exact i32 %11, 1
  %173 = xor i32 %171, %172
  %174 = select i1 %15, i32 0, i32 2048
  %175 = or disjoint i32 %173, %174
  %176 = zext nneg i32 %175 to i64
  %177 = or disjoint i32 %164, 16
  %178 = xor i32 %177, %165
  %179 = or disjoint i32 %169, %178
  %180 = or disjoint i32 %179, %167
  %181 = or disjoint i32 %174, %172
  %182 = xor i32 %181, %180
  %183 = zext nneg i32 %182 to i64
  %184 = or disjoint i32 %166, 32
  %185 = xor i32 %184, %167
  %186 = or disjoint i32 %185, %169
  %187 = xor i32 %181, %186
  %188 = zext nneg i32 %187 to i64
  %189 = or disjoint i32 %164, 48
  %190 = or disjoint i32 %167, %165
  %191 = xor i32 %190, %189
  %192 = or disjoint i32 %191, %169
  %193 = xor i32 %181, %192
  %194 = zext nneg i32 %193 to i64
  %195 = or disjoint i32 %171, 64
  %196 = xor i32 %181, %195
  %197 = zext nneg i32 %196 to i64
  %198 = or disjoint i32 %164, 80
  %199 = xor i32 %198, %165
  %200 = or disjoint i32 %169, %199
  %201 = or disjoint i32 %200, %167
  %202 = xor i32 %181, %201
  %203 = zext nneg i32 %202 to i64
  %204 = or disjoint i32 %166, 96
  %205 = xor i32 %204, %167
  %206 = or disjoint i32 %205, %169
  %207 = xor i32 %181, %206
  %208 = zext nneg i32 %207 to i64
  %209 = or disjoint i32 %164, 112
  %210 = xor i32 %190, %209
  %211 = or disjoint i32 %210, %169
  %212 = xor i32 %181, %211
  %213 = zext nneg i32 %212 to i64
  %214 = or disjoint i32 %171, 4096
  %215 = xor i32 %181, %214
  %216 = zext nneg i32 %215 to i64
  %217 = or disjoint i32 %164, 4112
  %218 = xor i32 %217, %165
  %219 = or disjoint i32 %169, %218
  %220 = or disjoint i32 %219, %167
  %221 = xor i32 %181, %220
  %222 = zext nneg i32 %221 to i64
  %223 = or disjoint i32 %166, 4128
  %224 = xor i32 %223, %167
  %225 = or disjoint i32 %224, %169
  %226 = xor i32 %181, %225
  %227 = zext nneg i32 %226 to i64
  %228 = or disjoint i32 %164, 4144
  %229 = xor i32 %190, %228
  %230 = or disjoint i32 %229, %169
  %231 = xor i32 %181, %230
  %232 = zext nneg i32 %231 to i64
  %233 = or disjoint i32 %171, 4160
  %234 = xor i32 %181, %233
  %235 = zext nneg i32 %234 to i64
  %236 = or disjoint i32 %164, 4176
  %237 = xor i32 %236, %165
  %238 = or disjoint i32 %169, %237
  %239 = or disjoint i32 %238, %167
  %240 = xor i32 %181, %239
  %241 = zext nneg i32 %240 to i64
  %242 = or disjoint i32 %166, 4192
  %243 = xor i32 %242, %167
  %244 = or disjoint i32 %243, %169
  %245 = xor i32 %181, %244
  %246 = zext nneg i32 %245 to i64
  %247 = or disjoint i32 %164, 4208
  %248 = xor i32 %190, %247
  %249 = or disjoint i32 %248, %169
  %250 = xor i32 %181, %249
  %251 = zext nneg i32 %250 to i64
  %252 = trunc i32 %10 to i4
  %253 = zext i4 %252 to i64
  %254 = shl nuw nsw i64 %253, 4
  %255 = add i32 %16, %14
  %256 = add i32 %255, 56
  %257 = zext nneg i32 %256 to i64
  %258 = add i64 %9, %257
  %259 = shl nsw i64 %258, 12
  %260 = add nuw nsw i64 %259, 768
  %scevgep = getelementptr i8, ptr addrspace(1) %arg0117, i64 %260
  %261 = add i32 %255, 48
  %262 = zext nneg i32 %261 to i64
  %263 = add i64 %9, %262
  %264 = shl nsw i64 %263, 12
  %265 = add nuw nsw i64 %264, 768
  %scevgep123 = getelementptr i8, ptr addrspace(1) %arg0117, i64 %265
  %266 = add i32 %255, 40
  %267 = zext nneg i32 %266 to i64
  %268 = add i64 %9, %267
  %269 = shl nsw i64 %268, 12
  %270 = add nuw nsw i64 %269, 768
  %scevgep127 = getelementptr i8, ptr addrspace(1) %arg0117, i64 %270
  %271 = add i32 %255, 32
  %272 = zext nneg i32 %271 to i64
  %273 = add i64 %9, %272
  %274 = shl nsw i64 %273, 12
  %275 = add nuw nsw i64 %274, 768
  %scevgep131 = getelementptr i8, ptr addrspace(1) %arg0117, i64 %275
  %276 = add i32 %255, 24
  %277 = zext nneg i32 %276 to i64
  %278 = add i64 %9, %277
  %279 = shl nsw i64 %278, 12
  %280 = add nuw nsw i64 %279, 768
  %scevgep135 = getelementptr i8, ptr addrspace(1) %arg0117, i64 %280
  %281 = add i32 %255, 16
  %282 = zext nneg i32 %281 to i64
  %283 = add i64 %9, %282
  %284 = shl nsw i64 %283, 12
  %285 = add nuw nsw i64 %284, 768
  %scevgep139 = getelementptr i8, ptr addrspace(1) %arg0117, i64 %285
  %286 = add i32 %255, 8
  %287 = zext nneg i32 %286 to i64
  %288 = add i64 %9, %287
  %289 = shl nsw i64 %288, 12
  %290 = add nuw nsw i64 %289, 768
  %scevgep143 = getelementptr i8, ptr addrspace(1) %arg0117, i64 %290
  %291 = zext nneg i32 %255 to i64
  %292 = add i64 %9, %291
  %293 = shl nsw i64 %292, 12
  %294 = add nuw nsw i64 %293, 768
  %scevgep147 = getelementptr i8, ptr addrspace(1) %arg0117, i64 %294
  br label %295

295:                                              ; preds = %0, %295
  %lsr.iv151 = phi i32 [ -128, %0 ], [ %300, %295 ]
  %lsr.iv148 = phi ptr addrspace(1) [ %scevgep147, %0 ], [ %scevgep149, %295 ]
  %lsr.iv144 = phi ptr addrspace(1) [ %scevgep143, %0 ], [ %scevgep145, %295 ]
  %lsr.iv140 = phi ptr addrspace(1) [ %scevgep139, %0 ], [ %scevgep141, %295 ]
  %lsr.iv136 = phi ptr addrspace(1) [ %scevgep135, %0 ], [ %scevgep137, %295 ]
  %lsr.iv132 = phi ptr addrspace(1) [ %scevgep131, %0 ], [ %scevgep133, %295 ]
  %lsr.iv128 = phi ptr addrspace(1) [ %scevgep127, %0 ], [ %scevgep129, %295 ]
  %lsr.iv124 = phi ptr addrspace(1) [ %scevgep123, %0 ], [ %scevgep125, %295 ]
  %lsr.iv = phi ptr addrspace(1) [ %scevgep, %0 ], [ %scevgep121, %295 ]
  %296 = phi ptr addrspace(3) [ @global_smem, %0 ], [ %642, %295 ]
  %297 = phi i32 [ 0, %0 ], [ %639, %295 ]
  %298 = phi i32 [ 2, %0 ], [ %624, %295 ]
  %299 = phi { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } [ zeroinitializer, %0 ], [ %621, %295 ]
  %300 = add i32 %lsr.iv151, 128
  %301 = icmp samesign ult i32 %300, 1664
  %302 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %296, i64 %176
  %303 = ptrtoint ptr addrspace(3) %302 to i64
  %304 = trunc i64 %303 to i32
  %305 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %304) #10
  %306 = extractvalue { i32, i32, i32, i32 } %305, 0
  %307 = extractvalue { i32, i32, i32, i32 } %305, 1
  %308 = extractvalue { i32, i32, i32, i32 } %305, 2
  %309 = extractvalue { i32, i32, i32, i32 } %305, 3
  %310 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %296, i64 %183
  %311 = ptrtoint ptr addrspace(3) %310 to i64
  %312 = trunc i64 %311 to i32
  %313 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %312) #10
  %314 = extractvalue { i32, i32, i32, i32 } %313, 0
  %315 = extractvalue { i32, i32, i32, i32 } %313, 1
  %316 = extractvalue { i32, i32, i32, i32 } %313, 2
  %317 = extractvalue { i32, i32, i32, i32 } %313, 3
  %318 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %296, i64 %188
  %319 = ptrtoint ptr addrspace(3) %318 to i64
  %320 = trunc i64 %319 to i32
  %321 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %320) #10
  %322 = extractvalue { i32, i32, i32, i32 } %321, 0
  %323 = extractvalue { i32, i32, i32, i32 } %321, 1
  %324 = extractvalue { i32, i32, i32, i32 } %321, 2
  %325 = extractvalue { i32, i32, i32, i32 } %321, 3
  %326 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %296, i64 %194
  %327 = ptrtoint ptr addrspace(3) %326 to i64
  %328 = trunc i64 %327 to i32
  %329 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %328) #10
  %330 = extractvalue { i32, i32, i32, i32 } %329, 0
  %331 = extractvalue { i32, i32, i32, i32 } %329, 1
  %332 = extractvalue { i32, i32, i32, i32 } %329, 2
  %333 = extractvalue { i32, i32, i32, i32 } %329, 3
  %334 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %296, i64 %197
  %335 = ptrtoint ptr addrspace(3) %334 to i64
  %336 = trunc i64 %335 to i32
  %337 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %336) #10
  %338 = extractvalue { i32, i32, i32, i32 } %337, 0
  %339 = extractvalue { i32, i32, i32, i32 } %337, 1
  %340 = extractvalue { i32, i32, i32, i32 } %337, 2
  %341 = extractvalue { i32, i32, i32, i32 } %337, 3
  %342 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %296, i64 %203
  %343 = ptrtoint ptr addrspace(3) %342 to i64
  %344 = trunc i64 %343 to i32
  %345 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %344) #10
  %346 = extractvalue { i32, i32, i32, i32 } %345, 0
  %347 = extractvalue { i32, i32, i32, i32 } %345, 1
  %348 = extractvalue { i32, i32, i32, i32 } %345, 2
  %349 = extractvalue { i32, i32, i32, i32 } %345, 3
  %350 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %296, i64 %208
  %351 = ptrtoint ptr addrspace(3) %350 to i64
  %352 = trunc i64 %351 to i32
  %353 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %352) #10
  %354 = extractvalue { i32, i32, i32, i32 } %353, 0
  %355 = extractvalue { i32, i32, i32, i32 } %353, 1
  %356 = extractvalue { i32, i32, i32, i32 } %353, 2
  %357 = extractvalue { i32, i32, i32, i32 } %353, 3
  %358 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %296, i64 %213
  %359 = ptrtoint ptr addrspace(3) %358 to i64
  %360 = trunc i64 %359 to i32
  %361 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %360) #10
  %362 = extractvalue { i32, i32, i32, i32 } %361, 0
  %363 = extractvalue { i32, i32, i32, i32 } %361, 1
  %364 = extractvalue { i32, i32, i32, i32 } %361, 2
  %365 = extractvalue { i32, i32, i32, i32 } %361, 3
  %366 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %296, i64 %216
  %367 = ptrtoint ptr addrspace(3) %366 to i64
  %368 = trunc i64 %367 to i32
  %369 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %368) #10
  %370 = extractvalue { i32, i32, i32, i32 } %369, 0
  %371 = extractvalue { i32, i32, i32, i32 } %369, 1
  %372 = extractvalue { i32, i32, i32, i32 } %369, 2
  %373 = extractvalue { i32, i32, i32, i32 } %369, 3
  %374 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %296, i64 %222
  %375 = ptrtoint ptr addrspace(3) %374 to i64
  %376 = trunc i64 %375 to i32
  %377 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %376) #10
  %378 = extractvalue { i32, i32, i32, i32 } %377, 0
  %379 = extractvalue { i32, i32, i32, i32 } %377, 1
  %380 = extractvalue { i32, i32, i32, i32 } %377, 2
  %381 = extractvalue { i32, i32, i32, i32 } %377, 3
  %382 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %296, i64 %227
  %383 = ptrtoint ptr addrspace(3) %382 to i64
  %384 = trunc i64 %383 to i32
  %385 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %384) #10
  %386 = extractvalue { i32, i32, i32, i32 } %385, 0
  %387 = extractvalue { i32, i32, i32, i32 } %385, 1
  %388 = extractvalue { i32, i32, i32, i32 } %385, 2
  %389 = extractvalue { i32, i32, i32, i32 } %385, 3
  %390 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %296, i64 %232
  %391 = ptrtoint ptr addrspace(3) %390 to i64
  %392 = trunc i64 %391 to i32
  %393 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %392) #10
  %394 = extractvalue { i32, i32, i32, i32 } %393, 0
  %395 = extractvalue { i32, i32, i32, i32 } %393, 1
  %396 = extractvalue { i32, i32, i32, i32 } %393, 2
  %397 = extractvalue { i32, i32, i32, i32 } %393, 3
  %398 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %296, i64 %235
  %399 = ptrtoint ptr addrspace(3) %398 to i64
  %400 = trunc i64 %399 to i32
  %401 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %400) #10
  %402 = extractvalue { i32, i32, i32, i32 } %401, 0
  %403 = extractvalue { i32, i32, i32, i32 } %401, 1
  %404 = extractvalue { i32, i32, i32, i32 } %401, 2
  %405 = extractvalue { i32, i32, i32, i32 } %401, 3
  %406 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %296, i64 %241
  %407 = ptrtoint ptr addrspace(3) %406 to i64
  %408 = trunc i64 %407 to i32
  %409 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %408) #10
  %410 = extractvalue { i32, i32, i32, i32 } %409, 0
  %411 = extractvalue { i32, i32, i32, i32 } %409, 1
  %412 = extractvalue { i32, i32, i32, i32 } %409, 2
  %413 = extractvalue { i32, i32, i32, i32 } %409, 3
  %414 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %296, i64 %246
  %415 = ptrtoint ptr addrspace(3) %414 to i64
  %416 = trunc i64 %415 to i32
  %417 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %416) #10
  %418 = extractvalue { i32, i32, i32, i32 } %417, 0
  %419 = extractvalue { i32, i32, i32, i32 } %417, 1
  %420 = extractvalue { i32, i32, i32, i32 } %417, 2
  %421 = extractvalue { i32, i32, i32, i32 } %417, 3
  %422 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %296, i64 %251
  %423 = ptrtoint ptr addrspace(3) %422 to i64
  %424 = trunc i64 %423 to i32
  %425 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %424) #10
  %426 = extractvalue { i32, i32, i32, i32 } %425, 0
  %427 = extractvalue { i32, i32, i32, i32 } %425, 1
  %428 = extractvalue { i32, i32, i32, i32 } %425, 2
  %429 = extractvalue { i32, i32, i32, i32 } %425, 3
  %430 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %299, 0
  %431 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %299, 1
  %432 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %299, 2
  %433 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %299, 3
  %434 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %299, 4
  %435 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %299, 5
  %436 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %299, 6
  %437 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %299, 7
  %438 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %299, 8
  %439 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %299, 9
  %440 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %299, 10
  %441 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %299, 11
  %442 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %299, 12
  %443 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %299, 13
  %444 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %299, 14
  %445 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %299, 15
  %446 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %430, float %431, float %432, float %433, i32 %306, i32 %307, i32 %308, i32 %309, i32 0, i32 0) #10
  %447 = extractvalue { float, float, float, float } %446, 0
  %448 = extractvalue { float, float, float, float } %446, 1
  %449 = extractvalue { float, float, float, float } %446, 2
  %450 = extractvalue { float, float, float, float } %446, 3
  %451 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %434, float %435, float %436, float %437, i32 %306, i32 %307, i32 %308, i32 %309, i32 0, i32 0) #10
  %452 = extractvalue { float, float, float, float } %451, 0
  %453 = extractvalue { float, float, float, float } %451, 1
  %454 = extractvalue { float, float, float, float } %451, 2
  %455 = extractvalue { float, float, float, float } %451, 3
  %456 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %438, float %439, float %440, float %441, i32 %370, i32 %371, i32 %372, i32 %373, i32 0, i32 0) #10
  %457 = extractvalue { float, float, float, float } %456, 0
  %458 = extractvalue { float, float, float, float } %456, 1
  %459 = extractvalue { float, float, float, float } %456, 2
  %460 = extractvalue { float, float, float, float } %456, 3
  %461 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %442, float %443, float %444, float %445, i32 %370, i32 %371, i32 %372, i32 %373, i32 0, i32 0) #10
  %462 = extractvalue { float, float, float, float } %461, 0
  %463 = extractvalue { float, float, float, float } %461, 1
  %464 = extractvalue { float, float, float, float } %461, 2
  %465 = extractvalue { float, float, float, float } %461, 3
  %466 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %447, float %448, float %449, float %450, i32 %314, i32 %315, i32 %316, i32 %317, i32 0, i32 0) #10
  %467 = extractvalue { float, float, float, float } %466, 0
  %468 = extractvalue { float, float, float, float } %466, 1
  %469 = extractvalue { float, float, float, float } %466, 2
  %470 = extractvalue { float, float, float, float } %466, 3
  %471 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %452, float %453, float %454, float %455, i32 %314, i32 %315, i32 %316, i32 %317, i32 0, i32 0) #10
  %472 = extractvalue { float, float, float, float } %471, 0
  %473 = extractvalue { float, float, float, float } %471, 1
  %474 = extractvalue { float, float, float, float } %471, 2
  %475 = extractvalue { float, float, float, float } %471, 3
  %476 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %457, float %458, float %459, float %460, i32 %378, i32 %379, i32 %380, i32 %381, i32 0, i32 0) #10
  %477 = extractvalue { float, float, float, float } %476, 0
  %478 = extractvalue { float, float, float, float } %476, 1
  %479 = extractvalue { float, float, float, float } %476, 2
  %480 = extractvalue { float, float, float, float } %476, 3
  %481 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %462, float %463, float %464, float %465, i32 %378, i32 %379, i32 %380, i32 %381, i32 0, i32 0) #10
  %482 = extractvalue { float, float, float, float } %481, 0
  %483 = extractvalue { float, float, float, float } %481, 1
  %484 = extractvalue { float, float, float, float } %481, 2
  %485 = extractvalue { float, float, float, float } %481, 3
  %486 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %467, float %468, float %469, float %470, i32 %322, i32 %323, i32 %324, i32 %325, i32 0, i32 0) #10
  %487 = extractvalue { float, float, float, float } %486, 0
  %488 = extractvalue { float, float, float, float } %486, 1
  %489 = extractvalue { float, float, float, float } %486, 2
  %490 = extractvalue { float, float, float, float } %486, 3
  %491 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %472, float %473, float %474, float %475, i32 %322, i32 %323, i32 %324, i32 %325, i32 0, i32 0) #10
  %492 = extractvalue { float, float, float, float } %491, 0
  %493 = extractvalue { float, float, float, float } %491, 1
  %494 = extractvalue { float, float, float, float } %491, 2
  %495 = extractvalue { float, float, float, float } %491, 3
  %496 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %477, float %478, float %479, float %480, i32 %386, i32 %387, i32 %388, i32 %389, i32 0, i32 0) #10
  %497 = extractvalue { float, float, float, float } %496, 0
  %498 = extractvalue { float, float, float, float } %496, 1
  %499 = extractvalue { float, float, float, float } %496, 2
  %500 = extractvalue { float, float, float, float } %496, 3
  %501 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %482, float %483, float %484, float %485, i32 %386, i32 %387, i32 %388, i32 %389, i32 0, i32 0) #10
  %502 = extractvalue { float, float, float, float } %501, 0
  %503 = extractvalue { float, float, float, float } %501, 1
  %504 = extractvalue { float, float, float, float } %501, 2
  %505 = extractvalue { float, float, float, float } %501, 3
  %506 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %487, float %488, float %489, float %490, i32 %330, i32 %331, i32 %332, i32 %333, i32 0, i32 0) #10
  %507 = extractvalue { float, float, float, float } %506, 0
  %508 = extractvalue { float, float, float, float } %506, 1
  %509 = extractvalue { float, float, float, float } %506, 2
  %510 = extractvalue { float, float, float, float } %506, 3
  %511 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %492, float %493, float %494, float %495, i32 %330, i32 %331, i32 %332, i32 %333, i32 0, i32 0) #10
  %512 = extractvalue { float, float, float, float } %511, 0
  %513 = extractvalue { float, float, float, float } %511, 1
  %514 = extractvalue { float, float, float, float } %511, 2
  %515 = extractvalue { float, float, float, float } %511, 3
  %516 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %497, float %498, float %499, float %500, i32 %394, i32 %395, i32 %396, i32 %397, i32 0, i32 0) #10
  %517 = extractvalue { float, float, float, float } %516, 0
  %518 = extractvalue { float, float, float, float } %516, 1
  %519 = extractvalue { float, float, float, float } %516, 2
  %520 = extractvalue { float, float, float, float } %516, 3
  %521 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %502, float %503, float %504, float %505, i32 %394, i32 %395, i32 %396, i32 %397, i32 0, i32 0) #10
  %522 = extractvalue { float, float, float, float } %521, 0
  %523 = extractvalue { float, float, float, float } %521, 1
  %524 = extractvalue { float, float, float, float } %521, 2
  %525 = extractvalue { float, float, float, float } %521, 3
  %526 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %507, float %508, float %509, float %510, i32 %338, i32 %339, i32 %340, i32 %341, i32 0, i32 0) #10
  %527 = extractvalue { float, float, float, float } %526, 0
  %528 = extractvalue { float, float, float, float } %526, 1
  %529 = extractvalue { float, float, float, float } %526, 2
  %530 = extractvalue { float, float, float, float } %526, 3
  %531 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %512, float %513, float %514, float %515, i32 %338, i32 %339, i32 %340, i32 %341, i32 0, i32 0) #10
  %532 = extractvalue { float, float, float, float } %531, 0
  %533 = extractvalue { float, float, float, float } %531, 1
  %534 = extractvalue { float, float, float, float } %531, 2
  %535 = extractvalue { float, float, float, float } %531, 3
  %536 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %517, float %518, float %519, float %520, i32 %402, i32 %403, i32 %404, i32 %405, i32 0, i32 0) #10
  %537 = extractvalue { float, float, float, float } %536, 0
  %538 = extractvalue { float, float, float, float } %536, 1
  %539 = extractvalue { float, float, float, float } %536, 2
  %540 = extractvalue { float, float, float, float } %536, 3
  %541 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %522, float %523, float %524, float %525, i32 %402, i32 %403, i32 %404, i32 %405, i32 0, i32 0) #10
  %542 = extractvalue { float, float, float, float } %541, 0
  %543 = extractvalue { float, float, float, float } %541, 1
  %544 = extractvalue { float, float, float, float } %541, 2
  %545 = extractvalue { float, float, float, float } %541, 3
  %546 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %527, float %528, float %529, float %530, i32 %346, i32 %347, i32 %348, i32 %349, i32 0, i32 0) #10
  %547 = extractvalue { float, float, float, float } %546, 0
  %548 = extractvalue { float, float, float, float } %546, 1
  %549 = extractvalue { float, float, float, float } %546, 2
  %550 = extractvalue { float, float, float, float } %546, 3
  %551 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %532, float %533, float %534, float %535, i32 %346, i32 %347, i32 %348, i32 %349, i32 0, i32 0) #10
  %552 = extractvalue { float, float, float, float } %551, 0
  %553 = extractvalue { float, float, float, float } %551, 1
  %554 = extractvalue { float, float, float, float } %551, 2
  %555 = extractvalue { float, float, float, float } %551, 3
  %556 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %537, float %538, float %539, float %540, i32 %410, i32 %411, i32 %412, i32 %413, i32 0, i32 0) #10
  %557 = extractvalue { float, float, float, float } %556, 0
  %558 = extractvalue { float, float, float, float } %556, 1
  %559 = extractvalue { float, float, float, float } %556, 2
  %560 = extractvalue { float, float, float, float } %556, 3
  %561 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %542, float %543, float %544, float %545, i32 %410, i32 %411, i32 %412, i32 %413, i32 0, i32 0) #10
  %562 = extractvalue { float, float, float, float } %561, 0
  %563 = extractvalue { float, float, float, float } %561, 1
  %564 = extractvalue { float, float, float, float } %561, 2
  %565 = extractvalue { float, float, float, float } %561, 3
  %566 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %547, float %548, float %549, float %550, i32 %354, i32 %355, i32 %356, i32 %357, i32 0, i32 0) #10
  %567 = extractvalue { float, float, float, float } %566, 0
  %568 = extractvalue { float, float, float, float } %566, 1
  %569 = extractvalue { float, float, float, float } %566, 2
  %570 = extractvalue { float, float, float, float } %566, 3
  %571 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %552, float %553, float %554, float %555, i32 %354, i32 %355, i32 %356, i32 %357, i32 0, i32 0) #10
  %572 = extractvalue { float, float, float, float } %571, 0
  %573 = extractvalue { float, float, float, float } %571, 1
  %574 = extractvalue { float, float, float, float } %571, 2
  %575 = extractvalue { float, float, float, float } %571, 3
  %576 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %557, float %558, float %559, float %560, i32 %418, i32 %419, i32 %420, i32 %421, i32 0, i32 0) #10
  %577 = extractvalue { float, float, float, float } %576, 0
  %578 = extractvalue { float, float, float, float } %576, 1
  %579 = extractvalue { float, float, float, float } %576, 2
  %580 = extractvalue { float, float, float, float } %576, 3
  %581 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %562, float %563, float %564, float %565, i32 %418, i32 %419, i32 %420, i32 %421, i32 0, i32 0) #10
  %582 = extractvalue { float, float, float, float } %581, 0
  %583 = extractvalue { float, float, float, float } %581, 1
  %584 = extractvalue { float, float, float, float } %581, 2
  %585 = extractvalue { float, float, float, float } %581, 3
  %586 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %567, float %568, float %569, float %570, i32 %362, i32 %363, i32 %364, i32 %365, i32 0, i32 0) #10
  %587 = extractvalue { float, float, float, float } %586, 0
  %588 = extractvalue { float, float, float, float } %586, 1
  %589 = extractvalue { float, float, float, float } %586, 2
  %590 = extractvalue { float, float, float, float } %586, 3
  %591 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %572, float %573, float %574, float %575, i32 %362, i32 %363, i32 %364, i32 %365, i32 0, i32 0) #10
  %592 = extractvalue { float, float, float, float } %591, 0
  %593 = extractvalue { float, float, float, float } %591, 1
  %594 = extractvalue { float, float, float, float } %591, 2
  %595 = extractvalue { float, float, float, float } %591, 3
  %596 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %577, float %578, float %579, float %580, i32 %426, i32 %427, i32 %428, i32 %429, i32 0, i32 0) #10
  %597 = extractvalue { float, float, float, float } %596, 0
  %598 = extractvalue { float, float, float, float } %596, 1
  %599 = extractvalue { float, float, float, float } %596, 2
  %600 = extractvalue { float, float, float, float } %596, 3
  %601 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %582, float %583, float %584, float %585, i32 %426, i32 %427, i32 %428, i32 %429, i32 0, i32 0) #10
  %602 = extractvalue { float, float, float, float } %601, 0
  %603 = extractvalue { float, float, float, float } %601, 1
  %604 = extractvalue { float, float, float, float } %601, 2
  %605 = extractvalue { float, float, float, float } %601, 3
  %606 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } undef, float %587, 0
  %607 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %606, float %588, 1
  %608 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %607, float %589, 2
  %609 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %608, float %590, 3
  %610 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %609, float %592, 4
  %611 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %610, float %593, 5
  %612 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %611, float %594, 6
  %613 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %612, float %595, 7
  %614 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %613, float %597, 8
  %615 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %614, float %598, 9
  %616 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %615, float %599, 10
  %617 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %616, float %600, 11
  %618 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %617, float %602, 12
  %619 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %618, float %603, 13
  %620 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %619, float %604, 14
  %621 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %620, float %605, 15
  %622 = add i32 %298, 1
  %623 = icmp slt i32 %622, 3
  %624 = select i1 %623, i32 %622, i32 0
  %scevgep150 = getelementptr i8, ptr addrspace(1) %lsr.iv148, i64 %254
  %scevgep146 = getelementptr i8, ptr addrspace(1) %lsr.iv144, i64 %254
  %scevgep142 = getelementptr i8, ptr addrspace(1) %lsr.iv140, i64 %254
  %scevgep138 = getelementptr i8, ptr addrspace(1) %lsr.iv136, i64 %254
  %scevgep134 = getelementptr i8, ptr addrspace(1) %lsr.iv132, i64 %254
  %scevgep130 = getelementptr i8, ptr addrspace(1) %lsr.iv128, i64 %254
  %scevgep126 = getelementptr i8, ptr addrspace(1) %lsr.iv124, i64 %254
  %scevgep122 = getelementptr i8, ptr addrspace(1) %lsr.iv, i64 %254
  %625 = shl i32 %624, 13
  %626 = sext i32 %625 to i64
  %627 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %626
  tail call void @llvm.nvvm.barrier0()
  %628 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %627, i64 %79
  %629 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %627, i64 %84
  %630 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %627, i64 %89
  %631 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %627, i64 %94
  %632 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %627, i64 %99
  %633 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %627, i64 %104
  %634 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %627, i64 %109
  %635 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %627, i64 %114
  %636 = select i1 %301, i32 16, i32 0
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %628, ptr addrspace(1) %scevgep150, i32 %636) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %629, ptr addrspace(1) %scevgep146, i32 %636) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %630, ptr addrspace(1) %scevgep142, i32 %636) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %631, ptr addrspace(1) %scevgep138, i32 %636) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %632, ptr addrspace(1) %scevgep134, i32 %636) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %633, ptr addrspace(1) %scevgep130, i32 %636) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %634, ptr addrspace(1) %scevgep126, i32 %636) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %635, ptr addrspace(1) %scevgep122, i32 %636) #10
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #10
  %637 = add i32 %297, 1
  %638 = icmp slt i32 %637, 3
  %639 = select i1 %638, i32 %637, i32 0
  tail call void asm sideeffect "cp.async.wait_group 0x2;", ""() #10
  tail call void @llvm.nvvm.barrier0()
  %640 = shl i32 %639, 13
  %641 = sext i32 %640 to i64
  %642 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %641
  %scevgep121 = getelementptr i8, ptr addrspace(1) %lsr.iv, i64 256
  %scevgep125 = getelementptr i8, ptr addrspace(1) %lsr.iv124, i64 256
  %scevgep129 = getelementptr i8, ptr addrspace(1) %lsr.iv128, i64 256
  %scevgep133 = getelementptr i8, ptr addrspace(1) %lsr.iv132, i64 256
  %scevgep137 = getelementptr i8, ptr addrspace(1) %lsr.iv136, i64 256
  %scevgep141 = getelementptr i8, ptr addrspace(1) %lsr.iv140, i64 256
  %scevgep145 = getelementptr i8, ptr addrspace(1) %lsr.iv144, i64 256
  %scevgep149 = getelementptr i8, ptr addrspace(1) %lsr.iv148, i64 256
  %643 = icmp samesign ult i32 %300, 1920
  br i1 %643, label %295, label %644

644:                                              ; preds = %295
  %645 = icmp ult i32 %10, 64
  %646 = and i32 %54, 56
  %647 = mul i32 %2, 8
  %.decomposed = sub i32 %.frozen, %647
  %648 = sdiv i32 %.decomposed, %5
  tail call void asm sideeffect "cp.async.wait_group 0x0;", ""() #10
  tail call void @llvm.nvvm.barrier0()
  %649 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %587) #10
  %650 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %588) #10
  %651 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %589) #10
  %652 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %590) #10
  %653 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %592) #10
  %654 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %593) #10
  %655 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %594) #10
  %656 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %595) #10
  %657 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %597) #10
  %658 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %598) #10
  %659 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %599) #10
  %660 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %600) #10
  %661 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %602) #10
  %662 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %603) #10
  %663 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %604) #10
  %664 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %605) #10
  %665 = shl nsw i32 %648, 5
  %666 = sext i32 %665 to i64
  %667 = zext nneg i32 %646 to i64
  %668 = or disjoint i64 %9, %667
  %669 = lshr i32 %10, 3
  %670 = and i32 %669, 7
  %671 = select i1 %645, i32 0, i32 8
  %672 = or disjoint i32 %670, %671
  %673 = or disjoint i32 %672, 16
  %674 = zext nneg i32 %672 to i64
  %675 = zext nneg i32 %673 to i64
  %676 = or disjoint i64 %666, %674
  %677 = or disjoint i64 %666, %675
  %678 = getelementptr bfloat, ptr addrspace(1) %arg1119, i64 %668
  %.idx = mul nsw i64 %676, 36864
  %679 = getelementptr i8, ptr addrspace(1) %678, i64 %.idx
  %.idx4 = mul nsw i64 %677, 36864
  %680 = getelementptr i8, ptr addrspace(1) %678, i64 %.idx4
  %681 = and i32 %168, 384
  %682 = lshr i32 %10, 2
  %683 = and i32 %682, 3
  %684 = or disjoint i32 %683, %681
  %685 = lshr exact i32 %11, 2
  %686 = or disjoint i32 %684, %685
  %687 = shl nuw nsw i32 %12, 4
  %688 = or disjoint i32 %686, %687
  %689 = select i1 %645, i32 0, i32 16
  %690 = or disjoint i32 %688, %689
  %691 = and i32 %54, 504
  %692 = select i1 %645, i32 0, i32 512
  %693 = or disjoint i32 %691, %692
  %694 = lshr i32 %688, 3
  %695 = add nuw nsw i32 %694, %690
  %696 = zext nneg i32 %695 to i64
  %697 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %696
  %698 = bitcast bfloat %649 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %697, <1 x i16> %698, i1 true) #10
  %699 = or disjoint i32 %690, 64
  %700 = lshr i32 %699, 3
  %701 = and i32 %700, 536870904
  %702 = zext nneg i32 %701 to i64
  %703 = zext nneg i32 %690 to i64
  %704 = add i64 %702, %703
  %705 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %704
  %706 = getelementptr inbounds i8, ptr addrspace(3) %705, i64 128
  %707 = bitcast bfloat %650 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %706, <1 x i16> %707, i1 true) #10
  %708 = zext nneg i32 %694 to i64
  %709 = add i64 %703, %708
  %710 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %709
  %711 = getelementptr inbounds i8, ptr addrspace(3) %710, i64 16
  %712 = bitcast bfloat %651 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %711, <1 x i16> %712, i1 true) #10
  %713 = or disjoint i32 %690, 72
  %714 = lshr i32 %713, 3
  %715 = and i32 %714, 536870904
  %716 = zext nneg i32 %715 to i64
  %717 = add i64 %716, %703
  %718 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %717
  %719 = getelementptr inbounds i8, ptr addrspace(3) %718, i64 144
  %720 = bitcast bfloat %652 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %719, <1 x i16> %720, i1 true) #10
  %721 = getelementptr inbounds i8, ptr addrspace(3) %710, i64 64
  %722 = bitcast bfloat %657 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %721, <1 x i16> %722, i1 true) #10
  %723 = or disjoint i32 %690, 96
  %724 = lshr i32 %723, 3
  %725 = and i32 %724, 536870904
  %726 = zext nneg i32 %725 to i64
  %727 = add i64 %726, %703
  %728 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %727
  %729 = getelementptr inbounds i8, ptr addrspace(3) %728, i64 192
  %730 = bitcast bfloat %658 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %729, <1 x i16> %730, i1 true) #10
  %731 = getelementptr inbounds i8, ptr addrspace(3) %710, i64 80
  %732 = bitcast bfloat %659 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %731, <1 x i16> %732, i1 true) #10
  %733 = or disjoint i32 %690, 104
  %734 = lshr i32 %733, 3
  %735 = and i32 %734, 536870904
  %736 = zext nneg i32 %735 to i64
  %737 = add i64 %736, %703
  %738 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %737
  %739 = getelementptr inbounds i8, ptr addrspace(3) %738, i64 208
  %740 = bitcast bfloat %660 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %739, <1 x i16> %740, i1 true) #10
  tail call void @llvm.nvvm.barrier0()
  %741 = lshr exact i32 %693, 3
  %742 = and i32 %741, 120
  %743 = add nuw nsw i32 %742, %693
  %744 = zext nneg i32 %743 to i64
  %745 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %744
  %746 = load <4 x i32>, ptr addrspace(3) %745, align 16
  tail call void @llvm.nvvm.barrier0()
  %747 = bitcast bfloat %653 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %697, <1 x i16> %747, i1 true) #10
  %748 = bitcast bfloat %654 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %706, <1 x i16> %748, i1 true) #10
  %749 = bitcast bfloat %655 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %711, <1 x i16> %749, i1 true) #10
  %750 = bitcast bfloat %656 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %719, <1 x i16> %750, i1 true) #10
  %751 = bitcast bfloat %661 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %721, <1 x i16> %751, i1 true) #10
  %752 = bitcast bfloat %662 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %729, <1 x i16> %752, i1 true) #10
  %753 = bitcast bfloat %663 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %731, <1 x i16> %753, i1 true) #10
  %754 = bitcast bfloat %664 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %739, <1 x i16> %754, i1 true) #10
  tail call void @llvm.nvvm.barrier0()
  %755 = load <4 x i32>, ptr addrspace(3) %745, align 16
  %.extract = extractelement <4 x i32> %746, i64 0
  %.extract29 = extractelement <4 x i32> %746, i64 1
  %.extract31 = extractelement <4 x i32> %746, i64 2
  %.extract33 = extractelement <4 x i32> %746, i64 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract, i32 %.extract29, i32 %.extract31, i32 %.extract33, ptr addrspace(1) %679) #10
  %.extract35 = extractelement <4 x i32> %755, i64 0
  %.extract37 = extractelement <4 x i32> %755, i64 1
  %.extract39 = extractelement <4 x i32> %755, i64 2
  %.extract41 = extractelement <4 x i32> %755, i64 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract35, i32 %.extract37, i32 %.extract39, i32 %.extract41, ptr addrspace(1) %680) #10
  ret void
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #5

define ptx_kernel void @fusion_230(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(65536) %arg1, ptr noalias align 128 dereferenceable(1179648) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(65536) %arg4) local_unnamed_addr #6 {
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 36864
  %3 = getelementptr i8, ptr addrspace(1) %arg25, i64 %.idx
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
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #10
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
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #10
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
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #10
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #10
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #10
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #10
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #10
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #10
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #10
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #10
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #10
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #10
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #10
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #10
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #10
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #10
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #10
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #10
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #10
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
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #10
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
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #10
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #10
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #10
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #10
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #10
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #10
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #10
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #10
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #10
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #10
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #10
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #10
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #10
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #10
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #10
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #10
  %122 = fadd float %52, %106
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
  %138 = fmul float %122, %122
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
  %154 = fadd float %138, %139
  %155 = fadd float %154, %140
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
  %169 = bitcast float %168 to i32
  %170 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %169, i32 16, i32 31)
  %171 = bitcast i32 %170 to float
  %172 = fadd float %168, %171
  %173 = bitcast float %172 to i32
  %174 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %173, i32 8, i32 31)
  %175 = bitcast i32 %174 to float
  %176 = fadd float %172, %175
  %177 = bitcast float %176 to i32
  %178 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %177, i32 4, i32 31)
  %179 = bitcast i32 %178 to float
  %180 = fadd float %176, %179
  %181 = bitcast float %180 to i32
  %182 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %181, i32 2, i32 31)
  %183 = bitcast i32 %182 to float
  %184 = fadd float %180, %183
  %185 = bitcast float %184 to i32
  %186 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %185, i32 1, i32 31)
  %187 = bitcast i32 %186 to float
  %188 = fadd float %184, %187
  %189 = icmp eq i32 %6, 0
  %190 = zext nneg i32 %7 to i64
  %191 = getelementptr float, ptr addrspace(3) @global_smem, i64 %190
  %192 = bitcast float %188 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %191, <1 x i32> %192, i1 %189) #10
  tail call void @llvm.nvvm.barrier0()
  %193 = icmp samesign ult i32 %5, 2
  %194 = zext nneg i32 %5 to i64
  %195 = getelementptr float, ptr addrspace(3) @global_smem, i64 %194
  %196 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %195, i1 %193) #10
  %197 = bitcast i32 %196 to float
  %198 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %196, i32 1, i32 31)
  %199 = bitcast i32 %198 to float
  %200 = fadd float %197, %199
  %201 = icmp eq i32 %5, 0
  %202 = bitcast float %200 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %195, <1 x i32> %202, i1 %201) #10
  tail call void @llvm.nvvm.barrier0()
  %203 = load float, ptr addrspace(3) @global_smem, align 16
  %204 = fmul float %203, 0x3F50000000000000
  %205 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
  %206 = bitcast i32 %205 to float
  %207 = fadd float %204, %206
  %208 = tail call float @llvm.nvvm.rsqrt.approx.f(float %207)
  %209 = fmul float %122, %208
  %210 = fmul float %123, %208
  %211 = fmul float %124, %208
  %212 = fmul float %125, %208
  %213 = fmul float %126, %208
  %214 = fmul float %127, %208
  %215 = fmul float %128, %208
  %216 = fmul float %129, %208
  %217 = fmul float %130, %208
  %218 = fmul float %131, %208
  %219 = fmul float %132, %208
  %220 = fmul float %133, %208
  %221 = fmul float %134, %208
  %222 = fmul float %135, %208
  %223 = fmul float %136, %208
  %224 = fmul float %137, %208
  %225 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %13
  %226 = getelementptr i8, ptr addrspace(1) %225, i64 1024
  %227 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %225) #10
  %228 = extractvalue { i32, i32, i32, i32 } %227, 0
  %229 = bitcast i32 %228 to <2 x bfloat>
  %230 = extractvalue { i32, i32, i32, i32 } %227, 1
  %231 = bitcast i32 %230 to <2 x bfloat>
  %232 = extractvalue { i32, i32, i32, i32 } %227, 2
  %233 = bitcast i32 %232 to <2 x bfloat>
  %234 = extractvalue { i32, i32, i32, i32 } %227, 3
  %235 = bitcast i32 %234 to <2 x bfloat>
  %236 = extractelement <2 x bfloat> %229, i64 0
  %237 = extractelement <2 x bfloat> %229, i64 1
  %238 = extractelement <2 x bfloat> %231, i64 0
  %239 = extractelement <2 x bfloat> %231, i64 1
  %240 = extractelement <2 x bfloat> %233, i64 0
  %241 = extractelement <2 x bfloat> %233, i64 1
  %242 = extractelement <2 x bfloat> %235, i64 0
  %243 = extractelement <2 x bfloat> %235, i64 1
  %244 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %226) #10
  %245 = extractvalue { i32, i32, i32, i32 } %244, 0
  %246 = bitcast i32 %245 to <2 x bfloat>
  %247 = extractvalue { i32, i32, i32, i32 } %244, 1
  %248 = bitcast i32 %247 to <2 x bfloat>
  %249 = extractvalue { i32, i32, i32, i32 } %244, 2
  %250 = bitcast i32 %249 to <2 x bfloat>
  %251 = extractvalue { i32, i32, i32, i32 } %244, 3
  %252 = bitcast i32 %251 to <2 x bfloat>
  %253 = extractelement <2 x bfloat> %246, i64 0
  %254 = extractelement <2 x bfloat> %246, i64 1
  %255 = extractelement <2 x bfloat> %248, i64 0
  %256 = extractelement <2 x bfloat> %248, i64 1
  %257 = extractelement <2 x bfloat> %250, i64 0
  %258 = extractelement <2 x bfloat> %250, i64 1
  %259 = extractelement <2 x bfloat> %252, i64 0
  %260 = extractelement <2 x bfloat> %252, i64 1
  %261 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %236) #10
  %262 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %237) #10
  %263 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %238) #10
  %264 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %239) #10
  %265 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %240) #10
  %266 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %241) #10
  %267 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242) #10
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #10
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %253) #10
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %254) #10
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %255) #10
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %256) #10
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %257) #10
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %258) #10
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259) #10
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #10
  %277 = fmul float %209, %261
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
  %293 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %277) #10
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
  %309 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %68
  %310 = getelementptr bfloat, ptr addrspace(1) %309, i64 %13
  %311 = getelementptr i8, ptr addrspace(1) %310, i64 1024
  %312 = insertelement <2 x bfloat> poison, bfloat %293, i64 0
  %313 = insertelement <2 x bfloat> %312, bfloat %294, i64 1
  %314 = bitcast <2 x bfloat> %313 to i32
  %315 = insertelement <2 x bfloat> poison, bfloat %295, i64 0
  %316 = insertelement <2 x bfloat> %315, bfloat %296, i64 1
  %317 = bitcast <2 x bfloat> %316 to i32
  %318 = insertelement <2 x bfloat> poison, bfloat %297, i64 0
  %319 = insertelement <2 x bfloat> %318, bfloat %298, i64 1
  %320 = bitcast <2 x bfloat> %319 to i32
  %321 = insertelement <2 x bfloat> poison, bfloat %299, i64 0
  %322 = insertelement <2 x bfloat> %321, bfloat %300, i64 1
  %323 = bitcast <2 x bfloat> %322 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %314, i32 %317, i32 %320, i32 %323, ptr addrspace(1) %310) #10
  %324 = insertelement <2 x bfloat> poison, bfloat %301, i64 0
  %325 = insertelement <2 x bfloat> %324, bfloat %302, i64 1
  %326 = bitcast <2 x bfloat> %325 to i32
  %327 = insertelement <2 x bfloat> poison, bfloat %303, i64 0
  %328 = insertelement <2 x bfloat> %327, bfloat %304, i64 1
  %329 = bitcast <2 x bfloat> %328 to i32
  %330 = insertelement <2 x bfloat> poison, bfloat %305, i64 0
  %331 = insertelement <2 x bfloat> %330, bfloat %306, i64 1
  %332 = bitcast <2 x bfloat> %331 to i32
  %333 = insertelement <2 x bfloat> poison, bfloat %307, i64 0
  %334 = insertelement <2 x bfloat> %333, bfloat %308, i64 1
  %335 = bitcast <2 x bfloat> %334 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %326, i32 %329, i32 %332, i32 %335, ptr addrspace(1) %311) #10
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_convert_fusion(ptr noalias readonly align 128 captures(none) dereferenceable(393216) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(196608) %1) local_unnamed_addr #0 {
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

define ptx_kernel void @fusion_231(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(1179648) %arg3, ptr noalias align 128 dereferenceable(65536) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5) local_unnamed_addr #6 {
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 36864
  %3 = getelementptr i8, ptr addrspace(1) %arg37, i64 %.idx
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
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #10
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
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #10
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
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #10
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #10
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #10
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #10
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #10
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #10
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #10
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #10
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #10
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #10
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #10
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #10
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #10
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #10
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #10
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #10
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #10
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
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #10
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
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #10
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #10
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #10
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #10
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #10
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #10
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #10
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #10
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #10
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #10
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #10
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #10
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #10
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #10
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #10
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #10
  %122 = getelementptr i8, ptr addrspace(1) %3, i64 34816
  %123 = getelementptr i8, ptr addrspace(1) %14, i64 34816
  %124 = getelementptr bfloat, ptr addrspace(1) %122, i64 %13
  %125 = getelementptr i8, ptr addrspace(1) %124, i64 1024
  %126 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #10
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
  %143 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #10
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
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #10
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #10
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #10
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #10
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #10
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #10
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #10
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #10
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #10
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #10
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #10
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #10
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #10
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #10
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #10
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #10
  %176 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %68
  %177 = getelementptr bfloat, ptr addrspace(1) %176, i64 %13
  %178 = getelementptr i8, ptr addrspace(1) %177, i64 1024
  %179 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %177) #10
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
  %196 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %178) #10
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
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #10
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #10
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #10
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #10
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #10
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #10
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194) #10
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #10
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #10
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #10
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #10
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #10
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #10
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #10
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211) #10
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212) #10
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %330, <1 x i32> %331, i1 %328) #10
  tail call void @llvm.nvvm.barrier0()
  %332 = icmp samesign ult i32 %5, 2
  %333 = zext nneg i32 %5 to i64
  %334 = getelementptr float, ptr addrspace(3) @global_smem, i64 %333
  %335 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %334, i1 %332) #10
  %336 = bitcast i32 %335 to float
  %337 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %335, i32 1, i32 31)
  %338 = bitcast i32 %337 to float
  %339 = fadd float %336, %338
  %340 = icmp eq i32 %5, 0
  %341 = bitcast float %339 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %334, <1 x i32> %341, i1 %340) #10
  tail call void @llvm.nvvm.barrier0()
  %342 = load float, ptr addrspace(3) @global_smem, align 16
  %343 = fmul float %342, 0x3F50000000000000
  %344 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
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
  %366 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %364) #10
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
  %383 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %365) #10
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
  %400 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %375) #10
  %401 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %376) #10
  %402 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %377) #10
  %403 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %378) #10
  %404 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %379) #10
  %405 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %380) #10
  %406 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %381) #10
  %407 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %382) #10
  %408 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %392) #10
  %409 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %393) #10
  %410 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %394) #10
  %411 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %395) #10
  %412 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %396) #10
  %413 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %397) #10
  %414 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %398) #10
  %415 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %399) #10
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
  %432 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %416) #10
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %453, i32 %456, i32 %459, i32 %462, ptr addrspace(1) %449) #10
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %465, i32 %468, i32 %471, i32 %474, ptr addrspace(1) %450) #10
  ret void
}

define ptx_kernel void @fusion_232(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(1179648) %arg3, ptr noalias align 128 dereferenceable(65536) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5, ptr noalias align 128 dereferenceable(65536) %arg6) local_unnamed_addr #6 {
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 36864
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
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #10
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
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #10
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
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #10
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #10
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #10
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #10
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #10
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #10
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #10
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #10
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #10
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #10
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #10
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #10
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #10
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #10
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #10
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #10
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #10
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
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #10
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
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #10
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #10
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #10
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #10
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #10
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #10
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #10
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #10
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #10
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #10
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #10
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #10
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #10
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #10
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #10
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #10
  %122 = getelementptr i8, ptr addrspace(1) %3, i64 32768
  %123 = getelementptr i8, ptr addrspace(1) %14, i64 32768
  %124 = getelementptr bfloat, ptr addrspace(1) %122, i64 %13
  %125 = getelementptr i8, ptr addrspace(1) %124, i64 1024
  %126 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #10
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
  %143 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #10
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
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #10
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #10
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #10
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #10
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #10
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #10
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #10
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #10
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #10
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #10
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #10
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #10
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #10
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #10
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #10
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #10
  %176 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %68
  %177 = getelementptr bfloat, ptr addrspace(1) %176, i64 %13
  %178 = getelementptr i8, ptr addrspace(1) %177, i64 1024
  %179 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %177) #10
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
  %196 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %178) #10
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
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #10
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #10
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #10
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #10
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #10
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #10
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194) #10
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #10
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #10
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #10
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #10
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #10
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #10
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #10
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211) #10
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212) #10
  %229 = getelementptr i8, ptr addrspace(1) %3, i64 34816
  %230 = getelementptr i8, ptr addrspace(1) %14, i64 34816
  %231 = getelementptr bfloat, ptr addrspace(1) %229, i64 %13
  %232 = getelementptr i8, ptr addrspace(1) %231, i64 1024
  %233 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %230) #10
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
  %250 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %232) #10
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
  %267 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242) #10
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #10
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244) #10
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245) #10
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246) #10
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %247) #10
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %248) #10
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %249) #10
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259) #10
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #10
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #10
  %278 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262) #10
  %279 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %263) #10
  %280 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %264) #10
  %281 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %265) #10
  %282 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %266) #10
  %283 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %68
  %284 = getelementptr bfloat, ptr addrspace(1) %283, i64 %13
  %285 = getelementptr i8, ptr addrspace(1) %284, i64 1024
  %286 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %284) #10
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
  %303 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %285) #10
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
  %320 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295) #10
  %321 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296) #10
  %322 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297) #10
  %323 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298) #10
  %324 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299) #10
  %325 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300) #10
  %326 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %301) #10
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %302) #10
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %312) #10
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313) #10
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314) #10
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315) #10
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316) #10
  %333 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317) #10
  %334 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %318) #10
  %335 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %319) #10
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %469, <1 x i32> %470, i1 %467) #10
  tail call void @llvm.nvvm.barrier0()
  %471 = icmp samesign ult i32 %5, 2
  %472 = zext nneg i32 %5 to i64
  %473 = getelementptr float, ptr addrspace(3) @global_smem, i64 %472
  %474 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %473, i1 %471) #10
  %475 = bitcast i32 %474 to float
  %476 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %474, i32 1, i32 31)
  %477 = bitcast i32 %476 to float
  %478 = fadd float %475, %477
  %479 = icmp eq i32 %5, 0
  %480 = bitcast float %478 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %473, <1 x i32> %480, i1 %479) #10
  tail call void @llvm.nvvm.barrier0()
  %481 = load float, ptr addrspace(3) @global_smem, align 16
  %482 = fmul float %481, 0x3F50000000000000
  %483 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
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
  %505 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %503) #10
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
  %522 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %504) #10
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
  %539 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %514) #10
  %540 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %515) #10
  %541 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %516) #10
  %542 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %517) #10
  %543 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %518) #10
  %544 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %519) #10
  %545 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %520) #10
  %546 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %521) #10
  %547 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %531) #10
  %548 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %532) #10
  %549 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %533) #10
  %550 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %534) #10
  %551 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %535) #10
  %552 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %536) #10
  %553 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %537) #10
  %554 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %538) #10
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
  %571 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %555) #10
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %592, i32 %595, i32 %598, i32 %601, ptr addrspace(1) %588) #10
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %604, i32 %607, i32 %610, i32 %613, ptr addrspace(1) %589) #10
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_add_fusion(ptr noalias readonly align 128 captures(none) dereferenceable(1179648) %0, ptr noalias readonly align 128 captures(none) dereferenceable(65536) %1, ptr noalias readonly align 128 captures(none) dereferenceable(65536) %2, ptr noalias readonly align 128 captures(none) dereferenceable(65536) %3, ptr noalias readonly align 128 captures(none) dereferenceable(65536) %4, ptr noalias writeonly align 128 captures(none) dereferenceable(131072) %5) local_unnamed_addr #0 {
  %7 = addrspacecast ptr %5 to ptr addrspace(1)
  %8 = addrspacecast ptr %4 to ptr addrspace(1)
  %9 = addrspacecast ptr %3 to ptr addrspace(1)
  %10 = addrspacecast ptr %2 to ptr addrspace(1)
  %11 = addrspacecast ptr %1 to ptr addrspace(1)
  %12 = addrspacecast ptr %0 to ptr addrspace(1)
  %13 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %14 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %15 = lshr i32 %14, 3
  %16 = shl nuw nsw i32 %14, 7
  %17 = and i32 %16, 896
  %18 = or disjoint i32 %17, %13
  %19 = or disjoint i32 %16, %13
  %20 = zext nneg i32 %19 to i64
  %21 = getelementptr inbounds bfloat, ptr addrspace(1) %9, i64 %20
  %22 = load bfloat, ptr addrspace(1) %21, align 2, !invariant.load !6
  %23 = getelementptr inbounds bfloat, ptr addrspace(1) %8, i64 %20
  %24 = load bfloat, ptr addrspace(1) %23, align 2, !invariant.load !6
  %25 = mul nuw nsw i32 %15, 18432
  %26 = zext nneg i32 %18 to i64
  %27 = zext nneg i32 %25 to i64
  %28 = add i64 %27, %26
  %29 = getelementptr bfloat, ptr addrspace(1) %12, i64 %28
  %30 = getelementptr inbounds i8, ptr addrspace(1) %29, i64 34816
  %31 = load bfloat, ptr addrspace(1) %30, align 2, !invariant.load !6, !alias.scope !15
  %32 = fpext bfloat %31 to float
  %33 = fpext bfloat %22 to float
  %34 = fpext bfloat %24 to float
  %35 = fadd float %33, %32
  %36 = getelementptr inbounds bfloat, ptr addrspace(1) %10, i64 %20
  %37 = load bfloat, ptr addrspace(1) %36, align 2, !invariant.load !6
  %38 = getelementptr inbounds i8, ptr addrspace(1) %29, i64 32768
  %39 = load bfloat, ptr addrspace(1) %38, align 2, !invariant.load !6, !alias.scope !18
  %40 = fpext bfloat %39 to float
  %41 = fadd float %35, %34
  %42 = fpext bfloat %37 to float
  %43 = fadd float %41, %40
  %44 = getelementptr inbounds bfloat, ptr addrspace(1) %11, i64 %20
  %45 = load bfloat, ptr addrspace(1) %44, align 2, !invariant.load !6
  %46 = getelementptr inbounds i8, ptr addrspace(1) %29, i64 30720
  %47 = load bfloat, ptr addrspace(1) %46, align 2, !invariant.load !6, !alias.scope !21
  %48 = fpext bfloat %47 to float
  %49 = fadd float %43, %42
  %50 = fpext bfloat %45 to float
  %51 = fadd float %49, %48
  %52 = getelementptr inbounds i8, ptr addrspace(1) %29, i64 28672
  %53 = load bfloat, ptr addrspace(1) %52, align 2, !invariant.load !6, !alias.scope !24
  %54 = fpext bfloat %53 to float
  %55 = fadd float %51, %50
  %56 = fadd float %55, %54
  %57 = getelementptr inbounds float, ptr addrspace(1) %7, i64 %20
  store float %56, ptr addrspace(1) %57, align 4
  ret void
}

define ptx_kernel void @fusion_233(ptr noalias align 128 dereferenceable(131072) %arg0, ptr noalias align 16 dereferenceable(4) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(65536) %arg3) local_unnamed_addr #6 {
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

define ptx_kernel void @fusion_234(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(65536) %arg3, ptr noalias align 128 dereferenceable(1179648) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5) local_unnamed_addr #6 {
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 36864
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
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #10
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
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #10
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
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #10
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #10
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #10
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #10
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #10
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #10
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #10
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #10
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #10
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #10
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #10
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #10
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #10
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #10
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #10
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #10
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #10
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
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #10
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
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #10
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #10
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #10
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #10
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #10
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #10
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #10
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #10
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #10
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #10
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #10
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #10
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #10
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #10
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #10
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #10
  %122 = getelementptr float, ptr addrspace(1) %arg25, i64 %68
  %123 = getelementptr float, ptr addrspace(1) %122, i64 %13
  %124 = getelementptr i8, ptr addrspace(1) %123, i64 16
  %125 = getelementptr i8, ptr addrspace(1) %123, i64 2048
  %126 = getelementptr i8, ptr addrspace(1) %123, i64 2064
  %127 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #10
  %128 = extractvalue { i32, i32, i32, i32 } %127, 0
  %129 = extractvalue { i32, i32, i32, i32 } %127, 1
  %130 = extractvalue { i32, i32, i32, i32 } %127, 2
  %131 = extractvalue { i32, i32, i32, i32 } %127, 3
  %132 = bitcast i32 %128 to float
  %133 = bitcast i32 %129 to float
  %134 = bitcast i32 %130 to float
  %135 = bitcast i32 %131 to float
  %136 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %124) #10
  %137 = extractvalue { i32, i32, i32, i32 } %136, 0
  %138 = extractvalue { i32, i32, i32, i32 } %136, 1
  %139 = extractvalue { i32, i32, i32, i32 } %136, 2
  %140 = extractvalue { i32, i32, i32, i32 } %136, 3
  %141 = bitcast i32 %137 to float
  %142 = bitcast i32 %138 to float
  %143 = bitcast i32 %139 to float
  %144 = bitcast i32 %140 to float
  %145 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #10
  %146 = extractvalue { i32, i32, i32, i32 } %145, 0
  %147 = extractvalue { i32, i32, i32, i32 } %145, 1
  %148 = extractvalue { i32, i32, i32, i32 } %145, 2
  %149 = extractvalue { i32, i32, i32, i32 } %145, 3
  %150 = bitcast i32 %146 to float
  %151 = bitcast i32 %147 to float
  %152 = bitcast i32 %148 to float
  %153 = bitcast i32 %149 to float
  %154 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %126) #10
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %248, <1 x i32> %249, i1 %246) #10
  tail call void @llvm.nvvm.barrier0()
  %250 = icmp samesign ult i32 %5, 2
  %251 = zext nneg i32 %5 to i64
  %252 = getelementptr float, ptr addrspace(3) @global_smem, i64 %251
  %253 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %252, i1 %250) #10
  %254 = bitcast i32 %253 to float
  %255 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %253, i32 1, i32 31)
  %256 = bitcast i32 %255 to float
  %257 = fadd float %254, %256
  %258 = icmp eq i32 %5, 0
  %259 = bitcast float %257 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %252, <1 x i32> %259, i1 %258) #10
  tail call void @llvm.nvvm.barrier0()
  %260 = load float, ptr addrspace(3) @global_smem, align 16
  %261 = fmul float %260, 0x3F50000000000000
  %262 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
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
  %350 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %334) #10
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %371, i32 %374, i32 %377, i32 %380, ptr addrspace(1) %367) #10
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %383, i32 %386, i32 %389, i32 %392, ptr addrspace(1) %368) #10
  ret void
}

define ptx_kernel void @fusion_235(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(65536) %arg3, ptr noalias align 128 dereferenceable(1179648) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5, ptr noalias align 128 dereferenceable(65536) %arg6) local_unnamed_addr #6 {
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 36864
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
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #10
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
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #10
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
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #10
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #10
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #10
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #10
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #10
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #10
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #10
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #10
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #10
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #10
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #10
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #10
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #10
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #10
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #10
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #10
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #10
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
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #10
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
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #10
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #10
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #10
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #10
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #10
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #10
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #10
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #10
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #10
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #10
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #10
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #10
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #10
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #10
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #10
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #10
  %122 = getelementptr i8, ptr addrspace(1) %3, i64 26624
  %123 = getelementptr i8, ptr addrspace(1) %14, i64 26624
  %124 = getelementptr bfloat, ptr addrspace(1) %122, i64 %13
  %125 = getelementptr i8, ptr addrspace(1) %124, i64 1024
  %126 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #10
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
  %143 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #10
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
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #10
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #10
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #10
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #10
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #10
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #10
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #10
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #10
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #10
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #10
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #10
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #10
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #10
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #10
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #10
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #10
  %176 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %68
  %177 = getelementptr bfloat, ptr addrspace(1) %176, i64 %13
  %178 = getelementptr i8, ptr addrspace(1) %177, i64 1024
  %179 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %177) #10
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
  %196 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %178) #10
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
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #10
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #10
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #10
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #10
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #10
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #10
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194) #10
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #10
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #10
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #10
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #10
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #10
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #10
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #10
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211) #10
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212) #10
  %229 = getelementptr float, ptr addrspace(1) %arg25, i64 %68
  %230 = getelementptr float, ptr addrspace(1) %229, i64 %13
  %231 = getelementptr i8, ptr addrspace(1) %230, i64 16
  %232 = getelementptr i8, ptr addrspace(1) %230, i64 2048
  %233 = getelementptr i8, ptr addrspace(1) %230, i64 2064
  %234 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %230) #10
  %235 = extractvalue { i32, i32, i32, i32 } %234, 0
  %236 = extractvalue { i32, i32, i32, i32 } %234, 1
  %237 = extractvalue { i32, i32, i32, i32 } %234, 2
  %238 = extractvalue { i32, i32, i32, i32 } %234, 3
  %239 = bitcast i32 %235 to float
  %240 = bitcast i32 %236 to float
  %241 = bitcast i32 %237 to float
  %242 = bitcast i32 %238 to float
  %243 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %231) #10
  %244 = extractvalue { i32, i32, i32, i32 } %243, 0
  %245 = extractvalue { i32, i32, i32, i32 } %243, 1
  %246 = extractvalue { i32, i32, i32, i32 } %243, 2
  %247 = extractvalue { i32, i32, i32, i32 } %243, 3
  %248 = bitcast i32 %244 to float
  %249 = bitcast i32 %245 to float
  %250 = bitcast i32 %246 to float
  %251 = bitcast i32 %247 to float
  %252 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %232) #10
  %253 = extractvalue { i32, i32, i32, i32 } %252, 0
  %254 = extractvalue { i32, i32, i32, i32 } %252, 1
  %255 = extractvalue { i32, i32, i32, i32 } %252, 2
  %256 = extractvalue { i32, i32, i32, i32 } %252, 3
  %257 = bitcast i32 %253 to float
  %258 = bitcast i32 %254 to float
  %259 = bitcast i32 %255 to float
  %260 = bitcast i32 %256 to float
  %261 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %233) #10
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %387, <1 x i32> %388, i1 %385) #10
  tail call void @llvm.nvvm.barrier0()
  %389 = icmp samesign ult i32 %5, 2
  %390 = zext nneg i32 %5 to i64
  %391 = getelementptr float, ptr addrspace(3) @global_smem, i64 %390
  %392 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %391, i1 %389) #10
  %393 = bitcast i32 %392 to float
  %394 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %392, i32 1, i32 31)
  %395 = bitcast i32 %394 to float
  %396 = fadd float %393, %395
  %397 = icmp eq i32 %5, 0
  %398 = bitcast float %396 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %391, <1 x i32> %398, i1 %397) #10
  tail call void @llvm.nvvm.barrier0()
  %399 = load float, ptr addrspace(3) @global_smem, align 16
  %400 = fmul float %399, 0x3F50000000000000
  %401 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
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
  %423 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %421) #10
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
  %440 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %422) #10
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
  %457 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %432) #10
  %458 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %433) #10
  %459 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %434) #10
  %460 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %435) #10
  %461 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %436) #10
  %462 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %437) #10
  %463 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %438) #10
  %464 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %439) #10
  %465 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %449) #10
  %466 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %450) #10
  %467 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %451) #10
  %468 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %452) #10
  %469 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %453) #10
  %470 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %454) #10
  %471 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %455) #10
  %472 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %456) #10
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
  %489 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %473) #10
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %510, i32 %513, i32 %516, i32 %519, ptr addrspace(1) %506) #10
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %522, i32 %525, i32 %528, i32 %531, ptr addrspace(1) %507) #10
  ret void
}

define ptx_kernel void @fusion_236(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(1179648) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5, ptr noalias align 128 dereferenceable(65536) %arg6, ptr noalias align 128 dereferenceable(65536) %arg7) local_unnamed_addr #6 {
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
  %.idx = mul nsw i64 %2, 36864
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
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #10
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
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #10
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
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #10
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #10
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #10
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #10
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #10
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #10
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #10
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #10
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #10
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #10
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #10
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #10
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #10
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #10
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #10
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #10
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #10
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
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #10
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
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #10
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #10
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #10
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #10
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #10
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #10
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #10
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #10
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #10
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #10
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #10
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #10
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #10
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #10
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #10
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #10
  %122 = getelementptr i8, ptr addrspace(1) %3, i64 24576
  %123 = getelementptr i8, ptr addrspace(1) %14, i64 24576
  %124 = getelementptr bfloat, ptr addrspace(1) %122, i64 %13
  %125 = getelementptr i8, ptr addrspace(1) %124, i64 1024
  %126 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #10
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
  %143 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #10
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
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #10
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #10
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #10
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #10
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #10
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #10
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #10
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #10
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #10
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #10
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #10
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #10
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #10
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #10
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #10
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #10
  %176 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %68
  %177 = getelementptr bfloat, ptr addrspace(1) %176, i64 %13
  %178 = getelementptr i8, ptr addrspace(1) %177, i64 1024
  %179 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %177) #10
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
  %196 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %178) #10
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
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #10
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #10
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #10
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #10
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #10
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #10
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194) #10
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #10
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #10
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #10
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #10
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #10
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #10
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #10
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211) #10
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212) #10
  %229 = getelementptr i8, ptr addrspace(1) %3, i64 26624
  %230 = getelementptr i8, ptr addrspace(1) %14, i64 26624
  %231 = getelementptr bfloat, ptr addrspace(1) %229, i64 %13
  %232 = getelementptr i8, ptr addrspace(1) %231, i64 1024
  %233 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %230) #10
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
  %250 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %232) #10
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
  %267 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242) #10
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #10
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244) #10
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245) #10
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246) #10
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %247) #10
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %248) #10
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %249) #10
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259) #10
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #10
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #10
  %278 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262) #10
  %279 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %263) #10
  %280 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %264) #10
  %281 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %265) #10
  %282 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %266) #10
  %283 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %68
  %284 = getelementptr bfloat, ptr addrspace(1) %283, i64 %13
  %285 = getelementptr i8, ptr addrspace(1) %284, i64 1024
  %286 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %284) #10
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
  %303 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %285) #10
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
  %320 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295) #10
  %321 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296) #10
  %322 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297) #10
  %323 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298) #10
  %324 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299) #10
  %325 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300) #10
  %326 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %301) #10
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %302) #10
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %312) #10
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313) #10
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314) #10
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315) #10
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316) #10
  %333 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317) #10
  %334 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %318) #10
  %335 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %319) #10
  %336 = getelementptr float, ptr addrspace(1) %arg49, i64 %68
  %337 = getelementptr float, ptr addrspace(1) %336, i64 %13
  %338 = getelementptr i8, ptr addrspace(1) %337, i64 16
  %339 = getelementptr i8, ptr addrspace(1) %337, i64 2048
  %340 = getelementptr i8, ptr addrspace(1) %337, i64 2064
  %341 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %337) #10
  %342 = extractvalue { i32, i32, i32, i32 } %341, 0
  %343 = extractvalue { i32, i32, i32, i32 } %341, 1
  %344 = extractvalue { i32, i32, i32, i32 } %341, 2
  %345 = extractvalue { i32, i32, i32, i32 } %341, 3
  %346 = bitcast i32 %342 to float
  %347 = bitcast i32 %343 to float
  %348 = bitcast i32 %344 to float
  %349 = bitcast i32 %345 to float
  %350 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %338) #10
  %351 = extractvalue { i32, i32, i32, i32 } %350, 0
  %352 = extractvalue { i32, i32, i32, i32 } %350, 1
  %353 = extractvalue { i32, i32, i32, i32 } %350, 2
  %354 = extractvalue { i32, i32, i32, i32 } %350, 3
  %355 = bitcast i32 %351 to float
  %356 = bitcast i32 %352 to float
  %357 = bitcast i32 %353 to float
  %358 = bitcast i32 %354 to float
  %359 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %339) #10
  %360 = extractvalue { i32, i32, i32, i32 } %359, 0
  %361 = extractvalue { i32, i32, i32, i32 } %359, 1
  %362 = extractvalue { i32, i32, i32, i32 } %359, 2
  %363 = extractvalue { i32, i32, i32, i32 } %359, 3
  %364 = bitcast i32 %360 to float
  %365 = bitcast i32 %361 to float
  %366 = bitcast i32 %362 to float
  %367 = bitcast i32 %363 to float
  %368 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %340) #10
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %526, <1 x i32> %527, i1 %524) #10
  tail call void @llvm.nvvm.barrier0()
  %528 = icmp samesign ult i32 %5, 2
  %529 = zext nneg i32 %5 to i64
  %530 = getelementptr float, ptr addrspace(3) @global_smem, i64 %529
  %531 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %530, i1 %528) #10
  %532 = bitcast i32 %531 to float
  %533 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %531, i32 1, i32 31)
  %534 = bitcast i32 %533 to float
  %535 = fadd float %532, %534
  %536 = icmp eq i32 %5, 0
  %537 = bitcast float %535 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %530, <1 x i32> %537, i1 %536) #10
  tail call void @llvm.nvvm.barrier0()
  %538 = load float, ptr addrspace(3) @global_smem, align 16
  %539 = fmul float %538, 0x3F50000000000000
  %540 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
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
  %562 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %560) #10
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
  %579 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %561) #10
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
  %596 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %571) #10
  %597 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %572) #10
  %598 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %573) #10
  %599 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %574) #10
  %600 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %575) #10
  %601 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %576) #10
  %602 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %577) #10
  %603 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %578) #10
  %604 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %588) #10
  %605 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %589) #10
  %606 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %590) #10
  %607 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %591) #10
  %608 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %592) #10
  %609 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %593) #10
  %610 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %594) #10
  %611 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %595) #10
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
  %628 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %612) #10
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %649, i32 %652, i32 %655, i32 %658, ptr addrspace(1) %645) #10
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %661, i32 %664, i32 %667, i32 %670, ptr addrspace(1) %646) #10
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_add_fusion_1(ptr noalias readonly align 128 captures(none) dereferenceable(1179648) %0, ptr noalias readonly align 128 captures(none) dereferenceable(65536) %1, ptr noalias readonly align 128 captures(none) dereferenceable(65536) %2, ptr noalias align 128 captures(none) dereferenceable(131072) %3, ptr noalias readonly align 128 captures(none) dereferenceable(65536) %4, ptr noalias readonly align 128 captures(none) dereferenceable(65536) %5) local_unnamed_addr #0 {
  %7 = addrspacecast ptr %5 to ptr addrspace(1)
  %8 = addrspacecast ptr %4 to ptr addrspace(1)
  %9 = addrspacecast ptr %3 to ptr addrspace(1)
  %10 = addrspacecast ptr %2 to ptr addrspace(1)
  %11 = addrspacecast ptr %1 to ptr addrspace(1)
  %12 = addrspacecast ptr %0 to ptr addrspace(1)
  %13 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %14 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %15 = lshr i32 %14, 3
  %16 = shl nuw nsw i32 %14, 7
  %17 = and i32 %16, 896
  %18 = or disjoint i32 %17, %13
  %19 = or disjoint i32 %16, %13
  %20 = zext nneg i32 %19 to i64
  %21 = getelementptr inbounds bfloat, ptr addrspace(1) %8, i64 %20
  %22 = load bfloat, ptr addrspace(1) %21, align 2, !invariant.load !6
  %23 = fpext bfloat %22 to float
  %24 = getelementptr inbounds float, ptr addrspace(1) %9, i64 %20
  %25 = load float, ptr addrspace(1) %24, align 4
  %26 = getelementptr inbounds bfloat, ptr addrspace(1) %7, i64 %20
  %27 = load bfloat, ptr addrspace(1) %26, align 2, !invariant.load !6
  %28 = mul nuw nsw i32 %15, 18432
  %29 = zext nneg i32 %18 to i64
  %30 = zext nneg i32 %28 to i64
  %31 = add i64 %30, %29
  %32 = getelementptr bfloat, ptr addrspace(1) %12, i64 %31
  %33 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 26624
  %34 = load bfloat, ptr addrspace(1) %33, align 2, !invariant.load !6, !alias.scope !27
  %35 = fpext bfloat %34 to float
  %36 = fadd float %25, %23
  %37 = fpext bfloat %27 to float
  %38 = fadd float %36, %35
  %39 = getelementptr inbounds bfloat, ptr addrspace(1) %10, i64 %20
  %40 = load bfloat, ptr addrspace(1) %39, align 2, !invariant.load !6
  %41 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 24576
  %42 = load bfloat, ptr addrspace(1) %41, align 2, !invariant.load !6, !alias.scope !30
  %43 = fpext bfloat %42 to float
  %44 = fadd float %38, %37
  %45 = fpext bfloat %40 to float
  %46 = fadd float %44, %43
  %47 = getelementptr inbounds bfloat, ptr addrspace(1) %11, i64 %20
  %48 = load bfloat, ptr addrspace(1) %47, align 2, !invariant.load !6
  %49 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 22528
  %50 = load bfloat, ptr addrspace(1) %49, align 2, !invariant.load !6, !alias.scope !33
  %51 = fpext bfloat %50 to float
  %52 = fadd float %46, %45
  %53 = fpext bfloat %48 to float
  %54 = fadd float %52, %51
  %55 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 20480
  %56 = load bfloat, ptr addrspace(1) %55, align 2, !invariant.load !6, !alias.scope !36
  %57 = fpext bfloat %56 to float
  %58 = fadd float %54, %53
  %59 = fadd float %58, %57
  store float %59, ptr addrspace(1) %24, align 4
  ret void
}

define ptx_kernel void @fusion_238(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(65536) %arg3, ptr noalias align 128 dereferenceable(1179648) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5) local_unnamed_addr #6 {
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 36864
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
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #10
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
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #10
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
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #10
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #10
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #10
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #10
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #10
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #10
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #10
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #10
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #10
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #10
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #10
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #10
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #10
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #10
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #10
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #10
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #10
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
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #10
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
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #10
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #10
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #10
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #10
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #10
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #10
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #10
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #10
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #10
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #10
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #10
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #10
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #10
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #10
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #10
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #10
  %122 = getelementptr float, ptr addrspace(1) %arg25, i64 %68
  %123 = getelementptr float, ptr addrspace(1) %122, i64 %13
  %124 = getelementptr i8, ptr addrspace(1) %123, i64 16
  %125 = getelementptr i8, ptr addrspace(1) %123, i64 2048
  %126 = getelementptr i8, ptr addrspace(1) %123, i64 2064
  %127 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #10
  %128 = extractvalue { i32, i32, i32, i32 } %127, 0
  %129 = extractvalue { i32, i32, i32, i32 } %127, 1
  %130 = extractvalue { i32, i32, i32, i32 } %127, 2
  %131 = extractvalue { i32, i32, i32, i32 } %127, 3
  %132 = bitcast i32 %128 to float
  %133 = bitcast i32 %129 to float
  %134 = bitcast i32 %130 to float
  %135 = bitcast i32 %131 to float
  %136 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %124) #10
  %137 = extractvalue { i32, i32, i32, i32 } %136, 0
  %138 = extractvalue { i32, i32, i32, i32 } %136, 1
  %139 = extractvalue { i32, i32, i32, i32 } %136, 2
  %140 = extractvalue { i32, i32, i32, i32 } %136, 3
  %141 = bitcast i32 %137 to float
  %142 = bitcast i32 %138 to float
  %143 = bitcast i32 %139 to float
  %144 = bitcast i32 %140 to float
  %145 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #10
  %146 = extractvalue { i32, i32, i32, i32 } %145, 0
  %147 = extractvalue { i32, i32, i32, i32 } %145, 1
  %148 = extractvalue { i32, i32, i32, i32 } %145, 2
  %149 = extractvalue { i32, i32, i32, i32 } %145, 3
  %150 = bitcast i32 %146 to float
  %151 = bitcast i32 %147 to float
  %152 = bitcast i32 %148 to float
  %153 = bitcast i32 %149 to float
  %154 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %126) #10
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %248, <1 x i32> %249, i1 %246) #10
  tail call void @llvm.nvvm.barrier0()
  %250 = icmp samesign ult i32 %5, 2
  %251 = zext nneg i32 %5 to i64
  %252 = getelementptr float, ptr addrspace(3) @global_smem, i64 %251
  %253 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %252, i1 %250) #10
  %254 = bitcast i32 %253 to float
  %255 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %253, i32 1, i32 31)
  %256 = bitcast i32 %255 to float
  %257 = fadd float %254, %256
  %258 = icmp eq i32 %5, 0
  %259 = bitcast float %257 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %252, <1 x i32> %259, i1 %258) #10
  tail call void @llvm.nvvm.barrier0()
  %260 = load float, ptr addrspace(3) @global_smem, align 16
  %261 = fmul float %260, 0x3F50000000000000
  %262 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
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
  %350 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %334) #10
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %371, i32 %374, i32 %377, i32 %380, ptr addrspace(1) %367) #10
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %383, i32 %386, i32 %389, i32 %392, ptr addrspace(1) %368) #10
  ret void
}

define ptx_kernel void @fusion_239(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(65536) %arg3, ptr noalias align 128 dereferenceable(1179648) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5, ptr noalias align 128 dereferenceable(65536) %arg6) local_unnamed_addr #6 {
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 36864
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
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #10
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
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #10
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
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #10
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #10
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #10
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #10
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #10
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #10
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #10
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #10
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #10
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #10
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #10
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #10
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #10
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #10
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #10
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #10
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #10
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
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #10
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
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #10
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #10
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #10
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #10
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #10
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #10
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #10
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #10
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #10
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #10
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #10
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #10
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #10
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #10
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #10
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #10
  %122 = getelementptr i8, ptr addrspace(1) %3, i64 18432
  %123 = getelementptr i8, ptr addrspace(1) %14, i64 18432
  %124 = getelementptr bfloat, ptr addrspace(1) %122, i64 %13
  %125 = getelementptr i8, ptr addrspace(1) %124, i64 1024
  %126 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #10
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
  %143 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #10
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
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #10
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #10
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #10
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #10
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #10
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #10
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #10
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #10
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #10
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #10
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #10
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #10
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #10
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #10
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #10
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #10
  %176 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %68
  %177 = getelementptr bfloat, ptr addrspace(1) %176, i64 %13
  %178 = getelementptr i8, ptr addrspace(1) %177, i64 1024
  %179 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %177) #10
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
  %196 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %178) #10
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
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #10
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #10
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #10
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #10
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #10
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #10
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194) #10
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #10
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #10
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #10
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #10
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #10
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #10
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #10
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211) #10
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212) #10
  %229 = getelementptr float, ptr addrspace(1) %arg25, i64 %68
  %230 = getelementptr float, ptr addrspace(1) %229, i64 %13
  %231 = getelementptr i8, ptr addrspace(1) %230, i64 16
  %232 = getelementptr i8, ptr addrspace(1) %230, i64 2048
  %233 = getelementptr i8, ptr addrspace(1) %230, i64 2064
  %234 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %230) #10
  %235 = extractvalue { i32, i32, i32, i32 } %234, 0
  %236 = extractvalue { i32, i32, i32, i32 } %234, 1
  %237 = extractvalue { i32, i32, i32, i32 } %234, 2
  %238 = extractvalue { i32, i32, i32, i32 } %234, 3
  %239 = bitcast i32 %235 to float
  %240 = bitcast i32 %236 to float
  %241 = bitcast i32 %237 to float
  %242 = bitcast i32 %238 to float
  %243 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %231) #10
  %244 = extractvalue { i32, i32, i32, i32 } %243, 0
  %245 = extractvalue { i32, i32, i32, i32 } %243, 1
  %246 = extractvalue { i32, i32, i32, i32 } %243, 2
  %247 = extractvalue { i32, i32, i32, i32 } %243, 3
  %248 = bitcast i32 %244 to float
  %249 = bitcast i32 %245 to float
  %250 = bitcast i32 %246 to float
  %251 = bitcast i32 %247 to float
  %252 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %232) #10
  %253 = extractvalue { i32, i32, i32, i32 } %252, 0
  %254 = extractvalue { i32, i32, i32, i32 } %252, 1
  %255 = extractvalue { i32, i32, i32, i32 } %252, 2
  %256 = extractvalue { i32, i32, i32, i32 } %252, 3
  %257 = bitcast i32 %253 to float
  %258 = bitcast i32 %254 to float
  %259 = bitcast i32 %255 to float
  %260 = bitcast i32 %256 to float
  %261 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %233) #10
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %387, <1 x i32> %388, i1 %385) #10
  tail call void @llvm.nvvm.barrier0()
  %389 = icmp samesign ult i32 %5, 2
  %390 = zext nneg i32 %5 to i64
  %391 = getelementptr float, ptr addrspace(3) @global_smem, i64 %390
  %392 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %391, i1 %389) #10
  %393 = bitcast i32 %392 to float
  %394 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %392, i32 1, i32 31)
  %395 = bitcast i32 %394 to float
  %396 = fadd float %393, %395
  %397 = icmp eq i32 %5, 0
  %398 = bitcast float %396 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %391, <1 x i32> %398, i1 %397) #10
  tail call void @llvm.nvvm.barrier0()
  %399 = load float, ptr addrspace(3) @global_smem, align 16
  %400 = fmul float %399, 0x3F50000000000000
  %401 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
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
  %423 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %421) #10
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
  %440 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %422) #10
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
  %457 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %432) #10
  %458 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %433) #10
  %459 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %434) #10
  %460 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %435) #10
  %461 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %436) #10
  %462 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %437) #10
  %463 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %438) #10
  %464 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %439) #10
  %465 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %449) #10
  %466 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %450) #10
  %467 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %451) #10
  %468 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %452) #10
  %469 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %453) #10
  %470 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %454) #10
  %471 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %455) #10
  %472 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %456) #10
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
  %489 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %473) #10
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %510, i32 %513, i32 %516, i32 %519, ptr addrspace(1) %506) #10
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %522, i32 %525, i32 %528, i32 %531, ptr addrspace(1) %507) #10
  ret void
}

define ptx_kernel void @fusion_240(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(1179648) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5, ptr noalias align 128 dereferenceable(65536) %arg6, ptr noalias align 128 dereferenceable(65536) %arg7) local_unnamed_addr #6 {
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
  %.idx = mul nsw i64 %2, 36864
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
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #10
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
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #10
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
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #10
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #10
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #10
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #10
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #10
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #10
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #10
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #10
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #10
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #10
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #10
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #10
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #10
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #10
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #10
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #10
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #10
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
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #10
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
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #10
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #10
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #10
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #10
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #10
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #10
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #10
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #10
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #10
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #10
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #10
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #10
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #10
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #10
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #10
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #10
  %122 = getelementptr i8, ptr addrspace(1) %3, i64 16384
  %123 = getelementptr i8, ptr addrspace(1) %14, i64 16384
  %124 = getelementptr bfloat, ptr addrspace(1) %122, i64 %13
  %125 = getelementptr i8, ptr addrspace(1) %124, i64 1024
  %126 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #10
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
  %143 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #10
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
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #10
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #10
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #10
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #10
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #10
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #10
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #10
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #10
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #10
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #10
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #10
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #10
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #10
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #10
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #10
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #10
  %176 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %68
  %177 = getelementptr bfloat, ptr addrspace(1) %176, i64 %13
  %178 = getelementptr i8, ptr addrspace(1) %177, i64 1024
  %179 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %177) #10
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
  %196 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %178) #10
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
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #10
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #10
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #10
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #10
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #10
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #10
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194) #10
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #10
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #10
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #10
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #10
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #10
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #10
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #10
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211) #10
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212) #10
  %229 = getelementptr i8, ptr addrspace(1) %3, i64 18432
  %230 = getelementptr i8, ptr addrspace(1) %14, i64 18432
  %231 = getelementptr bfloat, ptr addrspace(1) %229, i64 %13
  %232 = getelementptr i8, ptr addrspace(1) %231, i64 1024
  %233 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %230) #10
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
  %250 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %232) #10
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
  %267 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242) #10
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #10
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244) #10
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245) #10
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246) #10
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %247) #10
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %248) #10
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %249) #10
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259) #10
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #10
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #10
  %278 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262) #10
  %279 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %263) #10
  %280 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %264) #10
  %281 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %265) #10
  %282 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %266) #10
  %283 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %68
  %284 = getelementptr bfloat, ptr addrspace(1) %283, i64 %13
  %285 = getelementptr i8, ptr addrspace(1) %284, i64 1024
  %286 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %284) #10
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
  %303 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %285) #10
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
  %320 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295) #10
  %321 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296) #10
  %322 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297) #10
  %323 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298) #10
  %324 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299) #10
  %325 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300) #10
  %326 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %301) #10
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %302) #10
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %312) #10
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313) #10
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314) #10
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315) #10
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316) #10
  %333 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317) #10
  %334 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %318) #10
  %335 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %319) #10
  %336 = getelementptr float, ptr addrspace(1) %arg49, i64 %68
  %337 = getelementptr float, ptr addrspace(1) %336, i64 %13
  %338 = getelementptr i8, ptr addrspace(1) %337, i64 16
  %339 = getelementptr i8, ptr addrspace(1) %337, i64 2048
  %340 = getelementptr i8, ptr addrspace(1) %337, i64 2064
  %341 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %337) #10
  %342 = extractvalue { i32, i32, i32, i32 } %341, 0
  %343 = extractvalue { i32, i32, i32, i32 } %341, 1
  %344 = extractvalue { i32, i32, i32, i32 } %341, 2
  %345 = extractvalue { i32, i32, i32, i32 } %341, 3
  %346 = bitcast i32 %342 to float
  %347 = bitcast i32 %343 to float
  %348 = bitcast i32 %344 to float
  %349 = bitcast i32 %345 to float
  %350 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %338) #10
  %351 = extractvalue { i32, i32, i32, i32 } %350, 0
  %352 = extractvalue { i32, i32, i32, i32 } %350, 1
  %353 = extractvalue { i32, i32, i32, i32 } %350, 2
  %354 = extractvalue { i32, i32, i32, i32 } %350, 3
  %355 = bitcast i32 %351 to float
  %356 = bitcast i32 %352 to float
  %357 = bitcast i32 %353 to float
  %358 = bitcast i32 %354 to float
  %359 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %339) #10
  %360 = extractvalue { i32, i32, i32, i32 } %359, 0
  %361 = extractvalue { i32, i32, i32, i32 } %359, 1
  %362 = extractvalue { i32, i32, i32, i32 } %359, 2
  %363 = extractvalue { i32, i32, i32, i32 } %359, 3
  %364 = bitcast i32 %360 to float
  %365 = bitcast i32 %361 to float
  %366 = bitcast i32 %362 to float
  %367 = bitcast i32 %363 to float
  %368 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %340) #10
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %526, <1 x i32> %527, i1 %524) #10
  tail call void @llvm.nvvm.barrier0()
  %528 = icmp samesign ult i32 %5, 2
  %529 = zext nneg i32 %5 to i64
  %530 = getelementptr float, ptr addrspace(3) @global_smem, i64 %529
  %531 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %530, i1 %528) #10
  %532 = bitcast i32 %531 to float
  %533 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %531, i32 1, i32 31)
  %534 = bitcast i32 %533 to float
  %535 = fadd float %532, %534
  %536 = icmp eq i32 %5, 0
  %537 = bitcast float %535 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %530, <1 x i32> %537, i1 %536) #10
  tail call void @llvm.nvvm.barrier0()
  %538 = load float, ptr addrspace(3) @global_smem, align 16
  %539 = fmul float %538, 0x3F50000000000000
  %540 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
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
  %562 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %560) #10
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
  %579 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %561) #10
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
  %596 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %571) #10
  %597 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %572) #10
  %598 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %573) #10
  %599 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %574) #10
  %600 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %575) #10
  %601 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %576) #10
  %602 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %577) #10
  %603 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %578) #10
  %604 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %588) #10
  %605 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %589) #10
  %606 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %590) #10
  %607 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %591) #10
  %608 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %592) #10
  %609 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %593) #10
  %610 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %594) #10
  %611 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %595) #10
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
  %628 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %612) #10
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %649, i32 %652, i32 %655, i32 %658, ptr addrspace(1) %645) #10
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %661, i32 %664, i32 %667, i32 %670, ptr addrspace(1) %646) #10
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_add_fusion_2(ptr noalias readonly align 128 captures(none) dereferenceable(1179648) %0, ptr noalias readonly align 128 captures(none) dereferenceable(65536) %1, ptr noalias readonly align 128 captures(none) dereferenceable(65536) %2, ptr noalias align 128 captures(none) dereferenceable(131072) %3, ptr noalias readonly align 128 captures(none) dereferenceable(65536) %4, ptr noalias readonly align 128 captures(none) dereferenceable(65536) %5) local_unnamed_addr #0 {
  %7 = addrspacecast ptr %5 to ptr addrspace(1)
  %8 = addrspacecast ptr %4 to ptr addrspace(1)
  %9 = addrspacecast ptr %3 to ptr addrspace(1)
  %10 = addrspacecast ptr %2 to ptr addrspace(1)
  %11 = addrspacecast ptr %1 to ptr addrspace(1)
  %12 = addrspacecast ptr %0 to ptr addrspace(1)
  %13 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %14 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %15 = lshr i32 %14, 3
  %16 = shl nuw nsw i32 %14, 7
  %17 = and i32 %16, 896
  %18 = or disjoint i32 %17, %13
  %19 = or disjoint i32 %16, %13
  %20 = zext nneg i32 %19 to i64
  %21 = getelementptr inbounds bfloat, ptr addrspace(1) %8, i64 %20
  %22 = load bfloat, ptr addrspace(1) %21, align 2, !invariant.load !6
  %23 = fpext bfloat %22 to float
  %24 = getelementptr inbounds float, ptr addrspace(1) %9, i64 %20
  %25 = load float, ptr addrspace(1) %24, align 4
  %26 = getelementptr inbounds bfloat, ptr addrspace(1) %7, i64 %20
  %27 = load bfloat, ptr addrspace(1) %26, align 2, !invariant.load !6
  %28 = mul nuw nsw i32 %15, 18432
  %29 = zext nneg i32 %18 to i64
  %30 = zext nneg i32 %28 to i64
  %31 = add i64 %30, %29
  %32 = getelementptr bfloat, ptr addrspace(1) %12, i64 %31
  %33 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 18432
  %34 = load bfloat, ptr addrspace(1) %33, align 2, !invariant.load !6, !alias.scope !39
  %35 = fpext bfloat %34 to float
  %36 = fadd float %25, %23
  %37 = fpext bfloat %27 to float
  %38 = fadd float %36, %35
  %39 = getelementptr inbounds bfloat, ptr addrspace(1) %10, i64 %20
  %40 = load bfloat, ptr addrspace(1) %39, align 2, !invariant.load !6
  %41 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 16384
  %42 = load bfloat, ptr addrspace(1) %41, align 2, !invariant.load !6, !alias.scope !42
  %43 = fpext bfloat %42 to float
  %44 = fadd float %38, %37
  %45 = fpext bfloat %40 to float
  %46 = fadd float %44, %43
  %47 = getelementptr inbounds bfloat, ptr addrspace(1) %11, i64 %20
  %48 = load bfloat, ptr addrspace(1) %47, align 2, !invariant.load !6
  %49 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 14336
  %50 = load bfloat, ptr addrspace(1) %49, align 2, !invariant.load !6, !alias.scope !45
  %51 = fpext bfloat %50 to float
  %52 = fadd float %46, %45
  %53 = fpext bfloat %48 to float
  %54 = fadd float %52, %51
  %55 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 12288
  %56 = load bfloat, ptr addrspace(1) %55, align 2, !invariant.load !6, !alias.scope !48
  %57 = fpext bfloat %56 to float
  %58 = fadd float %54, %53
  %59 = fadd float %58, %57
  store float %59, ptr addrspace(1) %24, align 4
  ret void
}

define ptx_kernel void @fusion_242(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(65536) %arg3, ptr noalias align 128 dereferenceable(1179648) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5) local_unnamed_addr #6 {
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 36864
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
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #10
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
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #10
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
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #10
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #10
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #10
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #10
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #10
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #10
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #10
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #10
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #10
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #10
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #10
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #10
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #10
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #10
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #10
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #10
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #10
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
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #10
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
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #10
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #10
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #10
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #10
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #10
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #10
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #10
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #10
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #10
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #10
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #10
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #10
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #10
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #10
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #10
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #10
  %122 = getelementptr float, ptr addrspace(1) %arg25, i64 %68
  %123 = getelementptr float, ptr addrspace(1) %122, i64 %13
  %124 = getelementptr i8, ptr addrspace(1) %123, i64 16
  %125 = getelementptr i8, ptr addrspace(1) %123, i64 2048
  %126 = getelementptr i8, ptr addrspace(1) %123, i64 2064
  %127 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #10
  %128 = extractvalue { i32, i32, i32, i32 } %127, 0
  %129 = extractvalue { i32, i32, i32, i32 } %127, 1
  %130 = extractvalue { i32, i32, i32, i32 } %127, 2
  %131 = extractvalue { i32, i32, i32, i32 } %127, 3
  %132 = bitcast i32 %128 to float
  %133 = bitcast i32 %129 to float
  %134 = bitcast i32 %130 to float
  %135 = bitcast i32 %131 to float
  %136 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %124) #10
  %137 = extractvalue { i32, i32, i32, i32 } %136, 0
  %138 = extractvalue { i32, i32, i32, i32 } %136, 1
  %139 = extractvalue { i32, i32, i32, i32 } %136, 2
  %140 = extractvalue { i32, i32, i32, i32 } %136, 3
  %141 = bitcast i32 %137 to float
  %142 = bitcast i32 %138 to float
  %143 = bitcast i32 %139 to float
  %144 = bitcast i32 %140 to float
  %145 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #10
  %146 = extractvalue { i32, i32, i32, i32 } %145, 0
  %147 = extractvalue { i32, i32, i32, i32 } %145, 1
  %148 = extractvalue { i32, i32, i32, i32 } %145, 2
  %149 = extractvalue { i32, i32, i32, i32 } %145, 3
  %150 = bitcast i32 %146 to float
  %151 = bitcast i32 %147 to float
  %152 = bitcast i32 %148 to float
  %153 = bitcast i32 %149 to float
  %154 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %126) #10
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %248, <1 x i32> %249, i1 %246) #10
  tail call void @llvm.nvvm.barrier0()
  %250 = icmp samesign ult i32 %5, 2
  %251 = zext nneg i32 %5 to i64
  %252 = getelementptr float, ptr addrspace(3) @global_smem, i64 %251
  %253 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %252, i1 %250) #10
  %254 = bitcast i32 %253 to float
  %255 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %253, i32 1, i32 31)
  %256 = bitcast i32 %255 to float
  %257 = fadd float %254, %256
  %258 = icmp eq i32 %5, 0
  %259 = bitcast float %257 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %252, <1 x i32> %259, i1 %258) #10
  tail call void @llvm.nvvm.barrier0()
  %260 = load float, ptr addrspace(3) @global_smem, align 16
  %261 = fmul float %260, 0x3F50000000000000
  %262 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
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
  %350 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %334) #10
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %371, i32 %374, i32 %377, i32 %380, ptr addrspace(1) %367) #10
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %383, i32 %386, i32 %389, i32 %392, ptr addrspace(1) %368) #10
  ret void
}

define ptx_kernel void @fusion_243(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(65536) %arg3, ptr noalias align 128 dereferenceable(1179648) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5, ptr noalias align 128 dereferenceable(65536) %arg6) local_unnamed_addr #6 {
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 36864
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
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #10
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
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #10
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
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #10
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #10
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #10
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #10
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #10
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #10
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #10
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #10
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #10
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #10
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #10
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #10
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #10
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #10
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #10
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #10
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #10
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
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #10
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
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #10
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #10
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #10
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #10
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #10
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #10
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #10
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #10
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #10
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #10
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #10
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #10
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #10
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #10
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #10
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #10
  %122 = getelementptr i8, ptr addrspace(1) %3, i64 10240
  %123 = getelementptr i8, ptr addrspace(1) %14, i64 10240
  %124 = getelementptr bfloat, ptr addrspace(1) %122, i64 %13
  %125 = getelementptr i8, ptr addrspace(1) %124, i64 1024
  %126 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #10
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
  %143 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #10
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
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #10
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #10
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #10
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #10
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #10
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #10
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #10
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #10
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #10
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #10
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #10
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #10
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #10
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #10
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #10
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #10
  %176 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %68
  %177 = getelementptr bfloat, ptr addrspace(1) %176, i64 %13
  %178 = getelementptr i8, ptr addrspace(1) %177, i64 1024
  %179 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %177) #10
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
  %196 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %178) #10
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
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #10
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #10
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #10
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #10
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #10
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #10
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194) #10
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #10
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #10
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #10
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #10
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #10
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #10
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #10
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211) #10
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212) #10
  %229 = getelementptr float, ptr addrspace(1) %arg25, i64 %68
  %230 = getelementptr float, ptr addrspace(1) %229, i64 %13
  %231 = getelementptr i8, ptr addrspace(1) %230, i64 16
  %232 = getelementptr i8, ptr addrspace(1) %230, i64 2048
  %233 = getelementptr i8, ptr addrspace(1) %230, i64 2064
  %234 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %230) #10
  %235 = extractvalue { i32, i32, i32, i32 } %234, 0
  %236 = extractvalue { i32, i32, i32, i32 } %234, 1
  %237 = extractvalue { i32, i32, i32, i32 } %234, 2
  %238 = extractvalue { i32, i32, i32, i32 } %234, 3
  %239 = bitcast i32 %235 to float
  %240 = bitcast i32 %236 to float
  %241 = bitcast i32 %237 to float
  %242 = bitcast i32 %238 to float
  %243 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %231) #10
  %244 = extractvalue { i32, i32, i32, i32 } %243, 0
  %245 = extractvalue { i32, i32, i32, i32 } %243, 1
  %246 = extractvalue { i32, i32, i32, i32 } %243, 2
  %247 = extractvalue { i32, i32, i32, i32 } %243, 3
  %248 = bitcast i32 %244 to float
  %249 = bitcast i32 %245 to float
  %250 = bitcast i32 %246 to float
  %251 = bitcast i32 %247 to float
  %252 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %232) #10
  %253 = extractvalue { i32, i32, i32, i32 } %252, 0
  %254 = extractvalue { i32, i32, i32, i32 } %252, 1
  %255 = extractvalue { i32, i32, i32, i32 } %252, 2
  %256 = extractvalue { i32, i32, i32, i32 } %252, 3
  %257 = bitcast i32 %253 to float
  %258 = bitcast i32 %254 to float
  %259 = bitcast i32 %255 to float
  %260 = bitcast i32 %256 to float
  %261 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %233) #10
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %387, <1 x i32> %388, i1 %385) #10
  tail call void @llvm.nvvm.barrier0()
  %389 = icmp samesign ult i32 %5, 2
  %390 = zext nneg i32 %5 to i64
  %391 = getelementptr float, ptr addrspace(3) @global_smem, i64 %390
  %392 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %391, i1 %389) #10
  %393 = bitcast i32 %392 to float
  %394 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %392, i32 1, i32 31)
  %395 = bitcast i32 %394 to float
  %396 = fadd float %393, %395
  %397 = icmp eq i32 %5, 0
  %398 = bitcast float %396 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %391, <1 x i32> %398, i1 %397) #10
  tail call void @llvm.nvvm.barrier0()
  %399 = load float, ptr addrspace(3) @global_smem, align 16
  %400 = fmul float %399, 0x3F50000000000000
  %401 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
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
  %423 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %421) #10
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
  %440 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %422) #10
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
  %457 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %432) #10
  %458 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %433) #10
  %459 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %434) #10
  %460 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %435) #10
  %461 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %436) #10
  %462 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %437) #10
  %463 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %438) #10
  %464 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %439) #10
  %465 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %449) #10
  %466 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %450) #10
  %467 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %451) #10
  %468 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %452) #10
  %469 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %453) #10
  %470 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %454) #10
  %471 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %455) #10
  %472 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %456) #10
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
  %489 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %473) #10
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %510, i32 %513, i32 %516, i32 %519, ptr addrspace(1) %506) #10
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %522, i32 %525, i32 %528, i32 %531, ptr addrspace(1) %507) #10
  ret void
}

define ptx_kernel void @fusion_244(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(1179648) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5, ptr noalias align 128 dereferenceable(65536) %arg6, ptr noalias align 128 dereferenceable(65536) %arg7) local_unnamed_addr #6 {
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
  %.idx = mul nsw i64 %2, 36864
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
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #10
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
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #10
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
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #10
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #10
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #10
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #10
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #10
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #10
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #10
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #10
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #10
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #10
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #10
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #10
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #10
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #10
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #10
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #10
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #10
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
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #10
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
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #10
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #10
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #10
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #10
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #10
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #10
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #10
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #10
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #10
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #10
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #10
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #10
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #10
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #10
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #10
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #10
  %122 = getelementptr i8, ptr addrspace(1) %3, i64 8192
  %123 = getelementptr i8, ptr addrspace(1) %14, i64 8192
  %124 = getelementptr bfloat, ptr addrspace(1) %122, i64 %13
  %125 = getelementptr i8, ptr addrspace(1) %124, i64 1024
  %126 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #10
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
  %143 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #10
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
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #10
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #10
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #10
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #10
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #10
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #10
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #10
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #10
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #10
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #10
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #10
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #10
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #10
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #10
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #10
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #10
  %176 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %68
  %177 = getelementptr bfloat, ptr addrspace(1) %176, i64 %13
  %178 = getelementptr i8, ptr addrspace(1) %177, i64 1024
  %179 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %177) #10
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
  %196 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %178) #10
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
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #10
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #10
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #10
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #10
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #10
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #10
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194) #10
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #10
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #10
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #10
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #10
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #10
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #10
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #10
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211) #10
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212) #10
  %229 = getelementptr i8, ptr addrspace(1) %3, i64 10240
  %230 = getelementptr i8, ptr addrspace(1) %14, i64 10240
  %231 = getelementptr bfloat, ptr addrspace(1) %229, i64 %13
  %232 = getelementptr i8, ptr addrspace(1) %231, i64 1024
  %233 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %230) #10
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
  %250 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %232) #10
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
  %267 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242) #10
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #10
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244) #10
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245) #10
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246) #10
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %247) #10
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %248) #10
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %249) #10
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259) #10
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #10
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #10
  %278 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262) #10
  %279 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %263) #10
  %280 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %264) #10
  %281 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %265) #10
  %282 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %266) #10
  %283 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %68
  %284 = getelementptr bfloat, ptr addrspace(1) %283, i64 %13
  %285 = getelementptr i8, ptr addrspace(1) %284, i64 1024
  %286 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %284) #10
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
  %303 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %285) #10
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
  %320 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295) #10
  %321 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296) #10
  %322 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297) #10
  %323 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298) #10
  %324 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299) #10
  %325 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300) #10
  %326 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %301) #10
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %302) #10
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %312) #10
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313) #10
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314) #10
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315) #10
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316) #10
  %333 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317) #10
  %334 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %318) #10
  %335 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %319) #10
  %336 = getelementptr float, ptr addrspace(1) %arg49, i64 %68
  %337 = getelementptr float, ptr addrspace(1) %336, i64 %13
  %338 = getelementptr i8, ptr addrspace(1) %337, i64 16
  %339 = getelementptr i8, ptr addrspace(1) %337, i64 2048
  %340 = getelementptr i8, ptr addrspace(1) %337, i64 2064
  %341 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %337) #10
  %342 = extractvalue { i32, i32, i32, i32 } %341, 0
  %343 = extractvalue { i32, i32, i32, i32 } %341, 1
  %344 = extractvalue { i32, i32, i32, i32 } %341, 2
  %345 = extractvalue { i32, i32, i32, i32 } %341, 3
  %346 = bitcast i32 %342 to float
  %347 = bitcast i32 %343 to float
  %348 = bitcast i32 %344 to float
  %349 = bitcast i32 %345 to float
  %350 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %338) #10
  %351 = extractvalue { i32, i32, i32, i32 } %350, 0
  %352 = extractvalue { i32, i32, i32, i32 } %350, 1
  %353 = extractvalue { i32, i32, i32, i32 } %350, 2
  %354 = extractvalue { i32, i32, i32, i32 } %350, 3
  %355 = bitcast i32 %351 to float
  %356 = bitcast i32 %352 to float
  %357 = bitcast i32 %353 to float
  %358 = bitcast i32 %354 to float
  %359 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %339) #10
  %360 = extractvalue { i32, i32, i32, i32 } %359, 0
  %361 = extractvalue { i32, i32, i32, i32 } %359, 1
  %362 = extractvalue { i32, i32, i32, i32 } %359, 2
  %363 = extractvalue { i32, i32, i32, i32 } %359, 3
  %364 = bitcast i32 %360 to float
  %365 = bitcast i32 %361 to float
  %366 = bitcast i32 %362 to float
  %367 = bitcast i32 %363 to float
  %368 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %340) #10
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %526, <1 x i32> %527, i1 %524) #10
  tail call void @llvm.nvvm.barrier0()
  %528 = icmp samesign ult i32 %5, 2
  %529 = zext nneg i32 %5 to i64
  %530 = getelementptr float, ptr addrspace(3) @global_smem, i64 %529
  %531 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %530, i1 %528) #10
  %532 = bitcast i32 %531 to float
  %533 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %531, i32 1, i32 31)
  %534 = bitcast i32 %533 to float
  %535 = fadd float %532, %534
  %536 = icmp eq i32 %5, 0
  %537 = bitcast float %535 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %530, <1 x i32> %537, i1 %536) #10
  tail call void @llvm.nvvm.barrier0()
  %538 = load float, ptr addrspace(3) @global_smem, align 16
  %539 = fmul float %538, 0x3F50000000000000
  %540 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
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
  %562 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %560) #10
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
  %579 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %561) #10
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
  %596 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %571) #10
  %597 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %572) #10
  %598 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %573) #10
  %599 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %574) #10
  %600 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %575) #10
  %601 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %576) #10
  %602 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %577) #10
  %603 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %578) #10
  %604 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %588) #10
  %605 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %589) #10
  %606 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %590) #10
  %607 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %591) #10
  %608 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %592) #10
  %609 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %593) #10
  %610 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %594) #10
  %611 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %595) #10
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
  %628 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %612) #10
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %649, i32 %652, i32 %655, i32 %658, ptr addrspace(1) %645) #10
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %661, i32 %664, i32 %667, i32 %670, ptr addrspace(1) %646) #10
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_add_fusion_3(ptr noalias readonly align 128 captures(none) dereferenceable(1179648) %0, ptr noalias readonly align 128 captures(none) dereferenceable(65536) %1, ptr noalias readonly align 128 captures(none) dereferenceable(65536) %2, ptr noalias align 128 captures(none) dereferenceable(131072) %3, ptr noalias readonly align 128 captures(none) dereferenceable(65536) %4, ptr noalias readonly align 128 captures(none) dereferenceable(65536) %5) local_unnamed_addr #0 {
  %7 = addrspacecast ptr %5 to ptr addrspace(1)
  %8 = addrspacecast ptr %4 to ptr addrspace(1)
  %9 = addrspacecast ptr %3 to ptr addrspace(1)
  %10 = addrspacecast ptr %2 to ptr addrspace(1)
  %11 = addrspacecast ptr %1 to ptr addrspace(1)
  %12 = addrspacecast ptr %0 to ptr addrspace(1)
  %13 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %14 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %15 = lshr i32 %14, 3
  %16 = shl nuw nsw i32 %14, 7
  %17 = and i32 %16, 896
  %18 = or disjoint i32 %17, %13
  %19 = or disjoint i32 %16, %13
  %20 = zext nneg i32 %19 to i64
  %21 = getelementptr inbounds bfloat, ptr addrspace(1) %8, i64 %20
  %22 = load bfloat, ptr addrspace(1) %21, align 2, !invariant.load !6
  %23 = fpext bfloat %22 to float
  %24 = getelementptr inbounds float, ptr addrspace(1) %9, i64 %20
  %25 = load float, ptr addrspace(1) %24, align 4
  %26 = getelementptr inbounds bfloat, ptr addrspace(1) %7, i64 %20
  %27 = load bfloat, ptr addrspace(1) %26, align 2, !invariant.load !6
  %28 = mul nuw nsw i32 %15, 18432
  %29 = zext nneg i32 %18 to i64
  %30 = zext nneg i32 %28 to i64
  %31 = add i64 %30, %29
  %32 = getelementptr bfloat, ptr addrspace(1) %12, i64 %31
  %33 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 10240
  %34 = load bfloat, ptr addrspace(1) %33, align 2, !invariant.load !6, !alias.scope !51
  %35 = fpext bfloat %34 to float
  %36 = fadd float %25, %23
  %37 = fpext bfloat %27 to float
  %38 = fadd float %36, %35
  %39 = getelementptr inbounds bfloat, ptr addrspace(1) %10, i64 %20
  %40 = load bfloat, ptr addrspace(1) %39, align 2, !invariant.load !6
  %41 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 8192
  %42 = load bfloat, ptr addrspace(1) %41, align 2, !invariant.load !6, !alias.scope !54
  %43 = fpext bfloat %42 to float
  %44 = fadd float %38, %37
  %45 = fpext bfloat %40 to float
  %46 = fadd float %44, %43
  %47 = getelementptr inbounds bfloat, ptr addrspace(1) %11, i64 %20
  %48 = load bfloat, ptr addrspace(1) %47, align 2, !invariant.load !6
  %49 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 6144
  %50 = load bfloat, ptr addrspace(1) %49, align 2, !invariant.load !6, !alias.scope !57
  %51 = fpext bfloat %50 to float
  %52 = fadd float %46, %45
  %53 = fpext bfloat %48 to float
  %54 = fadd float %52, %51
  %55 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 4096
  %56 = load bfloat, ptr addrspace(1) %55, align 2, !invariant.load !6, !alias.scope !60
  %57 = fpext bfloat %56 to float
  %58 = fadd float %54, %53
  %59 = fadd float %58, %57
  store float %59, ptr addrspace(1) %24, align 4
  ret void
}

define ptx_kernel void @fusion_246(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(65536) %arg3, ptr noalias align 128 dereferenceable(1179648) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5) local_unnamed_addr #6 {
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %3 = mul nsw i64 %2, 18432
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
  %70 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %69
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
  %123 = getelementptr float, ptr addrspace(1) %arg25, i64 %69
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
  %283 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %14
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

define ptx_kernel void @fusion_247(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(65536) %arg3, ptr noalias align 128 dereferenceable(1179648) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5, ptr noalias align 128 dereferenceable(65536) %arg6) local_unnamed_addr #6 {
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %3 = mul nsw i64 %2, 18432
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
  %67 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %66
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
  %174 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %66
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
  %227 = getelementptr float, ptr addrspace(1) %arg25, i64 %66
  %228 = getelementptr float, ptr addrspace(1) %227, i64 %13
  %229 = getelementptr i8, ptr addrspace(1) %228, i64 16
  %230 = getelementptr i8, ptr addrspace(1) %228, i64 2048
  %231 = getelementptr i8, ptr addrspace(1) %228, i64 2064
  %232 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %228) #10
  %233 = extractvalue { i32, i32, i32, i32 } %232, 0
  %234 = extractvalue { i32, i32, i32, i32 } %232, 1
  %235 = extractvalue { i32, i32, i32, i32 } %232, 2
  %236 = extractvalue { i32, i32, i32, i32 } %232, 3
  %237 = bitcast i32 %233 to float
  %238 = bitcast i32 %234 to float
  %239 = bitcast i32 %235 to float
  %240 = bitcast i32 %236 to float
  %241 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %229) #10
  %242 = extractvalue { i32, i32, i32, i32 } %241, 0
  %243 = extractvalue { i32, i32, i32, i32 } %241, 1
  %244 = extractvalue { i32, i32, i32, i32 } %241, 2
  %245 = extractvalue { i32, i32, i32, i32 } %241, 3
  %246 = bitcast i32 %242 to float
  %247 = bitcast i32 %243 to float
  %248 = bitcast i32 %244 to float
  %249 = bitcast i32 %245 to float
  %250 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %230) #10
  %251 = extractvalue { i32, i32, i32, i32 } %250, 0
  %252 = extractvalue { i32, i32, i32, i32 } %250, 1
  %253 = extractvalue { i32, i32, i32, i32 } %250, 2
  %254 = extractvalue { i32, i32, i32, i32 } %250, 3
  %255 = bitcast i32 %251 to float
  %256 = bitcast i32 %252 to float
  %257 = bitcast i32 %253 to float
  %258 = bitcast i32 %254 to float
  %259 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %231) #10
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %385, <1 x i32> %386, i1 %383) #10
  tail call void @llvm.nvvm.barrier0()
  %387 = icmp samesign ult i32 %5, 2
  %388 = zext nneg i32 %5 to i64
  %389 = getelementptr float, ptr addrspace(3) @global_smem, i64 %388
  %390 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %389, i1 %387) #10
  %391 = bitcast i32 %390 to float
  %392 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %390, i32 1, i32 31)
  %393 = bitcast i32 %392 to float
  %394 = fadd float %391, %393
  %395 = icmp eq i32 %5, 0
  %396 = bitcast float %394 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %389, <1 x i32> %396, i1 %395) #10
  tail call void @llvm.nvvm.barrier0()
  %397 = load float, ptr addrspace(3) @global_smem, align 16
  %398 = fmul float %397, 0x3F50000000000000
  %399 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
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
  %421 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %419) #10
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
  %438 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %420) #10
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
  %455 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %430) #10
  %456 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %431) #10
  %457 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %432) #10
  %458 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %433) #10
  %459 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %434) #10
  %460 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %435) #10
  %461 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %436) #10
  %462 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %437) #10
  %463 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %447) #10
  %464 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %448) #10
  %465 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %449) #10
  %466 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %450) #10
  %467 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %451) #10
  %468 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %452) #10
  %469 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %453) #10
  %470 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %454) #10
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
  %487 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %471) #10
  %488 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %472) #10
  %489 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %473) #10
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %508, i32 %511, i32 %514, i32 %517, ptr addrspace(1) %504) #10
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %520, i32 %523, i32 %526, i32 %529, ptr addrspace(1) %505) #10
  ret void
}

define ptx_kernel void @fusion_248(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(65536) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(131072) %arg3, ptr noalias align 128 dereferenceable(65536) %arg4, ptr noalias align 128 dereferenceable(1179648) %arg5, ptr noalias align 128 dereferenceable(65536) %arg6, ptr noalias align 128 dereferenceable(65536) %arg7) local_unnamed_addr #6 {
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
  %66 = mul nsw i64 %2, 18432
  %67 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %66
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
  %120 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %3
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
  %227 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %3
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
  %280 = getelementptr float, ptr addrspace(1) %arg37, i64 %3
  %281 = getelementptr float, ptr addrspace(1) %280, i64 %13
  %282 = getelementptr i8, ptr addrspace(1) %281, i64 16
  %283 = getelementptr i8, ptr addrspace(1) %281, i64 2048
  %284 = getelementptr i8, ptr addrspace(1) %281, i64 2064
  %285 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %281) #10
  %286 = extractvalue { i32, i32, i32, i32 } %285, 0
  %287 = extractvalue { i32, i32, i32, i32 } %285, 1
  %288 = extractvalue { i32, i32, i32, i32 } %285, 2
  %289 = extractvalue { i32, i32, i32, i32 } %285, 3
  %290 = bitcast i32 %286 to float
  %291 = bitcast i32 %287 to float
  %292 = bitcast i32 %288 to float
  %293 = bitcast i32 %289 to float
  %294 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %282) #10
  %295 = extractvalue { i32, i32, i32, i32 } %294, 0
  %296 = extractvalue { i32, i32, i32, i32 } %294, 1
  %297 = extractvalue { i32, i32, i32, i32 } %294, 2
  %298 = extractvalue { i32, i32, i32, i32 } %294, 3
  %299 = bitcast i32 %295 to float
  %300 = bitcast i32 %296 to float
  %301 = bitcast i32 %297 to float
  %302 = bitcast i32 %298 to float
  %303 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %283) #10
  %304 = extractvalue { i32, i32, i32, i32 } %303, 0
  %305 = extractvalue { i32, i32, i32, i32 } %303, 1
  %306 = extractvalue { i32, i32, i32, i32 } %303, 2
  %307 = extractvalue { i32, i32, i32, i32 } %303, 3
  %308 = bitcast i32 %304 to float
  %309 = bitcast i32 %305 to float
  %310 = bitcast i32 %306 to float
  %311 = bitcast i32 %307 to float
  %312 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %284) #10
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %454, <1 x i32> %455, i1 %452) #10
  tail call void @llvm.nvvm.barrier0()
  %456 = icmp samesign ult i32 %5, 2
  %457 = zext nneg i32 %5 to i64
  %458 = getelementptr float, ptr addrspace(3) @global_smem, i64 %457
  %459 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %458, i1 %456) #10
  %460 = bitcast i32 %459 to float
  %461 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %459, i32 1, i32 31)
  %462 = bitcast i32 %461 to float
  %463 = fadd float %460, %462
  %464 = icmp eq i32 %5, 0
  %465 = bitcast float %463 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %458, <1 x i32> %465, i1 %464) #10
  tail call void @llvm.nvvm.barrier0()
  %466 = load float, ptr addrspace(3) @global_smem, align 16
  %467 = fmul float %466, 0x3F50000000000000
  %468 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
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
  %490 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %488) #10
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
  %507 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %489) #10
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
  %524 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %499) #10
  %525 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %500) #10
  %526 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %501) #10
  %527 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %502) #10
  %528 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %503) #10
  %529 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %504) #10
  %530 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %505) #10
  %531 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %506) #10
  %532 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %516) #10
  %533 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %517) #10
  %534 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %518) #10
  %535 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %519) #10
  %536 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %520) #10
  %537 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %521) #10
  %538 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %522) #10
  %539 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %523) #10
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
  %556 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %540) #10
  %557 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %541) #10
  %558 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %542) #10
  %559 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %543) #10
  %560 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %544) #10
  %561 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %545) #10
  %562 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %546) #10
  %563 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %547) #10
  %564 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %548) #10
  %565 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %549) #10
  %566 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %550) #10
  %567 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %551) #10
  %568 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %552) #10
  %569 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %553) #10
  %570 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %554) #10
  %571 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %555) #10
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %577, i32 %580, i32 %583, i32 %586, ptr addrspace(1) %573) #10
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %589, i32 %592, i32 %595, i32 %598, ptr addrspace(1) %574) #10
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @wrapped_slice(ptr noalias readonly align 128 captures(none) dereferenceable(262144) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(65536) %1) local_unnamed_addr #0 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %7 = shl nuw nsw i32 %6, 7
  %8 = and i32 %7, 896
  %9 = shl nuw nsw i32 %6, 9
  %10 = and i32 %9, 126976
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

define ptx_kernel void @fusion_210(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(262144) %arg1, ptr noalias align 16 dereferenceable(256) %arg2, ptr noalias align 128 dereferenceable(131072) %arg3) local_unnamed_addr #6 {
  %arg336 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg234 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg132 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg030 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %3 = shl nsw i64 %2, 9
  %4 = and i64 %3, 512
  %5 = shl nsw i64 %2, 11
  %6 = or disjoint i64 %5, %4
  %7 = or i64 %6, 2048
  %8 = getelementptr bfloat, ptr addrspace(1) %arg132, i64 %7
  %9 = tail call range(i32 0, 64) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %10 = shl nuw nsw i32 %9, 3
  %11 = and i32 %10, 120
  %12 = and i32 %10, 248
  %13 = icmp samesign ugt i32 %9, 31
  %14 = select i1 %13, i32 256, i32 0
  %15 = or disjoint i32 %12, %14
  %16 = zext nneg i32 %15 to i64
  %17 = getelementptr bfloat, ptr addrspace(1) %8, i64 %16
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #10
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
  %35 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #10
  %36 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #10
  %37 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #10
  %38 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #10
  %39 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #10
  %40 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #10
  %41 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #10
  %42 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #10
  %43 = fmul float %35, %35
  %44 = fmul float %36, %36
  %45 = fmul float %37, %37
  %46 = fmul float %38, %38
  %47 = fmul float %39, %39
  %48 = fmul float %40, %40
  %49 = fmul float %41, %41
  %50 = fmul float %42, %42
  %51 = fadd float %43, %44
  %52 = fadd float %51, %45
  %53 = fadd float %52, %46
  %54 = fadd float %53, %47
  %55 = fadd float %54, %48
  %56 = fadd float %55, %49
  %57 = fadd float %56, %50
  %58 = bitcast float %57 to i32
  %59 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %58, i32 8, i32 31)
  %60 = bitcast i32 %59 to float
  %61 = fadd float %57, %60
  %62 = bitcast float %61 to i32
  %63 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %62, i32 4, i32 31)
  %64 = bitcast i32 %63 to float
  %65 = fadd float %61, %64
  %66 = bitcast float %65 to i32
  %67 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %66, i32 2, i32 31)
  %68 = bitcast i32 %67 to float
  %69 = fadd float %65, %68
  %70 = bitcast float %69 to i32
  %71 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %70, i32 1, i32 31)
  %72 = bitcast i32 %71 to float
  %73 = fadd float %69, %72
  %74 = fmul float %73, 7.812500e-03
  %75 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg030) #10
  %76 = bitcast i32 %75 to float
  %77 = fadd float %74, %76
  %78 = tail call float @llvm.nvvm.rsqrt.approx.f(float %77)
  %79 = fmul float %35, %78
  %80 = fmul float %36, %78
  %81 = fmul float %37, %78
  %82 = fmul float %38, %78
  %83 = fmul float %39, %78
  %84 = fmul float %40, %78
  %85 = fmul float %41, %78
  %86 = fmul float %42, %78
  %87 = shl nuw nsw i32 %9, 1
  %88 = and i32 %87, 62
  %89 = select i1 %13, i32 64, i32 0
  %90 = or disjoint i32 %88, %89
  %91 = shl nuw nsw i32 %9, 2
  %92 = and i32 %91, 124
  %93 = zext nneg i32 %90 to i64
  %94 = zext nneg i32 %92 to i64
  %95 = getelementptr bfloat, ptr addrspace(1) %arg234, i64 %93
  %96 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %95) #10
  %extelt.offset = lshr i32 %96, 16
  %97 = trunc nuw i32 %extelt.offset to i16
  %98 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %93
  %99 = trunc i32 %96 to i16
  tail call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %98, i16 %99, i16 %97, i1 true) #10
  tail call void @llvm.nvvm.barrier0()
  %100 = zext nneg i32 %11 to i64
  %101 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %100
  %102 = load <8 x bfloat>, ptr addrspace(3) %101, align 16
  %103 = extractelement <8 x bfloat> %102, i32 0
  %104 = extractelement <8 x bfloat> %102, i32 1
  %105 = extractelement <8 x bfloat> %102, i32 2
  %106 = extractelement <8 x bfloat> %102, i32 3
  %107 = extractelement <8 x bfloat> %102, i32 4
  %108 = extractelement <8 x bfloat> %102, i32 5
  %109 = extractelement <8 x bfloat> %102, i32 6
  %110 = extractelement <8 x bfloat> %102, i32 7
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #10
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #10
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #10
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %106) #10
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %107) #10
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %108) #10
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %109) #10
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %110) #10
  %119 = fmul float %79, %111
  %120 = fmul float %80, %112
  %121 = fmul float %81, %113
  %122 = fmul float %82, %114
  %123 = fmul float %83, %115
  %124 = fmul float %84, %116
  %125 = fmul float %85, %117
  %126 = fmul float %86, %118
  %127 = getelementptr i8, ptr addrspace(1) %arg336, i64 %5
  %128 = select i1 %13, i64 128, i64 0
  %129 = select i1 %13, i64 384, i64 256
  %130 = or disjoint i64 %128, %94
  %131 = or disjoint i64 %129, %94
  %132 = getelementptr float, ptr addrspace(1) %127, i64 %130
  %133 = getelementptr float, ptr addrspace(1) %127, i64 %131
  tail call void @llvm.nvvm.barrier0()
  %134 = select i1 %13, i32 128, i32 0
  %135 = or disjoint i32 %92, %134
  %136 = lshr i32 %15, 4
  %137 = and i32 %136, 24
  %138 = add nuw nsw i32 %137, %15
  %139 = zext nneg i32 %138 to i64
  %140 = getelementptr inbounds nuw float, ptr addrspace(3) @global_smem, i64 %139
  %141 = bitcast float %119 to i32
  %142 = bitcast float %120 to i32
  %143 = bitcast float %121 to i32
  %144 = bitcast float %122 to i32
  %145 = bitcast float %123 to i32
  %146 = bitcast float %124 to i32
  %147 = bitcast float %125 to i32
  %148 = bitcast float %126 to i32
  tail call void asm sideeffect "@$5 st.shared.v4.b32 [ $0 + 0 ], { $1, $2, $3, $4 };", "r,r,r,r,r,b"(ptr addrspace(3) %140, i32 %141, i32 %142, i32 %143, i32 %144, i1 true) #10
  %149 = getelementptr inbounds nuw i8, ptr addrspace(3) %140, i64 16
  tail call void asm sideeffect "@$5 st.shared.v4.b32 [ $0 + 0 ], { $1, $2, $3, $4 };", "r,r,r,r,r,b"(ptr addrspace(3) nonnull %149, i32 %145, i32 %146, i32 %147, i32 %148, i1 true) #10
  tail call void @llvm.nvvm.barrier0()
  %150 = lshr exact i32 %134, 4
  %151 = add nuw nsw i32 %150, %135
  %152 = zext nneg i32 %151 to i64
  %153 = getelementptr inbounds nuw float, ptr addrspace(3) @global_smem, i64 %152
  %154 = or disjoint i32 %135, 256
  %155 = lshr i32 %154, 4
  %156 = and i32 %155, 24
  %157 = zext nneg i32 %156 to i64
  %158 = zext nneg i32 %135 to i64
  %159 = add i64 %157, %158
  %160 = getelementptr float, ptr addrspace(3) @global_smem, i64 %159
  %161 = getelementptr inbounds i8, ptr addrspace(3) %160, i64 1024
  %162 = load <4 x i32>, ptr addrspace(3) %161, align 16
  %163 = load <4 x i32>, ptr addrspace(3) %153, align 16
  %.extract38 = extractelement <4 x i32> %163, i32 0
  %.extract2339 = extractelement <4 x i32> %163, i32 1
  %.extract2440 = extractelement <4 x i32> %163, i32 2
  %.extract2541 = extractelement <4 x i32> %163, i32 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract38, i32 %.extract2339, i32 %.extract2440, i32 %.extract2541, ptr addrspace(1) %132) #10
  %.extract26 = extractelement <4 x i32> %162, i64 0
  %.extract27 = extractelement <4 x i32> %162, i64 1
  %.extract28 = extractelement <4 x i32> %162, i64 2
  %.extract29 = extractelement <4 x i32> %162, i64 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract26, i32 %.extract27, i32 %.extract28, i32 %.extract29, ptr addrspace(1) %133) #10
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite)
define ptx_kernel void @input_concatenate_fusion(ptr noalias readonly align 128 captures(none) dereferenceable(131072) %0, ptr noalias readonly align 16 captures(none) dereferenceable(10485760) %1, ptr noalias readonly align 16 captures(none) dereferenceable(128) %2, ptr noalias writeonly align 128 captures(none) dereferenceable(65536) %3) local_unnamed_addr #7 {
  %5 = addrspacecast ptr %3 to ptr addrspace(1)
  %6 = addrspacecast ptr %2 to ptr addrspace(1)
  %7 = addrspacecast ptr %1 to ptr addrspace(1)
  %8 = addrspacecast ptr %0 to ptr addrspace(1)
  %9 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %10 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %11 = lshr i32 %10, 2
  %12 = and i32 %9, 63
  %13 = shl nuw nsw i32 %9, 1
  %14 = and i32 %13, 128
  %15 = shl nuw nsw i32 %10, 8
  %16 = or disjoint i32 %14, %15
  %17 = or disjoint i32 %16, %12
  %18 = zext nneg i32 %17 to i64
  %19 = getelementptr float, ptr addrspace(1) %8, i64 %18
  %20 = load float, ptr addrspace(1) %19, align 4, !invariant.load !6
  tail call void @llvm.experimental.noalias.scope.decl(metadata !63)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !66)
  %21 = zext nneg i32 %11 to i64
  %22 = getelementptr inbounds i32, ptr addrspace(1) %6, i64 %21
  %23 = load i32, ptr addrspace(1) %22, align 4, !invariant.load !6, !alias.scope !66, !noalias !63
  %24 = tail call i32 @llvm.smin.i32(i32 %23, i32 40959)
  %25 = tail call i32 @llvm.smax.i32(i32 %24, i32 0)
  %26 = shl nuw nsw i32 %25, 7
  %27 = or disjoint i32 %26, %12
  %28 = zext nneg i32 %27 to i64
  %29 = getelementptr inbounds bfloat, ptr addrspace(1) %7, i64 %28
  %30 = load bfloat, ptr addrspace(1) %29, align 2, !invariant.load !6, !alias.scope !63, !noalias !66
  %31 = fpext bfloat %30 to float
  %32 = fmul float %20, %31
  %33 = getelementptr inbounds i8, ptr addrspace(1) %19, i64 256
  %34 = load float, ptr addrspace(1) %33, align 4, !invariant.load !6
  %35 = or disjoint i32 %9, %26
  %36 = or i32 %35, 64
  %37 = zext nneg i32 %36 to i64
  %38 = getelementptr inbounds bfloat, ptr addrspace(1) %7, i64 %37
  %39 = load bfloat, ptr addrspace(1) %38, align 2, !invariant.load !6, !alias.scope !68, !noalias !71
  %40 = fpext bfloat %39 to float
  %41 = fmul float %34, %40
  %42 = fsub float %32, %41
  %43 = fptrunc float %42 to bfloat
  %44 = getelementptr bfloat, ptr addrspace(1) %5, i64 %18
  store bfloat %43, ptr addrspace(1) %44, align 2
  %45 = fmul float %34, %31
  %46 = fmul float %20, %40
  %47 = fadd float %45, %46
  %48 = fptrunc float %47 to bfloat
  %49 = getelementptr inbounds i8, ptr addrspace(1) %44, i64 128
  store bfloat %48, ptr addrspace(1) %49, align 2
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
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !73
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
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !73
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
attributes #4 = { "nvvm.reqntid"="128,1,1" }
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
!5 = !{i32 0, i32 256}
!6 = !{}
!7 = !{i32 0, i32 294912}
!8 = !{i32 0, i32 768}
!9 = !{!10}
!10 = distinct !{!10, !11, !"fused_convert_param_0_571: argument 0"}
!11 = distinct !{!11, !"fused_convert_param_0_571"}
!12 = !{!13}
!13 = distinct !{!13, !14, !"fused_convert_param_0_571: argument 0"}
!14 = distinct !{!14, !"fused_convert_param_0_571"}
!15 = !{!16}
!16 = distinct !{!16, !17, !"fused_add_convert_879_26: argument 0"}
!17 = distinct !{!17, !"fused_add_convert_879_26"}
!18 = !{!19}
!19 = distinct !{!19, !20, !"fused_add_convert_879_26: argument 0"}
!20 = distinct !{!20, !"fused_add_convert_879_26"}
!21 = !{!22}
!22 = distinct !{!22, !23, !"fused_add_convert_879_26: argument 0"}
!23 = distinct !{!23, !"fused_add_convert_879_26"}
!24 = !{!25}
!25 = distinct !{!25, !26, !"fused_add_convert_879_26: argument 0"}
!26 = distinct !{!26, !"fused_add_convert_879_26"}
!27 = !{!28}
!28 = distinct !{!28, !29, !"fused_add_1_convert_879_34: argument 0"}
!29 = distinct !{!29, !"fused_add_1_convert_879_34"}
!30 = !{!31}
!31 = distinct !{!31, !32, !"fused_add_1_convert_879_34: argument 0"}
!32 = distinct !{!32, !"fused_add_1_convert_879_34"}
!33 = !{!34}
!34 = distinct !{!34, !35, !"fused_add_1_convert_879_34: argument 0"}
!35 = distinct !{!35, !"fused_add_1_convert_879_34"}
!36 = !{!37}
!37 = distinct !{!37, !38, !"fused_add_1_convert_879_34: argument 0"}
!38 = distinct !{!38, !"fused_add_1_convert_879_34"}
!39 = !{!40}
!40 = distinct !{!40, !41, !"fused_add_2_convert_879_42: argument 0"}
!41 = distinct !{!41, !"fused_add_2_convert_879_42"}
!42 = !{!43}
!43 = distinct !{!43, !44, !"fused_add_2_convert_879_42: argument 0"}
!44 = distinct !{!44, !"fused_add_2_convert_879_42"}
!45 = !{!46}
!46 = distinct !{!46, !47, !"fused_add_2_convert_879_42: argument 0"}
!47 = distinct !{!47, !"fused_add_2_convert_879_42"}
!48 = !{!49}
!49 = distinct !{!49, !50, !"fused_add_2_convert_879_42: argument 0"}
!50 = distinct !{!50, !"fused_add_2_convert_879_42"}
!51 = !{!52}
!52 = distinct !{!52, !53, !"fused_add_3_convert_879_50: argument 0"}
!53 = distinct !{!53, !"fused_add_3_convert_879_50"}
!54 = !{!55}
!55 = distinct !{!55, !56, !"fused_add_3_convert_879_50: argument 0"}
!56 = distinct !{!56, !"fused_add_3_convert_879_50"}
!57 = !{!58}
!58 = distinct !{!58, !59, !"fused_add_3_convert_879_50: argument 0"}
!59 = distinct !{!59, !"fused_add_3_convert_879_50"}
!60 = !{!61}
!61 = distinct !{!61, !62, !"fused_add_3_convert_879_50: argument 0"}
!62 = distinct !{!62, !"fused_add_3_convert_879_50"}
!63 = !{!64}
!64 = distinct !{!64, !65, !"fused_concatenate_convert_1141_7: argument 0"}
!65 = distinct !{!65, !"fused_concatenate_convert_1141_7"}
!66 = !{!67}
!67 = distinct !{!67, !65, !"fused_concatenate_convert_1141_7: argument 1"}
!68 = !{!69}
!69 = distinct !{!69, !70, !"fused_concatenate_convert_1141_7: argument 0"}
!70 = distinct !{!70, !"fused_concatenate_convert_1141_7"}
!71 = !{!72}
!72 = distinct !{!72, !70, !"fused_concatenate_convert_1141_7: argument 1"}
!73 = !{i32 0, i32 135456}

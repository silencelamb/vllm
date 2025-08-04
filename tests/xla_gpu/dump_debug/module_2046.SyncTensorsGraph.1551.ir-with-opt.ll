; ModuleID = 'SyncTensorsGraph.1551'
source_filename = "SyncTensorsGraph.1551"
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
define ptx_kernel void @wrapped_concatenate(ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %0, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %1, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %2, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %3, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %4, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %5, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %6, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %7, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %8, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %9, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %10, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %11, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %12, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %13, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %14, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %15, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %16, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %17, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %18, ptr noalias writeonly align 128 captures(none) dereferenceable(79691776) %19) local_unnamed_addr #2 {
  %21 = addrspacecast ptr %19 to ptr addrspace(1)
  %22 = addrspacecast ptr %18 to ptr addrspace(1)
  %23 = addrspacecast ptr %17 to ptr addrspace(1)
  %24 = addrspacecast ptr %16 to ptr addrspace(1)
  %25 = addrspacecast ptr %15 to ptr addrspace(1)
  %26 = addrspacecast ptr %14 to ptr addrspace(1)
  %27 = addrspacecast ptr %13 to ptr addrspace(1)
  %28 = addrspacecast ptr %12 to ptr addrspace(1)
  %29 = addrspacecast ptr %11 to ptr addrspace(1)
  %30 = addrspacecast ptr %10 to ptr addrspace(1)
  %31 = addrspacecast ptr %9 to ptr addrspace(1)
  %32 = addrspacecast ptr %8 to ptr addrspace(1)
  %33 = addrspacecast ptr %7 to ptr addrspace(1)
  %34 = addrspacecast ptr %6 to ptr addrspace(1)
  %35 = addrspacecast ptr %5 to ptr addrspace(1)
  %36 = addrspacecast ptr %4 to ptr addrspace(1)
  %37 = addrspacecast ptr %3 to ptr addrspace(1)
  %38 = addrspacecast ptr %2 to ptr addrspace(1)
  %39 = addrspacecast ptr %1 to ptr addrspace(1)
  %40 = addrspacecast ptr %0 to ptr addrspace(1)
  %41 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %42 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !7
  %43 = lshr i32 %42, 4
  %44 = icmp samesign ult i32 %42, 147456
  br i1 %44, label %45, label %143

45:                                               ; preds = %20
  %46 = icmp samesign ult i32 %42, 65536
  br i1 %46, label %47, label %86

47:                                               ; preds = %45
  %48 = icmp samesign ult i32 %42, 32768
  %49 = shl nuw nsw i32 %42, 7
  br i1 %48, label %50, label %66

50:                                               ; preds = %47
  %51 = icmp samesign ult i32 %42, 16384
  br i1 %51, label %52, label %56

52:                                               ; preds = %50
  %53 = or disjoint i32 %49, %41
  %54 = zext nneg i32 %53 to i64
  %55 = getelementptr inbounds bfloat, ptr addrspace(1) %40, i64 %54
  br label %259

56:                                               ; preds = %50
  %57 = and i32 %49, 1920
  %58 = shl nuw nsw i32 %43, 11
  %59 = sext i32 %41 to i64
  %60 = sext i32 %57 to i64
  %61 = sext i32 %58 to i64
  %62 = add i64 %61, %60
  %63 = add i64 %62, %59
  %64 = getelementptr bfloat, ptr addrspace(1) %39, i64 %63
  %65 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 -4194304
  br label %259

66:                                               ; preds = %47
  %67 = icmp samesign ult i32 %42, 49152
  %68 = and i32 %49, 1920
  %69 = shl nuw nsw i32 %43, 11
  br i1 %67, label %70, label %78

70:                                               ; preds = %66
  %71 = sext i32 %41 to i64
  %72 = sext i32 %68 to i64
  %73 = sext i32 %69 to i64
  %74 = add i64 %73, %72
  %75 = add i64 %74, %71
  %76 = getelementptr bfloat, ptr addrspace(1) %38, i64 %75
  %77 = getelementptr inbounds i8, ptr addrspace(1) %76, i64 -8388608
  br label %259

78:                                               ; preds = %66
  %79 = sext i32 %41 to i64
  %80 = sext i32 %68 to i64
  %81 = sext i32 %69 to i64
  %82 = add i64 %81, %80
  %83 = add i64 %82, %79
  %84 = getelementptr bfloat, ptr addrspace(1) %37, i64 %83
  %85 = getelementptr inbounds i8, ptr addrspace(1) %84, i64 -12582912
  br label %259

86:                                               ; preds = %45
  %87 = icmp samesign ult i32 %42, 98304
  br i1 %87, label %88, label %109

88:                                               ; preds = %86
  %89 = icmp samesign ult i32 %42, 81920
  %90 = shl nuw nsw i32 %42, 7
  %91 = and i32 %90, 1920
  %92 = shl nuw nsw i32 %43, 11
  br i1 %89, label %93, label %101

93:                                               ; preds = %88
  %94 = sext i32 %41 to i64
  %95 = sext i32 %91 to i64
  %96 = sext i32 %92 to i64
  %97 = add i64 %96, %95
  %98 = add i64 %97, %94
  %99 = getelementptr bfloat, ptr addrspace(1) %36, i64 %98
  %100 = getelementptr inbounds i8, ptr addrspace(1) %99, i64 -16777216
  br label %259

101:                                              ; preds = %88
  %102 = sext i32 %41 to i64
  %103 = sext i32 %91 to i64
  %104 = sext i32 %92 to i64
  %105 = add i64 %104, %103
  %106 = add i64 %105, %102
  %107 = getelementptr bfloat, ptr addrspace(1) %35, i64 %106
  %108 = getelementptr inbounds i8, ptr addrspace(1) %107, i64 -20971520
  br label %259

109:                                              ; preds = %86
  %110 = icmp samesign ult i32 %42, 114688
  br i1 %110, label %111, label %122

111:                                              ; preds = %109
  %112 = shl nuw nsw i32 %42, 7
  %113 = and i32 %112, 1920
  %114 = shl nuw nsw i32 %43, 11
  %115 = sext i32 %41 to i64
  %116 = sext i32 %113 to i64
  %117 = sext i32 %114 to i64
  %118 = add i64 %117, %116
  %119 = add i64 %118, %115
  %120 = getelementptr bfloat, ptr addrspace(1) %34, i64 %119
  %121 = getelementptr inbounds i8, ptr addrspace(1) %120, i64 -25165824
  br label %259

122:                                              ; preds = %109
  %123 = icmp samesign ult i32 %42, 131072
  %124 = shl nuw nsw i32 %42, 7
  %125 = and i32 %124, 1920
  %126 = shl nuw nsw i32 %43, 11
  br i1 %123, label %127, label %135

127:                                              ; preds = %122
  %128 = sext i32 %41 to i64
  %129 = sext i32 %125 to i64
  %130 = sext i32 %126 to i64
  %131 = add i64 %130, %129
  %132 = add i64 %131, %128
  %133 = getelementptr bfloat, ptr addrspace(1) %33, i64 %132
  %134 = getelementptr inbounds i8, ptr addrspace(1) %133, i64 -29360128
  br label %259

135:                                              ; preds = %122
  %136 = sext i32 %41 to i64
  %137 = sext i32 %125 to i64
  %138 = sext i32 %126 to i64
  %139 = add i64 %138, %137
  %140 = add i64 %139, %136
  %141 = getelementptr bfloat, ptr addrspace(1) %32, i64 %140
  %142 = getelementptr inbounds i8, ptr addrspace(1) %141, i64 -33554432
  br label %259

143:                                              ; preds = %20
  %144 = icmp samesign ult i32 %42, 229376
  br i1 %144, label %145, label %202

145:                                              ; preds = %143
  %146 = icmp samesign ult i32 %42, 180224
  br i1 %146, label %147, label %168

147:                                              ; preds = %145
  %148 = icmp samesign ult i32 %42, 163840
  %149 = shl nuw nsw i32 %42, 7
  %150 = and i32 %149, 1920
  %151 = shl nuw nsw i32 %43, 11
  br i1 %148, label %152, label %160

152:                                              ; preds = %147
  %153 = sext i32 %41 to i64
  %154 = sext i32 %150 to i64
  %155 = sext i32 %151 to i64
  %156 = add i64 %155, %154
  %157 = add i64 %156, %153
  %158 = getelementptr bfloat, ptr addrspace(1) %31, i64 %157
  %159 = getelementptr inbounds i8, ptr addrspace(1) %158, i64 -37748736
  br label %259

160:                                              ; preds = %147
  %161 = sext i32 %41 to i64
  %162 = sext i32 %150 to i64
  %163 = sext i32 %151 to i64
  %164 = add i64 %163, %162
  %165 = add i64 %164, %161
  %166 = getelementptr bfloat, ptr addrspace(1) %30, i64 %165
  %167 = getelementptr inbounds i8, ptr addrspace(1) %166, i64 -41943040
  br label %259

168:                                              ; preds = %145
  %169 = icmp samesign ult i32 %42, 196608
  br i1 %169, label %170, label %181

170:                                              ; preds = %168
  %171 = shl nuw nsw i32 %42, 7
  %172 = and i32 %171, 1920
  %173 = shl nuw nsw i32 %43, 11
  %174 = sext i32 %41 to i64
  %175 = sext i32 %172 to i64
  %176 = sext i32 %173 to i64
  %177 = add i64 %176, %175
  %178 = add i64 %177, %174
  %179 = getelementptr bfloat, ptr addrspace(1) %29, i64 %178
  %180 = getelementptr inbounds i8, ptr addrspace(1) %179, i64 -46137344
  br label %259

181:                                              ; preds = %168
  %182 = icmp samesign ult i32 %42, 212992
  %183 = shl nuw nsw i32 %42, 7
  %184 = and i32 %183, 1920
  %185 = shl nuw nsw i32 %43, 11
  br i1 %182, label %186, label %194

186:                                              ; preds = %181
  %187 = sext i32 %41 to i64
  %188 = sext i32 %184 to i64
  %189 = sext i32 %185 to i64
  %190 = add i64 %189, %188
  %191 = add i64 %190, %187
  %192 = getelementptr bfloat, ptr addrspace(1) %28, i64 %191
  %193 = getelementptr inbounds i8, ptr addrspace(1) %192, i64 -50331648
  br label %259

194:                                              ; preds = %181
  %195 = sext i32 %41 to i64
  %196 = sext i32 %184 to i64
  %197 = sext i32 %185 to i64
  %198 = add i64 %197, %196
  %199 = add i64 %198, %195
  %200 = getelementptr bfloat, ptr addrspace(1) %27, i64 %199
  %201 = getelementptr inbounds i8, ptr addrspace(1) %200, i64 -54525952
  br label %259

202:                                              ; preds = %143
  %203 = icmp samesign ult i32 %42, 262144
  br i1 %203, label %204, label %225

204:                                              ; preds = %202
  %205 = icmp samesign ult i32 %42, 245760
  %206 = shl nuw nsw i32 %42, 7
  %207 = and i32 %206, 1920
  %208 = shl nuw nsw i32 %43, 11
  br i1 %205, label %209, label %217

209:                                              ; preds = %204
  %210 = sext i32 %41 to i64
  %211 = sext i32 %207 to i64
  %212 = sext i32 %208 to i64
  %213 = add i64 %212, %211
  %214 = add i64 %213, %210
  %215 = getelementptr bfloat, ptr addrspace(1) %26, i64 %214
  %216 = getelementptr inbounds i8, ptr addrspace(1) %215, i64 -58720256
  br label %259

217:                                              ; preds = %204
  %218 = sext i32 %41 to i64
  %219 = sext i32 %207 to i64
  %220 = sext i32 %208 to i64
  %221 = add i64 %220, %219
  %222 = add i64 %221, %218
  %223 = getelementptr bfloat, ptr addrspace(1) %25, i64 %222
  %224 = getelementptr inbounds i8, ptr addrspace(1) %223, i64 -62914560
  br label %259

225:                                              ; preds = %202
  %226 = icmp samesign ult i32 %42, 278528
  br i1 %226, label %227, label %238

227:                                              ; preds = %225
  %228 = shl nuw nsw i32 %42, 7
  %229 = and i32 %228, 1920
  %230 = shl nuw nsw i32 %43, 11
  %231 = sext i32 %41 to i64
  %232 = sext i32 %229 to i64
  %233 = sext i32 %230 to i64
  %234 = add i64 %233, %232
  %235 = add i64 %234, %231
  %236 = getelementptr bfloat, ptr addrspace(1) %24, i64 %235
  %237 = getelementptr inbounds i8, ptr addrspace(1) %236, i64 -67108864
  br label %259

238:                                              ; preds = %225
  %239 = icmp samesign ult i32 %42, 294912
  %240 = shl nuw nsw i32 %42, 7
  %241 = and i32 %240, 1920
  %242 = shl nuw nsw i32 %43, 11
  br i1 %239, label %243, label %251

243:                                              ; preds = %238
  %244 = sext i32 %41 to i64
  %245 = sext i32 %241 to i64
  %246 = sext i32 %242 to i64
  %247 = add i64 %246, %245
  %248 = add i64 %247, %244
  %249 = getelementptr bfloat, ptr addrspace(1) %23, i64 %248
  %250 = getelementptr inbounds i8, ptr addrspace(1) %249, i64 -71303168
  br label %259

251:                                              ; preds = %238
  %252 = sext i32 %41 to i64
  %253 = sext i32 %241 to i64
  %254 = sext i32 %242 to i64
  %255 = add i64 %254, %253
  %256 = add i64 %255, %252
  %257 = getelementptr bfloat, ptr addrspace(1) %22, i64 %256
  %258 = getelementptr inbounds i8, ptr addrspace(1) %257, i64 -75497472
  br label %259

259:                                              ; preds = %56, %52, %78, %70, %101, %93, %111, %135, %127, %160, %152, %170, %194, %186, %217, %209, %227, %251, %243
  %.pre-phi = phi i32 [ %49, %56 ], [ %49, %52 ], [ %49, %78 ], [ %49, %70 ], [ %90, %101 ], [ %90, %93 ], [ %112, %111 ], [ %124, %135 ], [ %124, %127 ], [ %149, %160 ], [ %149, %152 ], [ %171, %170 ], [ %183, %194 ], [ %183, %186 ], [ %206, %217 ], [ %206, %209 ], [ %228, %227 ], [ %240, %251 ], [ %240, %243 ]
  %.in = phi ptr addrspace(1) [ %65, %56 ], [ %55, %52 ], [ %85, %78 ], [ %77, %70 ], [ %108, %101 ], [ %100, %93 ], [ %121, %111 ], [ %142, %135 ], [ %134, %127 ], [ %167, %160 ], [ %159, %152 ], [ %180, %170 ], [ %201, %194 ], [ %193, %186 ], [ %224, %217 ], [ %216, %209 ], [ %237, %227 ], [ %258, %251 ], [ %250, %243 ]
  %260 = load bfloat, ptr addrspace(1) %.in, align 2, !invariant.load !6
  %261 = or disjoint i32 %.pre-phi, %41
  %262 = zext nneg i32 %261 to i64
  %263 = getelementptr inbounds bfloat, ptr addrspace(1) %21, i64 %262
  store bfloat %260, ptr addrspace(1) %263, align 2
  ret void
}

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #3

define ptx_kernel void @gemm_fusion_dot_76_0(ptr noalias align 128 dereferenceable(79691776) %arg0, ptr noalias align 128 dereferenceable(1245184) %arg1) local_unnamed_addr #4 {
  %arg1269 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0267 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %.frozen = freeze i32 %1
  %2 = sdiv i32 %.frozen, 8
  %3 = shl nsw i32 %2, 3
  %4 = sub i32 76, %3
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
  %.not7 = icmp eq i32 %87, 0
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
  %107 = getelementptr bfloat, ptr addrspace(1) %arg0267, i64 %91
  %108 = getelementptr bfloat, ptr addrspace(1) %arg0267, i64 %92
  %109 = getelementptr bfloat, ptr addrspace(1) %arg0267, i64 %93
  %110 = getelementptr bfloat, ptr addrspace(1) %arg0267, i64 %94
  %111 = getelementptr bfloat, ptr addrspace(1) %arg0267, i64 %95
  %112 = getelementptr bfloat, ptr addrspace(1) %arg0267, i64 %96
  %113 = getelementptr bfloat, ptr addrspace(1) %arg0267, i64 %97
  %114 = getelementptr bfloat, ptr addrspace(1) %arg0267, i64 %98
  %115 = getelementptr bfloat, ptr addrspace(1) %arg0267, i64 %99
  %116 = getelementptr bfloat, ptr addrspace(1) %arg0267, i64 %100
  %117 = getelementptr bfloat, ptr addrspace(1) %arg0267, i64 %101
  %118 = getelementptr bfloat, ptr addrspace(1) %arg0267, i64 %102
  %119 = getelementptr bfloat, ptr addrspace(1) %arg0267, i64 %103
  %120 = getelementptr bfloat, ptr addrspace(1) %arg0267, i64 %104
  %121 = getelementptr bfloat, ptr addrspace(1) %arg0267, i64 %105
  %122 = getelementptr bfloat, ptr addrspace(1) %arg0267, i64 %106
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
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %132, ptr addrspace(1) %107, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %138, ptr addrspace(1) %108, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %144, ptr addrspace(1) %109, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %150, ptr addrspace(1) %110, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %156, ptr addrspace(1) %111, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %162, ptr addrspace(1) %112, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %168, ptr addrspace(1) %113, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %174, ptr addrspace(1) %114, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %180, ptr addrspace(1) %115, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %186, ptr addrspace(1) %116, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %192, ptr addrspace(1) %117, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %198, ptr addrspace(1) %118, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %204, ptr addrspace(1) %119, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %210, ptr addrspace(1) %120, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %216, ptr addrspace(1) %121, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %222, ptr addrspace(1) %122, i32 16) #10
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #10
  %223 = getelementptr bfloat, ptr addrspace(1) %arg0267, i64 %67
  %224 = getelementptr bfloat, ptr addrspace(1) %223, i64 %90
  %225 = getelementptr i8, ptr addrspace(1) %224, i64 256
  %226 = getelementptr bfloat, ptr addrspace(1) %arg0267, i64 %68
  %227 = getelementptr bfloat, ptr addrspace(1) %226, i64 %90
  %228 = getelementptr i8, ptr addrspace(1) %227, i64 256
  %229 = getelementptr bfloat, ptr addrspace(1) %arg0267, i64 %69
  %230 = getelementptr bfloat, ptr addrspace(1) %229, i64 %90
  %231 = getelementptr i8, ptr addrspace(1) %230, i64 256
  %232 = getelementptr bfloat, ptr addrspace(1) %arg0267, i64 %70
  %233 = getelementptr bfloat, ptr addrspace(1) %232, i64 %90
  %234 = getelementptr i8, ptr addrspace(1) %233, i64 256
  %235 = getelementptr bfloat, ptr addrspace(1) %arg0267, i64 %71
  %236 = getelementptr bfloat, ptr addrspace(1) %235, i64 %90
  %237 = getelementptr i8, ptr addrspace(1) %236, i64 256
  %238 = getelementptr bfloat, ptr addrspace(1) %arg0267, i64 %72
  %239 = getelementptr bfloat, ptr addrspace(1) %238, i64 %90
  %240 = getelementptr i8, ptr addrspace(1) %239, i64 256
  %241 = getelementptr bfloat, ptr addrspace(1) %arg0267, i64 %73
  %242 = getelementptr bfloat, ptr addrspace(1) %241, i64 %90
  %243 = getelementptr i8, ptr addrspace(1) %242, i64 256
  %244 = getelementptr bfloat, ptr addrspace(1) %arg0267, i64 %74
  %245 = getelementptr bfloat, ptr addrspace(1) %244, i64 %90
  %246 = getelementptr i8, ptr addrspace(1) %245, i64 256
  %247 = getelementptr bfloat, ptr addrspace(1) %arg0267, i64 %75
  %248 = getelementptr bfloat, ptr addrspace(1) %247, i64 %90
  %249 = getelementptr i8, ptr addrspace(1) %248, i64 256
  %250 = getelementptr bfloat, ptr addrspace(1) %arg0267, i64 %76
  %251 = getelementptr bfloat, ptr addrspace(1) %250, i64 %90
  %252 = getelementptr i8, ptr addrspace(1) %251, i64 256
  %253 = getelementptr bfloat, ptr addrspace(1) %arg0267, i64 %77
  %254 = getelementptr bfloat, ptr addrspace(1) %253, i64 %90
  %255 = getelementptr i8, ptr addrspace(1) %254, i64 256
  %256 = getelementptr bfloat, ptr addrspace(1) %arg0267, i64 %78
  %257 = getelementptr bfloat, ptr addrspace(1) %256, i64 %90
  %258 = getelementptr i8, ptr addrspace(1) %257, i64 256
  %259 = getelementptr bfloat, ptr addrspace(1) %arg0267, i64 %79
  %260 = getelementptr bfloat, ptr addrspace(1) %259, i64 %90
  %261 = getelementptr i8, ptr addrspace(1) %260, i64 256
  %262 = getelementptr bfloat, ptr addrspace(1) %arg0267, i64 %80
  %263 = getelementptr bfloat, ptr addrspace(1) %262, i64 %90
  %264 = getelementptr i8, ptr addrspace(1) %263, i64 256
  %265 = getelementptr bfloat, ptr addrspace(1) %arg0267, i64 %81
  %266 = getelementptr bfloat, ptr addrspace(1) %265, i64 %90
  %267 = getelementptr i8, ptr addrspace(1) %266, i64 256
  %268 = getelementptr bfloat, ptr addrspace(1) %arg0267, i64 %82
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
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %271, ptr addrspace(1) %225, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %272, ptr addrspace(1) %228, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %273, ptr addrspace(1) %231, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %274, ptr addrspace(1) %234, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %275, ptr addrspace(1) %237, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %276, ptr addrspace(1) %240, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %277, ptr addrspace(1) %243, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %278, ptr addrspace(1) %246, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %279, ptr addrspace(1) %249, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %280, ptr addrspace(1) %252, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %281, ptr addrspace(1) %255, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %282, ptr addrspace(1) %258, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %283, ptr addrspace(1) %261, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %284, ptr addrspace(1) %264, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %285, ptr addrspace(1) %267, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %286, ptr addrspace(1) %270, i32 16) #10
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #10
  tail call void asm sideeffect "cp.async.wait_group 0x1;", ""() #10
  tail call void @llvm.nvvm.barrier0()
  %287 = select i1 %84, i32 0, i32 136
  %288 = select i1 %86, i32 0, i32 272
  %289 = or disjoint i32 %287, %288
  %290 = select i1 %.not7, i32 0, i32 544
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
  %scevgep = getelementptr i8, ptr addrspace(1) %arg0267, i64 %387
  %388 = add i32 %382, 224
  %389 = zext nneg i32 %388 to i64
  %390 = add i64 %9, %389
  %391 = shl nsw i64 %390, 12
  %392 = add nuw nsw i64 %391, 512
  %scevgep273 = getelementptr i8, ptr addrspace(1) %arg0267, i64 %392
  %393 = add i32 %382, 208
  %394 = zext nneg i32 %393 to i64
  %395 = add i64 %9, %394
  %396 = shl nsw i64 %395, 12
  %397 = add nuw nsw i64 %396, 512
  %scevgep277 = getelementptr i8, ptr addrspace(1) %arg0267, i64 %397
  %398 = add i32 %382, 192
  %399 = zext nneg i32 %398 to i64
  %400 = add i64 %9, %399
  %401 = shl nsw i64 %400, 12
  %402 = add nuw nsw i64 %401, 512
  %scevgep281 = getelementptr i8, ptr addrspace(1) %arg0267, i64 %402
  %403 = add i32 %382, 176
  %404 = zext nneg i32 %403 to i64
  %405 = add i64 %9, %404
  %406 = shl nsw i64 %405, 12
  %407 = add nuw nsw i64 %406, 512
  %scevgep285 = getelementptr i8, ptr addrspace(1) %arg0267, i64 %407
  %408 = add i32 %382, 160
  %409 = zext nneg i32 %408 to i64
  %410 = add i64 %9, %409
  %411 = shl nsw i64 %410, 12
  %412 = add nuw nsw i64 %411, 512
  %scevgep289 = getelementptr i8, ptr addrspace(1) %arg0267, i64 %412
  %413 = add i32 %382, 144
  %414 = zext nneg i32 %413 to i64
  %415 = add i64 %9, %414
  %416 = shl nsw i64 %415, 12
  %417 = add nuw nsw i64 %416, 512
  %scevgep293 = getelementptr i8, ptr addrspace(1) %arg0267, i64 %417
  %418 = add i32 %382, 128
  %419 = zext nneg i32 %418 to i64
  %420 = add i64 %9, %419
  %421 = shl nsw i64 %420, 12
  %422 = add nuw nsw i64 %421, 512
  %scevgep297 = getelementptr i8, ptr addrspace(1) %arg0267, i64 %422
  %423 = add i32 %382, 112
  %424 = zext nneg i32 %423 to i64
  %425 = add i64 %9, %424
  %426 = shl nsw i64 %425, 12
  %427 = add nuw nsw i64 %426, 512
  %scevgep301 = getelementptr i8, ptr addrspace(1) %arg0267, i64 %427
  %428 = add i32 %382, 96
  %429 = zext nneg i32 %428 to i64
  %430 = add i64 %9, %429
  %431 = shl nsw i64 %430, 12
  %432 = add nuw nsw i64 %431, 512
  %scevgep305 = getelementptr i8, ptr addrspace(1) %arg0267, i64 %432
  %433 = add i32 %382, 80
  %434 = zext nneg i32 %433 to i64
  %435 = add i64 %9, %434
  %436 = shl nsw i64 %435, 12
  %437 = add nuw nsw i64 %436, 512
  %scevgep309 = getelementptr i8, ptr addrspace(1) %arg0267, i64 %437
  %438 = add i32 %382, 64
  %439 = zext nneg i32 %438 to i64
  %440 = add i64 %9, %439
  %441 = shl nsw i64 %440, 12
  %442 = add nuw nsw i64 %441, 512
  %scevgep313 = getelementptr i8, ptr addrspace(1) %arg0267, i64 %442
  %443 = add i32 %382, 48
  %444 = zext nneg i32 %443 to i64
  %445 = add i64 %9, %444
  %446 = shl nsw i64 %445, 12
  %447 = add nuw nsw i64 %446, 512
  %scevgep317 = getelementptr i8, ptr addrspace(1) %arg0267, i64 %447
  %448 = add i32 %382, 32
  %449 = zext nneg i32 %448 to i64
  %450 = add i64 %9, %449
  %451 = shl nsw i64 %450, 12
  %452 = add nuw nsw i64 %451, 512
  %scevgep321 = getelementptr i8, ptr addrspace(1) %arg0267, i64 %452
  %453 = add i32 %382, 16
  %454 = zext nneg i32 %453 to i64
  %455 = add i64 %9, %454
  %456 = shl nsw i64 %455, 12
  %457 = add nuw nsw i64 %456, 512
  %scevgep325 = getelementptr i8, ptr addrspace(1) %arg0267, i64 %457
  %458 = zext nneg i32 %382 to i64
  %459 = add i64 %9, %458
  %460 = shl nsw i64 %459, 12
  %461 = add nuw nsw i64 %460, 512
  %scevgep329 = getelementptr i8, ptr addrspace(1) %arg0267, i64 %461
  br label %462

462:                                              ; preds = %0, %462
  %lsr.iv333 = phi i32 [ -128, %0 ], [ %467, %462 ]
  %lsr.iv330 = phi ptr addrspace(1) [ %scevgep329, %0 ], [ %scevgep331, %462 ]
  %lsr.iv326 = phi ptr addrspace(1) [ %scevgep325, %0 ], [ %scevgep327, %462 ]
  %lsr.iv322 = phi ptr addrspace(1) [ %scevgep321, %0 ], [ %scevgep323, %462 ]
  %lsr.iv318 = phi ptr addrspace(1) [ %scevgep317, %0 ], [ %scevgep319, %462 ]
  %lsr.iv314 = phi ptr addrspace(1) [ %scevgep313, %0 ], [ %scevgep315, %462 ]
  %lsr.iv310 = phi ptr addrspace(1) [ %scevgep309, %0 ], [ %scevgep311, %462 ]
  %lsr.iv306 = phi ptr addrspace(1) [ %scevgep305, %0 ], [ %scevgep307, %462 ]
  %lsr.iv302 = phi ptr addrspace(1) [ %scevgep301, %0 ], [ %scevgep303, %462 ]
  %lsr.iv298 = phi ptr addrspace(1) [ %scevgep297, %0 ], [ %scevgep299, %462 ]
  %lsr.iv294 = phi ptr addrspace(1) [ %scevgep293, %0 ], [ %scevgep295, %462 ]
  %lsr.iv290 = phi ptr addrspace(1) [ %scevgep289, %0 ], [ %scevgep291, %462 ]
  %lsr.iv286 = phi ptr addrspace(1) [ %scevgep285, %0 ], [ %scevgep287, %462 ]
  %lsr.iv282 = phi ptr addrspace(1) [ %scevgep281, %0 ], [ %scevgep283, %462 ]
  %lsr.iv278 = phi ptr addrspace(1) [ %scevgep277, %0 ], [ %scevgep279, %462 ]
  %lsr.iv274 = phi ptr addrspace(1) [ %scevgep273, %0 ], [ %scevgep275, %462 ]
  %lsr.iv = phi ptr addrspace(1) [ %scevgep, %0 ], [ %scevgep271, %462 ]
  %463 = phi ptr addrspace(3) [ @global_smem, %0 ], [ %1009, %462 ]
  %464 = phi i32 [ 0, %0 ], [ %1006, %462 ]
  %465 = phi i32 [ 1, %0 ], [ %983, %462 ]
  %466 = phi { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } [ zeroinitializer, %0 ], [ %980, %462 ]
  %467 = add i32 %lsr.iv333, 128
  %468 = icmp samesign ult i32 %467, 1792
  %469 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %463, i64 %303
  %470 = ptrtoint ptr addrspace(3) %469 to i64
  %471 = trunc i64 %470 to i32
  %472 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %471) #10
  %473 = extractvalue { i32, i32, i32, i32 } %472, 0
  %474 = extractvalue { i32, i32, i32, i32 } %472, 1
  %475 = extractvalue { i32, i32, i32, i32 } %472, 2
  %476 = extractvalue { i32, i32, i32, i32 } %472, 3
  %477 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %463, i64 %310
  %478 = ptrtoint ptr addrspace(3) %477 to i64
  %479 = trunc i64 %478 to i32
  %480 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %479) #10
  %481 = extractvalue { i32, i32, i32, i32 } %480, 0
  %482 = extractvalue { i32, i32, i32, i32 } %480, 1
  %483 = extractvalue { i32, i32, i32, i32 } %480, 2
  %484 = extractvalue { i32, i32, i32, i32 } %480, 3
  %485 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %463, i64 %315
  %486 = ptrtoint ptr addrspace(3) %485 to i64
  %487 = trunc i64 %486 to i32
  %488 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %487) #10
  %489 = extractvalue { i32, i32, i32, i32 } %488, 0
  %490 = extractvalue { i32, i32, i32, i32 } %488, 1
  %491 = extractvalue { i32, i32, i32, i32 } %488, 2
  %492 = extractvalue { i32, i32, i32, i32 } %488, 3
  %493 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %463, i64 %321
  %494 = ptrtoint ptr addrspace(3) %493 to i64
  %495 = trunc i64 %494 to i32
  %496 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %495) #10
  %497 = extractvalue { i32, i32, i32, i32 } %496, 0
  %498 = extractvalue { i32, i32, i32, i32 } %496, 1
  %499 = extractvalue { i32, i32, i32, i32 } %496, 2
  %500 = extractvalue { i32, i32, i32, i32 } %496, 3
  %501 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %463, i64 %324
  %502 = ptrtoint ptr addrspace(3) %501 to i64
  %503 = trunc i64 %502 to i32
  %504 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %503) #10
  %505 = extractvalue { i32, i32, i32, i32 } %504, 0
  %506 = extractvalue { i32, i32, i32, i32 } %504, 1
  %507 = extractvalue { i32, i32, i32, i32 } %504, 2
  %508 = extractvalue { i32, i32, i32, i32 } %504, 3
  %509 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %463, i64 %330
  %510 = ptrtoint ptr addrspace(3) %509 to i64
  %511 = trunc i64 %510 to i32
  %512 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %511) #10
  %513 = extractvalue { i32, i32, i32, i32 } %512, 0
  %514 = extractvalue { i32, i32, i32, i32 } %512, 1
  %515 = extractvalue { i32, i32, i32, i32 } %512, 2
  %516 = extractvalue { i32, i32, i32, i32 } %512, 3
  %517 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %463, i64 %335
  %518 = ptrtoint ptr addrspace(3) %517 to i64
  %519 = trunc i64 %518 to i32
  %520 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %519) #10
  %521 = extractvalue { i32, i32, i32, i32 } %520, 0
  %522 = extractvalue { i32, i32, i32, i32 } %520, 1
  %523 = extractvalue { i32, i32, i32, i32 } %520, 2
  %524 = extractvalue { i32, i32, i32, i32 } %520, 3
  %525 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %463, i64 %340
  %526 = ptrtoint ptr addrspace(3) %525 to i64
  %527 = trunc i64 %526 to i32
  %528 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %527) #10
  %529 = extractvalue { i32, i32, i32, i32 } %528, 0
  %530 = extractvalue { i32, i32, i32, i32 } %528, 1
  %531 = extractvalue { i32, i32, i32, i32 } %528, 2
  %532 = extractvalue { i32, i32, i32, i32 } %528, 3
  %533 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %463, i64 %343
  %534 = ptrtoint ptr addrspace(3) %533 to i64
  %535 = trunc i64 %534 to i32
  %536 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %535) #10
  %537 = extractvalue { i32, i32, i32, i32 } %536, 0
  %538 = extractvalue { i32, i32, i32, i32 } %536, 1
  %539 = extractvalue { i32, i32, i32, i32 } %536, 2
  %540 = extractvalue { i32, i32, i32, i32 } %536, 3
  %541 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %463, i64 %349
  %542 = ptrtoint ptr addrspace(3) %541 to i64
  %543 = trunc i64 %542 to i32
  %544 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %543) #10
  %545 = extractvalue { i32, i32, i32, i32 } %544, 0
  %546 = extractvalue { i32, i32, i32, i32 } %544, 1
  %547 = extractvalue { i32, i32, i32, i32 } %544, 2
  %548 = extractvalue { i32, i32, i32, i32 } %544, 3
  %549 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %463, i64 %354
  %550 = ptrtoint ptr addrspace(3) %549 to i64
  %551 = trunc i64 %550 to i32
  %552 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %551) #10
  %553 = extractvalue { i32, i32, i32, i32 } %552, 0
  %554 = extractvalue { i32, i32, i32, i32 } %552, 1
  %555 = extractvalue { i32, i32, i32, i32 } %552, 2
  %556 = extractvalue { i32, i32, i32, i32 } %552, 3
  %557 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %463, i64 %359
  %558 = ptrtoint ptr addrspace(3) %557 to i64
  %559 = trunc i64 %558 to i32
  %560 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %559) #10
  %561 = extractvalue { i32, i32, i32, i32 } %560, 0
  %562 = extractvalue { i32, i32, i32, i32 } %560, 1
  %563 = extractvalue { i32, i32, i32, i32 } %560, 2
  %564 = extractvalue { i32, i32, i32, i32 } %560, 3
  %565 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %463, i64 %362
  %566 = ptrtoint ptr addrspace(3) %565 to i64
  %567 = trunc i64 %566 to i32
  %568 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %567) #10
  %569 = extractvalue { i32, i32, i32, i32 } %568, 0
  %570 = extractvalue { i32, i32, i32, i32 } %568, 1
  %571 = extractvalue { i32, i32, i32, i32 } %568, 2
  %572 = extractvalue { i32, i32, i32, i32 } %568, 3
  %573 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %463, i64 %368
  %574 = ptrtoint ptr addrspace(3) %573 to i64
  %575 = trunc i64 %574 to i32
  %576 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %575) #10
  %577 = extractvalue { i32, i32, i32, i32 } %576, 0
  %578 = extractvalue { i32, i32, i32, i32 } %576, 1
  %579 = extractvalue { i32, i32, i32, i32 } %576, 2
  %580 = extractvalue { i32, i32, i32, i32 } %576, 3
  %581 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %463, i64 %373
  %582 = ptrtoint ptr addrspace(3) %581 to i64
  %583 = trunc i64 %582 to i32
  %584 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %583) #10
  %585 = extractvalue { i32, i32, i32, i32 } %584, 0
  %586 = extractvalue { i32, i32, i32, i32 } %584, 1
  %587 = extractvalue { i32, i32, i32, i32 } %584, 2
  %588 = extractvalue { i32, i32, i32, i32 } %584, 3
  %589 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %463, i64 %378
  %590 = ptrtoint ptr addrspace(3) %589 to i64
  %591 = trunc i64 %590 to i32
  %592 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %591) #10
  %593 = extractvalue { i32, i32, i32, i32 } %592, 0
  %594 = extractvalue { i32, i32, i32, i32 } %592, 1
  %595 = extractvalue { i32, i32, i32, i32 } %592, 2
  %596 = extractvalue { i32, i32, i32, i32 } %592, 3
  %597 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 0
  %598 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 1
  %599 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 2
  %600 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 3
  %601 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 4
  %602 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 5
  %603 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 6
  %604 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 7
  %605 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 8
  %606 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 9
  %607 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 10
  %608 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 11
  %609 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 12
  %610 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 13
  %611 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 14
  %612 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 15
  %613 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 16
  %614 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 17
  %615 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 18
  %616 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 19
  %617 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 20
  %618 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 21
  %619 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 22
  %620 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 23
  %621 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 24
  %622 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 25
  %623 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 26
  %624 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 27
  %625 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 28
  %626 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 29
  %627 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 30
  %628 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 31
  %629 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %597, float %598, float %599, float %600, i32 %473, i32 %474, i32 %475, i32 %476, i32 0, i32 0) #10
  %630 = extractvalue { float, float, float, float } %629, 0
  %631 = extractvalue { float, float, float, float } %629, 1
  %632 = extractvalue { float, float, float, float } %629, 2
  %633 = extractvalue { float, float, float, float } %629, 3
  %634 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %601, float %602, float %603, float %604, i32 %473, i32 %474, i32 %475, i32 %476, i32 0, i32 0) #10
  %635 = extractvalue { float, float, float, float } %634, 0
  %636 = extractvalue { float, float, float, float } %634, 1
  %637 = extractvalue { float, float, float, float } %634, 2
  %638 = extractvalue { float, float, float, float } %634, 3
  %639 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %605, float %606, float %607, float %608, i32 %473, i32 %474, i32 %475, i32 %476, i32 0, i32 0) #10
  %640 = extractvalue { float, float, float, float } %639, 0
  %641 = extractvalue { float, float, float, float } %639, 1
  %642 = extractvalue { float, float, float, float } %639, 2
  %643 = extractvalue { float, float, float, float } %639, 3
  %644 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %609, float %610, float %611, float %612, i32 %473, i32 %474, i32 %475, i32 %476, i32 0, i32 0) #10
  %645 = extractvalue { float, float, float, float } %644, 0
  %646 = extractvalue { float, float, float, float } %644, 1
  %647 = extractvalue { float, float, float, float } %644, 2
  %648 = extractvalue { float, float, float, float } %644, 3
  %649 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %613, float %614, float %615, float %616, i32 %537, i32 %538, i32 %539, i32 %540, i32 0, i32 0) #10
  %650 = extractvalue { float, float, float, float } %649, 0
  %651 = extractvalue { float, float, float, float } %649, 1
  %652 = extractvalue { float, float, float, float } %649, 2
  %653 = extractvalue { float, float, float, float } %649, 3
  %654 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %617, float %618, float %619, float %620, i32 %537, i32 %538, i32 %539, i32 %540, i32 0, i32 0) #10
  %655 = extractvalue { float, float, float, float } %654, 0
  %656 = extractvalue { float, float, float, float } %654, 1
  %657 = extractvalue { float, float, float, float } %654, 2
  %658 = extractvalue { float, float, float, float } %654, 3
  %659 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %621, float %622, float %623, float %624, i32 %537, i32 %538, i32 %539, i32 %540, i32 0, i32 0) #10
  %660 = extractvalue { float, float, float, float } %659, 0
  %661 = extractvalue { float, float, float, float } %659, 1
  %662 = extractvalue { float, float, float, float } %659, 2
  %663 = extractvalue { float, float, float, float } %659, 3
  %664 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %625, float %626, float %627, float %628, i32 %537, i32 %538, i32 %539, i32 %540, i32 0, i32 0) #10
  %665 = extractvalue { float, float, float, float } %664, 0
  %666 = extractvalue { float, float, float, float } %664, 1
  %667 = extractvalue { float, float, float, float } %664, 2
  %668 = extractvalue { float, float, float, float } %664, 3
  %669 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %630, float %631, float %632, float %633, i32 %481, i32 %482, i32 %483, i32 %484, i32 0, i32 0) #10
  %670 = extractvalue { float, float, float, float } %669, 0
  %671 = extractvalue { float, float, float, float } %669, 1
  %672 = extractvalue { float, float, float, float } %669, 2
  %673 = extractvalue { float, float, float, float } %669, 3
  %674 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %635, float %636, float %637, float %638, i32 %481, i32 %482, i32 %483, i32 %484, i32 0, i32 0) #10
  %675 = extractvalue { float, float, float, float } %674, 0
  %676 = extractvalue { float, float, float, float } %674, 1
  %677 = extractvalue { float, float, float, float } %674, 2
  %678 = extractvalue { float, float, float, float } %674, 3
  %679 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %640, float %641, float %642, float %643, i32 %481, i32 %482, i32 %483, i32 %484, i32 0, i32 0) #10
  %680 = extractvalue { float, float, float, float } %679, 0
  %681 = extractvalue { float, float, float, float } %679, 1
  %682 = extractvalue { float, float, float, float } %679, 2
  %683 = extractvalue { float, float, float, float } %679, 3
  %684 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %645, float %646, float %647, float %648, i32 %481, i32 %482, i32 %483, i32 %484, i32 0, i32 0) #10
  %685 = extractvalue { float, float, float, float } %684, 0
  %686 = extractvalue { float, float, float, float } %684, 1
  %687 = extractvalue { float, float, float, float } %684, 2
  %688 = extractvalue { float, float, float, float } %684, 3
  %689 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %650, float %651, float %652, float %653, i32 %545, i32 %546, i32 %547, i32 %548, i32 0, i32 0) #10
  %690 = extractvalue { float, float, float, float } %689, 0
  %691 = extractvalue { float, float, float, float } %689, 1
  %692 = extractvalue { float, float, float, float } %689, 2
  %693 = extractvalue { float, float, float, float } %689, 3
  %694 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %655, float %656, float %657, float %658, i32 %545, i32 %546, i32 %547, i32 %548, i32 0, i32 0) #10
  %695 = extractvalue { float, float, float, float } %694, 0
  %696 = extractvalue { float, float, float, float } %694, 1
  %697 = extractvalue { float, float, float, float } %694, 2
  %698 = extractvalue { float, float, float, float } %694, 3
  %699 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %660, float %661, float %662, float %663, i32 %545, i32 %546, i32 %547, i32 %548, i32 0, i32 0) #10
  %700 = extractvalue { float, float, float, float } %699, 0
  %701 = extractvalue { float, float, float, float } %699, 1
  %702 = extractvalue { float, float, float, float } %699, 2
  %703 = extractvalue { float, float, float, float } %699, 3
  %704 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %665, float %666, float %667, float %668, i32 %545, i32 %546, i32 %547, i32 %548, i32 0, i32 0) #10
  %705 = extractvalue { float, float, float, float } %704, 0
  %706 = extractvalue { float, float, float, float } %704, 1
  %707 = extractvalue { float, float, float, float } %704, 2
  %708 = extractvalue { float, float, float, float } %704, 3
  %709 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %670, float %671, float %672, float %673, i32 %489, i32 %490, i32 %491, i32 %492, i32 0, i32 0) #10
  %710 = extractvalue { float, float, float, float } %709, 0
  %711 = extractvalue { float, float, float, float } %709, 1
  %712 = extractvalue { float, float, float, float } %709, 2
  %713 = extractvalue { float, float, float, float } %709, 3
  %714 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %675, float %676, float %677, float %678, i32 %489, i32 %490, i32 %491, i32 %492, i32 0, i32 0) #10
  %715 = extractvalue { float, float, float, float } %714, 0
  %716 = extractvalue { float, float, float, float } %714, 1
  %717 = extractvalue { float, float, float, float } %714, 2
  %718 = extractvalue { float, float, float, float } %714, 3
  %719 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %680, float %681, float %682, float %683, i32 %489, i32 %490, i32 %491, i32 %492, i32 0, i32 0) #10
  %720 = extractvalue { float, float, float, float } %719, 0
  %721 = extractvalue { float, float, float, float } %719, 1
  %722 = extractvalue { float, float, float, float } %719, 2
  %723 = extractvalue { float, float, float, float } %719, 3
  %724 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %685, float %686, float %687, float %688, i32 %489, i32 %490, i32 %491, i32 %492, i32 0, i32 0) #10
  %725 = extractvalue { float, float, float, float } %724, 0
  %726 = extractvalue { float, float, float, float } %724, 1
  %727 = extractvalue { float, float, float, float } %724, 2
  %728 = extractvalue { float, float, float, float } %724, 3
  %729 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %690, float %691, float %692, float %693, i32 %553, i32 %554, i32 %555, i32 %556, i32 0, i32 0) #10
  %730 = extractvalue { float, float, float, float } %729, 0
  %731 = extractvalue { float, float, float, float } %729, 1
  %732 = extractvalue { float, float, float, float } %729, 2
  %733 = extractvalue { float, float, float, float } %729, 3
  %734 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %695, float %696, float %697, float %698, i32 %553, i32 %554, i32 %555, i32 %556, i32 0, i32 0) #10
  %735 = extractvalue { float, float, float, float } %734, 0
  %736 = extractvalue { float, float, float, float } %734, 1
  %737 = extractvalue { float, float, float, float } %734, 2
  %738 = extractvalue { float, float, float, float } %734, 3
  %739 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %700, float %701, float %702, float %703, i32 %553, i32 %554, i32 %555, i32 %556, i32 0, i32 0) #10
  %740 = extractvalue { float, float, float, float } %739, 0
  %741 = extractvalue { float, float, float, float } %739, 1
  %742 = extractvalue { float, float, float, float } %739, 2
  %743 = extractvalue { float, float, float, float } %739, 3
  %744 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %705, float %706, float %707, float %708, i32 %553, i32 %554, i32 %555, i32 %556, i32 0, i32 0) #10
  %745 = extractvalue { float, float, float, float } %744, 0
  %746 = extractvalue { float, float, float, float } %744, 1
  %747 = extractvalue { float, float, float, float } %744, 2
  %748 = extractvalue { float, float, float, float } %744, 3
  %749 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %710, float %711, float %712, float %713, i32 %497, i32 %498, i32 %499, i32 %500, i32 0, i32 0) #10
  %750 = extractvalue { float, float, float, float } %749, 0
  %751 = extractvalue { float, float, float, float } %749, 1
  %752 = extractvalue { float, float, float, float } %749, 2
  %753 = extractvalue { float, float, float, float } %749, 3
  %754 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %715, float %716, float %717, float %718, i32 %497, i32 %498, i32 %499, i32 %500, i32 0, i32 0) #10
  %755 = extractvalue { float, float, float, float } %754, 0
  %756 = extractvalue { float, float, float, float } %754, 1
  %757 = extractvalue { float, float, float, float } %754, 2
  %758 = extractvalue { float, float, float, float } %754, 3
  %759 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %720, float %721, float %722, float %723, i32 %497, i32 %498, i32 %499, i32 %500, i32 0, i32 0) #10
  %760 = extractvalue { float, float, float, float } %759, 0
  %761 = extractvalue { float, float, float, float } %759, 1
  %762 = extractvalue { float, float, float, float } %759, 2
  %763 = extractvalue { float, float, float, float } %759, 3
  %764 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %725, float %726, float %727, float %728, i32 %497, i32 %498, i32 %499, i32 %500, i32 0, i32 0) #10
  %765 = extractvalue { float, float, float, float } %764, 0
  %766 = extractvalue { float, float, float, float } %764, 1
  %767 = extractvalue { float, float, float, float } %764, 2
  %768 = extractvalue { float, float, float, float } %764, 3
  %769 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %730, float %731, float %732, float %733, i32 %561, i32 %562, i32 %563, i32 %564, i32 0, i32 0) #10
  %770 = extractvalue { float, float, float, float } %769, 0
  %771 = extractvalue { float, float, float, float } %769, 1
  %772 = extractvalue { float, float, float, float } %769, 2
  %773 = extractvalue { float, float, float, float } %769, 3
  %774 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %735, float %736, float %737, float %738, i32 %561, i32 %562, i32 %563, i32 %564, i32 0, i32 0) #10
  %775 = extractvalue { float, float, float, float } %774, 0
  %776 = extractvalue { float, float, float, float } %774, 1
  %777 = extractvalue { float, float, float, float } %774, 2
  %778 = extractvalue { float, float, float, float } %774, 3
  %779 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %740, float %741, float %742, float %743, i32 %561, i32 %562, i32 %563, i32 %564, i32 0, i32 0) #10
  %780 = extractvalue { float, float, float, float } %779, 0
  %781 = extractvalue { float, float, float, float } %779, 1
  %782 = extractvalue { float, float, float, float } %779, 2
  %783 = extractvalue { float, float, float, float } %779, 3
  %784 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %745, float %746, float %747, float %748, i32 %561, i32 %562, i32 %563, i32 %564, i32 0, i32 0) #10
  %785 = extractvalue { float, float, float, float } %784, 0
  %786 = extractvalue { float, float, float, float } %784, 1
  %787 = extractvalue { float, float, float, float } %784, 2
  %788 = extractvalue { float, float, float, float } %784, 3
  %789 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %750, float %751, float %752, float %753, i32 %505, i32 %506, i32 %507, i32 %508, i32 0, i32 0) #10
  %790 = extractvalue { float, float, float, float } %789, 0
  %791 = extractvalue { float, float, float, float } %789, 1
  %792 = extractvalue { float, float, float, float } %789, 2
  %793 = extractvalue { float, float, float, float } %789, 3
  %794 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %755, float %756, float %757, float %758, i32 %505, i32 %506, i32 %507, i32 %508, i32 0, i32 0) #10
  %795 = extractvalue { float, float, float, float } %794, 0
  %796 = extractvalue { float, float, float, float } %794, 1
  %797 = extractvalue { float, float, float, float } %794, 2
  %798 = extractvalue { float, float, float, float } %794, 3
  %799 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %760, float %761, float %762, float %763, i32 %505, i32 %506, i32 %507, i32 %508, i32 0, i32 0) #10
  %800 = extractvalue { float, float, float, float } %799, 0
  %801 = extractvalue { float, float, float, float } %799, 1
  %802 = extractvalue { float, float, float, float } %799, 2
  %803 = extractvalue { float, float, float, float } %799, 3
  %804 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %765, float %766, float %767, float %768, i32 %505, i32 %506, i32 %507, i32 %508, i32 0, i32 0) #10
  %805 = extractvalue { float, float, float, float } %804, 0
  %806 = extractvalue { float, float, float, float } %804, 1
  %807 = extractvalue { float, float, float, float } %804, 2
  %808 = extractvalue { float, float, float, float } %804, 3
  %809 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %770, float %771, float %772, float %773, i32 %569, i32 %570, i32 %571, i32 %572, i32 0, i32 0) #10
  %810 = extractvalue { float, float, float, float } %809, 0
  %811 = extractvalue { float, float, float, float } %809, 1
  %812 = extractvalue { float, float, float, float } %809, 2
  %813 = extractvalue { float, float, float, float } %809, 3
  %814 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %775, float %776, float %777, float %778, i32 %569, i32 %570, i32 %571, i32 %572, i32 0, i32 0) #10
  %815 = extractvalue { float, float, float, float } %814, 0
  %816 = extractvalue { float, float, float, float } %814, 1
  %817 = extractvalue { float, float, float, float } %814, 2
  %818 = extractvalue { float, float, float, float } %814, 3
  %819 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %780, float %781, float %782, float %783, i32 %569, i32 %570, i32 %571, i32 %572, i32 0, i32 0) #10
  %820 = extractvalue { float, float, float, float } %819, 0
  %821 = extractvalue { float, float, float, float } %819, 1
  %822 = extractvalue { float, float, float, float } %819, 2
  %823 = extractvalue { float, float, float, float } %819, 3
  %824 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %785, float %786, float %787, float %788, i32 %569, i32 %570, i32 %571, i32 %572, i32 0, i32 0) #10
  %825 = extractvalue { float, float, float, float } %824, 0
  %826 = extractvalue { float, float, float, float } %824, 1
  %827 = extractvalue { float, float, float, float } %824, 2
  %828 = extractvalue { float, float, float, float } %824, 3
  %829 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %790, float %791, float %792, float %793, i32 %513, i32 %514, i32 %515, i32 %516, i32 0, i32 0) #10
  %830 = extractvalue { float, float, float, float } %829, 0
  %831 = extractvalue { float, float, float, float } %829, 1
  %832 = extractvalue { float, float, float, float } %829, 2
  %833 = extractvalue { float, float, float, float } %829, 3
  %834 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %795, float %796, float %797, float %798, i32 %513, i32 %514, i32 %515, i32 %516, i32 0, i32 0) #10
  %835 = extractvalue { float, float, float, float } %834, 0
  %836 = extractvalue { float, float, float, float } %834, 1
  %837 = extractvalue { float, float, float, float } %834, 2
  %838 = extractvalue { float, float, float, float } %834, 3
  %839 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %800, float %801, float %802, float %803, i32 %513, i32 %514, i32 %515, i32 %516, i32 0, i32 0) #10
  %840 = extractvalue { float, float, float, float } %839, 0
  %841 = extractvalue { float, float, float, float } %839, 1
  %842 = extractvalue { float, float, float, float } %839, 2
  %843 = extractvalue { float, float, float, float } %839, 3
  %844 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %805, float %806, float %807, float %808, i32 %513, i32 %514, i32 %515, i32 %516, i32 0, i32 0) #10
  %845 = extractvalue { float, float, float, float } %844, 0
  %846 = extractvalue { float, float, float, float } %844, 1
  %847 = extractvalue { float, float, float, float } %844, 2
  %848 = extractvalue { float, float, float, float } %844, 3
  %849 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %810, float %811, float %812, float %813, i32 %577, i32 %578, i32 %579, i32 %580, i32 0, i32 0) #10
  %850 = extractvalue { float, float, float, float } %849, 0
  %851 = extractvalue { float, float, float, float } %849, 1
  %852 = extractvalue { float, float, float, float } %849, 2
  %853 = extractvalue { float, float, float, float } %849, 3
  %854 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %815, float %816, float %817, float %818, i32 %577, i32 %578, i32 %579, i32 %580, i32 0, i32 0) #10
  %855 = extractvalue { float, float, float, float } %854, 0
  %856 = extractvalue { float, float, float, float } %854, 1
  %857 = extractvalue { float, float, float, float } %854, 2
  %858 = extractvalue { float, float, float, float } %854, 3
  %859 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %820, float %821, float %822, float %823, i32 %577, i32 %578, i32 %579, i32 %580, i32 0, i32 0) #10
  %860 = extractvalue { float, float, float, float } %859, 0
  %861 = extractvalue { float, float, float, float } %859, 1
  %862 = extractvalue { float, float, float, float } %859, 2
  %863 = extractvalue { float, float, float, float } %859, 3
  %864 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %825, float %826, float %827, float %828, i32 %577, i32 %578, i32 %579, i32 %580, i32 0, i32 0) #10
  %865 = extractvalue { float, float, float, float } %864, 0
  %866 = extractvalue { float, float, float, float } %864, 1
  %867 = extractvalue { float, float, float, float } %864, 2
  %868 = extractvalue { float, float, float, float } %864, 3
  %869 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %830, float %831, float %832, float %833, i32 %521, i32 %522, i32 %523, i32 %524, i32 0, i32 0) #10
  %870 = extractvalue { float, float, float, float } %869, 0
  %871 = extractvalue { float, float, float, float } %869, 1
  %872 = extractvalue { float, float, float, float } %869, 2
  %873 = extractvalue { float, float, float, float } %869, 3
  %874 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %835, float %836, float %837, float %838, i32 %521, i32 %522, i32 %523, i32 %524, i32 0, i32 0) #10
  %875 = extractvalue { float, float, float, float } %874, 0
  %876 = extractvalue { float, float, float, float } %874, 1
  %877 = extractvalue { float, float, float, float } %874, 2
  %878 = extractvalue { float, float, float, float } %874, 3
  %879 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %840, float %841, float %842, float %843, i32 %521, i32 %522, i32 %523, i32 %524, i32 0, i32 0) #10
  %880 = extractvalue { float, float, float, float } %879, 0
  %881 = extractvalue { float, float, float, float } %879, 1
  %882 = extractvalue { float, float, float, float } %879, 2
  %883 = extractvalue { float, float, float, float } %879, 3
  %884 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %845, float %846, float %847, float %848, i32 %521, i32 %522, i32 %523, i32 %524, i32 0, i32 0) #10
  %885 = extractvalue { float, float, float, float } %884, 0
  %886 = extractvalue { float, float, float, float } %884, 1
  %887 = extractvalue { float, float, float, float } %884, 2
  %888 = extractvalue { float, float, float, float } %884, 3
  %889 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %850, float %851, float %852, float %853, i32 %585, i32 %586, i32 %587, i32 %588, i32 0, i32 0) #10
  %890 = extractvalue { float, float, float, float } %889, 0
  %891 = extractvalue { float, float, float, float } %889, 1
  %892 = extractvalue { float, float, float, float } %889, 2
  %893 = extractvalue { float, float, float, float } %889, 3
  %894 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %855, float %856, float %857, float %858, i32 %585, i32 %586, i32 %587, i32 %588, i32 0, i32 0) #10
  %895 = extractvalue { float, float, float, float } %894, 0
  %896 = extractvalue { float, float, float, float } %894, 1
  %897 = extractvalue { float, float, float, float } %894, 2
  %898 = extractvalue { float, float, float, float } %894, 3
  %899 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %860, float %861, float %862, float %863, i32 %585, i32 %586, i32 %587, i32 %588, i32 0, i32 0) #10
  %900 = extractvalue { float, float, float, float } %899, 0
  %901 = extractvalue { float, float, float, float } %899, 1
  %902 = extractvalue { float, float, float, float } %899, 2
  %903 = extractvalue { float, float, float, float } %899, 3
  %904 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %865, float %866, float %867, float %868, i32 %585, i32 %586, i32 %587, i32 %588, i32 0, i32 0) #10
  %905 = extractvalue { float, float, float, float } %904, 0
  %906 = extractvalue { float, float, float, float } %904, 1
  %907 = extractvalue { float, float, float, float } %904, 2
  %908 = extractvalue { float, float, float, float } %904, 3
  %909 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %870, float %871, float %872, float %873, i32 %529, i32 %530, i32 %531, i32 %532, i32 0, i32 0) #10
  %910 = extractvalue { float, float, float, float } %909, 0
  %911 = extractvalue { float, float, float, float } %909, 1
  %912 = extractvalue { float, float, float, float } %909, 2
  %913 = extractvalue { float, float, float, float } %909, 3
  %914 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %875, float %876, float %877, float %878, i32 %529, i32 %530, i32 %531, i32 %532, i32 0, i32 0) #10
  %915 = extractvalue { float, float, float, float } %914, 0
  %916 = extractvalue { float, float, float, float } %914, 1
  %917 = extractvalue { float, float, float, float } %914, 2
  %918 = extractvalue { float, float, float, float } %914, 3
  %919 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %880, float %881, float %882, float %883, i32 %529, i32 %530, i32 %531, i32 %532, i32 0, i32 0) #10
  %920 = extractvalue { float, float, float, float } %919, 0
  %921 = extractvalue { float, float, float, float } %919, 1
  %922 = extractvalue { float, float, float, float } %919, 2
  %923 = extractvalue { float, float, float, float } %919, 3
  %924 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %885, float %886, float %887, float %888, i32 %529, i32 %530, i32 %531, i32 %532, i32 0, i32 0) #10
  %925 = extractvalue { float, float, float, float } %924, 0
  %926 = extractvalue { float, float, float, float } %924, 1
  %927 = extractvalue { float, float, float, float } %924, 2
  %928 = extractvalue { float, float, float, float } %924, 3
  %929 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %890, float %891, float %892, float %893, i32 %593, i32 %594, i32 %595, i32 %596, i32 0, i32 0) #10
  %930 = extractvalue { float, float, float, float } %929, 0
  %931 = extractvalue { float, float, float, float } %929, 1
  %932 = extractvalue { float, float, float, float } %929, 2
  %933 = extractvalue { float, float, float, float } %929, 3
  %934 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %895, float %896, float %897, float %898, i32 %593, i32 %594, i32 %595, i32 %596, i32 0, i32 0) #10
  %935 = extractvalue { float, float, float, float } %934, 0
  %936 = extractvalue { float, float, float, float } %934, 1
  %937 = extractvalue { float, float, float, float } %934, 2
  %938 = extractvalue { float, float, float, float } %934, 3
  %939 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %900, float %901, float %902, float %903, i32 %593, i32 %594, i32 %595, i32 %596, i32 0, i32 0) #10
  %940 = extractvalue { float, float, float, float } %939, 0
  %941 = extractvalue { float, float, float, float } %939, 1
  %942 = extractvalue { float, float, float, float } %939, 2
  %943 = extractvalue { float, float, float, float } %939, 3
  %944 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %905, float %906, float %907, float %908, i32 %593, i32 %594, i32 %595, i32 %596, i32 0, i32 0) #10
  %945 = extractvalue { float, float, float, float } %944, 0
  %946 = extractvalue { float, float, float, float } %944, 1
  %947 = extractvalue { float, float, float, float } %944, 2
  %948 = extractvalue { float, float, float, float } %944, 3
  %949 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } undef, float %910, 0
  %950 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %949, float %911, 1
  %951 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %950, float %912, 2
  %952 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %951, float %913, 3
  %953 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %952, float %915, 4
  %954 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %953, float %916, 5
  %955 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %954, float %917, 6
  %956 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %955, float %918, 7
  %957 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %956, float %920, 8
  %958 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %957, float %921, 9
  %959 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %958, float %922, 10
  %960 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %959, float %923, 11
  %961 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %960, float %925, 12
  %962 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %961, float %926, 13
  %963 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %962, float %927, 14
  %964 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %963, float %928, 15
  %965 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %964, float %930, 16
  %966 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %965, float %931, 17
  %967 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %966, float %932, 18
  %968 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %967, float %933, 19
  %969 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %968, float %935, 20
  %970 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %969, float %936, 21
  %971 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %970, float %937, 22
  %972 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %971, float %938, 23
  %973 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %972, float %940, 24
  %974 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %973, float %941, 25
  %975 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %974, float %942, 26
  %976 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %975, float %943, 27
  %977 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %976, float %945, 28
  %978 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %977, float %946, 29
  %979 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %978, float %947, 30
  %980 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %979, float %948, 31
  %981 = add i32 %465, 1
  %982 = icmp slt i32 %981, 2
  %983 = select i1 %982, i32 %981, i32 0
  %scevgep332 = getelementptr i8, ptr addrspace(1) %lsr.iv330, i64 %381
  %scevgep328 = getelementptr i8, ptr addrspace(1) %lsr.iv326, i64 %381
  %scevgep324 = getelementptr i8, ptr addrspace(1) %lsr.iv322, i64 %381
  %scevgep320 = getelementptr i8, ptr addrspace(1) %lsr.iv318, i64 %381
  %scevgep316 = getelementptr i8, ptr addrspace(1) %lsr.iv314, i64 %381
  %scevgep312 = getelementptr i8, ptr addrspace(1) %lsr.iv310, i64 %381
  %scevgep308 = getelementptr i8, ptr addrspace(1) %lsr.iv306, i64 %381
  %scevgep304 = getelementptr i8, ptr addrspace(1) %lsr.iv302, i64 %381
  %scevgep300 = getelementptr i8, ptr addrspace(1) %lsr.iv298, i64 %381
  %scevgep296 = getelementptr i8, ptr addrspace(1) %lsr.iv294, i64 %381
  %scevgep292 = getelementptr i8, ptr addrspace(1) %lsr.iv290, i64 %381
  %scevgep288 = getelementptr i8, ptr addrspace(1) %lsr.iv286, i64 %381
  %scevgep284 = getelementptr i8, ptr addrspace(1) %lsr.iv282, i64 %381
  %scevgep280 = getelementptr i8, ptr addrspace(1) %lsr.iv278, i64 %381
  %scevgep276 = getelementptr i8, ptr addrspace(1) %lsr.iv274, i64 %381
  %scevgep272 = getelementptr i8, ptr addrspace(1) %lsr.iv, i64 %381
  %984 = shl i32 %983, 15
  %985 = sext i32 %984 to i64
  %986 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %985
  tail call void @llvm.nvvm.barrier0()
  %987 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %986, i64 %131
  %988 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %986, i64 %137
  %989 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %986, i64 %143
  %990 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %986, i64 %149
  %991 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %986, i64 %155
  %992 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %986, i64 %161
  %993 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %986, i64 %167
  %994 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %986, i64 %173
  %995 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %986, i64 %179
  %996 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %986, i64 %185
  %997 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %986, i64 %191
  %998 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %986, i64 %197
  %999 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %986, i64 %203
  %1000 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %986, i64 %209
  %1001 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %986, i64 %215
  %1002 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %986, i64 %221
  %1003 = select i1 %468, i32 16, i32 0
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %987, ptr addrspace(1) %scevgep332, i32 %1003) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %988, ptr addrspace(1) %scevgep328, i32 %1003) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %989, ptr addrspace(1) %scevgep324, i32 %1003) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %990, ptr addrspace(1) %scevgep320, i32 %1003) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %991, ptr addrspace(1) %scevgep316, i32 %1003) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %992, ptr addrspace(1) %scevgep312, i32 %1003) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %993, ptr addrspace(1) %scevgep308, i32 %1003) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %994, ptr addrspace(1) %scevgep304, i32 %1003) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %995, ptr addrspace(1) %scevgep300, i32 %1003) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %996, ptr addrspace(1) %scevgep296, i32 %1003) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %997, ptr addrspace(1) %scevgep292, i32 %1003) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %998, ptr addrspace(1) %scevgep288, i32 %1003) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %999, ptr addrspace(1) %scevgep284, i32 %1003) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1000, ptr addrspace(1) %scevgep280, i32 %1003) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1001, ptr addrspace(1) %scevgep276, i32 %1003) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1002, ptr addrspace(1) %scevgep272, i32 %1003) #10
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #10
  %1004 = add i32 %464, 1
  %1005 = icmp slt i32 %1004, 2
  %1006 = select i1 %1005, i32 %1004, i32 0
  tail call void asm sideeffect "cp.async.wait_group 0x1;", ""() #10
  tail call void @llvm.nvvm.barrier0()
  %1007 = shl i32 %1006, 15
  %1008 = sext i32 %1007 to i64
  %1009 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %1008
  %scevgep271 = getelementptr i8, ptr addrspace(1) %lsr.iv, i64 256
  %scevgep275 = getelementptr i8, ptr addrspace(1) %lsr.iv274, i64 256
  %scevgep279 = getelementptr i8, ptr addrspace(1) %lsr.iv278, i64 256
  %scevgep283 = getelementptr i8, ptr addrspace(1) %lsr.iv282, i64 256
  %scevgep287 = getelementptr i8, ptr addrspace(1) %lsr.iv286, i64 256
  %scevgep291 = getelementptr i8, ptr addrspace(1) %lsr.iv290, i64 256
  %scevgep295 = getelementptr i8, ptr addrspace(1) %lsr.iv294, i64 256
  %scevgep299 = getelementptr i8, ptr addrspace(1) %lsr.iv298, i64 256
  %scevgep303 = getelementptr i8, ptr addrspace(1) %lsr.iv302, i64 256
  %scevgep307 = getelementptr i8, ptr addrspace(1) %lsr.iv306, i64 256
  %scevgep311 = getelementptr i8, ptr addrspace(1) %lsr.iv310, i64 256
  %scevgep315 = getelementptr i8, ptr addrspace(1) %lsr.iv314, i64 256
  %scevgep319 = getelementptr i8, ptr addrspace(1) %lsr.iv318, i64 256
  %scevgep323 = getelementptr i8, ptr addrspace(1) %lsr.iv322, i64 256
  %scevgep327 = getelementptr i8, ptr addrspace(1) %lsr.iv326, i64 256
  %scevgep331 = getelementptr i8, ptr addrspace(1) %lsr.iv330, i64 256
  %1010 = icmp samesign ult i32 %467, 1920
  br i1 %1010, label %462, label %1011

1011:                                             ; preds = %462
  %1012 = icmp ult i32 %10, 128
  %1013 = mul i32 %2, 8
  %.decomposed = sub i32 %.frozen, %1013
  %1014 = sdiv i32 %.decomposed, %5
  tail call void asm sideeffect "cp.async.wait_group 0x0;", ""() #10
  tail call void @llvm.nvvm.barrier0()
  %1015 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %910) #10
  %1016 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %911) #10
  %1017 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %912) #10
  %1018 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %913) #10
  %1019 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %915) #10
  %1020 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %916) #10
  %1021 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %917) #10
  %1022 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %918) #10
  %1023 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %920) #10
  %1024 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %921) #10
  %1025 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %922) #10
  %1026 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %923) #10
  %1027 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %925) #10
  %1028 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %926) #10
  %1029 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %927) #10
  %1030 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %928) #10
  %1031 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %930) #10
  %1032 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %931) #10
  %1033 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %932) #10
  %1034 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %933) #10
  %1035 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %935) #10
  %1036 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %936) #10
  %1037 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %937) #10
  %1038 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %938) #10
  %1039 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %940) #10
  %1040 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %941) #10
  %1041 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %942) #10
  %1042 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %943) #10
  %1043 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %945) #10
  %1044 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %946) #10
  %1045 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %947) #10
  %1046 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %948) #10
  %1047 = shl nsw i32 %1014, 5
  %1048 = sext i32 %1047 to i64
  %1049 = and i32 %88, 248
  %1050 = zext nneg i32 %1049 to i64
  %1051 = or disjoint i64 %9, %1050
  %.lobit3 = lshr i32 %10, 5
  %1052 = and i32 %.lobit3, 3
  %1053 = select i1 %1012, i32 0, i32 4
  %1054 = or disjoint i32 %1052, %1053
  %1055 = or disjoint i32 %1054, 8
  %1056 = or disjoint i32 %1054, 16
  %1057 = or disjoint i32 %1054, 24
  %1058 = zext nneg i32 %1054 to i64
  %1059 = zext nneg i32 %1055 to i64
  %1060 = zext nneg i32 %1056 to i64
  %1061 = zext nneg i32 %1057 to i64
  %1062 = or disjoint i64 %1048, %1058
  %1063 = or disjoint i64 %1048, %1059
  %1064 = or disjoint i64 %1048, %1060
  %1065 = or disjoint i64 %1048, %1061
  %1066 = getelementptr bfloat, ptr addrspace(1) %arg1269, i64 %1051
  %.idx = mul nsw i64 %1062, 38912
  %1067 = getelementptr i8, ptr addrspace(1) %1066, i64 %.idx
  %.idx4 = mul nsw i64 %1063, 38912
  %1068 = getelementptr i8, ptr addrspace(1) %1066, i64 %.idx4
  %.idx5 = mul nsw i64 %1064, 38912
  %1069 = getelementptr i8, ptr addrspace(1) %1066, i64 %.idx5
  %.idx6 = mul nsw i64 %1065, 38912
  %1070 = getelementptr i8, ptr addrspace(1) %1066, i64 %.idx6
  %1071 = shl nuw nsw i32 %10, 9
  %1072 = and i32 %1071, 1536
  %1073 = lshr i32 %10, 2
  %1074 = and i32 %1073, 7
  %1075 = lshr i32 %10, 1
  %1076 = and i32 %1075, 48
  %1077 = select i1 %1012, i32 0, i32 64
  %1078 = or disjoint i32 %1076, %1077
  %1079 = or disjoint i32 %1078, %1074
  %1080 = or disjoint i32 %1079, %1072
  %1081 = and i32 %88, 1016
  %1082 = or disjoint i32 %1081, %129
  %1083 = lshr exact i32 %1072, 5
  %1084 = add nuw nsw i32 %1080, %1083
  %1085 = zext nneg i32 %1084 to i64
  %1086 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %1085
  %1087 = bitcast bfloat %1015 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1086, <1 x i16> %1087, i1 true) #10
  %1088 = or disjoint i32 %1080, 256
  %1089 = lshr i32 %1088, 5
  %1090 = and i32 %1089, 56
  %1091 = zext nneg i32 %1090 to i64
  %1092 = zext nneg i32 %1080 to i64
  %1093 = add i64 %1091, %1092
  %1094 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %1093
  %1095 = getelementptr inbounds i8, ptr addrspace(3) %1094, i64 512
  %1096 = bitcast bfloat %1016 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %1095, <1 x i16> %1096, i1 true) #10
  %1097 = zext nneg i32 %1083 to i64
  %1098 = add i64 %1097, %1092
  %1099 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %1098
  %1100 = getelementptr inbounds i8, ptr addrspace(3) %1099, i64 16
  %1101 = bitcast bfloat %1017 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %1100, <1 x i16> %1101, i1 true) #10
  %1102 = or disjoint i32 %1080, 264
  %1103 = lshr i32 %1102, 5
  %1104 = and i32 %1103, 56
  %1105 = zext nneg i32 %1104 to i64
  %1106 = add i64 %1105, %1092
  %1107 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %1106
  %1108 = getelementptr inbounds i8, ptr addrspace(3) %1107, i64 528
  %1109 = bitcast bfloat %1018 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %1108, <1 x i16> %1109, i1 true) #10
  %1110 = getelementptr inbounds i8, ptr addrspace(3) %1099, i64 256
  %1111 = bitcast bfloat %1031 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %1110, <1 x i16> %1111, i1 true) #10
  %1112 = or disjoint i32 %1080, 384
  %1113 = lshr i32 %1112, 5
  %1114 = and i32 %1113, 56
  %1115 = zext nneg i32 %1114 to i64
  %1116 = add i64 %1115, %1092
  %1117 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %1116
  %1118 = getelementptr inbounds i8, ptr addrspace(3) %1117, i64 768
  %1119 = bitcast bfloat %1032 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %1118, <1 x i16> %1119, i1 true) #10
  %1120 = getelementptr inbounds i8, ptr addrspace(3) %1099, i64 272
  %1121 = bitcast bfloat %1033 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %1120, <1 x i16> %1121, i1 true) #10
  %1122 = or disjoint i32 %1080, 392
  %1123 = lshr i32 %1122, 5
  %1124 = and i32 %1123, 56
  %1125 = zext nneg i32 %1124 to i64
  %1126 = add i64 %1125, %1092
  %1127 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %1126
  %1128 = getelementptr inbounds i8, ptr addrspace(3) %1127, i64 784
  %1129 = bitcast bfloat %1034 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %1128, <1 x i16> %1129, i1 true) #10
  tail call void @llvm.nvvm.barrier0()
  %1130 = lshr i32 %1082, 5
  %1131 = and i32 %1130, 56
  %1132 = add nuw nsw i32 %1131, %1082
  %1133 = zext nneg i32 %1132 to i64
  %1134 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %1133
  %1135 = load <4 x i32>, ptr addrspace(3) %1134, align 16
  tail call void @llvm.nvvm.barrier0()
  %1136 = bitcast bfloat %1019 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1086, <1 x i16> %1136, i1 true) #10
  %1137 = bitcast bfloat %1020 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %1095, <1 x i16> %1137, i1 true) #10
  %1138 = bitcast bfloat %1021 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %1100, <1 x i16> %1138, i1 true) #10
  %1139 = bitcast bfloat %1022 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %1108, <1 x i16> %1139, i1 true) #10
  %1140 = bitcast bfloat %1035 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %1110, <1 x i16> %1140, i1 true) #10
  %1141 = bitcast bfloat %1036 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %1118, <1 x i16> %1141, i1 true) #10
  %1142 = bitcast bfloat %1037 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %1120, <1 x i16> %1142, i1 true) #10
  %1143 = bitcast bfloat %1038 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %1128, <1 x i16> %1143, i1 true) #10
  tail call void @llvm.nvvm.barrier0()
  %1144 = load <4 x i32>, ptr addrspace(3) %1134, align 16
  tail call void @llvm.nvvm.barrier0()
  %1145 = bitcast bfloat %1023 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1086, <1 x i16> %1145, i1 true) #10
  %1146 = bitcast bfloat %1024 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %1095, <1 x i16> %1146, i1 true) #10
  %1147 = bitcast bfloat %1025 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %1100, <1 x i16> %1147, i1 true) #10
  %1148 = bitcast bfloat %1026 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %1108, <1 x i16> %1148, i1 true) #10
  %1149 = bitcast bfloat %1039 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %1110, <1 x i16> %1149, i1 true) #10
  %1150 = bitcast bfloat %1040 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %1118, <1 x i16> %1150, i1 true) #10
  %1151 = bitcast bfloat %1041 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %1120, <1 x i16> %1151, i1 true) #10
  %1152 = bitcast bfloat %1042 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %1128, <1 x i16> %1152, i1 true) #10
  tail call void @llvm.nvvm.barrier0()
  %1153 = load <4 x i32>, ptr addrspace(3) %1134, align 16
  tail call void @llvm.nvvm.barrier0()
  %1154 = bitcast bfloat %1027 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1086, <1 x i16> %1154, i1 true) #10
  %1155 = bitcast bfloat %1028 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %1095, <1 x i16> %1155, i1 true) #10
  %1156 = bitcast bfloat %1029 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %1100, <1 x i16> %1156, i1 true) #10
  %1157 = bitcast bfloat %1030 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %1108, <1 x i16> %1157, i1 true) #10
  %1158 = bitcast bfloat %1043 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %1110, <1 x i16> %1158, i1 true) #10
  %1159 = bitcast bfloat %1044 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %1118, <1 x i16> %1159, i1 true) #10
  %1160 = bitcast bfloat %1045 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %1120, <1 x i16> %1160, i1 true) #10
  %1161 = bitcast bfloat %1046 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %1128, <1 x i16> %1161, i1 true) #10
  tail call void @llvm.nvvm.barrier0()
  %1162 = load <4 x i32>, ptr addrspace(3) %1134, align 16
  %.extract = extractelement <4 x i32> %1135, i64 0
  %.extract55 = extractelement <4 x i32> %1135, i64 1
  %.extract57 = extractelement <4 x i32> %1135, i64 2
  %.extract59 = extractelement <4 x i32> %1135, i64 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract, i32 %.extract55, i32 %.extract57, i32 %.extract59, ptr addrspace(1) %1067) #10
  %.extract61 = extractelement <4 x i32> %1144, i64 0
  %.extract63 = extractelement <4 x i32> %1144, i64 1
  %.extract65 = extractelement <4 x i32> %1144, i64 2
  %.extract67 = extractelement <4 x i32> %1144, i64 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract61, i32 %.extract63, i32 %.extract65, i32 %.extract67, ptr addrspace(1) %1068) #10
  %.extract69 = extractelement <4 x i32> %1153, i64 0
  %.extract71 = extractelement <4 x i32> %1153, i64 1
  %.extract73 = extractelement <4 x i32> %1153, i64 2
  %.extract75 = extractelement <4 x i32> %1153, i64 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract69, i32 %.extract71, i32 %.extract73, i32 %.extract75, ptr addrspace(1) %1069) #10
  %.extract77 = extractelement <4 x i32> %1162, i64 0
  %.extract79 = extractelement <4 x i32> %1162, i64 1
  %.extract81 = extractelement <4 x i32> %1162, i64 2
  %.extract83 = extractelement <4 x i32> %1162, i64 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract77, i32 %.extract79, i32 %.extract81, i32 %.extract83, ptr addrspace(1) %1070) #10
  ret void
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #5

define ptx_kernel void @fusion_242(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(65536) %arg1, ptr noalias align 128 dereferenceable(1245184) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(65536) %arg4) local_unnamed_addr #6 {
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 38912
  %3 = getelementptr i8, ptr addrspace(1) %arg25, i64 %.idx
  %4 = getelementptr i8, ptr addrspace(1) %3, i64 36864
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
  %15 = getelementptr i8, ptr addrspace(1) %14, i64 36864
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

define ptx_kernel void @fusion_243(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(1245184) %arg3, ptr noalias align 128 dereferenceable(65536) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5) local_unnamed_addr #6 {
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 38912
  %3 = getelementptr i8, ptr addrspace(1) %arg37, i64 %.idx
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
  %122 = getelementptr i8, ptr addrspace(1) %3, i64 36864
  %123 = getelementptr i8, ptr addrspace(1) %14, i64 36864
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

define ptx_kernel void @fusion_244(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(1245184) %arg3, ptr noalias align 128 dereferenceable(65536) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5, ptr noalias align 128 dereferenceable(65536) %arg6) local_unnamed_addr #6 {
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 38912
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
  %176 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %68
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
  %229 = getelementptr i8, ptr addrspace(1) %3, i64 36864
  %230 = getelementptr i8, ptr addrspace(1) %14, i64 36864
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
  %283 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %68
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

define ptx_kernel void @fusion_245(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(1245184) %arg3, ptr noalias align 128 dereferenceable(65536) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5, ptr noalias align 128 dereferenceable(65536) %arg6, ptr noalias align 128 dereferenceable(65536) %arg7) local_unnamed_addr #6 {
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
  %.idx = mul nsw i64 %2, 38912
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
  %336 = getelementptr i8, ptr addrspace(1) %3, i64 36864
  %337 = getelementptr i8, ptr addrspace(1) %14, i64 36864
  %338 = getelementptr bfloat, ptr addrspace(1) %336, i64 %13
  %339 = getelementptr i8, ptr addrspace(1) %338, i64 1024
  %340 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %337) #10
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
  %357 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %339) #10
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
  %374 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %349) #10
  %375 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %350) #10
  %376 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %351) #10
  %377 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %352) #10
  %378 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %353) #10
  %379 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %354) #10
  %380 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %355) #10
  %381 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %356) #10
  %382 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %366) #10
  %383 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %367) #10
  %384 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %368) #10
  %385 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %369) #10
  %386 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %370) #10
  %387 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %371) #10
  %388 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %372) #10
  %389 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %373) #10
  %390 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %68
  %391 = getelementptr bfloat, ptr addrspace(1) %390, i64 %13
  %392 = getelementptr i8, ptr addrspace(1) %391, i64 1024
  %393 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %391) #10
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
  %410 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %392) #10
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
  %427 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %402) #10
  %428 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %403) #10
  %429 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %404) #10
  %430 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %405) #10
  %431 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %406) #10
  %432 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %407) #10
  %433 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %408) #10
  %434 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %409) #10
  %435 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %419) #10
  %436 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %420) #10
  %437 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %421) #10
  %438 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %422) #10
  %439 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %423) #10
  %440 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %424) #10
  %441 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %425) #10
  %442 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %426) #10
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %608, <1 x i32> %609, i1 %606) #10
  tail call void @llvm.nvvm.barrier0()
  %610 = icmp samesign ult i32 %5, 2
  %611 = zext nneg i32 %5 to i64
  %612 = getelementptr float, ptr addrspace(3) @global_smem, i64 %611
  %613 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %612, i1 %610) #10
  %614 = bitcast i32 %613 to float
  %615 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %613, i32 1, i32 31)
  %616 = bitcast i32 %615 to float
  %617 = fadd float %614, %616
  %618 = icmp eq i32 %5, 0
  %619 = bitcast float %617 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %612, <1 x i32> %619, i1 %618) #10
  tail call void @llvm.nvvm.barrier0()
  %620 = load float, ptr addrspace(3) @global_smem, align 16
  %621 = fmul float %620, 0x3F50000000000000
  %622 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
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
  %644 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %642) #10
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
  %661 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %643) #10
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
  %678 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %653) #10
  %679 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %654) #10
  %680 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %655) #10
  %681 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %656) #10
  %682 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %657) #10
  %683 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %658) #10
  %684 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %659) #10
  %685 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %660) #10
  %686 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %670) #10
  %687 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %671) #10
  %688 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %672) #10
  %689 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %673) #10
  %690 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %674) #10
  %691 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %675) #10
  %692 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %676) #10
  %693 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %677) #10
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
  %710 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %694) #10
  %711 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %695) #10
  %712 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %696) #10
  %713 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %697) #10
  %714 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %698) #10
  %715 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %699) #10
  %716 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %700) #10
  %717 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %701) #10
  %718 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %702) #10
  %719 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %703) #10
  %720 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %704) #10
  %721 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %705) #10
  %722 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %706) #10
  %723 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %707) #10
  %724 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %708) #10
  %725 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %709) #10
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %731, i32 %734, i32 %737, i32 %740, ptr addrspace(1) %727) #10
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %743, i32 %746, i32 %749, i32 %752, ptr addrspace(1) %728) #10
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_add_fusion(ptr noalias readonly align 128 captures(none) dereferenceable(1245184) %0, ptr noalias readonly align 128 captures(none) dereferenceable(65536) %1, ptr noalias readonly align 128 captures(none) dereferenceable(65536) %2, ptr noalias readonly align 128 captures(none) dereferenceable(65536) %3, ptr noalias readonly align 128 captures(none) dereferenceable(65536) %4, ptr noalias readonly align 128 captures(none) dereferenceable(65536) %5, ptr noalias writeonly align 128 captures(none) dereferenceable(131072) %6) local_unnamed_addr #0 {
  %8 = addrspacecast ptr %6 to ptr addrspace(1)
  %9 = addrspacecast ptr %5 to ptr addrspace(1)
  %10 = addrspacecast ptr %4 to ptr addrspace(1)
  %11 = addrspacecast ptr %3 to ptr addrspace(1)
  %12 = addrspacecast ptr %2 to ptr addrspace(1)
  %13 = addrspacecast ptr %1 to ptr addrspace(1)
  %14 = addrspacecast ptr %0 to ptr addrspace(1)
  %15 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %16 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %17 = lshr i32 %16, 3
  %18 = shl nuw nsw i32 %16, 7
  %19 = and i32 %18, 896
  %20 = or disjoint i32 %19, %15
  %21 = or disjoint i32 %18, %15
  %22 = zext nneg i32 %21 to i64
  %23 = getelementptr inbounds bfloat, ptr addrspace(1) %11, i64 %22
  %24 = load bfloat, ptr addrspace(1) %23, align 2, !invariant.load !6
  %25 = getelementptr inbounds bfloat, ptr addrspace(1) %10, i64 %22
  %26 = load bfloat, ptr addrspace(1) %25, align 2, !invariant.load !6
  %27 = mul nuw nsw i32 %17, 19456
  %28 = zext nneg i32 %20 to i64
  %29 = zext nneg i32 %27 to i64
  %30 = add i64 %29, %28
  %31 = getelementptr bfloat, ptr addrspace(1) %14, i64 %30
  %32 = getelementptr inbounds i8, ptr addrspace(1) %31, i64 36864
  %33 = load bfloat, ptr addrspace(1) %32, align 2, !invariant.load !6, !alias.scope !15
  %34 = fpext bfloat %33 to float
  %35 = fpext bfloat %24 to float
  %36 = fpext bfloat %26 to float
  %37 = fadd float %35, %34
  %38 = getelementptr inbounds bfloat, ptr addrspace(1) %9, i64 %22
  %39 = load bfloat, ptr addrspace(1) %38, align 2, !invariant.load !6
  %40 = getelementptr inbounds i8, ptr addrspace(1) %31, i64 34816
  %41 = load bfloat, ptr addrspace(1) %40, align 2, !invariant.load !6, !alias.scope !18
  %42 = fpext bfloat %41 to float
  %43 = fadd float %37, %36
  %44 = fpext bfloat %39 to float
  %45 = fadd float %43, %42
  %46 = getelementptr inbounds bfloat, ptr addrspace(1) %12, i64 %22
  %47 = load bfloat, ptr addrspace(1) %46, align 2, !invariant.load !6
  %48 = getelementptr inbounds i8, ptr addrspace(1) %31, i64 32768
  %49 = load bfloat, ptr addrspace(1) %48, align 2, !invariant.load !6, !alias.scope !21
  %50 = fpext bfloat %49 to float
  %51 = fadd float %45, %44
  %52 = fpext bfloat %47 to float
  %53 = fadd float %51, %50
  %54 = getelementptr inbounds bfloat, ptr addrspace(1) %13, i64 %22
  %55 = load bfloat, ptr addrspace(1) %54, align 2, !invariant.load !6
  %56 = getelementptr inbounds i8, ptr addrspace(1) %31, i64 30720
  %57 = load bfloat, ptr addrspace(1) %56, align 2, !invariant.load !6, !alias.scope !24
  %58 = fpext bfloat %57 to float
  %59 = fadd float %53, %52
  %60 = fpext bfloat %55 to float
  %61 = fadd float %59, %58
  %62 = getelementptr inbounds i8, ptr addrspace(1) %31, i64 28672
  %63 = load bfloat, ptr addrspace(1) %62, align 2, !invariant.load !6, !alias.scope !27
  %64 = fpext bfloat %63 to float
  %65 = fadd float %61, %60
  %66 = fadd float %65, %64
  %67 = getelementptr inbounds float, ptr addrspace(1) %8, i64 %22
  store float %66, ptr addrspace(1) %67, align 4
  ret void
}

define ptx_kernel void @fusion_246(ptr noalias align 128 dereferenceable(131072) %arg0, ptr noalias align 16 dereferenceable(4) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(65536) %arg3) local_unnamed_addr #6 {
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

define ptx_kernel void @fusion_247(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(65536) %arg3, ptr noalias align 128 dereferenceable(1245184) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5) local_unnamed_addr #6 {
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 38912
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

define ptx_kernel void @fusion_248(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(65536) %arg3, ptr noalias align 128 dereferenceable(1245184) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5, ptr noalias align 128 dereferenceable(65536) %arg6) local_unnamed_addr #6 {
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 38912
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

define ptx_kernel void @fusion_249(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(1245184) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5, ptr noalias align 128 dereferenceable(65536) %arg6, ptr noalias align 128 dereferenceable(65536) %arg7) local_unnamed_addr #6 {
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
  %.idx = mul nsw i64 %2, 38912
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
define ptx_kernel void @loop_add_fusion_1(ptr noalias readonly align 128 captures(none) dereferenceable(1245184) %0, ptr noalias readonly align 128 captures(none) dereferenceable(65536) %1, ptr noalias readonly align 128 captures(none) dereferenceable(65536) %2, ptr noalias align 128 captures(none) dereferenceable(131072) %3, ptr noalias readonly align 128 captures(none) dereferenceable(65536) %4, ptr noalias readonly align 128 captures(none) dereferenceable(65536) %5) local_unnamed_addr #0 {
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
  %28 = mul nuw nsw i32 %15, 19456
  %29 = zext nneg i32 %18 to i64
  %30 = zext nneg i32 %28 to i64
  %31 = add i64 %30, %29
  %32 = getelementptr bfloat, ptr addrspace(1) %12, i64 %31
  %33 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 26624
  %34 = load bfloat, ptr addrspace(1) %33, align 2, !invariant.load !6, !alias.scope !30
  %35 = fpext bfloat %34 to float
  %36 = fadd float %25, %23
  %37 = fpext bfloat %27 to float
  %38 = fadd float %36, %35
  %39 = getelementptr inbounds bfloat, ptr addrspace(1) %10, i64 %20
  %40 = load bfloat, ptr addrspace(1) %39, align 2, !invariant.load !6
  %41 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 24576
  %42 = load bfloat, ptr addrspace(1) %41, align 2, !invariant.load !6, !alias.scope !33
  %43 = fpext bfloat %42 to float
  %44 = fadd float %38, %37
  %45 = fpext bfloat %40 to float
  %46 = fadd float %44, %43
  %47 = getelementptr inbounds bfloat, ptr addrspace(1) %11, i64 %20
  %48 = load bfloat, ptr addrspace(1) %47, align 2, !invariant.load !6
  %49 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 22528
  %50 = load bfloat, ptr addrspace(1) %49, align 2, !invariant.load !6, !alias.scope !36
  %51 = fpext bfloat %50 to float
  %52 = fadd float %46, %45
  %53 = fpext bfloat %48 to float
  %54 = fadd float %52, %51
  %55 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 20480
  %56 = load bfloat, ptr addrspace(1) %55, align 2, !invariant.load !6, !alias.scope !39
  %57 = fpext bfloat %56 to float
  %58 = fadd float %54, %53
  %59 = fadd float %58, %57
  store float %59, ptr addrspace(1) %24, align 4
  ret void
}

define ptx_kernel void @fusion_251(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(65536) %arg3, ptr noalias align 128 dereferenceable(1245184) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5) local_unnamed_addr #6 {
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 38912
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

define ptx_kernel void @fusion_252(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(65536) %arg3, ptr noalias align 128 dereferenceable(1245184) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5, ptr noalias align 128 dereferenceable(65536) %arg6) local_unnamed_addr #6 {
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 38912
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

define ptx_kernel void @fusion_253(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(1245184) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5, ptr noalias align 128 dereferenceable(65536) %arg6, ptr noalias align 128 dereferenceable(65536) %arg7) local_unnamed_addr #6 {
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
  %.idx = mul nsw i64 %2, 38912
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
define ptx_kernel void @loop_add_fusion_2(ptr noalias readonly align 128 captures(none) dereferenceable(1245184) %0, ptr noalias readonly align 128 captures(none) dereferenceable(65536) %1, ptr noalias readonly align 128 captures(none) dereferenceable(65536) %2, ptr noalias align 128 captures(none) dereferenceable(131072) %3, ptr noalias readonly align 128 captures(none) dereferenceable(65536) %4, ptr noalias readonly align 128 captures(none) dereferenceable(65536) %5) local_unnamed_addr #0 {
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
  %28 = mul nuw nsw i32 %15, 19456
  %29 = zext nneg i32 %18 to i64
  %30 = zext nneg i32 %28 to i64
  %31 = add i64 %30, %29
  %32 = getelementptr bfloat, ptr addrspace(1) %12, i64 %31
  %33 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 18432
  %34 = load bfloat, ptr addrspace(1) %33, align 2, !invariant.load !6, !alias.scope !42
  %35 = fpext bfloat %34 to float
  %36 = fadd float %25, %23
  %37 = fpext bfloat %27 to float
  %38 = fadd float %36, %35
  %39 = getelementptr inbounds bfloat, ptr addrspace(1) %10, i64 %20
  %40 = load bfloat, ptr addrspace(1) %39, align 2, !invariant.load !6
  %41 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 16384
  %42 = load bfloat, ptr addrspace(1) %41, align 2, !invariant.load !6, !alias.scope !45
  %43 = fpext bfloat %42 to float
  %44 = fadd float %38, %37
  %45 = fpext bfloat %40 to float
  %46 = fadd float %44, %43
  %47 = getelementptr inbounds bfloat, ptr addrspace(1) %11, i64 %20
  %48 = load bfloat, ptr addrspace(1) %47, align 2, !invariant.load !6
  %49 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 14336
  %50 = load bfloat, ptr addrspace(1) %49, align 2, !invariant.load !6, !alias.scope !48
  %51 = fpext bfloat %50 to float
  %52 = fadd float %46, %45
  %53 = fpext bfloat %48 to float
  %54 = fadd float %52, %51
  %55 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 12288
  %56 = load bfloat, ptr addrspace(1) %55, align 2, !invariant.load !6, !alias.scope !51
  %57 = fpext bfloat %56 to float
  %58 = fadd float %54, %53
  %59 = fadd float %58, %57
  store float %59, ptr addrspace(1) %24, align 4
  ret void
}

define ptx_kernel void @fusion_255(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(65536) %arg3, ptr noalias align 128 dereferenceable(1245184) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5) local_unnamed_addr #6 {
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 38912
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

define ptx_kernel void @fusion_256(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(65536) %arg3, ptr noalias align 128 dereferenceable(1245184) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5, ptr noalias align 128 dereferenceable(65536) %arg6) local_unnamed_addr #6 {
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 38912
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

define ptx_kernel void @fusion_257(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(1245184) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5, ptr noalias align 128 dereferenceable(65536) %arg6, ptr noalias align 128 dereferenceable(65536) %arg7) local_unnamed_addr #6 {
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
  %.idx = mul nsw i64 %2, 38912
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
define ptx_kernel void @loop_add_fusion_3(ptr noalias readonly align 128 captures(none) dereferenceable(1245184) %0, ptr noalias readonly align 128 captures(none) dereferenceable(65536) %1, ptr noalias readonly align 128 captures(none) dereferenceable(65536) %2, ptr noalias align 128 captures(none) dereferenceable(131072) %3, ptr noalias readonly align 128 captures(none) dereferenceable(65536) %4, ptr noalias readonly align 128 captures(none) dereferenceable(65536) %5) local_unnamed_addr #0 {
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
  %28 = mul nuw nsw i32 %15, 19456
  %29 = zext nneg i32 %18 to i64
  %30 = zext nneg i32 %28 to i64
  %31 = add i64 %30, %29
  %32 = getelementptr bfloat, ptr addrspace(1) %12, i64 %31
  %33 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 10240
  %34 = load bfloat, ptr addrspace(1) %33, align 2, !invariant.load !6, !alias.scope !54
  %35 = fpext bfloat %34 to float
  %36 = fadd float %25, %23
  %37 = fpext bfloat %27 to float
  %38 = fadd float %36, %35
  %39 = getelementptr inbounds bfloat, ptr addrspace(1) %10, i64 %20
  %40 = load bfloat, ptr addrspace(1) %39, align 2, !invariant.load !6
  %41 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 8192
  %42 = load bfloat, ptr addrspace(1) %41, align 2, !invariant.load !6, !alias.scope !57
  %43 = fpext bfloat %42 to float
  %44 = fadd float %38, %37
  %45 = fpext bfloat %40 to float
  %46 = fadd float %44, %43
  %47 = getelementptr inbounds bfloat, ptr addrspace(1) %11, i64 %20
  %48 = load bfloat, ptr addrspace(1) %47, align 2, !invariant.load !6
  %49 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 6144
  %50 = load bfloat, ptr addrspace(1) %49, align 2, !invariant.load !6, !alias.scope !60
  %51 = fpext bfloat %50 to float
  %52 = fadd float %46, %45
  %53 = fpext bfloat %48 to float
  %54 = fadd float %52, %51
  %55 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 4096
  %56 = load bfloat, ptr addrspace(1) %55, align 2, !invariant.load !6, !alias.scope !63
  %57 = fpext bfloat %56 to float
  %58 = fadd float %54, %53
  %59 = fadd float %58, %57
  store float %59, ptr addrspace(1) %24, align 4
  ret void
}

define ptx_kernel void @fusion_259(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(65536) %arg3, ptr noalias align 128 dereferenceable(1245184) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5) local_unnamed_addr #6 {
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 38912
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

define ptx_kernel void @fusion_260(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(65536) %arg3, ptr noalias align 128 dereferenceable(1245184) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5, ptr noalias align 128 dereferenceable(65536) %arg6) local_unnamed_addr #6 {
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 38912
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
  %15 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %13) #10
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
  %32 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %14) #10
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
  %49 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %24) #10
  %50 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %25) #10
  %51 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %26) #10
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #10
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #10
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #10
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #10
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #10
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %41) #10
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %42) #10
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %43) #10
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #10
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #10
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #10
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #10
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #10
  %65 = shl nsw i64 %2, 10
  %66 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %65
  %67 = getelementptr bfloat, ptr addrspace(1) %66, i64 %12
  %68 = getelementptr i8, ptr addrspace(1) %67, i64 1024
  %69 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %67) #10
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
  %86 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %68) #10
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
  %103 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %78) #10
  %104 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %79) #10
  %105 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %80) #10
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #10
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #10
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #10
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #10
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #10
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %95) #10
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %96) #10
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %97) #10
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #10
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #10
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #10
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #10
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #10
  %119 = getelementptr i8, ptr addrspace(1) %3, i64 2048
  %120 = getelementptr i8, ptr addrspace(1) %13, i64 2048
  %121 = getelementptr bfloat, ptr addrspace(1) %119, i64 %12
  %122 = getelementptr i8, ptr addrspace(1) %121, i64 1024
  %123 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %120) #10
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
  %173 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %65
  %174 = getelementptr bfloat, ptr addrspace(1) %173, i64 %12
  %175 = getelementptr i8, ptr addrspace(1) %174, i64 1024
  %176 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %174) #10
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
  %193 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %175) #10
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
  %210 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %185) #10
  %211 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %186) #10
  %212 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %187) #10
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #10
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #10
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #10
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #10
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #10
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %202) #10
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %203) #10
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %204) #10
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #10
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #10
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #10
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #10
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #10
  %226 = getelementptr float, ptr addrspace(1) %arg25, i64 %65
  %227 = getelementptr float, ptr addrspace(1) %226, i64 %12
  %228 = getelementptr i8, ptr addrspace(1) %227, i64 16
  %229 = getelementptr i8, ptr addrspace(1) %227, i64 2048
  %230 = getelementptr i8, ptr addrspace(1) %227, i64 2064
  %231 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %227) #10
  %232 = extractvalue { i32, i32, i32, i32 } %231, 0
  %233 = extractvalue { i32, i32, i32, i32 } %231, 1
  %234 = extractvalue { i32, i32, i32, i32 } %231, 2
  %235 = extractvalue { i32, i32, i32, i32 } %231, 3
  %236 = bitcast i32 %232 to float
  %237 = bitcast i32 %233 to float
  %238 = bitcast i32 %234 to float
  %239 = bitcast i32 %235 to float
  %240 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %228) #10
  %241 = extractvalue { i32, i32, i32, i32 } %240, 0
  %242 = extractvalue { i32, i32, i32, i32 } %240, 1
  %243 = extractvalue { i32, i32, i32, i32 } %240, 2
  %244 = extractvalue { i32, i32, i32, i32 } %240, 3
  %245 = bitcast i32 %241 to float
  %246 = bitcast i32 %242 to float
  %247 = bitcast i32 %243 to float
  %248 = bitcast i32 %244 to float
  %249 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %229) #10
  %250 = extractvalue { i32, i32, i32, i32 } %249, 0
  %251 = extractvalue { i32, i32, i32, i32 } %249, 1
  %252 = extractvalue { i32, i32, i32, i32 } %249, 2
  %253 = extractvalue { i32, i32, i32, i32 } %249, 3
  %254 = bitcast i32 %250 to float
  %255 = bitcast i32 %251 to float
  %256 = bitcast i32 %252 to float
  %257 = bitcast i32 %253 to float
  %258 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %230) #10
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %384, <1 x i32> %385, i1 %382) #10
  tail call void @llvm.nvvm.barrier0()
  %386 = icmp samesign ult i32 %4, 2
  %387 = zext nneg i32 %4 to i64
  %388 = getelementptr float, ptr addrspace(3) @global_smem, i64 %387
  %389 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %388, i1 %386) #10
  %390 = bitcast i32 %389 to float
  %391 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %389, i32 1, i32 31)
  %392 = bitcast i32 %391 to float
  %393 = fadd float %390, %392
  %394 = icmp eq i32 %4, 0
  %395 = bitcast float %393 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %388, <1 x i32> %395, i1 %394) #10
  tail call void @llvm.nvvm.barrier0()
  %396 = load float, ptr addrspace(3) @global_smem, align 16
  %397 = fmul float %396, 0x3F50000000000000
  %398 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
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
  %420 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %418) #10
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
  %437 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %419) #10
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
  %454 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %429) #10
  %455 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %430) #10
  %456 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %431) #10
  %457 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %432) #10
  %458 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %433) #10
  %459 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %434) #10
  %460 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %435) #10
  %461 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %436) #10
  %462 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %446) #10
  %463 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %447) #10
  %464 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %448) #10
  %465 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %449) #10
  %466 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %450) #10
  %467 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %451) #10
  %468 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %452) #10
  %469 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %453) #10
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
  %486 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %470) #10
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %507, i32 %510, i32 %513, i32 %516, ptr addrspace(1) %503) #10
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %519, i32 %522, i32 %525, i32 %528, ptr addrspace(1) %504) #10
  ret void
}

define ptx_kernel void @fusion_261(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(65536) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(131072) %arg3, ptr noalias align 128 dereferenceable(65536) %arg4, ptr noalias align 128 dereferenceable(1245184) %arg5, ptr noalias align 128 dereferenceable(65536) %arg6, ptr noalias align 128 dereferenceable(65536) %arg7) local_unnamed_addr #6 {
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
  %.idx = mul nsw i64 %2, 38912
  %66 = getelementptr i8, ptr addrspace(1) %arg511, i64 %.idx
  %67 = getelementptr bfloat, ptr addrspace(1) %66, i64 %13
  %68 = getelementptr i8, ptr addrspace(1) %67, i64 1024
  %69 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %67) #10
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
  %86 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %68) #10
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
  %103 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %78) #10
  %104 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %79) #10
  %105 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %80) #10
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #10
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #10
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #10
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #10
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #10
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %95) #10
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %96) #10
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %97) #10
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #10
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #10
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #10
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #10
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #10
  %119 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %3
  %120 = getelementptr bfloat, ptr addrspace(1) %119, i64 %13
  %121 = getelementptr i8, ptr addrspace(1) %120, i64 1024
  %122 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %120) #10
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
  %139 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %121) #10
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
  %156 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %131) #10
  %157 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %132) #10
  %158 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %133) #10
  %159 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %134) #10
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #10
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #10
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #10
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #10
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %148) #10
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %149) #10
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %150) #10
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %151) #10
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #10
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #10
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #10
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #10
  %172 = getelementptr i8, ptr addrspace(1) %66, i64 2048
  %173 = getelementptr i8, ptr addrspace(1) %67, i64 2048
  %174 = getelementptr bfloat, ptr addrspace(1) %172, i64 %13
  %175 = getelementptr i8, ptr addrspace(1) %174, i64 1024
  %176 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %173) #10
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
  %193 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %175) #10
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
  %210 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %185) #10
  %211 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %186) #10
  %212 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %187) #10
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #10
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #10
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #10
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #10
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #10
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %202) #10
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %203) #10
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %204) #10
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #10
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #10
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #10
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #10
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #10
  %226 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %3
  %227 = getelementptr bfloat, ptr addrspace(1) %226, i64 %13
  %228 = getelementptr i8, ptr addrspace(1) %227, i64 1024
  %229 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %227) #10
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
  %246 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %228) #10
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
  %263 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %238) #10
  %264 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %239) #10
  %265 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %240) #10
  %266 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %241) #10
  %267 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242) #10
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #10
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244) #10
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245) #10
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %255) #10
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %256) #10
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %257) #10
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %258) #10
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259) #10
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #10
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #10
  %278 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262) #10
  %279 = getelementptr float, ptr addrspace(1) %arg37, i64 %3
  %280 = getelementptr float, ptr addrspace(1) %279, i64 %13
  %281 = getelementptr i8, ptr addrspace(1) %280, i64 16
  %282 = getelementptr i8, ptr addrspace(1) %280, i64 2048
  %283 = getelementptr i8, ptr addrspace(1) %280, i64 2064
  %284 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %280) #10
  %285 = extractvalue { i32, i32, i32, i32 } %284, 0
  %286 = extractvalue { i32, i32, i32, i32 } %284, 1
  %287 = extractvalue { i32, i32, i32, i32 } %284, 2
  %288 = extractvalue { i32, i32, i32, i32 } %284, 3
  %289 = bitcast i32 %285 to float
  %290 = bitcast i32 %286 to float
  %291 = bitcast i32 %287 to float
  %292 = bitcast i32 %288 to float
  %293 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %281) #10
  %294 = extractvalue { i32, i32, i32, i32 } %293, 0
  %295 = extractvalue { i32, i32, i32, i32 } %293, 1
  %296 = extractvalue { i32, i32, i32, i32 } %293, 2
  %297 = extractvalue { i32, i32, i32, i32 } %293, 3
  %298 = bitcast i32 %294 to float
  %299 = bitcast i32 %295 to float
  %300 = bitcast i32 %296 to float
  %301 = bitcast i32 %297 to float
  %302 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %282) #10
  %303 = extractvalue { i32, i32, i32, i32 } %302, 0
  %304 = extractvalue { i32, i32, i32, i32 } %302, 1
  %305 = extractvalue { i32, i32, i32, i32 } %302, 2
  %306 = extractvalue { i32, i32, i32, i32 } %302, 3
  %307 = bitcast i32 %303 to float
  %308 = bitcast i32 %304 to float
  %309 = bitcast i32 %305 to float
  %310 = bitcast i32 %306 to float
  %311 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %283) #10
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %453, <1 x i32> %454, i1 %451) #10
  tail call void @llvm.nvvm.barrier0()
  %455 = icmp samesign ult i32 %5, 2
  %456 = zext nneg i32 %5 to i64
  %457 = getelementptr float, ptr addrspace(3) @global_smem, i64 %456
  %458 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %457, i1 %455) #10
  %459 = bitcast i32 %458 to float
  %460 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %458, i32 1, i32 31)
  %461 = bitcast i32 %460 to float
  %462 = fadd float %459, %461
  %463 = icmp eq i32 %5, 0
  %464 = bitcast float %462 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %457, <1 x i32> %464, i1 %463) #10
  tail call void @llvm.nvvm.barrier0()
  %465 = load float, ptr addrspace(3) @global_smem, align 16
  %466 = fmul float %465, 0x3F50000000000000
  %467 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
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
  %489 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %487) #10
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
  %506 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %488) #10
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
  %523 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %498) #10
  %524 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %499) #10
  %525 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %500) #10
  %526 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %501) #10
  %527 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %502) #10
  %528 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %503) #10
  %529 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %504) #10
  %530 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %505) #10
  %531 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %515) #10
  %532 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %516) #10
  %533 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %517) #10
  %534 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %518) #10
  %535 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %519) #10
  %536 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %520) #10
  %537 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %521) #10
  %538 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %522) #10
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
  %555 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %539) #10
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %576, i32 %579, i32 %582, i32 %585, ptr addrspace(1) %572) #10
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %588, i32 %591, i32 %594, i32 %597, ptr addrspace(1) %573) #10
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

define ptx_kernel void @fusion_221(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(262144) %arg1, ptr noalias align 16 dereferenceable(256) %arg2, ptr noalias align 128 dereferenceable(131072) %arg3) local_unnamed_addr #6 {
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
  tail call void @llvm.experimental.noalias.scope.decl(metadata !66)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !69)
  %21 = zext nneg i32 %11 to i64
  %22 = getelementptr inbounds i32, ptr addrspace(1) %6, i64 %21
  %23 = load i32, ptr addrspace(1) %22, align 4, !invariant.load !6, !alias.scope !69, !noalias !66
  %24 = tail call i32 @llvm.smin.i32(i32 %23, i32 40959)
  %25 = tail call i32 @llvm.smax.i32(i32 %24, i32 0)
  %26 = shl nuw nsw i32 %25, 7
  %27 = or disjoint i32 %26, %12
  %28 = zext nneg i32 %27 to i64
  %29 = getelementptr inbounds bfloat, ptr addrspace(1) %7, i64 %28
  %30 = load bfloat, ptr addrspace(1) %29, align 2, !invariant.load !6, !alias.scope !66, !noalias !69
  %31 = fpext bfloat %30 to float
  %32 = fmul float %20, %31
  %33 = getelementptr inbounds i8, ptr addrspace(1) %19, i64 256
  %34 = load float, ptr addrspace(1) %33, align 4, !invariant.load !6
  %35 = or disjoint i32 %9, %26
  %36 = or i32 %35, 64
  %37 = zext nneg i32 %36 to i64
  %38 = getelementptr inbounds bfloat, ptr addrspace(1) %7, i64 %37
  %39 = load bfloat, ptr addrspace(1) %38, align 2, !invariant.load !6, !alias.scope !71, !noalias !74
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
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !76
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
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !76
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
!5 = !{i32 0, i32 256}
!6 = !{}
!7 = !{i32 0, i32 311296}
!8 = !{i32 0, i32 768}
!9 = !{!10}
!10 = distinct !{!10, !11, !"fused_convert_param_0_602: argument 0"}
!11 = distinct !{!11, !"fused_convert_param_0_602"}
!12 = !{!13}
!13 = distinct !{!13, !14, !"fused_convert_param_0_602: argument 0"}
!14 = distinct !{!14, !"fused_convert_param_0_602"}
!15 = !{!16}
!16 = distinct !{!16, !17, !"fused_add_convert_926_29: argument 0"}
!17 = distinct !{!17, !"fused_add_convert_926_29"}
!18 = !{!19}
!19 = distinct !{!19, !20, !"fused_add_convert_926_29: argument 0"}
!20 = distinct !{!20, !"fused_add_convert_926_29"}
!21 = !{!22}
!22 = distinct !{!22, !23, !"fused_add_convert_926_29: argument 0"}
!23 = distinct !{!23, !"fused_add_convert_926_29"}
!24 = !{!25}
!25 = distinct !{!25, !26, !"fused_add_convert_926_29: argument 0"}
!26 = distinct !{!26, !"fused_add_convert_926_29"}
!27 = !{!28}
!28 = distinct !{!28, !29, !"fused_add_convert_926_29: argument 0"}
!29 = distinct !{!29, !"fused_add_convert_926_29"}
!30 = !{!31}
!31 = distinct !{!31, !32, !"fused_add_1_convert_926_37: argument 0"}
!32 = distinct !{!32, !"fused_add_1_convert_926_37"}
!33 = !{!34}
!34 = distinct !{!34, !35, !"fused_add_1_convert_926_37: argument 0"}
!35 = distinct !{!35, !"fused_add_1_convert_926_37"}
!36 = !{!37}
!37 = distinct !{!37, !38, !"fused_add_1_convert_926_37: argument 0"}
!38 = distinct !{!38, !"fused_add_1_convert_926_37"}
!39 = !{!40}
!40 = distinct !{!40, !41, !"fused_add_1_convert_926_37: argument 0"}
!41 = distinct !{!41, !"fused_add_1_convert_926_37"}
!42 = !{!43}
!43 = distinct !{!43, !44, !"fused_add_2_convert_926_45: argument 0"}
!44 = distinct !{!44, !"fused_add_2_convert_926_45"}
!45 = !{!46}
!46 = distinct !{!46, !47, !"fused_add_2_convert_926_45: argument 0"}
!47 = distinct !{!47, !"fused_add_2_convert_926_45"}
!48 = !{!49}
!49 = distinct !{!49, !50, !"fused_add_2_convert_926_45: argument 0"}
!50 = distinct !{!50, !"fused_add_2_convert_926_45"}
!51 = !{!52}
!52 = distinct !{!52, !53, !"fused_add_2_convert_926_45: argument 0"}
!53 = distinct !{!53, !"fused_add_2_convert_926_45"}
!54 = !{!55}
!55 = distinct !{!55, !56, !"fused_add_3_convert_926_53: argument 0"}
!56 = distinct !{!56, !"fused_add_3_convert_926_53"}
!57 = !{!58}
!58 = distinct !{!58, !59, !"fused_add_3_convert_926_53: argument 0"}
!59 = distinct !{!59, !"fused_add_3_convert_926_53"}
!60 = !{!61}
!61 = distinct !{!61, !62, !"fused_add_3_convert_926_53: argument 0"}
!62 = distinct !{!62, !"fused_add_3_convert_926_53"}
!63 = !{!64}
!64 = distinct !{!64, !65, !"fused_add_3_convert_926_53: argument 0"}
!65 = distinct !{!65, !"fused_add_3_convert_926_53"}
!66 = !{!67}
!67 = distinct !{!67, !68, !"fused_concatenate_convert_1199_7: argument 0"}
!68 = distinct !{!68, !"fused_concatenate_convert_1199_7"}
!69 = !{!70}
!70 = distinct !{!70, !68, !"fused_concatenate_convert_1199_7: argument 1"}
!71 = !{!72}
!72 = distinct !{!72, !73, !"fused_concatenate_convert_1199_7: argument 0"}
!73 = distinct !{!73, !"fused_concatenate_convert_1199_7"}
!74 = !{!75}
!75 = distinct !{!75, !73, !"fused_concatenate_convert_1199_7: argument 1"}
!76 = !{i32 0, i32 135456}

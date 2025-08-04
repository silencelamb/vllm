; ModuleID = 'SyncTensorsGraph.293'
source_filename = "SyncTensorsGraph.293"
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

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #2

define ptx_kernel void @gemm_fusion_dot_7_0(ptr noalias align 16 dereferenceable(4194304) %arg0, ptr noalias align 16 dereferenceable(4194304) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2) local_unnamed_addr #3 {
  %arg268 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg166 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg064 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %.frozen = freeze i32 %1
  %2 = sdiv i32 %.frozen, 8
  %3 = shl nsw i32 %2, 3
  %4 = sub i32 64, %3
  %5 = tail call i32 @llvm.smin.i32(i32 %4, i32 8)
  %6 = srem i32 %1, %5
  %7 = add i32 %3, %6
  %8 = shl i32 %7, 5
  %9 = icmp slt i32 %8, 1024
  %.v = select i1 %9, ptr addrspace(1) %arg064, ptr addrspace(1) %arg166
  %10 = add i32 %8, -1024
  %11 = select i1 %9, i32 %8, i32 %10
  %12 = sext i32 %11 to i64
  %13 = tail call range(i32 0, 128) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %14 = and i32 %13, 32
  %.not = icmp eq i32 %14, 0
  %.lobit = lshr i32 %14, 5
  %15 = icmp samesign ult i32 %13, 64
  %16 = select i1 %15, i32 0, i32 2
  %17 = and i32 %13, 1
  %18 = icmp eq i32 %17, 0
  %19 = and i32 %13, 2
  %20 = icmp eq i32 %19, 0
  %21 = shl i32 %13, 3
  %22 = and i32 %21, 24
  %23 = and i32 %13, 4
  %.not2 = icmp eq i32 %23, 0
  %24 = shl i32 %23, 3
  %25 = or disjoint i32 %22, %24
  %26 = and i32 %13, 8
  %27 = shl i32 %26, 3
  %28 = or disjoint i32 %25, %27
  %29 = and i32 %13, 16
  %30 = shl i32 %29, 3
  %31 = or disjoint i32 %28, %30
  %32 = select i1 %.not, i32 0, i32 264
  %33 = select i1 %15, i32 0, i32 528
  %34 = or disjoint i32 %32, %33
  %35 = xor i32 %34, %31
  %36 = zext nneg i32 %35 to i64
  %37 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %36
  %38 = or disjoint i32 %22, 1056
  %39 = xor i32 %38, %24
  %40 = or disjoint i32 %27, %39
  %41 = or disjoint i32 %40, %30
  %42 = xor i32 %34, %41
  %43 = zext nneg i32 %42 to i64
  %44 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %43
  %45 = or disjoint i32 %31, 2048
  %46 = xor i32 %34, %45
  %47 = zext nneg i32 %46 to i64
  %48 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %47
  %49 = or disjoint i32 %22, 3104
  %50 = xor i32 %49, %24
  %51 = or disjoint i32 %27, %50
  %52 = or disjoint i32 %51, %30
  %53 = xor i32 %34, %52
  %54 = zext nneg i32 %53 to i64
  %55 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %54
  %56 = or disjoint i32 %31, 4096
  %57 = xor i32 %34, %56
  %58 = zext nneg i32 %57 to i64
  %59 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %58
  %60 = or disjoint i32 %22, 5152
  %61 = xor i32 %60, %24
  %62 = or disjoint i32 %27, %61
  %63 = or disjoint i32 %62, %30
  %64 = xor i32 %34, %63
  %65 = zext nneg i32 %64 to i64
  %66 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %65
  %67 = or disjoint i32 %31, 6144
  %68 = xor i32 %34, %67
  %69 = zext nneg i32 %68 to i64
  %70 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %69
  %71 = or disjoint i32 %22, 7200
  %72 = xor i32 %71, %24
  %73 = or disjoint i32 %27, %72
  %74 = or disjoint i32 %73, %30
  %75 = xor i32 %34, %74
  %76 = zext nneg i32 %75 to i64
  %77 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %76
  %78 = select i1 %18, i32 0, i32 264
  %79 = select i1 %20, i32 0, i32 528
  %80 = or disjoint i32 %78, %79
  %81 = select i1 %.not2, i32 0, i32 1056
  %82 = shl nuw nsw i32 %26, 8
  %83 = or disjoint i32 %81, %82
  %84 = or disjoint i32 %83, %80
  %85 = lshr exact i32 %29, 1
  %86 = xor i32 %84, %85
  %87 = select i1 %15, i32 0, i32 4096
  %88 = or disjoint i32 %86, %87
  %89 = zext nneg i32 %88 to i64
  %90 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %89
  %91 = ptrtoint ptr addrspace(3) %90 to i64
  %92 = trunc i64 %91 to i32
  %93 = or disjoint i32 %78, 16
  %94 = xor i32 %93, %79
  %95 = or disjoint i32 %82, %94
  %96 = or disjoint i32 %95, %81
  %97 = or disjoint i32 %87, %85
  %98 = xor i32 %97, %96
  %99 = zext nneg i32 %98 to i64
  %100 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %99
  %101 = ptrtoint ptr addrspace(3) %100 to i64
  %102 = trunc i64 %101 to i32
  %103 = or disjoint i32 %80, 32
  %104 = xor i32 %103, %81
  %105 = or disjoint i32 %104, %82
  %106 = xor i32 %97, %105
  %107 = zext nneg i32 %106 to i64
  %108 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %107
  %109 = ptrtoint ptr addrspace(3) %108 to i64
  %110 = trunc i64 %109 to i32
  %111 = or disjoint i32 %78, 48
  %112 = or disjoint i32 %81, %79
  %113 = xor i32 %112, %111
  %114 = or disjoint i32 %113, %82
  %115 = xor i32 %97, %114
  %116 = zext nneg i32 %115 to i64
  %117 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %116
  %118 = ptrtoint ptr addrspace(3) %117 to i64
  %119 = trunc i64 %118 to i32
  %120 = or disjoint i32 %84, 64
  %121 = xor i32 %97, %120
  %122 = zext nneg i32 %121 to i64
  %123 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %122
  %124 = ptrtoint ptr addrspace(3) %123 to i64
  %125 = trunc i64 %124 to i32
  %126 = or disjoint i32 %78, 80
  %127 = xor i32 %126, %79
  %128 = or disjoint i32 %82, %127
  %129 = or disjoint i32 %128, %81
  %130 = xor i32 %97, %129
  %131 = zext nneg i32 %130 to i64
  %132 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %131
  %133 = ptrtoint ptr addrspace(3) %132 to i64
  %134 = trunc i64 %133 to i32
  %135 = or disjoint i32 %80, 96
  %136 = xor i32 %135, %81
  %137 = or disjoint i32 %136, %82
  %138 = xor i32 %97, %137
  %139 = zext nneg i32 %138 to i64
  %140 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %139
  %141 = ptrtoint ptr addrspace(3) %140 to i64
  %142 = trunc i64 %141 to i32
  %143 = or disjoint i32 %78, 112
  %144 = xor i32 %112, %143
  %145 = or disjoint i32 %144, %82
  %146 = xor i32 %97, %145
  %147 = zext nneg i32 %146 to i64
  %148 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %147
  %149 = ptrtoint ptr addrspace(3) %148 to i64
  %150 = trunc i64 %149 to i32
  %151 = or disjoint i32 %84, 128
  %152 = xor i32 %97, %151
  %153 = zext nneg i32 %152 to i64
  %154 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %153
  %155 = ptrtoint ptr addrspace(3) %154 to i64
  %156 = trunc i64 %155 to i32
  %157 = or disjoint i32 %78, 144
  %158 = xor i32 %157, %79
  %159 = or disjoint i32 %82, %158
  %160 = or disjoint i32 %159, %81
  %161 = xor i32 %97, %160
  %162 = zext nneg i32 %161 to i64
  %163 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %162
  %164 = ptrtoint ptr addrspace(3) %163 to i64
  %165 = trunc i64 %164 to i32
  %166 = or disjoint i32 %80, 160
  %167 = xor i32 %166, %81
  %168 = or disjoint i32 %167, %82
  %169 = xor i32 %97, %168
  %170 = zext nneg i32 %169 to i64
  %171 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %170
  %172 = ptrtoint ptr addrspace(3) %171 to i64
  %173 = trunc i64 %172 to i32
  %174 = or disjoint i32 %78, 176
  %175 = xor i32 %112, %174
  %176 = or disjoint i32 %175, %82
  %177 = xor i32 %97, %176
  %178 = zext nneg i32 %177 to i64
  %179 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %178
  %180 = ptrtoint ptr addrspace(3) %179 to i64
  %181 = trunc i64 %180 to i32
  %182 = or disjoint i32 %84, 192
  %183 = xor i32 %97, %182
  %184 = zext nneg i32 %183 to i64
  %185 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %184
  %186 = ptrtoint ptr addrspace(3) %185 to i64
  %187 = trunc i64 %186 to i32
  %188 = or disjoint i32 %78, 208
  %189 = xor i32 %188, %79
  %190 = or disjoint i32 %82, %189
  %191 = or disjoint i32 %190, %81
  %192 = xor i32 %97, %191
  %193 = zext nneg i32 %192 to i64
  %194 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %193
  %195 = ptrtoint ptr addrspace(3) %194 to i64
  %196 = trunc i64 %195 to i32
  %197 = or disjoint i32 %80, 224
  %198 = xor i32 %197, %81
  %199 = or disjoint i32 %198, %82
  %200 = xor i32 %97, %199
  %201 = zext nneg i32 %200 to i64
  %202 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %201
  %203 = ptrtoint ptr addrspace(3) %202 to i64
  %204 = trunc i64 %203 to i32
  %205 = or disjoint i32 %78, 240
  %206 = xor i32 %112, %205
  %207 = or disjoint i32 %206, %82
  %208 = xor i32 %97, %207
  %209 = zext nneg i32 %208 to i64
  %210 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %209
  %211 = ptrtoint ptr addrspace(3) %210 to i64
  %212 = trunc i64 %211 to i32
  %213 = add i32 %30, %27
  %214 = add i32 %213, %24
  %215 = add i32 %214, %22
  %216 = zext nneg i32 %215 to i64
  %217 = shl nuw nsw i64 %216, 1
  %218 = add i32 %16, %.lobit
  %219 = zext nneg i32 %218 to i64
  %220 = add i64 %12, %219
  %221 = shl nsw i64 %220, 12
  %scevgep = getelementptr i8, ptr addrspace(1) %.v, i64 %221
  %222 = add i32 %218, 4
  %223 = zext nneg i32 %222 to i64
  %224 = add i64 %12, %223
  %225 = shl nsw i64 %224, 12
  %scevgep73 = getelementptr i8, ptr addrspace(1) %.v, i64 %225
  %226 = add i32 %218, 8
  %227 = zext nneg i32 %226 to i64
  %228 = add i64 %12, %227
  %229 = shl nsw i64 %228, 12
  %scevgep77 = getelementptr i8, ptr addrspace(1) %.v, i64 %229
  %230 = add i32 %218, 12
  %231 = zext nneg i32 %230 to i64
  %232 = add i64 %12, %231
  %233 = shl nsw i64 %232, 12
  %scevgep81 = getelementptr i8, ptr addrspace(1) %.v, i64 %233
  %234 = add i32 %218, 16
  %235 = zext nneg i32 %234 to i64
  %236 = add i64 %12, %235
  %237 = shl nsw i64 %236, 12
  %scevgep85 = getelementptr i8, ptr addrspace(1) %.v, i64 %237
  %238 = add i32 %218, 20
  %239 = zext nneg i32 %238 to i64
  %240 = add i64 %12, %239
  %241 = shl nsw i64 %240, 12
  %scevgep89 = getelementptr i8, ptr addrspace(1) %.v, i64 %241
  %242 = add i32 %218, 24
  %243 = zext nneg i32 %242 to i64
  %244 = add i64 %12, %243
  %245 = shl nsw i64 %244, 12
  %scevgep93 = getelementptr i8, ptr addrspace(1) %.v, i64 %245
  %246 = add i32 %218, 28
  %247 = zext nneg i32 %246 to i64
  %248 = add i64 %12, %247
  %249 = shl nsw i64 %248, 12
  %scevgep97 = getelementptr i8, ptr addrspace(1) %.v, i64 %249
  br label %250

250:                                              ; preds = %0, %250
  %lsr.iv98 = phi ptr addrspace(1) [ %scevgep97, %0 ], [ %scevgep99, %250 ]
  %lsr.iv94 = phi ptr addrspace(1) [ %scevgep93, %0 ], [ %scevgep95, %250 ]
  %lsr.iv90 = phi ptr addrspace(1) [ %scevgep89, %0 ], [ %scevgep91, %250 ]
  %lsr.iv86 = phi ptr addrspace(1) [ %scevgep85, %0 ], [ %scevgep87, %250 ]
  %lsr.iv82 = phi ptr addrspace(1) [ %scevgep81, %0 ], [ %scevgep83, %250 ]
  %lsr.iv78 = phi ptr addrspace(1) [ %scevgep77, %0 ], [ %scevgep79, %250 ]
  %lsr.iv74 = phi ptr addrspace(1) [ %scevgep73, %0 ], [ %scevgep75, %250 ]
  %lsr.iv70 = phi ptr addrspace(1) [ %scevgep, %0 ], [ %scevgep71, %250 ]
  %lsr.iv = phi i32 [ -256, %0 ], [ %lsr.iv.next, %250 ]
  %251 = phi { float, float, float, float, float, float, float, float } [ zeroinitializer, %0 ], [ %619, %250 ]
  %scevgep72 = getelementptr i8, ptr addrspace(1) %lsr.iv70, i64 %217
  %scevgep76 = getelementptr i8, ptr addrspace(1) %lsr.iv74, i64 %217
  %scevgep80 = getelementptr i8, ptr addrspace(1) %lsr.iv78, i64 %217
  %scevgep84 = getelementptr i8, ptr addrspace(1) %lsr.iv82, i64 %217
  %scevgep88 = getelementptr i8, ptr addrspace(1) %lsr.iv86, i64 %217
  %scevgep92 = getelementptr i8, ptr addrspace(1) %lsr.iv90, i64 %217
  %scevgep96 = getelementptr i8, ptr addrspace(1) %lsr.iv94, i64 %217
  %scevgep100 = getelementptr i8, ptr addrspace(1) %lsr.iv98, i64 %217
  %252 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %scevgep72) #9
  %253 = extractvalue { i32, i32, i32, i32 } %252, 0
  %254 = bitcast i32 %253 to <2 x bfloat>
  %255 = extractvalue { i32, i32, i32, i32 } %252, 1
  %256 = bitcast i32 %255 to <2 x bfloat>
  %257 = extractvalue { i32, i32, i32, i32 } %252, 2
  %258 = bitcast i32 %257 to <2 x bfloat>
  %259 = shufflevector <2 x bfloat> %258, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %260 = extractvalue { i32, i32, i32, i32 } %252, 3
  %261 = bitcast i32 %260 to <2 x bfloat>
  %262 = shufflevector <2 x bfloat> %261, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %263 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %scevgep76) #9
  %264 = extractvalue { i32, i32, i32, i32 } %263, 0
  %265 = bitcast i32 %264 to <2 x bfloat>
  %266 = extractvalue { i32, i32, i32, i32 } %263, 1
  %267 = bitcast i32 %266 to <2 x bfloat>
  %268 = extractvalue { i32, i32, i32, i32 } %263, 2
  %269 = bitcast i32 %268 to <2 x bfloat>
  %270 = shufflevector <2 x bfloat> %269, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %271 = extractvalue { i32, i32, i32, i32 } %263, 3
  %272 = bitcast i32 %271 to <2 x bfloat>
  %273 = shufflevector <2 x bfloat> %272, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %274 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %scevgep80) #9
  %275 = extractvalue { i32, i32, i32, i32 } %274, 0
  %276 = bitcast i32 %275 to <2 x bfloat>
  %277 = extractvalue { i32, i32, i32, i32 } %274, 1
  %278 = bitcast i32 %277 to <2 x bfloat>
  %279 = extractvalue { i32, i32, i32, i32 } %274, 2
  %280 = bitcast i32 %279 to <2 x bfloat>
  %281 = shufflevector <2 x bfloat> %280, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %282 = extractvalue { i32, i32, i32, i32 } %274, 3
  %283 = bitcast i32 %282 to <2 x bfloat>
  %284 = shufflevector <2 x bfloat> %283, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %285 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %scevgep84) #9
  %286 = extractvalue { i32, i32, i32, i32 } %285, 0
  %287 = bitcast i32 %286 to <2 x bfloat>
  %288 = extractvalue { i32, i32, i32, i32 } %285, 1
  %289 = bitcast i32 %288 to <2 x bfloat>
  %290 = extractvalue { i32, i32, i32, i32 } %285, 2
  %291 = bitcast i32 %290 to <2 x bfloat>
  %292 = shufflevector <2 x bfloat> %291, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %293 = extractvalue { i32, i32, i32, i32 } %285, 3
  %294 = bitcast i32 %293 to <2 x bfloat>
  %295 = shufflevector <2 x bfloat> %294, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %296 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %scevgep88) #9
  %297 = extractvalue { i32, i32, i32, i32 } %296, 0
  %298 = bitcast i32 %297 to <2 x bfloat>
  %299 = extractvalue { i32, i32, i32, i32 } %296, 1
  %300 = bitcast i32 %299 to <2 x bfloat>
  %301 = extractvalue { i32, i32, i32, i32 } %296, 2
  %302 = bitcast i32 %301 to <2 x bfloat>
  %303 = shufflevector <2 x bfloat> %302, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %304 = extractvalue { i32, i32, i32, i32 } %296, 3
  %305 = bitcast i32 %304 to <2 x bfloat>
  %306 = shufflevector <2 x bfloat> %305, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %307 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %scevgep92) #9
  %308 = extractvalue { i32, i32, i32, i32 } %307, 0
  %309 = bitcast i32 %308 to <2 x bfloat>
  %310 = extractvalue { i32, i32, i32, i32 } %307, 1
  %311 = bitcast i32 %310 to <2 x bfloat>
  %312 = extractvalue { i32, i32, i32, i32 } %307, 2
  %313 = bitcast i32 %312 to <2 x bfloat>
  %314 = shufflevector <2 x bfloat> %313, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %315 = extractvalue { i32, i32, i32, i32 } %307, 3
  %316 = bitcast i32 %315 to <2 x bfloat>
  %317 = shufflevector <2 x bfloat> %316, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %318 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %scevgep96) #9
  %319 = extractvalue { i32, i32, i32, i32 } %318, 0
  %320 = bitcast i32 %319 to <2 x bfloat>
  %321 = extractvalue { i32, i32, i32, i32 } %318, 1
  %322 = bitcast i32 %321 to <2 x bfloat>
  %323 = extractvalue { i32, i32, i32, i32 } %318, 2
  %324 = bitcast i32 %323 to <2 x bfloat>
  %325 = shufflevector <2 x bfloat> %324, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %326 = extractvalue { i32, i32, i32, i32 } %318, 3
  %327 = bitcast i32 %326 to <2 x bfloat>
  %328 = shufflevector <2 x bfloat> %327, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %329 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %scevgep100) #9
  %330 = extractvalue { i32, i32, i32, i32 } %329, 0
  %331 = bitcast i32 %330 to <2 x bfloat>
  %332 = extractvalue { i32, i32, i32, i32 } %329, 1
  %333 = bitcast i32 %332 to <2 x bfloat>
  %334 = extractvalue { i32, i32, i32, i32 } %329, 2
  %335 = bitcast i32 %334 to <2 x bfloat>
  %336 = shufflevector <2 x bfloat> %335, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %337 = extractvalue { i32, i32, i32, i32 } %329, 3
  %338 = bitcast i32 %337 to <2 x bfloat>
  %339 = shufflevector <2 x bfloat> %338, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  tail call void @llvm.nvvm.barrier0()
  %340 = shufflevector <2 x bfloat> %254, <2 x bfloat> %256, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 poison, i32 poison, i32 poison, i32 poison>
  %341 = shufflevector <8 x bfloat> %340, <8 x bfloat> %259, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 poison, i32 poison>
  %342 = shufflevector <8 x bfloat> %341, <8 x bfloat> %262, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 8, i32 9>
  store <8 x bfloat> %342, ptr addrspace(3) %37, align 16
  %343 = shufflevector <2 x bfloat> %265, <2 x bfloat> %267, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 poison, i32 poison, i32 poison, i32 poison>
  %344 = shufflevector <8 x bfloat> %343, <8 x bfloat> %270, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 poison, i32 poison>
  %345 = shufflevector <8 x bfloat> %344, <8 x bfloat> %273, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 8, i32 9>
  store <8 x bfloat> %345, ptr addrspace(3) %44, align 16
  %346 = shufflevector <2 x bfloat> %276, <2 x bfloat> %278, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 poison, i32 poison, i32 poison, i32 poison>
  %347 = shufflevector <8 x bfloat> %346, <8 x bfloat> %281, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 poison, i32 poison>
  %348 = shufflevector <8 x bfloat> %347, <8 x bfloat> %284, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 8, i32 9>
  store <8 x bfloat> %348, ptr addrspace(3) %48, align 16
  %349 = shufflevector <2 x bfloat> %287, <2 x bfloat> %289, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 poison, i32 poison, i32 poison, i32 poison>
  %350 = shufflevector <8 x bfloat> %349, <8 x bfloat> %292, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 poison, i32 poison>
  %351 = shufflevector <8 x bfloat> %350, <8 x bfloat> %295, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 8, i32 9>
  store <8 x bfloat> %351, ptr addrspace(3) %55, align 16
  %352 = shufflevector <2 x bfloat> %298, <2 x bfloat> %300, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 poison, i32 poison, i32 poison, i32 poison>
  %353 = shufflevector <8 x bfloat> %352, <8 x bfloat> %303, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 poison, i32 poison>
  %354 = shufflevector <8 x bfloat> %353, <8 x bfloat> %306, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 8, i32 9>
  store <8 x bfloat> %354, ptr addrspace(3) %59, align 16
  %355 = shufflevector <2 x bfloat> %309, <2 x bfloat> %311, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 poison, i32 poison, i32 poison, i32 poison>
  %356 = shufflevector <8 x bfloat> %355, <8 x bfloat> %314, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 poison, i32 poison>
  %357 = shufflevector <8 x bfloat> %356, <8 x bfloat> %317, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 8, i32 9>
  store <8 x bfloat> %357, ptr addrspace(3) %66, align 16
  %358 = shufflevector <2 x bfloat> %320, <2 x bfloat> %322, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 poison, i32 poison, i32 poison, i32 poison>
  %359 = shufflevector <8 x bfloat> %358, <8 x bfloat> %325, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 poison, i32 poison>
  %360 = shufflevector <8 x bfloat> %359, <8 x bfloat> %328, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 8, i32 9>
  store <8 x bfloat> %360, ptr addrspace(3) %70, align 16
  %361 = shufflevector <2 x bfloat> %331, <2 x bfloat> %333, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 poison, i32 poison, i32 poison, i32 poison>
  %362 = shufflevector <8 x bfloat> %361, <8 x bfloat> %336, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 poison, i32 poison>
  %363 = shufflevector <8 x bfloat> %362, <8 x bfloat> %339, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 8, i32 9>
  store <8 x bfloat> %363, ptr addrspace(3) %77, align 16
  tail call void @llvm.nvvm.barrier0()
  %364 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %92) #9
  %365 = extractvalue { i32, i32, i32, i32 } %364, 0
  %366 = extractvalue { i32, i32, i32, i32 } %364, 1
  %367 = extractvalue { i32, i32, i32, i32 } %364, 2
  %368 = extractvalue { i32, i32, i32, i32 } %364, 3
  %369 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %102) #9
  %370 = extractvalue { i32, i32, i32, i32 } %369, 0
  %371 = extractvalue { i32, i32, i32, i32 } %369, 1
  %372 = extractvalue { i32, i32, i32, i32 } %369, 2
  %373 = extractvalue { i32, i32, i32, i32 } %369, 3
  %374 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %110) #9
  %375 = extractvalue { i32, i32, i32, i32 } %374, 0
  %376 = extractvalue { i32, i32, i32, i32 } %374, 1
  %377 = extractvalue { i32, i32, i32, i32 } %374, 2
  %378 = extractvalue { i32, i32, i32, i32 } %374, 3
  %379 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %119) #9
  %380 = extractvalue { i32, i32, i32, i32 } %379, 0
  %381 = extractvalue { i32, i32, i32, i32 } %379, 1
  %382 = extractvalue { i32, i32, i32, i32 } %379, 2
  %383 = extractvalue { i32, i32, i32, i32 } %379, 3
  %384 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %125) #9
  %385 = extractvalue { i32, i32, i32, i32 } %384, 0
  %386 = extractvalue { i32, i32, i32, i32 } %384, 1
  %387 = extractvalue { i32, i32, i32, i32 } %384, 2
  %388 = extractvalue { i32, i32, i32, i32 } %384, 3
  %389 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %134) #9
  %390 = extractvalue { i32, i32, i32, i32 } %389, 0
  %391 = extractvalue { i32, i32, i32, i32 } %389, 1
  %392 = extractvalue { i32, i32, i32, i32 } %389, 2
  %393 = extractvalue { i32, i32, i32, i32 } %389, 3
  %394 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %142) #9
  %395 = extractvalue { i32, i32, i32, i32 } %394, 0
  %396 = extractvalue { i32, i32, i32, i32 } %394, 1
  %397 = extractvalue { i32, i32, i32, i32 } %394, 2
  %398 = extractvalue { i32, i32, i32, i32 } %394, 3
  %399 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %150) #9
  %400 = extractvalue { i32, i32, i32, i32 } %399, 0
  %401 = extractvalue { i32, i32, i32, i32 } %399, 1
  %402 = extractvalue { i32, i32, i32, i32 } %399, 2
  %403 = extractvalue { i32, i32, i32, i32 } %399, 3
  %404 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %156) #9
  %405 = extractvalue { i32, i32, i32, i32 } %404, 0
  %406 = extractvalue { i32, i32, i32, i32 } %404, 1
  %407 = extractvalue { i32, i32, i32, i32 } %404, 2
  %408 = extractvalue { i32, i32, i32, i32 } %404, 3
  %409 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %165) #9
  %410 = extractvalue { i32, i32, i32, i32 } %409, 0
  %411 = extractvalue { i32, i32, i32, i32 } %409, 1
  %412 = extractvalue { i32, i32, i32, i32 } %409, 2
  %413 = extractvalue { i32, i32, i32, i32 } %409, 3
  %414 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %173) #9
  %415 = extractvalue { i32, i32, i32, i32 } %414, 0
  %416 = extractvalue { i32, i32, i32, i32 } %414, 1
  %417 = extractvalue { i32, i32, i32, i32 } %414, 2
  %418 = extractvalue { i32, i32, i32, i32 } %414, 3
  %419 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %181) #9
  %420 = extractvalue { i32, i32, i32, i32 } %419, 0
  %421 = extractvalue { i32, i32, i32, i32 } %419, 1
  %422 = extractvalue { i32, i32, i32, i32 } %419, 2
  %423 = extractvalue { i32, i32, i32, i32 } %419, 3
  %424 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %187) #9
  %425 = extractvalue { i32, i32, i32, i32 } %424, 0
  %426 = extractvalue { i32, i32, i32, i32 } %424, 1
  %427 = extractvalue { i32, i32, i32, i32 } %424, 2
  %428 = extractvalue { i32, i32, i32, i32 } %424, 3
  %429 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %196) #9
  %430 = extractvalue { i32, i32, i32, i32 } %429, 0
  %431 = extractvalue { i32, i32, i32, i32 } %429, 1
  %432 = extractvalue { i32, i32, i32, i32 } %429, 2
  %433 = extractvalue { i32, i32, i32, i32 } %429, 3
  %434 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %204) #9
  %435 = extractvalue { i32, i32, i32, i32 } %434, 0
  %436 = extractvalue { i32, i32, i32, i32 } %434, 1
  %437 = extractvalue { i32, i32, i32, i32 } %434, 2
  %438 = extractvalue { i32, i32, i32, i32 } %434, 3
  %439 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %212) #9
  %440 = extractvalue { i32, i32, i32, i32 } %439, 0
  %441 = extractvalue { i32, i32, i32, i32 } %439, 1
  %442 = extractvalue { i32, i32, i32, i32 } %439, 2
  %443 = extractvalue { i32, i32, i32, i32 } %439, 3
  %444 = extractvalue { float, float, float, float, float, float, float, float } %251, 0
  %445 = extractvalue { float, float, float, float, float, float, float, float } %251, 1
  %446 = extractvalue { float, float, float, float, float, float, float, float } %251, 2
  %447 = extractvalue { float, float, float, float, float, float, float, float } %251, 3
  %448 = extractvalue { float, float, float, float, float, float, float, float } %251, 4
  %449 = extractvalue { float, float, float, float, float, float, float, float } %251, 5
  %450 = extractvalue { float, float, float, float, float, float, float, float } %251, 6
  %451 = extractvalue { float, float, float, float, float, float, float, float } %251, 7
  %452 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %444, float %445, float %446, float %447, i32 %365, i32 %366, i32 %367, i32 %368, i32 0, i32 0) #9
  %453 = extractvalue { float, float, float, float } %452, 0
  %454 = extractvalue { float, float, float, float } %452, 1
  %455 = extractvalue { float, float, float, float } %452, 2
  %456 = extractvalue { float, float, float, float } %452, 3
  %457 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %448, float %449, float %450, float %451, i32 %365, i32 %366, i32 %367, i32 %368, i32 0, i32 0) #9
  %458 = extractvalue { float, float, float, float } %457, 0
  %459 = extractvalue { float, float, float, float } %457, 1
  %460 = extractvalue { float, float, float, float } %457, 2
  %461 = extractvalue { float, float, float, float } %457, 3
  %462 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %453, float %454, float %455, float %456, i32 %370, i32 %371, i32 %372, i32 %373, i32 0, i32 0) #9
  %463 = extractvalue { float, float, float, float } %462, 0
  %464 = extractvalue { float, float, float, float } %462, 1
  %465 = extractvalue { float, float, float, float } %462, 2
  %466 = extractvalue { float, float, float, float } %462, 3
  %467 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %458, float %459, float %460, float %461, i32 %370, i32 %371, i32 %372, i32 %373, i32 0, i32 0) #9
  %468 = extractvalue { float, float, float, float } %467, 0
  %469 = extractvalue { float, float, float, float } %467, 1
  %470 = extractvalue { float, float, float, float } %467, 2
  %471 = extractvalue { float, float, float, float } %467, 3
  %472 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %463, float %464, float %465, float %466, i32 %375, i32 %376, i32 %377, i32 %378, i32 0, i32 0) #9
  %473 = extractvalue { float, float, float, float } %472, 0
  %474 = extractvalue { float, float, float, float } %472, 1
  %475 = extractvalue { float, float, float, float } %472, 2
  %476 = extractvalue { float, float, float, float } %472, 3
  %477 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %468, float %469, float %470, float %471, i32 %375, i32 %376, i32 %377, i32 %378, i32 0, i32 0) #9
  %478 = extractvalue { float, float, float, float } %477, 0
  %479 = extractvalue { float, float, float, float } %477, 1
  %480 = extractvalue { float, float, float, float } %477, 2
  %481 = extractvalue { float, float, float, float } %477, 3
  %482 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %473, float %474, float %475, float %476, i32 %380, i32 %381, i32 %382, i32 %383, i32 0, i32 0) #9
  %483 = extractvalue { float, float, float, float } %482, 0
  %484 = extractvalue { float, float, float, float } %482, 1
  %485 = extractvalue { float, float, float, float } %482, 2
  %486 = extractvalue { float, float, float, float } %482, 3
  %487 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %478, float %479, float %480, float %481, i32 %380, i32 %381, i32 %382, i32 %383, i32 0, i32 0) #9
  %488 = extractvalue { float, float, float, float } %487, 0
  %489 = extractvalue { float, float, float, float } %487, 1
  %490 = extractvalue { float, float, float, float } %487, 2
  %491 = extractvalue { float, float, float, float } %487, 3
  %492 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %483, float %484, float %485, float %486, i32 %385, i32 %386, i32 %387, i32 %388, i32 0, i32 0) #9
  %493 = extractvalue { float, float, float, float } %492, 0
  %494 = extractvalue { float, float, float, float } %492, 1
  %495 = extractvalue { float, float, float, float } %492, 2
  %496 = extractvalue { float, float, float, float } %492, 3
  %497 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %488, float %489, float %490, float %491, i32 %385, i32 %386, i32 %387, i32 %388, i32 0, i32 0) #9
  %498 = extractvalue { float, float, float, float } %497, 0
  %499 = extractvalue { float, float, float, float } %497, 1
  %500 = extractvalue { float, float, float, float } %497, 2
  %501 = extractvalue { float, float, float, float } %497, 3
  %502 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %493, float %494, float %495, float %496, i32 %390, i32 %391, i32 %392, i32 %393, i32 0, i32 0) #9
  %503 = extractvalue { float, float, float, float } %502, 0
  %504 = extractvalue { float, float, float, float } %502, 1
  %505 = extractvalue { float, float, float, float } %502, 2
  %506 = extractvalue { float, float, float, float } %502, 3
  %507 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %498, float %499, float %500, float %501, i32 %390, i32 %391, i32 %392, i32 %393, i32 0, i32 0) #9
  %508 = extractvalue { float, float, float, float } %507, 0
  %509 = extractvalue { float, float, float, float } %507, 1
  %510 = extractvalue { float, float, float, float } %507, 2
  %511 = extractvalue { float, float, float, float } %507, 3
  %512 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %503, float %504, float %505, float %506, i32 %395, i32 %396, i32 %397, i32 %398, i32 0, i32 0) #9
  %513 = extractvalue { float, float, float, float } %512, 0
  %514 = extractvalue { float, float, float, float } %512, 1
  %515 = extractvalue { float, float, float, float } %512, 2
  %516 = extractvalue { float, float, float, float } %512, 3
  %517 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %508, float %509, float %510, float %511, i32 %395, i32 %396, i32 %397, i32 %398, i32 0, i32 0) #9
  %518 = extractvalue { float, float, float, float } %517, 0
  %519 = extractvalue { float, float, float, float } %517, 1
  %520 = extractvalue { float, float, float, float } %517, 2
  %521 = extractvalue { float, float, float, float } %517, 3
  %522 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %513, float %514, float %515, float %516, i32 %400, i32 %401, i32 %402, i32 %403, i32 0, i32 0) #9
  %523 = extractvalue { float, float, float, float } %522, 0
  %524 = extractvalue { float, float, float, float } %522, 1
  %525 = extractvalue { float, float, float, float } %522, 2
  %526 = extractvalue { float, float, float, float } %522, 3
  %527 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %518, float %519, float %520, float %521, i32 %400, i32 %401, i32 %402, i32 %403, i32 0, i32 0) #9
  %528 = extractvalue { float, float, float, float } %527, 0
  %529 = extractvalue { float, float, float, float } %527, 1
  %530 = extractvalue { float, float, float, float } %527, 2
  %531 = extractvalue { float, float, float, float } %527, 3
  %532 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %523, float %524, float %525, float %526, i32 %405, i32 %406, i32 %407, i32 %408, i32 0, i32 0) #9
  %533 = extractvalue { float, float, float, float } %532, 0
  %534 = extractvalue { float, float, float, float } %532, 1
  %535 = extractvalue { float, float, float, float } %532, 2
  %536 = extractvalue { float, float, float, float } %532, 3
  %537 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %528, float %529, float %530, float %531, i32 %405, i32 %406, i32 %407, i32 %408, i32 0, i32 0) #9
  %538 = extractvalue { float, float, float, float } %537, 0
  %539 = extractvalue { float, float, float, float } %537, 1
  %540 = extractvalue { float, float, float, float } %537, 2
  %541 = extractvalue { float, float, float, float } %537, 3
  %542 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %533, float %534, float %535, float %536, i32 %410, i32 %411, i32 %412, i32 %413, i32 0, i32 0) #9
  %543 = extractvalue { float, float, float, float } %542, 0
  %544 = extractvalue { float, float, float, float } %542, 1
  %545 = extractvalue { float, float, float, float } %542, 2
  %546 = extractvalue { float, float, float, float } %542, 3
  %547 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %538, float %539, float %540, float %541, i32 %410, i32 %411, i32 %412, i32 %413, i32 0, i32 0) #9
  %548 = extractvalue { float, float, float, float } %547, 0
  %549 = extractvalue { float, float, float, float } %547, 1
  %550 = extractvalue { float, float, float, float } %547, 2
  %551 = extractvalue { float, float, float, float } %547, 3
  %552 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %543, float %544, float %545, float %546, i32 %415, i32 %416, i32 %417, i32 %418, i32 0, i32 0) #9
  %553 = extractvalue { float, float, float, float } %552, 0
  %554 = extractvalue { float, float, float, float } %552, 1
  %555 = extractvalue { float, float, float, float } %552, 2
  %556 = extractvalue { float, float, float, float } %552, 3
  %557 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %548, float %549, float %550, float %551, i32 %415, i32 %416, i32 %417, i32 %418, i32 0, i32 0) #9
  %558 = extractvalue { float, float, float, float } %557, 0
  %559 = extractvalue { float, float, float, float } %557, 1
  %560 = extractvalue { float, float, float, float } %557, 2
  %561 = extractvalue { float, float, float, float } %557, 3
  %562 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %553, float %554, float %555, float %556, i32 %420, i32 %421, i32 %422, i32 %423, i32 0, i32 0) #9
  %563 = extractvalue { float, float, float, float } %562, 0
  %564 = extractvalue { float, float, float, float } %562, 1
  %565 = extractvalue { float, float, float, float } %562, 2
  %566 = extractvalue { float, float, float, float } %562, 3
  %567 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %558, float %559, float %560, float %561, i32 %420, i32 %421, i32 %422, i32 %423, i32 0, i32 0) #9
  %568 = extractvalue { float, float, float, float } %567, 0
  %569 = extractvalue { float, float, float, float } %567, 1
  %570 = extractvalue { float, float, float, float } %567, 2
  %571 = extractvalue { float, float, float, float } %567, 3
  %572 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %563, float %564, float %565, float %566, i32 %425, i32 %426, i32 %427, i32 %428, i32 0, i32 0) #9
  %573 = extractvalue { float, float, float, float } %572, 0
  %574 = extractvalue { float, float, float, float } %572, 1
  %575 = extractvalue { float, float, float, float } %572, 2
  %576 = extractvalue { float, float, float, float } %572, 3
  %577 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %568, float %569, float %570, float %571, i32 %425, i32 %426, i32 %427, i32 %428, i32 0, i32 0) #9
  %578 = extractvalue { float, float, float, float } %577, 0
  %579 = extractvalue { float, float, float, float } %577, 1
  %580 = extractvalue { float, float, float, float } %577, 2
  %581 = extractvalue { float, float, float, float } %577, 3
  %582 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %573, float %574, float %575, float %576, i32 %430, i32 %431, i32 %432, i32 %433, i32 0, i32 0) #9
  %583 = extractvalue { float, float, float, float } %582, 0
  %584 = extractvalue { float, float, float, float } %582, 1
  %585 = extractvalue { float, float, float, float } %582, 2
  %586 = extractvalue { float, float, float, float } %582, 3
  %587 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %578, float %579, float %580, float %581, i32 %430, i32 %431, i32 %432, i32 %433, i32 0, i32 0) #9
  %588 = extractvalue { float, float, float, float } %587, 0
  %589 = extractvalue { float, float, float, float } %587, 1
  %590 = extractvalue { float, float, float, float } %587, 2
  %591 = extractvalue { float, float, float, float } %587, 3
  %592 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %583, float %584, float %585, float %586, i32 %435, i32 %436, i32 %437, i32 %438, i32 0, i32 0) #9
  %593 = extractvalue { float, float, float, float } %592, 0
  %594 = extractvalue { float, float, float, float } %592, 1
  %595 = extractvalue { float, float, float, float } %592, 2
  %596 = extractvalue { float, float, float, float } %592, 3
  %597 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %588, float %589, float %590, float %591, i32 %435, i32 %436, i32 %437, i32 %438, i32 0, i32 0) #9
  %598 = extractvalue { float, float, float, float } %597, 0
  %599 = extractvalue { float, float, float, float } %597, 1
  %600 = extractvalue { float, float, float, float } %597, 2
  %601 = extractvalue { float, float, float, float } %597, 3
  %602 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %593, float %594, float %595, float %596, i32 %440, i32 %441, i32 %442, i32 %443, i32 0, i32 0) #9
  %603 = extractvalue { float, float, float, float } %602, 0
  %604 = extractvalue { float, float, float, float } %602, 1
  %605 = extractvalue { float, float, float, float } %602, 2
  %606 = extractvalue { float, float, float, float } %602, 3
  %607 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %598, float %599, float %600, float %601, i32 %440, i32 %441, i32 %442, i32 %443, i32 0, i32 0) #9
  %608 = extractvalue { float, float, float, float } %607, 0
  %609 = extractvalue { float, float, float, float } %607, 1
  %610 = extractvalue { float, float, float, float } %607, 2
  %611 = extractvalue { float, float, float, float } %607, 3
  %612 = insertvalue { float, float, float, float, float, float, float, float } undef, float %603, 0
  %613 = insertvalue { float, float, float, float, float, float, float, float } %612, float %604, 1
  %614 = insertvalue { float, float, float, float, float, float, float, float } %613, float %605, 2
  %615 = insertvalue { float, float, float, float, float, float, float, float } %614, float %606, 3
  %616 = insertvalue { float, float, float, float, float, float, float, float } %615, float %608, 4
  %617 = insertvalue { float, float, float, float, float, float, float, float } %616, float %609, 5
  %618 = insertvalue { float, float, float, float, float, float, float, float } %617, float %610, 6
  %619 = insertvalue { float, float, float, float, float, float, float, float } %618, float %611, 7
  %lsr.iv.next = add nsw i32 %lsr.iv, 256
  %scevgep71 = getelementptr i8, ptr addrspace(1) %lsr.iv70, i64 512
  %scevgep75 = getelementptr i8, ptr addrspace(1) %lsr.iv74, i64 512
  %scevgep79 = getelementptr i8, ptr addrspace(1) %lsr.iv78, i64 512
  %scevgep83 = getelementptr i8, ptr addrspace(1) %lsr.iv82, i64 512
  %scevgep87 = getelementptr i8, ptr addrspace(1) %lsr.iv86, i64 512
  %scevgep91 = getelementptr i8, ptr addrspace(1) %lsr.iv90, i64 512
  %scevgep95 = getelementptr i8, ptr addrspace(1) %lsr.iv94, i64 512
  %scevgep99 = getelementptr i8, ptr addrspace(1) %lsr.iv98, i64 512
  %620 = icmp samesign ult i32 %lsr.iv.next, 1792
  br i1 %620, label %250, label %621

621:                                              ; preds = %250
  %622 = icmp ult i32 %13, 64
  %623 = mul i32 %2, 8
  %.decomposed = sub i32 %.frozen, %623
  %624 = sdiv i32 %.decomposed, %5
  %625 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %603) #9
  %626 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %604) #9
  %627 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %605) #9
  %628 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %606) #9
  %629 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %608) #9
  %630 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %609) #9
  %631 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %610) #9
  %632 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %611) #9
  %633 = shl nsw i32 %624, 5
  %634 = sext i32 %8 to i64
  %635 = sext i32 %633 to i64
  %636 = lshr exact i32 %29, 2
  %637 = select i1 %622, i32 0, i32 16
  %638 = lshr i32 %13, 2
  %639 = and i32 %638, 11
  %640 = or disjoint i32 %639, %636
  %641 = or disjoint i32 %640, %637
  %642 = zext nneg i32 %22 to i64
  %643 = zext nneg i32 %641 to i64
  %644 = or disjoint i64 %634, %642
  %645 = or disjoint i64 %635, %643
  %646 = getelementptr bfloat, ptr addrspace(1) %arg268, i64 %644
  %.idx = shl nsw i64 %645, 12
  %647 = getelementptr i8, ptr addrspace(1) %646, i64 %.idx
  tail call void @llvm.nvvm.barrier0()
  %648 = shl nuw nsw i32 %13, 6
  %649 = and i32 %648, 192
  %650 = shl nuw nsw i32 %14, 3
  %651 = and i32 %638, 3
  %652 = or disjoint i32 %651, %649
  %653 = or disjoint i32 %652, %636
  %654 = or disjoint i32 %653, %650
  %655 = or disjoint i32 %654, %637
  %656 = select i1 %622, i32 0, i32 512
  %657 = or disjoint i32 %650, %656
  %658 = or disjoint i32 %657, %31
  %659 = lshr i32 %654, 2
  %660 = and i32 %659, 112
  %661 = add nuw nsw i32 %660, %655
  %662 = zext nneg i32 %661 to i64
  %663 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %662
  %664 = bitcast bfloat %625 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %663, <1 x i16> %664, i1 true) #9
  %665 = or disjoint i32 %655, 32
  %666 = lshr i32 %665, 2
  %667 = and i32 %666, 1073741816
  %668 = zext nneg i32 %667 to i64
  %669 = zext nneg i32 %655 to i64
  %670 = add i64 %668, %669
  %671 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %670
  %672 = getelementptr inbounds i8, ptr addrspace(3) %671, i64 64
  %673 = bitcast bfloat %626 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %672, <1 x i16> %673, i1 true) #9
  %674 = zext nneg i32 %660 to i64
  %675 = add i64 %674, %669
  %676 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %675
  %677 = getelementptr inbounds i8, ptr addrspace(3) %676, i64 16
  %678 = bitcast bfloat %627 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %677, <1 x i16> %678, i1 true) #9
  %679 = or disjoint i32 %655, 40
  %680 = lshr i32 %679, 2
  %681 = and i32 %680, 1073741816
  %682 = zext nneg i32 %681 to i64
  %683 = add i64 %682, %669
  %684 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %683
  %685 = getelementptr inbounds i8, ptr addrspace(3) %684, i64 80
  %686 = bitcast bfloat %628 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %685, <1 x i16> %686, i1 true) #9
  %687 = or disjoint i32 %655, 512
  %688 = lshr i32 %687, 2
  %689 = and i32 %688, 1073741816
  %690 = zext nneg i32 %689 to i64
  %691 = add i64 %690, %669
  %692 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %691
  %693 = getelementptr inbounds i8, ptr addrspace(3) %692, i64 1024
  %694 = bitcast bfloat %629 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %693, <1 x i16> %694, i1 true) #9
  %695 = or disjoint i32 %655, 544
  %696 = lshr i32 %695, 2
  %697 = and i32 %696, 1073741816
  %698 = zext nneg i32 %697 to i64
  %699 = add i64 %698, %669
  %700 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %699
  %701 = getelementptr inbounds i8, ptr addrspace(3) %700, i64 1088
  %702 = bitcast bfloat %630 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %701, <1 x i16> %702, i1 true) #9
  %703 = or disjoint i32 %655, 520
  %704 = lshr i32 %703, 2
  %705 = and i32 %704, 1073741816
  %706 = zext nneg i32 %705 to i64
  %707 = add i64 %706, %669
  %708 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %707
  %709 = getelementptr inbounds i8, ptr addrspace(3) %708, i64 1040
  %710 = bitcast bfloat %631 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %709, <1 x i16> %710, i1 true) #9
  %711 = or disjoint i32 %655, 552
  %712 = lshr i32 %711, 2
  %713 = and i32 %712, 1073741816
  %714 = zext nneg i32 %713 to i64
  %715 = add i64 %714, %669
  %716 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %715
  %717 = getelementptr inbounds i8, ptr addrspace(3) %716, i64 1104
  %718 = bitcast bfloat %632 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %717, <1 x i16> %718, i1 true) #9
  tail call void @llvm.nvvm.barrier0()
  %719 = lshr exact i32 %658, 2
  %720 = and i32 %719, 1073741816
  %721 = add nuw nsw i32 %720, %658
  %722 = zext nneg i32 %721 to i64
  %723 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %722
  %724 = load <4 x i32>, ptr addrspace(3) %723, align 16
  %.extract101 = extractelement <4 x i32> %724, i32 0
  %.extract22102 = extractelement <4 x i32> %724, i32 1
  %.extract24103 = extractelement <4 x i32> %724, i32 2
  %.extract26104 = extractelement <4 x i32> %724, i32 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract101, i32 %.extract22102, i32 %.extract24103, i32 %.extract26104, ptr addrspace(1) %647) #9
  ret void
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #4

define ptx_kernel void @fusion_38(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(65536) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(65536) %arg4) local_unnamed_addr #5 {
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %3 = shl nsw i64 %2, 11
  %4 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %3
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
  %19 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %16) #9
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
  %36 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %18) #9
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
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #9
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #9
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #9
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #9
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #9
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #9
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #9
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %35) #9
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #9
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #9
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #9
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #9
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #9
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #9
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #9
  %68 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %52) #9
  %69 = shl nsw i64 %2, 10
  %70 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %69
  %71 = getelementptr bfloat, ptr addrspace(1) %70, i64 %14
  %72 = getelementptr i8, ptr addrspace(1) %71, i64 1024
  %73 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #9
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
  %90 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %72) #9
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
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #9
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #9
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #9
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #9
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #9
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #9
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #9
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %89) #9
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #9
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #9
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #9
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #9
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #9
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #9
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #9
  %122 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %106) #9
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
  %138 = fadd float %68, %122
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
  %154 = fmul float %138, %138
  %155 = fadd float %139, %140
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
  %169 = fadd float %168, %154
  %170 = bitcast float %169 to i32
  %171 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %170, i32 16, i32 31)
  %172 = bitcast i32 %171 to float
  %173 = fadd float %169, %172
  %174 = bitcast float %173 to i32
  %175 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %174, i32 8, i32 31)
  %176 = bitcast i32 %175 to float
  %177 = fadd float %173, %176
  %178 = bitcast float %177 to i32
  %179 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %178, i32 4, i32 31)
  %180 = bitcast i32 %179 to float
  %181 = fadd float %177, %180
  %182 = bitcast float %181 to i32
  %183 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %182, i32 2, i32 31)
  %184 = bitcast i32 %183 to float
  %185 = fadd float %181, %184
  %186 = bitcast float %185 to i32
  %187 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %186, i32 1, i32 31)
  %188 = bitcast i32 %187 to float
  %189 = fadd float %185, %188
  %190 = icmp eq i32 %7, 0
  %191 = zext nneg i32 %8 to i64
  %192 = getelementptr float, ptr addrspace(3) @global_smem, i64 %191
  %193 = bitcast float %189 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %192, <1 x i32> %193, i1 %190) #9
  tail call void @llvm.nvvm.barrier0()
  %194 = icmp samesign ult i32 %6, 2
  %195 = zext nneg i32 %6 to i64
  %196 = getelementptr float, ptr addrspace(3) @global_smem, i64 %195
  %197 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %196, i1 %194) #9
  %198 = bitcast i32 %197 to float
  %199 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %197, i32 1, i32 31)
  %200 = bitcast i32 %199 to float
  %201 = fadd float %198, %200
  %202 = icmp eq i32 %6, 0
  %203 = bitcast float %201 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %196, <1 x i32> %203, i1 %202) #9
  tail call void @llvm.nvvm.barrier0()
  %204 = load float, ptr addrspace(3) @global_smem, align 16
  %205 = fmul float %204, 0x3F50000000000000
  %206 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
  %207 = bitcast i32 %206 to float
  %208 = fadd float %205, %207
  %209 = tail call float @llvm.nvvm.rsqrt.approx.f(float %208)
  %210 = fmul float %123, %209
  %211 = fmul float %124, %209
  %212 = fmul float %125, %209
  %213 = fmul float %126, %209
  %214 = fmul float %127, %209
  %215 = fmul float %128, %209
  %216 = fmul float %129, %209
  %217 = fmul float %130, %209
  %218 = fmul float %131, %209
  %219 = fmul float %132, %209
  %220 = fmul float %133, %209
  %221 = fmul float %134, %209
  %222 = fmul float %135, %209
  %223 = fmul float %136, %209
  %224 = fmul float %137, %209
  %225 = fmul float %138, %209
  %226 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %14
  %227 = getelementptr i8, ptr addrspace(1) %226, i64 1024
  %228 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %226) #9
  %229 = extractvalue { i32, i32, i32, i32 } %228, 0
  %230 = bitcast i32 %229 to <2 x bfloat>
  %231 = extractvalue { i32, i32, i32, i32 } %228, 1
  %232 = bitcast i32 %231 to <2 x bfloat>
  %233 = extractvalue { i32, i32, i32, i32 } %228, 2
  %234 = bitcast i32 %233 to <2 x bfloat>
  %235 = extractvalue { i32, i32, i32, i32 } %228, 3
  %236 = bitcast i32 %235 to <2 x bfloat>
  %237 = extractelement <2 x bfloat> %230, i64 0
  %238 = extractelement <2 x bfloat> %230, i64 1
  %239 = extractelement <2 x bfloat> %232, i64 0
  %240 = extractelement <2 x bfloat> %232, i64 1
  %241 = extractelement <2 x bfloat> %234, i64 0
  %242 = extractelement <2 x bfloat> %234, i64 1
  %243 = extractelement <2 x bfloat> %236, i64 0
  %244 = extractelement <2 x bfloat> %236, i64 1
  %245 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %227) #9
  %246 = extractvalue { i32, i32, i32, i32 } %245, 0
  %247 = bitcast i32 %246 to <2 x bfloat>
  %248 = extractvalue { i32, i32, i32, i32 } %245, 1
  %249 = bitcast i32 %248 to <2 x bfloat>
  %250 = extractvalue { i32, i32, i32, i32 } %245, 2
  %251 = bitcast i32 %250 to <2 x bfloat>
  %252 = extractvalue { i32, i32, i32, i32 } %245, 3
  %253 = bitcast i32 %252 to <2 x bfloat>
  %254 = extractelement <2 x bfloat> %247, i64 0
  %255 = extractelement <2 x bfloat> %247, i64 1
  %256 = extractelement <2 x bfloat> %249, i64 0
  %257 = extractelement <2 x bfloat> %249, i64 1
  %258 = extractelement <2 x bfloat> %251, i64 0
  %259 = extractelement <2 x bfloat> %251, i64 1
  %260 = extractelement <2 x bfloat> %253, i64 0
  %261 = extractelement <2 x bfloat> %253, i64 1
  %262 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %237) #9
  %263 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %238) #9
  %264 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %239) #9
  %265 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %240) #9
  %266 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %241) #9
  %267 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242) #9
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #9
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244) #9
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %254) #9
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %255) #9
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %256) #9
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %257) #9
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %258) #9
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259) #9
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #9
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #9
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
  %293 = fmul float %225, %277
  %294 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %278) #9
  %295 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %279) #9
  %296 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %280) #9
  %297 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %281) #9
  %298 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %282) #9
  %299 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %283) #9
  %300 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %284) #9
  %301 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %285) #9
  %302 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %286) #9
  %303 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %287) #9
  %304 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %288) #9
  %305 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %289) #9
  %306 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %290) #9
  %307 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %291) #9
  %308 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %292) #9
  %309 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %293) #9
  %310 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %69
  %311 = getelementptr bfloat, ptr addrspace(1) %310, i64 %14
  %312 = getelementptr i8, ptr addrspace(1) %311, i64 1024
  %313 = insertelement <2 x bfloat> poison, bfloat %294, i64 0
  %314 = insertelement <2 x bfloat> %313, bfloat %295, i64 1
  %315 = bitcast <2 x bfloat> %314 to i32
  %316 = insertelement <2 x bfloat> poison, bfloat %296, i64 0
  %317 = insertelement <2 x bfloat> %316, bfloat %297, i64 1
  %318 = bitcast <2 x bfloat> %317 to i32
  %319 = insertelement <2 x bfloat> poison, bfloat %298, i64 0
  %320 = insertelement <2 x bfloat> %319, bfloat %299, i64 1
  %321 = bitcast <2 x bfloat> %320 to i32
  %322 = insertelement <2 x bfloat> poison, bfloat %300, i64 0
  %323 = insertelement <2 x bfloat> %322, bfloat %301, i64 1
  %324 = bitcast <2 x bfloat> %323 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %315, i32 %318, i32 %321, i32 %324, ptr addrspace(1) %311) #9
  %325 = insertelement <2 x bfloat> poison, bfloat %302, i64 0
  %326 = insertelement <2 x bfloat> %325, bfloat %303, i64 1
  %327 = bitcast <2 x bfloat> %326 to i32
  %328 = insertelement <2 x bfloat> poison, bfloat %304, i64 0
  %329 = insertelement <2 x bfloat> %328, bfloat %305, i64 1
  %330 = bitcast <2 x bfloat> %329 to i32
  %331 = insertelement <2 x bfloat> poison, bfloat %306, i64 0
  %332 = insertelement <2 x bfloat> %331, bfloat %307, i64 1
  %333 = bitcast <2 x bfloat> %332 to i32
  %334 = insertelement <2 x bfloat> poison, bfloat %308, i64 0
  %335 = insertelement <2 x bfloat> %334, bfloat %309, i64 1
  %336 = bitcast <2 x bfloat> %335 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %327, i32 %330, i32 %333, i32 %336, ptr addrspace(1) %312) #9
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_convert_fusion(ptr noalias readonly align 128 captures(none) dereferenceable(393216) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(196608) %1) local_unnamed_addr #0 {
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
  %16 = load bfloat, ptr addrspace(1) %15, align 2, !invariant.load !6, !alias.scope !8
  %17 = fpext bfloat %16 to float
  %18 = fneg bfloat %16
  %19 = fpext bfloat %18 to float
  %20 = fmul float %19, 0x3FF7154760000000
  %21 = tail call float @llvm.nvvm.ex2.approx.f(float %20) #9
  %22 = fptrunc float %21 to bfloat
  %23 = fpext bfloat %22 to float
  %24 = fadd float %23, 1.000000e+00
  %25 = fdiv float 1.000000e+00, %24
  %26 = getelementptr inbounds i8, ptr addrspace(1) %15, i64 6144
  %27 = load bfloat, ptr addrspace(1) %26, align 2, !invariant.load !6, !alias.scope !11
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

define ptx_kernel void @fusion_39(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(131072) %arg3, ptr noalias align 128 dereferenceable(65536) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5) local_unnamed_addr #5 {
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %3 = shl nsw i64 %2, 11
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
  %16 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %14) #9
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
  %33 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #9
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
  %50 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %25) #9
  %51 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %26) #9
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #9
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #9
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #9
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #9
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #9
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #9
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %42) #9
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %43) #9
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #9
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #9
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #9
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #9
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #9
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #9
  %66 = shl nsw i64 %2, 10
  %67 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %66
  %68 = getelementptr bfloat, ptr addrspace(1) %67, i64 %13
  %69 = getelementptr i8, ptr addrspace(1) %68, i64 1024
  %70 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %68) #9
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
  %87 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %69) #9
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
  %104 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %79) #9
  %105 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %80) #9
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #9
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #9
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #9
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #9
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #9
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #9
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %96) #9
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %97) #9
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #9
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #9
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #9
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #9
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #9
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #9
  %120 = getelementptr i8, ptr addrspace(1) %4, i64 2048
  %121 = getelementptr i8, ptr addrspace(1) %14, i64 2048
  %122 = getelementptr bfloat, ptr addrspace(1) %120, i64 %13
  %123 = getelementptr i8, ptr addrspace(1) %122, i64 1024
  %124 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %121) #9
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
  %141 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #9
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
  %158 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %133) #9
  %159 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %134) #9
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #9
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #9
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #9
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #9
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #9
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #9
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %150) #9
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %151) #9
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #9
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #9
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #9
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #9
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #9
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #9
  %174 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %66
  %175 = getelementptr bfloat, ptr addrspace(1) %174, i64 %13
  %176 = getelementptr i8, ptr addrspace(1) %175, i64 1024
  %177 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %175) #9
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
  %194 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %176) #9
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
  %211 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %186) #9
  %212 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %187) #9
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #9
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #9
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #9
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #9
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #9
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #9
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %203) #9
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %204) #9
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #9
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #9
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #9
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #9
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #9
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #9
  %227 = fadd float %158, %211
  %228 = fadd float %159, %212
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
  %243 = fadd float %104, %227
  %244 = fadd float %105, %228
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
  %259 = fadd float %50, %243
  %260 = fadd float %51, %244
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
  %275 = fmul float %259, %259
  %276 = fmul float %260, %260
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
  %291 = fadd float %275, %276
  %292 = fadd float %291, %277
  %293 = fadd float %292, %278
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
  %306 = bitcast float %305 to i32
  %307 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %306, i32 16, i32 31)
  %308 = bitcast i32 %307 to float
  %309 = fadd float %305, %308
  %310 = bitcast float %309 to i32
  %311 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %310, i32 8, i32 31)
  %312 = bitcast i32 %311 to float
  %313 = fadd float %309, %312
  %314 = bitcast float %313 to i32
  %315 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %314, i32 4, i32 31)
  %316 = bitcast i32 %315 to float
  %317 = fadd float %313, %316
  %318 = bitcast float %317 to i32
  %319 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %318, i32 2, i32 31)
  %320 = bitcast i32 %319 to float
  %321 = fadd float %317, %320
  %322 = bitcast float %321 to i32
  %323 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %322, i32 1, i32 31)
  %324 = bitcast i32 %323 to float
  %325 = fadd float %321, %324
  %326 = icmp eq i32 %6, 0
  %327 = zext nneg i32 %7 to i64
  %328 = getelementptr float, ptr addrspace(3) @global_smem, i64 %327
  %329 = bitcast float %325 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %328, <1 x i32> %329, i1 %326) #9
  tail call void @llvm.nvvm.barrier0()
  %330 = icmp samesign ult i32 %5, 2
  %331 = zext nneg i32 %5 to i64
  %332 = getelementptr float, ptr addrspace(3) @global_smem, i64 %331
  %333 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %332, i1 %330) #9
  %334 = bitcast i32 %333 to float
  %335 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %333, i32 1, i32 31)
  %336 = bitcast i32 %335 to float
  %337 = fadd float %334, %336
  %338 = icmp eq i32 %5, 0
  %339 = bitcast float %337 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %332, <1 x i32> %339, i1 %338) #9
  tail call void @llvm.nvvm.barrier0()
  %340 = load float, ptr addrspace(3) @global_smem, align 16
  %341 = fmul float %340, 0x3F50000000000000
  %342 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
  %343 = bitcast i32 %342 to float
  %344 = fadd float %341, %343
  %345 = tail call float @llvm.nvvm.rsqrt.approx.f(float %344)
  %346 = fmul float %259, %345
  %347 = fmul float %260, %345
  %348 = fmul float %261, %345
  %349 = fmul float %262, %345
  %350 = fmul float %263, %345
  %351 = fmul float %264, %345
  %352 = fmul float %265, %345
  %353 = fmul float %266, %345
  %354 = fmul float %267, %345
  %355 = fmul float %268, %345
  %356 = fmul float %269, %345
  %357 = fmul float %270, %345
  %358 = fmul float %271, %345
  %359 = fmul float %272, %345
  %360 = fmul float %273, %345
  %361 = fmul float %274, %345
  %362 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %13
  %363 = getelementptr i8, ptr addrspace(1) %362, i64 1024
  %364 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %362) #9
  %365 = extractvalue { i32, i32, i32, i32 } %364, 0
  %366 = bitcast i32 %365 to <2 x bfloat>
  %367 = extractvalue { i32, i32, i32, i32 } %364, 1
  %368 = bitcast i32 %367 to <2 x bfloat>
  %369 = extractvalue { i32, i32, i32, i32 } %364, 2
  %370 = bitcast i32 %369 to <2 x bfloat>
  %371 = extractvalue { i32, i32, i32, i32 } %364, 3
  %372 = bitcast i32 %371 to <2 x bfloat>
  %373 = extractelement <2 x bfloat> %366, i64 0
  %374 = extractelement <2 x bfloat> %366, i64 1
  %375 = extractelement <2 x bfloat> %368, i64 0
  %376 = extractelement <2 x bfloat> %368, i64 1
  %377 = extractelement <2 x bfloat> %370, i64 0
  %378 = extractelement <2 x bfloat> %370, i64 1
  %379 = extractelement <2 x bfloat> %372, i64 0
  %380 = extractelement <2 x bfloat> %372, i64 1
  %381 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %363) #9
  %382 = extractvalue { i32, i32, i32, i32 } %381, 0
  %383 = bitcast i32 %382 to <2 x bfloat>
  %384 = extractvalue { i32, i32, i32, i32 } %381, 1
  %385 = bitcast i32 %384 to <2 x bfloat>
  %386 = extractvalue { i32, i32, i32, i32 } %381, 2
  %387 = bitcast i32 %386 to <2 x bfloat>
  %388 = extractvalue { i32, i32, i32, i32 } %381, 3
  %389 = bitcast i32 %388 to <2 x bfloat>
  %390 = extractelement <2 x bfloat> %383, i64 0
  %391 = extractelement <2 x bfloat> %383, i64 1
  %392 = extractelement <2 x bfloat> %385, i64 0
  %393 = extractelement <2 x bfloat> %385, i64 1
  %394 = extractelement <2 x bfloat> %387, i64 0
  %395 = extractelement <2 x bfloat> %387, i64 1
  %396 = extractelement <2 x bfloat> %389, i64 0
  %397 = extractelement <2 x bfloat> %389, i64 1
  %398 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %373) #9
  %399 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %374) #9
  %400 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %375) #9
  %401 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %376) #9
  %402 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %377) #9
  %403 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %378) #9
  %404 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %379) #9
  %405 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %380) #9
  %406 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %390) #9
  %407 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %391) #9
  %408 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %392) #9
  %409 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %393) #9
  %410 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %394) #9
  %411 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %395) #9
  %412 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %396) #9
  %413 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %397) #9
  %414 = fmul float %346, %398
  %415 = fmul float %347, %399
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
  %430 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %414) #9
  %431 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %415) #9
  %432 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %416) #9
  %433 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %417) #9
  %434 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %418) #9
  %435 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %419) #9
  %436 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %420) #9
  %437 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %421) #9
  %438 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %422) #9
  %439 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %423) #9
  %440 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %424) #9
  %441 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %425) #9
  %442 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %426) #9
  %443 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %427) #9
  %444 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %428) #9
  %445 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %429) #9
  %446 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %66
  %447 = getelementptr bfloat, ptr addrspace(1) %446, i64 %13
  %448 = getelementptr i8, ptr addrspace(1) %447, i64 1024
  %449 = insertelement <2 x bfloat> poison, bfloat %430, i64 0
  %450 = insertelement <2 x bfloat> %449, bfloat %431, i64 1
  %451 = bitcast <2 x bfloat> %450 to i32
  %452 = insertelement <2 x bfloat> poison, bfloat %432, i64 0
  %453 = insertelement <2 x bfloat> %452, bfloat %433, i64 1
  %454 = bitcast <2 x bfloat> %453 to i32
  %455 = insertelement <2 x bfloat> poison, bfloat %434, i64 0
  %456 = insertelement <2 x bfloat> %455, bfloat %435, i64 1
  %457 = bitcast <2 x bfloat> %456 to i32
  %458 = insertelement <2 x bfloat> poison, bfloat %436, i64 0
  %459 = insertelement <2 x bfloat> %458, bfloat %437, i64 1
  %460 = bitcast <2 x bfloat> %459 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %451, i32 %454, i32 %457, i32 %460, ptr addrspace(1) %447) #9
  %461 = insertelement <2 x bfloat> poison, bfloat %438, i64 0
  %462 = insertelement <2 x bfloat> %461, bfloat %439, i64 1
  %463 = bitcast <2 x bfloat> %462 to i32
  %464 = insertelement <2 x bfloat> poison, bfloat %440, i64 0
  %465 = insertelement <2 x bfloat> %464, bfloat %441, i64 1
  %466 = bitcast <2 x bfloat> %465 to i32
  %467 = insertelement <2 x bfloat> poison, bfloat %442, i64 0
  %468 = insertelement <2 x bfloat> %467, bfloat %443, i64 1
  %469 = bitcast <2 x bfloat> %468 to i32
  %470 = insertelement <2 x bfloat> poison, bfloat %444, i64 0
  %471 = insertelement <2 x bfloat> %470, bfloat %445, i64 1
  %472 = bitcast <2 x bfloat> %471 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %463, i32 %466, i32 %469, i32 %472, ptr addrspace(1) %448) #9
  ret void
}

define ptx_kernel void @fusion_40(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(65536) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(65536) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5, ptr noalias align 128 dereferenceable(65536) %arg6) local_unnamed_addr #5 {
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
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
  %16 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %14) #9
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
  %33 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #9
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
  %50 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %25) #9
  %51 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %26) #9
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #9
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #9
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #9
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #9
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #9
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #9
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %42) #9
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %43) #9
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #9
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #9
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #9
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #9
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #9
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #9
  %66 = shl nsw i64 %2, 11
  %67 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %66
  %68 = getelementptr bfloat, ptr addrspace(1) %67, i64 %13
  %69 = getelementptr i8, ptr addrspace(1) %68, i64 1024
  %70 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %68) #9
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
  %87 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %69) #9
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
  %104 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %79) #9
  %105 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %80) #9
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #9
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #9
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #9
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #9
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #9
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #9
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %96) #9
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %97) #9
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #9
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #9
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #9
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #9
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #9
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #9
  %120 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %3
  %121 = getelementptr bfloat, ptr addrspace(1) %120, i64 %13
  %122 = getelementptr i8, ptr addrspace(1) %121, i64 1024
  %123 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %121) #9
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
  %140 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %122) #9
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
  %157 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %132) #9
  %158 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %133) #9
  %159 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %134) #9
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #9
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #9
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #9
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #9
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #9
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %149) #9
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %150) #9
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %151) #9
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #9
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #9
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #9
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #9
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #9
  %173 = getelementptr i8, ptr addrspace(1) %67, i64 2048
  %174 = getelementptr i8, ptr addrspace(1) %68, i64 2048
  %175 = getelementptr bfloat, ptr addrspace(1) %173, i64 %13
  %176 = getelementptr i8, ptr addrspace(1) %175, i64 1024
  %177 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %174) #9
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
  %194 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %176) #9
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
  %211 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %186) #9
  %212 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %187) #9
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #9
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #9
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #9
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #9
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #9
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #9
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %203) #9
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %204) #9
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #9
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #9
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #9
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #9
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #9
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #9
  %227 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %3
  %228 = getelementptr bfloat, ptr addrspace(1) %227, i64 %13
  %229 = getelementptr i8, ptr addrspace(1) %228, i64 1024
  %230 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %228) #9
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
  %247 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %229) #9
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
  %264 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %239) #9
  %265 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %240) #9
  %266 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %241) #9
  %267 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242) #9
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #9
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244) #9
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245) #9
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246) #9
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %256) #9
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %257) #9
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %258) #9
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259) #9
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #9
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #9
  %278 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262) #9
  %279 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %263) #9
  %280 = fadd float %211, %264
  %281 = fadd float %212, %265
  %282 = fadd float %213, %266
  %283 = fadd float %214, %267
  %284 = fadd float %215, %268
  %285 = fadd float %216, %269
  %286 = fadd float %217, %270
  %287 = fadd float %218, %271
  %288 = fadd float %219, %272
  %289 = fadd float %220, %273
  %290 = fadd float %221, %274
  %291 = fadd float %222, %275
  %292 = fadd float %223, %276
  %293 = fadd float %224, %277
  %294 = fadd float %225, %278
  %295 = fadd float %226, %279
  %296 = fadd float %157, %280
  %297 = fadd float %158, %281
  %298 = fadd float %159, %282
  %299 = fadd float %160, %283
  %300 = fadd float %161, %284
  %301 = fadd float %162, %285
  %302 = fadd float %163, %286
  %303 = fadd float %164, %287
  %304 = fadd float %165, %288
  %305 = fadd float %166, %289
  %306 = fadd float %167, %290
  %307 = fadd float %168, %291
  %308 = fadd float %169, %292
  %309 = fadd float %170, %293
  %310 = fadd float %171, %294
  %311 = fadd float %172, %295
  %312 = fadd float %104, %296
  %313 = fadd float %105, %297
  %314 = fadd float %106, %298
  %315 = fadd float %107, %299
  %316 = fadd float %108, %300
  %317 = fadd float %109, %301
  %318 = fadd float %110, %302
  %319 = fadd float %111, %303
  %320 = fadd float %112, %304
  %321 = fadd float %113, %305
  %322 = fadd float %114, %306
  %323 = fadd float %115, %307
  %324 = fadd float %116, %308
  %325 = fadd float %117, %309
  %326 = fadd float %118, %310
  %327 = fadd float %119, %311
  %328 = fadd float %50, %312
  %329 = fadd float %51, %313
  %330 = fadd float %52, %314
  %331 = fadd float %53, %315
  %332 = fadd float %54, %316
  %333 = fadd float %55, %317
  %334 = fadd float %56, %318
  %335 = fadd float %57, %319
  %336 = fadd float %58, %320
  %337 = fadd float %59, %321
  %338 = fadd float %60, %322
  %339 = fadd float %61, %323
  %340 = fadd float %62, %324
  %341 = fadd float %63, %325
  %342 = fadd float %64, %326
  %343 = fadd float %65, %327
  %344 = fmul float %328, %328
  %345 = fmul float %329, %329
  %346 = fmul float %330, %330
  %347 = fmul float %331, %331
  %348 = fmul float %332, %332
  %349 = fmul float %333, %333
  %350 = fmul float %334, %334
  %351 = fmul float %335, %335
  %352 = fmul float %336, %336
  %353 = fmul float %337, %337
  %354 = fmul float %338, %338
  %355 = fmul float %339, %339
  %356 = fmul float %340, %340
  %357 = fmul float %341, %341
  %358 = fmul float %342, %342
  %359 = fmul float %343, %343
  %360 = fadd float %344, %345
  %361 = fadd float %360, %346
  %362 = fadd float %361, %347
  %363 = fadd float %362, %348
  %364 = fadd float %363, %349
  %365 = fadd float %364, %350
  %366 = fadd float %365, %351
  %367 = fadd float %366, %352
  %368 = fadd float %367, %353
  %369 = fadd float %368, %354
  %370 = fadd float %369, %355
  %371 = fadd float %370, %356
  %372 = fadd float %371, %357
  %373 = fadd float %372, %358
  %374 = fadd float %373, %359
  %375 = bitcast float %374 to i32
  %376 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %375, i32 16, i32 31)
  %377 = bitcast i32 %376 to float
  %378 = fadd float %374, %377
  %379 = bitcast float %378 to i32
  %380 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %379, i32 8, i32 31)
  %381 = bitcast i32 %380 to float
  %382 = fadd float %378, %381
  %383 = bitcast float %382 to i32
  %384 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %383, i32 4, i32 31)
  %385 = bitcast i32 %384 to float
  %386 = fadd float %382, %385
  %387 = bitcast float %386 to i32
  %388 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %387, i32 2, i32 31)
  %389 = bitcast i32 %388 to float
  %390 = fadd float %386, %389
  %391 = bitcast float %390 to i32
  %392 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %391, i32 1, i32 31)
  %393 = bitcast i32 %392 to float
  %394 = fadd float %390, %393
  %395 = icmp eq i32 %6, 0
  %396 = zext nneg i32 %7 to i64
  %397 = getelementptr float, ptr addrspace(3) @global_smem, i64 %396
  %398 = bitcast float %394 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %397, <1 x i32> %398, i1 %395) #9
  tail call void @llvm.nvvm.barrier0()
  %399 = icmp samesign ult i32 %5, 2
  %400 = zext nneg i32 %5 to i64
  %401 = getelementptr float, ptr addrspace(3) @global_smem, i64 %400
  %402 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %401, i1 %399) #9
  %403 = bitcast i32 %402 to float
  %404 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %402, i32 1, i32 31)
  %405 = bitcast i32 %404 to float
  %406 = fadd float %403, %405
  %407 = icmp eq i32 %5, 0
  %408 = bitcast float %406 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %401, <1 x i32> %408, i1 %407) #9
  tail call void @llvm.nvvm.barrier0()
  %409 = load float, ptr addrspace(3) @global_smem, align 16
  %410 = fmul float %409, 0x3F50000000000000
  %411 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
  %412 = bitcast i32 %411 to float
  %413 = fadd float %410, %412
  %414 = tail call float @llvm.nvvm.rsqrt.approx.f(float %413)
  %415 = fmul float %328, %414
  %416 = fmul float %329, %414
  %417 = fmul float %330, %414
  %418 = fmul float %331, %414
  %419 = fmul float %332, %414
  %420 = fmul float %333, %414
  %421 = fmul float %334, %414
  %422 = fmul float %335, %414
  %423 = fmul float %336, %414
  %424 = fmul float %337, %414
  %425 = fmul float %338, %414
  %426 = fmul float %339, %414
  %427 = fmul float %340, %414
  %428 = fmul float %341, %414
  %429 = fmul float %342, %414
  %430 = fmul float %343, %414
  %431 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %13
  %432 = getelementptr i8, ptr addrspace(1) %431, i64 1024
  %433 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %431) #9
  %434 = extractvalue { i32, i32, i32, i32 } %433, 0
  %435 = bitcast i32 %434 to <2 x bfloat>
  %436 = extractvalue { i32, i32, i32, i32 } %433, 1
  %437 = bitcast i32 %436 to <2 x bfloat>
  %438 = extractvalue { i32, i32, i32, i32 } %433, 2
  %439 = bitcast i32 %438 to <2 x bfloat>
  %440 = extractvalue { i32, i32, i32, i32 } %433, 3
  %441 = bitcast i32 %440 to <2 x bfloat>
  %442 = extractelement <2 x bfloat> %435, i64 0
  %443 = extractelement <2 x bfloat> %435, i64 1
  %444 = extractelement <2 x bfloat> %437, i64 0
  %445 = extractelement <2 x bfloat> %437, i64 1
  %446 = extractelement <2 x bfloat> %439, i64 0
  %447 = extractelement <2 x bfloat> %439, i64 1
  %448 = extractelement <2 x bfloat> %441, i64 0
  %449 = extractelement <2 x bfloat> %441, i64 1
  %450 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %432) #9
  %451 = extractvalue { i32, i32, i32, i32 } %450, 0
  %452 = bitcast i32 %451 to <2 x bfloat>
  %453 = extractvalue { i32, i32, i32, i32 } %450, 1
  %454 = bitcast i32 %453 to <2 x bfloat>
  %455 = extractvalue { i32, i32, i32, i32 } %450, 2
  %456 = bitcast i32 %455 to <2 x bfloat>
  %457 = extractvalue { i32, i32, i32, i32 } %450, 3
  %458 = bitcast i32 %457 to <2 x bfloat>
  %459 = extractelement <2 x bfloat> %452, i64 0
  %460 = extractelement <2 x bfloat> %452, i64 1
  %461 = extractelement <2 x bfloat> %454, i64 0
  %462 = extractelement <2 x bfloat> %454, i64 1
  %463 = extractelement <2 x bfloat> %456, i64 0
  %464 = extractelement <2 x bfloat> %456, i64 1
  %465 = extractelement <2 x bfloat> %458, i64 0
  %466 = extractelement <2 x bfloat> %458, i64 1
  %467 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %442) #9
  %468 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %443) #9
  %469 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %444) #9
  %470 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %445) #9
  %471 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %446) #9
  %472 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %447) #9
  %473 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %448) #9
  %474 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %449) #9
  %475 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %459) #9
  %476 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %460) #9
  %477 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %461) #9
  %478 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %462) #9
  %479 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %463) #9
  %480 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %464) #9
  %481 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %465) #9
  %482 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %466) #9
  %483 = fmul float %415, %467
  %484 = fmul float %416, %468
  %485 = fmul float %417, %469
  %486 = fmul float %418, %470
  %487 = fmul float %419, %471
  %488 = fmul float %420, %472
  %489 = fmul float %421, %473
  %490 = fmul float %422, %474
  %491 = fmul float %423, %475
  %492 = fmul float %424, %476
  %493 = fmul float %425, %477
  %494 = fmul float %426, %478
  %495 = fmul float %427, %479
  %496 = fmul float %428, %480
  %497 = fmul float %429, %481
  %498 = fmul float %430, %482
  %499 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %483) #9
  %500 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %484) #9
  %501 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %485) #9
  %502 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %486) #9
  %503 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %487) #9
  %504 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %488) #9
  %505 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %489) #9
  %506 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %490) #9
  %507 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %491) #9
  %508 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %492) #9
  %509 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %493) #9
  %510 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %494) #9
  %511 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %495) #9
  %512 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %496) #9
  %513 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %497) #9
  %514 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %498) #9
  %515 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %3
  %516 = getelementptr bfloat, ptr addrspace(1) %515, i64 %13
  %517 = getelementptr i8, ptr addrspace(1) %516, i64 1024
  %518 = insertelement <2 x bfloat> poison, bfloat %499, i64 0
  %519 = insertelement <2 x bfloat> %518, bfloat %500, i64 1
  %520 = bitcast <2 x bfloat> %519 to i32
  %521 = insertelement <2 x bfloat> poison, bfloat %501, i64 0
  %522 = insertelement <2 x bfloat> %521, bfloat %502, i64 1
  %523 = bitcast <2 x bfloat> %522 to i32
  %524 = insertelement <2 x bfloat> poison, bfloat %503, i64 0
  %525 = insertelement <2 x bfloat> %524, bfloat %504, i64 1
  %526 = bitcast <2 x bfloat> %525 to i32
  %527 = insertelement <2 x bfloat> poison, bfloat %505, i64 0
  %528 = insertelement <2 x bfloat> %527, bfloat %506, i64 1
  %529 = bitcast <2 x bfloat> %528 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %520, i32 %523, i32 %526, i32 %529, ptr addrspace(1) %516) #9
  %530 = insertelement <2 x bfloat> poison, bfloat %507, i64 0
  %531 = insertelement <2 x bfloat> %530, bfloat %508, i64 1
  %532 = bitcast <2 x bfloat> %531 to i32
  %533 = insertelement <2 x bfloat> poison, bfloat %509, i64 0
  %534 = insertelement <2 x bfloat> %533, bfloat %510, i64 1
  %535 = bitcast <2 x bfloat> %534 to i32
  %536 = insertelement <2 x bfloat> poison, bfloat %511, i64 0
  %537 = insertelement <2 x bfloat> %536, bfloat %512, i64 1
  %538 = bitcast <2 x bfloat> %537 to i32
  %539 = insertelement <2 x bfloat> poison, bfloat %513, i64 0
  %540 = insertelement <2 x bfloat> %539, bfloat %514, i64 1
  %541 = bitcast <2 x bfloat> %540 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %532, i32 %535, i32 %538, i32 %541, ptr addrspace(1) %517) #9
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

define ptx_kernel void @fusion_34(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(262144) %arg1, ptr noalias align 16 dereferenceable(256) %arg2, ptr noalias align 128 dereferenceable(131072) %arg3) local_unnamed_addr #5 {
  %arg336 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg234 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg132 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg030 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
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
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #9
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
  %35 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #9
  %36 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #9
  %37 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #9
  %38 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #9
  %39 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #9
  %40 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #9
  %41 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #9
  %42 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #9
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
  %75 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg030) #9
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
  %96 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %95) #9
  %extelt.offset = lshr i32 %96, 16
  %97 = trunc nuw i32 %extelt.offset to i16
  %98 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %93
  %99 = trunc i32 %96 to i16
  tail call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %98, i16 %99, i16 %97, i1 true) #9
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
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #9
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #9
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #9
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %106) #9
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %107) #9
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %108) #9
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %109) #9
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %110) #9
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
  tail call void asm sideeffect "@$5 st.shared.v4.b32 [ $0 + 0 ], { $1, $2, $3, $4 };", "r,r,r,r,r,b"(ptr addrspace(3) %140, i32 %141, i32 %142, i32 %143, i32 %144, i1 true) #9
  %149 = getelementptr inbounds nuw i8, ptr addrspace(3) %140, i64 16
  tail call void asm sideeffect "@$5 st.shared.v4.b32 [ $0 + 0 ], { $1, $2, $3, $4 };", "r,r,r,r,r,b"(ptr addrspace(3) nonnull %149, i32 %145, i32 %146, i32 %147, i32 %148, i1 true) #9
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract38, i32 %.extract2339, i32 %.extract2440, i32 %.extract2541, ptr addrspace(1) %132) #9
  %.extract26 = extractelement <4 x i32> %162, i64 0
  %.extract27 = extractelement <4 x i32> %162, i64 1
  %.extract28 = extractelement <4 x i32> %162, i64 2
  %.extract29 = extractelement <4 x i32> %162, i64 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract26, i32 %.extract27, i32 %.extract28, i32 %.extract29, ptr addrspace(1) %133) #9
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite)
define ptx_kernel void @input_concatenate_fusion(ptr noalias readonly align 128 captures(none) dereferenceable(131072) %0, ptr noalias readonly align 16 captures(none) dereferenceable(10485760) %1, ptr noalias readonly align 16 captures(none) dereferenceable(128) %2, ptr noalias writeonly align 128 captures(none) dereferenceable(65536) %3) local_unnamed_addr #6 {
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
  tail call void @llvm.experimental.noalias.scope.decl(metadata !14)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !17)
  %21 = zext nneg i32 %11 to i64
  %22 = getelementptr inbounds i32, ptr addrspace(1) %6, i64 %21
  %23 = load i32, ptr addrspace(1) %22, align 4, !invariant.load !6, !alias.scope !17, !noalias !14
  %24 = tail call i32 @llvm.smin.i32(i32 %23, i32 40959)
  %25 = tail call i32 @llvm.smax.i32(i32 %24, i32 0)
  %26 = shl nuw nsw i32 %25, 7
  %27 = or disjoint i32 %26, %12
  %28 = zext nneg i32 %27 to i64
  %29 = getelementptr inbounds bfloat, ptr addrspace(1) %7, i64 %28
  %30 = load bfloat, ptr addrspace(1) %29, align 2, !invariant.load !6, !alias.scope !14, !noalias !17
  %31 = fpext bfloat %30 to float
  %32 = fmul float %20, %31
  %33 = getelementptr inbounds i8, ptr addrspace(1) %19, i64 256
  %34 = load float, ptr addrspace(1) %33, align 4, !invariant.load !6
  %35 = or disjoint i32 %9, %26
  %36 = or i32 %35, 64
  %37 = zext nneg i32 %36 to i64
  %38 = getelementptr inbounds bfloat, ptr addrspace(1) %7, i64 %37
  %39 = load bfloat, ptr addrspace(1) %38, align 2, !invariant.load !6, !alias.scope !19, !noalias !22
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
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !24
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
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !24
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
declare float @llvm.nvvm.rsqrt.approx.f(float) #7

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare float @llvm.nvvm.ex2.approx.f(float) #7

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.experimental.noalias.scope.decl(metadata) #8

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) "nvvm.reqntid"="128,1,1" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { convergent nocallback nounwind }
attributes #3 = { "nvvm.reqntid"="128,1,1" }
attributes #4 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #5 = { "nvvm.reqntid"="64,1,1" }
attributes #6 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite) "nvvm.reqntid"="128,1,1" }
attributes #7 = { mustprogress nocallback nofree nosync nounwind willreturn memory(none) }
attributes #8 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #9 = { nounwind }

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
!7 = !{i32 0, i32 768}
!8 = !{!9}
!9 = distinct !{!9, !10, !"fused_convert_param_0_155: argument 0"}
!10 = distinct !{!10, !"fused_convert_param_0_155"}
!11 = !{!12}
!12 = distinct !{!12, !13, !"fused_convert_param_0_155: argument 0"}
!13 = distinct !{!13, !"fused_convert_param_0_155"}
!14 = !{!15}
!15 = distinct !{!15, !16, !"fused_concatenate_convert_197_7: argument 0"}
!16 = distinct !{!16, !"fused_concatenate_convert_197_7"}
!17 = !{!18}
!18 = distinct !{!18, !16, !"fused_concatenate_convert_197_7: argument 1"}
!19 = !{!20}
!20 = distinct !{!20, !21, !"fused_concatenate_convert_197_7: argument 0"}
!21 = distinct !{!21, !"fused_concatenate_convert_197_7"}
!22 = !{!23}
!23 = distinct !{!23, !21, !"fused_concatenate_convert_197_7: argument 1"}
!24 = !{i32 0, i32 135456}

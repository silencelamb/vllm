; ModuleID = 'SyncTensorsGraph.219'
source_filename = "SyncTensorsGraph.219"
target datalayout = "e-p6:32:32-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@global_smem = external addrspace(3) global [0 x i8], align 16

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_gather_fusion(ptr noalias readonly align 16 captures(none) dereferenceable(311164928) %0, ptr noalias readonly align 16 captures(none) dereferenceable(256) %1, ptr noalias writeonly align 128 captures(none) dereferenceable(131072) %2) local_unnamed_addr #0 {
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

define ptx_kernel void @gemm_fusion_dot_29_0(ptr noalias align 16 dereferenceable(4194304) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1) local_unnamed_addr #3 {
  %arg148 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg046 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %.frozen = freeze i32 %1
  %2 = sdiv i32 %.frozen, 512
  %3 = shl nsw i32 %2, 3
  %4 = sub nsw i32 2, %3
  %5 = tail call i32 @llvm.smin.i32(i32 %4, i32 8)
  %6 = mul i32 %2, 512
  %.decomposed = sub i32 %.frozen, %6
  %7 = sdiv i32 %.decomposed, %5
  %8 = shl i32 %7, 4
  %9 = sext i32 %8 to i64
  %10 = tail call range(i32 0, 128) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %11 = and i32 %10, 1
  %12 = icmp eq i32 %11, 0
  %13 = shl i32 %11, 3
  %14 = and i32 %10, 2
  %15 = icmp eq i32 %14, 0
  %16 = shl i32 %14, 3
  %17 = or disjoint i32 %13, %16
  %18 = and i32 %10, 4
  %.not = icmp eq i32 %18, 0
  %19 = shl i32 %18, 3
  %20 = and i32 %10, 8
  %21 = shl i32 %20, 3
  %22 = or disjoint i32 %21, %19
  %23 = or disjoint i32 %22, %17
  %24 = and i32 %10, 16
  %25 = shl i32 %24, 3
  %26 = or disjoint i32 %23, %25
  %27 = and i32 %10, 32
  %28 = shl i32 %27, 3
  %29 = or disjoint i32 %26, %28
  %30 = icmp samesign ugt i32 %10, 63
  %31 = zext i1 %30 to i64
  %32 = select i1 %30, i32 520, i32 0
  %33 = xor i32 %29, %32
  %34 = zext nneg i32 %33 to i64
  %35 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %34
  %36 = or disjoint i32 %13, 1040
  %37 = xor i32 %36, %16
  %38 = or disjoint i32 %19, %37
  %39 = or disjoint i32 %38, %21
  %40 = or disjoint i32 %28, %25
  %41 = or disjoint i32 %40, %32
  %42 = xor i32 %41, %39
  %43 = zext nneg i32 %42 to i64
  %44 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %43
  %45 = or disjoint i32 %17, 2080
  %46 = xor i32 %45, %19
  %47 = or disjoint i32 %46, %21
  %48 = xor i32 %41, %47
  %49 = zext nneg i32 %48 to i64
  %50 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %49
  %51 = or disjoint i32 %13, 3120
  %52 = or disjoint i32 %19, %16
  %53 = xor i32 %52, %51
  %54 = or disjoint i32 %53, %21
  %55 = xor i32 %41, %54
  %56 = zext nneg i32 %55 to i64
  %57 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %56
  %58 = or disjoint i32 %23, 4096
  %59 = xor i32 %41, %58
  %60 = zext nneg i32 %59 to i64
  %61 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %60
  %62 = or disjoint i32 %13, 5136
  %63 = xor i32 %62, %16
  %64 = or disjoint i32 %19, %63
  %65 = or disjoint i32 %64, %21
  %66 = xor i32 %41, %65
  %67 = zext nneg i32 %66 to i64
  %68 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %67
  %69 = or disjoint i32 %17, 6176
  %70 = xor i32 %69, %19
  %71 = or disjoint i32 %70, %21
  %72 = xor i32 %41, %71
  %73 = zext nneg i32 %72 to i64
  %74 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %73
  %75 = or disjoint i32 %13, 7216
  %76 = xor i32 %52, %75
  %77 = or disjoint i32 %76, %21
  %78 = xor i32 %41, %77
  %79 = zext nneg i32 %78 to i64
  %80 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %79
  %81 = select i1 %12, i32 0, i32 520
  %82 = select i1 %15, i32 0, i32 1040
  %83 = or disjoint i32 %81, %82
  %84 = select i1 %.not, i32 0, i32 2080
  %85 = or disjoint i32 %83, %84
  %and.ra = and i32 %10, 24
  %86 = xor i32 %85, %and.ra
  %87 = shl nuw nsw i32 %27, 7
  %88 = or disjoint i32 %86, %87
  %89 = zext nneg i32 %88 to i64
  %90 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %89
  %91 = ptrtoint ptr addrspace(3) %90 to i64
  %92 = trunc i64 %91 to i32
  %93 = or disjoint i32 %83, 32
  %94 = or disjoint i32 %87, %and.ra
  %95 = or disjoint i32 %94, %84
  %96 = xor i32 %95, %93
  %97 = zext nneg i32 %96 to i64
  %98 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %97
  %99 = ptrtoint ptr addrspace(3) %98 to i64
  %100 = trunc i64 %99 to i32
  %101 = or disjoint i32 %85, 64
  %102 = xor i32 %94, %101
  %103 = zext nneg i32 %102 to i64
  %104 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %103
  %105 = ptrtoint ptr addrspace(3) %104 to i64
  %106 = trunc i64 %105 to i32
  %107 = or disjoint i32 %83, 96
  %108 = xor i32 %95, %107
  %109 = zext nneg i32 %108 to i64
  %110 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %109
  %111 = ptrtoint ptr addrspace(3) %110 to i64
  %112 = trunc i64 %111 to i32
  %113 = or disjoint i32 %85, 128
  %114 = xor i32 %94, %113
  %115 = zext nneg i32 %114 to i64
  %116 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %115
  %117 = ptrtoint ptr addrspace(3) %116 to i64
  %118 = trunc i64 %117 to i32
  %119 = or disjoint i32 %83, 160
  %120 = xor i32 %95, %119
  %121 = zext nneg i32 %120 to i64
  %122 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %121
  %123 = ptrtoint ptr addrspace(3) %122 to i64
  %124 = trunc i64 %123 to i32
  %125 = or disjoint i32 %85, 192
  %126 = xor i32 %94, %125
  %127 = zext nneg i32 %126 to i64
  %128 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %127
  %129 = ptrtoint ptr addrspace(3) %128 to i64
  %130 = trunc i64 %129 to i32
  %131 = or disjoint i32 %83, 224
  %132 = xor i32 %95, %131
  %133 = zext nneg i32 %132 to i64
  %134 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %133
  %135 = ptrtoint ptr addrspace(3) %134 to i64
  %136 = trunc i64 %135 to i32
  %137 = or disjoint i32 %85, 256
  %138 = xor i32 %94, %137
  %139 = zext nneg i32 %138 to i64
  %140 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %139
  %141 = ptrtoint ptr addrspace(3) %140 to i64
  %142 = trunc i64 %141 to i32
  %143 = or disjoint i32 %83, 288
  %144 = xor i32 %95, %143
  %145 = zext nneg i32 %144 to i64
  %146 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %145
  %147 = ptrtoint ptr addrspace(3) %146 to i64
  %148 = trunc i64 %147 to i32
  %149 = or disjoint i32 %85, 320
  %150 = xor i32 %94, %149
  %151 = zext nneg i32 %150 to i64
  %152 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %151
  %153 = ptrtoint ptr addrspace(3) %152 to i64
  %154 = trunc i64 %153 to i32
  %155 = or disjoint i32 %83, 352
  %156 = xor i32 %95, %155
  %157 = zext nneg i32 %156 to i64
  %158 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %157
  %159 = ptrtoint ptr addrspace(3) %158 to i64
  %160 = trunc i64 %159 to i32
  %161 = or disjoint i32 %85, 384
  %162 = xor i32 %94, %161
  %163 = zext nneg i32 %162 to i64
  %164 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %163
  %165 = ptrtoint ptr addrspace(3) %164 to i64
  %166 = trunc i64 %165 to i32
  %167 = or disjoint i32 %83, 416
  %168 = xor i32 %95, %167
  %169 = zext nneg i32 %168 to i64
  %170 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %169
  %171 = ptrtoint ptr addrspace(3) %170 to i64
  %172 = trunc i64 %171 to i32
  %173 = or disjoint i32 %85, 448
  %174 = xor i32 %94, %173
  %175 = zext nneg i32 %174 to i64
  %176 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %175
  %177 = ptrtoint ptr addrspace(3) %176 to i64
  %178 = trunc i64 %177 to i32
  %179 = or disjoint i32 %83, 480
  %180 = xor i32 %95, %179
  %181 = zext nneg i32 %180 to i64
  %182 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %181
  %183 = ptrtoint ptr addrspace(3) %182 to i64
  %184 = trunc i64 %183 to i32
  %185 = add i64 %9, %31
  %186 = shl nsw i64 %185, 12
  %187 = add i32 %28, %25
  %188 = add i32 %187, %21
  %189 = add i32 %188, %19
  %190 = add i32 %189, %16
  %191 = add i32 %190, %13
  %192 = zext nneg i32 %191 to i64
  %193 = shl nuw nsw i64 %192, 1
  %194 = add i64 %186, %193
  %195 = add i64 %194, 57344
  %scevgep = getelementptr i8, ptr addrspace(1) %arg046, i64 %195
  br label %196

196:                                              ; preds = %0, %196
  %lsr.iv50 = phi ptr addrspace(1) [ %scevgep, %0 ], [ %scevgep51, %196 ]
  %lsr.iv = phi i32 [ -512, %0 ], [ %lsr.iv.next, %196 ]
  %197 = phi { float, float, float, float } [ zeroinitializer, %0 ], [ %557, %196 ]
  %scevgep58 = getelementptr i8, ptr addrspace(1) %lsr.iv50, i64 -57344
  %scevgep57 = getelementptr i8, ptr addrspace(1) %lsr.iv50, i64 -49152
  %scevgep56 = getelementptr i8, ptr addrspace(1) %lsr.iv50, i64 -40960
  %scevgep55 = getelementptr i8, ptr addrspace(1) %lsr.iv50, i64 -32768
  %scevgep54 = getelementptr i8, ptr addrspace(1) %lsr.iv50, i64 -24576
  %scevgep53 = getelementptr i8, ptr addrspace(1) %lsr.iv50, i64 -16384
  %scevgep52 = getelementptr i8, ptr addrspace(1) %lsr.iv50, i64 -8192
  %198 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %scevgep58) #9
  %199 = extractvalue { i32, i32, i32, i32 } %198, 0
  %200 = bitcast i32 %199 to <2 x bfloat>
  %201 = extractvalue { i32, i32, i32, i32 } %198, 1
  %202 = bitcast i32 %201 to <2 x bfloat>
  %203 = extractvalue { i32, i32, i32, i32 } %198, 2
  %204 = bitcast i32 %203 to <2 x bfloat>
  %205 = shufflevector <2 x bfloat> %204, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %206 = extractvalue { i32, i32, i32, i32 } %198, 3
  %207 = bitcast i32 %206 to <2 x bfloat>
  %208 = shufflevector <2 x bfloat> %207, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %209 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %scevgep57) #9
  %210 = extractvalue { i32, i32, i32, i32 } %209, 0
  %211 = bitcast i32 %210 to <2 x bfloat>
  %212 = extractvalue { i32, i32, i32, i32 } %209, 1
  %213 = bitcast i32 %212 to <2 x bfloat>
  %214 = extractvalue { i32, i32, i32, i32 } %209, 2
  %215 = bitcast i32 %214 to <2 x bfloat>
  %216 = shufflevector <2 x bfloat> %215, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %217 = extractvalue { i32, i32, i32, i32 } %209, 3
  %218 = bitcast i32 %217 to <2 x bfloat>
  %219 = shufflevector <2 x bfloat> %218, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %220 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %scevgep56) #9
  %221 = extractvalue { i32, i32, i32, i32 } %220, 0
  %222 = bitcast i32 %221 to <2 x bfloat>
  %223 = extractvalue { i32, i32, i32, i32 } %220, 1
  %224 = bitcast i32 %223 to <2 x bfloat>
  %225 = extractvalue { i32, i32, i32, i32 } %220, 2
  %226 = bitcast i32 %225 to <2 x bfloat>
  %227 = shufflevector <2 x bfloat> %226, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %228 = extractvalue { i32, i32, i32, i32 } %220, 3
  %229 = bitcast i32 %228 to <2 x bfloat>
  %230 = shufflevector <2 x bfloat> %229, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %231 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %scevgep55) #9
  %232 = extractvalue { i32, i32, i32, i32 } %231, 0
  %233 = bitcast i32 %232 to <2 x bfloat>
  %234 = extractvalue { i32, i32, i32, i32 } %231, 1
  %235 = bitcast i32 %234 to <2 x bfloat>
  %236 = extractvalue { i32, i32, i32, i32 } %231, 2
  %237 = bitcast i32 %236 to <2 x bfloat>
  %238 = shufflevector <2 x bfloat> %237, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %239 = extractvalue { i32, i32, i32, i32 } %231, 3
  %240 = bitcast i32 %239 to <2 x bfloat>
  %241 = shufflevector <2 x bfloat> %240, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %242 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %scevgep54) #9
  %243 = extractvalue { i32, i32, i32, i32 } %242, 0
  %244 = bitcast i32 %243 to <2 x bfloat>
  %245 = extractvalue { i32, i32, i32, i32 } %242, 1
  %246 = bitcast i32 %245 to <2 x bfloat>
  %247 = extractvalue { i32, i32, i32, i32 } %242, 2
  %248 = bitcast i32 %247 to <2 x bfloat>
  %249 = shufflevector <2 x bfloat> %248, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %250 = extractvalue { i32, i32, i32, i32 } %242, 3
  %251 = bitcast i32 %250 to <2 x bfloat>
  %252 = shufflevector <2 x bfloat> %251, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %253 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %scevgep53) #9
  %254 = extractvalue { i32, i32, i32, i32 } %253, 0
  %255 = bitcast i32 %254 to <2 x bfloat>
  %256 = extractvalue { i32, i32, i32, i32 } %253, 1
  %257 = bitcast i32 %256 to <2 x bfloat>
  %258 = extractvalue { i32, i32, i32, i32 } %253, 2
  %259 = bitcast i32 %258 to <2 x bfloat>
  %260 = shufflevector <2 x bfloat> %259, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %261 = extractvalue { i32, i32, i32, i32 } %253, 3
  %262 = bitcast i32 %261 to <2 x bfloat>
  %263 = shufflevector <2 x bfloat> %262, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %264 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %scevgep52) #9
  %265 = extractvalue { i32, i32, i32, i32 } %264, 0
  %266 = bitcast i32 %265 to <2 x bfloat>
  %267 = extractvalue { i32, i32, i32, i32 } %264, 1
  %268 = bitcast i32 %267 to <2 x bfloat>
  %269 = extractvalue { i32, i32, i32, i32 } %264, 2
  %270 = bitcast i32 %269 to <2 x bfloat>
  %271 = shufflevector <2 x bfloat> %270, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %272 = extractvalue { i32, i32, i32, i32 } %264, 3
  %273 = bitcast i32 %272 to <2 x bfloat>
  %274 = shufflevector <2 x bfloat> %273, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %275 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %lsr.iv50) #9
  %276 = extractvalue { i32, i32, i32, i32 } %275, 0
  %277 = bitcast i32 %276 to <2 x bfloat>
  %278 = extractvalue { i32, i32, i32, i32 } %275, 1
  %279 = bitcast i32 %278 to <2 x bfloat>
  %280 = extractvalue { i32, i32, i32, i32 } %275, 2
  %281 = bitcast i32 %280 to <2 x bfloat>
  %282 = shufflevector <2 x bfloat> %281, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %283 = extractvalue { i32, i32, i32, i32 } %275, 3
  %284 = bitcast i32 %283 to <2 x bfloat>
  %285 = shufflevector <2 x bfloat> %284, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  tail call void @llvm.nvvm.barrier0()
  %286 = shufflevector <2 x bfloat> %200, <2 x bfloat> %202, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 poison, i32 poison, i32 poison, i32 poison>
  %287 = shufflevector <8 x bfloat> %286, <8 x bfloat> %205, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 poison, i32 poison>
  %288 = shufflevector <8 x bfloat> %287, <8 x bfloat> %208, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 8, i32 9>
  store <8 x bfloat> %288, ptr addrspace(3) %35, align 16
  %289 = shufflevector <2 x bfloat> %211, <2 x bfloat> %213, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 poison, i32 poison, i32 poison, i32 poison>
  %290 = shufflevector <8 x bfloat> %289, <8 x bfloat> %216, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 poison, i32 poison>
  %291 = shufflevector <8 x bfloat> %290, <8 x bfloat> %219, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 8, i32 9>
  store <8 x bfloat> %291, ptr addrspace(3) %44, align 16
  %292 = shufflevector <2 x bfloat> %222, <2 x bfloat> %224, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 poison, i32 poison, i32 poison, i32 poison>
  %293 = shufflevector <8 x bfloat> %292, <8 x bfloat> %227, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 poison, i32 poison>
  %294 = shufflevector <8 x bfloat> %293, <8 x bfloat> %230, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 8, i32 9>
  store <8 x bfloat> %294, ptr addrspace(3) %50, align 16
  %295 = shufflevector <2 x bfloat> %233, <2 x bfloat> %235, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 poison, i32 poison, i32 poison, i32 poison>
  %296 = shufflevector <8 x bfloat> %295, <8 x bfloat> %238, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 poison, i32 poison>
  %297 = shufflevector <8 x bfloat> %296, <8 x bfloat> %241, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 8, i32 9>
  store <8 x bfloat> %297, ptr addrspace(3) %57, align 16
  %298 = shufflevector <2 x bfloat> %244, <2 x bfloat> %246, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 poison, i32 poison, i32 poison, i32 poison>
  %299 = shufflevector <8 x bfloat> %298, <8 x bfloat> %249, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 poison, i32 poison>
  %300 = shufflevector <8 x bfloat> %299, <8 x bfloat> %252, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 8, i32 9>
  store <8 x bfloat> %300, ptr addrspace(3) %61, align 16
  %301 = shufflevector <2 x bfloat> %255, <2 x bfloat> %257, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 poison, i32 poison, i32 poison, i32 poison>
  %302 = shufflevector <8 x bfloat> %301, <8 x bfloat> %260, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 poison, i32 poison>
  %303 = shufflevector <8 x bfloat> %302, <8 x bfloat> %263, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 8, i32 9>
  store <8 x bfloat> %303, ptr addrspace(3) %68, align 16
  %304 = shufflevector <2 x bfloat> %266, <2 x bfloat> %268, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 poison, i32 poison, i32 poison, i32 poison>
  %305 = shufflevector <8 x bfloat> %304, <8 x bfloat> %271, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 poison, i32 poison>
  %306 = shufflevector <8 x bfloat> %305, <8 x bfloat> %274, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 8, i32 9>
  store <8 x bfloat> %306, ptr addrspace(3) %74, align 16
  %307 = shufflevector <2 x bfloat> %277, <2 x bfloat> %279, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 poison, i32 poison, i32 poison, i32 poison>
  %308 = shufflevector <8 x bfloat> %307, <8 x bfloat> %282, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 poison, i32 poison>
  %309 = shufflevector <8 x bfloat> %308, <8 x bfloat> %285, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 8, i32 9>
  store <8 x bfloat> %309, ptr addrspace(3) %80, align 16
  tail call void @llvm.nvvm.barrier0()
  %310 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %92) #9
  %311 = extractvalue { i32, i32, i32, i32 } %310, 0
  %312 = extractvalue { i32, i32, i32, i32 } %310, 1
  %313 = extractvalue { i32, i32, i32, i32 } %310, 2
  %314 = extractvalue { i32, i32, i32, i32 } %310, 3
  %315 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %100) #9
  %316 = extractvalue { i32, i32, i32, i32 } %315, 0
  %317 = extractvalue { i32, i32, i32, i32 } %315, 1
  %318 = extractvalue { i32, i32, i32, i32 } %315, 2
  %319 = extractvalue { i32, i32, i32, i32 } %315, 3
  %320 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %106) #9
  %321 = extractvalue { i32, i32, i32, i32 } %320, 0
  %322 = extractvalue { i32, i32, i32, i32 } %320, 1
  %323 = extractvalue { i32, i32, i32, i32 } %320, 2
  %324 = extractvalue { i32, i32, i32, i32 } %320, 3
  %325 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %112) #9
  %326 = extractvalue { i32, i32, i32, i32 } %325, 0
  %327 = extractvalue { i32, i32, i32, i32 } %325, 1
  %328 = extractvalue { i32, i32, i32, i32 } %325, 2
  %329 = extractvalue { i32, i32, i32, i32 } %325, 3
  %330 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %118) #9
  %331 = extractvalue { i32, i32, i32, i32 } %330, 0
  %332 = extractvalue { i32, i32, i32, i32 } %330, 1
  %333 = extractvalue { i32, i32, i32, i32 } %330, 2
  %334 = extractvalue { i32, i32, i32, i32 } %330, 3
  %335 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %124) #9
  %336 = extractvalue { i32, i32, i32, i32 } %335, 0
  %337 = extractvalue { i32, i32, i32, i32 } %335, 1
  %338 = extractvalue { i32, i32, i32, i32 } %335, 2
  %339 = extractvalue { i32, i32, i32, i32 } %335, 3
  %340 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %130) #9
  %341 = extractvalue { i32, i32, i32, i32 } %340, 0
  %342 = extractvalue { i32, i32, i32, i32 } %340, 1
  %343 = extractvalue { i32, i32, i32, i32 } %340, 2
  %344 = extractvalue { i32, i32, i32, i32 } %340, 3
  %345 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %136) #9
  %346 = extractvalue { i32, i32, i32, i32 } %345, 0
  %347 = extractvalue { i32, i32, i32, i32 } %345, 1
  %348 = extractvalue { i32, i32, i32, i32 } %345, 2
  %349 = extractvalue { i32, i32, i32, i32 } %345, 3
  %350 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %142) #9
  %351 = extractvalue { i32, i32, i32, i32 } %350, 0
  %352 = extractvalue { i32, i32, i32, i32 } %350, 1
  %353 = extractvalue { i32, i32, i32, i32 } %350, 2
  %354 = extractvalue { i32, i32, i32, i32 } %350, 3
  %355 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %148) #9
  %356 = extractvalue { i32, i32, i32, i32 } %355, 0
  %357 = extractvalue { i32, i32, i32, i32 } %355, 1
  %358 = extractvalue { i32, i32, i32, i32 } %355, 2
  %359 = extractvalue { i32, i32, i32, i32 } %355, 3
  %360 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %154) #9
  %361 = extractvalue { i32, i32, i32, i32 } %360, 0
  %362 = extractvalue { i32, i32, i32, i32 } %360, 1
  %363 = extractvalue { i32, i32, i32, i32 } %360, 2
  %364 = extractvalue { i32, i32, i32, i32 } %360, 3
  %365 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %160) #9
  %366 = extractvalue { i32, i32, i32, i32 } %365, 0
  %367 = extractvalue { i32, i32, i32, i32 } %365, 1
  %368 = extractvalue { i32, i32, i32, i32 } %365, 2
  %369 = extractvalue { i32, i32, i32, i32 } %365, 3
  %370 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %166) #9
  %371 = extractvalue { i32, i32, i32, i32 } %370, 0
  %372 = extractvalue { i32, i32, i32, i32 } %370, 1
  %373 = extractvalue { i32, i32, i32, i32 } %370, 2
  %374 = extractvalue { i32, i32, i32, i32 } %370, 3
  %375 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %172) #9
  %376 = extractvalue { i32, i32, i32, i32 } %375, 0
  %377 = extractvalue { i32, i32, i32, i32 } %375, 1
  %378 = extractvalue { i32, i32, i32, i32 } %375, 2
  %379 = extractvalue { i32, i32, i32, i32 } %375, 3
  %380 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %178) #9
  %381 = extractvalue { i32, i32, i32, i32 } %380, 0
  %382 = extractvalue { i32, i32, i32, i32 } %380, 1
  %383 = extractvalue { i32, i32, i32, i32 } %380, 2
  %384 = extractvalue { i32, i32, i32, i32 } %380, 3
  %385 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %184) #9
  %386 = extractvalue { i32, i32, i32, i32 } %385, 0
  %387 = extractvalue { i32, i32, i32, i32 } %385, 1
  %388 = extractvalue { i32, i32, i32, i32 } %385, 2
  %389 = extractvalue { i32, i32, i32, i32 } %385, 3
  %390 = extractvalue { float, float, float, float } %197, 0
  %391 = extractvalue { float, float, float, float } %197, 1
  %392 = extractvalue { float, float, float, float } %197, 2
  %393 = extractvalue { float, float, float, float } %197, 3
  %394 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %390, float %391, float %392, float %393, i32 0, i32 0, i32 0, i32 0, i32 %311, i32 %312) #9
  %395 = extractvalue { float, float, float, float } %394, 0
  %396 = extractvalue { float, float, float, float } %394, 1
  %397 = extractvalue { float, float, float, float } %394, 2
  %398 = extractvalue { float, float, float, float } %394, 3
  %399 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %395, float %396, float %397, float %398, i32 0, i32 0, i32 0, i32 0, i32 %313, i32 %314) #9
  %400 = extractvalue { float, float, float, float } %399, 0
  %401 = extractvalue { float, float, float, float } %399, 1
  %402 = extractvalue { float, float, float, float } %399, 2
  %403 = extractvalue { float, float, float, float } %399, 3
  %404 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %400, float %401, float %402, float %403, i32 0, i32 0, i32 0, i32 0, i32 %316, i32 %317) #9
  %405 = extractvalue { float, float, float, float } %404, 0
  %406 = extractvalue { float, float, float, float } %404, 1
  %407 = extractvalue { float, float, float, float } %404, 2
  %408 = extractvalue { float, float, float, float } %404, 3
  %409 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %405, float %406, float %407, float %408, i32 0, i32 0, i32 0, i32 0, i32 %318, i32 %319) #9
  %410 = extractvalue { float, float, float, float } %409, 0
  %411 = extractvalue { float, float, float, float } %409, 1
  %412 = extractvalue { float, float, float, float } %409, 2
  %413 = extractvalue { float, float, float, float } %409, 3
  %414 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %410, float %411, float %412, float %413, i32 0, i32 0, i32 0, i32 0, i32 %321, i32 %322) #9
  %415 = extractvalue { float, float, float, float } %414, 0
  %416 = extractvalue { float, float, float, float } %414, 1
  %417 = extractvalue { float, float, float, float } %414, 2
  %418 = extractvalue { float, float, float, float } %414, 3
  %419 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %415, float %416, float %417, float %418, i32 0, i32 0, i32 0, i32 0, i32 %323, i32 %324) #9
  %420 = extractvalue { float, float, float, float } %419, 0
  %421 = extractvalue { float, float, float, float } %419, 1
  %422 = extractvalue { float, float, float, float } %419, 2
  %423 = extractvalue { float, float, float, float } %419, 3
  %424 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %420, float %421, float %422, float %423, i32 0, i32 0, i32 0, i32 0, i32 %326, i32 %327) #9
  %425 = extractvalue { float, float, float, float } %424, 0
  %426 = extractvalue { float, float, float, float } %424, 1
  %427 = extractvalue { float, float, float, float } %424, 2
  %428 = extractvalue { float, float, float, float } %424, 3
  %429 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %425, float %426, float %427, float %428, i32 0, i32 0, i32 0, i32 0, i32 %328, i32 %329) #9
  %430 = extractvalue { float, float, float, float } %429, 0
  %431 = extractvalue { float, float, float, float } %429, 1
  %432 = extractvalue { float, float, float, float } %429, 2
  %433 = extractvalue { float, float, float, float } %429, 3
  %434 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %430, float %431, float %432, float %433, i32 0, i32 0, i32 0, i32 0, i32 %331, i32 %332) #9
  %435 = extractvalue { float, float, float, float } %434, 0
  %436 = extractvalue { float, float, float, float } %434, 1
  %437 = extractvalue { float, float, float, float } %434, 2
  %438 = extractvalue { float, float, float, float } %434, 3
  %439 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %435, float %436, float %437, float %438, i32 0, i32 0, i32 0, i32 0, i32 %333, i32 %334) #9
  %440 = extractvalue { float, float, float, float } %439, 0
  %441 = extractvalue { float, float, float, float } %439, 1
  %442 = extractvalue { float, float, float, float } %439, 2
  %443 = extractvalue { float, float, float, float } %439, 3
  %444 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %440, float %441, float %442, float %443, i32 0, i32 0, i32 0, i32 0, i32 %336, i32 %337) #9
  %445 = extractvalue { float, float, float, float } %444, 0
  %446 = extractvalue { float, float, float, float } %444, 1
  %447 = extractvalue { float, float, float, float } %444, 2
  %448 = extractvalue { float, float, float, float } %444, 3
  %449 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %445, float %446, float %447, float %448, i32 0, i32 0, i32 0, i32 0, i32 %338, i32 %339) #9
  %450 = extractvalue { float, float, float, float } %449, 0
  %451 = extractvalue { float, float, float, float } %449, 1
  %452 = extractvalue { float, float, float, float } %449, 2
  %453 = extractvalue { float, float, float, float } %449, 3
  %454 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %450, float %451, float %452, float %453, i32 0, i32 0, i32 0, i32 0, i32 %341, i32 %342) #9
  %455 = extractvalue { float, float, float, float } %454, 0
  %456 = extractvalue { float, float, float, float } %454, 1
  %457 = extractvalue { float, float, float, float } %454, 2
  %458 = extractvalue { float, float, float, float } %454, 3
  %459 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %455, float %456, float %457, float %458, i32 0, i32 0, i32 0, i32 0, i32 %343, i32 %344) #9
  %460 = extractvalue { float, float, float, float } %459, 0
  %461 = extractvalue { float, float, float, float } %459, 1
  %462 = extractvalue { float, float, float, float } %459, 2
  %463 = extractvalue { float, float, float, float } %459, 3
  %464 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %460, float %461, float %462, float %463, i32 0, i32 0, i32 0, i32 0, i32 %346, i32 %347) #9
  %465 = extractvalue { float, float, float, float } %464, 0
  %466 = extractvalue { float, float, float, float } %464, 1
  %467 = extractvalue { float, float, float, float } %464, 2
  %468 = extractvalue { float, float, float, float } %464, 3
  %469 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %465, float %466, float %467, float %468, i32 0, i32 0, i32 0, i32 0, i32 %348, i32 %349) #9
  %470 = extractvalue { float, float, float, float } %469, 0
  %471 = extractvalue { float, float, float, float } %469, 1
  %472 = extractvalue { float, float, float, float } %469, 2
  %473 = extractvalue { float, float, float, float } %469, 3
  %474 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %470, float %471, float %472, float %473, i32 0, i32 0, i32 0, i32 0, i32 %351, i32 %352) #9
  %475 = extractvalue { float, float, float, float } %474, 0
  %476 = extractvalue { float, float, float, float } %474, 1
  %477 = extractvalue { float, float, float, float } %474, 2
  %478 = extractvalue { float, float, float, float } %474, 3
  %479 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %475, float %476, float %477, float %478, i32 0, i32 0, i32 0, i32 0, i32 %353, i32 %354) #9
  %480 = extractvalue { float, float, float, float } %479, 0
  %481 = extractvalue { float, float, float, float } %479, 1
  %482 = extractvalue { float, float, float, float } %479, 2
  %483 = extractvalue { float, float, float, float } %479, 3
  %484 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %480, float %481, float %482, float %483, i32 0, i32 0, i32 0, i32 0, i32 %356, i32 %357) #9
  %485 = extractvalue { float, float, float, float } %484, 0
  %486 = extractvalue { float, float, float, float } %484, 1
  %487 = extractvalue { float, float, float, float } %484, 2
  %488 = extractvalue { float, float, float, float } %484, 3
  %489 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %485, float %486, float %487, float %488, i32 0, i32 0, i32 0, i32 0, i32 %358, i32 %359) #9
  %490 = extractvalue { float, float, float, float } %489, 0
  %491 = extractvalue { float, float, float, float } %489, 1
  %492 = extractvalue { float, float, float, float } %489, 2
  %493 = extractvalue { float, float, float, float } %489, 3
  %494 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %490, float %491, float %492, float %493, i32 0, i32 0, i32 0, i32 0, i32 %361, i32 %362) #9
  %495 = extractvalue { float, float, float, float } %494, 0
  %496 = extractvalue { float, float, float, float } %494, 1
  %497 = extractvalue { float, float, float, float } %494, 2
  %498 = extractvalue { float, float, float, float } %494, 3
  %499 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %495, float %496, float %497, float %498, i32 0, i32 0, i32 0, i32 0, i32 %363, i32 %364) #9
  %500 = extractvalue { float, float, float, float } %499, 0
  %501 = extractvalue { float, float, float, float } %499, 1
  %502 = extractvalue { float, float, float, float } %499, 2
  %503 = extractvalue { float, float, float, float } %499, 3
  %504 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %500, float %501, float %502, float %503, i32 0, i32 0, i32 0, i32 0, i32 %366, i32 %367) #9
  %505 = extractvalue { float, float, float, float } %504, 0
  %506 = extractvalue { float, float, float, float } %504, 1
  %507 = extractvalue { float, float, float, float } %504, 2
  %508 = extractvalue { float, float, float, float } %504, 3
  %509 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %505, float %506, float %507, float %508, i32 0, i32 0, i32 0, i32 0, i32 %368, i32 %369) #9
  %510 = extractvalue { float, float, float, float } %509, 0
  %511 = extractvalue { float, float, float, float } %509, 1
  %512 = extractvalue { float, float, float, float } %509, 2
  %513 = extractvalue { float, float, float, float } %509, 3
  %514 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %510, float %511, float %512, float %513, i32 0, i32 0, i32 0, i32 0, i32 %371, i32 %372) #9
  %515 = extractvalue { float, float, float, float } %514, 0
  %516 = extractvalue { float, float, float, float } %514, 1
  %517 = extractvalue { float, float, float, float } %514, 2
  %518 = extractvalue { float, float, float, float } %514, 3
  %519 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %515, float %516, float %517, float %518, i32 0, i32 0, i32 0, i32 0, i32 %373, i32 %374) #9
  %520 = extractvalue { float, float, float, float } %519, 0
  %521 = extractvalue { float, float, float, float } %519, 1
  %522 = extractvalue { float, float, float, float } %519, 2
  %523 = extractvalue { float, float, float, float } %519, 3
  %524 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %520, float %521, float %522, float %523, i32 0, i32 0, i32 0, i32 0, i32 %376, i32 %377) #9
  %525 = extractvalue { float, float, float, float } %524, 0
  %526 = extractvalue { float, float, float, float } %524, 1
  %527 = extractvalue { float, float, float, float } %524, 2
  %528 = extractvalue { float, float, float, float } %524, 3
  %529 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %525, float %526, float %527, float %528, i32 0, i32 0, i32 0, i32 0, i32 %378, i32 %379) #9
  %530 = extractvalue { float, float, float, float } %529, 0
  %531 = extractvalue { float, float, float, float } %529, 1
  %532 = extractvalue { float, float, float, float } %529, 2
  %533 = extractvalue { float, float, float, float } %529, 3
  %534 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %530, float %531, float %532, float %533, i32 0, i32 0, i32 0, i32 0, i32 %381, i32 %382) #9
  %535 = extractvalue { float, float, float, float } %534, 0
  %536 = extractvalue { float, float, float, float } %534, 1
  %537 = extractvalue { float, float, float, float } %534, 2
  %538 = extractvalue { float, float, float, float } %534, 3
  %539 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %535, float %536, float %537, float %538, i32 0, i32 0, i32 0, i32 0, i32 %383, i32 %384) #9
  %540 = extractvalue { float, float, float, float } %539, 0
  %541 = extractvalue { float, float, float, float } %539, 1
  %542 = extractvalue { float, float, float, float } %539, 2
  %543 = extractvalue { float, float, float, float } %539, 3
  %544 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %540, float %541, float %542, float %543, i32 0, i32 0, i32 0, i32 0, i32 %386, i32 %387) #9
  %545 = extractvalue { float, float, float, float } %544, 0
  %546 = extractvalue { float, float, float, float } %544, 1
  %547 = extractvalue { float, float, float, float } %544, 2
  %548 = extractvalue { float, float, float, float } %544, 3
  %549 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %545, float %546, float %547, float %548, i32 0, i32 0, i32 0, i32 0, i32 %388, i32 %389) #9
  %550 = extractvalue { float, float, float, float } %549, 0
  %551 = extractvalue { float, float, float, float } %549, 1
  %552 = extractvalue { float, float, float, float } %549, 2
  %553 = extractvalue { float, float, float, float } %549, 3
  %554 = insertvalue { float, float, float, float } undef, float %550, 0
  %555 = insertvalue { float, float, float, float } %554, float %551, 1
  %556 = insertvalue { float, float, float, float } %555, float %552, 2
  %557 = insertvalue { float, float, float, float } %556, float %553, 3
  %lsr.iv.next = add nsw i32 %lsr.iv, 512
  %scevgep51 = getelementptr i8, ptr addrspace(1) %lsr.iv50, i64 1024
  %558 = icmp samesign ult i32 %lsr.iv.next, 1536
  br i1 %558, label %196, label %559

559:                                              ; preds = %196
  %560 = icmp ugt i32 %10, 63
  %561 = srem i32 %1, %5
  %562 = add nsw i32 %561, %3
  %563 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %550) #9
  %564 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %551) #9
  %565 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %552) #9
  %566 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %553) #9
  %567 = shl nsw i32 %562, 5
  %568 = sext i32 %567 to i64
  %569 = lshr i32 %10, 2
  %570 = and i32 %569, 7
  %571 = lshr exact i32 %27, 2
  %572 = select i1 %560, i32 16, i32 0
  %573 = or disjoint i32 %570, %572
  %574 = or disjoint i32 %573, %571
  %575 = zext nneg i32 %574 to i64
  %576 = or disjoint i64 %568, %575
  %577 = shl nuw nsw i32 %10, 2
  %578 = and i32 %577, 12
  %579 = zext nneg i32 %578 to i64
  %580 = or disjoint i64 %9, %579
  %.idx = shl nsw i64 %576, 11
  %581 = getelementptr i8, ptr addrspace(1) %arg148, i64 %.idx
  %582 = getelementptr bfloat, ptr addrspace(1) %581, i64 %580
  tail call void @llvm.nvvm.barrier0()
  %583 = shl nuw nsw i32 %10, 1
  %584 = and i32 %583, 6
  %585 = shl nuw nsw i32 %18, 2
  %586 = or disjoint i32 %584, %585
  %587 = shl nuw nsw i32 %20, 2
  %588 = or disjoint i32 %586, %587
  %589 = shl nuw nsw i32 %24, 2
  %590 = or disjoint i32 %588, %589
  %591 = or disjoint i32 %590, %571
  %592 = select i1 %560, i32 256, i32 0
  %593 = xor i32 %591, %592
  %594 = and i32 %577, 156
  %595 = or disjoint i32 %587, %594
  %596 = or disjoint i32 %595, %589
  %597 = or disjoint i32 %596, %592
  %598 = lshr i32 %593, 2
  %599 = and i32 %598, 1073741820
  %600 = add nuw nsw i32 %599, %593
  %601 = zext nneg i32 %600 to i64
  %602 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %601
  %603 = bitcast bfloat %563 to i16
  %604 = bitcast bfloat %564 to i16
  tail call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %602, i16 %603, i16 %604, i1 true) #9
  %605 = xor i32 %593, 128
  %606 = lshr i32 %605, 2
  %607 = and i32 %606, 1073741820
  %608 = add nuw nsw i32 %607, %605
  %609 = zext nneg i32 %608 to i64
  %610 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %609
  %611 = bitcast bfloat %565 to i16
  %612 = bitcast bfloat %566 to i16
  tail call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %610, i16 %611, i16 %612, i1 true) #9
  tail call void @llvm.nvvm.barrier0()
  %613 = lshr exact i32 %597, 2
  %614 = and i32 %613, 536870908
  %615 = add nuw nsw i32 %614, %597
  %616 = zext nneg i32 %615 to i64
  %617 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %616
  %618 = load <2 x i32>, ptr addrspace(3) %617, align 8
  %.uncasted.extract59 = extractelement <2 x i32> %618, i32 0
  %.uncasted.extract660 = extractelement <2 x i32> %618, i32 1
  tail call void asm sideeffect "st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l"(i32 %.uncasted.extract59, i32 %.uncasted.extract660, ptr addrspace(1) %582) #9
  ret void
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #4

define ptx_kernel void @fusion_25(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4) local_unnamed_addr #5 {
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %3 = shl nsw i64 %2, 10
  %4 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %3
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
  %66 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %3
  %67 = getelementptr bfloat, ptr addrspace(1) %66, i64 %13
  %68 = getelementptr i8, ptr addrspace(1) %67, i64 1024
  %69 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %67) #9
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
  %86 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %68) #9
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
  %103 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %78) #9
  %104 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %79) #9
  %105 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %80) #9
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #9
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #9
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #9
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #9
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #9
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %95) #9
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %96) #9
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %97) #9
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #9
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #9
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #9
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #9
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #9
  %119 = fadd float %50, %103
  %120 = fadd float %51, %104
  %121 = fadd float %52, %105
  %122 = fadd float %53, %106
  %123 = fadd float %54, %107
  %124 = fadd float %55, %108
  %125 = fadd float %56, %109
  %126 = fadd float %57, %110
  %127 = fadd float %58, %111
  %128 = fadd float %59, %112
  %129 = fadd float %60, %113
  %130 = fadd float %61, %114
  %131 = fadd float %62, %115
  %132 = fadd float %63, %116
  %133 = fadd float %64, %117
  %134 = fadd float %65, %118
  %135 = fmul float %119, %119
  %136 = fmul float %120, %120
  %137 = fmul float %121, %121
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
  %151 = fadd float %135, %136
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
  %164 = fadd float %163, %149
  %165 = fadd float %164, %150
  %166 = bitcast float %165 to i32
  %167 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %166, i32 16, i32 31)
  %168 = bitcast i32 %167 to float
  %169 = fadd float %165, %168
  %170 = bitcast float %169 to i32
  %171 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %170, i32 8, i32 31)
  %172 = bitcast i32 %171 to float
  %173 = fadd float %169, %172
  %174 = bitcast float %173 to i32
  %175 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %174, i32 4, i32 31)
  %176 = bitcast i32 %175 to float
  %177 = fadd float %173, %176
  %178 = bitcast float %177 to i32
  %179 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %178, i32 2, i32 31)
  %180 = bitcast i32 %179 to float
  %181 = fadd float %177, %180
  %182 = bitcast float %181 to i32
  %183 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %182, i32 1, i32 31)
  %184 = bitcast i32 %183 to float
  %185 = fadd float %181, %184
  %186 = icmp eq i32 %6, 0
  %187 = zext nneg i32 %7 to i64
  %188 = getelementptr float, ptr addrspace(3) @global_smem, i64 %187
  %189 = bitcast float %185 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %188, <1 x i32> %189, i1 %186) #9
  tail call void @llvm.nvvm.barrier0()
  %190 = icmp samesign ult i32 %5, 2
  %191 = zext nneg i32 %5 to i64
  %192 = getelementptr float, ptr addrspace(3) @global_smem, i64 %191
  %193 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %192, i1 %190) #9
  %194 = bitcast i32 %193 to float
  %195 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %193, i32 1, i32 31)
  %196 = bitcast i32 %195 to float
  %197 = fadd float %194, %196
  %198 = icmp eq i32 %5, 0
  %199 = bitcast float %197 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %192, <1 x i32> %199, i1 %198) #9
  tail call void @llvm.nvvm.barrier0()
  %200 = load float, ptr addrspace(3) @global_smem, align 16
  %201 = fmul float %200, 0x3F50000000000000
  %202 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
  %203 = bitcast i32 %202 to float
  %204 = fadd float %201, %203
  %205 = tail call float @llvm.nvvm.rsqrt.approx.f(float %204)
  %206 = fmul float %119, %205
  %207 = fmul float %120, %205
  %208 = fmul float %121, %205
  %209 = fmul float %122, %205
  %210 = fmul float %123, %205
  %211 = fmul float %124, %205
  %212 = fmul float %125, %205
  %213 = fmul float %126, %205
  %214 = fmul float %127, %205
  %215 = fmul float %128, %205
  %216 = fmul float %129, %205
  %217 = fmul float %130, %205
  %218 = fmul float %131, %205
  %219 = fmul float %132, %205
  %220 = fmul float %133, %205
  %221 = fmul float %134, %205
  %222 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %13
  %223 = getelementptr i8, ptr addrspace(1) %222, i64 1024
  %224 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %222) #9
  %225 = extractvalue { i32, i32, i32, i32 } %224, 0
  %226 = bitcast i32 %225 to <2 x bfloat>
  %227 = extractvalue { i32, i32, i32, i32 } %224, 1
  %228 = bitcast i32 %227 to <2 x bfloat>
  %229 = extractvalue { i32, i32, i32, i32 } %224, 2
  %230 = bitcast i32 %229 to <2 x bfloat>
  %231 = extractvalue { i32, i32, i32, i32 } %224, 3
  %232 = bitcast i32 %231 to <2 x bfloat>
  %233 = extractelement <2 x bfloat> %226, i64 0
  %234 = extractelement <2 x bfloat> %226, i64 1
  %235 = extractelement <2 x bfloat> %228, i64 0
  %236 = extractelement <2 x bfloat> %228, i64 1
  %237 = extractelement <2 x bfloat> %230, i64 0
  %238 = extractelement <2 x bfloat> %230, i64 1
  %239 = extractelement <2 x bfloat> %232, i64 0
  %240 = extractelement <2 x bfloat> %232, i64 1
  %241 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %223) #9
  %242 = extractvalue { i32, i32, i32, i32 } %241, 0
  %243 = bitcast i32 %242 to <2 x bfloat>
  %244 = extractvalue { i32, i32, i32, i32 } %241, 1
  %245 = bitcast i32 %244 to <2 x bfloat>
  %246 = extractvalue { i32, i32, i32, i32 } %241, 2
  %247 = bitcast i32 %246 to <2 x bfloat>
  %248 = extractvalue { i32, i32, i32, i32 } %241, 3
  %249 = bitcast i32 %248 to <2 x bfloat>
  %250 = extractelement <2 x bfloat> %243, i64 0
  %251 = extractelement <2 x bfloat> %243, i64 1
  %252 = extractelement <2 x bfloat> %245, i64 0
  %253 = extractelement <2 x bfloat> %245, i64 1
  %254 = extractelement <2 x bfloat> %247, i64 0
  %255 = extractelement <2 x bfloat> %247, i64 1
  %256 = extractelement <2 x bfloat> %249, i64 0
  %257 = extractelement <2 x bfloat> %249, i64 1
  %258 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %233) #9
  %259 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %234) #9
  %260 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %235) #9
  %261 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %236) #9
  %262 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %237) #9
  %263 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %238) #9
  %264 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %239) #9
  %265 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %240) #9
  %266 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %250) #9
  %267 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %251) #9
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %252) #9
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %253) #9
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %254) #9
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %255) #9
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %256) #9
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %257) #9
  %274 = fmul float %206, %258
  %275 = fmul float %207, %259
  %276 = fmul float %208, %260
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
  %290 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %274) #9
  %291 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %275) #9
  %292 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %276) #9
  %293 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %277) #9
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
  %306 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %3
  %307 = getelementptr bfloat, ptr addrspace(1) %306, i64 %13
  %308 = getelementptr i8, ptr addrspace(1) %307, i64 1024
  %309 = insertelement <2 x bfloat> poison, bfloat %290, i64 0
  %310 = insertelement <2 x bfloat> %309, bfloat %291, i64 1
  %311 = bitcast <2 x bfloat> %310 to i32
  %312 = insertelement <2 x bfloat> poison, bfloat %292, i64 0
  %313 = insertelement <2 x bfloat> %312, bfloat %293, i64 1
  %314 = bitcast <2 x bfloat> %313 to i32
  %315 = insertelement <2 x bfloat> poison, bfloat %294, i64 0
  %316 = insertelement <2 x bfloat> %315, bfloat %295, i64 1
  %317 = bitcast <2 x bfloat> %316 to i32
  %318 = insertelement <2 x bfloat> poison, bfloat %296, i64 0
  %319 = insertelement <2 x bfloat> %318, bfloat %297, i64 1
  %320 = bitcast <2 x bfloat> %319 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %311, i32 %314, i32 %317, i32 %320, ptr addrspace(1) %307) #9
  %321 = insertelement <2 x bfloat> poison, bfloat %298, i64 0
  %322 = insertelement <2 x bfloat> %321, bfloat %299, i64 1
  %323 = bitcast <2 x bfloat> %322 to i32
  %324 = insertelement <2 x bfloat> poison, bfloat %300, i64 0
  %325 = insertelement <2 x bfloat> %324, bfloat %301, i64 1
  %326 = bitcast <2 x bfloat> %325 to i32
  %327 = insertelement <2 x bfloat> poison, bfloat %302, i64 0
  %328 = insertelement <2 x bfloat> %327, bfloat %303, i64 1
  %329 = bitcast <2 x bfloat> %328 to i32
  %330 = insertelement <2 x bfloat> poison, bfloat %304, i64 0
  %331 = insertelement <2 x bfloat> %330, bfloat %305, i64 1
  %332 = bitcast <2 x bfloat> %331 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %323, i32 %326, i32 %329, i32 %332, ptr addrspace(1) %308) #9
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_convert_fusion(ptr noalias readonly align 128 captures(none) dereferenceable(786432) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(393216) %1) local_unnamed_addr #0 {
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

define ptx_kernel void @fusion_23(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(131072) %arg3, ptr noalias align 16 dereferenceable(2048) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5) local_unnamed_addr #5 {
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %3 = shl nsw i64 %2, 10
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
  %66 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %3
  %67 = getelementptr bfloat, ptr addrspace(1) %66, i64 %13
  %68 = getelementptr i8, ptr addrspace(1) %67, i64 1024
  %69 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %67) #9
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
  %86 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %68) #9
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
  %103 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %78) #9
  %104 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %79) #9
  %105 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %80) #9
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #9
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #9
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #9
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #9
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #9
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %95) #9
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %96) #9
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %97) #9
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #9
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #9
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #9
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #9
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #9
  %119 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %3
  %120 = getelementptr bfloat, ptr addrspace(1) %119, i64 %13
  %121 = getelementptr i8, ptr addrspace(1) %120, i64 1024
  %122 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %120) #9
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
  %139 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %121) #9
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
  %156 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %131) #9
  %157 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %132) #9
  %158 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %133) #9
  %159 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %134) #9
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #9
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #9
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #9
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #9
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %148) #9
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %149) #9
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %150) #9
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %151) #9
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #9
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #9
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #9
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #9
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
  %182 = fadd float %113, %166
  %183 = fadd float %114, %167
  %184 = fadd float %115, %168
  %185 = fadd float %116, %169
  %186 = fadd float %117, %170
  %187 = fadd float %118, %171
  %188 = fadd float %50, %172
  %189 = fadd float %51, %173
  %190 = fadd float %52, %174
  %191 = fadd float %53, %175
  %192 = fadd float %54, %176
  %193 = fadd float %55, %177
  %194 = fadd float %56, %178
  %195 = fadd float %57, %179
  %196 = fadd float %58, %180
  %197 = fadd float %59, %181
  %198 = fadd float %60, %182
  %199 = fadd float %61, %183
  %200 = fadd float %62, %184
  %201 = fadd float %63, %185
  %202 = fadd float %64, %186
  %203 = fadd float %65, %187
  %204 = fmul float %188, %188
  %205 = fmul float %189, %189
  %206 = fmul float %190, %190
  %207 = fmul float %191, %191
  %208 = fmul float %192, %192
  %209 = fmul float %193, %193
  %210 = fmul float %194, %194
  %211 = fmul float %195, %195
  %212 = fmul float %196, %196
  %213 = fmul float %197, %197
  %214 = fmul float %198, %198
  %215 = fmul float %199, %199
  %216 = fmul float %200, %200
  %217 = fmul float %201, %201
  %218 = fmul float %202, %202
  %219 = fmul float %203, %203
  %220 = fadd float %204, %205
  %221 = fadd float %220, %206
  %222 = fadd float %221, %207
  %223 = fadd float %222, %208
  %224 = fadd float %223, %209
  %225 = fadd float %224, %210
  %226 = fadd float %225, %211
  %227 = fadd float %226, %212
  %228 = fadd float %227, %213
  %229 = fadd float %228, %214
  %230 = fadd float %229, %215
  %231 = fadd float %230, %216
  %232 = fadd float %231, %217
  %233 = fadd float %232, %218
  %234 = fadd float %233, %219
  %235 = bitcast float %234 to i32
  %236 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %235, i32 16, i32 31)
  %237 = bitcast i32 %236 to float
  %238 = fadd float %234, %237
  %239 = bitcast float %238 to i32
  %240 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %239, i32 8, i32 31)
  %241 = bitcast i32 %240 to float
  %242 = fadd float %238, %241
  %243 = bitcast float %242 to i32
  %244 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %243, i32 4, i32 31)
  %245 = bitcast i32 %244 to float
  %246 = fadd float %242, %245
  %247 = bitcast float %246 to i32
  %248 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %247, i32 2, i32 31)
  %249 = bitcast i32 %248 to float
  %250 = fadd float %246, %249
  %251 = bitcast float %250 to i32
  %252 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %251, i32 1, i32 31)
  %253 = bitcast i32 %252 to float
  %254 = fadd float %250, %253
  %255 = icmp eq i32 %6, 0
  %256 = zext nneg i32 %7 to i64
  %257 = getelementptr float, ptr addrspace(3) @global_smem, i64 %256
  %258 = bitcast float %254 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %257, <1 x i32> %258, i1 %255) #9
  tail call void @llvm.nvvm.barrier0()
  %259 = icmp samesign ult i32 %5, 2
  %260 = zext nneg i32 %5 to i64
  %261 = getelementptr float, ptr addrspace(3) @global_smem, i64 %260
  %262 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %261, i1 %259) #9
  %263 = bitcast i32 %262 to float
  %264 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %262, i32 1, i32 31)
  %265 = bitcast i32 %264 to float
  %266 = fadd float %263, %265
  %267 = icmp eq i32 %5, 0
  %268 = bitcast float %266 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %261, <1 x i32> %268, i1 %267) #9
  tail call void @llvm.nvvm.barrier0()
  %269 = load float, ptr addrspace(3) @global_smem, align 16
  %270 = fmul float %269, 0x3F50000000000000
  %271 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
  %272 = bitcast i32 %271 to float
  %273 = fadd float %270, %272
  %274 = tail call float @llvm.nvvm.rsqrt.approx.f(float %273)
  %275 = fmul float %188, %274
  %276 = fmul float %189, %274
  %277 = fmul float %190, %274
  %278 = fmul float %191, %274
  %279 = fmul float %192, %274
  %280 = fmul float %193, %274
  %281 = fmul float %194, %274
  %282 = fmul float %195, %274
  %283 = fmul float %196, %274
  %284 = fmul float %197, %274
  %285 = fmul float %198, %274
  %286 = fmul float %199, %274
  %287 = fmul float %200, %274
  %288 = fmul float %201, %274
  %289 = fmul float %202, %274
  %290 = fmul float %203, %274
  %291 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %13
  %292 = getelementptr i8, ptr addrspace(1) %291, i64 1024
  %293 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %291) #9
  %294 = extractvalue { i32, i32, i32, i32 } %293, 0
  %295 = bitcast i32 %294 to <2 x bfloat>
  %296 = extractvalue { i32, i32, i32, i32 } %293, 1
  %297 = bitcast i32 %296 to <2 x bfloat>
  %298 = extractvalue { i32, i32, i32, i32 } %293, 2
  %299 = bitcast i32 %298 to <2 x bfloat>
  %300 = extractvalue { i32, i32, i32, i32 } %293, 3
  %301 = bitcast i32 %300 to <2 x bfloat>
  %302 = extractelement <2 x bfloat> %295, i64 0
  %303 = extractelement <2 x bfloat> %295, i64 1
  %304 = extractelement <2 x bfloat> %297, i64 0
  %305 = extractelement <2 x bfloat> %297, i64 1
  %306 = extractelement <2 x bfloat> %299, i64 0
  %307 = extractelement <2 x bfloat> %299, i64 1
  %308 = extractelement <2 x bfloat> %301, i64 0
  %309 = extractelement <2 x bfloat> %301, i64 1
  %310 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %292) #9
  %311 = extractvalue { i32, i32, i32, i32 } %310, 0
  %312 = bitcast i32 %311 to <2 x bfloat>
  %313 = extractvalue { i32, i32, i32, i32 } %310, 1
  %314 = bitcast i32 %313 to <2 x bfloat>
  %315 = extractvalue { i32, i32, i32, i32 } %310, 2
  %316 = bitcast i32 %315 to <2 x bfloat>
  %317 = extractvalue { i32, i32, i32, i32 } %310, 3
  %318 = bitcast i32 %317 to <2 x bfloat>
  %319 = extractelement <2 x bfloat> %312, i64 0
  %320 = extractelement <2 x bfloat> %312, i64 1
  %321 = extractelement <2 x bfloat> %314, i64 0
  %322 = extractelement <2 x bfloat> %314, i64 1
  %323 = extractelement <2 x bfloat> %316, i64 0
  %324 = extractelement <2 x bfloat> %316, i64 1
  %325 = extractelement <2 x bfloat> %318, i64 0
  %326 = extractelement <2 x bfloat> %318, i64 1
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %302) #9
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %303) #9
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %304) #9
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %305) #9
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %306) #9
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %307) #9
  %333 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %308) #9
  %334 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %309) #9
  %335 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %319) #9
  %336 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %320) #9
  %337 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %321) #9
  %338 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %322) #9
  %339 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %323) #9
  %340 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %324) #9
  %341 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %325) #9
  %342 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %326) #9
  %343 = fmul float %275, %327
  %344 = fmul float %276, %328
  %345 = fmul float %277, %329
  %346 = fmul float %278, %330
  %347 = fmul float %279, %331
  %348 = fmul float %280, %332
  %349 = fmul float %281, %333
  %350 = fmul float %282, %334
  %351 = fmul float %283, %335
  %352 = fmul float %284, %336
  %353 = fmul float %285, %337
  %354 = fmul float %286, %338
  %355 = fmul float %287, %339
  %356 = fmul float %288, %340
  %357 = fmul float %289, %341
  %358 = fmul float %290, %342
  %359 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %343) #9
  %360 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %344) #9
  %361 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %345) #9
  %362 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %346) #9
  %363 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %347) #9
  %364 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %348) #9
  %365 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %349) #9
  %366 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %350) #9
  %367 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %351) #9
  %368 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %352) #9
  %369 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %353) #9
  %370 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %354) #9
  %371 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %355) #9
  %372 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %356) #9
  %373 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %357) #9
  %374 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %358) #9
  %375 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %3
  %376 = getelementptr bfloat, ptr addrspace(1) %375, i64 %13
  %377 = getelementptr i8, ptr addrspace(1) %376, i64 1024
  %378 = insertelement <2 x bfloat> poison, bfloat %359, i64 0
  %379 = insertelement <2 x bfloat> %378, bfloat %360, i64 1
  %380 = bitcast <2 x bfloat> %379 to i32
  %381 = insertelement <2 x bfloat> poison, bfloat %361, i64 0
  %382 = insertelement <2 x bfloat> %381, bfloat %362, i64 1
  %383 = bitcast <2 x bfloat> %382 to i32
  %384 = insertelement <2 x bfloat> poison, bfloat %363, i64 0
  %385 = insertelement <2 x bfloat> %384, bfloat %364, i64 1
  %386 = bitcast <2 x bfloat> %385 to i32
  %387 = insertelement <2 x bfloat> poison, bfloat %365, i64 0
  %388 = insertelement <2 x bfloat> %387, bfloat %366, i64 1
  %389 = bitcast <2 x bfloat> %388 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %380, i32 %383, i32 %386, i32 %389, ptr addrspace(1) %376) #9
  %390 = insertelement <2 x bfloat> poison, bfloat %367, i64 0
  %391 = insertelement <2 x bfloat> %390, bfloat %368, i64 1
  %392 = bitcast <2 x bfloat> %391 to i32
  %393 = insertelement <2 x bfloat> poison, bfloat %369, i64 0
  %394 = insertelement <2 x bfloat> %393, bfloat %370, i64 1
  %395 = bitcast <2 x bfloat> %394 to i32
  %396 = insertelement <2 x bfloat> poison, bfloat %371, i64 0
  %397 = insertelement <2 x bfloat> %396, bfloat %372, i64 1
  %398 = bitcast <2 x bfloat> %397 to i32
  %399 = insertelement <2 x bfloat> poison, bfloat %373, i64 0
  %400 = insertelement <2 x bfloat> %399, bfloat %374, i64 1
  %401 = bitcast <2 x bfloat> %400 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %392, i32 %395, i32 %398, i32 %401, ptr addrspace(1) %377) #9
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @wrapped_slice(ptr noalias readonly align 128 captures(none) dereferenceable(524288) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(131072) %1) local_unnamed_addr #0 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %7 = shl nuw nsw i32 %6, 7
  %8 = and i32 %7, 896
  %9 = shl nuw nsw i32 %6, 9
  %10 = and i32 %9, 258048
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

define ptx_kernel void @triton_softmax_3_0(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(524288) %arg1, ptr noalias align 128 dereferenceable(262144) %arg2) local_unnamed_addr #5 {
  %arg219 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg117 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg015 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %3 = shl nsw i64 %2, 9
  %4 = and i64 %3, 512
  %5 = shl nsw i64 %2, 11
  %6 = or disjoint i64 %5, %4
  %7 = or i64 %6, 2048
  %8 = getelementptr bfloat, ptr addrspace(1) %arg117, i64 %7
  %9 = tail call range(i32 0, 64) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %10 = shl nuw nsw i32 %9, 3
  %11 = and i32 %10, 248
  %12 = icmp samesign ugt i32 %9, 31
  %13 = select i1 %12, i32 256, i32 0
  %14 = or disjoint i32 %11, %13
  %15 = zext nneg i32 %14 to i64
  %16 = getelementptr bfloat, ptr addrspace(1) %8, i64 %15
  %17 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %16) #9
  %18 = extractvalue { i32, i32, i32, i32 } %17, 0
  %19 = bitcast i32 %18 to <2 x bfloat>
  %20 = extractvalue { i32, i32, i32, i32 } %17, 1
  %21 = bitcast i32 %20 to <2 x bfloat>
  %22 = extractvalue { i32, i32, i32, i32 } %17, 2
  %23 = bitcast i32 %22 to <2 x bfloat>
  %24 = extractvalue { i32, i32, i32, i32 } %17, 3
  %25 = bitcast i32 %24 to <2 x bfloat>
  %26 = extractelement <2 x bfloat> %19, i64 0
  %27 = extractelement <2 x bfloat> %19, i64 1
  %28 = extractelement <2 x bfloat> %21, i64 0
  %29 = extractelement <2 x bfloat> %21, i64 1
  %30 = extractelement <2 x bfloat> %23, i64 0
  %31 = extractelement <2 x bfloat> %23, i64 1
  %32 = extractelement <2 x bfloat> %25, i64 0
  %33 = extractelement <2 x bfloat> %25, i64 1
  %34 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %26) #9
  %35 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #9
  %36 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #9
  %37 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #9
  %38 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #9
  %39 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #9
  %40 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #9
  %41 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #9
  %42 = fmul float %34, %34
  %43 = fmul float %35, %35
  %44 = fmul float %36, %36
  %45 = fmul float %37, %37
  %46 = fmul float %38, %38
  %47 = fmul float %39, %39
  %48 = fmul float %40, %40
  %49 = fmul float %41, %41
  %50 = fadd float %42, %43
  %51 = fadd float %50, %44
  %52 = fadd float %51, %45
  %53 = fadd float %52, %46
  %54 = fadd float %53, %47
  %55 = fadd float %54, %48
  %56 = fadd float %55, %49
  %57 = bitcast float %56 to i32
  %58 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %57, i32 8, i32 31)
  %59 = bitcast i32 %58 to float
  %60 = fadd float %56, %59
  %61 = bitcast float %60 to i32
  %62 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %61, i32 4, i32 31)
  %63 = bitcast i32 %62 to float
  %64 = fadd float %60, %63
  %65 = bitcast float %64 to i32
  %66 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %65, i32 2, i32 31)
  %67 = bitcast i32 %66 to float
  %68 = fadd float %64, %67
  %69 = bitcast float %68 to i32
  %70 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %69, i32 1, i32 31)
  %71 = bitcast i32 %70 to float
  %72 = fadd float %68, %71
  %73 = fmul float %72, 7.812500e-03
  %74 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg015) #9
  %75 = bitcast i32 %74 to float
  %76 = fadd float %73, %75
  %77 = tail call float @llvm.nvvm.rsqrt.approx.f(float %76)
  %78 = fmul float %34, %77
  %79 = fmul float %35, %77
  %80 = fmul float %36, %77
  %81 = fmul float %37, %77
  %82 = fmul float %38, %77
  %83 = fmul float %39, %77
  %84 = fmul float %40, %77
  %85 = fmul float %41, %77
  %86 = getelementptr i8, ptr addrspace(1) %arg219, i64 %5
  %87 = select i1 %12, i64 128, i64 0
  %88 = select i1 %12, i64 384, i64 256
  %89 = shl nuw nsw i32 %9, 2
  %90 = and i32 %89, 124
  %91 = zext nneg i32 %90 to i64
  %92 = or disjoint i64 %87, %91
  %93 = or disjoint i64 %88, %91
  %94 = getelementptr float, ptr addrspace(1) %86, i64 %92
  %95 = getelementptr float, ptr addrspace(1) %86, i64 %93
  %96 = select i1 %12, i32 128, i32 0
  %97 = or disjoint i32 %90, %96
  %98 = lshr i32 %14, 4
  %99 = and i32 %98, 24
  %100 = add nuw nsw i32 %99, %14
  %101 = zext nneg i32 %100 to i64
  %102 = getelementptr inbounds nuw float, ptr addrspace(3) @global_smem, i64 %101
  %103 = bitcast float %78 to i32
  %104 = bitcast float %79 to i32
  %105 = bitcast float %80 to i32
  %106 = bitcast float %81 to i32
  %107 = bitcast float %82 to i32
  %108 = bitcast float %83 to i32
  %109 = bitcast float %84 to i32
  %110 = bitcast float %85 to i32
  tail call void asm sideeffect "@$5 st.shared.v4.b32 [ $0 + 0 ], { $1, $2, $3, $4 };", "r,r,r,r,r,b"(ptr addrspace(3) %102, i32 %103, i32 %104, i32 %105, i32 %106, i1 true) #9
  %111 = getelementptr inbounds nuw i8, ptr addrspace(3) %102, i64 16
  tail call void asm sideeffect "@$5 st.shared.v4.b32 [ $0 + 0 ], { $1, $2, $3, $4 };", "r,r,r,r,r,b"(ptr addrspace(3) nonnull %111, i32 %107, i32 %108, i32 %109, i32 %110, i1 true) #9
  tail call void @llvm.nvvm.barrier0()
  %112 = lshr exact i32 %96, 4
  %113 = add nuw nsw i32 %112, %97
  %114 = zext nneg i32 %113 to i64
  %115 = getelementptr inbounds nuw float, ptr addrspace(3) @global_smem, i64 %114
  %116 = or disjoint i32 %97, 256
  %117 = lshr i32 %116, 4
  %118 = and i32 %117, 24
  %119 = zext nneg i32 %118 to i64
  %120 = zext nneg i32 %97 to i64
  %121 = add i64 %119, %120
  %122 = getelementptr float, ptr addrspace(3) @global_smem, i64 %121
  %123 = getelementptr inbounds i8, ptr addrspace(3) %122, i64 1024
  %124 = load <4 x i32>, ptr addrspace(3) %123, align 16
  %125 = load <4 x i32>, ptr addrspace(3) %115, align 16
  %.extract21 = extractelement <4 x i32> %125, i32 0
  %.extract822 = extractelement <4 x i32> %125, i32 1
  %.extract923 = extractelement <4 x i32> %125, i32 2
  %.extract1024 = extractelement <4 x i32> %125, i32 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract21, i32 %.extract822, i32 %.extract923, i32 %.extract1024, ptr addrspace(1) %94) #9
  %.extract11 = extractelement <4 x i32> %124, i64 0
  %.extract12 = extractelement <4 x i32> %124, i64 1
  %.extract13 = extractelement <4 x i32> %124, i64 2
  %.extract14 = extractelement <4 x i32> %124, i64 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract11, i32 %.extract12, i32 %.extract13, i32 %.extract14, ptr addrspace(1) %95) #9
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite)
define ptx_kernel void @input_concatenate_fusion(ptr noalias readonly align 128 captures(none) dereferenceable(262144) %0, ptr noalias readonly align 16 captures(none) dereferenceable(256) %1, ptr noalias readonly align 16 captures(none) dereferenceable(10485760) %2, ptr noalias readonly align 16 captures(none) dereferenceable(256) %3, ptr noalias writeonly align 128 captures(none) dereferenceable(131072) %4) local_unnamed_addr #6 {
  %6 = addrspacecast ptr %4 to ptr addrspace(1)
  %7 = addrspacecast ptr %3 to ptr addrspace(1)
  %8 = addrspacecast ptr %2 to ptr addrspace(1)
  %9 = addrspacecast ptr %1 to ptr addrspace(1)
  %10 = addrspacecast ptr %0 to ptr addrspace(1)
  %11 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %12 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !14
  %13 = lshr i32 %12, 2
  %14 = and i32 %11, 63
  %15 = shl nuw nsw i32 %11, 1
  %16 = and i32 %15, 128
  %17 = shl nuw nsw i32 %12, 8
  %18 = or disjoint i32 %16, %17
  %19 = or disjoint i32 %18, %14
  %20 = zext nneg i32 %19 to i64
  %21 = getelementptr float, ptr addrspace(1) %10, i64 %20
  %22 = load float, ptr addrspace(1) %21, align 4, !invariant.load !6
  %23 = zext nneg i32 %14 to i64
  %24 = getelementptr inbounds bfloat, ptr addrspace(1) %9, i64 %23
  %25 = load bfloat, ptr addrspace(1) %24, align 2, !invariant.load !6
  %26 = fpext bfloat %25 to float
  %27 = fmul float %22, %26
  tail call void @llvm.experimental.noalias.scope.decl(metadata !15)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !18)
  %28 = zext nneg i32 %13 to i64
  %29 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %28
  %30 = load i32, ptr addrspace(1) %29, align 4, !invariant.load !6, !alias.scope !18, !noalias !15
  %31 = tail call i32 @llvm.smin.i32(i32 %30, i32 40959)
  %32 = tail call i32 @llvm.smax.i32(i32 %31, i32 0)
  %33 = shl nuw nsw i32 %32, 7
  %34 = or disjoint i32 %33, %14
  %35 = zext nneg i32 %34 to i64
  %36 = getelementptr inbounds bfloat, ptr addrspace(1) %8, i64 %35
  %37 = load bfloat, ptr addrspace(1) %36, align 2, !invariant.load !6, !alias.scope !15, !noalias !18
  %38 = fpext bfloat %37 to float
  %39 = fmul float %27, %38
  %40 = or i32 %11, 64
  %41 = getelementptr inbounds i8, ptr addrspace(1) %21, i64 256
  %42 = load float, ptr addrspace(1) %41, align 4, !invariant.load !6
  %43 = zext nneg i32 %40 to i64
  %44 = getelementptr inbounds bfloat, ptr addrspace(1) %9, i64 %43
  %45 = load bfloat, ptr addrspace(1) %44, align 2, !invariant.load !6
  %46 = fpext bfloat %45 to float
  %47 = fmul float %42, %46
  %48 = or disjoint i32 %33, %40
  %49 = zext nneg i32 %48 to i64
  %50 = getelementptr inbounds bfloat, ptr addrspace(1) %8, i64 %49
  %51 = load bfloat, ptr addrspace(1) %50, align 2, !invariant.load !6, !alias.scope !20, !noalias !23
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
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !25
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
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !25
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
!5 = !{i32 0, i32 512}
!6 = !{}
!7 = !{i32 0, i32 1536}
!8 = !{!9}
!9 = distinct !{!9, !10, !"fused_convert_param_0_103: argument 0"}
!10 = distinct !{!10, !"fused_convert_param_0_103"}
!11 = !{!12}
!12 = distinct !{!12, !13, !"fused_convert_param_0_103: argument 0"}
!13 = distinct !{!13, !"fused_convert_param_0_103"}
!14 = !{i32 0, i32 256}
!15 = !{!16}
!16 = distinct !{!16, !17, !"fused_concatenate_convert_136_7: argument 0"}
!17 = distinct !{!17, !"fused_concatenate_convert_136_7"}
!18 = !{!19}
!19 = distinct !{!19, !17, !"fused_concatenate_convert_136_7: argument 1"}
!20 = !{!21}
!21 = distinct !{!21, !22, !"fused_concatenate_convert_136_7: argument 0"}
!22 = distinct !{!22, !"fused_concatenate_convert_136_7"}
!23 = !{!24}
!24 = distinct !{!24, !22, !"fused_concatenate_convert_136_7: argument 1"}
!25 = !{i32 0, i32 135456}

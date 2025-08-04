; ModuleID = 'SyncTensorsGraph.219'
source_filename = "SyncTensorsGraph.219"
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

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #2

define ptx_kernel void @gemm_fusion_dot_29_0(ptr noalias align 16 dereferenceable(4194304) %arg0, ptr noalias align 128 dereferenceable(32768) %arg1) local_unnamed_addr #3 {
  %arg128 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg026 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %.frozen = freeze i32 %1
  %2 = sdiv i32 %.frozen, 8
  %3 = shl nsw i32 %2, 3
  %4 = sub i32 64, %3
  %5 = tail call i32 @llvm.smin.i32(i32 %4, i32 8)
  %6 = srem i32 %1, %5
  %7 = add i32 %3, %6
  %8 = shl i32 %7, 4
  %9 = sext i32 %8 to i64
  %10 = tail call range(i32 0, 128) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %11 = and i32 %10, 32
  %.not = icmp eq i32 %11, 0
  %.lobit = lshr i32 %11, 5
  %12 = icmp samesign ult i32 %10, 64
  %13 = select i1 %12, i32 0, i32 2
  %14 = or disjoint i32 %.lobit, %13
  %15 = or disjoint i32 %14, 4
  %16 = or disjoint i32 %14, 8
  %17 = or disjoint i32 %14, 12
  %18 = zext nneg i32 %14 to i64
  %19 = zext nneg i32 %15 to i64
  %20 = zext nneg i32 %16 to i64
  %21 = zext nneg i32 %17 to i64
  %22 = or disjoint i64 %9, %18
  %23 = or disjoint i64 %9, %19
  %24 = or disjoint i64 %9, %20
  %25 = or disjoint i64 %9, %21
  %26 = and i32 %10, 1
  %27 = icmp eq i32 %26, 0
  %28 = and i32 %10, 2
  %29 = icmp eq i32 %28, 0
  %30 = shl i32 %10, 3
  %31 = and i32 %30, 24
  %32 = and i32 %10, 4
  %.not5 = icmp eq i32 %32, 0
  %33 = shl i32 %32, 3
  %34 = or disjoint i32 %31, %33
  %35 = and i32 %10, 8
  %36 = shl i32 %35, 3
  %37 = or disjoint i32 %34, %36
  %38 = and i32 %10, 16
  %39 = shl i32 %38, 3
  %40 = or disjoint i32 %37, %39
  %41 = zext nneg i32 %40 to i64
  %.idx7 = shl nsw i64 %22, 12
  %42 = getelementptr i8, ptr addrspace(1) %arg026, i64 %.idx7
  %43 = getelementptr bfloat, ptr addrspace(1) %42, i64 %41
  %.idx8 = shl nsw i64 %23, 12
  %44 = getelementptr i8, ptr addrspace(1) %arg026, i64 %.idx8
  %45 = getelementptr bfloat, ptr addrspace(1) %44, i64 %41
  %.idx9 = shl nsw i64 %24, 12
  %46 = getelementptr i8, ptr addrspace(1) %arg026, i64 %.idx9
  %47 = getelementptr bfloat, ptr addrspace(1) %46, i64 %41
  %.idx10 = shl nsw i64 %25, 12
  %48 = getelementptr i8, ptr addrspace(1) %arg026, i64 %.idx10
  %49 = getelementptr bfloat, ptr addrspace(1) %48, i64 %41
  %50 = select i1 %.not, i32 0, i32 264
  %51 = select i1 %12, i32 0, i32 528
  %52 = or disjoint i32 %50, %51
  %53 = xor i32 %52, %40
  %54 = zext nneg i32 %53 to i64
  %55 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %54
  %56 = or disjoint i32 %31, 1056
  %57 = xor i32 %56, %33
  %58 = or disjoint i32 %36, %57
  %59 = or disjoint i32 %58, %39
  %60 = xor i32 %52, %59
  %61 = zext nneg i32 %60 to i64
  %62 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %61
  %63 = or disjoint i32 %40, 2048
  %64 = xor i32 %52, %63
  %65 = zext nneg i32 %64 to i64
  %66 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %65
  %67 = or disjoint i32 %31, 3104
  %68 = xor i32 %67, %33
  %69 = or disjoint i32 %36, %68
  %70 = or disjoint i32 %69, %39
  %71 = xor i32 %52, %70
  %72 = zext nneg i32 %71 to i64
  %73 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %72
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %55, ptr addrspace(1) %43, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %62, ptr addrspace(1) %45, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %66, ptr addrspace(1) %47, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %73, ptr addrspace(1) %49, i32 16) #10
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #10
  %74 = getelementptr i8, ptr addrspace(1) %43, i64 512
  %75 = getelementptr i8, ptr addrspace(1) %45, i64 512
  %76 = getelementptr i8, ptr addrspace(1) %47, i64 512
  %77 = getelementptr i8, ptr addrspace(1) %49, i64 512
  tail call void @llvm.nvvm.barrier0()
  %78 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 8192), i64 %54
  %79 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 8192), i64 %61
  %80 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 8192), i64 %65
  %81 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 8192), i64 %72
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %78, ptr addrspace(1) %74, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %79, ptr addrspace(1) %75, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %80, ptr addrspace(1) %76, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %81, ptr addrspace(1) %77, i32 16) #10
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #10
  tail call void asm sideeffect "cp.async.wait_group 0x1;", ""() #10
  tail call void @llvm.nvvm.barrier0()
  %82 = select i1 %27, i32 0, i32 264
  %83 = select i1 %29, i32 0, i32 528
  %84 = or disjoint i32 %82, %83
  %85 = select i1 %.not5, i32 0, i32 1056
  %86 = shl nuw nsw i32 %35, 8
  %87 = or disjoint i32 %85, %86
  %88 = or disjoint i32 %87, %84
  %89 = lshr exact i32 %38, 1
  %90 = xor i32 %88, %89
  %91 = zext nneg i32 %90 to i64
  %92 = or disjoint i32 %82, 16
  %93 = xor i32 %92, %83
  %94 = or disjoint i32 %86, %93
  %95 = or disjoint i32 %94, %85
  %96 = xor i32 %95, %89
  %97 = zext nneg i32 %96 to i64
  %98 = or disjoint i32 %84, 32
  %99 = xor i32 %98, %85
  %100 = or disjoint i32 %99, %86
  %101 = xor i32 %100, %89
  %102 = zext nneg i32 %101 to i64
  %103 = or disjoint i32 %82, 48
  %104 = or disjoint i32 %85, %83
  %105 = xor i32 %104, %103
  %106 = or disjoint i32 %105, %86
  %107 = xor i32 %106, %89
  %108 = zext nneg i32 %107 to i64
  %109 = or disjoint i32 %88, 64
  %110 = xor i32 %109, %89
  %111 = zext nneg i32 %110 to i64
  %112 = or disjoint i32 %82, 80
  %113 = xor i32 %112, %83
  %114 = or disjoint i32 %86, %113
  %115 = or disjoint i32 %114, %85
  %116 = xor i32 %115, %89
  %117 = zext nneg i32 %116 to i64
  %118 = or disjoint i32 %84, 96
  %119 = xor i32 %118, %85
  %120 = or disjoint i32 %119, %86
  %121 = xor i32 %120, %89
  %122 = zext nneg i32 %121 to i64
  %123 = or disjoint i32 %82, 112
  %124 = xor i32 %104, %123
  %125 = or disjoint i32 %124, %86
  %126 = xor i32 %125, %89
  %127 = zext nneg i32 %126 to i64
  %128 = or disjoint i32 %88, 128
  %129 = xor i32 %128, %89
  %130 = zext nneg i32 %129 to i64
  %131 = or disjoint i32 %82, 144
  %132 = xor i32 %131, %83
  %133 = or disjoint i32 %86, %132
  %134 = or disjoint i32 %133, %85
  %135 = xor i32 %134, %89
  %136 = zext nneg i32 %135 to i64
  %137 = or disjoint i32 %84, 160
  %138 = xor i32 %137, %85
  %139 = or disjoint i32 %138, %86
  %140 = xor i32 %139, %89
  %141 = zext nneg i32 %140 to i64
  %142 = or disjoint i32 %82, 176
  %143 = xor i32 %104, %142
  %144 = or disjoint i32 %143, %86
  %145 = xor i32 %144, %89
  %146 = zext nneg i32 %145 to i64
  %147 = or disjoint i32 %88, 192
  %148 = xor i32 %147, %89
  %149 = zext nneg i32 %148 to i64
  %150 = or disjoint i32 %82, 208
  %151 = xor i32 %150, %83
  %152 = or disjoint i32 %86, %151
  %153 = or disjoint i32 %152, %85
  %154 = xor i32 %153, %89
  %155 = zext nneg i32 %154 to i64
  %156 = or disjoint i32 %84, 224
  %157 = xor i32 %156, %85
  %158 = or disjoint i32 %157, %86
  %159 = xor i32 %158, %89
  %160 = zext nneg i32 %159 to i64
  %161 = or disjoint i32 %82, 240
  %162 = xor i32 %104, %161
  %163 = or disjoint i32 %162, %86
  %164 = xor i32 %163, %89
  %165 = zext nneg i32 %164 to i64
  %166 = add i32 %39, %36
  %167 = add i32 %166, %33
  %168 = add i32 %167, %31
  %169 = zext nneg i32 %168 to i64
  %170 = shl nuw nsw i64 %169, 1
  %171 = add i32 %13, %.lobit
  %172 = add i32 %171, 12
  %173 = zext nneg i32 %172 to i64
  %174 = add i64 %9, %173
  %175 = shl nsw i64 %174, 12
  %176 = add nuw nsw i64 %175, 1024
  %scevgep = getelementptr i8, ptr addrspace(1) %arg026, i64 %176
  %177 = add i32 %171, 8
  %178 = zext nneg i32 %177 to i64
  %179 = add i64 %9, %178
  %180 = shl nsw i64 %179, 12
  %181 = add nuw nsw i64 %180, 1024
  %scevgep32 = getelementptr i8, ptr addrspace(1) %arg026, i64 %181
  %182 = add i32 %171, 4
  %183 = zext nneg i32 %182 to i64
  %184 = add i64 %9, %183
  %185 = shl nsw i64 %184, 12
  %186 = add nuw nsw i64 %185, 1024
  %scevgep36 = getelementptr i8, ptr addrspace(1) %arg026, i64 %186
  %187 = zext nneg i32 %171 to i64
  %188 = add i64 %9, %187
  %189 = shl nsw i64 %188, 12
  %190 = add nuw nsw i64 %189, 1024
  %scevgep40 = getelementptr i8, ptr addrspace(1) %arg026, i64 %190
  br label %191

191:                                              ; preds = %0, %191
  %lsr.iv44 = phi i32 [ -256, %0 ], [ %196, %191 ]
  %lsr.iv41 = phi ptr addrspace(1) [ %scevgep40, %0 ], [ %scevgep42, %191 ]
  %lsr.iv37 = phi ptr addrspace(1) [ %scevgep36, %0 ], [ %scevgep38, %191 ]
  %lsr.iv33 = phi ptr addrspace(1) [ %scevgep32, %0 ], [ %scevgep34, %191 ]
  %lsr.iv = phi ptr addrspace(1) [ %scevgep, %0 ], [ %scevgep30, %191 ]
  %192 = phi ptr addrspace(3) [ @global_smem, %0 ], [ %430, %191 ]
  %193 = phi i32 [ 0, %0 ], [ %427, %191 ]
  %194 = phi i32 [ 1, %0 ], [ %416, %191 ]
  %195 = phi { float, float, float, float } [ zeroinitializer, %0 ], [ %413, %191 ]
  %196 = add i32 %lsr.iv44, 256
  %197 = icmp samesign ult i32 %196, 1536
  %198 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %192, i64 %91
  %199 = ptrtoint ptr addrspace(3) %198 to i64
  %200 = trunc i64 %199 to i32
  %201 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %200) #10
  %202 = extractvalue { i32, i32, i32, i32 } %201, 0
  %203 = extractvalue { i32, i32, i32, i32 } %201, 1
  %204 = extractvalue { i32, i32, i32, i32 } %201, 2
  %205 = extractvalue { i32, i32, i32, i32 } %201, 3
  %206 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %192, i64 %97
  %207 = ptrtoint ptr addrspace(3) %206 to i64
  %208 = trunc i64 %207 to i32
  %209 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %208) #10
  %210 = extractvalue { i32, i32, i32, i32 } %209, 0
  %211 = extractvalue { i32, i32, i32, i32 } %209, 1
  %212 = extractvalue { i32, i32, i32, i32 } %209, 2
  %213 = extractvalue { i32, i32, i32, i32 } %209, 3
  %214 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %192, i64 %102
  %215 = ptrtoint ptr addrspace(3) %214 to i64
  %216 = trunc i64 %215 to i32
  %217 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %216) #10
  %218 = extractvalue { i32, i32, i32, i32 } %217, 0
  %219 = extractvalue { i32, i32, i32, i32 } %217, 1
  %220 = extractvalue { i32, i32, i32, i32 } %217, 2
  %221 = extractvalue { i32, i32, i32, i32 } %217, 3
  %222 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %192, i64 %108
  %223 = ptrtoint ptr addrspace(3) %222 to i64
  %224 = trunc i64 %223 to i32
  %225 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %224) #10
  %226 = extractvalue { i32, i32, i32, i32 } %225, 0
  %227 = extractvalue { i32, i32, i32, i32 } %225, 1
  %228 = extractvalue { i32, i32, i32, i32 } %225, 2
  %229 = extractvalue { i32, i32, i32, i32 } %225, 3
  %230 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %192, i64 %111
  %231 = ptrtoint ptr addrspace(3) %230 to i64
  %232 = trunc i64 %231 to i32
  %233 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %232) #10
  %234 = extractvalue { i32, i32, i32, i32 } %233, 0
  %235 = extractvalue { i32, i32, i32, i32 } %233, 1
  %236 = extractvalue { i32, i32, i32, i32 } %233, 2
  %237 = extractvalue { i32, i32, i32, i32 } %233, 3
  %238 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %192, i64 %117
  %239 = ptrtoint ptr addrspace(3) %238 to i64
  %240 = trunc i64 %239 to i32
  %241 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %240) #10
  %242 = extractvalue { i32, i32, i32, i32 } %241, 0
  %243 = extractvalue { i32, i32, i32, i32 } %241, 1
  %244 = extractvalue { i32, i32, i32, i32 } %241, 2
  %245 = extractvalue { i32, i32, i32, i32 } %241, 3
  %246 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %192, i64 %122
  %247 = ptrtoint ptr addrspace(3) %246 to i64
  %248 = trunc i64 %247 to i32
  %249 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %248) #10
  %250 = extractvalue { i32, i32, i32, i32 } %249, 0
  %251 = extractvalue { i32, i32, i32, i32 } %249, 1
  %252 = extractvalue { i32, i32, i32, i32 } %249, 2
  %253 = extractvalue { i32, i32, i32, i32 } %249, 3
  %254 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %192, i64 %127
  %255 = ptrtoint ptr addrspace(3) %254 to i64
  %256 = trunc i64 %255 to i32
  %257 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %256) #10
  %258 = extractvalue { i32, i32, i32, i32 } %257, 0
  %259 = extractvalue { i32, i32, i32, i32 } %257, 1
  %260 = extractvalue { i32, i32, i32, i32 } %257, 2
  %261 = extractvalue { i32, i32, i32, i32 } %257, 3
  %262 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %192, i64 %130
  %263 = ptrtoint ptr addrspace(3) %262 to i64
  %264 = trunc i64 %263 to i32
  %265 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %264) #10
  %266 = extractvalue { i32, i32, i32, i32 } %265, 0
  %267 = extractvalue { i32, i32, i32, i32 } %265, 1
  %268 = extractvalue { i32, i32, i32, i32 } %265, 2
  %269 = extractvalue { i32, i32, i32, i32 } %265, 3
  %270 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %192, i64 %136
  %271 = ptrtoint ptr addrspace(3) %270 to i64
  %272 = trunc i64 %271 to i32
  %273 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %272) #10
  %274 = extractvalue { i32, i32, i32, i32 } %273, 0
  %275 = extractvalue { i32, i32, i32, i32 } %273, 1
  %276 = extractvalue { i32, i32, i32, i32 } %273, 2
  %277 = extractvalue { i32, i32, i32, i32 } %273, 3
  %278 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %192, i64 %141
  %279 = ptrtoint ptr addrspace(3) %278 to i64
  %280 = trunc i64 %279 to i32
  %281 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %280) #10
  %282 = extractvalue { i32, i32, i32, i32 } %281, 0
  %283 = extractvalue { i32, i32, i32, i32 } %281, 1
  %284 = extractvalue { i32, i32, i32, i32 } %281, 2
  %285 = extractvalue { i32, i32, i32, i32 } %281, 3
  %286 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %192, i64 %146
  %287 = ptrtoint ptr addrspace(3) %286 to i64
  %288 = trunc i64 %287 to i32
  %289 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %288) #10
  %290 = extractvalue { i32, i32, i32, i32 } %289, 0
  %291 = extractvalue { i32, i32, i32, i32 } %289, 1
  %292 = extractvalue { i32, i32, i32, i32 } %289, 2
  %293 = extractvalue { i32, i32, i32, i32 } %289, 3
  %294 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %192, i64 %149
  %295 = ptrtoint ptr addrspace(3) %294 to i64
  %296 = trunc i64 %295 to i32
  %297 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %296) #10
  %298 = extractvalue { i32, i32, i32, i32 } %297, 0
  %299 = extractvalue { i32, i32, i32, i32 } %297, 1
  %300 = extractvalue { i32, i32, i32, i32 } %297, 2
  %301 = extractvalue { i32, i32, i32, i32 } %297, 3
  %302 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %192, i64 %155
  %303 = ptrtoint ptr addrspace(3) %302 to i64
  %304 = trunc i64 %303 to i32
  %305 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %304) #10
  %306 = extractvalue { i32, i32, i32, i32 } %305, 0
  %307 = extractvalue { i32, i32, i32, i32 } %305, 1
  %308 = extractvalue { i32, i32, i32, i32 } %305, 2
  %309 = extractvalue { i32, i32, i32, i32 } %305, 3
  %310 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %192, i64 %160
  %311 = ptrtoint ptr addrspace(3) %310 to i64
  %312 = trunc i64 %311 to i32
  %313 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %312) #10
  %314 = extractvalue { i32, i32, i32, i32 } %313, 0
  %315 = extractvalue { i32, i32, i32, i32 } %313, 1
  %316 = extractvalue { i32, i32, i32, i32 } %313, 2
  %317 = extractvalue { i32, i32, i32, i32 } %313, 3
  %318 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %192, i64 %165
  %319 = ptrtoint ptr addrspace(3) %318 to i64
  %320 = trunc i64 %319 to i32
  %321 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %320) #10
  %322 = extractvalue { i32, i32, i32, i32 } %321, 0
  %323 = extractvalue { i32, i32, i32, i32 } %321, 1
  %324 = extractvalue { i32, i32, i32, i32 } %321, 2
  %325 = extractvalue { i32, i32, i32, i32 } %321, 3
  %326 = extractvalue { float, float, float, float } %195, 0
  %327 = extractvalue { float, float, float, float } %195, 1
  %328 = extractvalue { float, float, float, float } %195, 2
  %329 = extractvalue { float, float, float, float } %195, 3
  %330 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %326, float %327, float %328, float %329, i32 %202, i32 %203, i32 %204, i32 %205, i32 0, i32 0) #10
  %331 = extractvalue { float, float, float, float } %330, 0
  %332 = extractvalue { float, float, float, float } %330, 1
  %333 = extractvalue { float, float, float, float } %330, 2
  %334 = extractvalue { float, float, float, float } %330, 3
  %335 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %331, float %332, float %333, float %334, i32 %210, i32 %211, i32 %212, i32 %213, i32 0, i32 0) #10
  %336 = extractvalue { float, float, float, float } %335, 0
  %337 = extractvalue { float, float, float, float } %335, 1
  %338 = extractvalue { float, float, float, float } %335, 2
  %339 = extractvalue { float, float, float, float } %335, 3
  %340 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %336, float %337, float %338, float %339, i32 %218, i32 %219, i32 %220, i32 %221, i32 0, i32 0) #10
  %341 = extractvalue { float, float, float, float } %340, 0
  %342 = extractvalue { float, float, float, float } %340, 1
  %343 = extractvalue { float, float, float, float } %340, 2
  %344 = extractvalue { float, float, float, float } %340, 3
  %345 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %341, float %342, float %343, float %344, i32 %226, i32 %227, i32 %228, i32 %229, i32 0, i32 0) #10
  %346 = extractvalue { float, float, float, float } %345, 0
  %347 = extractvalue { float, float, float, float } %345, 1
  %348 = extractvalue { float, float, float, float } %345, 2
  %349 = extractvalue { float, float, float, float } %345, 3
  %350 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %346, float %347, float %348, float %349, i32 %234, i32 %235, i32 %236, i32 %237, i32 0, i32 0) #10
  %351 = extractvalue { float, float, float, float } %350, 0
  %352 = extractvalue { float, float, float, float } %350, 1
  %353 = extractvalue { float, float, float, float } %350, 2
  %354 = extractvalue { float, float, float, float } %350, 3
  %355 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %351, float %352, float %353, float %354, i32 %242, i32 %243, i32 %244, i32 %245, i32 0, i32 0) #10
  %356 = extractvalue { float, float, float, float } %355, 0
  %357 = extractvalue { float, float, float, float } %355, 1
  %358 = extractvalue { float, float, float, float } %355, 2
  %359 = extractvalue { float, float, float, float } %355, 3
  %360 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %356, float %357, float %358, float %359, i32 %250, i32 %251, i32 %252, i32 %253, i32 0, i32 0) #10
  %361 = extractvalue { float, float, float, float } %360, 0
  %362 = extractvalue { float, float, float, float } %360, 1
  %363 = extractvalue { float, float, float, float } %360, 2
  %364 = extractvalue { float, float, float, float } %360, 3
  %365 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %361, float %362, float %363, float %364, i32 %258, i32 %259, i32 %260, i32 %261, i32 0, i32 0) #10
  %366 = extractvalue { float, float, float, float } %365, 0
  %367 = extractvalue { float, float, float, float } %365, 1
  %368 = extractvalue { float, float, float, float } %365, 2
  %369 = extractvalue { float, float, float, float } %365, 3
  %370 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %366, float %367, float %368, float %369, i32 %266, i32 %267, i32 %268, i32 %269, i32 0, i32 0) #10
  %371 = extractvalue { float, float, float, float } %370, 0
  %372 = extractvalue { float, float, float, float } %370, 1
  %373 = extractvalue { float, float, float, float } %370, 2
  %374 = extractvalue { float, float, float, float } %370, 3
  %375 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %371, float %372, float %373, float %374, i32 %274, i32 %275, i32 %276, i32 %277, i32 0, i32 0) #10
  %376 = extractvalue { float, float, float, float } %375, 0
  %377 = extractvalue { float, float, float, float } %375, 1
  %378 = extractvalue { float, float, float, float } %375, 2
  %379 = extractvalue { float, float, float, float } %375, 3
  %380 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %376, float %377, float %378, float %379, i32 %282, i32 %283, i32 %284, i32 %285, i32 0, i32 0) #10
  %381 = extractvalue { float, float, float, float } %380, 0
  %382 = extractvalue { float, float, float, float } %380, 1
  %383 = extractvalue { float, float, float, float } %380, 2
  %384 = extractvalue { float, float, float, float } %380, 3
  %385 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %381, float %382, float %383, float %384, i32 %290, i32 %291, i32 %292, i32 %293, i32 0, i32 0) #10
  %386 = extractvalue { float, float, float, float } %385, 0
  %387 = extractvalue { float, float, float, float } %385, 1
  %388 = extractvalue { float, float, float, float } %385, 2
  %389 = extractvalue { float, float, float, float } %385, 3
  %390 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %386, float %387, float %388, float %389, i32 %298, i32 %299, i32 %300, i32 %301, i32 0, i32 0) #10
  %391 = extractvalue { float, float, float, float } %390, 0
  %392 = extractvalue { float, float, float, float } %390, 1
  %393 = extractvalue { float, float, float, float } %390, 2
  %394 = extractvalue { float, float, float, float } %390, 3
  %395 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %391, float %392, float %393, float %394, i32 %306, i32 %307, i32 %308, i32 %309, i32 0, i32 0) #10
  %396 = extractvalue { float, float, float, float } %395, 0
  %397 = extractvalue { float, float, float, float } %395, 1
  %398 = extractvalue { float, float, float, float } %395, 2
  %399 = extractvalue { float, float, float, float } %395, 3
  %400 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %396, float %397, float %398, float %399, i32 %314, i32 %315, i32 %316, i32 %317, i32 0, i32 0) #10
  %401 = extractvalue { float, float, float, float } %400, 0
  %402 = extractvalue { float, float, float, float } %400, 1
  %403 = extractvalue { float, float, float, float } %400, 2
  %404 = extractvalue { float, float, float, float } %400, 3
  %405 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %401, float %402, float %403, float %404, i32 %322, i32 %323, i32 %324, i32 %325, i32 0, i32 0) #10
  %406 = extractvalue { float, float, float, float } %405, 0
  %407 = extractvalue { float, float, float, float } %405, 1
  %408 = extractvalue { float, float, float, float } %405, 2
  %409 = extractvalue { float, float, float, float } %405, 3
  %410 = insertvalue { float, float, float, float } undef, float %406, 0
  %411 = insertvalue { float, float, float, float } %410, float %407, 1
  %412 = insertvalue { float, float, float, float } %411, float %408, 2
  %413 = insertvalue { float, float, float, float } %412, float %409, 3
  %414 = add i32 %194, 1
  %415 = icmp slt i32 %414, 2
  %416 = select i1 %415, i32 %414, i32 0
  %scevgep43 = getelementptr i8, ptr addrspace(1) %lsr.iv41, i64 %170
  %scevgep39 = getelementptr i8, ptr addrspace(1) %lsr.iv37, i64 %170
  %scevgep35 = getelementptr i8, ptr addrspace(1) %lsr.iv33, i64 %170
  %scevgep31 = getelementptr i8, ptr addrspace(1) %lsr.iv, i64 %170
  %417 = shl i32 %416, 12
  %418 = sext i32 %417 to i64
  %419 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %418
  tail call void @llvm.nvvm.barrier0()
  %420 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %419, i64 %54
  %421 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %419, i64 %61
  %422 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %419, i64 %65
  %423 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %419, i64 %72
  %424 = select i1 %197, i32 16, i32 0
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %420, ptr addrspace(1) %scevgep43, i32 %424) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %421, ptr addrspace(1) %scevgep39, i32 %424) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %422, ptr addrspace(1) %scevgep35, i32 %424) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %423, ptr addrspace(1) %scevgep31, i32 %424) #10
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #10
  %425 = add i32 %193, 1
  %426 = icmp slt i32 %425, 2
  %427 = select i1 %426, i32 %425, i32 0
  tail call void asm sideeffect "cp.async.wait_group 0x1;", ""() #10
  tail call void @llvm.nvvm.barrier0()
  %428 = shl i32 %427, 12
  %429 = sext i32 %428 to i64
  %430 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %429
  %scevgep30 = getelementptr i8, ptr addrspace(1) %lsr.iv, i64 512
  %scevgep34 = getelementptr i8, ptr addrspace(1) %lsr.iv33, i64 512
  %scevgep38 = getelementptr i8, ptr addrspace(1) %lsr.iv37, i64 512
  %scevgep42 = getelementptr i8, ptr addrspace(1) %lsr.iv41, i64 512
  %431 = icmp samesign ult i32 %196, 1792
  br i1 %431, label %191, label %432

432:                                              ; preds = %191
  %433 = icmp ult i32 %10, 64
  %434 = mul i32 %2, 8
  %.decomposed = sub i32 %.frozen, %434
  %435 = sdiv i32 %.decomposed, %5
  tail call void asm sideeffect "cp.async.wait_group 0x0;", ""() #10
  tail call void @llvm.nvvm.barrier0()
  %436 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %406) #10
  %437 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %407) #10
  %438 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %408) #10
  %439 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %409) #10
  %440 = shl nsw i32 %435, 4
  %441 = sext i32 %440 to i64
  %442 = shl nuw nsw i32 %10, 1
  %443 = and i32 %442, 14
  %444 = lshr i32 %10, 3
  %445 = and i32 %444, 7
  %446 = select i1 %433, i32 0, i32 8
  %447 = or disjoint i32 %445, %446
  %448 = zext nneg i32 %443 to i64
  %449 = zext nneg i32 %447 to i64
  %450 = or disjoint i64 %9, %448
  %451 = or disjoint i64 %441, %449
  %452 = getelementptr bfloat, ptr addrspace(1) %arg128, i64 %450
  %.idx = shl nsw i64 %451, 11
  %453 = getelementptr i8, ptr addrspace(1) %452, i64 %.idx
  %454 = shl nuw nsw i32 %10, 5
  %455 = and i32 %454, 96
  %456 = lshr i32 %10, 2
  %457 = and i32 %456, 3
  %458 = or disjoint i32 %457, %455
  %459 = lshr exact i32 %38, 2
  %460 = or disjoint i32 %458, %459
  %461 = shl nuw nsw i32 %11, 2
  %462 = or disjoint i32 %460, %461
  %463 = and i32 %442, 126
  %464 = select i1 %433, i32 0, i32 128
  %465 = or disjoint i32 %463, %464
  %466 = lshr i32 %462, 3
  %467 = add nuw nsw i32 %466, %462
  %468 = zext nneg i32 %467 to i64
  %469 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %468
  %470 = bitcast bfloat %436 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %469, <1 x i16> %470, i1 true) #10
  %471 = or disjoint i32 %462, 16
  %472 = lshr i32 %471, 3
  %473 = zext nneg i32 %472 to i64
  %474 = zext nneg i32 %462 to i64
  %475 = add i64 %473, %474
  %476 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %475
  %477 = getelementptr inbounds i8, ptr addrspace(3) %476, i64 32
  %478 = bitcast bfloat %437 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %477, <1 x i16> %478, i1 true) #10
  %479 = zext nneg i32 %466 to i64
  %480 = add i64 %474, %479
  %481 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %480
  %482 = getelementptr inbounds i8, ptr addrspace(3) %481, i64 16
  %483 = bitcast bfloat %438 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %482, <1 x i16> %483, i1 true) #10
  %484 = or disjoint i32 %462, 24
  %485 = lshr i32 %484, 3
  %486 = and i32 %485, 536870910
  %487 = zext nneg i32 %486 to i64
  %488 = add i64 %487, %474
  %489 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %488
  %490 = getelementptr inbounds i8, ptr addrspace(3) %489, i64 48
  %491 = bitcast bfloat %439 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %490, <1 x i16> %491, i1 true) #10
  tail call void @llvm.nvvm.barrier0()
  %492 = lshr i32 %465, 3
  %493 = and i32 %492, 30
  %494 = add nuw nsw i32 %493, %465
  %495 = zext nneg i32 %494 to i64
  %496 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %495
  %497 = load i32, ptr addrspace(3) %496, align 4
  tail call void asm sideeffect "st.global.b32 [ $1 + 0 ], { $0 };", "r,l"(i32 %497, ptr addrspace(1) %453) #10
  ret void
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #4

define ptx_kernel void @fusion_23(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(32768) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4) local_unnamed_addr #5 {
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %3 = shl nsw i64 %2, 8
  %4 = and i64 %3, 768
  %5 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %3
  %6 = tail call range(i32 0, 64) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %7 = and i32 %6, 31
  %8 = lshr i32 %6, 5
  %9 = shl nuw nsw i32 %6, 2
  %10 = and i32 %9, 124
  %11 = icmp samesign ult i32 %6, 32
  %12 = select i1 %11, i32 0, i32 128
  %13 = or disjoint i32 %10, %12
  %14 = zext nneg i32 %13 to i64
  %15 = getelementptr bfloat, ptr addrspace(1) %5, i64 %14
  %16 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %15) #10
  %17 = extractvalue { i32, i32 } %16, 0
  %18 = bitcast i32 %17 to <2 x bfloat>
  %19 = extractvalue { i32, i32 } %16, 1
  %20 = bitcast i32 %19 to <2 x bfloat>
  %21 = extractelement <2 x bfloat> %18, i64 0
  %22 = extractelement <2 x bfloat> %18, i64 1
  %23 = extractelement <2 x bfloat> %20, i64 0
  %24 = extractelement <2 x bfloat> %20, i64 1
  %25 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %21) #10
  %26 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %22) #10
  %27 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %23) #10
  %28 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %24) #10
  %29 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %3
  %30 = getelementptr bfloat, ptr addrspace(1) %29, i64 %14
  %31 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %30) #10
  %32 = extractvalue { i32, i32 } %31, 0
  %33 = bitcast i32 %32 to <2 x bfloat>
  %34 = extractvalue { i32, i32 } %31, 1
  %35 = bitcast i32 %34 to <2 x bfloat>
  %36 = extractelement <2 x bfloat> %33, i64 0
  %37 = extractelement <2 x bfloat> %33, i64 1
  %38 = extractelement <2 x bfloat> %35, i64 0
  %39 = extractelement <2 x bfloat> %35, i64 1
  %40 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %36) #10
  %41 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %37) #10
  %42 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %38) #10
  %43 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %39) #10
  %44 = fadd float %25, %40
  %45 = fadd float %26, %41
  %46 = fadd float %27, %42
  %47 = fadd float %28, %43
  %48 = and i64 %3, -1024
  %49 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %48
  %50 = shl nuw nsw i32 %6, 3
  %51 = and i32 %50, 248
  %52 = select i1 %11, i32 0, i32 256
  %53 = or disjoint i32 %51, %52
  %54 = zext nneg i32 %53 to i64
  %55 = getelementptr bfloat, ptr addrspace(1) %49, i64 %54
  %56 = getelementptr i8, ptr addrspace(1) %55, i64 1024
  %57 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %55) #10
  %58 = extractvalue { i32, i32, i32, i32 } %57, 0
  %59 = bitcast i32 %58 to <2 x bfloat>
  %60 = extractvalue { i32, i32, i32, i32 } %57, 1
  %61 = bitcast i32 %60 to <2 x bfloat>
  %62 = extractvalue { i32, i32, i32, i32 } %57, 2
  %63 = bitcast i32 %62 to <2 x bfloat>
  %64 = extractvalue { i32, i32, i32, i32 } %57, 3
  %65 = bitcast i32 %64 to <2 x bfloat>
  %66 = extractelement <2 x bfloat> %59, i64 0
  %67 = extractelement <2 x bfloat> %59, i64 1
  %68 = extractelement <2 x bfloat> %61, i64 0
  %69 = extractelement <2 x bfloat> %61, i64 1
  %70 = extractelement <2 x bfloat> %63, i64 0
  %71 = extractelement <2 x bfloat> %63, i64 1
  %72 = extractelement <2 x bfloat> %65, i64 0
  %73 = extractelement <2 x bfloat> %65, i64 1
  %74 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %56) #10
  %75 = extractvalue { i32, i32, i32, i32 } %74, 0
  %76 = bitcast i32 %75 to <2 x bfloat>
  %77 = extractvalue { i32, i32, i32, i32 } %74, 1
  %78 = bitcast i32 %77 to <2 x bfloat>
  %79 = extractvalue { i32, i32, i32, i32 } %74, 2
  %80 = bitcast i32 %79 to <2 x bfloat>
  %81 = extractvalue { i32, i32, i32, i32 } %74, 3
  %82 = bitcast i32 %81 to <2 x bfloat>
  %83 = extractelement <2 x bfloat> %76, i64 0
  %84 = extractelement <2 x bfloat> %76, i64 1
  %85 = extractelement <2 x bfloat> %78, i64 0
  %86 = extractelement <2 x bfloat> %78, i64 1
  %87 = extractelement <2 x bfloat> %80, i64 0
  %88 = extractelement <2 x bfloat> %80, i64 1
  %89 = extractelement <2 x bfloat> %82, i64 0
  %90 = extractelement <2 x bfloat> %82, i64 1
  %91 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %66) #10
  %92 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %67) #10
  %93 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %68) #10
  %94 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %69) #10
  %95 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %70) #10
  %96 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %71) #10
  %97 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %72) #10
  %98 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %73) #10
  %99 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #10
  %100 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #10
  %101 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #10
  %102 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #10
  %103 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #10
  %104 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #10
  %105 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %89) #10
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %90) #10
  %107 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %48
  %108 = getelementptr bfloat, ptr addrspace(1) %107, i64 %54
  %109 = getelementptr i8, ptr addrspace(1) %108, i64 1024
  %110 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %108) #10
  %111 = extractvalue { i32, i32, i32, i32 } %110, 0
  %112 = bitcast i32 %111 to <2 x bfloat>
  %113 = extractvalue { i32, i32, i32, i32 } %110, 1
  %114 = bitcast i32 %113 to <2 x bfloat>
  %115 = extractvalue { i32, i32, i32, i32 } %110, 2
  %116 = bitcast i32 %115 to <2 x bfloat>
  %117 = extractvalue { i32, i32, i32, i32 } %110, 3
  %118 = bitcast i32 %117 to <2 x bfloat>
  %119 = extractelement <2 x bfloat> %112, i64 0
  %120 = extractelement <2 x bfloat> %112, i64 1
  %121 = extractelement <2 x bfloat> %114, i64 0
  %122 = extractelement <2 x bfloat> %114, i64 1
  %123 = extractelement <2 x bfloat> %116, i64 0
  %124 = extractelement <2 x bfloat> %116, i64 1
  %125 = extractelement <2 x bfloat> %118, i64 0
  %126 = extractelement <2 x bfloat> %118, i64 1
  %127 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %109) #10
  %128 = extractvalue { i32, i32, i32, i32 } %127, 0
  %129 = bitcast i32 %128 to <2 x bfloat>
  %130 = extractvalue { i32, i32, i32, i32 } %127, 1
  %131 = bitcast i32 %130 to <2 x bfloat>
  %132 = extractvalue { i32, i32, i32, i32 } %127, 2
  %133 = bitcast i32 %132 to <2 x bfloat>
  %134 = extractvalue { i32, i32, i32, i32 } %127, 3
  %135 = bitcast i32 %134 to <2 x bfloat>
  %136 = extractelement <2 x bfloat> %129, i64 0
  %137 = extractelement <2 x bfloat> %129, i64 1
  %138 = extractelement <2 x bfloat> %131, i64 0
  %139 = extractelement <2 x bfloat> %131, i64 1
  %140 = extractelement <2 x bfloat> %133, i64 0
  %141 = extractelement <2 x bfloat> %133, i64 1
  %142 = extractelement <2 x bfloat> %135, i64 0
  %143 = extractelement <2 x bfloat> %135, i64 1
  %144 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %119) #10
  %145 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %120) #10
  %146 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %121) #10
  %147 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %122) #10
  %148 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %123) #10
  %149 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %124) #10
  %150 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %125) #10
  %151 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %126) #10
  %152 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #10
  %153 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #10
  %154 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #10
  %155 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #10
  %156 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #10
  %157 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #10
  %158 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #10
  %159 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %143) #10
  %160 = fadd float %91, %144
  %161 = fadd float %92, %145
  %162 = fadd float %93, %146
  %163 = fadd float %94, %147
  %164 = fadd float %95, %148
  %165 = fadd float %96, %149
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
  %176 = fmul float %160, %160
  %177 = fmul float %161, %161
  %178 = fmul float %162, %162
  %179 = fmul float %163, %163
  %180 = fmul float %164, %164
  %181 = fmul float %165, %165
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
  %192 = fadd float %176, %177
  %193 = fadd float %192, %178
  %194 = fadd float %193, %179
  %195 = fadd float %194, %180
  %196 = fadd float %195, %181
  %197 = fadd float %196, %182
  %198 = fadd float %197, %183
  %199 = fadd float %198, %184
  %200 = fadd float %199, %185
  %201 = fadd float %200, %186
  %202 = fadd float %201, %187
  %203 = fadd float %202, %188
  %204 = fadd float %203, %189
  %205 = fadd float %204, %190
  %206 = fadd float %205, %191
  %207 = bitcast float %206 to i32
  %208 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %207, i32 16, i32 31)
  %209 = bitcast i32 %208 to float
  %210 = fadd float %206, %209
  %211 = bitcast float %210 to i32
  %212 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %211, i32 8, i32 31)
  %213 = bitcast i32 %212 to float
  %214 = fadd float %210, %213
  %215 = bitcast float %214 to i32
  %216 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %215, i32 4, i32 31)
  %217 = bitcast i32 %216 to float
  %218 = fadd float %214, %217
  %219 = bitcast float %218 to i32
  %220 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %219, i32 2, i32 31)
  %221 = bitcast i32 %220 to float
  %222 = fadd float %218, %221
  %223 = bitcast float %222 to i32
  %224 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %223, i32 1, i32 31)
  %225 = bitcast i32 %224 to float
  %226 = fadd float %222, %225
  %227 = icmp eq i32 %7, 0
  %228 = zext nneg i32 %8 to i64
  %229 = getelementptr float, ptr addrspace(3) @global_smem, i64 %228
  %230 = bitcast float %226 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %229, <1 x i32> %230, i1 %227) #10
  tail call void @llvm.nvvm.barrier0()
  %231 = icmp samesign ult i32 %6, 2
  %232 = zext nneg i32 %6 to i64
  %233 = getelementptr float, ptr addrspace(3) @global_smem, i64 %232
  %234 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %233, i1 %231) #10
  %235 = bitcast i32 %234 to float
  %236 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %234, i32 1, i32 31)
  %237 = bitcast i32 %236 to float
  %238 = fadd float %235, %237
  %239 = icmp eq i32 %6, 0
  %240 = bitcast float %238 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %233, <1 x i32> %240, i1 %239) #10
  tail call void @llvm.nvvm.barrier0()
  %241 = load float, ptr addrspace(3) @global_smem, align 16
  %242 = fmul float %241, 0x3F50000000000000
  %243 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
  %244 = bitcast i32 %243 to float
  %245 = fadd float %242, %244
  %246 = tail call float @llvm.nvvm.rsqrt.approx.f(float %245)
  %247 = fmul float %44, %246
  %248 = fmul float %45, %246
  %249 = fmul float %46, %246
  %250 = fmul float %47, %246
  %251 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %4
  %252 = getelementptr bfloat, ptr addrspace(1) %251, i64 %14
  %253 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %252) #10
  %254 = extractvalue { i32, i32 } %253, 0
  %255 = bitcast i32 %254 to <2 x bfloat>
  %256 = extractvalue { i32, i32 } %253, 1
  %257 = bitcast i32 %256 to <2 x bfloat>
  %258 = extractelement <2 x bfloat> %255, i64 0
  %259 = extractelement <2 x bfloat> %255, i64 1
  %260 = extractelement <2 x bfloat> %257, i64 0
  %261 = extractelement <2 x bfloat> %257, i64 1
  %262 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %258) #10
  %263 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259) #10
  %264 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #10
  %265 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #10
  %266 = fmul float %247, %262
  %267 = fmul float %248, %263
  %268 = fmul float %249, %264
  %269 = fmul float %250, %265
  %270 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %266) #10
  %271 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %267) #10
  %272 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %268) #10
  %273 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %269) #10
  %274 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %3
  %275 = getelementptr bfloat, ptr addrspace(1) %274, i64 %14
  %276 = insertelement <2 x bfloat> poison, bfloat %270, i64 0
  %277 = insertelement <2 x bfloat> %276, bfloat %271, i64 1
  %278 = bitcast <2 x bfloat> %277 to i32
  %279 = insertelement <2 x bfloat> poison, bfloat %272, i64 0
  %280 = insertelement <2 x bfloat> %279, bfloat %273, i64 1
  %281 = bitcast <2 x bfloat> %280 to i32
  tail call void asm sideeffect "st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l"(i32 %278, i32 %281, ptr addrspace(1) %275) #10
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_convert_fusion(ptr noalias readonly align 128 captures(none) dereferenceable(196608) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(98304) %1) local_unnamed_addr #0 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
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
  %16 = load bfloat, ptr addrspace(1) %15, align 2, !invariant.load !5, !alias.scope !7
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
  %27 = load bfloat, ptr addrspace(1) %26, align 2, !invariant.load !5, !alias.scope !10
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

define ptx_kernel void @fusion_21(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5) local_unnamed_addr #5 {
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %3 = shl nsw i64 %2, 8
  %4 = and i64 %3, 768
  %5 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %3
  %6 = tail call range(i32 0, 64) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %7 = and i32 %6, 31
  %8 = lshr i32 %6, 5
  %9 = shl nuw nsw i32 %6, 2
  %10 = and i32 %9, 124
  %11 = icmp samesign ult i32 %6, 32
  %12 = select i1 %11, i32 0, i32 128
  %13 = or disjoint i32 %10, %12
  %14 = zext nneg i32 %13 to i64
  %15 = getelementptr bfloat, ptr addrspace(1) %5, i64 %14
  %16 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %15) #10
  %17 = extractvalue { i32, i32 } %16, 0
  %18 = bitcast i32 %17 to <2 x bfloat>
  %19 = extractvalue { i32, i32 } %16, 1
  %20 = bitcast i32 %19 to <2 x bfloat>
  %21 = extractelement <2 x bfloat> %18, i64 0
  %22 = extractelement <2 x bfloat> %18, i64 1
  %23 = extractelement <2 x bfloat> %20, i64 0
  %24 = extractelement <2 x bfloat> %20, i64 1
  %25 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %21) #10
  %26 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %22) #10
  %27 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %23) #10
  %28 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %24) #10
  %29 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %3
  %30 = getelementptr bfloat, ptr addrspace(1) %29, i64 %14
  %31 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %30) #10
  %32 = extractvalue { i32, i32 } %31, 0
  %33 = bitcast i32 %32 to <2 x bfloat>
  %34 = extractvalue { i32, i32 } %31, 1
  %35 = bitcast i32 %34 to <2 x bfloat>
  %36 = extractelement <2 x bfloat> %33, i64 0
  %37 = extractelement <2 x bfloat> %33, i64 1
  %38 = extractelement <2 x bfloat> %35, i64 0
  %39 = extractelement <2 x bfloat> %35, i64 1
  %40 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %36) #10
  %41 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %37) #10
  %42 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %38) #10
  %43 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %39) #10
  %44 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %3
  %45 = getelementptr bfloat, ptr addrspace(1) %44, i64 %14
  %46 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %45) #10
  %47 = extractvalue { i32, i32 } %46, 0
  %48 = bitcast i32 %47 to <2 x bfloat>
  %49 = extractvalue { i32, i32 } %46, 1
  %50 = bitcast i32 %49 to <2 x bfloat>
  %51 = extractelement <2 x bfloat> %48, i64 0
  %52 = extractelement <2 x bfloat> %48, i64 1
  %53 = extractelement <2 x bfloat> %50, i64 0
  %54 = extractelement <2 x bfloat> %50, i64 1
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #10
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %52) #10
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %53) #10
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %54) #10
  %59 = fadd float %40, %55
  %60 = fadd float %41, %56
  %61 = fadd float %42, %57
  %62 = fadd float %43, %58
  %63 = fadd float %25, %59
  %64 = fadd float %26, %60
  %65 = fadd float %27, %61
  %66 = fadd float %28, %62
  %67 = and i64 %3, -1024
  %68 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %67
  %69 = shl nuw nsw i32 %6, 3
  %70 = and i32 %69, 248
  %71 = select i1 %11, i32 0, i32 256
  %72 = or disjoint i32 %70, %71
  %73 = zext nneg i32 %72 to i64
  %74 = getelementptr bfloat, ptr addrspace(1) %68, i64 %73
  %75 = getelementptr i8, ptr addrspace(1) %74, i64 1024
  %76 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %74) #10
  %77 = extractvalue { i32, i32, i32, i32 } %76, 0
  %78 = bitcast i32 %77 to <2 x bfloat>
  %79 = extractvalue { i32, i32, i32, i32 } %76, 1
  %80 = bitcast i32 %79 to <2 x bfloat>
  %81 = extractvalue { i32, i32, i32, i32 } %76, 2
  %82 = bitcast i32 %81 to <2 x bfloat>
  %83 = extractvalue { i32, i32, i32, i32 } %76, 3
  %84 = bitcast i32 %83 to <2 x bfloat>
  %85 = extractelement <2 x bfloat> %78, i64 0
  %86 = extractelement <2 x bfloat> %78, i64 1
  %87 = extractelement <2 x bfloat> %80, i64 0
  %88 = extractelement <2 x bfloat> %80, i64 1
  %89 = extractelement <2 x bfloat> %82, i64 0
  %90 = extractelement <2 x bfloat> %82, i64 1
  %91 = extractelement <2 x bfloat> %84, i64 0
  %92 = extractelement <2 x bfloat> %84, i64 1
  %93 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %75) #10
  %94 = extractvalue { i32, i32, i32, i32 } %93, 0
  %95 = bitcast i32 %94 to <2 x bfloat>
  %96 = extractvalue { i32, i32, i32, i32 } %93, 1
  %97 = bitcast i32 %96 to <2 x bfloat>
  %98 = extractvalue { i32, i32, i32, i32 } %93, 2
  %99 = bitcast i32 %98 to <2 x bfloat>
  %100 = extractvalue { i32, i32, i32, i32 } %93, 3
  %101 = bitcast i32 %100 to <2 x bfloat>
  %102 = extractelement <2 x bfloat> %95, i64 0
  %103 = extractelement <2 x bfloat> %95, i64 1
  %104 = extractelement <2 x bfloat> %97, i64 0
  %105 = extractelement <2 x bfloat> %97, i64 1
  %106 = extractelement <2 x bfloat> %99, i64 0
  %107 = extractelement <2 x bfloat> %99, i64 1
  %108 = extractelement <2 x bfloat> %101, i64 0
  %109 = extractelement <2 x bfloat> %101, i64 1
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #10
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #10
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #10
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #10
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %89) #10
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %90) #10
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %91) #10
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %92) #10
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #10
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #10
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #10
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #10
  %122 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %106) #10
  %123 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %107) #10
  %124 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %108) #10
  %125 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %109) #10
  %126 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %67
  %127 = getelementptr bfloat, ptr addrspace(1) %126, i64 %73
  %128 = getelementptr i8, ptr addrspace(1) %127, i64 1024
  %129 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %127) #10
  %130 = extractvalue { i32, i32, i32, i32 } %129, 0
  %131 = bitcast i32 %130 to <2 x bfloat>
  %132 = extractvalue { i32, i32, i32, i32 } %129, 1
  %133 = bitcast i32 %132 to <2 x bfloat>
  %134 = extractvalue { i32, i32, i32, i32 } %129, 2
  %135 = bitcast i32 %134 to <2 x bfloat>
  %136 = extractvalue { i32, i32, i32, i32 } %129, 3
  %137 = bitcast i32 %136 to <2 x bfloat>
  %138 = extractelement <2 x bfloat> %131, i64 0
  %139 = extractelement <2 x bfloat> %131, i64 1
  %140 = extractelement <2 x bfloat> %133, i64 0
  %141 = extractelement <2 x bfloat> %133, i64 1
  %142 = extractelement <2 x bfloat> %135, i64 0
  %143 = extractelement <2 x bfloat> %135, i64 1
  %144 = extractelement <2 x bfloat> %137, i64 0
  %145 = extractelement <2 x bfloat> %137, i64 1
  %146 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %128) #10
  %147 = extractvalue { i32, i32, i32, i32 } %146, 0
  %148 = bitcast i32 %147 to <2 x bfloat>
  %149 = extractvalue { i32, i32, i32, i32 } %146, 1
  %150 = bitcast i32 %149 to <2 x bfloat>
  %151 = extractvalue { i32, i32, i32, i32 } %146, 2
  %152 = bitcast i32 %151 to <2 x bfloat>
  %153 = extractvalue { i32, i32, i32, i32 } %146, 3
  %154 = bitcast i32 %153 to <2 x bfloat>
  %155 = extractelement <2 x bfloat> %148, i64 0
  %156 = extractelement <2 x bfloat> %148, i64 1
  %157 = extractelement <2 x bfloat> %150, i64 0
  %158 = extractelement <2 x bfloat> %150, i64 1
  %159 = extractelement <2 x bfloat> %152, i64 0
  %160 = extractelement <2 x bfloat> %152, i64 1
  %161 = extractelement <2 x bfloat> %154, i64 0
  %162 = extractelement <2 x bfloat> %154, i64 1
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #10
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #10
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #10
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #10
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #10
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %143) #10
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %144) #10
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %145) #10
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #10
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #10
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #10
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #10
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #10
  %176 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %160) #10
  %177 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %161) #10
  %178 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %162) #10
  %179 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %67
  %180 = getelementptr bfloat, ptr addrspace(1) %179, i64 %73
  %181 = getelementptr i8, ptr addrspace(1) %180, i64 1024
  %182 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %180) #10
  %183 = extractvalue { i32, i32, i32, i32 } %182, 0
  %184 = bitcast i32 %183 to <2 x bfloat>
  %185 = extractvalue { i32, i32, i32, i32 } %182, 1
  %186 = bitcast i32 %185 to <2 x bfloat>
  %187 = extractvalue { i32, i32, i32, i32 } %182, 2
  %188 = bitcast i32 %187 to <2 x bfloat>
  %189 = extractvalue { i32, i32, i32, i32 } %182, 3
  %190 = bitcast i32 %189 to <2 x bfloat>
  %191 = extractelement <2 x bfloat> %184, i64 0
  %192 = extractelement <2 x bfloat> %184, i64 1
  %193 = extractelement <2 x bfloat> %186, i64 0
  %194 = extractelement <2 x bfloat> %186, i64 1
  %195 = extractelement <2 x bfloat> %188, i64 0
  %196 = extractelement <2 x bfloat> %188, i64 1
  %197 = extractelement <2 x bfloat> %190, i64 0
  %198 = extractelement <2 x bfloat> %190, i64 1
  %199 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %181) #10
  %200 = extractvalue { i32, i32, i32, i32 } %199, 0
  %201 = bitcast i32 %200 to <2 x bfloat>
  %202 = extractvalue { i32, i32, i32, i32 } %199, 1
  %203 = bitcast i32 %202 to <2 x bfloat>
  %204 = extractvalue { i32, i32, i32, i32 } %199, 2
  %205 = bitcast i32 %204 to <2 x bfloat>
  %206 = extractvalue { i32, i32, i32, i32 } %199, 3
  %207 = bitcast i32 %206 to <2 x bfloat>
  %208 = extractelement <2 x bfloat> %201, i64 0
  %209 = extractelement <2 x bfloat> %201, i64 1
  %210 = extractelement <2 x bfloat> %203, i64 0
  %211 = extractelement <2 x bfloat> %203, i64 1
  %212 = extractelement <2 x bfloat> %205, i64 0
  %213 = extractelement <2 x bfloat> %205, i64 1
  %214 = extractelement <2 x bfloat> %207, i64 0
  %215 = extractelement <2 x bfloat> %207, i64 1
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #10
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #10
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #10
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194) #10
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #10
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %196) #10
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %197) #10
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %198) #10
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #10
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #10
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #10
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211) #10
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212) #10
  %229 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %213) #10
  %230 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %214) #10
  %231 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %215) #10
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
  %245 = fadd float %176, %229
  %246 = fadd float %177, %230
  %247 = fadd float %178, %231
  %248 = fadd float %110, %232
  %249 = fadd float %111, %233
  %250 = fadd float %112, %234
  %251 = fadd float %113, %235
  %252 = fadd float %114, %236
  %253 = fadd float %115, %237
  %254 = fadd float %116, %238
  %255 = fadd float %117, %239
  %256 = fadd float %118, %240
  %257 = fadd float %119, %241
  %258 = fadd float %120, %242
  %259 = fadd float %121, %243
  %260 = fadd float %122, %244
  %261 = fadd float %123, %245
  %262 = fadd float %124, %246
  %263 = fadd float %125, %247
  %264 = fmul float %248, %248
  %265 = fmul float %249, %249
  %266 = fmul float %250, %250
  %267 = fmul float %251, %251
  %268 = fmul float %252, %252
  %269 = fmul float %253, %253
  %270 = fmul float %254, %254
  %271 = fmul float %255, %255
  %272 = fmul float %256, %256
  %273 = fmul float %257, %257
  %274 = fmul float %258, %258
  %275 = fmul float %259, %259
  %276 = fmul float %260, %260
  %277 = fmul float %261, %261
  %278 = fmul float %262, %262
  %279 = fmul float %263, %263
  %280 = fadd float %264, %265
  %281 = fadd float %280, %266
  %282 = fadd float %281, %267
  %283 = fadd float %282, %268
  %284 = fadd float %283, %269
  %285 = fadd float %284, %270
  %286 = fadd float %285, %271
  %287 = fadd float %286, %272
  %288 = fadd float %287, %273
  %289 = fadd float %288, %274
  %290 = fadd float %289, %275
  %291 = fadd float %290, %276
  %292 = fadd float %291, %277
  %293 = fadd float %292, %278
  %294 = fadd float %293, %279
  %295 = bitcast float %294 to i32
  %296 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %295, i32 16, i32 31)
  %297 = bitcast i32 %296 to float
  %298 = fadd float %294, %297
  %299 = bitcast float %298 to i32
  %300 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %299, i32 8, i32 31)
  %301 = bitcast i32 %300 to float
  %302 = fadd float %298, %301
  %303 = bitcast float %302 to i32
  %304 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %303, i32 4, i32 31)
  %305 = bitcast i32 %304 to float
  %306 = fadd float %302, %305
  %307 = bitcast float %306 to i32
  %308 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %307, i32 2, i32 31)
  %309 = bitcast i32 %308 to float
  %310 = fadd float %306, %309
  %311 = bitcast float %310 to i32
  %312 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %311, i32 1, i32 31)
  %313 = bitcast i32 %312 to float
  %314 = fadd float %310, %313
  %315 = icmp eq i32 %7, 0
  %316 = zext nneg i32 %8 to i64
  %317 = getelementptr float, ptr addrspace(3) @global_smem, i64 %316
  %318 = bitcast float %314 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %317, <1 x i32> %318, i1 %315) #10
  tail call void @llvm.nvvm.barrier0()
  %319 = icmp samesign ult i32 %6, 2
  %320 = zext nneg i32 %6 to i64
  %321 = getelementptr float, ptr addrspace(3) @global_smem, i64 %320
  %322 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %321, i1 %319) #10
  %323 = bitcast i32 %322 to float
  %324 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %322, i32 1, i32 31)
  %325 = bitcast i32 %324 to float
  %326 = fadd float %323, %325
  %327 = icmp eq i32 %6, 0
  %328 = bitcast float %326 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %321, <1 x i32> %328, i1 %327) #10
  tail call void @llvm.nvvm.barrier0()
  %329 = load float, ptr addrspace(3) @global_smem, align 16
  %330 = fmul float %329, 0x3F50000000000000
  %331 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
  %332 = bitcast i32 %331 to float
  %333 = fadd float %330, %332
  %334 = tail call float @llvm.nvvm.rsqrt.approx.f(float %333)
  %335 = fmul float %63, %334
  %336 = fmul float %64, %334
  %337 = fmul float %65, %334
  %338 = fmul float %66, %334
  %339 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %4
  %340 = getelementptr bfloat, ptr addrspace(1) %339, i64 %14
  %341 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %340) #10
  %342 = extractvalue { i32, i32 } %341, 0
  %343 = bitcast i32 %342 to <2 x bfloat>
  %344 = extractvalue { i32, i32 } %341, 1
  %345 = bitcast i32 %344 to <2 x bfloat>
  %346 = extractelement <2 x bfloat> %343, i64 0
  %347 = extractelement <2 x bfloat> %343, i64 1
  %348 = extractelement <2 x bfloat> %345, i64 0
  %349 = extractelement <2 x bfloat> %345, i64 1
  %350 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %346) #10
  %351 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %347) #10
  %352 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %348) #10
  %353 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %349) #10
  %354 = fmul float %335, %350
  %355 = fmul float %336, %351
  %356 = fmul float %337, %352
  %357 = fmul float %338, %353
  %358 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %354) #10
  %359 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %355) #10
  %360 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %356) #10
  %361 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %357) #10
  %362 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %3
  %363 = getelementptr bfloat, ptr addrspace(1) %362, i64 %14
  %364 = insertelement <2 x bfloat> poison, bfloat %358, i64 0
  %365 = insertelement <2 x bfloat> %364, bfloat %359, i64 1
  %366 = bitcast <2 x bfloat> %365 to i32
  %367 = insertelement <2 x bfloat> poison, bfloat %360, i64 0
  %368 = insertelement <2 x bfloat> %367, bfloat %361, i64 1
  %369 = bitcast <2 x bfloat> %368 to i32
  tail call void asm sideeffect "st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l"(i32 %366, i32 %369, ptr addrspace(1) %363) #10
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

define ptx_kernel void @triton_softmax_3_0(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2) local_unnamed_addr #6 {
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
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
  %18 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %17) #10
  %19 = extractvalue { i32, i32 } %18, 0
  %20 = bitcast i32 %19 to <2 x bfloat>
  %21 = extractvalue { i32, i32 } %18, 1
  %22 = bitcast i32 %21 to <2 x bfloat>
  %23 = extractelement <2 x bfloat> %20, i64 0
  %24 = extractelement <2 x bfloat> %20, i64 1
  %25 = extractelement <2 x bfloat> %22, i64 0
  %26 = extractelement <2 x bfloat> %22, i64 1
  %27 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %23) #10
  %28 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %24) #10
  %29 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %25) #10
  %30 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %26) #10
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
  %59 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %69, i32 %70, i32 %71, i32 %72, ptr addrspace(1) %68) #10
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite)
define ptx_kernel void @input_concatenate_fusion(ptr noalias readonly align 128 captures(none) dereferenceable(65536) %0, ptr noalias readonly align 16 captures(none) dereferenceable(256) %1, ptr noalias readonly align 16 captures(none) dereferenceable(10485760) %2, ptr noalias readonly align 16 captures(none) dereferenceable(64) %3, ptr noalias writeonly align 128 captures(none) dereferenceable(32768) %4) local_unnamed_addr #7 {
  %6 = addrspacecast ptr %4 to ptr addrspace(1)
  %7 = addrspacecast ptr %3 to ptr addrspace(1)
  %8 = addrspacecast ptr %2 to ptr addrspace(1)
  %9 = addrspacecast ptr %1 to ptr addrspace(1)
  %10 = addrspacecast ptr %0 to ptr addrspace(1)
  %11 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %12 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !13
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
  tail call void @llvm.experimental.noalias.scope.decl(metadata !14)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !17)
  %28 = zext nneg i32 %13 to i64
  %29 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %28
  %30 = load i32, ptr addrspace(1) %29, align 4, !invariant.load !5, !alias.scope !17, !noalias !14
  %31 = tail call i32 @llvm.smin.i32(i32 %30, i32 40959)
  %32 = tail call i32 @llvm.smax.i32(i32 %31, i32 0)
  %33 = shl nuw nsw i32 %32, 7
  %34 = or disjoint i32 %33, %14
  %35 = zext nneg i32 %34 to i64
  %36 = getelementptr inbounds bfloat, ptr addrspace(1) %8, i64 %35
  %37 = load bfloat, ptr addrspace(1) %36, align 2, !invariant.load !5, !alias.scope !14, !noalias !17
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
  %51 = load bfloat, ptr addrspace(1) %50, align 2, !invariant.load !5, !alias.scope !19, !noalias !22
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
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !24
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
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !24
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
declare float @llvm.nvvm.rsqrt.approx.f(float) #8

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare float @llvm.nvvm.ex2.approx.f(float) #8

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.experimental.noalias.scope.decl(metadata) #9

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) "nvvm.reqntid"="128,1,1" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { convergent nocallback nounwind }
attributes #3 = { "nvvm.reqntid"="128,1,1" }
attributes #4 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #5 = { "nvvm.reqntid"="64,1,1" }
attributes #6 = { "nvvm.reqntid"="32,1,1" }
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
!5 = !{}
!6 = !{i32 0, i32 384}
!7 = !{!8}
!8 = distinct !{!8, !9, !"fused_convert_param_0_107: argument 0"}
!9 = distinct !{!9, !"fused_convert_param_0_107"}
!10 = !{!11}
!11 = distinct !{!11, !12, !"fused_convert_param_0_107: argument 0"}
!12 = distinct !{!12, !"fused_convert_param_0_107"}
!13 = !{i32 0, i32 64}
!14 = !{!15}
!15 = distinct !{!15, !16, !"fused_concatenate_convert_136_17: argument 0"}
!16 = distinct !{!16, !"fused_concatenate_convert_136_17"}
!17 = !{!18}
!18 = distinct !{!18, !16, !"fused_concatenate_convert_136_17: argument 1"}
!19 = !{!20}
!20 = distinct !{!20, !21, !"fused_concatenate_convert_136_17: argument 0"}
!21 = distinct !{!21, !"fused_concatenate_convert_136_17"}
!22 = !{!23}
!23 = distinct !{!23, !21, !"fused_concatenate_convert_136_17: argument 1"}
!24 = !{i32 0, i32 135456}

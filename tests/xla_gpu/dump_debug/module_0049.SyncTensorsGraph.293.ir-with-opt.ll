; ModuleID = 'SyncTensorsGraph.293'
source_filename = "SyncTensorsGraph.293"
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

define ptx_kernel void @gemm_fusion_dot_7_0(ptr noalias align 16 dereferenceable(4194304) %arg0, ptr noalias align 16 dereferenceable(4194304) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2) local_unnamed_addr #3 {
  %arg230 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg128 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg026 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %.frozen = freeze i32 %1
  %2 = sdiv i32 %.frozen, 8
  %3 = shl nsw i32 %2, 3
  %4 = sub i32 128, %3
  %5 = tail call i32 @llvm.smin.i32(i32 %4, i32 8)
  %6 = srem i32 %1, %5
  %7 = add i32 %3, %6
  %8 = shl i32 %7, 4
  %9 = icmp slt i32 %8, 1024
  %.v = select i1 %9, ptr addrspace(1) %arg026, ptr addrspace(1) %arg128
  %10 = add i32 %8, -1024
  %11 = select i1 %9, i32 %8, i32 %10
  %12 = sext i32 %11 to i64
  %13 = tail call range(i32 0, 128) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %14 = and i32 %13, 32
  %.not = icmp eq i32 %14, 0
  %.lobit = lshr i32 %14, 5
  %15 = icmp samesign ult i32 %13, 64
  %16 = select i1 %15, i32 0, i32 2
  %17 = or disjoint i32 %.lobit, %16
  %18 = or disjoint i32 %17, 4
  %19 = or disjoint i32 %17, 8
  %20 = or disjoint i32 %17, 12
  %21 = zext nneg i32 %17 to i64
  %22 = zext nneg i32 %18 to i64
  %23 = zext nneg i32 %19 to i64
  %24 = zext nneg i32 %20 to i64
  %25 = or disjoint i64 %12, %21
  %26 = or disjoint i64 %12, %22
  %27 = or disjoint i64 %12, %23
  %28 = or disjoint i64 %12, %24
  %29 = and i32 %13, 1
  %30 = icmp eq i32 %29, 0
  %31 = and i32 %13, 2
  %32 = icmp eq i32 %31, 0
  %33 = shl i32 %13, 3
  %34 = and i32 %33, 24
  %35 = and i32 %13, 4
  %.not5 = icmp eq i32 %35, 0
  %36 = shl i32 %35, 3
  %37 = or disjoint i32 %34, %36
  %38 = and i32 %13, 8
  %39 = shl i32 %38, 3
  %40 = or disjoint i32 %37, %39
  %41 = and i32 %13, 16
  %42 = shl i32 %41, 3
  %43 = or disjoint i32 %40, %42
  %44 = zext nneg i32 %43 to i64
  %.idx7 = shl nsw i64 %25, 12
  %45 = getelementptr i8, ptr addrspace(1) %.v, i64 %.idx7
  %46 = getelementptr bfloat, ptr addrspace(1) %45, i64 %44
  %.idx8 = shl nsw i64 %26, 12
  %47 = getelementptr i8, ptr addrspace(1) %.v, i64 %.idx8
  %48 = getelementptr bfloat, ptr addrspace(1) %47, i64 %44
  %.idx9 = shl nsw i64 %27, 12
  %49 = getelementptr i8, ptr addrspace(1) %.v, i64 %.idx9
  %50 = getelementptr bfloat, ptr addrspace(1) %49, i64 %44
  %.idx10 = shl nsw i64 %28, 12
  %51 = getelementptr i8, ptr addrspace(1) %.v, i64 %.idx10
  %52 = getelementptr bfloat, ptr addrspace(1) %51, i64 %44
  %53 = select i1 %.not, i32 0, i32 264
  %54 = select i1 %15, i32 0, i32 528
  %55 = or disjoint i32 %53, %54
  %56 = xor i32 %55, %43
  %57 = zext nneg i32 %56 to i64
  %58 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %57
  %59 = or disjoint i32 %34, 1056
  %60 = xor i32 %59, %36
  %61 = or disjoint i32 %39, %60
  %62 = or disjoint i32 %61, %42
  %63 = xor i32 %55, %62
  %64 = zext nneg i32 %63 to i64
  %65 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %64
  %66 = or disjoint i32 %43, 2048
  %67 = xor i32 %55, %66
  %68 = zext nneg i32 %67 to i64
  %69 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %68
  %70 = or disjoint i32 %34, 3104
  %71 = xor i32 %70, %36
  %72 = or disjoint i32 %39, %71
  %73 = or disjoint i32 %72, %42
  %74 = xor i32 %55, %73
  %75 = zext nneg i32 %74 to i64
  %76 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %75
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %58, ptr addrspace(1) %46, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %65, ptr addrspace(1) %48, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %69, ptr addrspace(1) %50, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %76, ptr addrspace(1) %52, i32 16) #10
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #10
  %77 = getelementptr i8, ptr addrspace(1) %46, i64 512
  %78 = getelementptr i8, ptr addrspace(1) %48, i64 512
  %79 = getelementptr i8, ptr addrspace(1) %50, i64 512
  %80 = getelementptr i8, ptr addrspace(1) %52, i64 512
  tail call void @llvm.nvvm.barrier0()
  %81 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 8192), i64 %57
  %82 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 8192), i64 %64
  %83 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 8192), i64 %68
  %84 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 8192), i64 %75
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %81, ptr addrspace(1) %77, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %82, ptr addrspace(1) %78, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %83, ptr addrspace(1) %79, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %84, ptr addrspace(1) %80, i32 16) #10
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #10
  tail call void asm sideeffect "cp.async.wait_group 0x1;", ""() #10
  tail call void @llvm.nvvm.barrier0()
  %85 = select i1 %30, i32 0, i32 264
  %86 = select i1 %32, i32 0, i32 528
  %87 = or disjoint i32 %85, %86
  %88 = select i1 %.not5, i32 0, i32 1056
  %89 = shl nuw nsw i32 %38, 8
  %90 = or disjoint i32 %88, %89
  %91 = or disjoint i32 %90, %87
  %92 = lshr exact i32 %41, 1
  %93 = xor i32 %91, %92
  %94 = zext nneg i32 %93 to i64
  %95 = or disjoint i32 %85, 16
  %96 = xor i32 %95, %86
  %97 = or disjoint i32 %89, %96
  %98 = or disjoint i32 %97, %88
  %99 = xor i32 %98, %92
  %100 = zext nneg i32 %99 to i64
  %101 = or disjoint i32 %87, 32
  %102 = xor i32 %101, %88
  %103 = or disjoint i32 %102, %89
  %104 = xor i32 %103, %92
  %105 = zext nneg i32 %104 to i64
  %106 = or disjoint i32 %85, 48
  %107 = or disjoint i32 %88, %86
  %108 = xor i32 %107, %106
  %109 = or disjoint i32 %108, %89
  %110 = xor i32 %109, %92
  %111 = zext nneg i32 %110 to i64
  %112 = or disjoint i32 %91, 64
  %113 = xor i32 %112, %92
  %114 = zext nneg i32 %113 to i64
  %115 = or disjoint i32 %85, 80
  %116 = xor i32 %115, %86
  %117 = or disjoint i32 %89, %116
  %118 = or disjoint i32 %117, %88
  %119 = xor i32 %118, %92
  %120 = zext nneg i32 %119 to i64
  %121 = or disjoint i32 %87, 96
  %122 = xor i32 %121, %88
  %123 = or disjoint i32 %122, %89
  %124 = xor i32 %123, %92
  %125 = zext nneg i32 %124 to i64
  %126 = or disjoint i32 %85, 112
  %127 = xor i32 %107, %126
  %128 = or disjoint i32 %127, %89
  %129 = xor i32 %128, %92
  %130 = zext nneg i32 %129 to i64
  %131 = or disjoint i32 %91, 128
  %132 = xor i32 %131, %92
  %133 = zext nneg i32 %132 to i64
  %134 = or disjoint i32 %85, 144
  %135 = xor i32 %134, %86
  %136 = or disjoint i32 %89, %135
  %137 = or disjoint i32 %136, %88
  %138 = xor i32 %137, %92
  %139 = zext nneg i32 %138 to i64
  %140 = or disjoint i32 %87, 160
  %141 = xor i32 %140, %88
  %142 = or disjoint i32 %141, %89
  %143 = xor i32 %142, %92
  %144 = zext nneg i32 %143 to i64
  %145 = or disjoint i32 %85, 176
  %146 = xor i32 %107, %145
  %147 = or disjoint i32 %146, %89
  %148 = xor i32 %147, %92
  %149 = zext nneg i32 %148 to i64
  %150 = or disjoint i32 %91, 192
  %151 = xor i32 %150, %92
  %152 = zext nneg i32 %151 to i64
  %153 = or disjoint i32 %85, 208
  %154 = xor i32 %153, %86
  %155 = or disjoint i32 %89, %154
  %156 = or disjoint i32 %155, %88
  %157 = xor i32 %156, %92
  %158 = zext nneg i32 %157 to i64
  %159 = or disjoint i32 %87, 224
  %160 = xor i32 %159, %88
  %161 = or disjoint i32 %160, %89
  %162 = xor i32 %161, %92
  %163 = zext nneg i32 %162 to i64
  %164 = or disjoint i32 %85, 240
  %165 = xor i32 %107, %164
  %166 = or disjoint i32 %165, %89
  %167 = xor i32 %166, %92
  %168 = zext nneg i32 %167 to i64
  %169 = add i32 %42, %39
  %170 = add i32 %169, %36
  %171 = add i32 %170, %34
  %172 = zext nneg i32 %171 to i64
  %173 = shl nuw nsw i64 %172, 1
  %174 = add i32 %16, %.lobit
  %175 = add i32 %174, 12
  %176 = zext nneg i32 %175 to i64
  %177 = add i64 %12, %176
  %178 = shl nsw i64 %177, 12
  %179 = add nuw nsw i64 %178, 1024
  %scevgep = getelementptr i8, ptr addrspace(1) %.v, i64 %179
  %180 = add i32 %174, 8
  %181 = zext nneg i32 %180 to i64
  %182 = add i64 %12, %181
  %183 = shl nsw i64 %182, 12
  %184 = add nuw nsw i64 %183, 1024
  %scevgep34 = getelementptr i8, ptr addrspace(1) %.v, i64 %184
  %185 = add i32 %174, 4
  %186 = zext nneg i32 %185 to i64
  %187 = add i64 %12, %186
  %188 = shl nsw i64 %187, 12
  %189 = add nuw nsw i64 %188, 1024
  %scevgep38 = getelementptr i8, ptr addrspace(1) %.v, i64 %189
  %190 = zext nneg i32 %174 to i64
  %191 = add i64 %12, %190
  %192 = shl nsw i64 %191, 12
  %193 = add nuw nsw i64 %192, 1024
  %scevgep42 = getelementptr i8, ptr addrspace(1) %.v, i64 %193
  br label %194

194:                                              ; preds = %0, %194
  %lsr.iv46 = phi i32 [ -256, %0 ], [ %199, %194 ]
  %lsr.iv43 = phi ptr addrspace(1) [ %scevgep42, %0 ], [ %scevgep44, %194 ]
  %lsr.iv39 = phi ptr addrspace(1) [ %scevgep38, %0 ], [ %scevgep40, %194 ]
  %lsr.iv35 = phi ptr addrspace(1) [ %scevgep34, %0 ], [ %scevgep36, %194 ]
  %lsr.iv = phi ptr addrspace(1) [ %scevgep, %0 ], [ %scevgep32, %194 ]
  %195 = phi ptr addrspace(3) [ @global_smem, %0 ], [ %433, %194 ]
  %196 = phi i32 [ 0, %0 ], [ %430, %194 ]
  %197 = phi i32 [ 1, %0 ], [ %419, %194 ]
  %198 = phi { float, float, float, float } [ zeroinitializer, %0 ], [ %416, %194 ]
  %199 = add i32 %lsr.iv46, 256
  %200 = icmp samesign ult i32 %199, 1536
  %201 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %195, i64 %94
  %202 = ptrtoint ptr addrspace(3) %201 to i64
  %203 = trunc i64 %202 to i32
  %204 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %203) #10
  %205 = extractvalue { i32, i32, i32, i32 } %204, 0
  %206 = extractvalue { i32, i32, i32, i32 } %204, 1
  %207 = extractvalue { i32, i32, i32, i32 } %204, 2
  %208 = extractvalue { i32, i32, i32, i32 } %204, 3
  %209 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %195, i64 %100
  %210 = ptrtoint ptr addrspace(3) %209 to i64
  %211 = trunc i64 %210 to i32
  %212 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %211) #10
  %213 = extractvalue { i32, i32, i32, i32 } %212, 0
  %214 = extractvalue { i32, i32, i32, i32 } %212, 1
  %215 = extractvalue { i32, i32, i32, i32 } %212, 2
  %216 = extractvalue { i32, i32, i32, i32 } %212, 3
  %217 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %195, i64 %105
  %218 = ptrtoint ptr addrspace(3) %217 to i64
  %219 = trunc i64 %218 to i32
  %220 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %219) #10
  %221 = extractvalue { i32, i32, i32, i32 } %220, 0
  %222 = extractvalue { i32, i32, i32, i32 } %220, 1
  %223 = extractvalue { i32, i32, i32, i32 } %220, 2
  %224 = extractvalue { i32, i32, i32, i32 } %220, 3
  %225 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %195, i64 %111
  %226 = ptrtoint ptr addrspace(3) %225 to i64
  %227 = trunc i64 %226 to i32
  %228 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %227) #10
  %229 = extractvalue { i32, i32, i32, i32 } %228, 0
  %230 = extractvalue { i32, i32, i32, i32 } %228, 1
  %231 = extractvalue { i32, i32, i32, i32 } %228, 2
  %232 = extractvalue { i32, i32, i32, i32 } %228, 3
  %233 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %195, i64 %114
  %234 = ptrtoint ptr addrspace(3) %233 to i64
  %235 = trunc i64 %234 to i32
  %236 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %235) #10
  %237 = extractvalue { i32, i32, i32, i32 } %236, 0
  %238 = extractvalue { i32, i32, i32, i32 } %236, 1
  %239 = extractvalue { i32, i32, i32, i32 } %236, 2
  %240 = extractvalue { i32, i32, i32, i32 } %236, 3
  %241 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %195, i64 %120
  %242 = ptrtoint ptr addrspace(3) %241 to i64
  %243 = trunc i64 %242 to i32
  %244 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %243) #10
  %245 = extractvalue { i32, i32, i32, i32 } %244, 0
  %246 = extractvalue { i32, i32, i32, i32 } %244, 1
  %247 = extractvalue { i32, i32, i32, i32 } %244, 2
  %248 = extractvalue { i32, i32, i32, i32 } %244, 3
  %249 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %195, i64 %125
  %250 = ptrtoint ptr addrspace(3) %249 to i64
  %251 = trunc i64 %250 to i32
  %252 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %251) #10
  %253 = extractvalue { i32, i32, i32, i32 } %252, 0
  %254 = extractvalue { i32, i32, i32, i32 } %252, 1
  %255 = extractvalue { i32, i32, i32, i32 } %252, 2
  %256 = extractvalue { i32, i32, i32, i32 } %252, 3
  %257 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %195, i64 %130
  %258 = ptrtoint ptr addrspace(3) %257 to i64
  %259 = trunc i64 %258 to i32
  %260 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %259) #10
  %261 = extractvalue { i32, i32, i32, i32 } %260, 0
  %262 = extractvalue { i32, i32, i32, i32 } %260, 1
  %263 = extractvalue { i32, i32, i32, i32 } %260, 2
  %264 = extractvalue { i32, i32, i32, i32 } %260, 3
  %265 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %195, i64 %133
  %266 = ptrtoint ptr addrspace(3) %265 to i64
  %267 = trunc i64 %266 to i32
  %268 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %267) #10
  %269 = extractvalue { i32, i32, i32, i32 } %268, 0
  %270 = extractvalue { i32, i32, i32, i32 } %268, 1
  %271 = extractvalue { i32, i32, i32, i32 } %268, 2
  %272 = extractvalue { i32, i32, i32, i32 } %268, 3
  %273 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %195, i64 %139
  %274 = ptrtoint ptr addrspace(3) %273 to i64
  %275 = trunc i64 %274 to i32
  %276 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %275) #10
  %277 = extractvalue { i32, i32, i32, i32 } %276, 0
  %278 = extractvalue { i32, i32, i32, i32 } %276, 1
  %279 = extractvalue { i32, i32, i32, i32 } %276, 2
  %280 = extractvalue { i32, i32, i32, i32 } %276, 3
  %281 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %195, i64 %144
  %282 = ptrtoint ptr addrspace(3) %281 to i64
  %283 = trunc i64 %282 to i32
  %284 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %283) #10
  %285 = extractvalue { i32, i32, i32, i32 } %284, 0
  %286 = extractvalue { i32, i32, i32, i32 } %284, 1
  %287 = extractvalue { i32, i32, i32, i32 } %284, 2
  %288 = extractvalue { i32, i32, i32, i32 } %284, 3
  %289 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %195, i64 %149
  %290 = ptrtoint ptr addrspace(3) %289 to i64
  %291 = trunc i64 %290 to i32
  %292 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %291) #10
  %293 = extractvalue { i32, i32, i32, i32 } %292, 0
  %294 = extractvalue { i32, i32, i32, i32 } %292, 1
  %295 = extractvalue { i32, i32, i32, i32 } %292, 2
  %296 = extractvalue { i32, i32, i32, i32 } %292, 3
  %297 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %195, i64 %152
  %298 = ptrtoint ptr addrspace(3) %297 to i64
  %299 = trunc i64 %298 to i32
  %300 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %299) #10
  %301 = extractvalue { i32, i32, i32, i32 } %300, 0
  %302 = extractvalue { i32, i32, i32, i32 } %300, 1
  %303 = extractvalue { i32, i32, i32, i32 } %300, 2
  %304 = extractvalue { i32, i32, i32, i32 } %300, 3
  %305 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %195, i64 %158
  %306 = ptrtoint ptr addrspace(3) %305 to i64
  %307 = trunc i64 %306 to i32
  %308 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %307) #10
  %309 = extractvalue { i32, i32, i32, i32 } %308, 0
  %310 = extractvalue { i32, i32, i32, i32 } %308, 1
  %311 = extractvalue { i32, i32, i32, i32 } %308, 2
  %312 = extractvalue { i32, i32, i32, i32 } %308, 3
  %313 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %195, i64 %163
  %314 = ptrtoint ptr addrspace(3) %313 to i64
  %315 = trunc i64 %314 to i32
  %316 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %315) #10
  %317 = extractvalue { i32, i32, i32, i32 } %316, 0
  %318 = extractvalue { i32, i32, i32, i32 } %316, 1
  %319 = extractvalue { i32, i32, i32, i32 } %316, 2
  %320 = extractvalue { i32, i32, i32, i32 } %316, 3
  %321 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %195, i64 %168
  %322 = ptrtoint ptr addrspace(3) %321 to i64
  %323 = trunc i64 %322 to i32
  %324 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %323) #10
  %325 = extractvalue { i32, i32, i32, i32 } %324, 0
  %326 = extractvalue { i32, i32, i32, i32 } %324, 1
  %327 = extractvalue { i32, i32, i32, i32 } %324, 2
  %328 = extractvalue { i32, i32, i32, i32 } %324, 3
  %329 = extractvalue { float, float, float, float } %198, 0
  %330 = extractvalue { float, float, float, float } %198, 1
  %331 = extractvalue { float, float, float, float } %198, 2
  %332 = extractvalue { float, float, float, float } %198, 3
  %333 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %329, float %330, float %331, float %332, i32 %205, i32 %206, i32 %207, i32 %208, i32 0, i32 0) #10
  %334 = extractvalue { float, float, float, float } %333, 0
  %335 = extractvalue { float, float, float, float } %333, 1
  %336 = extractvalue { float, float, float, float } %333, 2
  %337 = extractvalue { float, float, float, float } %333, 3
  %338 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %334, float %335, float %336, float %337, i32 %213, i32 %214, i32 %215, i32 %216, i32 0, i32 0) #10
  %339 = extractvalue { float, float, float, float } %338, 0
  %340 = extractvalue { float, float, float, float } %338, 1
  %341 = extractvalue { float, float, float, float } %338, 2
  %342 = extractvalue { float, float, float, float } %338, 3
  %343 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %339, float %340, float %341, float %342, i32 %221, i32 %222, i32 %223, i32 %224, i32 0, i32 0) #10
  %344 = extractvalue { float, float, float, float } %343, 0
  %345 = extractvalue { float, float, float, float } %343, 1
  %346 = extractvalue { float, float, float, float } %343, 2
  %347 = extractvalue { float, float, float, float } %343, 3
  %348 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %344, float %345, float %346, float %347, i32 %229, i32 %230, i32 %231, i32 %232, i32 0, i32 0) #10
  %349 = extractvalue { float, float, float, float } %348, 0
  %350 = extractvalue { float, float, float, float } %348, 1
  %351 = extractvalue { float, float, float, float } %348, 2
  %352 = extractvalue { float, float, float, float } %348, 3
  %353 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %349, float %350, float %351, float %352, i32 %237, i32 %238, i32 %239, i32 %240, i32 0, i32 0) #10
  %354 = extractvalue { float, float, float, float } %353, 0
  %355 = extractvalue { float, float, float, float } %353, 1
  %356 = extractvalue { float, float, float, float } %353, 2
  %357 = extractvalue { float, float, float, float } %353, 3
  %358 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %354, float %355, float %356, float %357, i32 %245, i32 %246, i32 %247, i32 %248, i32 0, i32 0) #10
  %359 = extractvalue { float, float, float, float } %358, 0
  %360 = extractvalue { float, float, float, float } %358, 1
  %361 = extractvalue { float, float, float, float } %358, 2
  %362 = extractvalue { float, float, float, float } %358, 3
  %363 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %359, float %360, float %361, float %362, i32 %253, i32 %254, i32 %255, i32 %256, i32 0, i32 0) #10
  %364 = extractvalue { float, float, float, float } %363, 0
  %365 = extractvalue { float, float, float, float } %363, 1
  %366 = extractvalue { float, float, float, float } %363, 2
  %367 = extractvalue { float, float, float, float } %363, 3
  %368 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %364, float %365, float %366, float %367, i32 %261, i32 %262, i32 %263, i32 %264, i32 0, i32 0) #10
  %369 = extractvalue { float, float, float, float } %368, 0
  %370 = extractvalue { float, float, float, float } %368, 1
  %371 = extractvalue { float, float, float, float } %368, 2
  %372 = extractvalue { float, float, float, float } %368, 3
  %373 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %369, float %370, float %371, float %372, i32 %269, i32 %270, i32 %271, i32 %272, i32 0, i32 0) #10
  %374 = extractvalue { float, float, float, float } %373, 0
  %375 = extractvalue { float, float, float, float } %373, 1
  %376 = extractvalue { float, float, float, float } %373, 2
  %377 = extractvalue { float, float, float, float } %373, 3
  %378 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %374, float %375, float %376, float %377, i32 %277, i32 %278, i32 %279, i32 %280, i32 0, i32 0) #10
  %379 = extractvalue { float, float, float, float } %378, 0
  %380 = extractvalue { float, float, float, float } %378, 1
  %381 = extractvalue { float, float, float, float } %378, 2
  %382 = extractvalue { float, float, float, float } %378, 3
  %383 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %379, float %380, float %381, float %382, i32 %285, i32 %286, i32 %287, i32 %288, i32 0, i32 0) #10
  %384 = extractvalue { float, float, float, float } %383, 0
  %385 = extractvalue { float, float, float, float } %383, 1
  %386 = extractvalue { float, float, float, float } %383, 2
  %387 = extractvalue { float, float, float, float } %383, 3
  %388 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %384, float %385, float %386, float %387, i32 %293, i32 %294, i32 %295, i32 %296, i32 0, i32 0) #10
  %389 = extractvalue { float, float, float, float } %388, 0
  %390 = extractvalue { float, float, float, float } %388, 1
  %391 = extractvalue { float, float, float, float } %388, 2
  %392 = extractvalue { float, float, float, float } %388, 3
  %393 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %389, float %390, float %391, float %392, i32 %301, i32 %302, i32 %303, i32 %304, i32 0, i32 0) #10
  %394 = extractvalue { float, float, float, float } %393, 0
  %395 = extractvalue { float, float, float, float } %393, 1
  %396 = extractvalue { float, float, float, float } %393, 2
  %397 = extractvalue { float, float, float, float } %393, 3
  %398 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %394, float %395, float %396, float %397, i32 %309, i32 %310, i32 %311, i32 %312, i32 0, i32 0) #10
  %399 = extractvalue { float, float, float, float } %398, 0
  %400 = extractvalue { float, float, float, float } %398, 1
  %401 = extractvalue { float, float, float, float } %398, 2
  %402 = extractvalue { float, float, float, float } %398, 3
  %403 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %399, float %400, float %401, float %402, i32 %317, i32 %318, i32 %319, i32 %320, i32 0, i32 0) #10
  %404 = extractvalue { float, float, float, float } %403, 0
  %405 = extractvalue { float, float, float, float } %403, 1
  %406 = extractvalue { float, float, float, float } %403, 2
  %407 = extractvalue { float, float, float, float } %403, 3
  %408 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %404, float %405, float %406, float %407, i32 %325, i32 %326, i32 %327, i32 %328, i32 0, i32 0) #10
  %409 = extractvalue { float, float, float, float } %408, 0
  %410 = extractvalue { float, float, float, float } %408, 1
  %411 = extractvalue { float, float, float, float } %408, 2
  %412 = extractvalue { float, float, float, float } %408, 3
  %413 = insertvalue { float, float, float, float } undef, float %409, 0
  %414 = insertvalue { float, float, float, float } %413, float %410, 1
  %415 = insertvalue { float, float, float, float } %414, float %411, 2
  %416 = insertvalue { float, float, float, float } %415, float %412, 3
  %417 = add i32 %197, 1
  %418 = icmp slt i32 %417, 2
  %419 = select i1 %418, i32 %417, i32 0
  %scevgep45 = getelementptr i8, ptr addrspace(1) %lsr.iv43, i64 %173
  %scevgep41 = getelementptr i8, ptr addrspace(1) %lsr.iv39, i64 %173
  %scevgep37 = getelementptr i8, ptr addrspace(1) %lsr.iv35, i64 %173
  %scevgep33 = getelementptr i8, ptr addrspace(1) %lsr.iv, i64 %173
  %420 = shl i32 %419, 12
  %421 = sext i32 %420 to i64
  %422 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %421
  tail call void @llvm.nvvm.barrier0()
  %423 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %422, i64 %57
  %424 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %422, i64 %64
  %425 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %422, i64 %68
  %426 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %422, i64 %75
  %427 = select i1 %200, i32 16, i32 0
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %423, ptr addrspace(1) %scevgep45, i32 %427) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %424, ptr addrspace(1) %scevgep41, i32 %427) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %425, ptr addrspace(1) %scevgep37, i32 %427) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %426, ptr addrspace(1) %scevgep33, i32 %427) #10
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #10
  %428 = add i32 %196, 1
  %429 = icmp slt i32 %428, 2
  %430 = select i1 %429, i32 %428, i32 0
  tail call void asm sideeffect "cp.async.wait_group 0x1;", ""() #10
  tail call void @llvm.nvvm.barrier0()
  %431 = shl i32 %430, 12
  %432 = sext i32 %431 to i64
  %433 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %432
  %scevgep32 = getelementptr i8, ptr addrspace(1) %lsr.iv, i64 512
  %scevgep36 = getelementptr i8, ptr addrspace(1) %lsr.iv35, i64 512
  %scevgep40 = getelementptr i8, ptr addrspace(1) %lsr.iv39, i64 512
  %scevgep44 = getelementptr i8, ptr addrspace(1) %lsr.iv43, i64 512
  %434 = icmp samesign ult i32 %199, 1792
  br i1 %434, label %194, label %435

435:                                              ; preds = %194
  %436 = icmp ult i32 %13, 64
  %437 = mul i32 %2, 8
  %.decomposed = sub i32 %.frozen, %437
  %438 = sdiv i32 %.decomposed, %5
  tail call void asm sideeffect "cp.async.wait_group 0x0;", ""() #10
  tail call void @llvm.nvvm.barrier0()
  %439 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %409) #10
  %440 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %410) #10
  %441 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %411) #10
  %442 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %412) #10
  %443 = shl nsw i32 %438, 4
  %444 = sext i32 %8 to i64
  %445 = sext i32 %443 to i64
  %446 = shl nuw nsw i32 %13, 1
  %447 = and i32 %446, 14
  %448 = lshr i32 %13, 3
  %449 = and i32 %448, 7
  %450 = select i1 %436, i32 0, i32 8
  %451 = or disjoint i32 %449, %450
  %452 = zext nneg i32 %447 to i64
  %453 = zext nneg i32 %451 to i64
  %454 = or disjoint i64 %444, %452
  %455 = or disjoint i64 %445, %453
  %456 = getelementptr bfloat, ptr addrspace(1) %arg230, i64 %454
  %.idx = shl nsw i64 %455, 12
  %457 = getelementptr i8, ptr addrspace(1) %456, i64 %.idx
  %458 = shl nuw nsw i32 %13, 5
  %459 = and i32 %458, 96
  %460 = lshr i32 %13, 2
  %461 = and i32 %460, 3
  %462 = or disjoint i32 %461, %459
  %463 = lshr exact i32 %41, 2
  %464 = or disjoint i32 %462, %463
  %465 = shl nuw nsw i32 %14, 2
  %466 = or disjoint i32 %464, %465
  %467 = and i32 %446, 126
  %468 = select i1 %436, i32 0, i32 128
  %469 = or disjoint i32 %467, %468
  %470 = lshr i32 %466, 3
  %471 = add nuw nsw i32 %470, %466
  %472 = zext nneg i32 %471 to i64
  %473 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %472
  %474 = bitcast bfloat %439 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %473, <1 x i16> %474, i1 true) #10
  %475 = or disjoint i32 %466, 16
  %476 = lshr i32 %475, 3
  %477 = zext nneg i32 %476 to i64
  %478 = zext nneg i32 %466 to i64
  %479 = add i64 %477, %478
  %480 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %479
  %481 = getelementptr inbounds i8, ptr addrspace(3) %480, i64 32
  %482 = bitcast bfloat %440 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %481, <1 x i16> %482, i1 true) #10
  %483 = zext nneg i32 %470 to i64
  %484 = add i64 %478, %483
  %485 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %484
  %486 = getelementptr inbounds i8, ptr addrspace(3) %485, i64 16
  %487 = bitcast bfloat %441 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %486, <1 x i16> %487, i1 true) #10
  %488 = or disjoint i32 %466, 24
  %489 = lshr i32 %488, 3
  %490 = and i32 %489, 536870910
  %491 = zext nneg i32 %490 to i64
  %492 = add i64 %491, %478
  %493 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %492
  %494 = getelementptr inbounds i8, ptr addrspace(3) %493, i64 48
  %495 = bitcast bfloat %442 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %494, <1 x i16> %495, i1 true) #10
  tail call void @llvm.nvvm.barrier0()
  %496 = lshr i32 %469, 3
  %497 = and i32 %496, 30
  %498 = add nuw nsw i32 %497, %469
  %499 = zext nneg i32 %498 to i64
  %500 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %499
  %501 = load i32, ptr addrspace(3) %500, align 4
  tail call void asm sideeffect "st.global.b32 [ $1 + 0 ], { $0 };", "r,l"(i32 %501, ptr addrspace(1) %457) #10
  ret void
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #4

define ptx_kernel void @fusion_38(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(32768) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4) local_unnamed_addr #5 {
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %3 = shl nsw i64 %2, 8
  %4 = and i64 %3, 768
  %5 = shl nsw i64 %2, 9
  %6 = and i64 %5, -2048
  %7 = or disjoint i64 %6, %4
  %8 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %7
  %9 = tail call range(i32 0, 64) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %10 = and i32 %9, 31
  %11 = lshr i32 %9, 5
  %12 = shl nuw nsw i32 %9, 2
  %13 = and i32 %12, 124
  %14 = icmp samesign ult i32 %9, 32
  %15 = select i1 %14, i32 0, i32 128
  %16 = or disjoint i32 %13, %15
  %17 = zext nneg i32 %16 to i64
  %18 = getelementptr bfloat, ptr addrspace(1) %8, i64 %17
  %19 = getelementptr i8, ptr addrspace(1) %18, i64 2048
  %20 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %19) #10
  %21 = extractvalue { i32, i32 } %20, 0
  %22 = bitcast i32 %21 to <2 x bfloat>
  %23 = extractvalue { i32, i32 } %20, 1
  %24 = bitcast i32 %23 to <2 x bfloat>
  %25 = extractelement <2 x bfloat> %22, i64 0
  %26 = extractelement <2 x bfloat> %22, i64 1
  %27 = extractelement <2 x bfloat> %24, i64 0
  %28 = extractelement <2 x bfloat> %24, i64 1
  %29 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %25) #10
  %30 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %26) #10
  %31 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #10
  %32 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #10
  %33 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %3
  %34 = getelementptr bfloat, ptr addrspace(1) %33, i64 %17
  %35 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %34) #10
  %36 = extractvalue { i32, i32 } %35, 0
  %37 = bitcast i32 %36 to <2 x bfloat>
  %38 = extractvalue { i32, i32 } %35, 1
  %39 = bitcast i32 %38 to <2 x bfloat>
  %40 = extractelement <2 x bfloat> %37, i64 0
  %41 = extractelement <2 x bfloat> %37, i64 1
  %42 = extractelement <2 x bfloat> %39, i64 0
  %43 = extractelement <2 x bfloat> %39, i64 1
  %44 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %40) #10
  %45 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %41) #10
  %46 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %42) #10
  %47 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %43) #10
  %48 = fadd float %29, %44
  %49 = fadd float %30, %45
  %50 = fadd float %31, %46
  %51 = fadd float %32, %47
  %52 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %6
  %53 = getelementptr i8, ptr addrspace(1) %52, i64 2048
  %54 = shl nuw nsw i32 %9, 3
  %55 = and i32 %54, 248
  %56 = select i1 %14, i32 0, i32 256
  %57 = or disjoint i32 %55, %56
  %58 = zext nneg i32 %57 to i64
  %59 = getelementptr bfloat, ptr addrspace(1) %52, i64 %58
  %60 = getelementptr i8, ptr addrspace(1) %59, i64 2048
  %61 = getelementptr bfloat, ptr addrspace(1) %53, i64 %58
  %62 = getelementptr i8, ptr addrspace(1) %61, i64 1024
  %63 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %60) #10
  %64 = extractvalue { i32, i32, i32, i32 } %63, 0
  %65 = bitcast i32 %64 to <2 x bfloat>
  %66 = extractvalue { i32, i32, i32, i32 } %63, 1
  %67 = bitcast i32 %66 to <2 x bfloat>
  %68 = extractvalue { i32, i32, i32, i32 } %63, 2
  %69 = bitcast i32 %68 to <2 x bfloat>
  %70 = extractvalue { i32, i32, i32, i32 } %63, 3
  %71 = bitcast i32 %70 to <2 x bfloat>
  %72 = extractelement <2 x bfloat> %65, i64 0
  %73 = extractelement <2 x bfloat> %65, i64 1
  %74 = extractelement <2 x bfloat> %67, i64 0
  %75 = extractelement <2 x bfloat> %67, i64 1
  %76 = extractelement <2 x bfloat> %69, i64 0
  %77 = extractelement <2 x bfloat> %69, i64 1
  %78 = extractelement <2 x bfloat> %71, i64 0
  %79 = extractelement <2 x bfloat> %71, i64 1
  %80 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %62) #10
  %81 = extractvalue { i32, i32, i32, i32 } %80, 0
  %82 = bitcast i32 %81 to <2 x bfloat>
  %83 = extractvalue { i32, i32, i32, i32 } %80, 1
  %84 = bitcast i32 %83 to <2 x bfloat>
  %85 = extractvalue { i32, i32, i32, i32 } %80, 2
  %86 = bitcast i32 %85 to <2 x bfloat>
  %87 = extractvalue { i32, i32, i32, i32 } %80, 3
  %88 = bitcast i32 %87 to <2 x bfloat>
  %89 = extractelement <2 x bfloat> %82, i64 0
  %90 = extractelement <2 x bfloat> %82, i64 1
  %91 = extractelement <2 x bfloat> %84, i64 0
  %92 = extractelement <2 x bfloat> %84, i64 1
  %93 = extractelement <2 x bfloat> %86, i64 0
  %94 = extractelement <2 x bfloat> %86, i64 1
  %95 = extractelement <2 x bfloat> %88, i64 0
  %96 = extractelement <2 x bfloat> %88, i64 1
  %97 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %72) #10
  %98 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %73) #10
  %99 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %74) #10
  %100 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %75) #10
  %101 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %76) #10
  %102 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %77) #10
  %103 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %78) #10
  %104 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %79) #10
  %105 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %89) #10
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %90) #10
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %91) #10
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %92) #10
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %93) #10
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %94) #10
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %95) #10
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %96) #10
  %113 = getelementptr i8, ptr addrspace(1) %arg13, i64 %6
  %114 = getelementptr bfloat, ptr addrspace(1) %113, i64 %58
  %115 = getelementptr i8, ptr addrspace(1) %114, i64 1024
  %116 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %114) #10
  %117 = extractvalue { i32, i32, i32, i32 } %116, 0
  %118 = bitcast i32 %117 to <2 x bfloat>
  %119 = extractvalue { i32, i32, i32, i32 } %116, 1
  %120 = bitcast i32 %119 to <2 x bfloat>
  %121 = extractvalue { i32, i32, i32, i32 } %116, 2
  %122 = bitcast i32 %121 to <2 x bfloat>
  %123 = extractvalue { i32, i32, i32, i32 } %116, 3
  %124 = bitcast i32 %123 to <2 x bfloat>
  %125 = extractelement <2 x bfloat> %118, i64 0
  %126 = extractelement <2 x bfloat> %118, i64 1
  %127 = extractelement <2 x bfloat> %120, i64 0
  %128 = extractelement <2 x bfloat> %120, i64 1
  %129 = extractelement <2 x bfloat> %122, i64 0
  %130 = extractelement <2 x bfloat> %122, i64 1
  %131 = extractelement <2 x bfloat> %124, i64 0
  %132 = extractelement <2 x bfloat> %124, i64 1
  %133 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %115) #10
  %134 = extractvalue { i32, i32, i32, i32 } %133, 0
  %135 = bitcast i32 %134 to <2 x bfloat>
  %136 = extractvalue { i32, i32, i32, i32 } %133, 1
  %137 = bitcast i32 %136 to <2 x bfloat>
  %138 = extractvalue { i32, i32, i32, i32 } %133, 2
  %139 = bitcast i32 %138 to <2 x bfloat>
  %140 = extractvalue { i32, i32, i32, i32 } %133, 3
  %141 = bitcast i32 %140 to <2 x bfloat>
  %142 = extractelement <2 x bfloat> %135, i64 0
  %143 = extractelement <2 x bfloat> %135, i64 1
  %144 = extractelement <2 x bfloat> %137, i64 0
  %145 = extractelement <2 x bfloat> %137, i64 1
  %146 = extractelement <2 x bfloat> %139, i64 0
  %147 = extractelement <2 x bfloat> %139, i64 1
  %148 = extractelement <2 x bfloat> %141, i64 0
  %149 = extractelement <2 x bfloat> %141, i64 1
  %150 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %125) #10
  %151 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %126) #10
  %152 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %127) #10
  %153 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %128) #10
  %154 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %129) #10
  %155 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %130) #10
  %156 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %131) #10
  %157 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %132) #10
  %158 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #10
  %159 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %143) #10
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %144) #10
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %145) #10
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %146) #10
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %147) #10
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %148) #10
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %149) #10
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
  %176 = fadd float %107, %160
  %177 = fadd float %108, %161
  %178 = fadd float %109, %162
  %179 = fadd float %110, %163
  %180 = fadd float %111, %164
  %181 = fadd float %112, %165
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
  %192 = fmul float %176, %176
  %193 = fmul float %177, %177
  %194 = fmul float %178, %178
  %195 = fmul float %179, %179
  %196 = fmul float %180, %180
  %197 = fmul float %181, %181
  %198 = fadd float %182, %183
  %199 = fadd float %198, %184
  %200 = fadd float %199, %185
  %201 = fadd float %200, %186
  %202 = fadd float %201, %187
  %203 = fadd float %202, %188
  %204 = fadd float %203, %189
  %205 = fadd float %204, %190
  %206 = fadd float %205, %191
  %207 = fadd float %206, %192
  %208 = fadd float %207, %193
  %209 = fadd float %208, %194
  %210 = fadd float %209, %195
  %211 = fadd float %210, %196
  %212 = fadd float %211, %197
  %213 = bitcast float %212 to i32
  %214 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %213, i32 16, i32 31)
  %215 = bitcast i32 %214 to float
  %216 = fadd float %212, %215
  %217 = bitcast float %216 to i32
  %218 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %217, i32 8, i32 31)
  %219 = bitcast i32 %218 to float
  %220 = fadd float %216, %219
  %221 = bitcast float %220 to i32
  %222 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %221, i32 4, i32 31)
  %223 = bitcast i32 %222 to float
  %224 = fadd float %220, %223
  %225 = bitcast float %224 to i32
  %226 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %225, i32 2, i32 31)
  %227 = bitcast i32 %226 to float
  %228 = fadd float %224, %227
  %229 = bitcast float %228 to i32
  %230 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %229, i32 1, i32 31)
  %231 = bitcast i32 %230 to float
  %232 = fadd float %228, %231
  %233 = icmp eq i32 %10, 0
  %234 = zext nneg i32 %11 to i64
  %235 = getelementptr float, ptr addrspace(3) @global_smem, i64 %234
  %236 = bitcast float %232 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %235, <1 x i32> %236, i1 %233) #10
  tail call void @llvm.nvvm.barrier0()
  %237 = icmp samesign ult i32 %9, 2
  %238 = zext nneg i32 %9 to i64
  %239 = getelementptr float, ptr addrspace(3) @global_smem, i64 %238
  %240 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %239, i1 %237) #10
  %241 = bitcast i32 %240 to float
  %242 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %240, i32 1, i32 31)
  %243 = bitcast i32 %242 to float
  %244 = fadd float %241, %243
  %245 = icmp eq i32 %9, 0
  %246 = bitcast float %244 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %239, <1 x i32> %246, i1 %245) #10
  tail call void @llvm.nvvm.barrier0()
  %247 = load float, ptr addrspace(3) @global_smem, align 16
  %248 = fmul float %247, 0x3F50000000000000
  %249 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
  %250 = bitcast i32 %249 to float
  %251 = fadd float %248, %250
  %252 = tail call float @llvm.nvvm.rsqrt.approx.f(float %251)
  %253 = fmul float %48, %252
  %254 = fmul float %49, %252
  %255 = fmul float %50, %252
  %256 = fmul float %51, %252
  %257 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %4
  %258 = getelementptr bfloat, ptr addrspace(1) %257, i64 %17
  %259 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %258) #10
  %260 = extractvalue { i32, i32 } %259, 0
  %261 = bitcast i32 %260 to <2 x bfloat>
  %262 = extractvalue { i32, i32 } %259, 1
  %263 = bitcast i32 %262 to <2 x bfloat>
  %264 = extractelement <2 x bfloat> %261, i64 0
  %265 = extractelement <2 x bfloat> %261, i64 1
  %266 = extractelement <2 x bfloat> %263, i64 0
  %267 = extractelement <2 x bfloat> %263, i64 1
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %264) #10
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %265) #10
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %266) #10
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %267) #10
  %272 = fmul float %253, %268
  %273 = fmul float %254, %269
  %274 = fmul float %255, %270
  %275 = fmul float %256, %271
  %276 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %272) #10
  %277 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %273) #10
  %278 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %274) #10
  %279 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %275) #10
  %280 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %3
  %281 = getelementptr bfloat, ptr addrspace(1) %280, i64 %17
  %282 = insertelement <2 x bfloat> poison, bfloat %276, i64 0
  %283 = insertelement <2 x bfloat> %282, bfloat %277, i64 1
  %284 = bitcast <2 x bfloat> %283 to i32
  %285 = insertelement <2 x bfloat> poison, bfloat %278, i64 0
  %286 = insertelement <2 x bfloat> %285, bfloat %279, i64 1
  %287 = bitcast <2 x bfloat> %286 to i32
  tail call void asm sideeffect "st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l"(i32 %284, i32 %287, ptr addrspace(1) %281) #10
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_convert_fusion_1(ptr noalias readonly align 128 captures(none) dereferenceable(196608) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(98304) %1) local_unnamed_addr #0 {
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

define ptx_kernel void @fusion_36(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(65536) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5) local_unnamed_addr #5 {
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %3 = lshr i64 %2, 2
  %4 = shl nsw i64 %2, 8
  %5 = and i64 %4, 768
  %6 = shl i64 %3, 11
  %7 = or disjoint i64 %5, %6
  %8 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %7
  %9 = tail call range(i32 0, 64) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %10 = and i32 %9, 31
  %11 = lshr i32 %9, 5
  %12 = shl nuw nsw i32 %9, 2
  %13 = and i32 %12, 124
  %14 = icmp samesign ult i32 %9, 32
  %15 = select i1 %14, i32 0, i32 128
  %16 = or disjoint i32 %13, %15
  %17 = zext nneg i32 %16 to i64
  %18 = getelementptr bfloat, ptr addrspace(1) %8, i64 %17
  %19 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %18) #10
  %20 = extractvalue { i32, i32 } %19, 0
  %21 = bitcast i32 %20 to <2 x bfloat>
  %22 = extractvalue { i32, i32 } %19, 1
  %23 = bitcast i32 %22 to <2 x bfloat>
  %24 = extractelement <2 x bfloat> %21, i64 0
  %25 = extractelement <2 x bfloat> %21, i64 1
  %26 = extractelement <2 x bfloat> %23, i64 0
  %27 = extractelement <2 x bfloat> %23, i64 1
  %28 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %24) #10
  %29 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %25) #10
  %30 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %26) #10
  %31 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #10
  %32 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %4
  %33 = getelementptr bfloat, ptr addrspace(1) %32, i64 %17
  %34 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %33) #10
  %35 = extractvalue { i32, i32 } %34, 0
  %36 = bitcast i32 %35 to <2 x bfloat>
  %37 = extractvalue { i32, i32 } %34, 1
  %38 = bitcast i32 %37 to <2 x bfloat>
  %39 = extractelement <2 x bfloat> %36, i64 0
  %40 = extractelement <2 x bfloat> %36, i64 1
  %41 = extractelement <2 x bfloat> %38, i64 0
  %42 = extractelement <2 x bfloat> %38, i64 1
  %43 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %39) #10
  %44 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %40) #10
  %45 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %41) #10
  %46 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %42) #10
  %47 = getelementptr i8, ptr addrspace(1) %18, i64 2048
  %48 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %47) #10
  %49 = extractvalue { i32, i32 } %48, 0
  %50 = bitcast i32 %49 to <2 x bfloat>
  %51 = extractvalue { i32, i32 } %48, 1
  %52 = bitcast i32 %51 to <2 x bfloat>
  %53 = extractelement <2 x bfloat> %50, i64 0
  %54 = extractelement <2 x bfloat> %50, i64 1
  %55 = extractelement <2 x bfloat> %52, i64 0
  %56 = extractelement <2 x bfloat> %52, i64 1
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %53) #10
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %54) #10
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %55) #10
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %56) #10
  %61 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %4
  %62 = getelementptr bfloat, ptr addrspace(1) %61, i64 %17
  %63 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %62) #10
  %64 = extractvalue { i32, i32 } %63, 0
  %65 = bitcast i32 %64 to <2 x bfloat>
  %66 = extractvalue { i32, i32 } %63, 1
  %67 = bitcast i32 %66 to <2 x bfloat>
  %68 = extractelement <2 x bfloat> %65, i64 0
  %69 = extractelement <2 x bfloat> %65, i64 1
  %70 = extractelement <2 x bfloat> %67, i64 0
  %71 = extractelement <2 x bfloat> %67, i64 1
  %72 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %68) #10
  %73 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %69) #10
  %74 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %70) #10
  %75 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %71) #10
  %76 = fadd float %57, %72
  %77 = fadd float %58, %73
  %78 = fadd float %59, %74
  %79 = fadd float %60, %75
  %80 = fadd float %43, %76
  %81 = fadd float %44, %77
  %82 = fadd float %45, %78
  %83 = fadd float %46, %79
  %84 = fadd float %28, %80
  %85 = fadd float %29, %81
  %86 = fadd float %30, %82
  %87 = fadd float %31, %83
  %88 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %6
  %89 = shl nuw nsw i32 %9, 3
  %90 = and i32 %89, 248
  %91 = select i1 %14, i32 0, i32 256
  %92 = or disjoint i32 %90, %91
  %93 = zext nneg i32 %92 to i64
  %94 = getelementptr bfloat, ptr addrspace(1) %88, i64 %93
  %95 = getelementptr i8, ptr addrspace(1) %94, i64 1024
  %96 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %94) #10
  %97 = extractvalue { i32, i32, i32, i32 } %96, 0
  %98 = bitcast i32 %97 to <2 x bfloat>
  %99 = extractvalue { i32, i32, i32, i32 } %96, 1
  %100 = bitcast i32 %99 to <2 x bfloat>
  %101 = extractvalue { i32, i32, i32, i32 } %96, 2
  %102 = bitcast i32 %101 to <2 x bfloat>
  %103 = extractvalue { i32, i32, i32, i32 } %96, 3
  %104 = bitcast i32 %103 to <2 x bfloat>
  %105 = extractelement <2 x bfloat> %98, i64 0
  %106 = extractelement <2 x bfloat> %98, i64 1
  %107 = extractelement <2 x bfloat> %100, i64 0
  %108 = extractelement <2 x bfloat> %100, i64 1
  %109 = extractelement <2 x bfloat> %102, i64 0
  %110 = extractelement <2 x bfloat> %102, i64 1
  %111 = extractelement <2 x bfloat> %104, i64 0
  %112 = extractelement <2 x bfloat> %104, i64 1
  %113 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %95) #10
  %114 = extractvalue { i32, i32, i32, i32 } %113, 0
  %115 = bitcast i32 %114 to <2 x bfloat>
  %116 = extractvalue { i32, i32, i32, i32 } %113, 1
  %117 = bitcast i32 %116 to <2 x bfloat>
  %118 = extractvalue { i32, i32, i32, i32 } %113, 2
  %119 = bitcast i32 %118 to <2 x bfloat>
  %120 = extractvalue { i32, i32, i32, i32 } %113, 3
  %121 = bitcast i32 %120 to <2 x bfloat>
  %122 = extractelement <2 x bfloat> %115, i64 0
  %123 = extractelement <2 x bfloat> %115, i64 1
  %124 = extractelement <2 x bfloat> %117, i64 0
  %125 = extractelement <2 x bfloat> %117, i64 1
  %126 = extractelement <2 x bfloat> %119, i64 0
  %127 = extractelement <2 x bfloat> %119, i64 1
  %128 = extractelement <2 x bfloat> %121, i64 0
  %129 = extractelement <2 x bfloat> %121, i64 1
  %130 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #10
  %131 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %106) #10
  %132 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %107) #10
  %133 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %108) #10
  %134 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %109) #10
  %135 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %110) #10
  %136 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %111) #10
  %137 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %112) #10
  %138 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %122) #10
  %139 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %123) #10
  %140 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %124) #10
  %141 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %125) #10
  %142 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %126) #10
  %143 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %127) #10
  %144 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %128) #10
  %145 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %129) #10
  %146 = shl i64 %3, 10
  %147 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %146
  %148 = getelementptr bfloat, ptr addrspace(1) %147, i64 %93
  %149 = getelementptr i8, ptr addrspace(1) %148, i64 1024
  %150 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %148) #10
  %151 = extractvalue { i32, i32, i32, i32 } %150, 0
  %152 = bitcast i32 %151 to <2 x bfloat>
  %153 = extractvalue { i32, i32, i32, i32 } %150, 1
  %154 = bitcast i32 %153 to <2 x bfloat>
  %155 = extractvalue { i32, i32, i32, i32 } %150, 2
  %156 = bitcast i32 %155 to <2 x bfloat>
  %157 = extractvalue { i32, i32, i32, i32 } %150, 3
  %158 = bitcast i32 %157 to <2 x bfloat>
  %159 = extractelement <2 x bfloat> %152, i64 0
  %160 = extractelement <2 x bfloat> %152, i64 1
  %161 = extractelement <2 x bfloat> %154, i64 0
  %162 = extractelement <2 x bfloat> %154, i64 1
  %163 = extractelement <2 x bfloat> %156, i64 0
  %164 = extractelement <2 x bfloat> %156, i64 1
  %165 = extractelement <2 x bfloat> %158, i64 0
  %166 = extractelement <2 x bfloat> %158, i64 1
  %167 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %149) #10
  %168 = extractvalue { i32, i32, i32, i32 } %167, 0
  %169 = bitcast i32 %168 to <2 x bfloat>
  %170 = extractvalue { i32, i32, i32, i32 } %167, 1
  %171 = bitcast i32 %170 to <2 x bfloat>
  %172 = extractvalue { i32, i32, i32, i32 } %167, 2
  %173 = bitcast i32 %172 to <2 x bfloat>
  %174 = extractvalue { i32, i32, i32, i32 } %167, 3
  %175 = bitcast i32 %174 to <2 x bfloat>
  %176 = extractelement <2 x bfloat> %169, i64 0
  %177 = extractelement <2 x bfloat> %169, i64 1
  %178 = extractelement <2 x bfloat> %171, i64 0
  %179 = extractelement <2 x bfloat> %171, i64 1
  %180 = extractelement <2 x bfloat> %173, i64 0
  %181 = extractelement <2 x bfloat> %173, i64 1
  %182 = extractelement <2 x bfloat> %175, i64 0
  %183 = extractelement <2 x bfloat> %175, i64 1
  %184 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #10
  %185 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %160) #10
  %186 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %161) #10
  %187 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %162) #10
  %188 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %163) #10
  %189 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %164) #10
  %190 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %165) #10
  %191 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %166) #10
  %192 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %176) #10
  %193 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %177) #10
  %194 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %178) #10
  %195 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %179) #10
  %196 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %180) #10
  %197 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %181) #10
  %198 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %182) #10
  %199 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %183) #10
  %200 = getelementptr i8, ptr addrspace(1) %88, i64 2048
  %201 = getelementptr i8, ptr addrspace(1) %94, i64 2048
  %202 = getelementptr bfloat, ptr addrspace(1) %200, i64 %93
  %203 = getelementptr i8, ptr addrspace(1) %202, i64 1024
  %204 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %201) #10
  %205 = extractvalue { i32, i32, i32, i32 } %204, 0
  %206 = bitcast i32 %205 to <2 x bfloat>
  %207 = extractvalue { i32, i32, i32, i32 } %204, 1
  %208 = bitcast i32 %207 to <2 x bfloat>
  %209 = extractvalue { i32, i32, i32, i32 } %204, 2
  %210 = bitcast i32 %209 to <2 x bfloat>
  %211 = extractvalue { i32, i32, i32, i32 } %204, 3
  %212 = bitcast i32 %211 to <2 x bfloat>
  %213 = extractelement <2 x bfloat> %206, i64 0
  %214 = extractelement <2 x bfloat> %206, i64 1
  %215 = extractelement <2 x bfloat> %208, i64 0
  %216 = extractelement <2 x bfloat> %208, i64 1
  %217 = extractelement <2 x bfloat> %210, i64 0
  %218 = extractelement <2 x bfloat> %210, i64 1
  %219 = extractelement <2 x bfloat> %212, i64 0
  %220 = extractelement <2 x bfloat> %212, i64 1
  %221 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %203) #10
  %222 = extractvalue { i32, i32, i32, i32 } %221, 0
  %223 = bitcast i32 %222 to <2 x bfloat>
  %224 = extractvalue { i32, i32, i32, i32 } %221, 1
  %225 = bitcast i32 %224 to <2 x bfloat>
  %226 = extractvalue { i32, i32, i32, i32 } %221, 2
  %227 = bitcast i32 %226 to <2 x bfloat>
  %228 = extractvalue { i32, i32, i32, i32 } %221, 3
  %229 = bitcast i32 %228 to <2 x bfloat>
  %230 = extractelement <2 x bfloat> %223, i64 0
  %231 = extractelement <2 x bfloat> %223, i64 1
  %232 = extractelement <2 x bfloat> %225, i64 0
  %233 = extractelement <2 x bfloat> %225, i64 1
  %234 = extractelement <2 x bfloat> %227, i64 0
  %235 = extractelement <2 x bfloat> %227, i64 1
  %236 = extractelement <2 x bfloat> %229, i64 0
  %237 = extractelement <2 x bfloat> %229, i64 1
  %238 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %213) #10
  %239 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %214) #10
  %240 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %215) #10
  %241 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %216) #10
  %242 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %217) #10
  %243 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %218) #10
  %244 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %219) #10
  %245 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %220) #10
  %246 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %230) #10
  %247 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %231) #10
  %248 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %232) #10
  %249 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %233) #10
  %250 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %234) #10
  %251 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %235) #10
  %252 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %236) #10
  %253 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %237) #10
  %254 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %146
  %255 = getelementptr bfloat, ptr addrspace(1) %254, i64 %93
  %256 = getelementptr i8, ptr addrspace(1) %255, i64 1024
  %257 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %255) #10
  %258 = extractvalue { i32, i32, i32, i32 } %257, 0
  %259 = bitcast i32 %258 to <2 x bfloat>
  %260 = extractvalue { i32, i32, i32, i32 } %257, 1
  %261 = bitcast i32 %260 to <2 x bfloat>
  %262 = extractvalue { i32, i32, i32, i32 } %257, 2
  %263 = bitcast i32 %262 to <2 x bfloat>
  %264 = extractvalue { i32, i32, i32, i32 } %257, 3
  %265 = bitcast i32 %264 to <2 x bfloat>
  %266 = extractelement <2 x bfloat> %259, i64 0
  %267 = extractelement <2 x bfloat> %259, i64 1
  %268 = extractelement <2 x bfloat> %261, i64 0
  %269 = extractelement <2 x bfloat> %261, i64 1
  %270 = extractelement <2 x bfloat> %263, i64 0
  %271 = extractelement <2 x bfloat> %263, i64 1
  %272 = extractelement <2 x bfloat> %265, i64 0
  %273 = extractelement <2 x bfloat> %265, i64 1
  %274 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %256) #10
  %275 = extractvalue { i32, i32, i32, i32 } %274, 0
  %276 = bitcast i32 %275 to <2 x bfloat>
  %277 = extractvalue { i32, i32, i32, i32 } %274, 1
  %278 = bitcast i32 %277 to <2 x bfloat>
  %279 = extractvalue { i32, i32, i32, i32 } %274, 2
  %280 = bitcast i32 %279 to <2 x bfloat>
  %281 = extractvalue { i32, i32, i32, i32 } %274, 3
  %282 = bitcast i32 %281 to <2 x bfloat>
  %283 = extractelement <2 x bfloat> %276, i64 0
  %284 = extractelement <2 x bfloat> %276, i64 1
  %285 = extractelement <2 x bfloat> %278, i64 0
  %286 = extractelement <2 x bfloat> %278, i64 1
  %287 = extractelement <2 x bfloat> %280, i64 0
  %288 = extractelement <2 x bfloat> %280, i64 1
  %289 = extractelement <2 x bfloat> %282, i64 0
  %290 = extractelement <2 x bfloat> %282, i64 1
  %291 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %266) #10
  %292 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %267) #10
  %293 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %268) #10
  %294 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %269) #10
  %295 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %270) #10
  %296 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %271) #10
  %297 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %272) #10
  %298 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %273) #10
  %299 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %283) #10
  %300 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %284) #10
  %301 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %285) #10
  %302 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %286) #10
  %303 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %287) #10
  %304 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %288) #10
  %305 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %289) #10
  %306 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %290) #10
  %307 = fadd float %238, %291
  %308 = fadd float %239, %292
  %309 = fadd float %240, %293
  %310 = fadd float %241, %294
  %311 = fadd float %242, %295
  %312 = fadd float %243, %296
  %313 = fadd float %244, %297
  %314 = fadd float %245, %298
  %315 = fadd float %246, %299
  %316 = fadd float %247, %300
  %317 = fadd float %248, %301
  %318 = fadd float %249, %302
  %319 = fadd float %250, %303
  %320 = fadd float %251, %304
  %321 = fadd float %252, %305
  %322 = fadd float %253, %306
  %323 = fadd float %184, %307
  %324 = fadd float %185, %308
  %325 = fadd float %186, %309
  %326 = fadd float %187, %310
  %327 = fadd float %188, %311
  %328 = fadd float %189, %312
  %329 = fadd float %190, %313
  %330 = fadd float %191, %314
  %331 = fadd float %192, %315
  %332 = fadd float %193, %316
  %333 = fadd float %194, %317
  %334 = fadd float %195, %318
  %335 = fadd float %196, %319
  %336 = fadd float %197, %320
  %337 = fadd float %198, %321
  %338 = fadd float %199, %322
  %339 = fadd float %130, %323
  %340 = fadd float %131, %324
  %341 = fadd float %132, %325
  %342 = fadd float %133, %326
  %343 = fadd float %134, %327
  %344 = fadd float %135, %328
  %345 = fadd float %136, %329
  %346 = fadd float %137, %330
  %347 = fadd float %138, %331
  %348 = fadd float %139, %332
  %349 = fadd float %140, %333
  %350 = fadd float %141, %334
  %351 = fadd float %142, %335
  %352 = fadd float %143, %336
  %353 = fadd float %144, %337
  %354 = fadd float %145, %338
  %355 = fmul float %339, %339
  %356 = fmul float %340, %340
  %357 = fmul float %341, %341
  %358 = fmul float %342, %342
  %359 = fmul float %343, %343
  %360 = fmul float %344, %344
  %361 = fmul float %345, %345
  %362 = fmul float %346, %346
  %363 = fmul float %347, %347
  %364 = fmul float %348, %348
  %365 = fmul float %349, %349
  %366 = fmul float %350, %350
  %367 = fmul float %351, %351
  %368 = fmul float %352, %352
  %369 = fmul float %353, %353
  %370 = fmul float %354, %354
  %371 = fadd float %355, %356
  %372 = fadd float %371, %357
  %373 = fadd float %372, %358
  %374 = fadd float %373, %359
  %375 = fadd float %374, %360
  %376 = fadd float %375, %361
  %377 = fadd float %376, %362
  %378 = fadd float %377, %363
  %379 = fadd float %378, %364
  %380 = fadd float %379, %365
  %381 = fadd float %380, %366
  %382 = fadd float %381, %367
  %383 = fadd float %382, %368
  %384 = fadd float %383, %369
  %385 = fadd float %384, %370
  %386 = bitcast float %385 to i32
  %387 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %386, i32 16, i32 31)
  %388 = bitcast i32 %387 to float
  %389 = fadd float %385, %388
  %390 = bitcast float %389 to i32
  %391 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %390, i32 8, i32 31)
  %392 = bitcast i32 %391 to float
  %393 = fadd float %389, %392
  %394 = bitcast float %393 to i32
  %395 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %394, i32 4, i32 31)
  %396 = bitcast i32 %395 to float
  %397 = fadd float %393, %396
  %398 = bitcast float %397 to i32
  %399 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %398, i32 2, i32 31)
  %400 = bitcast i32 %399 to float
  %401 = fadd float %397, %400
  %402 = bitcast float %401 to i32
  %403 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %402, i32 1, i32 31)
  %404 = bitcast i32 %403 to float
  %405 = fadd float %401, %404
  %406 = icmp eq i32 %10, 0
  %407 = zext nneg i32 %11 to i64
  %408 = getelementptr float, ptr addrspace(3) @global_smem, i64 %407
  %409 = bitcast float %405 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %408, <1 x i32> %409, i1 %406) #10
  tail call void @llvm.nvvm.barrier0()
  %410 = icmp samesign ult i32 %9, 2
  %411 = zext nneg i32 %9 to i64
  %412 = getelementptr float, ptr addrspace(3) @global_smem, i64 %411
  %413 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %412, i1 %410) #10
  %414 = bitcast i32 %413 to float
  %415 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %413, i32 1, i32 31)
  %416 = bitcast i32 %415 to float
  %417 = fadd float %414, %416
  %418 = icmp eq i32 %9, 0
  %419 = bitcast float %417 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %412, <1 x i32> %419, i1 %418) #10
  tail call void @llvm.nvvm.barrier0()
  %420 = load float, ptr addrspace(3) @global_smem, align 16
  %421 = fmul float %420, 0x3F50000000000000
  %422 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
  %423 = bitcast i32 %422 to float
  %424 = fadd float %421, %423
  %425 = tail call float @llvm.nvvm.rsqrt.approx.f(float %424)
  %426 = fmul float %84, %425
  %427 = fmul float %85, %425
  %428 = fmul float %86, %425
  %429 = fmul float %87, %425
  %430 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %5
  %431 = getelementptr bfloat, ptr addrspace(1) %430, i64 %17
  %432 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %431) #10
  %433 = extractvalue { i32, i32 } %432, 0
  %434 = bitcast i32 %433 to <2 x bfloat>
  %435 = extractvalue { i32, i32 } %432, 1
  %436 = bitcast i32 %435 to <2 x bfloat>
  %437 = extractelement <2 x bfloat> %434, i64 0
  %438 = extractelement <2 x bfloat> %434, i64 1
  %439 = extractelement <2 x bfloat> %436, i64 0
  %440 = extractelement <2 x bfloat> %436, i64 1
  %441 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %437) #10
  %442 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %438) #10
  %443 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %439) #10
  %444 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %440) #10
  %445 = fmul float %426, %441
  %446 = fmul float %427, %442
  %447 = fmul float %428, %443
  %448 = fmul float %429, %444
  %449 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %445) #10
  %450 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %446) #10
  %451 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %447) #10
  %452 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %448) #10
  %453 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %4
  %454 = getelementptr bfloat, ptr addrspace(1) %453, i64 %17
  %455 = insertelement <2 x bfloat> poison, bfloat %449, i64 0
  %456 = insertelement <2 x bfloat> %455, bfloat %450, i64 1
  %457 = bitcast <2 x bfloat> %456 to i32
  %458 = insertelement <2 x bfloat> poison, bfloat %451, i64 0
  %459 = insertelement <2 x bfloat> %458, bfloat %452, i64 1
  %460 = bitcast <2 x bfloat> %459 to i32
  tail call void asm sideeffect "st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l"(i32 %457, i32 %460, ptr addrspace(1) %454) #10
  ret void
}

define ptx_kernel void @fusion_34(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(32768) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(65536) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6) local_unnamed_addr #5 {
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %3 = lshr i64 %2, 2
  %4 = shl nsw i64 %2, 8
  %5 = and i64 %4, 768
  %6 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %4
  %7 = tail call range(i32 0, 64) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %8 = and i32 %7, 31
  %9 = lshr i32 %7, 5
  %10 = shl nuw nsw i32 %7, 2
  %11 = and i32 %10, 124
  %12 = icmp samesign ult i32 %7, 32
  %13 = select i1 %12, i32 0, i32 128
  %14 = or disjoint i32 %11, %13
  %15 = zext nneg i32 %14 to i64
  %16 = getelementptr bfloat, ptr addrspace(1) %6, i64 %15
  %17 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %16) #10
  %18 = extractvalue { i32, i32 } %17, 0
  %19 = bitcast i32 %18 to <2 x bfloat>
  %20 = extractvalue { i32, i32 } %17, 1
  %21 = bitcast i32 %20 to <2 x bfloat>
  %22 = extractelement <2 x bfloat> %19, i64 0
  %23 = extractelement <2 x bfloat> %19, i64 1
  %24 = extractelement <2 x bfloat> %21, i64 0
  %25 = extractelement <2 x bfloat> %21, i64 1
  %26 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %22) #10
  %27 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %23) #10
  %28 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %24) #10
  %29 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %25) #10
  %30 = shl i64 %3, 11
  %31 = or disjoint i64 %5, %30
  %32 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %31
  %33 = getelementptr bfloat, ptr addrspace(1) %32, i64 %15
  %34 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %33) #10
  %35 = extractvalue { i32, i32 } %34, 0
  %36 = bitcast i32 %35 to <2 x bfloat>
  %37 = extractvalue { i32, i32 } %34, 1
  %38 = bitcast i32 %37 to <2 x bfloat>
  %39 = extractelement <2 x bfloat> %36, i64 0
  %40 = extractelement <2 x bfloat> %36, i64 1
  %41 = extractelement <2 x bfloat> %38, i64 0
  %42 = extractelement <2 x bfloat> %38, i64 1
  %43 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %39) #10
  %44 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %40) #10
  %45 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %41) #10
  %46 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %42) #10
  %47 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %4
  %48 = getelementptr bfloat, ptr addrspace(1) %47, i64 %15
  %49 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %48) #10
  %50 = extractvalue { i32, i32 } %49, 0
  %51 = bitcast i32 %50 to <2 x bfloat>
  %52 = extractvalue { i32, i32 } %49, 1
  %53 = bitcast i32 %52 to <2 x bfloat>
  %54 = extractelement <2 x bfloat> %51, i64 0
  %55 = extractelement <2 x bfloat> %51, i64 1
  %56 = extractelement <2 x bfloat> %53, i64 0
  %57 = extractelement <2 x bfloat> %53, i64 1
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %54) #10
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %55) #10
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %56) #10
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %57) #10
  %62 = getelementptr i8, ptr addrspace(1) %33, i64 2048
  %63 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %62) #10
  %64 = extractvalue { i32, i32 } %63, 0
  %65 = bitcast i32 %64 to <2 x bfloat>
  %66 = extractvalue { i32, i32 } %63, 1
  %67 = bitcast i32 %66 to <2 x bfloat>
  %68 = extractelement <2 x bfloat> %65, i64 0
  %69 = extractelement <2 x bfloat> %65, i64 1
  %70 = extractelement <2 x bfloat> %67, i64 0
  %71 = extractelement <2 x bfloat> %67, i64 1
  %72 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %68) #10
  %73 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %69) #10
  %74 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %70) #10
  %75 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %71) #10
  %76 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %4
  %77 = getelementptr bfloat, ptr addrspace(1) %76, i64 %15
  %78 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %77) #10
  %79 = extractvalue { i32, i32 } %78, 0
  %80 = bitcast i32 %79 to <2 x bfloat>
  %81 = extractvalue { i32, i32 } %78, 1
  %82 = bitcast i32 %81 to <2 x bfloat>
  %83 = extractelement <2 x bfloat> %80, i64 0
  %84 = extractelement <2 x bfloat> %80, i64 1
  %85 = extractelement <2 x bfloat> %82, i64 0
  %86 = extractelement <2 x bfloat> %82, i64 1
  %87 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #10
  %88 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #10
  %89 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #10
  %90 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #10
  %91 = fadd float %72, %87
  %92 = fadd float %73, %88
  %93 = fadd float %74, %89
  %94 = fadd float %75, %90
  %95 = fadd float %58, %91
  %96 = fadd float %59, %92
  %97 = fadd float %60, %93
  %98 = fadd float %61, %94
  %99 = fadd float %43, %95
  %100 = fadd float %44, %96
  %101 = fadd float %45, %97
  %102 = fadd float %46, %98
  %103 = fadd float %26, %99
  %104 = fadd float %27, %100
  %105 = fadd float %28, %101
  %106 = fadd float %29, %102
  %107 = shl i64 %3, 10
  %108 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %107
  %109 = shl nuw nsw i32 %7, 3
  %110 = and i32 %109, 248
  %111 = select i1 %12, i32 0, i32 256
  %112 = or disjoint i32 %110, %111
  %113 = zext nneg i32 %112 to i64
  %114 = getelementptr bfloat, ptr addrspace(1) %108, i64 %113
  %115 = getelementptr i8, ptr addrspace(1) %114, i64 1024
  %116 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %114) #10
  %117 = extractvalue { i32, i32, i32, i32 } %116, 0
  %118 = bitcast i32 %117 to <2 x bfloat>
  %119 = extractvalue { i32, i32, i32, i32 } %116, 1
  %120 = bitcast i32 %119 to <2 x bfloat>
  %121 = extractvalue { i32, i32, i32, i32 } %116, 2
  %122 = bitcast i32 %121 to <2 x bfloat>
  %123 = extractvalue { i32, i32, i32, i32 } %116, 3
  %124 = bitcast i32 %123 to <2 x bfloat>
  %125 = extractelement <2 x bfloat> %118, i64 0
  %126 = extractelement <2 x bfloat> %118, i64 1
  %127 = extractelement <2 x bfloat> %120, i64 0
  %128 = extractelement <2 x bfloat> %120, i64 1
  %129 = extractelement <2 x bfloat> %122, i64 0
  %130 = extractelement <2 x bfloat> %122, i64 1
  %131 = extractelement <2 x bfloat> %124, i64 0
  %132 = extractelement <2 x bfloat> %124, i64 1
  %133 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %115) #10
  %134 = extractvalue { i32, i32, i32, i32 } %133, 0
  %135 = bitcast i32 %134 to <2 x bfloat>
  %136 = extractvalue { i32, i32, i32, i32 } %133, 1
  %137 = bitcast i32 %136 to <2 x bfloat>
  %138 = extractvalue { i32, i32, i32, i32 } %133, 2
  %139 = bitcast i32 %138 to <2 x bfloat>
  %140 = extractvalue { i32, i32, i32, i32 } %133, 3
  %141 = bitcast i32 %140 to <2 x bfloat>
  %142 = extractelement <2 x bfloat> %135, i64 0
  %143 = extractelement <2 x bfloat> %135, i64 1
  %144 = extractelement <2 x bfloat> %137, i64 0
  %145 = extractelement <2 x bfloat> %137, i64 1
  %146 = extractelement <2 x bfloat> %139, i64 0
  %147 = extractelement <2 x bfloat> %139, i64 1
  %148 = extractelement <2 x bfloat> %141, i64 0
  %149 = extractelement <2 x bfloat> %141, i64 1
  %150 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %125) #10
  %151 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %126) #10
  %152 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %127) #10
  %153 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %128) #10
  %154 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %129) #10
  %155 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %130) #10
  %156 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %131) #10
  %157 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %132) #10
  %158 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #10
  %159 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %143) #10
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %144) #10
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %145) #10
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %146) #10
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %147) #10
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %148) #10
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %149) #10
  %166 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %30
  %167 = getelementptr bfloat, ptr addrspace(1) %166, i64 %113
  %168 = getelementptr i8, ptr addrspace(1) %167, i64 1024
  %169 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %167) #10
  %170 = extractvalue { i32, i32, i32, i32 } %169, 0
  %171 = bitcast i32 %170 to <2 x bfloat>
  %172 = extractvalue { i32, i32, i32, i32 } %169, 1
  %173 = bitcast i32 %172 to <2 x bfloat>
  %174 = extractvalue { i32, i32, i32, i32 } %169, 2
  %175 = bitcast i32 %174 to <2 x bfloat>
  %176 = extractvalue { i32, i32, i32, i32 } %169, 3
  %177 = bitcast i32 %176 to <2 x bfloat>
  %178 = extractelement <2 x bfloat> %171, i64 0
  %179 = extractelement <2 x bfloat> %171, i64 1
  %180 = extractelement <2 x bfloat> %173, i64 0
  %181 = extractelement <2 x bfloat> %173, i64 1
  %182 = extractelement <2 x bfloat> %175, i64 0
  %183 = extractelement <2 x bfloat> %175, i64 1
  %184 = extractelement <2 x bfloat> %177, i64 0
  %185 = extractelement <2 x bfloat> %177, i64 1
  %186 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %168) #10
  %187 = extractvalue { i32, i32, i32, i32 } %186, 0
  %188 = bitcast i32 %187 to <2 x bfloat>
  %189 = extractvalue { i32, i32, i32, i32 } %186, 1
  %190 = bitcast i32 %189 to <2 x bfloat>
  %191 = extractvalue { i32, i32, i32, i32 } %186, 2
  %192 = bitcast i32 %191 to <2 x bfloat>
  %193 = extractvalue { i32, i32, i32, i32 } %186, 3
  %194 = bitcast i32 %193 to <2 x bfloat>
  %195 = extractelement <2 x bfloat> %188, i64 0
  %196 = extractelement <2 x bfloat> %188, i64 1
  %197 = extractelement <2 x bfloat> %190, i64 0
  %198 = extractelement <2 x bfloat> %190, i64 1
  %199 = extractelement <2 x bfloat> %192, i64 0
  %200 = extractelement <2 x bfloat> %192, i64 1
  %201 = extractelement <2 x bfloat> %194, i64 0
  %202 = extractelement <2 x bfloat> %194, i64 1
  %203 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %178) #10
  %204 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %179) #10
  %205 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %180) #10
  %206 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %181) #10
  %207 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %182) #10
  %208 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %183) #10
  %209 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %184) #10
  %210 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %185) #10
  %211 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #10
  %212 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %196) #10
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %197) #10
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %198) #10
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %199) #10
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %200) #10
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %201) #10
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %202) #10
  %219 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %107
  %220 = getelementptr bfloat, ptr addrspace(1) %219, i64 %113
  %221 = getelementptr i8, ptr addrspace(1) %220, i64 1024
  %222 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %220) #10
  %223 = extractvalue { i32, i32, i32, i32 } %222, 0
  %224 = bitcast i32 %223 to <2 x bfloat>
  %225 = extractvalue { i32, i32, i32, i32 } %222, 1
  %226 = bitcast i32 %225 to <2 x bfloat>
  %227 = extractvalue { i32, i32, i32, i32 } %222, 2
  %228 = bitcast i32 %227 to <2 x bfloat>
  %229 = extractvalue { i32, i32, i32, i32 } %222, 3
  %230 = bitcast i32 %229 to <2 x bfloat>
  %231 = extractelement <2 x bfloat> %224, i64 0
  %232 = extractelement <2 x bfloat> %224, i64 1
  %233 = extractelement <2 x bfloat> %226, i64 0
  %234 = extractelement <2 x bfloat> %226, i64 1
  %235 = extractelement <2 x bfloat> %228, i64 0
  %236 = extractelement <2 x bfloat> %228, i64 1
  %237 = extractelement <2 x bfloat> %230, i64 0
  %238 = extractelement <2 x bfloat> %230, i64 1
  %239 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %221) #10
  %240 = extractvalue { i32, i32, i32, i32 } %239, 0
  %241 = bitcast i32 %240 to <2 x bfloat>
  %242 = extractvalue { i32, i32, i32, i32 } %239, 1
  %243 = bitcast i32 %242 to <2 x bfloat>
  %244 = extractvalue { i32, i32, i32, i32 } %239, 2
  %245 = bitcast i32 %244 to <2 x bfloat>
  %246 = extractvalue { i32, i32, i32, i32 } %239, 3
  %247 = bitcast i32 %246 to <2 x bfloat>
  %248 = extractelement <2 x bfloat> %241, i64 0
  %249 = extractelement <2 x bfloat> %241, i64 1
  %250 = extractelement <2 x bfloat> %243, i64 0
  %251 = extractelement <2 x bfloat> %243, i64 1
  %252 = extractelement <2 x bfloat> %245, i64 0
  %253 = extractelement <2 x bfloat> %245, i64 1
  %254 = extractelement <2 x bfloat> %247, i64 0
  %255 = extractelement <2 x bfloat> %247, i64 1
  %256 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %231) #10
  %257 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %232) #10
  %258 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %233) #10
  %259 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %234) #10
  %260 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %235) #10
  %261 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %236) #10
  %262 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %237) #10
  %263 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %238) #10
  %264 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %248) #10
  %265 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %249) #10
  %266 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %250) #10
  %267 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %251) #10
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %252) #10
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %253) #10
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %254) #10
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %255) #10
  %272 = getelementptr i8, ptr addrspace(1) %166, i64 2048
  %273 = getelementptr i8, ptr addrspace(1) %167, i64 2048
  %274 = getelementptr bfloat, ptr addrspace(1) %272, i64 %113
  %275 = getelementptr i8, ptr addrspace(1) %274, i64 1024
  %276 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %273) #10
  %277 = extractvalue { i32, i32, i32, i32 } %276, 0
  %278 = bitcast i32 %277 to <2 x bfloat>
  %279 = extractvalue { i32, i32, i32, i32 } %276, 1
  %280 = bitcast i32 %279 to <2 x bfloat>
  %281 = extractvalue { i32, i32, i32, i32 } %276, 2
  %282 = bitcast i32 %281 to <2 x bfloat>
  %283 = extractvalue { i32, i32, i32, i32 } %276, 3
  %284 = bitcast i32 %283 to <2 x bfloat>
  %285 = extractelement <2 x bfloat> %278, i64 0
  %286 = extractelement <2 x bfloat> %278, i64 1
  %287 = extractelement <2 x bfloat> %280, i64 0
  %288 = extractelement <2 x bfloat> %280, i64 1
  %289 = extractelement <2 x bfloat> %282, i64 0
  %290 = extractelement <2 x bfloat> %282, i64 1
  %291 = extractelement <2 x bfloat> %284, i64 0
  %292 = extractelement <2 x bfloat> %284, i64 1
  %293 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %275) #10
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
  %310 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %285) #10
  %311 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %286) #10
  %312 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %287) #10
  %313 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %288) #10
  %314 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %289) #10
  %315 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %290) #10
  %316 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %291) #10
  %317 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %292) #10
  %318 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %302) #10
  %319 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %303) #10
  %320 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %304) #10
  %321 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %305) #10
  %322 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %306) #10
  %323 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %307) #10
  %324 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %308) #10
  %325 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %309) #10
  %326 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %107
  %327 = getelementptr bfloat, ptr addrspace(1) %326, i64 %113
  %328 = getelementptr i8, ptr addrspace(1) %327, i64 1024
  %329 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %327) #10
  %330 = extractvalue { i32, i32, i32, i32 } %329, 0
  %331 = bitcast i32 %330 to <2 x bfloat>
  %332 = extractvalue { i32, i32, i32, i32 } %329, 1
  %333 = bitcast i32 %332 to <2 x bfloat>
  %334 = extractvalue { i32, i32, i32, i32 } %329, 2
  %335 = bitcast i32 %334 to <2 x bfloat>
  %336 = extractvalue { i32, i32, i32, i32 } %329, 3
  %337 = bitcast i32 %336 to <2 x bfloat>
  %338 = extractelement <2 x bfloat> %331, i64 0
  %339 = extractelement <2 x bfloat> %331, i64 1
  %340 = extractelement <2 x bfloat> %333, i64 0
  %341 = extractelement <2 x bfloat> %333, i64 1
  %342 = extractelement <2 x bfloat> %335, i64 0
  %343 = extractelement <2 x bfloat> %335, i64 1
  %344 = extractelement <2 x bfloat> %337, i64 0
  %345 = extractelement <2 x bfloat> %337, i64 1
  %346 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %328) #10
  %347 = extractvalue { i32, i32, i32, i32 } %346, 0
  %348 = bitcast i32 %347 to <2 x bfloat>
  %349 = extractvalue { i32, i32, i32, i32 } %346, 1
  %350 = bitcast i32 %349 to <2 x bfloat>
  %351 = extractvalue { i32, i32, i32, i32 } %346, 2
  %352 = bitcast i32 %351 to <2 x bfloat>
  %353 = extractvalue { i32, i32, i32, i32 } %346, 3
  %354 = bitcast i32 %353 to <2 x bfloat>
  %355 = extractelement <2 x bfloat> %348, i64 0
  %356 = extractelement <2 x bfloat> %348, i64 1
  %357 = extractelement <2 x bfloat> %350, i64 0
  %358 = extractelement <2 x bfloat> %350, i64 1
  %359 = extractelement <2 x bfloat> %352, i64 0
  %360 = extractelement <2 x bfloat> %352, i64 1
  %361 = extractelement <2 x bfloat> %354, i64 0
  %362 = extractelement <2 x bfloat> %354, i64 1
  %363 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %338) #10
  %364 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %339) #10
  %365 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %340) #10
  %366 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %341) #10
  %367 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %342) #10
  %368 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %343) #10
  %369 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %344) #10
  %370 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %345) #10
  %371 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %355) #10
  %372 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %356) #10
  %373 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %357) #10
  %374 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %358) #10
  %375 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %359) #10
  %376 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %360) #10
  %377 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %361) #10
  %378 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %362) #10
  %379 = fadd float %310, %363
  %380 = fadd float %311, %364
  %381 = fadd float %312, %365
  %382 = fadd float %313, %366
  %383 = fadd float %314, %367
  %384 = fadd float %315, %368
  %385 = fadd float %316, %369
  %386 = fadd float %317, %370
  %387 = fadd float %318, %371
  %388 = fadd float %319, %372
  %389 = fadd float %320, %373
  %390 = fadd float %321, %374
  %391 = fadd float %322, %375
  %392 = fadd float %323, %376
  %393 = fadd float %324, %377
  %394 = fadd float %325, %378
  %395 = fadd float %256, %379
  %396 = fadd float %257, %380
  %397 = fadd float %258, %381
  %398 = fadd float %259, %382
  %399 = fadd float %260, %383
  %400 = fadd float %261, %384
  %401 = fadd float %262, %385
  %402 = fadd float %263, %386
  %403 = fadd float %264, %387
  %404 = fadd float %265, %388
  %405 = fadd float %266, %389
  %406 = fadd float %267, %390
  %407 = fadd float %268, %391
  %408 = fadd float %269, %392
  %409 = fadd float %270, %393
  %410 = fadd float %271, %394
  %411 = fadd float %203, %395
  %412 = fadd float %204, %396
  %413 = fadd float %205, %397
  %414 = fadd float %206, %398
  %415 = fadd float %207, %399
  %416 = fadd float %208, %400
  %417 = fadd float %209, %401
  %418 = fadd float %210, %402
  %419 = fadd float %211, %403
  %420 = fadd float %212, %404
  %421 = fadd float %213, %405
  %422 = fadd float %214, %406
  %423 = fadd float %215, %407
  %424 = fadd float %216, %408
  %425 = fadd float %217, %409
  %426 = fadd float %218, %410
  %427 = fadd float %150, %411
  %428 = fadd float %151, %412
  %429 = fadd float %152, %413
  %430 = fadd float %153, %414
  %431 = fadd float %154, %415
  %432 = fadd float %155, %416
  %433 = fadd float %156, %417
  %434 = fadd float %157, %418
  %435 = fadd float %158, %419
  %436 = fadd float %159, %420
  %437 = fadd float %160, %421
  %438 = fadd float %161, %422
  %439 = fadd float %162, %423
  %440 = fadd float %163, %424
  %441 = fadd float %164, %425
  %442 = fadd float %165, %426
  %443 = fmul float %427, %427
  %444 = fmul float %428, %428
  %445 = fmul float %429, %429
  %446 = fmul float %430, %430
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
  %459 = fadd float %443, %444
  %460 = fadd float %459, %445
  %461 = fadd float %460, %446
  %462 = fadd float %461, %447
  %463 = fadd float %462, %448
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
  %474 = bitcast float %473 to i32
  %475 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %474, i32 16, i32 31)
  %476 = bitcast i32 %475 to float
  %477 = fadd float %473, %476
  %478 = bitcast float %477 to i32
  %479 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %478, i32 8, i32 31)
  %480 = bitcast i32 %479 to float
  %481 = fadd float %477, %480
  %482 = bitcast float %481 to i32
  %483 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %482, i32 4, i32 31)
  %484 = bitcast i32 %483 to float
  %485 = fadd float %481, %484
  %486 = bitcast float %485 to i32
  %487 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %486, i32 2, i32 31)
  %488 = bitcast i32 %487 to float
  %489 = fadd float %485, %488
  %490 = bitcast float %489 to i32
  %491 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %490, i32 1, i32 31)
  %492 = bitcast i32 %491 to float
  %493 = fadd float %489, %492
  %494 = icmp eq i32 %8, 0
  %495 = zext nneg i32 %9 to i64
  %496 = getelementptr float, ptr addrspace(3) @global_smem, i64 %495
  %497 = bitcast float %493 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %496, <1 x i32> %497, i1 %494) #10
  tail call void @llvm.nvvm.barrier0()
  %498 = icmp samesign ult i32 %7, 2
  %499 = zext nneg i32 %7 to i64
  %500 = getelementptr float, ptr addrspace(3) @global_smem, i64 %499
  %501 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %500, i1 %498) #10
  %502 = bitcast i32 %501 to float
  %503 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %501, i32 1, i32 31)
  %504 = bitcast i32 %503 to float
  %505 = fadd float %502, %504
  %506 = icmp eq i32 %7, 0
  %507 = bitcast float %505 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %500, <1 x i32> %507, i1 %506) #10
  tail call void @llvm.nvvm.barrier0()
  %508 = load float, ptr addrspace(3) @global_smem, align 16
  %509 = fmul float %508, 0x3F50000000000000
  %510 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
  %511 = bitcast i32 %510 to float
  %512 = fadd float %509, %511
  %513 = tail call float @llvm.nvvm.rsqrt.approx.f(float %512)
  %514 = fmul float %103, %513
  %515 = fmul float %104, %513
  %516 = fmul float %105, %513
  %517 = fmul float %106, %513
  %518 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %5
  %519 = getelementptr bfloat, ptr addrspace(1) %518, i64 %15
  %520 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %519) #10
  %521 = extractvalue { i32, i32 } %520, 0
  %522 = bitcast i32 %521 to <2 x bfloat>
  %523 = extractvalue { i32, i32 } %520, 1
  %524 = bitcast i32 %523 to <2 x bfloat>
  %525 = extractelement <2 x bfloat> %522, i64 0
  %526 = extractelement <2 x bfloat> %522, i64 1
  %527 = extractelement <2 x bfloat> %524, i64 0
  %528 = extractelement <2 x bfloat> %524, i64 1
  %529 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %525) #10
  %530 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %526) #10
  %531 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %527) #10
  %532 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %528) #10
  %533 = fmul float %514, %529
  %534 = fmul float %515, %530
  %535 = fmul float %516, %531
  %536 = fmul float %517, %532
  %537 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %533) #10
  %538 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %534) #10
  %539 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %535) #10
  %540 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %536) #10
  %541 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %4
  %542 = getelementptr bfloat, ptr addrspace(1) %541, i64 %15
  %543 = insertelement <2 x bfloat> poison, bfloat %537, i64 0
  %544 = insertelement <2 x bfloat> %543, bfloat %538, i64 1
  %545 = bitcast <2 x bfloat> %544 to i32
  %546 = insertelement <2 x bfloat> poison, bfloat %539, i64 0
  %547 = insertelement <2 x bfloat> %546, bfloat %540, i64 1
  %548 = bitcast <2 x bfloat> %547 to i32
  tail call void asm sideeffect "st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l"(i32 %545, i32 %548, ptr addrspace(1) %542) #10
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

define ptx_kernel void @triton_softmax_4_0(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2) local_unnamed_addr #6 {
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
!8 = distinct !{!8, !9, !"fused_convert_1_param_0_122: argument 0"}
!9 = distinct !{!9, !"fused_convert_1_param_0_122"}
!10 = !{!11}
!11 = distinct !{!11, !12, !"fused_convert_1_param_0_122: argument 0"}
!12 = distinct !{!12, !"fused_convert_1_param_0_122"}
!13 = !{i32 0, i32 64}
!14 = !{!15}
!15 = distinct !{!15, !16, !"fused_concatenate_convert_197_17: argument 0"}
!16 = distinct !{!16, !"fused_concatenate_convert_197_17"}
!17 = !{!18}
!18 = distinct !{!18, !16, !"fused_concatenate_convert_197_17: argument 1"}
!19 = !{!20}
!20 = distinct !{!20, !21, !"fused_concatenate_convert_197_17: argument 0"}
!21 = distinct !{!21, !"fused_concatenate_convert_197_17"}
!22 = !{!23}
!23 = distinct !{!23, !21, !"fused_concatenate_convert_197_17: argument 1"}
!24 = !{i32 0, i32 135456}

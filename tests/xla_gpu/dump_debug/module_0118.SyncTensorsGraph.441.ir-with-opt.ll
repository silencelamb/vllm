; ModuleID = 'SyncTensorsGraph.441'
source_filename = "SyncTensorsGraph.441"
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

define ptx_kernel void @gemm_fusion_dot_15_0(ptr noalias align 16 dereferenceable(4194304) %arg0, ptr noalias align 16 dereferenceable(4194304) %arg1, ptr noalias align 16 dereferenceable(4194304) %arg2, ptr noalias align 16 dereferenceable(4194304) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4) local_unnamed_addr #3 {
  %arg4125 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3123 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2121 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1119 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0117 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %.frozen = freeze i32 %1
  %2 = sdiv i32 %.frozen, 8
  %3 = shl nsw i32 %2, 3
  %4 = sub i32 32, %3
  %5 = tail call i32 @llvm.smin.i32(i32 %4, i32 8)
  %6 = srem i32 %1, %5
  %7 = add i32 %3, %6
  %8 = shl i32 %7, 7
  %9 = icmp slt i32 %8, 1024
  %.v = select i1 %9, ptr addrspace(1) %arg0117, ptr addrspace(1) %arg1119
  %10 = icmp slt i32 %8, 2048
  %.v1 = select i1 %10, ptr addrspace(1) %.v, ptr addrspace(1) %arg2121
  %11 = icmp slt i32 %8, 3072
  %.v2 = select i1 %11, ptr addrspace(1) %.v1, ptr addrspace(1) %arg3123
  %12 = add i32 %8, -1024
  %13 = add i32 %8, -2048
  %14 = add i32 %8, -3072
  %15 = select i1 %9, i32 %8, i32 %12
  %16 = select i1 %10, i32 %15, i32 %13
  %17 = select i1 %11, i32 %16, i32 %14
  %18 = sext i32 %17 to i64
  %19 = tail call range(i32 0, 128) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %20 = and i32 %19, 16
  %.not = icmp eq i32 %20, 0
  %21 = and i32 %19, 32
  %22 = icmp eq i32 %21, 0
  %.lobit3 = lshr i32 %19, 4
  %23 = and i32 %.lobit3, 3
  %24 = icmp samesign ult i32 %19, 64
  %25 = select i1 %24, i32 0, i32 4
  %26 = or disjoint i32 %23, %25
  %27 = or disjoint i32 %26, 8
  %28 = or disjoint i32 %26, 16
  %29 = or disjoint i32 %26, 24
  %30 = or disjoint i32 %26, 32
  %31 = or disjoint i32 %26, 40
  %32 = or disjoint i32 %26, 48
  %33 = or disjoint i32 %26, 56
  %34 = or disjoint i32 %26, 64
  %35 = or disjoint i32 %26, 72
  %36 = or disjoint i32 %26, 80
  %37 = or disjoint i32 %26, 88
  %38 = or disjoint i32 %26, 96
  %39 = or disjoint i32 %26, 104
  %40 = or disjoint i32 %26, 112
  %41 = or disjoint i32 %26, 120
  %42 = and i32 %19, 1
  %43 = icmp eq i32 %42, 0
  %44 = and i32 %19, 2
  %45 = icmp eq i32 %44, 0
  %46 = and i32 %19, 4
  %.not5 = icmp eq i32 %46, 0
  %47 = shl nuw nsw i32 %19, 3
  %48 = and i32 %47, 120
  %49 = zext nneg i32 %26 to i64
  %50 = zext nneg i32 %27 to i64
  %51 = zext nneg i32 %28 to i64
  %52 = zext nneg i32 %29 to i64
  %53 = zext nneg i32 %30 to i64
  %54 = zext nneg i32 %31 to i64
  %55 = zext nneg i32 %32 to i64
  %56 = zext nneg i32 %33 to i64
  %57 = zext nneg i32 %34 to i64
  %58 = zext nneg i32 %35 to i64
  %59 = zext nneg i32 %36 to i64
  %60 = zext nneg i32 %37 to i64
  %61 = zext nneg i32 %38 to i64
  %62 = zext nneg i32 %39 to i64
  %63 = zext nneg i32 %40 to i64
  %64 = zext nneg i32 %41 to i64
  %65 = zext nneg i32 %48 to i64
  %66 = or disjoint i64 %18, %49
  %67 = or disjoint i64 %18, %50
  %68 = or disjoint i64 %18, %51
  %69 = or disjoint i64 %18, %52
  %70 = or disjoint i64 %18, %53
  %71 = or disjoint i64 %18, %54
  %72 = or disjoint i64 %18, %55
  %73 = or disjoint i64 %18, %56
  %74 = or disjoint i64 %18, %57
  %75 = or disjoint i64 %18, %58
  %76 = or disjoint i64 %18, %59
  %77 = or disjoint i64 %18, %60
  %78 = or disjoint i64 %18, %61
  %79 = or disjoint i64 %18, %62
  %80 = or disjoint i64 %18, %63
  %81 = or disjoint i64 %18, %64
  %82 = shl nsw i64 %66, 11
  %83 = shl nsw i64 %67, 11
  %84 = shl nsw i64 %68, 11
  %85 = shl nsw i64 %69, 11
  %86 = shl nsw i64 %70, 11
  %87 = shl nsw i64 %71, 11
  %88 = shl nsw i64 %72, 11
  %89 = shl nsw i64 %73, 11
  %90 = shl nsw i64 %74, 11
  %91 = shl nsw i64 %75, 11
  %92 = shl nsw i64 %76, 11
  %93 = shl nsw i64 %77, 11
  %94 = shl nsw i64 %78, 11
  %95 = shl nsw i64 %79, 11
  %96 = shl nsw i64 %80, 11
  %97 = shl nsw i64 %81, 11
  %98 = or disjoint i64 %82, %65
  %99 = or disjoint i64 %83, %65
  %100 = or disjoint i64 %84, %65
  %101 = or disjoint i64 %85, %65
  %102 = or disjoint i64 %86, %65
  %103 = or disjoint i64 %87, %65
  %104 = or disjoint i64 %88, %65
  %105 = or disjoint i64 %89, %65
  %106 = or disjoint i64 %90, %65
  %107 = or disjoint i64 %91, %65
  %108 = or disjoint i64 %92, %65
  %109 = or disjoint i64 %93, %65
  %110 = or disjoint i64 %94, %65
  %111 = or disjoint i64 %95, %65
  %112 = or disjoint i64 %96, %65
  %113 = or disjoint i64 %97, %65
  %114 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %98
  %115 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %99
  %116 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %100
  %117 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %101
  %118 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %102
  %119 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %103
  %120 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %104
  %121 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %105
  %122 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %106
  %123 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %107
  %124 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %108
  %125 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %109
  %126 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %110
  %127 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %111
  %128 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %112
  %129 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %113
  %130 = select i1 %.not, i32 0, i32 136
  %131 = select i1 %22, i32 0, i32 272
  %132 = select i1 %24, i32 0, i32 544
  %133 = or disjoint i32 %130, %132
  %134 = xor i32 %133, %48
  %135 = xor i32 %134, %131
  %136 = zext nneg i32 %135 to i64
  %137 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %136
  %138 = or disjoint i32 %48, 1024
  %139 = xor i32 %133, %138
  %140 = xor i32 %139, %131
  %141 = zext nneg i32 %140 to i64
  %142 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %141
  %143 = or disjoint i32 %48, 2048
  %144 = xor i32 %133, %143
  %145 = xor i32 %144, %131
  %146 = zext nneg i32 %145 to i64
  %147 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %146
  %148 = or disjoint i32 %48, 3072
  %149 = xor i32 %133, %148
  %150 = xor i32 %149, %131
  %151 = zext nneg i32 %150 to i64
  %152 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %151
  %153 = or disjoint i32 %48, 4096
  %154 = xor i32 %133, %153
  %155 = xor i32 %154, %131
  %156 = zext nneg i32 %155 to i64
  %157 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %156
  %158 = or disjoint i32 %48, 5120
  %159 = xor i32 %133, %158
  %160 = xor i32 %159, %131
  %161 = zext nneg i32 %160 to i64
  %162 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %161
  %163 = or disjoint i32 %48, 6144
  %164 = xor i32 %133, %163
  %165 = xor i32 %164, %131
  %166 = zext nneg i32 %165 to i64
  %167 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %166
  %168 = or disjoint i32 %48, 7168
  %169 = xor i32 %133, %168
  %170 = xor i32 %169, %131
  %171 = zext nneg i32 %170 to i64
  %172 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %171
  %173 = or disjoint i32 %48, 8192
  %174 = xor i32 %133, %173
  %175 = xor i32 %174, %131
  %176 = zext nneg i32 %175 to i64
  %177 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %176
  %178 = or disjoint i32 %48, 9216
  %179 = xor i32 %133, %178
  %180 = xor i32 %179, %131
  %181 = zext nneg i32 %180 to i64
  %182 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %181
  %183 = or disjoint i32 %48, 10240
  %184 = xor i32 %133, %183
  %185 = xor i32 %184, %131
  %186 = zext nneg i32 %185 to i64
  %187 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %186
  %188 = or disjoint i32 %48, 11264
  %189 = xor i32 %133, %188
  %190 = xor i32 %189, %131
  %191 = zext nneg i32 %190 to i64
  %192 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %191
  %193 = or disjoint i32 %48, 12288
  %194 = xor i32 %133, %193
  %195 = xor i32 %194, %131
  %196 = zext nneg i32 %195 to i64
  %197 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %196
  %198 = or disjoint i32 %48, 13312
  %199 = xor i32 %133, %198
  %200 = xor i32 %199, %131
  %201 = zext nneg i32 %200 to i64
  %202 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %201
  %203 = or disjoint i32 %48, 14336
  %204 = xor i32 %133, %203
  %205 = xor i32 %204, %131
  %206 = zext nneg i32 %205 to i64
  %207 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %206
  %208 = or disjoint i32 %48, 15360
  %209 = xor i32 %133, %208
  %210 = xor i32 %209, %131
  %211 = zext nneg i32 %210 to i64
  %212 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %211
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %137, ptr addrspace(1) %114, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %142, ptr addrspace(1) %115, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %147, ptr addrspace(1) %116, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %152, ptr addrspace(1) %117, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %157, ptr addrspace(1) %118, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %162, ptr addrspace(1) %119, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %167, ptr addrspace(1) %120, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %172, ptr addrspace(1) %121, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %177, ptr addrspace(1) %122, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %182, ptr addrspace(1) %123, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %187, ptr addrspace(1) %124, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %192, ptr addrspace(1) %125, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %197, ptr addrspace(1) %126, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %202, ptr addrspace(1) %127, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %207, ptr addrspace(1) %128, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %212, ptr addrspace(1) %129, i32 16) #10
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #10
  %213 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %82
  %214 = getelementptr bfloat, ptr addrspace(1) %213, i64 %65
  %215 = getelementptr i8, ptr addrspace(1) %214, i64 256
  %216 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %83
  %217 = getelementptr bfloat, ptr addrspace(1) %216, i64 %65
  %218 = getelementptr i8, ptr addrspace(1) %217, i64 256
  %219 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %84
  %220 = getelementptr bfloat, ptr addrspace(1) %219, i64 %65
  %221 = getelementptr i8, ptr addrspace(1) %220, i64 256
  %222 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %85
  %223 = getelementptr bfloat, ptr addrspace(1) %222, i64 %65
  %224 = getelementptr i8, ptr addrspace(1) %223, i64 256
  %225 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %86
  %226 = getelementptr bfloat, ptr addrspace(1) %225, i64 %65
  %227 = getelementptr i8, ptr addrspace(1) %226, i64 256
  %228 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %87
  %229 = getelementptr bfloat, ptr addrspace(1) %228, i64 %65
  %230 = getelementptr i8, ptr addrspace(1) %229, i64 256
  %231 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %88
  %232 = getelementptr bfloat, ptr addrspace(1) %231, i64 %65
  %233 = getelementptr i8, ptr addrspace(1) %232, i64 256
  %234 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %89
  %235 = getelementptr bfloat, ptr addrspace(1) %234, i64 %65
  %236 = getelementptr i8, ptr addrspace(1) %235, i64 256
  %237 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %90
  %238 = getelementptr bfloat, ptr addrspace(1) %237, i64 %65
  %239 = getelementptr i8, ptr addrspace(1) %238, i64 256
  %240 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %91
  %241 = getelementptr bfloat, ptr addrspace(1) %240, i64 %65
  %242 = getelementptr i8, ptr addrspace(1) %241, i64 256
  %243 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %92
  %244 = getelementptr bfloat, ptr addrspace(1) %243, i64 %65
  %245 = getelementptr i8, ptr addrspace(1) %244, i64 256
  %246 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %93
  %247 = getelementptr bfloat, ptr addrspace(1) %246, i64 %65
  %248 = getelementptr i8, ptr addrspace(1) %247, i64 256
  %249 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %94
  %250 = getelementptr bfloat, ptr addrspace(1) %249, i64 %65
  %251 = getelementptr i8, ptr addrspace(1) %250, i64 256
  %252 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %95
  %253 = getelementptr bfloat, ptr addrspace(1) %252, i64 %65
  %254 = getelementptr i8, ptr addrspace(1) %253, i64 256
  %255 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %96
  %256 = getelementptr bfloat, ptr addrspace(1) %255, i64 %65
  %257 = getelementptr i8, ptr addrspace(1) %256, i64 256
  %258 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %97
  %259 = getelementptr bfloat, ptr addrspace(1) %258, i64 %65
  %260 = getelementptr i8, ptr addrspace(1) %259, i64 256
  tail call void @llvm.nvvm.barrier0()
  %261 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %136
  %262 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %141
  %263 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %146
  %264 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %151
  %265 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %156
  %266 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %161
  %267 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %166
  %268 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %171
  %269 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %176
  %270 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %181
  %271 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %186
  %272 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %191
  %273 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %196
  %274 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %201
  %275 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %206
  %276 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %211
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %261, ptr addrspace(1) %215, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %262, ptr addrspace(1) %218, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %263, ptr addrspace(1) %221, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %264, ptr addrspace(1) %224, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %265, ptr addrspace(1) %227, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %266, ptr addrspace(1) %230, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %267, ptr addrspace(1) %233, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %268, ptr addrspace(1) %236, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %269, ptr addrspace(1) %239, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %270, ptr addrspace(1) %242, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %271, ptr addrspace(1) %245, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %272, ptr addrspace(1) %248, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %273, ptr addrspace(1) %251, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %274, ptr addrspace(1) %254, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %275, ptr addrspace(1) %257, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %276, ptr addrspace(1) %260, i32 16) #10
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #10
  %277 = getelementptr i8, ptr addrspace(1) %214, i64 512
  %278 = getelementptr i8, ptr addrspace(1) %217, i64 512
  %279 = getelementptr i8, ptr addrspace(1) %220, i64 512
  %280 = getelementptr i8, ptr addrspace(1) %223, i64 512
  %281 = getelementptr i8, ptr addrspace(1) %226, i64 512
  %282 = getelementptr i8, ptr addrspace(1) %229, i64 512
  %283 = getelementptr i8, ptr addrspace(1) %232, i64 512
  %284 = getelementptr i8, ptr addrspace(1) %235, i64 512
  %285 = getelementptr i8, ptr addrspace(1) %238, i64 512
  %286 = getelementptr i8, ptr addrspace(1) %241, i64 512
  %287 = getelementptr i8, ptr addrspace(1) %244, i64 512
  %288 = getelementptr i8, ptr addrspace(1) %247, i64 512
  %289 = getelementptr i8, ptr addrspace(1) %250, i64 512
  %290 = getelementptr i8, ptr addrspace(1) %253, i64 512
  %291 = getelementptr i8, ptr addrspace(1) %256, i64 512
  %292 = getelementptr i8, ptr addrspace(1) %259, i64 512
  tail call void @llvm.nvvm.barrier0()
  %293 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %136
  %294 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %141
  %295 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %146
  %296 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %151
  %297 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %156
  %298 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %161
  %299 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %166
  %300 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %171
  %301 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %176
  %302 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %181
  %303 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %186
  %304 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %191
  %305 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %196
  %306 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %201
  %307 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %206
  %308 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %211
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %293, ptr addrspace(1) %277, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %294, ptr addrspace(1) %278, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %295, ptr addrspace(1) %279, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %296, ptr addrspace(1) %280, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %297, ptr addrspace(1) %281, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %298, ptr addrspace(1) %282, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %299, ptr addrspace(1) %283, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %300, ptr addrspace(1) %284, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %301, ptr addrspace(1) %285, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %302, ptr addrspace(1) %286, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %303, ptr addrspace(1) %287, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %304, ptr addrspace(1) %288, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %305, ptr addrspace(1) %289, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %306, ptr addrspace(1) %290, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %307, ptr addrspace(1) %291, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %308, ptr addrspace(1) %292, i32 16) #10
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #10
  tail call void asm sideeffect "cp.async.wait_group 0x2;", ""() #10
  tail call void @llvm.nvvm.barrier0()
  %309 = select i1 %43, i32 0, i32 136
  %310 = select i1 %45, i32 0, i32 272
  %311 = or disjoint i32 %309, %310
  %312 = select i1 %.not5, i32 0, i32 544
  %313 = shl nuw nsw i32 %19, 7
  %314 = and i32 %313, 1024
  %315 = or disjoint i32 %312, %314
  %316 = or disjoint i32 %315, %311
  %317 = lshr exact i32 %20, 1
  %318 = xor i32 %316, %317
  %319 = shl nuw nsw i32 %21, 6
  %320 = or disjoint i32 %318, %319
  %321 = select i1 %24, i32 0, i32 4096
  %322 = or disjoint i32 %320, %321
  %323 = zext nneg i32 %322 to i64
  %324 = or disjoint i32 %309, 16
  %325 = xor i32 %324, %310
  %326 = or disjoint i32 %314, %325
  %327 = or disjoint i32 %326, %312
  %328 = or disjoint i32 %319, %317
  %329 = or disjoint i32 %328, %321
  %330 = xor i32 %329, %327
  %331 = zext nneg i32 %330 to i64
  %332 = or disjoint i32 %311, 32
  %333 = xor i32 %332, %312
  %334 = or disjoint i32 %333, %314
  %335 = xor i32 %329, %334
  %336 = zext nneg i32 %335 to i64
  %337 = or disjoint i32 %309, 48
  %338 = or disjoint i32 %312, %310
  %339 = xor i32 %338, %337
  %340 = or disjoint i32 %339, %314
  %341 = xor i32 %329, %340
  %342 = zext nneg i32 %341 to i64
  %343 = or disjoint i32 %316, 64
  %344 = xor i32 %329, %343
  %345 = zext nneg i32 %344 to i64
  %346 = or disjoint i32 %309, 80
  %347 = xor i32 %346, %310
  %348 = or disjoint i32 %314, %347
  %349 = or disjoint i32 %348, %312
  %350 = xor i32 %329, %349
  %351 = zext nneg i32 %350 to i64
  %352 = or disjoint i32 %311, 96
  %353 = xor i32 %352, %312
  %354 = or disjoint i32 %353, %314
  %355 = xor i32 %329, %354
  %356 = zext nneg i32 %355 to i64
  %357 = or disjoint i32 %309, 112
  %358 = xor i32 %338, %357
  %359 = or disjoint i32 %358, %314
  %360 = xor i32 %329, %359
  %361 = zext nneg i32 %360 to i64
  %362 = or disjoint i32 %316, 8192
  %363 = xor i32 %329, %362
  %364 = zext nneg i32 %363 to i64
  %365 = or disjoint i32 %309, 8208
  %366 = xor i32 %365, %310
  %367 = or disjoint i32 %314, %366
  %368 = or disjoint i32 %367, %312
  %369 = xor i32 %329, %368
  %370 = zext nneg i32 %369 to i64
  %371 = or disjoint i32 %311, 8224
  %372 = xor i32 %371, %312
  %373 = or disjoint i32 %372, %314
  %374 = xor i32 %329, %373
  %375 = zext nneg i32 %374 to i64
  %376 = or disjoint i32 %309, 8240
  %377 = xor i32 %338, %376
  %378 = or disjoint i32 %377, %314
  %379 = xor i32 %329, %378
  %380 = zext nneg i32 %379 to i64
  %381 = or disjoint i32 %316, 8256
  %382 = xor i32 %329, %381
  %383 = zext nneg i32 %382 to i64
  %384 = or disjoint i32 %309, 8272
  %385 = xor i32 %384, %310
  %386 = or disjoint i32 %314, %385
  %387 = or disjoint i32 %386, %312
  %388 = xor i32 %329, %387
  %389 = zext nneg i32 %388 to i64
  %390 = or disjoint i32 %311, 8288
  %391 = xor i32 %390, %312
  %392 = or disjoint i32 %391, %314
  %393 = xor i32 %329, %392
  %394 = zext nneg i32 %393 to i64
  %395 = or disjoint i32 %309, 8304
  %396 = xor i32 %338, %395
  %397 = or disjoint i32 %396, %314
  %398 = xor i32 %329, %397
  %399 = zext nneg i32 %398 to i64
  %400 = trunc i32 %19 to i4
  %401 = zext i4 %400 to i64
  %402 = shl nuw nsw i64 %401, 4
  %403 = add i32 %25, %23
  %404 = add i32 %403, 120
  %405 = zext nneg i32 %404 to i64
  %406 = add i64 %18, %405
  %407 = shl nsw i64 %406, 12
  %408 = add nuw nsw i64 %407, 768
  %scevgep = getelementptr i8, ptr addrspace(1) %.v2, i64 %408
  %409 = add i32 %403, 112
  %410 = zext nneg i32 %409 to i64
  %411 = add i64 %18, %410
  %412 = shl nsw i64 %411, 12
  %413 = add nuw nsw i64 %412, 768
  %scevgep129 = getelementptr i8, ptr addrspace(1) %.v2, i64 %413
  %414 = add i32 %403, 104
  %415 = zext nneg i32 %414 to i64
  %416 = add i64 %18, %415
  %417 = shl nsw i64 %416, 12
  %418 = add nuw nsw i64 %417, 768
  %scevgep133 = getelementptr i8, ptr addrspace(1) %.v2, i64 %418
  %419 = add i32 %403, 96
  %420 = zext nneg i32 %419 to i64
  %421 = add i64 %18, %420
  %422 = shl nsw i64 %421, 12
  %423 = add nuw nsw i64 %422, 768
  %scevgep137 = getelementptr i8, ptr addrspace(1) %.v2, i64 %423
  %424 = add i32 %403, 88
  %425 = zext nneg i32 %424 to i64
  %426 = add i64 %18, %425
  %427 = shl nsw i64 %426, 12
  %428 = add nuw nsw i64 %427, 768
  %scevgep141 = getelementptr i8, ptr addrspace(1) %.v2, i64 %428
  %429 = add i32 %403, 80
  %430 = zext nneg i32 %429 to i64
  %431 = add i64 %18, %430
  %432 = shl nsw i64 %431, 12
  %433 = add nuw nsw i64 %432, 768
  %scevgep145 = getelementptr i8, ptr addrspace(1) %.v2, i64 %433
  %434 = add i32 %403, 72
  %435 = zext nneg i32 %434 to i64
  %436 = add i64 %18, %435
  %437 = shl nsw i64 %436, 12
  %438 = add nuw nsw i64 %437, 768
  %scevgep149 = getelementptr i8, ptr addrspace(1) %.v2, i64 %438
  %439 = add i32 %403, 64
  %440 = zext nneg i32 %439 to i64
  %441 = add i64 %18, %440
  %442 = shl nsw i64 %441, 12
  %443 = add nuw nsw i64 %442, 768
  %scevgep153 = getelementptr i8, ptr addrspace(1) %.v2, i64 %443
  %444 = add i32 %403, 56
  %445 = zext nneg i32 %444 to i64
  %446 = add i64 %18, %445
  %447 = shl nsw i64 %446, 12
  %448 = add nuw nsw i64 %447, 768
  %scevgep157 = getelementptr i8, ptr addrspace(1) %.v2, i64 %448
  %449 = add i32 %403, 48
  %450 = zext nneg i32 %449 to i64
  %451 = add i64 %18, %450
  %452 = shl nsw i64 %451, 12
  %453 = add nuw nsw i64 %452, 768
  %scevgep161 = getelementptr i8, ptr addrspace(1) %.v2, i64 %453
  %454 = add i32 %403, 40
  %455 = zext nneg i32 %454 to i64
  %456 = add i64 %18, %455
  %457 = shl nsw i64 %456, 12
  %458 = add nuw nsw i64 %457, 768
  %scevgep165 = getelementptr i8, ptr addrspace(1) %.v2, i64 %458
  %459 = add i32 %403, 32
  %460 = zext nneg i32 %459 to i64
  %461 = add i64 %18, %460
  %462 = shl nsw i64 %461, 12
  %463 = add nuw nsw i64 %462, 768
  %scevgep169 = getelementptr i8, ptr addrspace(1) %.v2, i64 %463
  %464 = add i32 %403, 24
  %465 = zext nneg i32 %464 to i64
  %466 = add i64 %18, %465
  %467 = shl nsw i64 %466, 12
  %468 = add nuw nsw i64 %467, 768
  %scevgep173 = getelementptr i8, ptr addrspace(1) %.v2, i64 %468
  %469 = add i32 %403, 16
  %470 = zext nneg i32 %469 to i64
  %471 = add i64 %18, %470
  %472 = shl nsw i64 %471, 12
  %473 = add nuw nsw i64 %472, 768
  %scevgep177 = getelementptr i8, ptr addrspace(1) %.v2, i64 %473
  %474 = add i32 %403, 8
  %475 = zext nneg i32 %474 to i64
  %476 = add i64 %18, %475
  %477 = shl nsw i64 %476, 12
  %478 = add nuw nsw i64 %477, 768
  %scevgep181 = getelementptr i8, ptr addrspace(1) %.v2, i64 %478
  %479 = zext nneg i32 %403 to i64
  %480 = add i64 %18, %479
  %481 = shl nsw i64 %480, 12
  %482 = add nuw nsw i64 %481, 768
  %scevgep185 = getelementptr i8, ptr addrspace(1) %.v2, i64 %482
  br label %483

483:                                              ; preds = %0, %483
  %lsr.iv189 = phi i32 [ -128, %0 ], [ %488, %483 ]
  %lsr.iv186 = phi ptr addrspace(1) [ %scevgep185, %0 ], [ %scevgep187, %483 ]
  %lsr.iv182 = phi ptr addrspace(1) [ %scevgep181, %0 ], [ %scevgep183, %483 ]
  %lsr.iv178 = phi ptr addrspace(1) [ %scevgep177, %0 ], [ %scevgep179, %483 ]
  %lsr.iv174 = phi ptr addrspace(1) [ %scevgep173, %0 ], [ %scevgep175, %483 ]
  %lsr.iv170 = phi ptr addrspace(1) [ %scevgep169, %0 ], [ %scevgep171, %483 ]
  %lsr.iv166 = phi ptr addrspace(1) [ %scevgep165, %0 ], [ %scevgep167, %483 ]
  %lsr.iv162 = phi ptr addrspace(1) [ %scevgep161, %0 ], [ %scevgep163, %483 ]
  %lsr.iv158 = phi ptr addrspace(1) [ %scevgep157, %0 ], [ %scevgep159, %483 ]
  %lsr.iv154 = phi ptr addrspace(1) [ %scevgep153, %0 ], [ %scevgep155, %483 ]
  %lsr.iv150 = phi ptr addrspace(1) [ %scevgep149, %0 ], [ %scevgep151, %483 ]
  %lsr.iv146 = phi ptr addrspace(1) [ %scevgep145, %0 ], [ %scevgep147, %483 ]
  %lsr.iv142 = phi ptr addrspace(1) [ %scevgep141, %0 ], [ %scevgep143, %483 ]
  %lsr.iv138 = phi ptr addrspace(1) [ %scevgep137, %0 ], [ %scevgep139, %483 ]
  %lsr.iv134 = phi ptr addrspace(1) [ %scevgep133, %0 ], [ %scevgep135, %483 ]
  %lsr.iv130 = phi ptr addrspace(1) [ %scevgep129, %0 ], [ %scevgep131, %483 ]
  %lsr.iv = phi ptr addrspace(1) [ %scevgep, %0 ], [ %scevgep127, %483 ]
  %484 = phi ptr addrspace(3) [ @global_smem, %0 ], [ %838, %483 ]
  %485 = phi i32 [ 0, %0 ], [ %835, %483 ]
  %486 = phi i32 [ 2, %0 ], [ %812, %483 ]
  %487 = phi { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } [ zeroinitializer, %0 ], [ %809, %483 ]
  %488 = add i32 %lsr.iv189, 128
  %489 = icmp samesign ult i32 %488, 1664
  %490 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %484, i64 %323
  %491 = ptrtoint ptr addrspace(3) %490 to i64
  %492 = trunc i64 %491 to i32
  %493 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %492) #10
  %494 = extractvalue { i32, i32, i32, i32 } %493, 0
  %495 = extractvalue { i32, i32, i32, i32 } %493, 1
  %496 = extractvalue { i32, i32, i32, i32 } %493, 2
  %497 = extractvalue { i32, i32, i32, i32 } %493, 3
  %498 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %484, i64 %331
  %499 = ptrtoint ptr addrspace(3) %498 to i64
  %500 = trunc i64 %499 to i32
  %501 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %500) #10
  %502 = extractvalue { i32, i32, i32, i32 } %501, 0
  %503 = extractvalue { i32, i32, i32, i32 } %501, 1
  %504 = extractvalue { i32, i32, i32, i32 } %501, 2
  %505 = extractvalue { i32, i32, i32, i32 } %501, 3
  %506 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %484, i64 %336
  %507 = ptrtoint ptr addrspace(3) %506 to i64
  %508 = trunc i64 %507 to i32
  %509 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %508) #10
  %510 = extractvalue { i32, i32, i32, i32 } %509, 0
  %511 = extractvalue { i32, i32, i32, i32 } %509, 1
  %512 = extractvalue { i32, i32, i32, i32 } %509, 2
  %513 = extractvalue { i32, i32, i32, i32 } %509, 3
  %514 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %484, i64 %342
  %515 = ptrtoint ptr addrspace(3) %514 to i64
  %516 = trunc i64 %515 to i32
  %517 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %516) #10
  %518 = extractvalue { i32, i32, i32, i32 } %517, 0
  %519 = extractvalue { i32, i32, i32, i32 } %517, 1
  %520 = extractvalue { i32, i32, i32, i32 } %517, 2
  %521 = extractvalue { i32, i32, i32, i32 } %517, 3
  %522 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %484, i64 %345
  %523 = ptrtoint ptr addrspace(3) %522 to i64
  %524 = trunc i64 %523 to i32
  %525 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %524) #10
  %526 = extractvalue { i32, i32, i32, i32 } %525, 0
  %527 = extractvalue { i32, i32, i32, i32 } %525, 1
  %528 = extractvalue { i32, i32, i32, i32 } %525, 2
  %529 = extractvalue { i32, i32, i32, i32 } %525, 3
  %530 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %484, i64 %351
  %531 = ptrtoint ptr addrspace(3) %530 to i64
  %532 = trunc i64 %531 to i32
  %533 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %532) #10
  %534 = extractvalue { i32, i32, i32, i32 } %533, 0
  %535 = extractvalue { i32, i32, i32, i32 } %533, 1
  %536 = extractvalue { i32, i32, i32, i32 } %533, 2
  %537 = extractvalue { i32, i32, i32, i32 } %533, 3
  %538 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %484, i64 %356
  %539 = ptrtoint ptr addrspace(3) %538 to i64
  %540 = trunc i64 %539 to i32
  %541 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %540) #10
  %542 = extractvalue { i32, i32, i32, i32 } %541, 0
  %543 = extractvalue { i32, i32, i32, i32 } %541, 1
  %544 = extractvalue { i32, i32, i32, i32 } %541, 2
  %545 = extractvalue { i32, i32, i32, i32 } %541, 3
  %546 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %484, i64 %361
  %547 = ptrtoint ptr addrspace(3) %546 to i64
  %548 = trunc i64 %547 to i32
  %549 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %548) #10
  %550 = extractvalue { i32, i32, i32, i32 } %549, 0
  %551 = extractvalue { i32, i32, i32, i32 } %549, 1
  %552 = extractvalue { i32, i32, i32, i32 } %549, 2
  %553 = extractvalue { i32, i32, i32, i32 } %549, 3
  %554 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %484, i64 %364
  %555 = ptrtoint ptr addrspace(3) %554 to i64
  %556 = trunc i64 %555 to i32
  %557 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %556) #10
  %558 = extractvalue { i32, i32, i32, i32 } %557, 0
  %559 = extractvalue { i32, i32, i32, i32 } %557, 1
  %560 = extractvalue { i32, i32, i32, i32 } %557, 2
  %561 = extractvalue { i32, i32, i32, i32 } %557, 3
  %562 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %484, i64 %370
  %563 = ptrtoint ptr addrspace(3) %562 to i64
  %564 = trunc i64 %563 to i32
  %565 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %564) #10
  %566 = extractvalue { i32, i32, i32, i32 } %565, 0
  %567 = extractvalue { i32, i32, i32, i32 } %565, 1
  %568 = extractvalue { i32, i32, i32, i32 } %565, 2
  %569 = extractvalue { i32, i32, i32, i32 } %565, 3
  %570 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %484, i64 %375
  %571 = ptrtoint ptr addrspace(3) %570 to i64
  %572 = trunc i64 %571 to i32
  %573 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %572) #10
  %574 = extractvalue { i32, i32, i32, i32 } %573, 0
  %575 = extractvalue { i32, i32, i32, i32 } %573, 1
  %576 = extractvalue { i32, i32, i32, i32 } %573, 2
  %577 = extractvalue { i32, i32, i32, i32 } %573, 3
  %578 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %484, i64 %380
  %579 = ptrtoint ptr addrspace(3) %578 to i64
  %580 = trunc i64 %579 to i32
  %581 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %580) #10
  %582 = extractvalue { i32, i32, i32, i32 } %581, 0
  %583 = extractvalue { i32, i32, i32, i32 } %581, 1
  %584 = extractvalue { i32, i32, i32, i32 } %581, 2
  %585 = extractvalue { i32, i32, i32, i32 } %581, 3
  %586 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %484, i64 %383
  %587 = ptrtoint ptr addrspace(3) %586 to i64
  %588 = trunc i64 %587 to i32
  %589 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %588) #10
  %590 = extractvalue { i32, i32, i32, i32 } %589, 0
  %591 = extractvalue { i32, i32, i32, i32 } %589, 1
  %592 = extractvalue { i32, i32, i32, i32 } %589, 2
  %593 = extractvalue { i32, i32, i32, i32 } %589, 3
  %594 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %484, i64 %389
  %595 = ptrtoint ptr addrspace(3) %594 to i64
  %596 = trunc i64 %595 to i32
  %597 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %596) #10
  %598 = extractvalue { i32, i32, i32, i32 } %597, 0
  %599 = extractvalue { i32, i32, i32, i32 } %597, 1
  %600 = extractvalue { i32, i32, i32, i32 } %597, 2
  %601 = extractvalue { i32, i32, i32, i32 } %597, 3
  %602 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %484, i64 %394
  %603 = ptrtoint ptr addrspace(3) %602 to i64
  %604 = trunc i64 %603 to i32
  %605 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %604) #10
  %606 = extractvalue { i32, i32, i32, i32 } %605, 0
  %607 = extractvalue { i32, i32, i32, i32 } %605, 1
  %608 = extractvalue { i32, i32, i32, i32 } %605, 2
  %609 = extractvalue { i32, i32, i32, i32 } %605, 3
  %610 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %484, i64 %399
  %611 = ptrtoint ptr addrspace(3) %610 to i64
  %612 = trunc i64 %611 to i32
  %613 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %612) #10
  %614 = extractvalue { i32, i32, i32, i32 } %613, 0
  %615 = extractvalue { i32, i32, i32, i32 } %613, 1
  %616 = extractvalue { i32, i32, i32, i32 } %613, 2
  %617 = extractvalue { i32, i32, i32, i32 } %613, 3
  %618 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %487, 0
  %619 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %487, 1
  %620 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %487, 2
  %621 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %487, 3
  %622 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %487, 4
  %623 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %487, 5
  %624 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %487, 6
  %625 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %487, 7
  %626 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %487, 8
  %627 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %487, 9
  %628 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %487, 10
  %629 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %487, 11
  %630 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %487, 12
  %631 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %487, 13
  %632 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %487, 14
  %633 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %487, 15
  %634 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %618, float %619, float %620, float %621, i32 %494, i32 %495, i32 %496, i32 %497, i32 0, i32 0) #10
  %635 = extractvalue { float, float, float, float } %634, 0
  %636 = extractvalue { float, float, float, float } %634, 1
  %637 = extractvalue { float, float, float, float } %634, 2
  %638 = extractvalue { float, float, float, float } %634, 3
  %639 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %622, float %623, float %624, float %625, i32 %494, i32 %495, i32 %496, i32 %497, i32 0, i32 0) #10
  %640 = extractvalue { float, float, float, float } %639, 0
  %641 = extractvalue { float, float, float, float } %639, 1
  %642 = extractvalue { float, float, float, float } %639, 2
  %643 = extractvalue { float, float, float, float } %639, 3
  %644 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %626, float %627, float %628, float %629, i32 %558, i32 %559, i32 %560, i32 %561, i32 0, i32 0) #10
  %645 = extractvalue { float, float, float, float } %644, 0
  %646 = extractvalue { float, float, float, float } %644, 1
  %647 = extractvalue { float, float, float, float } %644, 2
  %648 = extractvalue { float, float, float, float } %644, 3
  %649 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %630, float %631, float %632, float %633, i32 %558, i32 %559, i32 %560, i32 %561, i32 0, i32 0) #10
  %650 = extractvalue { float, float, float, float } %649, 0
  %651 = extractvalue { float, float, float, float } %649, 1
  %652 = extractvalue { float, float, float, float } %649, 2
  %653 = extractvalue { float, float, float, float } %649, 3
  %654 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %635, float %636, float %637, float %638, i32 %502, i32 %503, i32 %504, i32 %505, i32 0, i32 0) #10
  %655 = extractvalue { float, float, float, float } %654, 0
  %656 = extractvalue { float, float, float, float } %654, 1
  %657 = extractvalue { float, float, float, float } %654, 2
  %658 = extractvalue { float, float, float, float } %654, 3
  %659 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %640, float %641, float %642, float %643, i32 %502, i32 %503, i32 %504, i32 %505, i32 0, i32 0) #10
  %660 = extractvalue { float, float, float, float } %659, 0
  %661 = extractvalue { float, float, float, float } %659, 1
  %662 = extractvalue { float, float, float, float } %659, 2
  %663 = extractvalue { float, float, float, float } %659, 3
  %664 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %645, float %646, float %647, float %648, i32 %566, i32 %567, i32 %568, i32 %569, i32 0, i32 0) #10
  %665 = extractvalue { float, float, float, float } %664, 0
  %666 = extractvalue { float, float, float, float } %664, 1
  %667 = extractvalue { float, float, float, float } %664, 2
  %668 = extractvalue { float, float, float, float } %664, 3
  %669 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %650, float %651, float %652, float %653, i32 %566, i32 %567, i32 %568, i32 %569, i32 0, i32 0) #10
  %670 = extractvalue { float, float, float, float } %669, 0
  %671 = extractvalue { float, float, float, float } %669, 1
  %672 = extractvalue { float, float, float, float } %669, 2
  %673 = extractvalue { float, float, float, float } %669, 3
  %674 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %655, float %656, float %657, float %658, i32 %510, i32 %511, i32 %512, i32 %513, i32 0, i32 0) #10
  %675 = extractvalue { float, float, float, float } %674, 0
  %676 = extractvalue { float, float, float, float } %674, 1
  %677 = extractvalue { float, float, float, float } %674, 2
  %678 = extractvalue { float, float, float, float } %674, 3
  %679 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %660, float %661, float %662, float %663, i32 %510, i32 %511, i32 %512, i32 %513, i32 0, i32 0) #10
  %680 = extractvalue { float, float, float, float } %679, 0
  %681 = extractvalue { float, float, float, float } %679, 1
  %682 = extractvalue { float, float, float, float } %679, 2
  %683 = extractvalue { float, float, float, float } %679, 3
  %684 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %665, float %666, float %667, float %668, i32 %574, i32 %575, i32 %576, i32 %577, i32 0, i32 0) #10
  %685 = extractvalue { float, float, float, float } %684, 0
  %686 = extractvalue { float, float, float, float } %684, 1
  %687 = extractvalue { float, float, float, float } %684, 2
  %688 = extractvalue { float, float, float, float } %684, 3
  %689 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %670, float %671, float %672, float %673, i32 %574, i32 %575, i32 %576, i32 %577, i32 0, i32 0) #10
  %690 = extractvalue { float, float, float, float } %689, 0
  %691 = extractvalue { float, float, float, float } %689, 1
  %692 = extractvalue { float, float, float, float } %689, 2
  %693 = extractvalue { float, float, float, float } %689, 3
  %694 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %675, float %676, float %677, float %678, i32 %518, i32 %519, i32 %520, i32 %521, i32 0, i32 0) #10
  %695 = extractvalue { float, float, float, float } %694, 0
  %696 = extractvalue { float, float, float, float } %694, 1
  %697 = extractvalue { float, float, float, float } %694, 2
  %698 = extractvalue { float, float, float, float } %694, 3
  %699 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %680, float %681, float %682, float %683, i32 %518, i32 %519, i32 %520, i32 %521, i32 0, i32 0) #10
  %700 = extractvalue { float, float, float, float } %699, 0
  %701 = extractvalue { float, float, float, float } %699, 1
  %702 = extractvalue { float, float, float, float } %699, 2
  %703 = extractvalue { float, float, float, float } %699, 3
  %704 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %685, float %686, float %687, float %688, i32 %582, i32 %583, i32 %584, i32 %585, i32 0, i32 0) #10
  %705 = extractvalue { float, float, float, float } %704, 0
  %706 = extractvalue { float, float, float, float } %704, 1
  %707 = extractvalue { float, float, float, float } %704, 2
  %708 = extractvalue { float, float, float, float } %704, 3
  %709 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %690, float %691, float %692, float %693, i32 %582, i32 %583, i32 %584, i32 %585, i32 0, i32 0) #10
  %710 = extractvalue { float, float, float, float } %709, 0
  %711 = extractvalue { float, float, float, float } %709, 1
  %712 = extractvalue { float, float, float, float } %709, 2
  %713 = extractvalue { float, float, float, float } %709, 3
  %714 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %695, float %696, float %697, float %698, i32 %526, i32 %527, i32 %528, i32 %529, i32 0, i32 0) #10
  %715 = extractvalue { float, float, float, float } %714, 0
  %716 = extractvalue { float, float, float, float } %714, 1
  %717 = extractvalue { float, float, float, float } %714, 2
  %718 = extractvalue { float, float, float, float } %714, 3
  %719 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %700, float %701, float %702, float %703, i32 %526, i32 %527, i32 %528, i32 %529, i32 0, i32 0) #10
  %720 = extractvalue { float, float, float, float } %719, 0
  %721 = extractvalue { float, float, float, float } %719, 1
  %722 = extractvalue { float, float, float, float } %719, 2
  %723 = extractvalue { float, float, float, float } %719, 3
  %724 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %705, float %706, float %707, float %708, i32 %590, i32 %591, i32 %592, i32 %593, i32 0, i32 0) #10
  %725 = extractvalue { float, float, float, float } %724, 0
  %726 = extractvalue { float, float, float, float } %724, 1
  %727 = extractvalue { float, float, float, float } %724, 2
  %728 = extractvalue { float, float, float, float } %724, 3
  %729 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %710, float %711, float %712, float %713, i32 %590, i32 %591, i32 %592, i32 %593, i32 0, i32 0) #10
  %730 = extractvalue { float, float, float, float } %729, 0
  %731 = extractvalue { float, float, float, float } %729, 1
  %732 = extractvalue { float, float, float, float } %729, 2
  %733 = extractvalue { float, float, float, float } %729, 3
  %734 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %715, float %716, float %717, float %718, i32 %534, i32 %535, i32 %536, i32 %537, i32 0, i32 0) #10
  %735 = extractvalue { float, float, float, float } %734, 0
  %736 = extractvalue { float, float, float, float } %734, 1
  %737 = extractvalue { float, float, float, float } %734, 2
  %738 = extractvalue { float, float, float, float } %734, 3
  %739 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %720, float %721, float %722, float %723, i32 %534, i32 %535, i32 %536, i32 %537, i32 0, i32 0) #10
  %740 = extractvalue { float, float, float, float } %739, 0
  %741 = extractvalue { float, float, float, float } %739, 1
  %742 = extractvalue { float, float, float, float } %739, 2
  %743 = extractvalue { float, float, float, float } %739, 3
  %744 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %725, float %726, float %727, float %728, i32 %598, i32 %599, i32 %600, i32 %601, i32 0, i32 0) #10
  %745 = extractvalue { float, float, float, float } %744, 0
  %746 = extractvalue { float, float, float, float } %744, 1
  %747 = extractvalue { float, float, float, float } %744, 2
  %748 = extractvalue { float, float, float, float } %744, 3
  %749 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %730, float %731, float %732, float %733, i32 %598, i32 %599, i32 %600, i32 %601, i32 0, i32 0) #10
  %750 = extractvalue { float, float, float, float } %749, 0
  %751 = extractvalue { float, float, float, float } %749, 1
  %752 = extractvalue { float, float, float, float } %749, 2
  %753 = extractvalue { float, float, float, float } %749, 3
  %754 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %735, float %736, float %737, float %738, i32 %542, i32 %543, i32 %544, i32 %545, i32 0, i32 0) #10
  %755 = extractvalue { float, float, float, float } %754, 0
  %756 = extractvalue { float, float, float, float } %754, 1
  %757 = extractvalue { float, float, float, float } %754, 2
  %758 = extractvalue { float, float, float, float } %754, 3
  %759 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %740, float %741, float %742, float %743, i32 %542, i32 %543, i32 %544, i32 %545, i32 0, i32 0) #10
  %760 = extractvalue { float, float, float, float } %759, 0
  %761 = extractvalue { float, float, float, float } %759, 1
  %762 = extractvalue { float, float, float, float } %759, 2
  %763 = extractvalue { float, float, float, float } %759, 3
  %764 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %745, float %746, float %747, float %748, i32 %606, i32 %607, i32 %608, i32 %609, i32 0, i32 0) #10
  %765 = extractvalue { float, float, float, float } %764, 0
  %766 = extractvalue { float, float, float, float } %764, 1
  %767 = extractvalue { float, float, float, float } %764, 2
  %768 = extractvalue { float, float, float, float } %764, 3
  %769 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %750, float %751, float %752, float %753, i32 %606, i32 %607, i32 %608, i32 %609, i32 0, i32 0) #10
  %770 = extractvalue { float, float, float, float } %769, 0
  %771 = extractvalue { float, float, float, float } %769, 1
  %772 = extractvalue { float, float, float, float } %769, 2
  %773 = extractvalue { float, float, float, float } %769, 3
  %774 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %755, float %756, float %757, float %758, i32 %550, i32 %551, i32 %552, i32 %553, i32 0, i32 0) #10
  %775 = extractvalue { float, float, float, float } %774, 0
  %776 = extractvalue { float, float, float, float } %774, 1
  %777 = extractvalue { float, float, float, float } %774, 2
  %778 = extractvalue { float, float, float, float } %774, 3
  %779 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %760, float %761, float %762, float %763, i32 %550, i32 %551, i32 %552, i32 %553, i32 0, i32 0) #10
  %780 = extractvalue { float, float, float, float } %779, 0
  %781 = extractvalue { float, float, float, float } %779, 1
  %782 = extractvalue { float, float, float, float } %779, 2
  %783 = extractvalue { float, float, float, float } %779, 3
  %784 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %765, float %766, float %767, float %768, i32 %614, i32 %615, i32 %616, i32 %617, i32 0, i32 0) #10
  %785 = extractvalue { float, float, float, float } %784, 0
  %786 = extractvalue { float, float, float, float } %784, 1
  %787 = extractvalue { float, float, float, float } %784, 2
  %788 = extractvalue { float, float, float, float } %784, 3
  %789 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %770, float %771, float %772, float %773, i32 %614, i32 %615, i32 %616, i32 %617, i32 0, i32 0) #10
  %790 = extractvalue { float, float, float, float } %789, 0
  %791 = extractvalue { float, float, float, float } %789, 1
  %792 = extractvalue { float, float, float, float } %789, 2
  %793 = extractvalue { float, float, float, float } %789, 3
  %794 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } undef, float %775, 0
  %795 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %794, float %776, 1
  %796 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %795, float %777, 2
  %797 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %796, float %778, 3
  %798 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %797, float %780, 4
  %799 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %798, float %781, 5
  %800 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %799, float %782, 6
  %801 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %800, float %783, 7
  %802 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %801, float %785, 8
  %803 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %802, float %786, 9
  %804 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %803, float %787, 10
  %805 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %804, float %788, 11
  %806 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %805, float %790, 12
  %807 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %806, float %791, 13
  %808 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %807, float %792, 14
  %809 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %808, float %793, 15
  %810 = add i32 %486, 1
  %811 = icmp slt i32 %810, 3
  %812 = select i1 %811, i32 %810, i32 0
  %scevgep188 = getelementptr i8, ptr addrspace(1) %lsr.iv186, i64 %402
  %scevgep184 = getelementptr i8, ptr addrspace(1) %lsr.iv182, i64 %402
  %scevgep180 = getelementptr i8, ptr addrspace(1) %lsr.iv178, i64 %402
  %scevgep176 = getelementptr i8, ptr addrspace(1) %lsr.iv174, i64 %402
  %scevgep172 = getelementptr i8, ptr addrspace(1) %lsr.iv170, i64 %402
  %scevgep168 = getelementptr i8, ptr addrspace(1) %lsr.iv166, i64 %402
  %scevgep164 = getelementptr i8, ptr addrspace(1) %lsr.iv162, i64 %402
  %scevgep160 = getelementptr i8, ptr addrspace(1) %lsr.iv158, i64 %402
  %scevgep156 = getelementptr i8, ptr addrspace(1) %lsr.iv154, i64 %402
  %scevgep152 = getelementptr i8, ptr addrspace(1) %lsr.iv150, i64 %402
  %scevgep148 = getelementptr i8, ptr addrspace(1) %lsr.iv146, i64 %402
  %scevgep144 = getelementptr i8, ptr addrspace(1) %lsr.iv142, i64 %402
  %scevgep140 = getelementptr i8, ptr addrspace(1) %lsr.iv138, i64 %402
  %scevgep136 = getelementptr i8, ptr addrspace(1) %lsr.iv134, i64 %402
  %scevgep132 = getelementptr i8, ptr addrspace(1) %lsr.iv130, i64 %402
  %scevgep128 = getelementptr i8, ptr addrspace(1) %lsr.iv, i64 %402
  %813 = shl i32 %812, 14
  %814 = sext i32 %813 to i64
  %815 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %814
  tail call void @llvm.nvvm.barrier0()
  %816 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %815, i64 %136
  %817 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %815, i64 %141
  %818 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %815, i64 %146
  %819 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %815, i64 %151
  %820 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %815, i64 %156
  %821 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %815, i64 %161
  %822 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %815, i64 %166
  %823 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %815, i64 %171
  %824 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %815, i64 %176
  %825 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %815, i64 %181
  %826 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %815, i64 %186
  %827 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %815, i64 %191
  %828 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %815, i64 %196
  %829 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %815, i64 %201
  %830 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %815, i64 %206
  %831 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %815, i64 %211
  %832 = select i1 %489, i32 16, i32 0
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %816, ptr addrspace(1) %scevgep188, i32 %832) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %817, ptr addrspace(1) %scevgep184, i32 %832) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %818, ptr addrspace(1) %scevgep180, i32 %832) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %819, ptr addrspace(1) %scevgep176, i32 %832) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %820, ptr addrspace(1) %scevgep172, i32 %832) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %821, ptr addrspace(1) %scevgep168, i32 %832) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %822, ptr addrspace(1) %scevgep164, i32 %832) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %823, ptr addrspace(1) %scevgep160, i32 %832) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %824, ptr addrspace(1) %scevgep156, i32 %832) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %825, ptr addrspace(1) %scevgep152, i32 %832) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %826, ptr addrspace(1) %scevgep148, i32 %832) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %827, ptr addrspace(1) %scevgep144, i32 %832) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %828, ptr addrspace(1) %scevgep140, i32 %832) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %829, ptr addrspace(1) %scevgep136, i32 %832) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %830, ptr addrspace(1) %scevgep132, i32 %832) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %831, ptr addrspace(1) %scevgep128, i32 %832) #10
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #10
  %833 = add i32 %485, 1
  %834 = icmp slt i32 %833, 3
  %835 = select i1 %834, i32 %833, i32 0
  tail call void asm sideeffect "cp.async.wait_group 0x2;", ""() #10
  tail call void @llvm.nvvm.barrier0()
  %836 = shl i32 %835, 14
  %837 = sext i32 %836 to i64
  %838 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %837
  %scevgep127 = getelementptr i8, ptr addrspace(1) %lsr.iv, i64 256
  %scevgep131 = getelementptr i8, ptr addrspace(1) %lsr.iv130, i64 256
  %scevgep135 = getelementptr i8, ptr addrspace(1) %lsr.iv134, i64 256
  %scevgep139 = getelementptr i8, ptr addrspace(1) %lsr.iv138, i64 256
  %scevgep143 = getelementptr i8, ptr addrspace(1) %lsr.iv142, i64 256
  %scevgep147 = getelementptr i8, ptr addrspace(1) %lsr.iv146, i64 256
  %scevgep151 = getelementptr i8, ptr addrspace(1) %lsr.iv150, i64 256
  %scevgep155 = getelementptr i8, ptr addrspace(1) %lsr.iv154, i64 256
  %scevgep159 = getelementptr i8, ptr addrspace(1) %lsr.iv158, i64 256
  %scevgep163 = getelementptr i8, ptr addrspace(1) %lsr.iv162, i64 256
  %scevgep167 = getelementptr i8, ptr addrspace(1) %lsr.iv166, i64 256
  %scevgep171 = getelementptr i8, ptr addrspace(1) %lsr.iv170, i64 256
  %scevgep175 = getelementptr i8, ptr addrspace(1) %lsr.iv174, i64 256
  %scevgep179 = getelementptr i8, ptr addrspace(1) %lsr.iv178, i64 256
  %scevgep183 = getelementptr i8, ptr addrspace(1) %lsr.iv182, i64 256
  %scevgep187 = getelementptr i8, ptr addrspace(1) %lsr.iv186, i64 256
  %839 = icmp samesign ult i32 %488, 1920
  br i1 %839, label %483, label %840

840:                                              ; preds = %483
  %841 = icmp ult i32 %19, 64
  %842 = mul i32 %2, 8
  %.decomposed = sub i32 %.frozen, %842
  %843 = sdiv i32 %.decomposed, %5
  tail call void asm sideeffect "cp.async.wait_group 0x0;", ""() #10
  tail call void @llvm.nvvm.barrier0()
  %844 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %775) #10
  %845 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %776) #10
  %846 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %777) #10
  %847 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %778) #10
  %848 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %780) #10
  %849 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %781) #10
  %850 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %782) #10
  %851 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %783) #10
  %852 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %785) #10
  %853 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %786) #10
  %854 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %787) #10
  %855 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %788) #10
  %856 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %790) #10
  %857 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %791) #10
  %858 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %792) #10
  %859 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %793) #10
  %860 = shl nsw i32 %843, 4
  %861 = sext i32 %8 to i64
  %862 = sext i32 %860 to i64
  %863 = or disjoint i64 %861, %65
  %864 = or disjoint i64 %862, %49
  %865 = or disjoint i64 %862, %50
  %866 = getelementptr bfloat, ptr addrspace(1) %arg4125, i64 %863
  %.idx = shl nsw i64 %864, 13
  %867 = getelementptr i8, ptr addrspace(1) %866, i64 %.idx
  %.idx4 = shl nsw i64 %865, 13
  %868 = getelementptr i8, ptr addrspace(1) %866, i64 %.idx4
  %869 = shl nuw nsw i32 %19, 8
  %870 = and i32 %869, 768
  %871 = lshr i32 %19, 2
  %872 = and i32 %871, 7
  %873 = lshr exact i32 %21, 1
  %874 = select i1 %841, i32 0, i32 32
  %875 = or disjoint i32 %873, %874
  %876 = or disjoint i32 %875, %872
  %877 = or disjoint i32 %876, %870
  %878 = and i32 %47, 504
  %879 = select i1 %841, i32 0, i32 512
  %880 = or disjoint i32 %878, %879
  %881 = lshr exact i32 %870, 4
  %882 = add nuw nsw i32 %877, %881
  %883 = zext nneg i32 %882 to i64
  %884 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %883
  %885 = bitcast bfloat %844 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %884, <1 x i16> %885, i1 true) #10
  %886 = or disjoint i32 %877, 128
  %887 = lshr i32 %886, 4
  %888 = and i32 %887, 134217720
  %889 = zext nneg i32 %888 to i64
  %890 = zext nneg i32 %877 to i64
  %891 = add i64 %889, %890
  %892 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %891
  %893 = getelementptr inbounds i8, ptr addrspace(3) %892, i64 256
  %894 = bitcast bfloat %845 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %893, <1 x i16> %894, i1 true) #10
  %895 = zext nneg i32 %881 to i64
  %896 = add i64 %895, %890
  %897 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %896
  %898 = getelementptr inbounds i8, ptr addrspace(3) %897, i64 16
  %899 = bitcast bfloat %846 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %898, <1 x i16> %899, i1 true) #10
  %900 = or disjoint i32 %877, 136
  %901 = lshr i32 %900, 4
  %902 = and i32 %901, 134217720
  %903 = zext nneg i32 %902 to i64
  %904 = add i64 %903, %890
  %905 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %904
  %906 = getelementptr inbounds i8, ptr addrspace(3) %905, i64 272
  %907 = bitcast bfloat %847 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %906, <1 x i16> %907, i1 true) #10
  %908 = getelementptr inbounds i8, ptr addrspace(3) %897, i64 128
  %909 = bitcast bfloat %852 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %908, <1 x i16> %909, i1 true) #10
  %910 = or disjoint i32 %877, 192
  %911 = lshr i32 %910, 4
  %912 = and i32 %911, 134217720
  %913 = zext nneg i32 %912 to i64
  %914 = add i64 %913, %890
  %915 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %914
  %916 = getelementptr inbounds i8, ptr addrspace(3) %915, i64 384
  %917 = bitcast bfloat %853 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %916, <1 x i16> %917, i1 true) #10
  %918 = getelementptr inbounds i8, ptr addrspace(3) %897, i64 144
  %919 = bitcast bfloat %854 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %918, <1 x i16> %919, i1 true) #10
  %920 = or disjoint i32 %877, 200
  %921 = lshr i32 %920, 4
  %922 = and i32 %921, 134217720
  %923 = zext nneg i32 %922 to i64
  %924 = add i64 %923, %890
  %925 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %924
  %926 = getelementptr inbounds i8, ptr addrspace(3) %925, i64 400
  %927 = bitcast bfloat %855 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %926, <1 x i16> %927, i1 true) #10
  tail call void @llvm.nvvm.barrier0()
  %928 = lshr i32 %880, 4
  %929 = and i32 %928, 56
  %930 = add nuw nsw i32 %929, %880
  %931 = zext nneg i32 %930 to i64
  %932 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %931
  %933 = load <4 x i32>, ptr addrspace(3) %932, align 16
  tail call void @llvm.nvvm.barrier0()
  %934 = bitcast bfloat %848 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %884, <1 x i16> %934, i1 true) #10
  %935 = bitcast bfloat %849 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %893, <1 x i16> %935, i1 true) #10
  %936 = bitcast bfloat %850 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %898, <1 x i16> %936, i1 true) #10
  %937 = bitcast bfloat %851 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %906, <1 x i16> %937, i1 true) #10
  %938 = bitcast bfloat %856 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %908, <1 x i16> %938, i1 true) #10
  %939 = bitcast bfloat %857 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %916, <1 x i16> %939, i1 true) #10
  %940 = bitcast bfloat %858 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %918, <1 x i16> %940, i1 true) #10
  %941 = bitcast bfloat %859 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %926, <1 x i16> %941, i1 true) #10
  tail call void @llvm.nvvm.barrier0()
  %942 = load <4 x i32>, ptr addrspace(3) %932, align 16
  %.extract = extractelement <4 x i32> %933, i64 0
  %.extract29 = extractelement <4 x i32> %933, i64 1
  %.extract31 = extractelement <4 x i32> %933, i64 2
  %.extract33 = extractelement <4 x i32> %933, i64 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract, i32 %.extract29, i32 %.extract31, i32 %.extract33, ptr addrspace(1) %867) #10
  %.extract35 = extractelement <4 x i32> %942, i64 0
  %.extract37 = extractelement <4 x i32> %942, i64 1
  %.extract39 = extractelement <4 x i32> %942, i64 2
  %.extract41 = extractelement <4 x i32> %942, i64 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract35, i32 %.extract37, i32 %.extract39, i32 %.extract41, ptr addrspace(1) %868) #10
  ret void
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #4

define ptx_kernel void @fusion_64(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(32768) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4) local_unnamed_addr #5 {
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
  %6 = shl i64 %3, 12
  %7 = or disjoint i64 %6, %5
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
  %19 = getelementptr i8, ptr addrspace(1) %18, i64 6144
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
  %33 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %4
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
  %53 = getelementptr i8, ptr addrspace(1) %52, i64 6144
  %54 = shl nuw nsw i32 %9, 3
  %55 = and i32 %54, 248
  %56 = select i1 %14, i32 0, i32 256
  %57 = or disjoint i32 %55, %56
  %58 = zext nneg i32 %57 to i64
  %59 = getelementptr bfloat, ptr addrspace(1) %52, i64 %58
  %60 = getelementptr i8, ptr addrspace(1) %59, i64 6144
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
  %.idx = shl i64 %3, 11
  %113 = getelementptr i8, ptr addrspace(1) %arg13, i64 %.idx
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
  %257 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %5
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
  %280 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %4
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
define ptx_kernel void @loop_convert_fusion_3(ptr noalias readonly align 128 captures(none) dereferenceable(196608) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(98304) %1) local_unnamed_addr #0 {
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

define ptx_kernel void @fusion_62(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(131072) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5) local_unnamed_addr #5 {
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
  %6 = shl i64 %3, 12
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
  %19 = getelementptr i8, ptr addrspace(1) %18, i64 4096
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
  %33 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %4
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
  %48 = getelementptr i8, ptr addrspace(1) %18, i64 6144
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
  %62 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %4
  %63 = getelementptr bfloat, ptr addrspace(1) %62, i64 %17
  %64 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %63) #10
  %65 = extractvalue { i32, i32 } %64, 0
  %66 = bitcast i32 %65 to <2 x bfloat>
  %67 = extractvalue { i32, i32 } %64, 1
  %68 = bitcast i32 %67 to <2 x bfloat>
  %69 = extractelement <2 x bfloat> %66, i64 0
  %70 = extractelement <2 x bfloat> %66, i64 1
  %71 = extractelement <2 x bfloat> %68, i64 0
  %72 = extractelement <2 x bfloat> %68, i64 1
  %73 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %69) #10
  %74 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %70) #10
  %75 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %71) #10
  %76 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %72) #10
  %77 = fadd float %58, %73
  %78 = fadd float %59, %74
  %79 = fadd float %60, %75
  %80 = fadd float %61, %76
  %81 = fadd float %44, %77
  %82 = fadd float %45, %78
  %83 = fadd float %46, %79
  %84 = fadd float %47, %80
  %85 = fadd float %29, %81
  %86 = fadd float %30, %82
  %87 = fadd float %31, %83
  %88 = fadd float %32, %84
  %89 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %6
  %90 = getelementptr i8, ptr addrspace(1) %89, i64 4096
  %91 = shl nuw nsw i32 %9, 3
  %92 = and i32 %91, 248
  %93 = select i1 %14, i32 0, i32 256
  %94 = or disjoint i32 %92, %93
  %95 = zext nneg i32 %94 to i64
  %96 = getelementptr bfloat, ptr addrspace(1) %89, i64 %95
  %97 = getelementptr i8, ptr addrspace(1) %96, i64 4096
  %98 = getelementptr bfloat, ptr addrspace(1) %90, i64 %95
  %99 = getelementptr i8, ptr addrspace(1) %98, i64 1024
  %100 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %97) #10
  %101 = extractvalue { i32, i32, i32, i32 } %100, 0
  %102 = bitcast i32 %101 to <2 x bfloat>
  %103 = extractvalue { i32, i32, i32, i32 } %100, 1
  %104 = bitcast i32 %103 to <2 x bfloat>
  %105 = extractvalue { i32, i32, i32, i32 } %100, 2
  %106 = bitcast i32 %105 to <2 x bfloat>
  %107 = extractvalue { i32, i32, i32, i32 } %100, 3
  %108 = bitcast i32 %107 to <2 x bfloat>
  %109 = extractelement <2 x bfloat> %102, i64 0
  %110 = extractelement <2 x bfloat> %102, i64 1
  %111 = extractelement <2 x bfloat> %104, i64 0
  %112 = extractelement <2 x bfloat> %104, i64 1
  %113 = extractelement <2 x bfloat> %106, i64 0
  %114 = extractelement <2 x bfloat> %106, i64 1
  %115 = extractelement <2 x bfloat> %108, i64 0
  %116 = extractelement <2 x bfloat> %108, i64 1
  %117 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %99) #10
  %118 = extractvalue { i32, i32, i32, i32 } %117, 0
  %119 = bitcast i32 %118 to <2 x bfloat>
  %120 = extractvalue { i32, i32, i32, i32 } %117, 1
  %121 = bitcast i32 %120 to <2 x bfloat>
  %122 = extractvalue { i32, i32, i32, i32 } %117, 2
  %123 = bitcast i32 %122 to <2 x bfloat>
  %124 = extractvalue { i32, i32, i32, i32 } %117, 3
  %125 = bitcast i32 %124 to <2 x bfloat>
  %126 = extractelement <2 x bfloat> %119, i64 0
  %127 = extractelement <2 x bfloat> %119, i64 1
  %128 = extractelement <2 x bfloat> %121, i64 0
  %129 = extractelement <2 x bfloat> %121, i64 1
  %130 = extractelement <2 x bfloat> %123, i64 0
  %131 = extractelement <2 x bfloat> %123, i64 1
  %132 = extractelement <2 x bfloat> %125, i64 0
  %133 = extractelement <2 x bfloat> %125, i64 1
  %134 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %109) #10
  %135 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %110) #10
  %136 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %111) #10
  %137 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %112) #10
  %138 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %113) #10
  %139 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %114) #10
  %140 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %115) #10
  %141 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %116) #10
  %142 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %126) #10
  %143 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %127) #10
  %144 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %128) #10
  %145 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %129) #10
  %146 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %130) #10
  %147 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %131) #10
  %148 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %132) #10
  %149 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %133) #10
  %150 = shl i64 %3, 10
  %151 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %150
  %152 = getelementptr bfloat, ptr addrspace(1) %151, i64 %95
  %153 = getelementptr i8, ptr addrspace(1) %152, i64 1024
  %154 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %152) #10
  %155 = extractvalue { i32, i32, i32, i32 } %154, 0
  %156 = bitcast i32 %155 to <2 x bfloat>
  %157 = extractvalue { i32, i32, i32, i32 } %154, 1
  %158 = bitcast i32 %157 to <2 x bfloat>
  %159 = extractvalue { i32, i32, i32, i32 } %154, 2
  %160 = bitcast i32 %159 to <2 x bfloat>
  %161 = extractvalue { i32, i32, i32, i32 } %154, 3
  %162 = bitcast i32 %161 to <2 x bfloat>
  %163 = extractelement <2 x bfloat> %156, i64 0
  %164 = extractelement <2 x bfloat> %156, i64 1
  %165 = extractelement <2 x bfloat> %158, i64 0
  %166 = extractelement <2 x bfloat> %158, i64 1
  %167 = extractelement <2 x bfloat> %160, i64 0
  %168 = extractelement <2 x bfloat> %160, i64 1
  %169 = extractelement <2 x bfloat> %162, i64 0
  %170 = extractelement <2 x bfloat> %162, i64 1
  %171 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %153) #10
  %172 = extractvalue { i32, i32, i32, i32 } %171, 0
  %173 = bitcast i32 %172 to <2 x bfloat>
  %174 = extractvalue { i32, i32, i32, i32 } %171, 1
  %175 = bitcast i32 %174 to <2 x bfloat>
  %176 = extractvalue { i32, i32, i32, i32 } %171, 2
  %177 = bitcast i32 %176 to <2 x bfloat>
  %178 = extractvalue { i32, i32, i32, i32 } %171, 3
  %179 = bitcast i32 %178 to <2 x bfloat>
  %180 = extractelement <2 x bfloat> %173, i64 0
  %181 = extractelement <2 x bfloat> %173, i64 1
  %182 = extractelement <2 x bfloat> %175, i64 0
  %183 = extractelement <2 x bfloat> %175, i64 1
  %184 = extractelement <2 x bfloat> %177, i64 0
  %185 = extractelement <2 x bfloat> %177, i64 1
  %186 = extractelement <2 x bfloat> %179, i64 0
  %187 = extractelement <2 x bfloat> %179, i64 1
  %188 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %163) #10
  %189 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %164) #10
  %190 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %165) #10
  %191 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %166) #10
  %192 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %167) #10
  %193 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %168) #10
  %194 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %169) #10
  %195 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %170) #10
  %196 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %180) #10
  %197 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %181) #10
  %198 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %182) #10
  %199 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %183) #10
  %200 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %184) #10
  %201 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %185) #10
  %202 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %186) #10
  %203 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %187) #10
  %204 = getelementptr i8, ptr addrspace(1) %89, i64 6144
  %205 = getelementptr i8, ptr addrspace(1) %96, i64 6144
  %206 = getelementptr bfloat, ptr addrspace(1) %204, i64 %95
  %207 = getelementptr i8, ptr addrspace(1) %206, i64 1024
  %208 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %205) #10
  %209 = extractvalue { i32, i32, i32, i32 } %208, 0
  %210 = bitcast i32 %209 to <2 x bfloat>
  %211 = extractvalue { i32, i32, i32, i32 } %208, 1
  %212 = bitcast i32 %211 to <2 x bfloat>
  %213 = extractvalue { i32, i32, i32, i32 } %208, 2
  %214 = bitcast i32 %213 to <2 x bfloat>
  %215 = extractvalue { i32, i32, i32, i32 } %208, 3
  %216 = bitcast i32 %215 to <2 x bfloat>
  %217 = extractelement <2 x bfloat> %210, i64 0
  %218 = extractelement <2 x bfloat> %210, i64 1
  %219 = extractelement <2 x bfloat> %212, i64 0
  %220 = extractelement <2 x bfloat> %212, i64 1
  %221 = extractelement <2 x bfloat> %214, i64 0
  %222 = extractelement <2 x bfloat> %214, i64 1
  %223 = extractelement <2 x bfloat> %216, i64 0
  %224 = extractelement <2 x bfloat> %216, i64 1
  %225 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %207) #10
  %226 = extractvalue { i32, i32, i32, i32 } %225, 0
  %227 = bitcast i32 %226 to <2 x bfloat>
  %228 = extractvalue { i32, i32, i32, i32 } %225, 1
  %229 = bitcast i32 %228 to <2 x bfloat>
  %230 = extractvalue { i32, i32, i32, i32 } %225, 2
  %231 = bitcast i32 %230 to <2 x bfloat>
  %232 = extractvalue { i32, i32, i32, i32 } %225, 3
  %233 = bitcast i32 %232 to <2 x bfloat>
  %234 = extractelement <2 x bfloat> %227, i64 0
  %235 = extractelement <2 x bfloat> %227, i64 1
  %236 = extractelement <2 x bfloat> %229, i64 0
  %237 = extractelement <2 x bfloat> %229, i64 1
  %238 = extractelement <2 x bfloat> %231, i64 0
  %239 = extractelement <2 x bfloat> %231, i64 1
  %240 = extractelement <2 x bfloat> %233, i64 0
  %241 = extractelement <2 x bfloat> %233, i64 1
  %242 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %217) #10
  %243 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %218) #10
  %244 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %219) #10
  %245 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %220) #10
  %246 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %221) #10
  %247 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %222) #10
  %248 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %223) #10
  %249 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %224) #10
  %250 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %234) #10
  %251 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %235) #10
  %252 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %236) #10
  %253 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %237) #10
  %254 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %238) #10
  %255 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %239) #10
  %256 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %240) #10
  %257 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %241) #10
  %258 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %150
  %259 = getelementptr bfloat, ptr addrspace(1) %258, i64 %95
  %260 = getelementptr i8, ptr addrspace(1) %259, i64 1024
  %261 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %259) #10
  %262 = extractvalue { i32, i32, i32, i32 } %261, 0
  %263 = bitcast i32 %262 to <2 x bfloat>
  %264 = extractvalue { i32, i32, i32, i32 } %261, 1
  %265 = bitcast i32 %264 to <2 x bfloat>
  %266 = extractvalue { i32, i32, i32, i32 } %261, 2
  %267 = bitcast i32 %266 to <2 x bfloat>
  %268 = extractvalue { i32, i32, i32, i32 } %261, 3
  %269 = bitcast i32 %268 to <2 x bfloat>
  %270 = extractelement <2 x bfloat> %263, i64 0
  %271 = extractelement <2 x bfloat> %263, i64 1
  %272 = extractelement <2 x bfloat> %265, i64 0
  %273 = extractelement <2 x bfloat> %265, i64 1
  %274 = extractelement <2 x bfloat> %267, i64 0
  %275 = extractelement <2 x bfloat> %267, i64 1
  %276 = extractelement <2 x bfloat> %269, i64 0
  %277 = extractelement <2 x bfloat> %269, i64 1
  %278 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %260) #10
  %279 = extractvalue { i32, i32, i32, i32 } %278, 0
  %280 = bitcast i32 %279 to <2 x bfloat>
  %281 = extractvalue { i32, i32, i32, i32 } %278, 1
  %282 = bitcast i32 %281 to <2 x bfloat>
  %283 = extractvalue { i32, i32, i32, i32 } %278, 2
  %284 = bitcast i32 %283 to <2 x bfloat>
  %285 = extractvalue { i32, i32, i32, i32 } %278, 3
  %286 = bitcast i32 %285 to <2 x bfloat>
  %287 = extractelement <2 x bfloat> %280, i64 0
  %288 = extractelement <2 x bfloat> %280, i64 1
  %289 = extractelement <2 x bfloat> %282, i64 0
  %290 = extractelement <2 x bfloat> %282, i64 1
  %291 = extractelement <2 x bfloat> %284, i64 0
  %292 = extractelement <2 x bfloat> %284, i64 1
  %293 = extractelement <2 x bfloat> %286, i64 0
  %294 = extractelement <2 x bfloat> %286, i64 1
  %295 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %270) #10
  %296 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %271) #10
  %297 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %272) #10
  %298 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %273) #10
  %299 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %274) #10
  %300 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %275) #10
  %301 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %276) #10
  %302 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %277) #10
  %303 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %287) #10
  %304 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %288) #10
  %305 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %289) #10
  %306 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %290) #10
  %307 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %291) #10
  %308 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %292) #10
  %309 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %293) #10
  %310 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %294) #10
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
  %323 = fadd float %254, %307
  %324 = fadd float %255, %308
  %325 = fadd float %256, %309
  %326 = fadd float %257, %310
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
  %339 = fadd float %200, %323
  %340 = fadd float %201, %324
  %341 = fadd float %202, %325
  %342 = fadd float %203, %326
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
  %355 = fadd float %146, %339
  %356 = fadd float %147, %340
  %357 = fadd float %148, %341
  %358 = fadd float %149, %342
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
  %371 = fmul float %355, %355
  %372 = fmul float %356, %356
  %373 = fmul float %357, %357
  %374 = fmul float %358, %358
  %375 = fadd float %359, %360
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
  %386 = fadd float %385, %371
  %387 = fadd float %386, %372
  %388 = fadd float %387, %373
  %389 = fadd float %388, %374
  %390 = bitcast float %389 to i32
  %391 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %390, i32 16, i32 31)
  %392 = bitcast i32 %391 to float
  %393 = fadd float %389, %392
  %394 = bitcast float %393 to i32
  %395 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %394, i32 8, i32 31)
  %396 = bitcast i32 %395 to float
  %397 = fadd float %393, %396
  %398 = bitcast float %397 to i32
  %399 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %398, i32 4, i32 31)
  %400 = bitcast i32 %399 to float
  %401 = fadd float %397, %400
  %402 = bitcast float %401 to i32
  %403 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %402, i32 2, i32 31)
  %404 = bitcast i32 %403 to float
  %405 = fadd float %401, %404
  %406 = bitcast float %405 to i32
  %407 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %406, i32 1, i32 31)
  %408 = bitcast i32 %407 to float
  %409 = fadd float %405, %408
  %410 = icmp eq i32 %10, 0
  %411 = zext nneg i32 %11 to i64
  %412 = getelementptr float, ptr addrspace(3) @global_smem, i64 %411
  %413 = bitcast float %409 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %412, <1 x i32> %413, i1 %410) #10
  tail call void @llvm.nvvm.barrier0()
  %414 = icmp samesign ult i32 %9, 2
  %415 = zext nneg i32 %9 to i64
  %416 = getelementptr float, ptr addrspace(3) @global_smem, i64 %415
  %417 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %416, i1 %414) #10
  %418 = bitcast i32 %417 to float
  %419 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %417, i32 1, i32 31)
  %420 = bitcast i32 %419 to float
  %421 = fadd float %418, %420
  %422 = icmp eq i32 %9, 0
  %423 = bitcast float %421 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %416, <1 x i32> %423, i1 %422) #10
  tail call void @llvm.nvvm.barrier0()
  %424 = load float, ptr addrspace(3) @global_smem, align 16
  %425 = fmul float %424, 0x3F50000000000000
  %426 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
  %427 = bitcast i32 %426 to float
  %428 = fadd float %425, %427
  %429 = tail call float @llvm.nvvm.rsqrt.approx.f(float %428)
  %430 = fmul float %85, %429
  %431 = fmul float %86, %429
  %432 = fmul float %87, %429
  %433 = fmul float %88, %429
  %434 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %5
  %435 = getelementptr bfloat, ptr addrspace(1) %434, i64 %17
  %436 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %435) #10
  %437 = extractvalue { i32, i32 } %436, 0
  %438 = bitcast i32 %437 to <2 x bfloat>
  %439 = extractvalue { i32, i32 } %436, 1
  %440 = bitcast i32 %439 to <2 x bfloat>
  %441 = extractelement <2 x bfloat> %438, i64 0
  %442 = extractelement <2 x bfloat> %438, i64 1
  %443 = extractelement <2 x bfloat> %440, i64 0
  %444 = extractelement <2 x bfloat> %440, i64 1
  %445 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %441) #10
  %446 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %442) #10
  %447 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %443) #10
  %448 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %444) #10
  %449 = fmul float %430, %445
  %450 = fmul float %431, %446
  %451 = fmul float %432, %447
  %452 = fmul float %433, %448
  %453 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %449) #10
  %454 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %450) #10
  %455 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %451) #10
  %456 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %452) #10
  %457 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %4
  %458 = getelementptr bfloat, ptr addrspace(1) %457, i64 %17
  %459 = insertelement <2 x bfloat> poison, bfloat %453, i64 0
  %460 = insertelement <2 x bfloat> %459, bfloat %454, i64 1
  %461 = bitcast <2 x bfloat> %460 to i32
  %462 = insertelement <2 x bfloat> poison, bfloat %455, i64 0
  %463 = insertelement <2 x bfloat> %462, bfloat %456, i64 1
  %464 = bitcast <2 x bfloat> %463 to i32
  tail call void asm sideeffect "st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l"(i32 %461, i32 %464, ptr addrspace(1) %458) #10
  ret void
}

define ptx_kernel void @fusion_60(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(131072) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6) local_unnamed_addr #5 {
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
  %6 = shl i64 %3, 12
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
  %33 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %4
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
  %48 = getelementptr i8, ptr addrspace(1) %18, i64 4096
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
  %62 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %4
  %63 = getelementptr bfloat, ptr addrspace(1) %62, i64 %17
  %64 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %63) #10
  %65 = extractvalue { i32, i32 } %64, 0
  %66 = bitcast i32 %65 to <2 x bfloat>
  %67 = extractvalue { i32, i32 } %64, 1
  %68 = bitcast i32 %67 to <2 x bfloat>
  %69 = extractelement <2 x bfloat> %66, i64 0
  %70 = extractelement <2 x bfloat> %66, i64 1
  %71 = extractelement <2 x bfloat> %68, i64 0
  %72 = extractelement <2 x bfloat> %68, i64 1
  %73 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %69) #10
  %74 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %70) #10
  %75 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %71) #10
  %76 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %72) #10
  %77 = getelementptr i8, ptr addrspace(1) %18, i64 6144
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
  %91 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %4
  %92 = getelementptr bfloat, ptr addrspace(1) %91, i64 %17
  %93 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %92) #10
  %94 = extractvalue { i32, i32 } %93, 0
  %95 = bitcast i32 %94 to <2 x bfloat>
  %96 = extractvalue { i32, i32 } %93, 1
  %97 = bitcast i32 %96 to <2 x bfloat>
  %98 = extractelement <2 x bfloat> %95, i64 0
  %99 = extractelement <2 x bfloat> %95, i64 1
  %100 = extractelement <2 x bfloat> %97, i64 0
  %101 = extractelement <2 x bfloat> %97, i64 1
  %102 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #10
  %103 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #10
  %104 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #10
  %105 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #10
  %106 = fadd float %87, %102
  %107 = fadd float %88, %103
  %108 = fadd float %89, %104
  %109 = fadd float %90, %105
  %110 = fadd float %73, %106
  %111 = fadd float %74, %107
  %112 = fadd float %75, %108
  %113 = fadd float %76, %109
  %114 = fadd float %58, %110
  %115 = fadd float %59, %111
  %116 = fadd float %60, %112
  %117 = fadd float %61, %113
  %118 = fadd float %44, %114
  %119 = fadd float %45, %115
  %120 = fadd float %46, %116
  %121 = fadd float %47, %117
  %122 = fadd float %29, %118
  %123 = fadd float %30, %119
  %124 = fadd float %31, %120
  %125 = fadd float %32, %121
  %126 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %6
  %127 = getelementptr i8, ptr addrspace(1) %126, i64 2048
  %128 = shl nuw nsw i32 %9, 3
  %129 = and i32 %128, 248
  %130 = select i1 %14, i32 0, i32 256
  %131 = or disjoint i32 %129, %130
  %132 = zext nneg i32 %131 to i64
  %133 = getelementptr bfloat, ptr addrspace(1) %126, i64 %132
  %134 = getelementptr i8, ptr addrspace(1) %133, i64 2048
  %135 = getelementptr bfloat, ptr addrspace(1) %127, i64 %132
  %136 = getelementptr i8, ptr addrspace(1) %135, i64 1024
  %137 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %134) #10
  %138 = extractvalue { i32, i32, i32, i32 } %137, 0
  %139 = bitcast i32 %138 to <2 x bfloat>
  %140 = extractvalue { i32, i32, i32, i32 } %137, 1
  %141 = bitcast i32 %140 to <2 x bfloat>
  %142 = extractvalue { i32, i32, i32, i32 } %137, 2
  %143 = bitcast i32 %142 to <2 x bfloat>
  %144 = extractvalue { i32, i32, i32, i32 } %137, 3
  %145 = bitcast i32 %144 to <2 x bfloat>
  %146 = extractelement <2 x bfloat> %139, i64 0
  %147 = extractelement <2 x bfloat> %139, i64 1
  %148 = extractelement <2 x bfloat> %141, i64 0
  %149 = extractelement <2 x bfloat> %141, i64 1
  %150 = extractelement <2 x bfloat> %143, i64 0
  %151 = extractelement <2 x bfloat> %143, i64 1
  %152 = extractelement <2 x bfloat> %145, i64 0
  %153 = extractelement <2 x bfloat> %145, i64 1
  %154 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %136) #10
  %155 = extractvalue { i32, i32, i32, i32 } %154, 0
  %156 = bitcast i32 %155 to <2 x bfloat>
  %157 = extractvalue { i32, i32, i32, i32 } %154, 1
  %158 = bitcast i32 %157 to <2 x bfloat>
  %159 = extractvalue { i32, i32, i32, i32 } %154, 2
  %160 = bitcast i32 %159 to <2 x bfloat>
  %161 = extractvalue { i32, i32, i32, i32 } %154, 3
  %162 = bitcast i32 %161 to <2 x bfloat>
  %163 = extractelement <2 x bfloat> %156, i64 0
  %164 = extractelement <2 x bfloat> %156, i64 1
  %165 = extractelement <2 x bfloat> %158, i64 0
  %166 = extractelement <2 x bfloat> %158, i64 1
  %167 = extractelement <2 x bfloat> %160, i64 0
  %168 = extractelement <2 x bfloat> %160, i64 1
  %169 = extractelement <2 x bfloat> %162, i64 0
  %170 = extractelement <2 x bfloat> %162, i64 1
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %146) #10
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %147) #10
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %148) #10
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %149) #10
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %150) #10
  %176 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %151) #10
  %177 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #10
  %178 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #10
  %179 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %163) #10
  %180 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %164) #10
  %181 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %165) #10
  %182 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %166) #10
  %183 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %167) #10
  %184 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %168) #10
  %185 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %169) #10
  %186 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %170) #10
  %187 = shl i64 %3, 10
  %188 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %187
  %189 = getelementptr bfloat, ptr addrspace(1) %188, i64 %132
  %190 = getelementptr i8, ptr addrspace(1) %189, i64 1024
  %191 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %189) #10
  %192 = extractvalue { i32, i32, i32, i32 } %191, 0
  %193 = bitcast i32 %192 to <2 x bfloat>
  %194 = extractvalue { i32, i32, i32, i32 } %191, 1
  %195 = bitcast i32 %194 to <2 x bfloat>
  %196 = extractvalue { i32, i32, i32, i32 } %191, 2
  %197 = bitcast i32 %196 to <2 x bfloat>
  %198 = extractvalue { i32, i32, i32, i32 } %191, 3
  %199 = bitcast i32 %198 to <2 x bfloat>
  %200 = extractelement <2 x bfloat> %193, i64 0
  %201 = extractelement <2 x bfloat> %193, i64 1
  %202 = extractelement <2 x bfloat> %195, i64 0
  %203 = extractelement <2 x bfloat> %195, i64 1
  %204 = extractelement <2 x bfloat> %197, i64 0
  %205 = extractelement <2 x bfloat> %197, i64 1
  %206 = extractelement <2 x bfloat> %199, i64 0
  %207 = extractelement <2 x bfloat> %199, i64 1
  %208 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %190) #10
  %209 = extractvalue { i32, i32, i32, i32 } %208, 0
  %210 = bitcast i32 %209 to <2 x bfloat>
  %211 = extractvalue { i32, i32, i32, i32 } %208, 1
  %212 = bitcast i32 %211 to <2 x bfloat>
  %213 = extractvalue { i32, i32, i32, i32 } %208, 2
  %214 = bitcast i32 %213 to <2 x bfloat>
  %215 = extractvalue { i32, i32, i32, i32 } %208, 3
  %216 = bitcast i32 %215 to <2 x bfloat>
  %217 = extractelement <2 x bfloat> %210, i64 0
  %218 = extractelement <2 x bfloat> %210, i64 1
  %219 = extractelement <2 x bfloat> %212, i64 0
  %220 = extractelement <2 x bfloat> %212, i64 1
  %221 = extractelement <2 x bfloat> %214, i64 0
  %222 = extractelement <2 x bfloat> %214, i64 1
  %223 = extractelement <2 x bfloat> %216, i64 0
  %224 = extractelement <2 x bfloat> %216, i64 1
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %200) #10
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %201) #10
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %202) #10
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %203) #10
  %229 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %204) #10
  %230 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #10
  %231 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #10
  %232 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #10
  %233 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %217) #10
  %234 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %218) #10
  %235 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %219) #10
  %236 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %220) #10
  %237 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %221) #10
  %238 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %222) #10
  %239 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %223) #10
  %240 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %224) #10
  %241 = getelementptr i8, ptr addrspace(1) %126, i64 4096
  %242 = getelementptr i8, ptr addrspace(1) %133, i64 4096
  %243 = getelementptr bfloat, ptr addrspace(1) %241, i64 %132
  %244 = getelementptr i8, ptr addrspace(1) %243, i64 1024
  %245 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %242) #10
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
  %262 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %244) #10
  %263 = extractvalue { i32, i32, i32, i32 } %262, 0
  %264 = bitcast i32 %263 to <2 x bfloat>
  %265 = extractvalue { i32, i32, i32, i32 } %262, 1
  %266 = bitcast i32 %265 to <2 x bfloat>
  %267 = extractvalue { i32, i32, i32, i32 } %262, 2
  %268 = bitcast i32 %267 to <2 x bfloat>
  %269 = extractvalue { i32, i32, i32, i32 } %262, 3
  %270 = bitcast i32 %269 to <2 x bfloat>
  %271 = extractelement <2 x bfloat> %264, i64 0
  %272 = extractelement <2 x bfloat> %264, i64 1
  %273 = extractelement <2 x bfloat> %266, i64 0
  %274 = extractelement <2 x bfloat> %266, i64 1
  %275 = extractelement <2 x bfloat> %268, i64 0
  %276 = extractelement <2 x bfloat> %268, i64 1
  %277 = extractelement <2 x bfloat> %270, i64 0
  %278 = extractelement <2 x bfloat> %270, i64 1
  %279 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %254) #10
  %280 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %255) #10
  %281 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %256) #10
  %282 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %257) #10
  %283 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %258) #10
  %284 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259) #10
  %285 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #10
  %286 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #10
  %287 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %271) #10
  %288 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %272) #10
  %289 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %273) #10
  %290 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %274) #10
  %291 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %275) #10
  %292 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %276) #10
  %293 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %277) #10
  %294 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %278) #10
  %295 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %187
  %296 = getelementptr bfloat, ptr addrspace(1) %295, i64 %132
  %297 = getelementptr i8, ptr addrspace(1) %296, i64 1024
  %298 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %296) #10
  %299 = extractvalue { i32, i32, i32, i32 } %298, 0
  %300 = bitcast i32 %299 to <2 x bfloat>
  %301 = extractvalue { i32, i32, i32, i32 } %298, 1
  %302 = bitcast i32 %301 to <2 x bfloat>
  %303 = extractvalue { i32, i32, i32, i32 } %298, 2
  %304 = bitcast i32 %303 to <2 x bfloat>
  %305 = extractvalue { i32, i32, i32, i32 } %298, 3
  %306 = bitcast i32 %305 to <2 x bfloat>
  %307 = extractelement <2 x bfloat> %300, i64 0
  %308 = extractelement <2 x bfloat> %300, i64 1
  %309 = extractelement <2 x bfloat> %302, i64 0
  %310 = extractelement <2 x bfloat> %302, i64 1
  %311 = extractelement <2 x bfloat> %304, i64 0
  %312 = extractelement <2 x bfloat> %304, i64 1
  %313 = extractelement <2 x bfloat> %306, i64 0
  %314 = extractelement <2 x bfloat> %306, i64 1
  %315 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %297) #10
  %316 = extractvalue { i32, i32, i32, i32 } %315, 0
  %317 = bitcast i32 %316 to <2 x bfloat>
  %318 = extractvalue { i32, i32, i32, i32 } %315, 1
  %319 = bitcast i32 %318 to <2 x bfloat>
  %320 = extractvalue { i32, i32, i32, i32 } %315, 2
  %321 = bitcast i32 %320 to <2 x bfloat>
  %322 = extractvalue { i32, i32, i32, i32 } %315, 3
  %323 = bitcast i32 %322 to <2 x bfloat>
  %324 = extractelement <2 x bfloat> %317, i64 0
  %325 = extractelement <2 x bfloat> %317, i64 1
  %326 = extractelement <2 x bfloat> %319, i64 0
  %327 = extractelement <2 x bfloat> %319, i64 1
  %328 = extractelement <2 x bfloat> %321, i64 0
  %329 = extractelement <2 x bfloat> %321, i64 1
  %330 = extractelement <2 x bfloat> %323, i64 0
  %331 = extractelement <2 x bfloat> %323, i64 1
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %307) #10
  %333 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %308) #10
  %334 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %309) #10
  %335 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %310) #10
  %336 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %311) #10
  %337 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %312) #10
  %338 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313) #10
  %339 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314) #10
  %340 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %324) #10
  %341 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %325) #10
  %342 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %326) #10
  %343 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %327) #10
  %344 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %328) #10
  %345 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %329) #10
  %346 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %330) #10
  %347 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %331) #10
  %348 = getelementptr i8, ptr addrspace(1) %126, i64 6144
  %349 = getelementptr i8, ptr addrspace(1) %133, i64 6144
  %350 = getelementptr bfloat, ptr addrspace(1) %348, i64 %132
  %351 = getelementptr i8, ptr addrspace(1) %350, i64 1024
  %352 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %349) #10
  %353 = extractvalue { i32, i32, i32, i32 } %352, 0
  %354 = bitcast i32 %353 to <2 x bfloat>
  %355 = extractvalue { i32, i32, i32, i32 } %352, 1
  %356 = bitcast i32 %355 to <2 x bfloat>
  %357 = extractvalue { i32, i32, i32, i32 } %352, 2
  %358 = bitcast i32 %357 to <2 x bfloat>
  %359 = extractvalue { i32, i32, i32, i32 } %352, 3
  %360 = bitcast i32 %359 to <2 x bfloat>
  %361 = extractelement <2 x bfloat> %354, i64 0
  %362 = extractelement <2 x bfloat> %354, i64 1
  %363 = extractelement <2 x bfloat> %356, i64 0
  %364 = extractelement <2 x bfloat> %356, i64 1
  %365 = extractelement <2 x bfloat> %358, i64 0
  %366 = extractelement <2 x bfloat> %358, i64 1
  %367 = extractelement <2 x bfloat> %360, i64 0
  %368 = extractelement <2 x bfloat> %360, i64 1
  %369 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %351) #10
  %370 = extractvalue { i32, i32, i32, i32 } %369, 0
  %371 = bitcast i32 %370 to <2 x bfloat>
  %372 = extractvalue { i32, i32, i32, i32 } %369, 1
  %373 = bitcast i32 %372 to <2 x bfloat>
  %374 = extractvalue { i32, i32, i32, i32 } %369, 2
  %375 = bitcast i32 %374 to <2 x bfloat>
  %376 = extractvalue { i32, i32, i32, i32 } %369, 3
  %377 = bitcast i32 %376 to <2 x bfloat>
  %378 = extractelement <2 x bfloat> %371, i64 0
  %379 = extractelement <2 x bfloat> %371, i64 1
  %380 = extractelement <2 x bfloat> %373, i64 0
  %381 = extractelement <2 x bfloat> %373, i64 1
  %382 = extractelement <2 x bfloat> %375, i64 0
  %383 = extractelement <2 x bfloat> %375, i64 1
  %384 = extractelement <2 x bfloat> %377, i64 0
  %385 = extractelement <2 x bfloat> %377, i64 1
  %386 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %361) #10
  %387 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %362) #10
  %388 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %363) #10
  %389 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %364) #10
  %390 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %365) #10
  %391 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %366) #10
  %392 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %367) #10
  %393 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %368) #10
  %394 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %378) #10
  %395 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %379) #10
  %396 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %380) #10
  %397 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %381) #10
  %398 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %382) #10
  %399 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %383) #10
  %400 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %384) #10
  %401 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %385) #10
  %402 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %187
  %403 = getelementptr bfloat, ptr addrspace(1) %402, i64 %132
  %404 = getelementptr i8, ptr addrspace(1) %403, i64 1024
  %405 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %403) #10
  %406 = extractvalue { i32, i32, i32, i32 } %405, 0
  %407 = bitcast i32 %406 to <2 x bfloat>
  %408 = extractvalue { i32, i32, i32, i32 } %405, 1
  %409 = bitcast i32 %408 to <2 x bfloat>
  %410 = extractvalue { i32, i32, i32, i32 } %405, 2
  %411 = bitcast i32 %410 to <2 x bfloat>
  %412 = extractvalue { i32, i32, i32, i32 } %405, 3
  %413 = bitcast i32 %412 to <2 x bfloat>
  %414 = extractelement <2 x bfloat> %407, i64 0
  %415 = extractelement <2 x bfloat> %407, i64 1
  %416 = extractelement <2 x bfloat> %409, i64 0
  %417 = extractelement <2 x bfloat> %409, i64 1
  %418 = extractelement <2 x bfloat> %411, i64 0
  %419 = extractelement <2 x bfloat> %411, i64 1
  %420 = extractelement <2 x bfloat> %413, i64 0
  %421 = extractelement <2 x bfloat> %413, i64 1
  %422 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %404) #10
  %423 = extractvalue { i32, i32, i32, i32 } %422, 0
  %424 = bitcast i32 %423 to <2 x bfloat>
  %425 = extractvalue { i32, i32, i32, i32 } %422, 1
  %426 = bitcast i32 %425 to <2 x bfloat>
  %427 = extractvalue { i32, i32, i32, i32 } %422, 2
  %428 = bitcast i32 %427 to <2 x bfloat>
  %429 = extractvalue { i32, i32, i32, i32 } %422, 3
  %430 = bitcast i32 %429 to <2 x bfloat>
  %431 = extractelement <2 x bfloat> %424, i64 0
  %432 = extractelement <2 x bfloat> %424, i64 1
  %433 = extractelement <2 x bfloat> %426, i64 0
  %434 = extractelement <2 x bfloat> %426, i64 1
  %435 = extractelement <2 x bfloat> %428, i64 0
  %436 = extractelement <2 x bfloat> %428, i64 1
  %437 = extractelement <2 x bfloat> %430, i64 0
  %438 = extractelement <2 x bfloat> %430, i64 1
  %439 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %414) #10
  %440 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %415) #10
  %441 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %416) #10
  %442 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %417) #10
  %443 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %418) #10
  %444 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %419) #10
  %445 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %420) #10
  %446 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %421) #10
  %447 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %431) #10
  %448 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %432) #10
  %449 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %433) #10
  %450 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %434) #10
  %451 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %435) #10
  %452 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %436) #10
  %453 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %437) #10
  %454 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %438) #10
  %455 = fadd float %386, %439
  %456 = fadd float %387, %440
  %457 = fadd float %388, %441
  %458 = fadd float %389, %442
  %459 = fadd float %390, %443
  %460 = fadd float %391, %444
  %461 = fadd float %392, %445
  %462 = fadd float %393, %446
  %463 = fadd float %394, %447
  %464 = fadd float %395, %448
  %465 = fadd float %396, %449
  %466 = fadd float %397, %450
  %467 = fadd float %398, %451
  %468 = fadd float %399, %452
  %469 = fadd float %400, %453
  %470 = fadd float %401, %454
  %471 = fadd float %332, %455
  %472 = fadd float %333, %456
  %473 = fadd float %334, %457
  %474 = fadd float %335, %458
  %475 = fadd float %336, %459
  %476 = fadd float %337, %460
  %477 = fadd float %338, %461
  %478 = fadd float %339, %462
  %479 = fadd float %340, %463
  %480 = fadd float %341, %464
  %481 = fadd float %342, %465
  %482 = fadd float %343, %466
  %483 = fadd float %344, %467
  %484 = fadd float %345, %468
  %485 = fadd float %346, %469
  %486 = fadd float %347, %470
  %487 = fadd float %279, %471
  %488 = fadd float %280, %472
  %489 = fadd float %281, %473
  %490 = fadd float %282, %474
  %491 = fadd float %283, %475
  %492 = fadd float %284, %476
  %493 = fadd float %285, %477
  %494 = fadd float %286, %478
  %495 = fadd float %287, %479
  %496 = fadd float %288, %480
  %497 = fadd float %289, %481
  %498 = fadd float %290, %482
  %499 = fadd float %291, %483
  %500 = fadd float %292, %484
  %501 = fadd float %293, %485
  %502 = fadd float %294, %486
  %503 = fadd float %225, %487
  %504 = fadd float %226, %488
  %505 = fadd float %227, %489
  %506 = fadd float %228, %490
  %507 = fadd float %229, %491
  %508 = fadd float %230, %492
  %509 = fadd float %231, %493
  %510 = fadd float %232, %494
  %511 = fadd float %233, %495
  %512 = fadd float %234, %496
  %513 = fadd float %235, %497
  %514 = fadd float %236, %498
  %515 = fadd float %237, %499
  %516 = fadd float %238, %500
  %517 = fadd float %239, %501
  %518 = fadd float %240, %502
  %519 = fadd float %171, %503
  %520 = fadd float %172, %504
  %521 = fadd float %173, %505
  %522 = fadd float %174, %506
  %523 = fadd float %175, %507
  %524 = fadd float %176, %508
  %525 = fadd float %177, %509
  %526 = fadd float %178, %510
  %527 = fadd float %179, %511
  %528 = fadd float %180, %512
  %529 = fadd float %181, %513
  %530 = fadd float %182, %514
  %531 = fadd float %183, %515
  %532 = fadd float %184, %516
  %533 = fadd float %185, %517
  %534 = fadd float %186, %518
  %535 = fmul float %519, %519
  %536 = fmul float %520, %520
  %537 = fmul float %521, %521
  %538 = fmul float %522, %522
  %539 = fmul float %523, %523
  %540 = fmul float %524, %524
  %541 = fmul float %525, %525
  %542 = fmul float %526, %526
  %543 = fmul float %527, %527
  %544 = fmul float %528, %528
  %545 = fmul float %529, %529
  %546 = fmul float %530, %530
  %547 = fmul float %531, %531
  %548 = fmul float %532, %532
  %549 = fmul float %533, %533
  %550 = fmul float %534, %534
  %551 = fadd float %535, %536
  %552 = fadd float %551, %537
  %553 = fadd float %552, %538
  %554 = fadd float %553, %539
  %555 = fadd float %554, %540
  %556 = fadd float %555, %541
  %557 = fadd float %556, %542
  %558 = fadd float %557, %543
  %559 = fadd float %558, %544
  %560 = fadd float %559, %545
  %561 = fadd float %560, %546
  %562 = fadd float %561, %547
  %563 = fadd float %562, %548
  %564 = fadd float %563, %549
  %565 = fadd float %564, %550
  %566 = bitcast float %565 to i32
  %567 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %566, i32 16, i32 31)
  %568 = bitcast i32 %567 to float
  %569 = fadd float %565, %568
  %570 = bitcast float %569 to i32
  %571 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %570, i32 8, i32 31)
  %572 = bitcast i32 %571 to float
  %573 = fadd float %569, %572
  %574 = bitcast float %573 to i32
  %575 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %574, i32 4, i32 31)
  %576 = bitcast i32 %575 to float
  %577 = fadd float %573, %576
  %578 = bitcast float %577 to i32
  %579 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %578, i32 2, i32 31)
  %580 = bitcast i32 %579 to float
  %581 = fadd float %577, %580
  %582 = bitcast float %581 to i32
  %583 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %582, i32 1, i32 31)
  %584 = bitcast i32 %583 to float
  %585 = fadd float %581, %584
  %586 = icmp eq i32 %10, 0
  %587 = zext nneg i32 %11 to i64
  %588 = getelementptr float, ptr addrspace(3) @global_smem, i64 %587
  %589 = bitcast float %585 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %588, <1 x i32> %589, i1 %586) #10
  tail call void @llvm.nvvm.barrier0()
  %590 = icmp samesign ult i32 %9, 2
  %591 = zext nneg i32 %9 to i64
  %592 = getelementptr float, ptr addrspace(3) @global_smem, i64 %591
  %593 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %592, i1 %590) #10
  %594 = bitcast i32 %593 to float
  %595 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %593, i32 1, i32 31)
  %596 = bitcast i32 %595 to float
  %597 = fadd float %594, %596
  %598 = icmp eq i32 %9, 0
  %599 = bitcast float %597 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %592, <1 x i32> %599, i1 %598) #10
  tail call void @llvm.nvvm.barrier0()
  %600 = load float, ptr addrspace(3) @global_smem, align 16
  %601 = fmul float %600, 0x3F50000000000000
  %602 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
  %603 = bitcast i32 %602 to float
  %604 = fadd float %601, %603
  %605 = tail call float @llvm.nvvm.rsqrt.approx.f(float %604)
  %606 = fmul float %122, %605
  %607 = fmul float %123, %605
  %608 = fmul float %124, %605
  %609 = fmul float %125, %605
  %610 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %5
  %611 = getelementptr bfloat, ptr addrspace(1) %610, i64 %17
  %612 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %611) #10
  %613 = extractvalue { i32, i32 } %612, 0
  %614 = bitcast i32 %613 to <2 x bfloat>
  %615 = extractvalue { i32, i32 } %612, 1
  %616 = bitcast i32 %615 to <2 x bfloat>
  %617 = extractelement <2 x bfloat> %614, i64 0
  %618 = extractelement <2 x bfloat> %614, i64 1
  %619 = extractelement <2 x bfloat> %616, i64 0
  %620 = extractelement <2 x bfloat> %616, i64 1
  %621 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %617) #10
  %622 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %618) #10
  %623 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %619) #10
  %624 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %620) #10
  %625 = fmul float %606, %621
  %626 = fmul float %607, %622
  %627 = fmul float %608, %623
  %628 = fmul float %609, %624
  %629 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %625) #10
  %630 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %626) #10
  %631 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %627) #10
  %632 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %628) #10
  %633 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %4
  %634 = getelementptr bfloat, ptr addrspace(1) %633, i64 %17
  %635 = insertelement <2 x bfloat> poison, bfloat %629, i64 0
  %636 = insertelement <2 x bfloat> %635, bfloat %630, i64 1
  %637 = bitcast <2 x bfloat> %636 to i32
  %638 = insertelement <2 x bfloat> poison, bfloat %631, i64 0
  %639 = insertelement <2 x bfloat> %638, bfloat %632, i64 1
  %640 = bitcast <2 x bfloat> %639 to i32
  tail call void asm sideeffect "st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l"(i32 %637, i32 %640, ptr addrspace(1) %634) #10
  ret void
}

define ptx_kernel void @fusion_58(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(131072) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6, ptr noalias align 128 dereferenceable(32768) %arg7) local_unnamed_addr #5 {
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
  %3 = shl nsw i64 %2, 12
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
  %67 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %66
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
  %174 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %66
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
  %227 = getelementptr i8, ptr addrspace(1) %4, i64 4096
  %228 = getelementptr i8, ptr addrspace(1) %14, i64 4096
  %229 = getelementptr bfloat, ptr addrspace(1) %227, i64 %13
  %230 = getelementptr i8, ptr addrspace(1) %229, i64 1024
  %231 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %228) #10
  %232 = extractvalue { i32, i32, i32, i32 } %231, 0
  %233 = bitcast i32 %232 to <2 x bfloat>
  %234 = extractvalue { i32, i32, i32, i32 } %231, 1
  %235 = bitcast i32 %234 to <2 x bfloat>
  %236 = extractvalue { i32, i32, i32, i32 } %231, 2
  %237 = bitcast i32 %236 to <2 x bfloat>
  %238 = extractvalue { i32, i32, i32, i32 } %231, 3
  %239 = bitcast i32 %238 to <2 x bfloat>
  %240 = extractelement <2 x bfloat> %233, i64 0
  %241 = extractelement <2 x bfloat> %233, i64 1
  %242 = extractelement <2 x bfloat> %235, i64 0
  %243 = extractelement <2 x bfloat> %235, i64 1
  %244 = extractelement <2 x bfloat> %237, i64 0
  %245 = extractelement <2 x bfloat> %237, i64 1
  %246 = extractelement <2 x bfloat> %239, i64 0
  %247 = extractelement <2 x bfloat> %239, i64 1
  %248 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %230) #10
  %249 = extractvalue { i32, i32, i32, i32 } %248, 0
  %250 = bitcast i32 %249 to <2 x bfloat>
  %251 = extractvalue { i32, i32, i32, i32 } %248, 1
  %252 = bitcast i32 %251 to <2 x bfloat>
  %253 = extractvalue { i32, i32, i32, i32 } %248, 2
  %254 = bitcast i32 %253 to <2 x bfloat>
  %255 = extractvalue { i32, i32, i32, i32 } %248, 3
  %256 = bitcast i32 %255 to <2 x bfloat>
  %257 = extractelement <2 x bfloat> %250, i64 0
  %258 = extractelement <2 x bfloat> %250, i64 1
  %259 = extractelement <2 x bfloat> %252, i64 0
  %260 = extractelement <2 x bfloat> %252, i64 1
  %261 = extractelement <2 x bfloat> %254, i64 0
  %262 = extractelement <2 x bfloat> %254, i64 1
  %263 = extractelement <2 x bfloat> %256, i64 0
  %264 = extractelement <2 x bfloat> %256, i64 1
  %265 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %240) #10
  %266 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %241) #10
  %267 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242) #10
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #10
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244) #10
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245) #10
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246) #10
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %247) #10
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %257) #10
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %258) #10
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259) #10
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #10
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #10
  %278 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262) #10
  %279 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %263) #10
  %280 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %264) #10
  %281 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %66
  %282 = getelementptr bfloat, ptr addrspace(1) %281, i64 %13
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
  %334 = getelementptr i8, ptr addrspace(1) %4, i64 6144
  %335 = getelementptr i8, ptr addrspace(1) %14, i64 6144
  %336 = getelementptr bfloat, ptr addrspace(1) %334, i64 %13
  %337 = getelementptr i8, ptr addrspace(1) %336, i64 1024
  %338 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %335) #10
  %339 = extractvalue { i32, i32, i32, i32 } %338, 0
  %340 = bitcast i32 %339 to <2 x bfloat>
  %341 = extractvalue { i32, i32, i32, i32 } %338, 1
  %342 = bitcast i32 %341 to <2 x bfloat>
  %343 = extractvalue { i32, i32, i32, i32 } %338, 2
  %344 = bitcast i32 %343 to <2 x bfloat>
  %345 = extractvalue { i32, i32, i32, i32 } %338, 3
  %346 = bitcast i32 %345 to <2 x bfloat>
  %347 = extractelement <2 x bfloat> %340, i64 0
  %348 = extractelement <2 x bfloat> %340, i64 1
  %349 = extractelement <2 x bfloat> %342, i64 0
  %350 = extractelement <2 x bfloat> %342, i64 1
  %351 = extractelement <2 x bfloat> %344, i64 0
  %352 = extractelement <2 x bfloat> %344, i64 1
  %353 = extractelement <2 x bfloat> %346, i64 0
  %354 = extractelement <2 x bfloat> %346, i64 1
  %355 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %337) #10
  %356 = extractvalue { i32, i32, i32, i32 } %355, 0
  %357 = bitcast i32 %356 to <2 x bfloat>
  %358 = extractvalue { i32, i32, i32, i32 } %355, 1
  %359 = bitcast i32 %358 to <2 x bfloat>
  %360 = extractvalue { i32, i32, i32, i32 } %355, 2
  %361 = bitcast i32 %360 to <2 x bfloat>
  %362 = extractvalue { i32, i32, i32, i32 } %355, 3
  %363 = bitcast i32 %362 to <2 x bfloat>
  %364 = extractelement <2 x bfloat> %357, i64 0
  %365 = extractelement <2 x bfloat> %357, i64 1
  %366 = extractelement <2 x bfloat> %359, i64 0
  %367 = extractelement <2 x bfloat> %359, i64 1
  %368 = extractelement <2 x bfloat> %361, i64 0
  %369 = extractelement <2 x bfloat> %361, i64 1
  %370 = extractelement <2 x bfloat> %363, i64 0
  %371 = extractelement <2 x bfloat> %363, i64 1
  %372 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %347) #10
  %373 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %348) #10
  %374 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %349) #10
  %375 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %350) #10
  %376 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %351) #10
  %377 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %352) #10
  %378 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %353) #10
  %379 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %354) #10
  %380 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %364) #10
  %381 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %365) #10
  %382 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %366) #10
  %383 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %367) #10
  %384 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %368) #10
  %385 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %369) #10
  %386 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %370) #10
  %387 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %371) #10
  %388 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %66
  %389 = getelementptr bfloat, ptr addrspace(1) %388, i64 %13
  %390 = getelementptr i8, ptr addrspace(1) %389, i64 1024
  %391 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %389) #10
  %392 = extractvalue { i32, i32, i32, i32 } %391, 0
  %393 = bitcast i32 %392 to <2 x bfloat>
  %394 = extractvalue { i32, i32, i32, i32 } %391, 1
  %395 = bitcast i32 %394 to <2 x bfloat>
  %396 = extractvalue { i32, i32, i32, i32 } %391, 2
  %397 = bitcast i32 %396 to <2 x bfloat>
  %398 = extractvalue { i32, i32, i32, i32 } %391, 3
  %399 = bitcast i32 %398 to <2 x bfloat>
  %400 = extractelement <2 x bfloat> %393, i64 0
  %401 = extractelement <2 x bfloat> %393, i64 1
  %402 = extractelement <2 x bfloat> %395, i64 0
  %403 = extractelement <2 x bfloat> %395, i64 1
  %404 = extractelement <2 x bfloat> %397, i64 0
  %405 = extractelement <2 x bfloat> %397, i64 1
  %406 = extractelement <2 x bfloat> %399, i64 0
  %407 = extractelement <2 x bfloat> %399, i64 1
  %408 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %390) #10
  %409 = extractvalue { i32, i32, i32, i32 } %408, 0
  %410 = bitcast i32 %409 to <2 x bfloat>
  %411 = extractvalue { i32, i32, i32, i32 } %408, 1
  %412 = bitcast i32 %411 to <2 x bfloat>
  %413 = extractvalue { i32, i32, i32, i32 } %408, 2
  %414 = bitcast i32 %413 to <2 x bfloat>
  %415 = extractvalue { i32, i32, i32, i32 } %408, 3
  %416 = bitcast i32 %415 to <2 x bfloat>
  %417 = extractelement <2 x bfloat> %410, i64 0
  %418 = extractelement <2 x bfloat> %410, i64 1
  %419 = extractelement <2 x bfloat> %412, i64 0
  %420 = extractelement <2 x bfloat> %412, i64 1
  %421 = extractelement <2 x bfloat> %414, i64 0
  %422 = extractelement <2 x bfloat> %414, i64 1
  %423 = extractelement <2 x bfloat> %416, i64 0
  %424 = extractelement <2 x bfloat> %416, i64 1
  %425 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %400) #10
  %426 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %401) #10
  %427 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %402) #10
  %428 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %403) #10
  %429 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %404) #10
  %430 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %405) #10
  %431 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %406) #10
  %432 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %407) #10
  %433 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %417) #10
  %434 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %418) #10
  %435 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %419) #10
  %436 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %420) #10
  %437 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %421) #10
  %438 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %422) #10
  %439 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %423) #10
  %440 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %424) #10
  %441 = fadd float %372, %425
  %442 = fadd float %373, %426
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
  %457 = fadd float %318, %441
  %458 = fadd float %319, %442
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
  %473 = fadd float %265, %457
  %474 = fadd float %266, %458
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
  %489 = fadd float %211, %473
  %490 = fadd float %212, %474
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
  %505 = fadd float %158, %489
  %506 = fadd float %159, %490
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
  %521 = fadd float %104, %505
  %522 = fadd float %105, %506
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
  %537 = fadd float %50, %521
  %538 = fadd float %51, %522
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
  %553 = fmul float %537, %537
  %554 = fmul float %538, %538
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
  %569 = fadd float %553, %554
  %570 = fadd float %569, %555
  %571 = fadd float %570, %556
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
  %584 = bitcast float %583 to i32
  %585 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %584, i32 16, i32 31)
  %586 = bitcast i32 %585 to float
  %587 = fadd float %583, %586
  %588 = bitcast float %587 to i32
  %589 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %588, i32 8, i32 31)
  %590 = bitcast i32 %589 to float
  %591 = fadd float %587, %590
  %592 = bitcast float %591 to i32
  %593 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %592, i32 4, i32 31)
  %594 = bitcast i32 %593 to float
  %595 = fadd float %591, %594
  %596 = bitcast float %595 to i32
  %597 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %596, i32 2, i32 31)
  %598 = bitcast i32 %597 to float
  %599 = fadd float %595, %598
  %600 = bitcast float %599 to i32
  %601 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %600, i32 1, i32 31)
  %602 = bitcast i32 %601 to float
  %603 = fadd float %599, %602
  %604 = icmp eq i32 %6, 0
  %605 = zext nneg i32 %7 to i64
  %606 = getelementptr float, ptr addrspace(3) @global_smem, i64 %605
  %607 = bitcast float %603 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %606, <1 x i32> %607, i1 %604) #10
  tail call void @llvm.nvvm.barrier0()
  %608 = icmp samesign ult i32 %5, 2
  %609 = zext nneg i32 %5 to i64
  %610 = getelementptr float, ptr addrspace(3) @global_smem, i64 %609
  %611 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %610, i1 %608) #10
  %612 = bitcast i32 %611 to float
  %613 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %611, i32 1, i32 31)
  %614 = bitcast i32 %613 to float
  %615 = fadd float %612, %614
  %616 = icmp eq i32 %5, 0
  %617 = bitcast float %615 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %610, <1 x i32> %617, i1 %616) #10
  tail call void @llvm.nvvm.barrier0()
  %618 = load float, ptr addrspace(3) @global_smem, align 16
  %619 = fmul float %618, 0x3F50000000000000
  %620 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
  %621 = bitcast i32 %620 to float
  %622 = fadd float %619, %621
  %623 = tail call float @llvm.nvvm.rsqrt.approx.f(float %622)
  %624 = fmul float %537, %623
  %625 = fmul float %538, %623
  %626 = fmul float %539, %623
  %627 = fmul float %540, %623
  %628 = fmul float %541, %623
  %629 = fmul float %542, %623
  %630 = fmul float %543, %623
  %631 = fmul float %544, %623
  %632 = fmul float %545, %623
  %633 = fmul float %546, %623
  %634 = fmul float %547, %623
  %635 = fmul float %548, %623
  %636 = fmul float %549, %623
  %637 = fmul float %550, %623
  %638 = fmul float %551, %623
  %639 = fmul float %552, %623
  %640 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %13
  %641 = getelementptr i8, ptr addrspace(1) %640, i64 1024
  %642 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %640) #10
  %643 = extractvalue { i32, i32, i32, i32 } %642, 0
  %644 = bitcast i32 %643 to <2 x bfloat>
  %645 = extractvalue { i32, i32, i32, i32 } %642, 1
  %646 = bitcast i32 %645 to <2 x bfloat>
  %647 = extractvalue { i32, i32, i32, i32 } %642, 2
  %648 = bitcast i32 %647 to <2 x bfloat>
  %649 = extractvalue { i32, i32, i32, i32 } %642, 3
  %650 = bitcast i32 %649 to <2 x bfloat>
  %651 = extractelement <2 x bfloat> %644, i64 0
  %652 = extractelement <2 x bfloat> %644, i64 1
  %653 = extractelement <2 x bfloat> %646, i64 0
  %654 = extractelement <2 x bfloat> %646, i64 1
  %655 = extractelement <2 x bfloat> %648, i64 0
  %656 = extractelement <2 x bfloat> %648, i64 1
  %657 = extractelement <2 x bfloat> %650, i64 0
  %658 = extractelement <2 x bfloat> %650, i64 1
  %659 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %641) #10
  %660 = extractvalue { i32, i32, i32, i32 } %659, 0
  %661 = bitcast i32 %660 to <2 x bfloat>
  %662 = extractvalue { i32, i32, i32, i32 } %659, 1
  %663 = bitcast i32 %662 to <2 x bfloat>
  %664 = extractvalue { i32, i32, i32, i32 } %659, 2
  %665 = bitcast i32 %664 to <2 x bfloat>
  %666 = extractvalue { i32, i32, i32, i32 } %659, 3
  %667 = bitcast i32 %666 to <2 x bfloat>
  %668 = extractelement <2 x bfloat> %661, i64 0
  %669 = extractelement <2 x bfloat> %661, i64 1
  %670 = extractelement <2 x bfloat> %663, i64 0
  %671 = extractelement <2 x bfloat> %663, i64 1
  %672 = extractelement <2 x bfloat> %665, i64 0
  %673 = extractelement <2 x bfloat> %665, i64 1
  %674 = extractelement <2 x bfloat> %667, i64 0
  %675 = extractelement <2 x bfloat> %667, i64 1
  %676 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %651) #10
  %677 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %652) #10
  %678 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %653) #10
  %679 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %654) #10
  %680 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %655) #10
  %681 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %656) #10
  %682 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %657) #10
  %683 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %658) #10
  %684 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %668) #10
  %685 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %669) #10
  %686 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %670) #10
  %687 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %671) #10
  %688 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %672) #10
  %689 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %673) #10
  %690 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %674) #10
  %691 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %675) #10
  %692 = fmul float %624, %676
  %693 = fmul float %625, %677
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
  %708 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %692) #10
  %709 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %693) #10
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
  %724 = getelementptr bfloat, ptr addrspace(1) %arg715, i64 %66
  %725 = getelementptr bfloat, ptr addrspace(1) %724, i64 %13
  %726 = getelementptr i8, ptr addrspace(1) %725, i64 1024
  %727 = insertelement <2 x bfloat> poison, bfloat %708, i64 0
  %728 = insertelement <2 x bfloat> %727, bfloat %709, i64 1
  %729 = bitcast <2 x bfloat> %728 to i32
  %730 = insertelement <2 x bfloat> poison, bfloat %710, i64 0
  %731 = insertelement <2 x bfloat> %730, bfloat %711, i64 1
  %732 = bitcast <2 x bfloat> %731 to i32
  %733 = insertelement <2 x bfloat> poison, bfloat %712, i64 0
  %734 = insertelement <2 x bfloat> %733, bfloat %713, i64 1
  %735 = bitcast <2 x bfloat> %734 to i32
  %736 = insertelement <2 x bfloat> poison, bfloat %714, i64 0
  %737 = insertelement <2 x bfloat> %736, bfloat %715, i64 1
  %738 = bitcast <2 x bfloat> %737 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %729, i32 %732, i32 %735, i32 %738, ptr addrspace(1) %725) #10
  %739 = insertelement <2 x bfloat> poison, bfloat %716, i64 0
  %740 = insertelement <2 x bfloat> %739, bfloat %717, i64 1
  %741 = bitcast <2 x bfloat> %740 to i32
  %742 = insertelement <2 x bfloat> poison, bfloat %718, i64 0
  %743 = insertelement <2 x bfloat> %742, bfloat %719, i64 1
  %744 = bitcast <2 x bfloat> %743 to i32
  %745 = insertelement <2 x bfloat> poison, bfloat %720, i64 0
  %746 = insertelement <2 x bfloat> %745, bfloat %721, i64 1
  %747 = bitcast <2 x bfloat> %746 to i32
  %748 = insertelement <2 x bfloat> poison, bfloat %722, i64 0
  %749 = insertelement <2 x bfloat> %748, bfloat %723, i64 1
  %750 = bitcast <2 x bfloat> %749 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %741, i32 %744, i32 %747, i32 %750, ptr addrspace(1) %726) #10
  ret void
}

define ptx_kernel void @fusion_56(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(32768) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6, ptr noalias align 128 dereferenceable(32768) %arg7, ptr noalias align 128 dereferenceable(32768) %arg8) local_unnamed_addr #5 {
  %arg817 = addrspacecast ptr %arg8 to ptr addrspace(1)
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
  %66 = shl nsw i64 %2, 12
  %67 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %66
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
  %120 = getelementptr bfloat, ptr addrspace(1) %arg715, i64 %3
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
  %227 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %3
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
  %280 = getelementptr i8, ptr addrspace(1) %67, i64 4096
  %281 = getelementptr i8, ptr addrspace(1) %68, i64 4096
  %282 = getelementptr bfloat, ptr addrspace(1) %280, i64 %13
  %283 = getelementptr i8, ptr addrspace(1) %282, i64 1024
  %284 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %281) #10
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
  %334 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %3
  %335 = getelementptr bfloat, ptr addrspace(1) %334, i64 %13
  %336 = getelementptr i8, ptr addrspace(1) %335, i64 1024
  %337 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %335) #10
  %338 = extractvalue { i32, i32, i32, i32 } %337, 0
  %339 = bitcast i32 %338 to <2 x bfloat>
  %340 = extractvalue { i32, i32, i32, i32 } %337, 1
  %341 = bitcast i32 %340 to <2 x bfloat>
  %342 = extractvalue { i32, i32, i32, i32 } %337, 2
  %343 = bitcast i32 %342 to <2 x bfloat>
  %344 = extractvalue { i32, i32, i32, i32 } %337, 3
  %345 = bitcast i32 %344 to <2 x bfloat>
  %346 = extractelement <2 x bfloat> %339, i64 0
  %347 = extractelement <2 x bfloat> %339, i64 1
  %348 = extractelement <2 x bfloat> %341, i64 0
  %349 = extractelement <2 x bfloat> %341, i64 1
  %350 = extractelement <2 x bfloat> %343, i64 0
  %351 = extractelement <2 x bfloat> %343, i64 1
  %352 = extractelement <2 x bfloat> %345, i64 0
  %353 = extractelement <2 x bfloat> %345, i64 1
  %354 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %336) #10
  %355 = extractvalue { i32, i32, i32, i32 } %354, 0
  %356 = bitcast i32 %355 to <2 x bfloat>
  %357 = extractvalue { i32, i32, i32, i32 } %354, 1
  %358 = bitcast i32 %357 to <2 x bfloat>
  %359 = extractvalue { i32, i32, i32, i32 } %354, 2
  %360 = bitcast i32 %359 to <2 x bfloat>
  %361 = extractvalue { i32, i32, i32, i32 } %354, 3
  %362 = bitcast i32 %361 to <2 x bfloat>
  %363 = extractelement <2 x bfloat> %356, i64 0
  %364 = extractelement <2 x bfloat> %356, i64 1
  %365 = extractelement <2 x bfloat> %358, i64 0
  %366 = extractelement <2 x bfloat> %358, i64 1
  %367 = extractelement <2 x bfloat> %360, i64 0
  %368 = extractelement <2 x bfloat> %360, i64 1
  %369 = extractelement <2 x bfloat> %362, i64 0
  %370 = extractelement <2 x bfloat> %362, i64 1
  %371 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %346) #10
  %372 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %347) #10
  %373 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %348) #10
  %374 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %349) #10
  %375 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %350) #10
  %376 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %351) #10
  %377 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %352) #10
  %378 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %353) #10
  %379 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %363) #10
  %380 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %364) #10
  %381 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %365) #10
  %382 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %366) #10
  %383 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %367) #10
  %384 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %368) #10
  %385 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %369) #10
  %386 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %370) #10
  %387 = getelementptr i8, ptr addrspace(1) %67, i64 6144
  %388 = getelementptr i8, ptr addrspace(1) %68, i64 6144
  %389 = getelementptr bfloat, ptr addrspace(1) %387, i64 %13
  %390 = getelementptr i8, ptr addrspace(1) %389, i64 1024
  %391 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %388) #10
  %392 = extractvalue { i32, i32, i32, i32 } %391, 0
  %393 = bitcast i32 %392 to <2 x bfloat>
  %394 = extractvalue { i32, i32, i32, i32 } %391, 1
  %395 = bitcast i32 %394 to <2 x bfloat>
  %396 = extractvalue { i32, i32, i32, i32 } %391, 2
  %397 = bitcast i32 %396 to <2 x bfloat>
  %398 = extractvalue { i32, i32, i32, i32 } %391, 3
  %399 = bitcast i32 %398 to <2 x bfloat>
  %400 = extractelement <2 x bfloat> %393, i64 0
  %401 = extractelement <2 x bfloat> %393, i64 1
  %402 = extractelement <2 x bfloat> %395, i64 0
  %403 = extractelement <2 x bfloat> %395, i64 1
  %404 = extractelement <2 x bfloat> %397, i64 0
  %405 = extractelement <2 x bfloat> %397, i64 1
  %406 = extractelement <2 x bfloat> %399, i64 0
  %407 = extractelement <2 x bfloat> %399, i64 1
  %408 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %390) #10
  %409 = extractvalue { i32, i32, i32, i32 } %408, 0
  %410 = bitcast i32 %409 to <2 x bfloat>
  %411 = extractvalue { i32, i32, i32, i32 } %408, 1
  %412 = bitcast i32 %411 to <2 x bfloat>
  %413 = extractvalue { i32, i32, i32, i32 } %408, 2
  %414 = bitcast i32 %413 to <2 x bfloat>
  %415 = extractvalue { i32, i32, i32, i32 } %408, 3
  %416 = bitcast i32 %415 to <2 x bfloat>
  %417 = extractelement <2 x bfloat> %410, i64 0
  %418 = extractelement <2 x bfloat> %410, i64 1
  %419 = extractelement <2 x bfloat> %412, i64 0
  %420 = extractelement <2 x bfloat> %412, i64 1
  %421 = extractelement <2 x bfloat> %414, i64 0
  %422 = extractelement <2 x bfloat> %414, i64 1
  %423 = extractelement <2 x bfloat> %416, i64 0
  %424 = extractelement <2 x bfloat> %416, i64 1
  %425 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %400) #10
  %426 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %401) #10
  %427 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %402) #10
  %428 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %403) #10
  %429 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %404) #10
  %430 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %405) #10
  %431 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %406) #10
  %432 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %407) #10
  %433 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %417) #10
  %434 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %418) #10
  %435 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %419) #10
  %436 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %420) #10
  %437 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %421) #10
  %438 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %422) #10
  %439 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %423) #10
  %440 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %424) #10
  %441 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %3
  %442 = getelementptr bfloat, ptr addrspace(1) %441, i64 %13
  %443 = getelementptr i8, ptr addrspace(1) %442, i64 1024
  %444 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %442) #10
  %445 = extractvalue { i32, i32, i32, i32 } %444, 0
  %446 = bitcast i32 %445 to <2 x bfloat>
  %447 = extractvalue { i32, i32, i32, i32 } %444, 1
  %448 = bitcast i32 %447 to <2 x bfloat>
  %449 = extractvalue { i32, i32, i32, i32 } %444, 2
  %450 = bitcast i32 %449 to <2 x bfloat>
  %451 = extractvalue { i32, i32, i32, i32 } %444, 3
  %452 = bitcast i32 %451 to <2 x bfloat>
  %453 = extractelement <2 x bfloat> %446, i64 0
  %454 = extractelement <2 x bfloat> %446, i64 1
  %455 = extractelement <2 x bfloat> %448, i64 0
  %456 = extractelement <2 x bfloat> %448, i64 1
  %457 = extractelement <2 x bfloat> %450, i64 0
  %458 = extractelement <2 x bfloat> %450, i64 1
  %459 = extractelement <2 x bfloat> %452, i64 0
  %460 = extractelement <2 x bfloat> %452, i64 1
  %461 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %443) #10
  %462 = extractvalue { i32, i32, i32, i32 } %461, 0
  %463 = bitcast i32 %462 to <2 x bfloat>
  %464 = extractvalue { i32, i32, i32, i32 } %461, 1
  %465 = bitcast i32 %464 to <2 x bfloat>
  %466 = extractvalue { i32, i32, i32, i32 } %461, 2
  %467 = bitcast i32 %466 to <2 x bfloat>
  %468 = extractvalue { i32, i32, i32, i32 } %461, 3
  %469 = bitcast i32 %468 to <2 x bfloat>
  %470 = extractelement <2 x bfloat> %463, i64 0
  %471 = extractelement <2 x bfloat> %463, i64 1
  %472 = extractelement <2 x bfloat> %465, i64 0
  %473 = extractelement <2 x bfloat> %465, i64 1
  %474 = extractelement <2 x bfloat> %467, i64 0
  %475 = extractelement <2 x bfloat> %467, i64 1
  %476 = extractelement <2 x bfloat> %469, i64 0
  %477 = extractelement <2 x bfloat> %469, i64 1
  %478 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %453) #10
  %479 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %454) #10
  %480 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %455) #10
  %481 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %456) #10
  %482 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %457) #10
  %483 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %458) #10
  %484 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %459) #10
  %485 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %460) #10
  %486 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %470) #10
  %487 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %471) #10
  %488 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %472) #10
  %489 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %473) #10
  %490 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %474) #10
  %491 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %475) #10
  %492 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %476) #10
  %493 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %477) #10
  %494 = fadd float %425, %478
  %495 = fadd float %426, %479
  %496 = fadd float %427, %480
  %497 = fadd float %428, %481
  %498 = fadd float %429, %482
  %499 = fadd float %430, %483
  %500 = fadd float %431, %484
  %501 = fadd float %432, %485
  %502 = fadd float %433, %486
  %503 = fadd float %434, %487
  %504 = fadd float %435, %488
  %505 = fadd float %436, %489
  %506 = fadd float %437, %490
  %507 = fadd float %438, %491
  %508 = fadd float %439, %492
  %509 = fadd float %440, %493
  %510 = fadd float %371, %494
  %511 = fadd float %372, %495
  %512 = fadd float %373, %496
  %513 = fadd float %374, %497
  %514 = fadd float %375, %498
  %515 = fadd float %376, %499
  %516 = fadd float %377, %500
  %517 = fadd float %378, %501
  %518 = fadd float %379, %502
  %519 = fadd float %380, %503
  %520 = fadd float %381, %504
  %521 = fadd float %382, %505
  %522 = fadd float %383, %506
  %523 = fadd float %384, %507
  %524 = fadd float %385, %508
  %525 = fadd float %386, %509
  %526 = fadd float %318, %510
  %527 = fadd float %319, %511
  %528 = fadd float %320, %512
  %529 = fadd float %321, %513
  %530 = fadd float %322, %514
  %531 = fadd float %323, %515
  %532 = fadd float %324, %516
  %533 = fadd float %325, %517
  %534 = fadd float %326, %518
  %535 = fadd float %327, %519
  %536 = fadd float %328, %520
  %537 = fadd float %329, %521
  %538 = fadd float %330, %522
  %539 = fadd float %331, %523
  %540 = fadd float %332, %524
  %541 = fadd float %333, %525
  %542 = fadd float %264, %526
  %543 = fadd float %265, %527
  %544 = fadd float %266, %528
  %545 = fadd float %267, %529
  %546 = fadd float %268, %530
  %547 = fadd float %269, %531
  %548 = fadd float %270, %532
  %549 = fadd float %271, %533
  %550 = fadd float %272, %534
  %551 = fadd float %273, %535
  %552 = fadd float %274, %536
  %553 = fadd float %275, %537
  %554 = fadd float %276, %538
  %555 = fadd float %277, %539
  %556 = fadd float %278, %540
  %557 = fadd float %279, %541
  %558 = fadd float %211, %542
  %559 = fadd float %212, %543
  %560 = fadd float %213, %544
  %561 = fadd float %214, %545
  %562 = fadd float %215, %546
  %563 = fadd float %216, %547
  %564 = fadd float %217, %548
  %565 = fadd float %218, %549
  %566 = fadd float %219, %550
  %567 = fadd float %220, %551
  %568 = fadd float %221, %552
  %569 = fadd float %222, %553
  %570 = fadd float %223, %554
  %571 = fadd float %224, %555
  %572 = fadd float %225, %556
  %573 = fadd float %226, %557
  %574 = fadd float %157, %558
  %575 = fadd float %158, %559
  %576 = fadd float %159, %560
  %577 = fadd float %160, %561
  %578 = fadd float %161, %562
  %579 = fadd float %162, %563
  %580 = fadd float %163, %564
  %581 = fadd float %164, %565
  %582 = fadd float %165, %566
  %583 = fadd float %166, %567
  %584 = fadd float %167, %568
  %585 = fadd float %168, %569
  %586 = fadd float %169, %570
  %587 = fadd float %170, %571
  %588 = fadd float %171, %572
  %589 = fadd float %172, %573
  %590 = fadd float %104, %574
  %591 = fadd float %105, %575
  %592 = fadd float %106, %576
  %593 = fadd float %107, %577
  %594 = fadd float %108, %578
  %595 = fadd float %109, %579
  %596 = fadd float %110, %580
  %597 = fadd float %111, %581
  %598 = fadd float %112, %582
  %599 = fadd float %113, %583
  %600 = fadd float %114, %584
  %601 = fadd float %115, %585
  %602 = fadd float %116, %586
  %603 = fadd float %117, %587
  %604 = fadd float %118, %588
  %605 = fadd float %119, %589
  %606 = fadd float %50, %590
  %607 = fadd float %51, %591
  %608 = fadd float %52, %592
  %609 = fadd float %53, %593
  %610 = fadd float %54, %594
  %611 = fadd float %55, %595
  %612 = fadd float %56, %596
  %613 = fadd float %57, %597
  %614 = fadd float %58, %598
  %615 = fadd float %59, %599
  %616 = fadd float %60, %600
  %617 = fadd float %61, %601
  %618 = fadd float %62, %602
  %619 = fadd float %63, %603
  %620 = fadd float %64, %604
  %621 = fadd float %65, %605
  %622 = fmul float %606, %606
  %623 = fmul float %607, %607
  %624 = fmul float %608, %608
  %625 = fmul float %609, %609
  %626 = fmul float %610, %610
  %627 = fmul float %611, %611
  %628 = fmul float %612, %612
  %629 = fmul float %613, %613
  %630 = fmul float %614, %614
  %631 = fmul float %615, %615
  %632 = fmul float %616, %616
  %633 = fmul float %617, %617
  %634 = fmul float %618, %618
  %635 = fmul float %619, %619
  %636 = fmul float %620, %620
  %637 = fmul float %621, %621
  %638 = fadd float %622, %623
  %639 = fadd float %638, %624
  %640 = fadd float %639, %625
  %641 = fadd float %640, %626
  %642 = fadd float %641, %627
  %643 = fadd float %642, %628
  %644 = fadd float %643, %629
  %645 = fadd float %644, %630
  %646 = fadd float %645, %631
  %647 = fadd float %646, %632
  %648 = fadd float %647, %633
  %649 = fadd float %648, %634
  %650 = fadd float %649, %635
  %651 = fadd float %650, %636
  %652 = fadd float %651, %637
  %653 = bitcast float %652 to i32
  %654 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %653, i32 16, i32 31)
  %655 = bitcast i32 %654 to float
  %656 = fadd float %652, %655
  %657 = bitcast float %656 to i32
  %658 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %657, i32 8, i32 31)
  %659 = bitcast i32 %658 to float
  %660 = fadd float %656, %659
  %661 = bitcast float %660 to i32
  %662 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %661, i32 4, i32 31)
  %663 = bitcast i32 %662 to float
  %664 = fadd float %660, %663
  %665 = bitcast float %664 to i32
  %666 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %665, i32 2, i32 31)
  %667 = bitcast i32 %666 to float
  %668 = fadd float %664, %667
  %669 = bitcast float %668 to i32
  %670 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %669, i32 1, i32 31)
  %671 = bitcast i32 %670 to float
  %672 = fadd float %668, %671
  %673 = icmp eq i32 %6, 0
  %674 = zext nneg i32 %7 to i64
  %675 = getelementptr float, ptr addrspace(3) @global_smem, i64 %674
  %676 = bitcast float %672 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %675, <1 x i32> %676, i1 %673) #10
  tail call void @llvm.nvvm.barrier0()
  %677 = icmp samesign ult i32 %5, 2
  %678 = zext nneg i32 %5 to i64
  %679 = getelementptr float, ptr addrspace(3) @global_smem, i64 %678
  %680 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %679, i1 %677) #10
  %681 = bitcast i32 %680 to float
  %682 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %680, i32 1, i32 31)
  %683 = bitcast i32 %682 to float
  %684 = fadd float %681, %683
  %685 = icmp eq i32 %5, 0
  %686 = bitcast float %684 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %679, <1 x i32> %686, i1 %685) #10
  tail call void @llvm.nvvm.barrier0()
  %687 = load float, ptr addrspace(3) @global_smem, align 16
  %688 = fmul float %687, 0x3F50000000000000
  %689 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
  %690 = bitcast i32 %689 to float
  %691 = fadd float %688, %690
  %692 = tail call float @llvm.nvvm.rsqrt.approx.f(float %691)
  %693 = fmul float %606, %692
  %694 = fmul float %607, %692
  %695 = fmul float %608, %692
  %696 = fmul float %609, %692
  %697 = fmul float %610, %692
  %698 = fmul float %611, %692
  %699 = fmul float %612, %692
  %700 = fmul float %613, %692
  %701 = fmul float %614, %692
  %702 = fmul float %615, %692
  %703 = fmul float %616, %692
  %704 = fmul float %617, %692
  %705 = fmul float %618, %692
  %706 = fmul float %619, %692
  %707 = fmul float %620, %692
  %708 = fmul float %621, %692
  %709 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %13
  %710 = getelementptr i8, ptr addrspace(1) %709, i64 1024
  %711 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %709) #10
  %712 = extractvalue { i32, i32, i32, i32 } %711, 0
  %713 = bitcast i32 %712 to <2 x bfloat>
  %714 = extractvalue { i32, i32, i32, i32 } %711, 1
  %715 = bitcast i32 %714 to <2 x bfloat>
  %716 = extractvalue { i32, i32, i32, i32 } %711, 2
  %717 = bitcast i32 %716 to <2 x bfloat>
  %718 = extractvalue { i32, i32, i32, i32 } %711, 3
  %719 = bitcast i32 %718 to <2 x bfloat>
  %720 = extractelement <2 x bfloat> %713, i64 0
  %721 = extractelement <2 x bfloat> %713, i64 1
  %722 = extractelement <2 x bfloat> %715, i64 0
  %723 = extractelement <2 x bfloat> %715, i64 1
  %724 = extractelement <2 x bfloat> %717, i64 0
  %725 = extractelement <2 x bfloat> %717, i64 1
  %726 = extractelement <2 x bfloat> %719, i64 0
  %727 = extractelement <2 x bfloat> %719, i64 1
  %728 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %710) #10
  %729 = extractvalue { i32, i32, i32, i32 } %728, 0
  %730 = bitcast i32 %729 to <2 x bfloat>
  %731 = extractvalue { i32, i32, i32, i32 } %728, 1
  %732 = bitcast i32 %731 to <2 x bfloat>
  %733 = extractvalue { i32, i32, i32, i32 } %728, 2
  %734 = bitcast i32 %733 to <2 x bfloat>
  %735 = extractvalue { i32, i32, i32, i32 } %728, 3
  %736 = bitcast i32 %735 to <2 x bfloat>
  %737 = extractelement <2 x bfloat> %730, i64 0
  %738 = extractelement <2 x bfloat> %730, i64 1
  %739 = extractelement <2 x bfloat> %732, i64 0
  %740 = extractelement <2 x bfloat> %732, i64 1
  %741 = extractelement <2 x bfloat> %734, i64 0
  %742 = extractelement <2 x bfloat> %734, i64 1
  %743 = extractelement <2 x bfloat> %736, i64 0
  %744 = extractelement <2 x bfloat> %736, i64 1
  %745 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %720) #10
  %746 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %721) #10
  %747 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %722) #10
  %748 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %723) #10
  %749 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %724) #10
  %750 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %725) #10
  %751 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %726) #10
  %752 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %727) #10
  %753 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %737) #10
  %754 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %738) #10
  %755 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %739) #10
  %756 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %740) #10
  %757 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %741) #10
  %758 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %742) #10
  %759 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %743) #10
  %760 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %744) #10
  %761 = fmul float %693, %745
  %762 = fmul float %694, %746
  %763 = fmul float %695, %747
  %764 = fmul float %696, %748
  %765 = fmul float %697, %749
  %766 = fmul float %698, %750
  %767 = fmul float %699, %751
  %768 = fmul float %700, %752
  %769 = fmul float %701, %753
  %770 = fmul float %702, %754
  %771 = fmul float %703, %755
  %772 = fmul float %704, %756
  %773 = fmul float %705, %757
  %774 = fmul float %706, %758
  %775 = fmul float %707, %759
  %776 = fmul float %708, %760
  %777 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %761) #10
  %778 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %762) #10
  %779 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %763) #10
  %780 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %764) #10
  %781 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %765) #10
  %782 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %766) #10
  %783 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %767) #10
  %784 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %768) #10
  %785 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %769) #10
  %786 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %770) #10
  %787 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %771) #10
  %788 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %772) #10
  %789 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %773) #10
  %790 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %774) #10
  %791 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %775) #10
  %792 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %776) #10
  %793 = getelementptr bfloat, ptr addrspace(1) %arg817, i64 %3
  %794 = getelementptr bfloat, ptr addrspace(1) %793, i64 %13
  %795 = getelementptr i8, ptr addrspace(1) %794, i64 1024
  %796 = insertelement <2 x bfloat> poison, bfloat %777, i64 0
  %797 = insertelement <2 x bfloat> %796, bfloat %778, i64 1
  %798 = bitcast <2 x bfloat> %797 to i32
  %799 = insertelement <2 x bfloat> poison, bfloat %779, i64 0
  %800 = insertelement <2 x bfloat> %799, bfloat %780, i64 1
  %801 = bitcast <2 x bfloat> %800 to i32
  %802 = insertelement <2 x bfloat> poison, bfloat %781, i64 0
  %803 = insertelement <2 x bfloat> %802, bfloat %782, i64 1
  %804 = bitcast <2 x bfloat> %803 to i32
  %805 = insertelement <2 x bfloat> poison, bfloat %783, i64 0
  %806 = insertelement <2 x bfloat> %805, bfloat %784, i64 1
  %807 = bitcast <2 x bfloat> %806 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %798, i32 %801, i32 %804, i32 %807, ptr addrspace(1) %794) #10
  %808 = insertelement <2 x bfloat> poison, bfloat %785, i64 0
  %809 = insertelement <2 x bfloat> %808, bfloat %786, i64 1
  %810 = bitcast <2 x bfloat> %809 to i32
  %811 = insertelement <2 x bfloat> poison, bfloat %787, i64 0
  %812 = insertelement <2 x bfloat> %811, bfloat %788, i64 1
  %813 = bitcast <2 x bfloat> %812 to i32
  %814 = insertelement <2 x bfloat> poison, bfloat %789, i64 0
  %815 = insertelement <2 x bfloat> %814, bfloat %790, i64 1
  %816 = bitcast <2 x bfloat> %815 to i32
  %817 = insertelement <2 x bfloat> poison, bfloat %791, i64 0
  %818 = insertelement <2 x bfloat> %817, bfloat %792, i64 1
  %819 = bitcast <2 x bfloat> %818 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %810, i32 %813, i32 %816, i32 %819, ptr addrspace(1) %795) #10
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

define ptx_kernel void @triton_softmax_6_0(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2) local_unnamed_addr #6 {
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
!8 = distinct !{!8, !9, !"fused_convert_3_param_0_165: argument 0"}
!9 = distinct !{!9, !"fused_convert_3_param_0_165"}
!10 = !{!11}
!11 = distinct !{!11, !12, !"fused_convert_3_param_0_165: argument 0"}
!12 = distinct !{!12, !"fused_convert_3_param_0_165"}
!13 = !{i32 0, i32 64}
!14 = !{!15}
!15 = distinct !{!15, !16, !"fused_concatenate_convert_316_17: argument 0"}
!16 = distinct !{!16, !"fused_concatenate_convert_316_17"}
!17 = !{!18}
!18 = distinct !{!18, !16, !"fused_concatenate_convert_316_17: argument 1"}
!19 = !{!20}
!20 = distinct !{!20, !21, !"fused_concatenate_convert_316_17: argument 0"}
!21 = distinct !{!21, !"fused_concatenate_convert_316_17"}
!22 = !{!23}
!23 = distinct !{!23, !21, !"fused_concatenate_convert_316_17: argument 1"}
!24 = !{i32 0, i32 135456}

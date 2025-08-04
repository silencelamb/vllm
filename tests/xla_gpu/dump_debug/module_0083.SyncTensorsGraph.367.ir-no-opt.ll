; ModuleID = 'SyncTensorsGraph.367'
source_filename = "SyncTensorsGraph.367"
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

declare ptx_kernel void @gemm_fusion_dot_11_0_impl(ptr, ptr, ptr, ptr, ptr) #2

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #3

define ptx_kernel void @gemm_fusion_dot_11_0(ptr noalias align 16 dereferenceable(4194304) %arg0, ptr noalias align 16 dereferenceable(4194304) %arg1, ptr noalias align 16 dereferenceable(4194304) %arg2, ptr noalias align 128 dereferenceable(98304) %arg3) #0 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr null to ptr addrspace(1)
  %6 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %7 = sdiv i32 %6, 8
  %8 = mul i32 %7, 8
  %9 = sub i32 48, %8
  %10 = icmp slt i32 %9, 8
  %11 = select i1 %10, i32 %9, i32 8
  %12 = srem i32 %6, %11
  %13 = add i32 %8, %12
  %14 = srem i32 %6, 8
  %15 = sdiv i32 %14, %11
  %16 = mul i32 %13, 64
  %17 = icmp slt i32 %16, 1024
  %18 = select i1 %17, ptr addrspace(1) %1, ptr addrspace(1) %2
  %19 = icmp slt i32 %16, 2048
  %20 = select i1 %19, ptr addrspace(1) %18, ptr addrspace(1) %3
  %21 = add i32 %16, -1024
  %22 = add i32 %16, -2048
  %23 = select i1 %17, i32 %16, i32 %21
  %24 = select i1 %19, i32 %23, i32 %22
  %25 = sext i32 %24 to i64
  %26 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %27 = urem i32 %26, 32
  %28 = udiv i32 %26, 32
  %29 = and i32 %27, 16
  %30 = icmp eq i32 %29, 0
  %31 = select i1 %30, i32 0, i32 1
  %32 = xor i32 0, %31
  %33 = and i32 %28, 1
  %34 = icmp eq i32 %33, 0
  %35 = select i1 %34, i32 0, i32 2
  %36 = xor i32 %32, %35
  %37 = and i32 %28, 2
  %38 = icmp eq i32 %37, 0
  %39 = select i1 %38, i32 0, i32 4
  %40 = xor i32 %36, %39
  %41 = xor i32 %40, 0
  %42 = xor i32 %40, 8
  %43 = xor i32 %40, 16
  %44 = xor i32 %40, 24
  %45 = xor i32 %40, 32
  %46 = xor i32 %40, 40
  %47 = xor i32 %40, 48
  %48 = xor i32 %40, 56
  %49 = add i32 %41, 0
  %50 = add i32 %42, 0
  %51 = add i32 %43, 0
  %52 = add i32 %44, 0
  %53 = add i32 %45, 0
  %54 = add i32 %46, 0
  %55 = add i32 %47, 0
  %56 = add i32 %48, 0
  %57 = sext i32 %49 to i64
  %58 = sext i32 %50 to i64
  %59 = sext i32 %51 to i64
  %60 = sext i32 %52 to i64
  %61 = sext i32 %53 to i64
  %62 = sext i32 %54 to i64
  %63 = sext i32 %55 to i64
  %64 = sext i32 %56 to i64
  %65 = add i64 %25, %57
  %66 = add i64 %25, %58
  %67 = add i64 %25, %59
  %68 = add i64 %25, %60
  %69 = add i64 %25, %61
  %70 = add i64 %25, %62
  %71 = add i64 %25, %63
  %72 = add i64 %25, %64
  %73 = mul i64 %65, 2048
  %74 = mul i64 %66, 2048
  %75 = mul i64 %67, 2048
  %76 = mul i64 %68, 2048
  %77 = mul i64 %69, 2048
  %78 = mul i64 %70, 2048
  %79 = mul i64 %71, 2048
  %80 = mul i64 %72, 2048
  %81 = and i32 %27, 1
  %82 = icmp eq i32 %81, 0
  %83 = select i1 %82, i32 0, i32 8
  %84 = xor i32 0, %83
  %85 = and i32 %27, 2
  %86 = icmp eq i32 %85, 0
  %87 = select i1 %86, i32 0, i32 16
  %88 = xor i32 %84, %87
  %89 = and i32 %27, 4
  %90 = icmp eq i32 %89, 0
  %91 = select i1 %90, i32 0, i32 32
  %92 = xor i32 %88, %91
  %93 = and i32 %27, 8
  %94 = icmp eq i32 %93, 0
  %95 = select i1 %94, i32 0, i32 64
  %96 = xor i32 %92, %95
  %97 = xor i32 %96, 0
  %98 = add i32 %97, 0
  %99 = sext i32 %98 to i64
  %100 = add i64 %73, %99
  %101 = add i64 %74, %99
  %102 = add i64 %75, %99
  %103 = add i64 %76, %99
  %104 = add i64 %77, %99
  %105 = add i64 %78, %99
  %106 = add i64 %79, %99
  %107 = add i64 %80, %99
  %108 = getelementptr bfloat, ptr addrspace(1) %20, i64 %100
  %109 = getelementptr bfloat, ptr addrspace(1) %20, i64 %101
  %110 = getelementptr bfloat, ptr addrspace(1) %20, i64 %102
  %111 = getelementptr bfloat, ptr addrspace(1) %20, i64 %103
  %112 = getelementptr bfloat, ptr addrspace(1) %20, i64 %104
  %113 = getelementptr bfloat, ptr addrspace(1) %20, i64 %105
  %114 = getelementptr bfloat, ptr addrspace(1) %20, i64 %106
  %115 = getelementptr bfloat, ptr addrspace(1) %20, i64 %107
  %116 = select i1 %30, i32 0, i32 136
  %117 = xor i32 %96, %116
  %118 = select i1 %34, i32 0, i32 272
  %119 = xor i32 %117, %118
  %120 = select i1 %38, i32 0, i32 544
  %121 = xor i32 %119, %120
  %122 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %121
  %123 = xor i32 1024, %83
  %124 = xor i32 %123, %87
  %125 = xor i32 %124, %91
  %126 = xor i32 %125, %95
  %127 = xor i32 %126, %116
  %128 = xor i32 %127, %118
  %129 = xor i32 %128, %120
  %130 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %129
  %131 = xor i32 2048, %83
  %132 = xor i32 %131, %87
  %133 = xor i32 %132, %91
  %134 = xor i32 %133, %95
  %135 = xor i32 %134, %116
  %136 = xor i32 %135, %118
  %137 = xor i32 %136, %120
  %138 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %137
  %139 = xor i32 3072, %83
  %140 = xor i32 %139, %87
  %141 = xor i32 %140, %91
  %142 = xor i32 %141, %95
  %143 = xor i32 %142, %116
  %144 = xor i32 %143, %118
  %145 = xor i32 %144, %120
  %146 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %145
  %147 = xor i32 4096, %83
  %148 = xor i32 %147, %87
  %149 = xor i32 %148, %91
  %150 = xor i32 %149, %95
  %151 = xor i32 %150, %116
  %152 = xor i32 %151, %118
  %153 = xor i32 %152, %120
  %154 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %153
  %155 = xor i32 5120, %83
  %156 = xor i32 %155, %87
  %157 = xor i32 %156, %91
  %158 = xor i32 %157, %95
  %159 = xor i32 %158, %116
  %160 = xor i32 %159, %118
  %161 = xor i32 %160, %120
  %162 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %161
  %163 = xor i32 6144, %83
  %164 = xor i32 %163, %87
  %165 = xor i32 %164, %91
  %166 = xor i32 %165, %95
  %167 = xor i32 %166, %116
  %168 = xor i32 %167, %118
  %169 = xor i32 %168, %120
  %170 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %169
  %171 = xor i32 7168, %83
  %172 = xor i32 %171, %87
  %173 = xor i32 %172, %91
  %174 = xor i32 %173, %95
  %175 = xor i32 %174, %116
  %176 = xor i32 %175, %118
  %177 = xor i32 %176, %120
  %178 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %177
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %122, ptr addrspace(1) %108, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %130, ptr addrspace(1) %109, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %138, ptr addrspace(1) %110, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %146, ptr addrspace(1) %111, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %154, ptr addrspace(1) %112, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %162, ptr addrspace(1) %113, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %170, ptr addrspace(1) %114, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %178, ptr addrspace(1) %115, i32 16)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  %179 = add i64 %99, 128
  %180 = add i64 %73, %179
  %181 = add i64 %74, %179
  %182 = add i64 %75, %179
  %183 = add i64 %76, %179
  %184 = add i64 %77, %179
  %185 = add i64 %78, %179
  %186 = add i64 %79, %179
  %187 = add i64 %80, %179
  %188 = getelementptr bfloat, ptr addrspace(1) %20, i64 %180
  %189 = getelementptr bfloat, ptr addrspace(1) %20, i64 %181
  %190 = getelementptr bfloat, ptr addrspace(1) %20, i64 %182
  %191 = getelementptr bfloat, ptr addrspace(1) %20, i64 %183
  %192 = getelementptr bfloat, ptr addrspace(1) %20, i64 %184
  %193 = getelementptr bfloat, ptr addrspace(1) %20, i64 %185
  %194 = getelementptr bfloat, ptr addrspace(1) %20, i64 %186
  %195 = getelementptr bfloat, ptr addrspace(1) %20, i64 %187
  call void @llvm.nvvm.barrier0()
  %196 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i32 %121
  %197 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i32 %129
  %198 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i32 %137
  %199 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i32 %145
  %200 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i32 %153
  %201 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i32 %161
  %202 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i32 %169
  %203 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i32 %177
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %196, ptr addrspace(1) %188, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %197, ptr addrspace(1) %189, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %198, ptr addrspace(1) %190, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %199, ptr addrspace(1) %191, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %200, ptr addrspace(1) %192, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %201, ptr addrspace(1) %193, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %202, ptr addrspace(1) %194, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %203, ptr addrspace(1) %195, i32 16)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  %204 = add i64 %99, 256
  %205 = add i64 %73, %204
  %206 = add i64 %74, %204
  %207 = add i64 %75, %204
  %208 = add i64 %76, %204
  %209 = add i64 %77, %204
  %210 = add i64 %78, %204
  %211 = add i64 %79, %204
  %212 = add i64 %80, %204
  %213 = getelementptr bfloat, ptr addrspace(1) %20, i64 %205
  %214 = getelementptr bfloat, ptr addrspace(1) %20, i64 %206
  %215 = getelementptr bfloat, ptr addrspace(1) %20, i64 %207
  %216 = getelementptr bfloat, ptr addrspace(1) %20, i64 %208
  %217 = getelementptr bfloat, ptr addrspace(1) %20, i64 %209
  %218 = getelementptr bfloat, ptr addrspace(1) %20, i64 %210
  %219 = getelementptr bfloat, ptr addrspace(1) %20, i64 %211
  %220 = getelementptr bfloat, ptr addrspace(1) %20, i64 %212
  call void @llvm.nvvm.barrier0()
  %221 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %121
  %222 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %129
  %223 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %137
  %224 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %145
  %225 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %153
  %226 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %161
  %227 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %169
  %228 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %177
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %221, ptr addrspace(1) %213, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %222, ptr addrspace(1) %214, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %223, ptr addrspace(1) %215, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %224, ptr addrspace(1) %216, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %225, ptr addrspace(1) %217, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %226, ptr addrspace(1) %218, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %227, ptr addrspace(1) %219, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %228, ptr addrspace(1) %220, i32 16)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  call void asm sideeffect "cp.async.wait_group 0x2;", ""()
  call void @llvm.nvvm.barrier0()
  br label %229

229:                                              ; preds = %237, %0
  %230 = phi i32 [ %693, %237 ], [ 0, %0 ]
  %231 = phi i64 [ %647, %237 ], [ 256, %0 ]
  %232 = phi { float, float, float, float, float, float, float, float } [ %646, %237 ], [ zeroinitializer, %0 ]
  %233 = phi i32 [ %650, %237 ], [ 2, %0 ]
  %234 = phi i32 [ %684, %237 ], [ 0, %0 ]
  %235 = phi { ptr addrspace(3), i32, i32 } [ %692, %237 ], [ { ptr addrspace(3) @global_smem, i32 0, i32 0 }, %0 ]
  %236 = icmp slt i32 %230, 2048
  br i1 %236, label %237, label %694

237:                                              ; preds = %229
  %238 = icmp slt i32 %230, 1664
  %239 = extractvalue { ptr addrspace(3), i32, i32 } %235, 0
  %240 = select i1 %82, i32 0, i32 136
  %241 = xor i32 0, %240
  %242 = select i1 %86, i32 0, i32 272
  %243 = xor i32 %241, %242
  %244 = select i1 %90, i32 0, i32 544
  %245 = xor i32 %243, %244
  %246 = select i1 %94, i32 0, i32 1024
  %247 = xor i32 %245, %246
  %248 = select i1 %30, i32 0, i32 8
  %249 = xor i32 %247, %248
  %250 = select i1 %34, i32 0, i32 2048
  %251 = xor i32 %249, %250
  %252 = select i1 %38, i32 0, i32 4096
  %253 = xor i32 %251, %252
  %254 = getelementptr inbounds bfloat, ptr addrspace(3) %239, i32 %253
  %255 = ptrtoint ptr addrspace(3) %254 to i32
  %256 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %255)
  %257 = extractvalue { i32, i32, i32, i32 } %256, 0
  %258 = extractvalue { i32, i32, i32, i32 } %256, 1
  %259 = extractvalue { i32, i32, i32, i32 } %256, 2
  %260 = extractvalue { i32, i32, i32, i32 } %256, 3
  %261 = xor i32 16, %240
  %262 = xor i32 %261, %242
  %263 = xor i32 %262, %244
  %264 = xor i32 %263, %246
  %265 = xor i32 %264, %248
  %266 = xor i32 %265, %250
  %267 = xor i32 %266, %252
  %268 = getelementptr inbounds bfloat, ptr addrspace(3) %239, i32 %267
  %269 = ptrtoint ptr addrspace(3) %268 to i32
  %270 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %269)
  %271 = extractvalue { i32, i32, i32, i32 } %270, 0
  %272 = extractvalue { i32, i32, i32, i32 } %270, 1
  %273 = extractvalue { i32, i32, i32, i32 } %270, 2
  %274 = extractvalue { i32, i32, i32, i32 } %270, 3
  %275 = xor i32 32, %240
  %276 = xor i32 %275, %242
  %277 = xor i32 %276, %244
  %278 = xor i32 %277, %246
  %279 = xor i32 %278, %248
  %280 = xor i32 %279, %250
  %281 = xor i32 %280, %252
  %282 = getelementptr inbounds bfloat, ptr addrspace(3) %239, i32 %281
  %283 = ptrtoint ptr addrspace(3) %282 to i32
  %284 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %283)
  %285 = extractvalue { i32, i32, i32, i32 } %284, 0
  %286 = extractvalue { i32, i32, i32, i32 } %284, 1
  %287 = extractvalue { i32, i32, i32, i32 } %284, 2
  %288 = extractvalue { i32, i32, i32, i32 } %284, 3
  %289 = xor i32 48, %240
  %290 = xor i32 %289, %242
  %291 = xor i32 %290, %244
  %292 = xor i32 %291, %246
  %293 = xor i32 %292, %248
  %294 = xor i32 %293, %250
  %295 = xor i32 %294, %252
  %296 = getelementptr inbounds bfloat, ptr addrspace(3) %239, i32 %295
  %297 = ptrtoint ptr addrspace(3) %296 to i32
  %298 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %297)
  %299 = extractvalue { i32, i32, i32, i32 } %298, 0
  %300 = extractvalue { i32, i32, i32, i32 } %298, 1
  %301 = extractvalue { i32, i32, i32, i32 } %298, 2
  %302 = extractvalue { i32, i32, i32, i32 } %298, 3
  %303 = xor i32 64, %240
  %304 = xor i32 %303, %242
  %305 = xor i32 %304, %244
  %306 = xor i32 %305, %246
  %307 = xor i32 %306, %248
  %308 = xor i32 %307, %250
  %309 = xor i32 %308, %252
  %310 = getelementptr inbounds bfloat, ptr addrspace(3) %239, i32 %309
  %311 = ptrtoint ptr addrspace(3) %310 to i32
  %312 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %311)
  %313 = extractvalue { i32, i32, i32, i32 } %312, 0
  %314 = extractvalue { i32, i32, i32, i32 } %312, 1
  %315 = extractvalue { i32, i32, i32, i32 } %312, 2
  %316 = extractvalue { i32, i32, i32, i32 } %312, 3
  %317 = xor i32 80, %240
  %318 = xor i32 %317, %242
  %319 = xor i32 %318, %244
  %320 = xor i32 %319, %246
  %321 = xor i32 %320, %248
  %322 = xor i32 %321, %250
  %323 = xor i32 %322, %252
  %324 = getelementptr inbounds bfloat, ptr addrspace(3) %239, i32 %323
  %325 = ptrtoint ptr addrspace(3) %324 to i32
  %326 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %325)
  %327 = extractvalue { i32, i32, i32, i32 } %326, 0
  %328 = extractvalue { i32, i32, i32, i32 } %326, 1
  %329 = extractvalue { i32, i32, i32, i32 } %326, 2
  %330 = extractvalue { i32, i32, i32, i32 } %326, 3
  %331 = xor i32 96, %240
  %332 = xor i32 %331, %242
  %333 = xor i32 %332, %244
  %334 = xor i32 %333, %246
  %335 = xor i32 %334, %248
  %336 = xor i32 %335, %250
  %337 = xor i32 %336, %252
  %338 = getelementptr inbounds bfloat, ptr addrspace(3) %239, i32 %337
  %339 = ptrtoint ptr addrspace(3) %338 to i32
  %340 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %339)
  %341 = extractvalue { i32, i32, i32, i32 } %340, 0
  %342 = extractvalue { i32, i32, i32, i32 } %340, 1
  %343 = extractvalue { i32, i32, i32, i32 } %340, 2
  %344 = extractvalue { i32, i32, i32, i32 } %340, 3
  %345 = xor i32 112, %240
  %346 = xor i32 %345, %242
  %347 = xor i32 %346, %244
  %348 = xor i32 %347, %246
  %349 = xor i32 %348, %248
  %350 = xor i32 %349, %250
  %351 = xor i32 %350, %252
  %352 = getelementptr inbounds bfloat, ptr addrspace(3) %239, i32 %351
  %353 = ptrtoint ptr addrspace(3) %352 to i32
  %354 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %353)
  %355 = extractvalue { i32, i32, i32, i32 } %354, 0
  %356 = extractvalue { i32, i32, i32, i32 } %354, 1
  %357 = extractvalue { i32, i32, i32, i32 } %354, 2
  %358 = extractvalue { i32, i32, i32, i32 } %354, 3
  %359 = bitcast i32 %257 to <2 x bfloat>
  %360 = extractelement <2 x bfloat> %359, i32 0
  %361 = extractelement <2 x bfloat> %359, i32 1
  %362 = bitcast i32 %258 to <2 x bfloat>
  %363 = extractelement <2 x bfloat> %362, i32 0
  %364 = extractelement <2 x bfloat> %362, i32 1
  %365 = bitcast i32 %259 to <2 x bfloat>
  %366 = extractelement <2 x bfloat> %365, i32 0
  %367 = extractelement <2 x bfloat> %365, i32 1
  %368 = bitcast i32 %260 to <2 x bfloat>
  %369 = extractelement <2 x bfloat> %368, i32 0
  %370 = extractelement <2 x bfloat> %368, i32 1
  %371 = bitcast i32 %271 to <2 x bfloat>
  %372 = extractelement <2 x bfloat> %371, i32 0
  %373 = extractelement <2 x bfloat> %371, i32 1
  %374 = bitcast i32 %272 to <2 x bfloat>
  %375 = extractelement <2 x bfloat> %374, i32 0
  %376 = extractelement <2 x bfloat> %374, i32 1
  %377 = bitcast i32 %273 to <2 x bfloat>
  %378 = extractelement <2 x bfloat> %377, i32 0
  %379 = extractelement <2 x bfloat> %377, i32 1
  %380 = bitcast i32 %274 to <2 x bfloat>
  %381 = extractelement <2 x bfloat> %380, i32 0
  %382 = extractelement <2 x bfloat> %380, i32 1
  %383 = bitcast i32 %285 to <2 x bfloat>
  %384 = extractelement <2 x bfloat> %383, i32 0
  %385 = extractelement <2 x bfloat> %383, i32 1
  %386 = bitcast i32 %286 to <2 x bfloat>
  %387 = extractelement <2 x bfloat> %386, i32 0
  %388 = extractelement <2 x bfloat> %386, i32 1
  %389 = bitcast i32 %287 to <2 x bfloat>
  %390 = extractelement <2 x bfloat> %389, i32 0
  %391 = extractelement <2 x bfloat> %389, i32 1
  %392 = bitcast i32 %288 to <2 x bfloat>
  %393 = extractelement <2 x bfloat> %392, i32 0
  %394 = extractelement <2 x bfloat> %392, i32 1
  %395 = bitcast i32 %299 to <2 x bfloat>
  %396 = extractelement <2 x bfloat> %395, i32 0
  %397 = extractelement <2 x bfloat> %395, i32 1
  %398 = bitcast i32 %300 to <2 x bfloat>
  %399 = extractelement <2 x bfloat> %398, i32 0
  %400 = extractelement <2 x bfloat> %398, i32 1
  %401 = bitcast i32 %301 to <2 x bfloat>
  %402 = extractelement <2 x bfloat> %401, i32 0
  %403 = extractelement <2 x bfloat> %401, i32 1
  %404 = bitcast i32 %302 to <2 x bfloat>
  %405 = extractelement <2 x bfloat> %404, i32 0
  %406 = extractelement <2 x bfloat> %404, i32 1
  %407 = bitcast i32 %313 to <2 x bfloat>
  %408 = extractelement <2 x bfloat> %407, i32 0
  %409 = extractelement <2 x bfloat> %407, i32 1
  %410 = bitcast i32 %314 to <2 x bfloat>
  %411 = extractelement <2 x bfloat> %410, i32 0
  %412 = extractelement <2 x bfloat> %410, i32 1
  %413 = bitcast i32 %315 to <2 x bfloat>
  %414 = extractelement <2 x bfloat> %413, i32 0
  %415 = extractelement <2 x bfloat> %413, i32 1
  %416 = bitcast i32 %316 to <2 x bfloat>
  %417 = extractelement <2 x bfloat> %416, i32 0
  %418 = extractelement <2 x bfloat> %416, i32 1
  %419 = bitcast i32 %327 to <2 x bfloat>
  %420 = extractelement <2 x bfloat> %419, i32 0
  %421 = extractelement <2 x bfloat> %419, i32 1
  %422 = bitcast i32 %328 to <2 x bfloat>
  %423 = extractelement <2 x bfloat> %422, i32 0
  %424 = extractelement <2 x bfloat> %422, i32 1
  %425 = bitcast i32 %329 to <2 x bfloat>
  %426 = extractelement <2 x bfloat> %425, i32 0
  %427 = extractelement <2 x bfloat> %425, i32 1
  %428 = bitcast i32 %330 to <2 x bfloat>
  %429 = extractelement <2 x bfloat> %428, i32 0
  %430 = extractelement <2 x bfloat> %428, i32 1
  %431 = bitcast i32 %341 to <2 x bfloat>
  %432 = extractelement <2 x bfloat> %431, i32 0
  %433 = extractelement <2 x bfloat> %431, i32 1
  %434 = bitcast i32 %342 to <2 x bfloat>
  %435 = extractelement <2 x bfloat> %434, i32 0
  %436 = extractelement <2 x bfloat> %434, i32 1
  %437 = bitcast i32 %343 to <2 x bfloat>
  %438 = extractelement <2 x bfloat> %437, i32 0
  %439 = extractelement <2 x bfloat> %437, i32 1
  %440 = bitcast i32 %344 to <2 x bfloat>
  %441 = extractelement <2 x bfloat> %440, i32 0
  %442 = extractelement <2 x bfloat> %440, i32 1
  %443 = bitcast i32 %355 to <2 x bfloat>
  %444 = extractelement <2 x bfloat> %443, i32 0
  %445 = extractelement <2 x bfloat> %443, i32 1
  %446 = bitcast i32 %356 to <2 x bfloat>
  %447 = extractelement <2 x bfloat> %446, i32 0
  %448 = extractelement <2 x bfloat> %446, i32 1
  %449 = bitcast i32 %357 to <2 x bfloat>
  %450 = extractelement <2 x bfloat> %449, i32 0
  %451 = extractelement <2 x bfloat> %449, i32 1
  %452 = bitcast i32 %358 to <2 x bfloat>
  %453 = extractelement <2 x bfloat> %452, i32 0
  %454 = extractelement <2 x bfloat> %452, i32 1
  %455 = insertelement <2 x bfloat> undef, bfloat %360, i32 0
  %456 = insertelement <2 x bfloat> %455, bfloat %361, i32 1
  %457 = bitcast <2 x bfloat> %456 to i32
  %458 = insertelement <2 x bfloat> undef, bfloat %363, i32 0
  %459 = insertelement <2 x bfloat> %458, bfloat %364, i32 1
  %460 = bitcast <2 x bfloat> %459 to i32
  %461 = insertelement <2 x bfloat> undef, bfloat %366, i32 0
  %462 = insertelement <2 x bfloat> %461, bfloat %367, i32 1
  %463 = bitcast <2 x bfloat> %462 to i32
  %464 = insertelement <2 x bfloat> undef, bfloat %369, i32 0
  %465 = insertelement <2 x bfloat> %464, bfloat %370, i32 1
  %466 = bitcast <2 x bfloat> %465 to i32
  %467 = insertelement <2 x bfloat> undef, bfloat %372, i32 0
  %468 = insertelement <2 x bfloat> %467, bfloat %373, i32 1
  %469 = bitcast <2 x bfloat> %468 to i32
  %470 = insertelement <2 x bfloat> undef, bfloat %375, i32 0
  %471 = insertelement <2 x bfloat> %470, bfloat %376, i32 1
  %472 = bitcast <2 x bfloat> %471 to i32
  %473 = insertelement <2 x bfloat> undef, bfloat %378, i32 0
  %474 = insertelement <2 x bfloat> %473, bfloat %379, i32 1
  %475 = bitcast <2 x bfloat> %474 to i32
  %476 = insertelement <2 x bfloat> undef, bfloat %381, i32 0
  %477 = insertelement <2 x bfloat> %476, bfloat %382, i32 1
  %478 = bitcast <2 x bfloat> %477 to i32
  %479 = insertelement <2 x bfloat> undef, bfloat %384, i32 0
  %480 = insertelement <2 x bfloat> %479, bfloat %385, i32 1
  %481 = bitcast <2 x bfloat> %480 to i32
  %482 = insertelement <2 x bfloat> undef, bfloat %387, i32 0
  %483 = insertelement <2 x bfloat> %482, bfloat %388, i32 1
  %484 = bitcast <2 x bfloat> %483 to i32
  %485 = insertelement <2 x bfloat> undef, bfloat %390, i32 0
  %486 = insertelement <2 x bfloat> %485, bfloat %391, i32 1
  %487 = bitcast <2 x bfloat> %486 to i32
  %488 = insertelement <2 x bfloat> undef, bfloat %393, i32 0
  %489 = insertelement <2 x bfloat> %488, bfloat %394, i32 1
  %490 = bitcast <2 x bfloat> %489 to i32
  %491 = insertelement <2 x bfloat> undef, bfloat %396, i32 0
  %492 = insertelement <2 x bfloat> %491, bfloat %397, i32 1
  %493 = bitcast <2 x bfloat> %492 to i32
  %494 = insertelement <2 x bfloat> undef, bfloat %399, i32 0
  %495 = insertelement <2 x bfloat> %494, bfloat %400, i32 1
  %496 = bitcast <2 x bfloat> %495 to i32
  %497 = insertelement <2 x bfloat> undef, bfloat %402, i32 0
  %498 = insertelement <2 x bfloat> %497, bfloat %403, i32 1
  %499 = bitcast <2 x bfloat> %498 to i32
  %500 = insertelement <2 x bfloat> undef, bfloat %405, i32 0
  %501 = insertelement <2 x bfloat> %500, bfloat %406, i32 1
  %502 = bitcast <2 x bfloat> %501 to i32
  %503 = insertelement <2 x bfloat> undef, bfloat %408, i32 0
  %504 = insertelement <2 x bfloat> %503, bfloat %409, i32 1
  %505 = bitcast <2 x bfloat> %504 to i32
  %506 = insertelement <2 x bfloat> undef, bfloat %411, i32 0
  %507 = insertelement <2 x bfloat> %506, bfloat %412, i32 1
  %508 = bitcast <2 x bfloat> %507 to i32
  %509 = insertelement <2 x bfloat> undef, bfloat %414, i32 0
  %510 = insertelement <2 x bfloat> %509, bfloat %415, i32 1
  %511 = bitcast <2 x bfloat> %510 to i32
  %512 = insertelement <2 x bfloat> undef, bfloat %417, i32 0
  %513 = insertelement <2 x bfloat> %512, bfloat %418, i32 1
  %514 = bitcast <2 x bfloat> %513 to i32
  %515 = insertelement <2 x bfloat> undef, bfloat %420, i32 0
  %516 = insertelement <2 x bfloat> %515, bfloat %421, i32 1
  %517 = bitcast <2 x bfloat> %516 to i32
  %518 = insertelement <2 x bfloat> undef, bfloat %423, i32 0
  %519 = insertelement <2 x bfloat> %518, bfloat %424, i32 1
  %520 = bitcast <2 x bfloat> %519 to i32
  %521 = insertelement <2 x bfloat> undef, bfloat %426, i32 0
  %522 = insertelement <2 x bfloat> %521, bfloat %427, i32 1
  %523 = bitcast <2 x bfloat> %522 to i32
  %524 = insertelement <2 x bfloat> undef, bfloat %429, i32 0
  %525 = insertelement <2 x bfloat> %524, bfloat %430, i32 1
  %526 = bitcast <2 x bfloat> %525 to i32
  %527 = insertelement <2 x bfloat> undef, bfloat %432, i32 0
  %528 = insertelement <2 x bfloat> %527, bfloat %433, i32 1
  %529 = bitcast <2 x bfloat> %528 to i32
  %530 = insertelement <2 x bfloat> undef, bfloat %435, i32 0
  %531 = insertelement <2 x bfloat> %530, bfloat %436, i32 1
  %532 = bitcast <2 x bfloat> %531 to i32
  %533 = insertelement <2 x bfloat> undef, bfloat %438, i32 0
  %534 = insertelement <2 x bfloat> %533, bfloat %439, i32 1
  %535 = bitcast <2 x bfloat> %534 to i32
  %536 = insertelement <2 x bfloat> undef, bfloat %441, i32 0
  %537 = insertelement <2 x bfloat> %536, bfloat %442, i32 1
  %538 = bitcast <2 x bfloat> %537 to i32
  %539 = insertelement <2 x bfloat> undef, bfloat %444, i32 0
  %540 = insertelement <2 x bfloat> %539, bfloat %445, i32 1
  %541 = bitcast <2 x bfloat> %540 to i32
  %542 = insertelement <2 x bfloat> undef, bfloat %447, i32 0
  %543 = insertelement <2 x bfloat> %542, bfloat %448, i32 1
  %544 = bitcast <2 x bfloat> %543 to i32
  %545 = insertelement <2 x bfloat> undef, bfloat %450, i32 0
  %546 = insertelement <2 x bfloat> %545, bfloat %451, i32 1
  %547 = bitcast <2 x bfloat> %546 to i32
  %548 = insertelement <2 x bfloat> undef, bfloat %453, i32 0
  %549 = insertelement <2 x bfloat> %548, bfloat %454, i32 1
  %550 = bitcast <2 x bfloat> %549 to i32
  %551 = extractvalue { float, float, float, float, float, float, float, float } %232, 0
  %552 = extractvalue { float, float, float, float, float, float, float, float } %232, 1
  %553 = extractvalue { float, float, float, float, float, float, float, float } %232, 2
  %554 = extractvalue { float, float, float, float, float, float, float, float } %232, 3
  %555 = extractvalue { float, float, float, float, float, float, float, float } %232, 4
  %556 = extractvalue { float, float, float, float, float, float, float, float } %232, 5
  %557 = extractvalue { float, float, float, float, float, float, float, float } %232, 6
  %558 = extractvalue { float, float, float, float, float, float, float, float } %232, 7
  %559 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %551, float %552, float %553, float %554, i32 %457, i32 %460, i32 %463, i32 %466, i32 0, i32 0)
  %560 = extractvalue { float, float, float, float } %559, 0
  %561 = extractvalue { float, float, float, float } %559, 1
  %562 = extractvalue { float, float, float, float } %559, 2
  %563 = extractvalue { float, float, float, float } %559, 3
  %564 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %555, float %556, float %557, float %558, i32 %457, i32 %460, i32 %463, i32 %466, i32 0, i32 0)
  %565 = extractvalue { float, float, float, float } %564, 0
  %566 = extractvalue { float, float, float, float } %564, 1
  %567 = extractvalue { float, float, float, float } %564, 2
  %568 = extractvalue { float, float, float, float } %564, 3
  %569 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %560, float %561, float %562, float %563, i32 %469, i32 %472, i32 %475, i32 %478, i32 0, i32 0)
  %570 = extractvalue { float, float, float, float } %569, 0
  %571 = extractvalue { float, float, float, float } %569, 1
  %572 = extractvalue { float, float, float, float } %569, 2
  %573 = extractvalue { float, float, float, float } %569, 3
  %574 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %565, float %566, float %567, float %568, i32 %469, i32 %472, i32 %475, i32 %478, i32 0, i32 0)
  %575 = extractvalue { float, float, float, float } %574, 0
  %576 = extractvalue { float, float, float, float } %574, 1
  %577 = extractvalue { float, float, float, float } %574, 2
  %578 = extractvalue { float, float, float, float } %574, 3
  %579 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %570, float %571, float %572, float %573, i32 %481, i32 %484, i32 %487, i32 %490, i32 0, i32 0)
  %580 = extractvalue { float, float, float, float } %579, 0
  %581 = extractvalue { float, float, float, float } %579, 1
  %582 = extractvalue { float, float, float, float } %579, 2
  %583 = extractvalue { float, float, float, float } %579, 3
  %584 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %575, float %576, float %577, float %578, i32 %481, i32 %484, i32 %487, i32 %490, i32 0, i32 0)
  %585 = extractvalue { float, float, float, float } %584, 0
  %586 = extractvalue { float, float, float, float } %584, 1
  %587 = extractvalue { float, float, float, float } %584, 2
  %588 = extractvalue { float, float, float, float } %584, 3
  %589 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %580, float %581, float %582, float %583, i32 %493, i32 %496, i32 %499, i32 %502, i32 0, i32 0)
  %590 = extractvalue { float, float, float, float } %589, 0
  %591 = extractvalue { float, float, float, float } %589, 1
  %592 = extractvalue { float, float, float, float } %589, 2
  %593 = extractvalue { float, float, float, float } %589, 3
  %594 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %585, float %586, float %587, float %588, i32 %493, i32 %496, i32 %499, i32 %502, i32 0, i32 0)
  %595 = extractvalue { float, float, float, float } %594, 0
  %596 = extractvalue { float, float, float, float } %594, 1
  %597 = extractvalue { float, float, float, float } %594, 2
  %598 = extractvalue { float, float, float, float } %594, 3
  %599 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %590, float %591, float %592, float %593, i32 %505, i32 %508, i32 %511, i32 %514, i32 0, i32 0)
  %600 = extractvalue { float, float, float, float } %599, 0
  %601 = extractvalue { float, float, float, float } %599, 1
  %602 = extractvalue { float, float, float, float } %599, 2
  %603 = extractvalue { float, float, float, float } %599, 3
  %604 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %595, float %596, float %597, float %598, i32 %505, i32 %508, i32 %511, i32 %514, i32 0, i32 0)
  %605 = extractvalue { float, float, float, float } %604, 0
  %606 = extractvalue { float, float, float, float } %604, 1
  %607 = extractvalue { float, float, float, float } %604, 2
  %608 = extractvalue { float, float, float, float } %604, 3
  %609 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %600, float %601, float %602, float %603, i32 %517, i32 %520, i32 %523, i32 %526, i32 0, i32 0)
  %610 = extractvalue { float, float, float, float } %609, 0
  %611 = extractvalue { float, float, float, float } %609, 1
  %612 = extractvalue { float, float, float, float } %609, 2
  %613 = extractvalue { float, float, float, float } %609, 3
  %614 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %605, float %606, float %607, float %608, i32 %517, i32 %520, i32 %523, i32 %526, i32 0, i32 0)
  %615 = extractvalue { float, float, float, float } %614, 0
  %616 = extractvalue { float, float, float, float } %614, 1
  %617 = extractvalue { float, float, float, float } %614, 2
  %618 = extractvalue { float, float, float, float } %614, 3
  %619 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %610, float %611, float %612, float %613, i32 %529, i32 %532, i32 %535, i32 %538, i32 0, i32 0)
  %620 = extractvalue { float, float, float, float } %619, 0
  %621 = extractvalue { float, float, float, float } %619, 1
  %622 = extractvalue { float, float, float, float } %619, 2
  %623 = extractvalue { float, float, float, float } %619, 3
  %624 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %615, float %616, float %617, float %618, i32 %529, i32 %532, i32 %535, i32 %538, i32 0, i32 0)
  %625 = extractvalue { float, float, float, float } %624, 0
  %626 = extractvalue { float, float, float, float } %624, 1
  %627 = extractvalue { float, float, float, float } %624, 2
  %628 = extractvalue { float, float, float, float } %624, 3
  %629 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %620, float %621, float %622, float %623, i32 %541, i32 %544, i32 %547, i32 %550, i32 0, i32 0)
  %630 = extractvalue { float, float, float, float } %629, 0
  %631 = extractvalue { float, float, float, float } %629, 1
  %632 = extractvalue { float, float, float, float } %629, 2
  %633 = extractvalue { float, float, float, float } %629, 3
  %634 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %625, float %626, float %627, float %628, i32 %541, i32 %544, i32 %547, i32 %550, i32 0, i32 0)
  %635 = extractvalue { float, float, float, float } %634, 0
  %636 = extractvalue { float, float, float, float } %634, 1
  %637 = extractvalue { float, float, float, float } %634, 2
  %638 = extractvalue { float, float, float, float } %634, 3
  %639 = insertvalue { float, float, float, float, float, float, float, float } undef, float %630, 0
  %640 = insertvalue { float, float, float, float, float, float, float, float } %639, float %631, 1
  %641 = insertvalue { float, float, float, float, float, float, float, float } %640, float %632, 2
  %642 = insertvalue { float, float, float, float, float, float, float, float } %641, float %633, 3
  %643 = insertvalue { float, float, float, float, float, float, float, float } %642, float %635, 4
  %644 = insertvalue { float, float, float, float, float, float, float, float } %643, float %636, 5
  %645 = insertvalue { float, float, float, float, float, float, float, float } %644, float %637, 6
  %646 = insertvalue { float, float, float, float, float, float, float, float } %645, float %638, 7
  %647 = add i64 %231, 128
  %648 = add i32 %233, 1
  %649 = icmp slt i32 %648, 3
  %650 = select i1 %649, i32 %648, i32 0
  %651 = add i64 %647, %99
  %652 = add i64 %73, %651
  %653 = add i64 %74, %651
  %654 = add i64 %75, %651
  %655 = add i64 %76, %651
  %656 = add i64 %77, %651
  %657 = add i64 %78, %651
  %658 = add i64 %79, %651
  %659 = add i64 %80, %651
  %660 = getelementptr bfloat, ptr addrspace(1) %20, i64 %652
  %661 = getelementptr bfloat, ptr addrspace(1) %20, i64 %653
  %662 = getelementptr bfloat, ptr addrspace(1) %20, i64 %654
  %663 = getelementptr bfloat, ptr addrspace(1) %20, i64 %655
  %664 = getelementptr bfloat, ptr addrspace(1) %20, i64 %656
  %665 = getelementptr bfloat, ptr addrspace(1) %20, i64 %657
  %666 = getelementptr bfloat, ptr addrspace(1) %20, i64 %658
  %667 = getelementptr bfloat, ptr addrspace(1) %20, i64 %659
  %668 = mul i32 %650, 8192
  %669 = add i32 %668, 0
  %670 = add i32 %669, 0
  %671 = add i32 %670, 0
  %672 = getelementptr bfloat, ptr addrspace(3) @global_smem, i32 %671
  call void @llvm.nvvm.barrier0()
  %673 = getelementptr inbounds bfloat, ptr addrspace(3) %672, i32 %121
  %674 = getelementptr inbounds bfloat, ptr addrspace(3) %672, i32 %129
  %675 = getelementptr inbounds bfloat, ptr addrspace(3) %672, i32 %137
  %676 = getelementptr inbounds bfloat, ptr addrspace(3) %672, i32 %145
  %677 = getelementptr inbounds bfloat, ptr addrspace(3) %672, i32 %153
  %678 = getelementptr inbounds bfloat, ptr addrspace(3) %672, i32 %161
  %679 = getelementptr inbounds bfloat, ptr addrspace(3) %672, i32 %169
  %680 = getelementptr inbounds bfloat, ptr addrspace(3) %672, i32 %177
  %681 = select i1 %238, i32 16, i32 0
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %673, ptr addrspace(1) %660, i32 %681)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %674, ptr addrspace(1) %661, i32 %681)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %675, ptr addrspace(1) %662, i32 %681)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %676, ptr addrspace(1) %663, i32 %681)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %677, ptr addrspace(1) %664, i32 %681)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %678, ptr addrspace(1) %665, i32 %681)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %679, ptr addrspace(1) %666, i32 %681)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %680, ptr addrspace(1) %667, i32 %681)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  %682 = add i32 %234, 1
  %683 = icmp slt i32 %682, 3
  %684 = select i1 %683, i32 %682, i32 0
  call void asm sideeffect "cp.async.wait_group 0x2;", ""()
  call void @llvm.nvvm.barrier0()
  %685 = mul i32 %684, 8192
  %686 = add i32 %685, 0
  %687 = add i32 %686, 0
  %688 = add i32 %687, 0
  %689 = getelementptr bfloat, ptr addrspace(3) @global_smem, i32 %688
  %690 = insertvalue { ptr addrspace(3), i32, i32 } undef, ptr addrspace(3) %689, 0
  %691 = insertvalue { ptr addrspace(3), i32, i32 } %690, i32 0, 1
  %692 = insertvalue { ptr addrspace(3), i32, i32 } %691, i32 0, 2
  %693 = add i32 %230, 128
  br label %229

694:                                              ; preds = %229
  call void asm sideeffect "cp.async.wait_group 0x0;", ""()
  call void @llvm.nvvm.barrier0()
  %695 = extractvalue { float, float, float, float, float, float, float, float } %232, 0
  %696 = extractvalue { float, float, float, float, float, float, float, float } %232, 1
  %697 = extractvalue { float, float, float, float, float, float, float, float } %232, 2
  %698 = extractvalue { float, float, float, float, float, float, float, float } %232, 3
  %699 = extractvalue { float, float, float, float, float, float, float, float } %232, 4
  %700 = extractvalue { float, float, float, float, float, float, float, float } %232, 5
  %701 = extractvalue { float, float, float, float, float, float, float, float } %232, 6
  %702 = extractvalue { float, float, float, float, float, float, float, float } %232, 7
  %703 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %695)
  %704 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %696)
  %705 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %697)
  %706 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %698)
  %707 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %699)
  %708 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %700)
  %709 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %701)
  %710 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %702)
  %711 = mul i32 %15, 16
  %712 = sext i32 %16 to i64
  %713 = sext i32 %711 to i64
  %714 = xor i32 %92, 0
  %715 = add i32 %714, 0
  %716 = sext i32 %715 to i64
  %717 = add i64 %712, %716
  %718 = select i1 %94, i32 0, i32 1
  %719 = xor i32 0, %718
  %720 = select i1 %30, i32 0, i32 2
  %721 = xor i32 %719, %720
  %722 = select i1 %34, i32 0, i32 4
  %723 = xor i32 %721, %722
  %724 = select i1 %38, i32 0, i32 8
  %725 = xor i32 %723, %724
  %726 = xor i32 %725, 0
  %727 = add i32 %726, 0
  %728 = sext i32 %727 to i64
  %729 = add i64 %713, %728
  %730 = mul i64 %729, 3072
  %731 = add i64 %717, %730
  %732 = getelementptr bfloat, ptr addrspace(1) %4, i64 %731
  %733 = select i1 %82, i32 0, i32 128
  %734 = xor i32 0, %733
  %735 = select i1 %86, i32 0, i32 256
  %736 = xor i32 %734, %735
  %737 = select i1 %90, i32 0, i32 1
  %738 = xor i32 %736, %737
  %739 = select i1 %94, i32 0, i32 2
  %740 = xor i32 %738, %739
  %741 = select i1 %30, i32 0, i32 4
  %742 = xor i32 %740, %741
  %743 = select i1 %34, i32 0, i32 16
  %744 = xor i32 %742, %743
  %745 = select i1 %38, i32 0, i32 32
  %746 = xor i32 %744, %745
  %747 = select i1 %30, i32 0, i32 128
  %748 = xor i32 %96, %747
  %749 = select i1 %34, i32 0, i32 256
  %750 = xor i32 %748, %749
  %751 = select i1 %38, i32 0, i32 512
  %752 = xor i32 %750, %751
  %753 = xor i32 %746, 0
  %754 = lshr i32 %753, 6
  %755 = shl i32 %754, 3
  %756 = add i32 %755, %753
  %757 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %756
  %758 = insertelement <1 x bfloat> undef, bfloat %703, i32 0
  %759 = extractelement <1 x bfloat> %758, i32 0
  %760 = bitcast bfloat %759 to i16
  %761 = insertelement <1 x i16> undef, i16 %760, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %757, <1 x i16> %761, i1 true)
  %762 = xor i32 %746, 64
  %763 = lshr i32 %762, 6
  %764 = shl i32 %763, 3
  %765 = add i32 %764, %762
  %766 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %765
  %767 = insertelement <1 x bfloat> undef, bfloat %704, i32 0
  %768 = extractelement <1 x bfloat> %767, i32 0
  %769 = bitcast bfloat %768 to i16
  %770 = insertelement <1 x i16> undef, i16 %769, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %766, <1 x i16> %770, i1 true)
  %771 = xor i32 %746, 8
  %772 = lshr i32 %771, 6
  %773 = shl i32 %772, 3
  %774 = add i32 %773, %771
  %775 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %774
  %776 = insertelement <1 x bfloat> undef, bfloat %705, i32 0
  %777 = extractelement <1 x bfloat> %776, i32 0
  %778 = bitcast bfloat %777 to i16
  %779 = insertelement <1 x i16> undef, i16 %778, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %775, <1 x i16> %779, i1 true)
  %780 = xor i32 %746, 72
  %781 = lshr i32 %780, 6
  %782 = shl i32 %781, 3
  %783 = add i32 %782, %780
  %784 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %783
  %785 = insertelement <1 x bfloat> undef, bfloat %706, i32 0
  %786 = extractelement <1 x bfloat> %785, i32 0
  %787 = bitcast bfloat %786 to i16
  %788 = insertelement <1 x i16> undef, i16 %787, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %784, <1 x i16> %788, i1 true)
  %789 = xor i32 %746, 512
  %790 = lshr i32 %789, 6
  %791 = shl i32 %790, 3
  %792 = add i32 %791, %789
  %793 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %792
  %794 = insertelement <1 x bfloat> undef, bfloat %707, i32 0
  %795 = extractelement <1 x bfloat> %794, i32 0
  %796 = bitcast bfloat %795 to i16
  %797 = insertelement <1 x i16> undef, i16 %796, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %793, <1 x i16> %797, i1 true)
  %798 = xor i32 %746, 576
  %799 = lshr i32 %798, 6
  %800 = shl i32 %799, 3
  %801 = add i32 %800, %798
  %802 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %801
  %803 = insertelement <1 x bfloat> undef, bfloat %708, i32 0
  %804 = extractelement <1 x bfloat> %803, i32 0
  %805 = bitcast bfloat %804 to i16
  %806 = insertelement <1 x i16> undef, i16 %805, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %802, <1 x i16> %806, i1 true)
  %807 = xor i32 %746, 520
  %808 = lshr i32 %807, 6
  %809 = shl i32 %808, 3
  %810 = add i32 %809, %807
  %811 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %810
  %812 = insertelement <1 x bfloat> undef, bfloat %709, i32 0
  %813 = extractelement <1 x bfloat> %812, i32 0
  %814 = bitcast bfloat %813 to i16
  %815 = insertelement <1 x i16> undef, i16 %814, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %811, <1 x i16> %815, i1 true)
  %816 = xor i32 %746, 584
  %817 = lshr i32 %816, 6
  %818 = shl i32 %817, 3
  %819 = add i32 %818, %816
  %820 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %819
  %821 = insertelement <1 x bfloat> undef, bfloat %710, i32 0
  %822 = extractelement <1 x bfloat> %821, i32 0
  %823 = bitcast bfloat %822 to i16
  %824 = insertelement <1 x i16> undef, i16 %823, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %820, <1 x i16> %824, i1 true)
  call void @llvm.nvvm.barrier0()
  %825 = xor i32 %752, 0
  %826 = lshr i32 %825, 6
  %827 = shl i32 %826, 3
  %828 = add i32 %827, %825
  %829 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %828
  %830 = load <4 x i32>, ptr addrspace(3) %829, align 16
  %831 = extractelement <4 x i32> %830, i32 0
  %832 = extractelement <4 x i32> %830, i32 1
  %833 = extractelement <4 x i32> %830, i32 2
  %834 = extractelement <4 x i32> %830, i32 3
  %835 = insertelement <4 x i32> undef, i32 %831, i32 0
  %836 = insertelement <4 x i32> %835, i32 %832, i32 1
  %837 = insertelement <4 x i32> %836, i32 %833, i32 2
  %838 = insertelement <4 x i32> %837, i32 %834, i32 3
  %839 = extractelement <4 x i32> %838, i32 0
  %840 = extractelement <4 x i32> %838, i32 1
  %841 = extractelement <4 x i32> %838, i32 2
  %842 = extractelement <4 x i32> %838, i32 3
  %843 = bitcast i32 %839 to <2 x i16>
  %844 = extractelement <2 x i16> %843, i32 0
  %845 = extractelement <2 x i16> %843, i32 1
  %846 = bitcast i32 %840 to <2 x i16>
  %847 = extractelement <2 x i16> %846, i32 0
  %848 = extractelement <2 x i16> %846, i32 1
  %849 = bitcast i32 %841 to <2 x i16>
  %850 = extractelement <2 x i16> %849, i32 0
  %851 = extractelement <2 x i16> %849, i32 1
  %852 = bitcast i32 %842 to <2 x i16>
  %853 = extractelement <2 x i16> %852, i32 0
  %854 = extractelement <2 x i16> %852, i32 1
  %855 = insertelement <8 x i16> undef, i16 %844, i32 0
  %856 = insertelement <8 x i16> %855, i16 %845, i32 1
  %857 = insertelement <8 x i16> %856, i16 %847, i32 2
  %858 = insertelement <8 x i16> %857, i16 %848, i32 3
  %859 = insertelement <8 x i16> %858, i16 %850, i32 4
  %860 = insertelement <8 x i16> %859, i16 %851, i32 5
  %861 = insertelement <8 x i16> %860, i16 %853, i32 6
  %862 = insertelement <8 x i16> %861, i16 %854, i32 7
  %863 = extractelement <8 x i16> %862, i32 0
  %864 = extractelement <8 x i16> %862, i32 1
  %865 = extractelement <8 x i16> %862, i32 2
  %866 = extractelement <8 x i16> %862, i32 3
  %867 = extractelement <8 x i16> %862, i32 4
  %868 = extractelement <8 x i16> %862, i32 5
  %869 = extractelement <8 x i16> %862, i32 6
  %870 = extractelement <8 x i16> %862, i32 7
  %871 = bitcast i16 %863 to bfloat
  %872 = bitcast i16 %864 to bfloat
  %873 = bitcast i16 %865 to bfloat
  %874 = bitcast i16 %866 to bfloat
  %875 = bitcast i16 %867 to bfloat
  %876 = bitcast i16 %868 to bfloat
  %877 = bitcast i16 %869 to bfloat
  %878 = bitcast i16 %870 to bfloat
  %879 = insertelement <8 x bfloat> undef, bfloat %871, i32 0
  %880 = insertelement <8 x bfloat> %879, bfloat %872, i32 1
  %881 = insertelement <8 x bfloat> %880, bfloat %873, i32 2
  %882 = insertelement <8 x bfloat> %881, bfloat %874, i32 3
  %883 = insertelement <8 x bfloat> %882, bfloat %875, i32 4
  %884 = insertelement <8 x bfloat> %883, bfloat %876, i32 5
  %885 = insertelement <8 x bfloat> %884, bfloat %877, i32 6
  %886 = insertelement <8 x bfloat> %885, bfloat %878, i32 7
  %887 = extractelement <8 x bfloat> %886, i32 0
  %888 = extractelement <8 x bfloat> %886, i32 1
  %889 = extractelement <8 x bfloat> %886, i32 2
  %890 = extractelement <8 x bfloat> %886, i32 3
  %891 = extractelement <8 x bfloat> %886, i32 4
  %892 = extractelement <8 x bfloat> %886, i32 5
  %893 = extractelement <8 x bfloat> %886, i32 6
  %894 = extractelement <8 x bfloat> %886, i32 7
  %895 = insertelement <2 x bfloat> undef, bfloat %887, i32 0
  %896 = insertelement <2 x bfloat> %895, bfloat %888, i32 1
  %897 = bitcast <2 x bfloat> %896 to i32
  %898 = insertelement <2 x bfloat> undef, bfloat %889, i32 0
  %899 = insertelement <2 x bfloat> %898, bfloat %890, i32 1
  %900 = bitcast <2 x bfloat> %899 to i32
  %901 = insertelement <2 x bfloat> undef, bfloat %891, i32 0
  %902 = insertelement <2 x bfloat> %901, bfloat %892, i32 1
  %903 = bitcast <2 x bfloat> %902 to i32
  %904 = insertelement <2 x bfloat> undef, bfloat %893, i32 0
  %905 = insertelement <2 x bfloat> %904, bfloat %894, i32 1
  %906 = bitcast <2 x bfloat> %905 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %897, i32 %900, i32 %903, i32 %906, ptr addrspace(1) %732)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_51_impl(ptr, ptr, ptr, ptr, ptr, ptr) #4

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #5

declare float @__nv_rsqrtf(float)

define ptx_kernel void @fusion_51(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(32768) %arg1, ptr noalias align 128 dereferenceable(98304) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4) #6 {
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
  %12 = mul i64 %9, 3072
  %13 = add i64 %11, %12
  %14 = add i64 %13, 2048
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
  %80 = add i64 %12, 2048
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

define ptx_kernel void @loop_convert_fusion_2(ptr noalias align 128 dereferenceable(196608) %0, ptr noalias align 128 dereferenceable(98304) %1) #0 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !3
  %5 = udiv i32 %4, 24
  %6 = urem i32 %4, 24
  %7 = mul i32 %6, 128
  %8 = add i32 %7, %3
  %9 = call bfloat @fused_convert_2_param_0_139(ptr %0, i32 %5, i32 %8)
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
  %20 = call bfloat @fused_convert_2_param_0_139(ptr %0, i32 %5, i32 %19)
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

define internal bfloat @fused_convert_2_param_0_139(ptr noalias %0, i32 %1, i32 %2) {
  %4 = mul i32 %1, 6144
  %5 = add i32 %4, %2
  %6 = getelementptr inbounds bfloat, ptr %0, i32 %5
  %7 = load bfloat, ptr %6, align 2, !invariant.load !2
  ret bfloat %7
}

declare float @__nv_fast_expf(float)

declare ptx_kernel void @fusion_49_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_49(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(98304) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5) #6 {
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
  %13 = mul i64 %10, 3072
  %14 = add i64 %12, %13
  %15 = add i64 %14, 1024
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
  %77 = add i64 %14, 2048
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
  %120 = add i64 %13, 1024
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
  %246 = add i64 %13, 2048
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

declare ptx_kernel void @fusion_47_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_47(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(98304) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6) #6 {
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
  %11 = udiv i64 %10, 4
  %12 = urem i64 %10, 4
  %13 = mul i64 %12, 256
  %14 = mul i64 %11, 3072
  %15 = add i64 %13, %14
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
  %61 = mul i64 %10, 256
  %62 = getelementptr bfloat, ptr addrspace(1) %6, i64 %61
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
  %77 = add i64 %15, 1024
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
  %93 = getelementptr bfloat, ptr addrspace(1) %5, i64 %61
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
  %108 = add i64 %15, 2048
  %109 = getelementptr bfloat, ptr addrspace(1) %4, i64 %108
  %110 = getelementptr bfloat, ptr addrspace(1) %109, i64 %46
  %111 = call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %110)
  %112 = extractvalue { i32, i32 } %111, 0
  %113 = bitcast i32 %112 to <2 x bfloat>
  %114 = extractvalue { i32, i32 } %111, 1
  %115 = bitcast i32 %114 to <2 x bfloat>
  %116 = extractelement <2 x bfloat> %113, i32 0
  %117 = extractelement <2 x bfloat> %113, i32 1
  %118 = extractelement <2 x bfloat> %115, i32 0
  %119 = extractelement <2 x bfloat> %115, i32 1
  %120 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %116)
  %121 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %117)
  %122 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %118)
  %123 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %119)
  %124 = getelementptr bfloat, ptr addrspace(1) %3, i64 %61
  %125 = getelementptr bfloat, ptr addrspace(1) %124, i64 %46
  %126 = call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %125)
  %127 = extractvalue { i32, i32 } %126, 0
  %128 = bitcast i32 %127 to <2 x bfloat>
  %129 = extractvalue { i32, i32 } %126, 1
  %130 = bitcast i32 %129 to <2 x bfloat>
  %131 = extractelement <2 x bfloat> %128, i32 0
  %132 = extractelement <2 x bfloat> %128, i32 1
  %133 = extractelement <2 x bfloat> %130, i32 0
  %134 = extractelement <2 x bfloat> %130, i32 1
  %135 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %131)
  %136 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %132)
  %137 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %133)
  %138 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %134)
  %139 = fadd float %120, %135
  %140 = fadd float %121, %136
  %141 = fadd float %122, %137
  %142 = fadd float %123, %138
  %143 = fadd float %104, %139
  %144 = fadd float %105, %140
  %145 = fadd float %106, %141
  %146 = fadd float %107, %142
  %147 = fadd float %89, %143
  %148 = fadd float %90, %144
  %149 = fadd float %91, %145
  %150 = fadd float %92, %146
  %151 = fadd float %73, %147
  %152 = fadd float %74, %148
  %153 = fadd float %75, %149
  %154 = fadd float %76, %150
  %155 = fadd float %57, %151
  %156 = fadd float %58, %152
  %157 = fadd float %59, %153
  %158 = fadd float %60, %154
  %159 = getelementptr bfloat, ptr addrspace(1) %4, i64 %14
  %160 = select i1 %21, i32 0, i32 8
  %161 = xor i32 0, %160
  %162 = select i1 %25, i32 0, i32 16
  %163 = xor i32 %161, %162
  %164 = select i1 %29, i32 0, i32 32
  %165 = xor i32 %163, %164
  %166 = select i1 %33, i32 0, i32 64
  %167 = xor i32 %165, %166
  %168 = select i1 %37, i32 0, i32 128
  %169 = xor i32 %167, %168
  %170 = select i1 %41, i32 0, i32 256
  %171 = xor i32 %169, %170
  %172 = xor i32 %171, 0
  %173 = xor i32 %171, 512
  %174 = add i32 %172, 0
  %175 = add i32 %173, 0
  %176 = sext i32 %174 to i64
  %177 = sext i32 %175 to i64
  %178 = getelementptr bfloat, ptr addrspace(1) %159, i64 %176
  %179 = getelementptr bfloat, ptr addrspace(1) %159, i64 %177
  %180 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %178)
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
  %197 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %179)
  %198 = extractvalue { i32, i32, i32, i32 } %197, 0
  %199 = bitcast i32 %198 to <2 x bfloat>
  %200 = extractvalue { i32, i32, i32, i32 } %197, 1
  %201 = bitcast i32 %200 to <2 x bfloat>
  %202 = extractvalue { i32, i32, i32, i32 } %197, 2
  %203 = bitcast i32 %202 to <2 x bfloat>
  %204 = extractvalue { i32, i32, i32, i32 } %197, 3
  %205 = bitcast i32 %204 to <2 x bfloat>
  %206 = extractelement <2 x bfloat> %199, i32 0
  %207 = extractelement <2 x bfloat> %199, i32 1
  %208 = extractelement <2 x bfloat> %201, i32 0
  %209 = extractelement <2 x bfloat> %201, i32 1
  %210 = extractelement <2 x bfloat> %203, i32 0
  %211 = extractelement <2 x bfloat> %203, i32 1
  %212 = extractelement <2 x bfloat> %205, i32 0
  %213 = extractelement <2 x bfloat> %205, i32 1
  %214 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189)
  %215 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190)
  %216 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191)
  %217 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192)
  %218 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193)
  %219 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194)
  %220 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195)
  %221 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %196)
  %222 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206)
  %223 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207)
  %224 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208)
  %225 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209)
  %226 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210)
  %227 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211)
  %228 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212)
  %229 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %213)
  %230 = mul i64 %11, 1024
  %231 = getelementptr bfloat, ptr addrspace(1) %6, i64 %230
  %232 = getelementptr bfloat, ptr addrspace(1) %231, i64 %176
  %233 = getelementptr bfloat, ptr addrspace(1) %231, i64 %177
  %234 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %232)
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
  %251 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %233)
  %252 = extractvalue { i32, i32, i32, i32 } %251, 0
  %253 = bitcast i32 %252 to <2 x bfloat>
  %254 = extractvalue { i32, i32, i32, i32 } %251, 1
  %255 = bitcast i32 %254 to <2 x bfloat>
  %256 = extractvalue { i32, i32, i32, i32 } %251, 2
  %257 = bitcast i32 %256 to <2 x bfloat>
  %258 = extractvalue { i32, i32, i32, i32 } %251, 3
  %259 = bitcast i32 %258 to <2 x bfloat>
  %260 = extractelement <2 x bfloat> %253, i32 0
  %261 = extractelement <2 x bfloat> %253, i32 1
  %262 = extractelement <2 x bfloat> %255, i32 0
  %263 = extractelement <2 x bfloat> %255, i32 1
  %264 = extractelement <2 x bfloat> %257, i32 0
  %265 = extractelement <2 x bfloat> %257, i32 1
  %266 = extractelement <2 x bfloat> %259, i32 0
  %267 = extractelement <2 x bfloat> %259, i32 1
  %268 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243)
  %269 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244)
  %270 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245)
  %271 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246)
  %272 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %247)
  %273 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %248)
  %274 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %249)
  %275 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %250)
  %276 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260)
  %277 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261)
  %278 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262)
  %279 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %263)
  %280 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %264)
  %281 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %265)
  %282 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %266)
  %283 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %267)
  %284 = add i64 %14, 1024
  %285 = getelementptr bfloat, ptr addrspace(1) %4, i64 %284
  %286 = getelementptr bfloat, ptr addrspace(1) %285, i64 %176
  %287 = getelementptr bfloat, ptr addrspace(1) %285, i64 %177
  %288 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %286)
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
  %305 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %287)
  %306 = extractvalue { i32, i32, i32, i32 } %305, 0
  %307 = bitcast i32 %306 to <2 x bfloat>
  %308 = extractvalue { i32, i32, i32, i32 } %305, 1
  %309 = bitcast i32 %308 to <2 x bfloat>
  %310 = extractvalue { i32, i32, i32, i32 } %305, 2
  %311 = bitcast i32 %310 to <2 x bfloat>
  %312 = extractvalue { i32, i32, i32, i32 } %305, 3
  %313 = bitcast i32 %312 to <2 x bfloat>
  %314 = extractelement <2 x bfloat> %307, i32 0
  %315 = extractelement <2 x bfloat> %307, i32 1
  %316 = extractelement <2 x bfloat> %309, i32 0
  %317 = extractelement <2 x bfloat> %309, i32 1
  %318 = extractelement <2 x bfloat> %311, i32 0
  %319 = extractelement <2 x bfloat> %311, i32 1
  %320 = extractelement <2 x bfloat> %313, i32 0
  %321 = extractelement <2 x bfloat> %313, i32 1
  %322 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297)
  %323 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298)
  %324 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299)
  %325 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300)
  %326 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %301)
  %327 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %302)
  %328 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %303)
  %329 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %304)
  %330 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314)
  %331 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315)
  %332 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316)
  %333 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317)
  %334 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %318)
  %335 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %319)
  %336 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %320)
  %337 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %321)
  %338 = getelementptr bfloat, ptr addrspace(1) %5, i64 %230
  %339 = getelementptr bfloat, ptr addrspace(1) %338, i64 %176
  %340 = getelementptr bfloat, ptr addrspace(1) %338, i64 %177
  %341 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %339)
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
  %358 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %340)
  %359 = extractvalue { i32, i32, i32, i32 } %358, 0
  %360 = bitcast i32 %359 to <2 x bfloat>
  %361 = extractvalue { i32, i32, i32, i32 } %358, 1
  %362 = bitcast i32 %361 to <2 x bfloat>
  %363 = extractvalue { i32, i32, i32, i32 } %358, 2
  %364 = bitcast i32 %363 to <2 x bfloat>
  %365 = extractvalue { i32, i32, i32, i32 } %358, 3
  %366 = bitcast i32 %365 to <2 x bfloat>
  %367 = extractelement <2 x bfloat> %360, i32 0
  %368 = extractelement <2 x bfloat> %360, i32 1
  %369 = extractelement <2 x bfloat> %362, i32 0
  %370 = extractelement <2 x bfloat> %362, i32 1
  %371 = extractelement <2 x bfloat> %364, i32 0
  %372 = extractelement <2 x bfloat> %364, i32 1
  %373 = extractelement <2 x bfloat> %366, i32 0
  %374 = extractelement <2 x bfloat> %366, i32 1
  %375 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %350)
  %376 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %351)
  %377 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %352)
  %378 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %353)
  %379 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %354)
  %380 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %355)
  %381 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %356)
  %382 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %357)
  %383 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %367)
  %384 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %368)
  %385 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %369)
  %386 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %370)
  %387 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %371)
  %388 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %372)
  %389 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %373)
  %390 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %374)
  %391 = add i64 %14, 2048
  %392 = getelementptr bfloat, ptr addrspace(1) %4, i64 %391
  %393 = getelementptr bfloat, ptr addrspace(1) %392, i64 %176
  %394 = getelementptr bfloat, ptr addrspace(1) %392, i64 %177
  %395 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %393)
  %396 = extractvalue { i32, i32, i32, i32 } %395, 0
  %397 = bitcast i32 %396 to <2 x bfloat>
  %398 = extractvalue { i32, i32, i32, i32 } %395, 1
  %399 = bitcast i32 %398 to <2 x bfloat>
  %400 = extractvalue { i32, i32, i32, i32 } %395, 2
  %401 = bitcast i32 %400 to <2 x bfloat>
  %402 = extractvalue { i32, i32, i32, i32 } %395, 3
  %403 = bitcast i32 %402 to <2 x bfloat>
  %404 = extractelement <2 x bfloat> %397, i32 0
  %405 = extractelement <2 x bfloat> %397, i32 1
  %406 = extractelement <2 x bfloat> %399, i32 0
  %407 = extractelement <2 x bfloat> %399, i32 1
  %408 = extractelement <2 x bfloat> %401, i32 0
  %409 = extractelement <2 x bfloat> %401, i32 1
  %410 = extractelement <2 x bfloat> %403, i32 0
  %411 = extractelement <2 x bfloat> %403, i32 1
  %412 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %394)
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
  %429 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %404)
  %430 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %405)
  %431 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %406)
  %432 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %407)
  %433 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %408)
  %434 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %409)
  %435 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %410)
  %436 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %411)
  %437 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %421)
  %438 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %422)
  %439 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %423)
  %440 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %424)
  %441 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %425)
  %442 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %426)
  %443 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %427)
  %444 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %428)
  %445 = getelementptr bfloat, ptr addrspace(1) %3, i64 %230
  %446 = getelementptr bfloat, ptr addrspace(1) %445, i64 %176
  %447 = getelementptr bfloat, ptr addrspace(1) %445, i64 %177
  %448 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %446)
  %449 = extractvalue { i32, i32, i32, i32 } %448, 0
  %450 = bitcast i32 %449 to <2 x bfloat>
  %451 = extractvalue { i32, i32, i32, i32 } %448, 1
  %452 = bitcast i32 %451 to <2 x bfloat>
  %453 = extractvalue { i32, i32, i32, i32 } %448, 2
  %454 = bitcast i32 %453 to <2 x bfloat>
  %455 = extractvalue { i32, i32, i32, i32 } %448, 3
  %456 = bitcast i32 %455 to <2 x bfloat>
  %457 = extractelement <2 x bfloat> %450, i32 0
  %458 = extractelement <2 x bfloat> %450, i32 1
  %459 = extractelement <2 x bfloat> %452, i32 0
  %460 = extractelement <2 x bfloat> %452, i32 1
  %461 = extractelement <2 x bfloat> %454, i32 0
  %462 = extractelement <2 x bfloat> %454, i32 1
  %463 = extractelement <2 x bfloat> %456, i32 0
  %464 = extractelement <2 x bfloat> %456, i32 1
  %465 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %447)
  %466 = extractvalue { i32, i32, i32, i32 } %465, 0
  %467 = bitcast i32 %466 to <2 x bfloat>
  %468 = extractvalue { i32, i32, i32, i32 } %465, 1
  %469 = bitcast i32 %468 to <2 x bfloat>
  %470 = extractvalue { i32, i32, i32, i32 } %465, 2
  %471 = bitcast i32 %470 to <2 x bfloat>
  %472 = extractvalue { i32, i32, i32, i32 } %465, 3
  %473 = bitcast i32 %472 to <2 x bfloat>
  %474 = extractelement <2 x bfloat> %467, i32 0
  %475 = extractelement <2 x bfloat> %467, i32 1
  %476 = extractelement <2 x bfloat> %469, i32 0
  %477 = extractelement <2 x bfloat> %469, i32 1
  %478 = extractelement <2 x bfloat> %471, i32 0
  %479 = extractelement <2 x bfloat> %471, i32 1
  %480 = extractelement <2 x bfloat> %473, i32 0
  %481 = extractelement <2 x bfloat> %473, i32 1
  %482 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %457)
  %483 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %458)
  %484 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %459)
  %485 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %460)
  %486 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %461)
  %487 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %462)
  %488 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %463)
  %489 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %464)
  %490 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %474)
  %491 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %475)
  %492 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %476)
  %493 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %477)
  %494 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %478)
  %495 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %479)
  %496 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %480)
  %497 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %481)
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
  %510 = fadd float %441, %494
  %511 = fadd float %442, %495
  %512 = fadd float %443, %496
  %513 = fadd float %444, %497
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
  %526 = fadd float %387, %510
  %527 = fadd float %388, %511
  %528 = fadd float %389, %512
  %529 = fadd float %390, %513
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
  %542 = fadd float %334, %526
  %543 = fadd float %335, %527
  %544 = fadd float %336, %528
  %545 = fadd float %337, %529
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
  %558 = fadd float %280, %542
  %559 = fadd float %281, %543
  %560 = fadd float %282, %544
  %561 = fadd float %283, %545
  %562 = fadd float %214, %546
  %563 = fadd float %215, %547
  %564 = fadd float %216, %548
  %565 = fadd float %217, %549
  %566 = fadd float %218, %550
  %567 = fadd float %219, %551
  %568 = fadd float %220, %552
  %569 = fadd float %221, %553
  %570 = fadd float %222, %554
  %571 = fadd float %223, %555
  %572 = fadd float %224, %556
  %573 = fadd float %225, %557
  %574 = fadd float %226, %558
  %575 = fadd float %227, %559
  %576 = fadd float %228, %560
  %577 = fadd float %229, %561
  %578 = fmul float %562, %562
  %579 = fmul float %563, %563
  %580 = fmul float %564, %564
  %581 = fmul float %565, %565
  %582 = fmul float %566, %566
  %583 = fmul float %567, %567
  %584 = fmul float %568, %568
  %585 = fmul float %569, %569
  %586 = fmul float %570, %570
  %587 = fmul float %571, %571
  %588 = fmul float %572, %572
  %589 = fmul float %573, %573
  %590 = fmul float %574, %574
  %591 = fmul float %575, %575
  %592 = fmul float %576, %576
  %593 = fmul float %577, %577
  %594 = fadd float %578, %579
  %595 = fadd float %594, %580
  %596 = fadd float %595, %581
  %597 = fadd float %596, %582
  %598 = fadd float %597, %583
  %599 = fadd float %598, %584
  %600 = fadd float %599, %585
  %601 = fadd float %600, %586
  %602 = fadd float %601, %587
  %603 = fadd float %602, %588
  %604 = fadd float %603, %589
  %605 = fadd float %604, %590
  %606 = fadd float %605, %591
  %607 = fadd float %606, %592
  %608 = fadd float %607, %593
  %609 = bitcast float %608 to i32
  %610 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %609, i32 16, i32 31)
  %611 = bitcast i32 %610 to float
  %612 = fadd float %608, %611
  %613 = bitcast float %612 to i32
  %614 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %613, i32 8, i32 31)
  %615 = bitcast i32 %614 to float
  %616 = fadd float %612, %615
  %617 = bitcast float %616 to i32
  %618 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %617, i32 4, i32 31)
  %619 = bitcast i32 %618 to float
  %620 = fadd float %616, %619
  %621 = bitcast float %620 to i32
  %622 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %621, i32 2, i32 31)
  %623 = bitcast i32 %622 to float
  %624 = fadd float %620, %623
  %625 = bitcast float %624 to i32
  %626 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %625, i32 1, i32 31)
  %627 = bitcast i32 %626 to float
  %628 = fadd float %624, %627
  %629 = urem i32 %18, 32
  %630 = urem i32 %19, 2
  %631 = icmp eq i32 %629, 0
  %632 = and i1 true, %631
  %633 = add i32 0, %630
  %634 = getelementptr float, ptr addrspace(3) @global_smem, i32 %633
  %635 = insertelement <1 x float> undef, float %628, i32 0
  %636 = extractelement <1 x float> %635, i32 0
  %637 = bitcast float %636 to i32
  %638 = insertelement <1 x i32> undef, i32 %637, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %634, <1 x i32> %638, i1 %632)
  call void @llvm.nvvm.barrier0()
  %639 = icmp slt i32 %17, 2
  %640 = getelementptr float, ptr addrspace(3) @global_smem, i32 %17
  %641 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %640, i1 %639)
  %642 = insertelement <1 x i32> undef, i32 %641, i32 0
  %643 = extractelement <1 x i32> %642, i32 0
  %644 = bitcast i32 %643 to float
  %645 = insertelement <1 x float> undef, float %644, i32 0
  %646 = extractelement <1 x float> %645, i32 0
  %647 = bitcast float %646 to i32
  %648 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %647, i32 1, i32 31)
  %649 = bitcast i32 %648 to float
  %650 = fadd float %646, %649
  %651 = urem i32 %18, 2
  %652 = icmp eq i32 %651, 0
  %653 = and i1 %639, %652
  %654 = insertelement <1 x float> undef, float %650, i32 0
  %655 = extractelement <1 x float> %654, i32 0
  %656 = bitcast float %655 to i32
  %657 = insertelement <1 x i32> undef, i32 %656, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %640, <1 x i32> %657, i1 %653)
  call void @llvm.nvvm.barrier0()
  %658 = load float, ptr addrspace(3) @global_smem, align 4
  %659 = fmul float %658, 0x3F50000000000000
  %660 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %661 = bitcast i32 %660 to <1 x float>
  %662 = extractelement <1 x float> %661, i32 0
  %663 = fadd float %659, %662
  %664 = call float @__nv_rsqrtf(float %663)
  %665 = fmul float %155, %664
  %666 = fmul float %156, %664
  %667 = fmul float %157, %664
  %668 = fmul float %158, %664
  %669 = getelementptr bfloat, ptr addrspace(1) %2, i64 %13
  %670 = getelementptr bfloat, ptr addrspace(1) %669, i64 %46
  %671 = call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %670)
  %672 = extractvalue { i32, i32 } %671, 0
  %673 = bitcast i32 %672 to <2 x bfloat>
  %674 = extractvalue { i32, i32 } %671, 1
  %675 = bitcast i32 %674 to <2 x bfloat>
  %676 = extractelement <2 x bfloat> %673, i32 0
  %677 = extractelement <2 x bfloat> %673, i32 1
  %678 = extractelement <2 x bfloat> %675, i32 0
  %679 = extractelement <2 x bfloat> %675, i32 1
  %680 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %676)
  %681 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %677)
  %682 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %678)
  %683 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %679)
  %684 = fmul float %665, %680
  %685 = fmul float %666, %681
  %686 = fmul float %667, %682
  %687 = fmul float %668, %683
  %688 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %684)
  %689 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %685)
  %690 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %686)
  %691 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %687)
  %692 = getelementptr bfloat, ptr addrspace(1) %7, i64 %61
  %693 = getelementptr bfloat, ptr addrspace(1) %692, i64 %46
  %694 = insertelement <2 x bfloat> undef, bfloat %688, i32 0
  %695 = insertelement <2 x bfloat> %694, bfloat %689, i32 1
  %696 = bitcast <2 x bfloat> %695 to i32
  %697 = insertelement <2 x bfloat> undef, bfloat %690, i32 0
  %698 = insertelement <2 x bfloat> %697, bfloat %691, i32 1
  %699 = bitcast <2 x bfloat> %698 to i32
  call void asm sideeffect "st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l"(i32 %696, i32 %699, ptr addrspace(1) %693)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_45_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_45(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(32768) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(98304) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6, ptr noalias align 128 dereferenceable(32768) %arg7) #6 {
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
  %99 = mul i64 %11, 3072
  %100 = getelementptr bfloat, ptr addrspace(1) %5, i64 %99
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
  %153 = getelementptr bfloat, ptr addrspace(1) %7, i64 %12
  %154 = getelementptr bfloat, ptr addrspace(1) %153, i64 %45
  %155 = getelementptr bfloat, ptr addrspace(1) %153, i64 %46
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
  %206 = add i64 %99, 1024
  %207 = getelementptr bfloat, ptr addrspace(1) %5, i64 %206
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
  %260 = getelementptr bfloat, ptr addrspace(1) %6, i64 %12
  %261 = getelementptr bfloat, ptr addrspace(1) %260, i64 %45
  %262 = getelementptr bfloat, ptr addrspace(1) %260, i64 %46
  %263 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %261)
  %264 = extractvalue { i32, i32, i32, i32 } %263, 0
  %265 = bitcast i32 %264 to <2 x bfloat>
  %266 = extractvalue { i32, i32, i32, i32 } %263, 1
  %267 = bitcast i32 %266 to <2 x bfloat>
  %268 = extractvalue { i32, i32, i32, i32 } %263, 2
  %269 = bitcast i32 %268 to <2 x bfloat>
  %270 = extractvalue { i32, i32, i32, i32 } %263, 3
  %271 = bitcast i32 %270 to <2 x bfloat>
  %272 = extractelement <2 x bfloat> %265, i32 0
  %273 = extractelement <2 x bfloat> %265, i32 1
  %274 = extractelement <2 x bfloat> %267, i32 0
  %275 = extractelement <2 x bfloat> %267, i32 1
  %276 = extractelement <2 x bfloat> %269, i32 0
  %277 = extractelement <2 x bfloat> %269, i32 1
  %278 = extractelement <2 x bfloat> %271, i32 0
  %279 = extractelement <2 x bfloat> %271, i32 1
  %280 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %262)
  %281 = extractvalue { i32, i32, i32, i32 } %280, 0
  %282 = bitcast i32 %281 to <2 x bfloat>
  %283 = extractvalue { i32, i32, i32, i32 } %280, 1
  %284 = bitcast i32 %283 to <2 x bfloat>
  %285 = extractvalue { i32, i32, i32, i32 } %280, 2
  %286 = bitcast i32 %285 to <2 x bfloat>
  %287 = extractvalue { i32, i32, i32, i32 } %280, 3
  %288 = bitcast i32 %287 to <2 x bfloat>
  %289 = extractelement <2 x bfloat> %282, i32 0
  %290 = extractelement <2 x bfloat> %282, i32 1
  %291 = extractelement <2 x bfloat> %284, i32 0
  %292 = extractelement <2 x bfloat> %284, i32 1
  %293 = extractelement <2 x bfloat> %286, i32 0
  %294 = extractelement <2 x bfloat> %286, i32 1
  %295 = extractelement <2 x bfloat> %288, i32 0
  %296 = extractelement <2 x bfloat> %288, i32 1
  %297 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %272)
  %298 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %273)
  %299 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %274)
  %300 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %275)
  %301 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %276)
  %302 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %277)
  %303 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %278)
  %304 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %279)
  %305 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %289)
  %306 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %290)
  %307 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %291)
  %308 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %292)
  %309 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %293)
  %310 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %294)
  %311 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295)
  %312 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296)
  %313 = add i64 %99, 2048
  %314 = getelementptr bfloat, ptr addrspace(1) %5, i64 %313
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
  %367 = getelementptr bfloat, ptr addrspace(1) %4, i64 %12
  %368 = getelementptr bfloat, ptr addrspace(1) %367, i64 %45
  %369 = getelementptr bfloat, ptr addrspace(1) %367, i64 %46
  %370 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %368)
  %371 = extractvalue { i32, i32, i32, i32 } %370, 0
  %372 = bitcast i32 %371 to <2 x bfloat>
  %373 = extractvalue { i32, i32, i32, i32 } %370, 1
  %374 = bitcast i32 %373 to <2 x bfloat>
  %375 = extractvalue { i32, i32, i32, i32 } %370, 2
  %376 = bitcast i32 %375 to <2 x bfloat>
  %377 = extractvalue { i32, i32, i32, i32 } %370, 3
  %378 = bitcast i32 %377 to <2 x bfloat>
  %379 = extractelement <2 x bfloat> %372, i32 0
  %380 = extractelement <2 x bfloat> %372, i32 1
  %381 = extractelement <2 x bfloat> %374, i32 0
  %382 = extractelement <2 x bfloat> %374, i32 1
  %383 = extractelement <2 x bfloat> %376, i32 0
  %384 = extractelement <2 x bfloat> %376, i32 1
  %385 = extractelement <2 x bfloat> %378, i32 0
  %386 = extractelement <2 x bfloat> %378, i32 1
  %387 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %369)
  %388 = extractvalue { i32, i32, i32, i32 } %387, 0
  %389 = bitcast i32 %388 to <2 x bfloat>
  %390 = extractvalue { i32, i32, i32, i32 } %387, 1
  %391 = bitcast i32 %390 to <2 x bfloat>
  %392 = extractvalue { i32, i32, i32, i32 } %387, 2
  %393 = bitcast i32 %392 to <2 x bfloat>
  %394 = extractvalue { i32, i32, i32, i32 } %387, 3
  %395 = bitcast i32 %394 to <2 x bfloat>
  %396 = extractelement <2 x bfloat> %389, i32 0
  %397 = extractelement <2 x bfloat> %389, i32 1
  %398 = extractelement <2 x bfloat> %391, i32 0
  %399 = extractelement <2 x bfloat> %391, i32 1
  %400 = extractelement <2 x bfloat> %393, i32 0
  %401 = extractelement <2 x bfloat> %393, i32 1
  %402 = extractelement <2 x bfloat> %395, i32 0
  %403 = extractelement <2 x bfloat> %395, i32 1
  %404 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %379)
  %405 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %380)
  %406 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %381)
  %407 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %382)
  %408 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %383)
  %409 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %384)
  %410 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %385)
  %411 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %386)
  %412 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %396)
  %413 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %397)
  %414 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %398)
  %415 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %399)
  %416 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %400)
  %417 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %401)
  %418 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %402)
  %419 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %403)
  %420 = fadd float %351, %404
  %421 = fadd float %352, %405
  %422 = fadd float %353, %406
  %423 = fadd float %354, %407
  %424 = fadd float %355, %408
  %425 = fadd float %356, %409
  %426 = fadd float %357, %410
  %427 = fadd float %358, %411
  %428 = fadd float %359, %412
  %429 = fadd float %360, %413
  %430 = fadd float %361, %414
  %431 = fadd float %362, %415
  %432 = fadd float %363, %416
  %433 = fadd float %364, %417
  %434 = fadd float %365, %418
  %435 = fadd float %366, %419
  %436 = fadd float %297, %420
  %437 = fadd float %298, %421
  %438 = fadd float %299, %422
  %439 = fadd float %300, %423
  %440 = fadd float %301, %424
  %441 = fadd float %302, %425
  %442 = fadd float %303, %426
  %443 = fadd float %304, %427
  %444 = fadd float %305, %428
  %445 = fadd float %306, %429
  %446 = fadd float %307, %430
  %447 = fadd float %308, %431
  %448 = fadd float %309, %432
  %449 = fadd float %310, %433
  %450 = fadd float %311, %434
  %451 = fadd float %312, %435
  %452 = fadd float %244, %436
  %453 = fadd float %245, %437
  %454 = fadd float %246, %438
  %455 = fadd float %247, %439
  %456 = fadd float %248, %440
  %457 = fadd float %249, %441
  %458 = fadd float %250, %442
  %459 = fadd float %251, %443
  %460 = fadd float %252, %444
  %461 = fadd float %253, %445
  %462 = fadd float %254, %446
  %463 = fadd float %255, %447
  %464 = fadd float %256, %448
  %465 = fadd float %257, %449
  %466 = fadd float %258, %450
  %467 = fadd float %259, %451
  %468 = fadd float %190, %452
  %469 = fadd float %191, %453
  %470 = fadd float %192, %454
  %471 = fadd float %193, %455
  %472 = fadd float %194, %456
  %473 = fadd float %195, %457
  %474 = fadd float %196, %458
  %475 = fadd float %197, %459
  %476 = fadd float %198, %460
  %477 = fadd float %199, %461
  %478 = fadd float %200, %462
  %479 = fadd float %201, %463
  %480 = fadd float %202, %464
  %481 = fadd float %203, %465
  %482 = fadd float %204, %466
  %483 = fadd float %205, %467
  %484 = fadd float %137, %468
  %485 = fadd float %138, %469
  %486 = fadd float %139, %470
  %487 = fadd float %140, %471
  %488 = fadd float %141, %472
  %489 = fadd float %142, %473
  %490 = fadd float %143, %474
  %491 = fadd float %144, %475
  %492 = fadd float %145, %476
  %493 = fadd float %146, %477
  %494 = fadd float %147, %478
  %495 = fadd float %148, %479
  %496 = fadd float %149, %480
  %497 = fadd float %150, %481
  %498 = fadd float %151, %482
  %499 = fadd float %152, %483
  %500 = fadd float %83, %484
  %501 = fadd float %84, %485
  %502 = fadd float %85, %486
  %503 = fadd float %86, %487
  %504 = fadd float %87, %488
  %505 = fadd float %88, %489
  %506 = fadd float %89, %490
  %507 = fadd float %90, %491
  %508 = fadd float %91, %492
  %509 = fadd float %92, %493
  %510 = fadd float %93, %494
  %511 = fadd float %94, %495
  %512 = fadd float %95, %496
  %513 = fadd float %96, %497
  %514 = fadd float %97, %498
  %515 = fadd float %98, %499
  %516 = fmul float %500, %500
  %517 = fmul float %501, %501
  %518 = fmul float %502, %502
  %519 = fmul float %503, %503
  %520 = fmul float %504, %504
  %521 = fmul float %505, %505
  %522 = fmul float %506, %506
  %523 = fmul float %507, %507
  %524 = fmul float %508, %508
  %525 = fmul float %509, %509
  %526 = fmul float %510, %510
  %527 = fmul float %511, %511
  %528 = fmul float %512, %512
  %529 = fmul float %513, %513
  %530 = fmul float %514, %514
  %531 = fmul float %515, %515
  %532 = fadd float %516, %517
  %533 = fadd float %532, %518
  %534 = fadd float %533, %519
  %535 = fadd float %534, %520
  %536 = fadd float %535, %521
  %537 = fadd float %536, %522
  %538 = fadd float %537, %523
  %539 = fadd float %538, %524
  %540 = fadd float %539, %525
  %541 = fadd float %540, %526
  %542 = fadd float %541, %527
  %543 = fadd float %542, %528
  %544 = fadd float %543, %529
  %545 = fadd float %544, %530
  %546 = fadd float %545, %531
  %547 = bitcast float %546 to i32
  %548 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %547, i32 16, i32 31)
  %549 = bitcast i32 %548 to float
  %550 = fadd float %546, %549
  %551 = bitcast float %550 to i32
  %552 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %551, i32 8, i32 31)
  %553 = bitcast i32 %552 to float
  %554 = fadd float %550, %553
  %555 = bitcast float %554 to i32
  %556 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %555, i32 4, i32 31)
  %557 = bitcast i32 %556 to float
  %558 = fadd float %554, %557
  %559 = bitcast float %558 to i32
  %560 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %559, i32 2, i32 31)
  %561 = bitcast i32 %560 to float
  %562 = fadd float %558, %561
  %563 = bitcast float %562 to i32
  %564 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %563, i32 1, i32 31)
  %565 = bitcast i32 %564 to float
  %566 = fadd float %562, %565
  %567 = urem i32 %15, 32
  %568 = urem i32 %16, 2
  %569 = icmp eq i32 %567, 0
  %570 = and i1 true, %569
  %571 = add i32 0, %568
  %572 = getelementptr float, ptr addrspace(3) @global_smem, i32 %571
  %573 = insertelement <1 x float> undef, float %566, i32 0
  %574 = extractelement <1 x float> %573, i32 0
  %575 = bitcast float %574 to i32
  %576 = insertelement <1 x i32> undef, i32 %575, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %572, <1 x i32> %576, i1 %570)
  call void @llvm.nvvm.barrier0()
  %577 = icmp slt i32 %14, 2
  %578 = getelementptr float, ptr addrspace(3) @global_smem, i32 %14
  %579 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %578, i1 %577)
  %580 = insertelement <1 x i32> undef, i32 %579, i32 0
  %581 = extractelement <1 x i32> %580, i32 0
  %582 = bitcast i32 %581 to float
  %583 = insertelement <1 x float> undef, float %582, i32 0
  %584 = extractelement <1 x float> %583, i32 0
  %585 = bitcast float %584 to i32
  %586 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %585, i32 1, i32 31)
  %587 = bitcast i32 %586 to float
  %588 = fadd float %584, %587
  %589 = urem i32 %15, 2
  %590 = icmp eq i32 %589, 0
  %591 = and i1 %577, %590
  %592 = insertelement <1 x float> undef, float %588, i32 0
  %593 = extractelement <1 x float> %592, i32 0
  %594 = bitcast float %593 to i32
  %595 = insertelement <1 x i32> undef, i32 %594, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %578, <1 x i32> %595, i1 %591)
  call void @llvm.nvvm.barrier0()
  %596 = load float, ptr addrspace(3) @global_smem, align 4
  %597 = fmul float %596, 0x3F50000000000000
  %598 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %599 = bitcast i32 %598 to <1 x float>
  %600 = extractelement <1 x float> %599, i32 0
  %601 = fadd float %597, %600
  %602 = call float @__nv_rsqrtf(float %601)
  %603 = fmul float %500, %602
  %604 = fmul float %501, %602
  %605 = fmul float %502, %602
  %606 = fmul float %503, %602
  %607 = fmul float %504, %602
  %608 = fmul float %505, %602
  %609 = fmul float %506, %602
  %610 = fmul float %507, %602
  %611 = fmul float %508, %602
  %612 = fmul float %509, %602
  %613 = fmul float %510, %602
  %614 = fmul float %511, %602
  %615 = fmul float %512, %602
  %616 = fmul float %513, %602
  %617 = fmul float %514, %602
  %618 = fmul float %515, %602
  %619 = getelementptr bfloat, ptr addrspace(1) %3, i64 %45
  %620 = getelementptr bfloat, ptr addrspace(1) %3, i64 %46
  %621 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %619)
  %622 = extractvalue { i32, i32, i32, i32 } %621, 0
  %623 = bitcast i32 %622 to <2 x bfloat>
  %624 = extractvalue { i32, i32, i32, i32 } %621, 1
  %625 = bitcast i32 %624 to <2 x bfloat>
  %626 = extractvalue { i32, i32, i32, i32 } %621, 2
  %627 = bitcast i32 %626 to <2 x bfloat>
  %628 = extractvalue { i32, i32, i32, i32 } %621, 3
  %629 = bitcast i32 %628 to <2 x bfloat>
  %630 = extractelement <2 x bfloat> %623, i32 0
  %631 = extractelement <2 x bfloat> %623, i32 1
  %632 = extractelement <2 x bfloat> %625, i32 0
  %633 = extractelement <2 x bfloat> %625, i32 1
  %634 = extractelement <2 x bfloat> %627, i32 0
  %635 = extractelement <2 x bfloat> %627, i32 1
  %636 = extractelement <2 x bfloat> %629, i32 0
  %637 = extractelement <2 x bfloat> %629, i32 1
  %638 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %620)
  %639 = extractvalue { i32, i32, i32, i32 } %638, 0
  %640 = bitcast i32 %639 to <2 x bfloat>
  %641 = extractvalue { i32, i32, i32, i32 } %638, 1
  %642 = bitcast i32 %641 to <2 x bfloat>
  %643 = extractvalue { i32, i32, i32, i32 } %638, 2
  %644 = bitcast i32 %643 to <2 x bfloat>
  %645 = extractvalue { i32, i32, i32, i32 } %638, 3
  %646 = bitcast i32 %645 to <2 x bfloat>
  %647 = extractelement <2 x bfloat> %640, i32 0
  %648 = extractelement <2 x bfloat> %640, i32 1
  %649 = extractelement <2 x bfloat> %642, i32 0
  %650 = extractelement <2 x bfloat> %642, i32 1
  %651 = extractelement <2 x bfloat> %644, i32 0
  %652 = extractelement <2 x bfloat> %644, i32 1
  %653 = extractelement <2 x bfloat> %646, i32 0
  %654 = extractelement <2 x bfloat> %646, i32 1
  %655 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %630)
  %656 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %631)
  %657 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %632)
  %658 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %633)
  %659 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %634)
  %660 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %635)
  %661 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %636)
  %662 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %637)
  %663 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %647)
  %664 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %648)
  %665 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %649)
  %666 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %650)
  %667 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %651)
  %668 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %652)
  %669 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %653)
  %670 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %654)
  %671 = fmul float %603, %655
  %672 = fmul float %604, %656
  %673 = fmul float %605, %657
  %674 = fmul float %606, %658
  %675 = fmul float %607, %659
  %676 = fmul float %608, %660
  %677 = fmul float %609, %661
  %678 = fmul float %610, %662
  %679 = fmul float %611, %663
  %680 = fmul float %612, %664
  %681 = fmul float %613, %665
  %682 = fmul float %614, %666
  %683 = fmul float %615, %667
  %684 = fmul float %616, %668
  %685 = fmul float %617, %669
  %686 = fmul float %618, %670
  %687 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %671)
  %688 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %672)
  %689 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %673)
  %690 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %674)
  %691 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %675)
  %692 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %676)
  %693 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %677)
  %694 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %678)
  %695 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %679)
  %696 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %680)
  %697 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %681)
  %698 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %682)
  %699 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %683)
  %700 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %684)
  %701 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %685)
  %702 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %686)
  %703 = getelementptr bfloat, ptr addrspace(1) %8, i64 %12
  %704 = getelementptr bfloat, ptr addrspace(1) %703, i64 %45
  %705 = getelementptr bfloat, ptr addrspace(1) %703, i64 %46
  %706 = insertelement <2 x bfloat> undef, bfloat %687, i32 0
  %707 = insertelement <2 x bfloat> %706, bfloat %688, i32 1
  %708 = bitcast <2 x bfloat> %707 to i32
  %709 = insertelement <2 x bfloat> undef, bfloat %689, i32 0
  %710 = insertelement <2 x bfloat> %709, bfloat %690, i32 1
  %711 = bitcast <2 x bfloat> %710 to i32
  %712 = insertelement <2 x bfloat> undef, bfloat %691, i32 0
  %713 = insertelement <2 x bfloat> %712, bfloat %692, i32 1
  %714 = bitcast <2 x bfloat> %713 to i32
  %715 = insertelement <2 x bfloat> undef, bfloat %693, i32 0
  %716 = insertelement <2 x bfloat> %715, bfloat %694, i32 1
  %717 = bitcast <2 x bfloat> %716 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %708, i32 %711, i32 %714, i32 %717, ptr addrspace(1) %704)
  %718 = insertelement <2 x bfloat> undef, bfloat %695, i32 0
  %719 = insertelement <2 x bfloat> %718, bfloat %696, i32 1
  %720 = bitcast <2 x bfloat> %719 to i32
  %721 = insertelement <2 x bfloat> undef, bfloat %697, i32 0
  %722 = insertelement <2 x bfloat> %721, bfloat %698, i32 1
  %723 = bitcast <2 x bfloat> %722 to i32
  %724 = insertelement <2 x bfloat> undef, bfloat %699, i32 0
  %725 = insertelement <2 x bfloat> %724, bfloat %700, i32 1
  %726 = bitcast <2 x bfloat> %725 to i32
  %727 = insertelement <2 x bfloat> undef, bfloat %701, i32 0
  %728 = insertelement <2 x bfloat> %727, bfloat %702, i32 1
  %729 = bitcast <2 x bfloat> %728 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %720, i32 %723, i32 %726, i32 %729, ptr addrspace(1) %705)
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

declare ptx_kernel void @triton_softmax_5_0_impl(ptr, ptr, ptr, ptr) #7

define ptx_kernel void @triton_softmax_5_0(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2) #8 {
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
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
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
  %21 = call float @fused_concatenate_convert_255_17(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %9)
  %22 = fmul float %20, %21
  %23 = add i32 %9, 64
  %24 = add i32 %14, 64
  %25 = getelementptr inbounds float, ptr %0, i32 %24
  %26 = load float, ptr %25, align 4, !invariant.load !2
  %27 = getelementptr inbounds bfloat, ptr %1, i32 %23
  %28 = load bfloat, ptr %27, align 2, !invariant.load !2
  %29 = fpext bfloat %28 to float
  %30 = fmul float %26, %29
  %31 = call float @fused_concatenate_convert_255_17(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %23)
  %32 = fmul float %30, %31
  %33 = fsub float %22, %32
  %34 = fptrunc float %33 to bfloat
  %35 = getelementptr inbounds bfloat, ptr %4, i32 %14
  store bfloat %34, ptr %35, align 2
  %36 = load float, ptr %25, align 4, !invariant.load !2
  %37 = load bfloat, ptr %27, align 2, !invariant.load !2
  %38 = fpext bfloat %37 to float
  %39 = fmul float %36, %38
  %40 = call float @fused_concatenate_convert_255_17(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %9)
  %41 = fmul float %39, %40
  %42 = load float, ptr %15, align 4, !invariant.load !2
  %43 = load bfloat, ptr %17, align 2, !invariant.load !2
  %44 = fpext bfloat %43 to float
  %45 = fmul float %42, %44
  %46 = call float @fused_concatenate_convert_255_17(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %23)
  %47 = fmul float %45, %46
  %48 = fadd float %41, %47
  %49 = fptrunc float %48 to bfloat
  %50 = getelementptr inbounds bfloat, ptr %4, i32 %24
  store bfloat %49, ptr %50, align 2
  ret void
}

define internal float @fused_concatenate_convert_255_17(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, i32 %4, i32 %5) {
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
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
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
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
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
!3 = !{i32 0, i32 384}
!4 = !{i32 0, i32 64}
!5 = !{i32 0, i32 135456}

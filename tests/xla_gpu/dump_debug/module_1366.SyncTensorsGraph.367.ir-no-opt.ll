; ModuleID = 'SyncTensorsGraph.367'
source_filename = "SyncTensorsGraph.367"
target datalayout = "e-p6:32:32-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@global_smem = external addrspace(3) global [0 x i8], align 16

define ptx_kernel void @loop_gather_fusion(ptr noalias align 16 dereferenceable(311164928) %0, ptr noalias align 16 dereferenceable(128) %1, ptr noalias align 128 dereferenceable(65536) %2) #0 {
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

declare ptx_kernel void @gemm_fusion_dot_11_0_impl(ptr, ptr, ptr, ptr, ptr) #2

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #3

define ptx_kernel void @gemm_fusion_dot_11_0(ptr noalias align 16 dereferenceable(4194304) %arg0, ptr noalias align 16 dereferenceable(4194304) %arg1, ptr noalias align 16 dereferenceable(4194304) %arg2, ptr noalias align 128 dereferenceable(196608) %arg3) #0 {
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
  %230 = phi i32 [ %1076, %237 ], [ 0, %0 ]
  %231 = phi i64 [ %1030, %237 ], [ 256, %0 ]
  %232 = phi { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } [ %1029, %237 ], [ zeroinitializer, %0 ]
  %233 = phi i32 [ %1033, %237 ], [ 2, %0 ]
  %234 = phi i32 [ %1067, %237 ], [ 0, %0 ]
  %235 = phi { ptr addrspace(3), i32, i32 } [ %1075, %237 ], [ { ptr addrspace(3) @global_smem, i32 0, i32 0 }, %0 ]
  %236 = icmp slt i32 %230, 2048
  br i1 %236, label %237, label %1077

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
  %250 = select i1 %38, i32 0, i32 2048
  %251 = xor i32 %249, %250
  %252 = getelementptr inbounds bfloat, ptr addrspace(3) %239, i32 %251
  %253 = ptrtoint ptr addrspace(3) %252 to i32
  %254 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %253)
  %255 = extractvalue { i32, i32, i32, i32 } %254, 0
  %256 = extractvalue { i32, i32, i32, i32 } %254, 1
  %257 = extractvalue { i32, i32, i32, i32 } %254, 2
  %258 = extractvalue { i32, i32, i32, i32 } %254, 3
  %259 = xor i32 16, %240
  %260 = xor i32 %259, %242
  %261 = xor i32 %260, %244
  %262 = xor i32 %261, %246
  %263 = xor i32 %262, %248
  %264 = xor i32 %263, %250
  %265 = getelementptr inbounds bfloat, ptr addrspace(3) %239, i32 %264
  %266 = ptrtoint ptr addrspace(3) %265 to i32
  %267 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %266)
  %268 = extractvalue { i32, i32, i32, i32 } %267, 0
  %269 = extractvalue { i32, i32, i32, i32 } %267, 1
  %270 = extractvalue { i32, i32, i32, i32 } %267, 2
  %271 = extractvalue { i32, i32, i32, i32 } %267, 3
  %272 = xor i32 32, %240
  %273 = xor i32 %272, %242
  %274 = xor i32 %273, %244
  %275 = xor i32 %274, %246
  %276 = xor i32 %275, %248
  %277 = xor i32 %276, %250
  %278 = getelementptr inbounds bfloat, ptr addrspace(3) %239, i32 %277
  %279 = ptrtoint ptr addrspace(3) %278 to i32
  %280 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %279)
  %281 = extractvalue { i32, i32, i32, i32 } %280, 0
  %282 = extractvalue { i32, i32, i32, i32 } %280, 1
  %283 = extractvalue { i32, i32, i32, i32 } %280, 2
  %284 = extractvalue { i32, i32, i32, i32 } %280, 3
  %285 = xor i32 48, %240
  %286 = xor i32 %285, %242
  %287 = xor i32 %286, %244
  %288 = xor i32 %287, %246
  %289 = xor i32 %288, %248
  %290 = xor i32 %289, %250
  %291 = getelementptr inbounds bfloat, ptr addrspace(3) %239, i32 %290
  %292 = ptrtoint ptr addrspace(3) %291 to i32
  %293 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %292)
  %294 = extractvalue { i32, i32, i32, i32 } %293, 0
  %295 = extractvalue { i32, i32, i32, i32 } %293, 1
  %296 = extractvalue { i32, i32, i32, i32 } %293, 2
  %297 = extractvalue { i32, i32, i32, i32 } %293, 3
  %298 = xor i32 64, %240
  %299 = xor i32 %298, %242
  %300 = xor i32 %299, %244
  %301 = xor i32 %300, %246
  %302 = xor i32 %301, %248
  %303 = xor i32 %302, %250
  %304 = getelementptr inbounds bfloat, ptr addrspace(3) %239, i32 %303
  %305 = ptrtoint ptr addrspace(3) %304 to i32
  %306 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %305)
  %307 = extractvalue { i32, i32, i32, i32 } %306, 0
  %308 = extractvalue { i32, i32, i32, i32 } %306, 1
  %309 = extractvalue { i32, i32, i32, i32 } %306, 2
  %310 = extractvalue { i32, i32, i32, i32 } %306, 3
  %311 = xor i32 80, %240
  %312 = xor i32 %311, %242
  %313 = xor i32 %312, %244
  %314 = xor i32 %313, %246
  %315 = xor i32 %314, %248
  %316 = xor i32 %315, %250
  %317 = getelementptr inbounds bfloat, ptr addrspace(3) %239, i32 %316
  %318 = ptrtoint ptr addrspace(3) %317 to i32
  %319 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %318)
  %320 = extractvalue { i32, i32, i32, i32 } %319, 0
  %321 = extractvalue { i32, i32, i32, i32 } %319, 1
  %322 = extractvalue { i32, i32, i32, i32 } %319, 2
  %323 = extractvalue { i32, i32, i32, i32 } %319, 3
  %324 = xor i32 96, %240
  %325 = xor i32 %324, %242
  %326 = xor i32 %325, %244
  %327 = xor i32 %326, %246
  %328 = xor i32 %327, %248
  %329 = xor i32 %328, %250
  %330 = getelementptr inbounds bfloat, ptr addrspace(3) %239, i32 %329
  %331 = ptrtoint ptr addrspace(3) %330 to i32
  %332 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %331)
  %333 = extractvalue { i32, i32, i32, i32 } %332, 0
  %334 = extractvalue { i32, i32, i32, i32 } %332, 1
  %335 = extractvalue { i32, i32, i32, i32 } %332, 2
  %336 = extractvalue { i32, i32, i32, i32 } %332, 3
  %337 = xor i32 112, %240
  %338 = xor i32 %337, %242
  %339 = xor i32 %338, %244
  %340 = xor i32 %339, %246
  %341 = xor i32 %340, %248
  %342 = xor i32 %341, %250
  %343 = getelementptr inbounds bfloat, ptr addrspace(3) %239, i32 %342
  %344 = ptrtoint ptr addrspace(3) %343 to i32
  %345 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %344)
  %346 = extractvalue { i32, i32, i32, i32 } %345, 0
  %347 = extractvalue { i32, i32, i32, i32 } %345, 1
  %348 = extractvalue { i32, i32, i32, i32 } %345, 2
  %349 = extractvalue { i32, i32, i32, i32 } %345, 3
  %350 = xor i32 4096, %240
  %351 = xor i32 %350, %242
  %352 = xor i32 %351, %244
  %353 = xor i32 %352, %246
  %354 = xor i32 %353, %248
  %355 = xor i32 %354, %250
  %356 = getelementptr inbounds bfloat, ptr addrspace(3) %239, i32 %355
  %357 = ptrtoint ptr addrspace(3) %356 to i32
  %358 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %357)
  %359 = extractvalue { i32, i32, i32, i32 } %358, 0
  %360 = extractvalue { i32, i32, i32, i32 } %358, 1
  %361 = extractvalue { i32, i32, i32, i32 } %358, 2
  %362 = extractvalue { i32, i32, i32, i32 } %358, 3
  %363 = xor i32 4112, %240
  %364 = xor i32 %363, %242
  %365 = xor i32 %364, %244
  %366 = xor i32 %365, %246
  %367 = xor i32 %366, %248
  %368 = xor i32 %367, %250
  %369 = getelementptr inbounds bfloat, ptr addrspace(3) %239, i32 %368
  %370 = ptrtoint ptr addrspace(3) %369 to i32
  %371 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %370)
  %372 = extractvalue { i32, i32, i32, i32 } %371, 0
  %373 = extractvalue { i32, i32, i32, i32 } %371, 1
  %374 = extractvalue { i32, i32, i32, i32 } %371, 2
  %375 = extractvalue { i32, i32, i32, i32 } %371, 3
  %376 = xor i32 4128, %240
  %377 = xor i32 %376, %242
  %378 = xor i32 %377, %244
  %379 = xor i32 %378, %246
  %380 = xor i32 %379, %248
  %381 = xor i32 %380, %250
  %382 = getelementptr inbounds bfloat, ptr addrspace(3) %239, i32 %381
  %383 = ptrtoint ptr addrspace(3) %382 to i32
  %384 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %383)
  %385 = extractvalue { i32, i32, i32, i32 } %384, 0
  %386 = extractvalue { i32, i32, i32, i32 } %384, 1
  %387 = extractvalue { i32, i32, i32, i32 } %384, 2
  %388 = extractvalue { i32, i32, i32, i32 } %384, 3
  %389 = xor i32 4144, %240
  %390 = xor i32 %389, %242
  %391 = xor i32 %390, %244
  %392 = xor i32 %391, %246
  %393 = xor i32 %392, %248
  %394 = xor i32 %393, %250
  %395 = getelementptr inbounds bfloat, ptr addrspace(3) %239, i32 %394
  %396 = ptrtoint ptr addrspace(3) %395 to i32
  %397 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %396)
  %398 = extractvalue { i32, i32, i32, i32 } %397, 0
  %399 = extractvalue { i32, i32, i32, i32 } %397, 1
  %400 = extractvalue { i32, i32, i32, i32 } %397, 2
  %401 = extractvalue { i32, i32, i32, i32 } %397, 3
  %402 = xor i32 4160, %240
  %403 = xor i32 %402, %242
  %404 = xor i32 %403, %244
  %405 = xor i32 %404, %246
  %406 = xor i32 %405, %248
  %407 = xor i32 %406, %250
  %408 = getelementptr inbounds bfloat, ptr addrspace(3) %239, i32 %407
  %409 = ptrtoint ptr addrspace(3) %408 to i32
  %410 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %409)
  %411 = extractvalue { i32, i32, i32, i32 } %410, 0
  %412 = extractvalue { i32, i32, i32, i32 } %410, 1
  %413 = extractvalue { i32, i32, i32, i32 } %410, 2
  %414 = extractvalue { i32, i32, i32, i32 } %410, 3
  %415 = xor i32 4176, %240
  %416 = xor i32 %415, %242
  %417 = xor i32 %416, %244
  %418 = xor i32 %417, %246
  %419 = xor i32 %418, %248
  %420 = xor i32 %419, %250
  %421 = getelementptr inbounds bfloat, ptr addrspace(3) %239, i32 %420
  %422 = ptrtoint ptr addrspace(3) %421 to i32
  %423 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %422)
  %424 = extractvalue { i32, i32, i32, i32 } %423, 0
  %425 = extractvalue { i32, i32, i32, i32 } %423, 1
  %426 = extractvalue { i32, i32, i32, i32 } %423, 2
  %427 = extractvalue { i32, i32, i32, i32 } %423, 3
  %428 = xor i32 4192, %240
  %429 = xor i32 %428, %242
  %430 = xor i32 %429, %244
  %431 = xor i32 %430, %246
  %432 = xor i32 %431, %248
  %433 = xor i32 %432, %250
  %434 = getelementptr inbounds bfloat, ptr addrspace(3) %239, i32 %433
  %435 = ptrtoint ptr addrspace(3) %434 to i32
  %436 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %435)
  %437 = extractvalue { i32, i32, i32, i32 } %436, 0
  %438 = extractvalue { i32, i32, i32, i32 } %436, 1
  %439 = extractvalue { i32, i32, i32, i32 } %436, 2
  %440 = extractvalue { i32, i32, i32, i32 } %436, 3
  %441 = xor i32 4208, %240
  %442 = xor i32 %441, %242
  %443 = xor i32 %442, %244
  %444 = xor i32 %443, %246
  %445 = xor i32 %444, %248
  %446 = xor i32 %445, %250
  %447 = getelementptr inbounds bfloat, ptr addrspace(3) %239, i32 %446
  %448 = ptrtoint ptr addrspace(3) %447 to i32
  %449 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %448)
  %450 = extractvalue { i32, i32, i32, i32 } %449, 0
  %451 = extractvalue { i32, i32, i32, i32 } %449, 1
  %452 = extractvalue { i32, i32, i32, i32 } %449, 2
  %453 = extractvalue { i32, i32, i32, i32 } %449, 3
  %454 = bitcast i32 %255 to <2 x bfloat>
  %455 = extractelement <2 x bfloat> %454, i32 0
  %456 = extractelement <2 x bfloat> %454, i32 1
  %457 = bitcast i32 %256 to <2 x bfloat>
  %458 = extractelement <2 x bfloat> %457, i32 0
  %459 = extractelement <2 x bfloat> %457, i32 1
  %460 = bitcast i32 %257 to <2 x bfloat>
  %461 = extractelement <2 x bfloat> %460, i32 0
  %462 = extractelement <2 x bfloat> %460, i32 1
  %463 = bitcast i32 %258 to <2 x bfloat>
  %464 = extractelement <2 x bfloat> %463, i32 0
  %465 = extractelement <2 x bfloat> %463, i32 1
  %466 = bitcast i32 %268 to <2 x bfloat>
  %467 = extractelement <2 x bfloat> %466, i32 0
  %468 = extractelement <2 x bfloat> %466, i32 1
  %469 = bitcast i32 %269 to <2 x bfloat>
  %470 = extractelement <2 x bfloat> %469, i32 0
  %471 = extractelement <2 x bfloat> %469, i32 1
  %472 = bitcast i32 %270 to <2 x bfloat>
  %473 = extractelement <2 x bfloat> %472, i32 0
  %474 = extractelement <2 x bfloat> %472, i32 1
  %475 = bitcast i32 %271 to <2 x bfloat>
  %476 = extractelement <2 x bfloat> %475, i32 0
  %477 = extractelement <2 x bfloat> %475, i32 1
  %478 = bitcast i32 %281 to <2 x bfloat>
  %479 = extractelement <2 x bfloat> %478, i32 0
  %480 = extractelement <2 x bfloat> %478, i32 1
  %481 = bitcast i32 %282 to <2 x bfloat>
  %482 = extractelement <2 x bfloat> %481, i32 0
  %483 = extractelement <2 x bfloat> %481, i32 1
  %484 = bitcast i32 %283 to <2 x bfloat>
  %485 = extractelement <2 x bfloat> %484, i32 0
  %486 = extractelement <2 x bfloat> %484, i32 1
  %487 = bitcast i32 %284 to <2 x bfloat>
  %488 = extractelement <2 x bfloat> %487, i32 0
  %489 = extractelement <2 x bfloat> %487, i32 1
  %490 = bitcast i32 %294 to <2 x bfloat>
  %491 = extractelement <2 x bfloat> %490, i32 0
  %492 = extractelement <2 x bfloat> %490, i32 1
  %493 = bitcast i32 %295 to <2 x bfloat>
  %494 = extractelement <2 x bfloat> %493, i32 0
  %495 = extractelement <2 x bfloat> %493, i32 1
  %496 = bitcast i32 %296 to <2 x bfloat>
  %497 = extractelement <2 x bfloat> %496, i32 0
  %498 = extractelement <2 x bfloat> %496, i32 1
  %499 = bitcast i32 %297 to <2 x bfloat>
  %500 = extractelement <2 x bfloat> %499, i32 0
  %501 = extractelement <2 x bfloat> %499, i32 1
  %502 = bitcast i32 %307 to <2 x bfloat>
  %503 = extractelement <2 x bfloat> %502, i32 0
  %504 = extractelement <2 x bfloat> %502, i32 1
  %505 = bitcast i32 %308 to <2 x bfloat>
  %506 = extractelement <2 x bfloat> %505, i32 0
  %507 = extractelement <2 x bfloat> %505, i32 1
  %508 = bitcast i32 %309 to <2 x bfloat>
  %509 = extractelement <2 x bfloat> %508, i32 0
  %510 = extractelement <2 x bfloat> %508, i32 1
  %511 = bitcast i32 %310 to <2 x bfloat>
  %512 = extractelement <2 x bfloat> %511, i32 0
  %513 = extractelement <2 x bfloat> %511, i32 1
  %514 = bitcast i32 %320 to <2 x bfloat>
  %515 = extractelement <2 x bfloat> %514, i32 0
  %516 = extractelement <2 x bfloat> %514, i32 1
  %517 = bitcast i32 %321 to <2 x bfloat>
  %518 = extractelement <2 x bfloat> %517, i32 0
  %519 = extractelement <2 x bfloat> %517, i32 1
  %520 = bitcast i32 %322 to <2 x bfloat>
  %521 = extractelement <2 x bfloat> %520, i32 0
  %522 = extractelement <2 x bfloat> %520, i32 1
  %523 = bitcast i32 %323 to <2 x bfloat>
  %524 = extractelement <2 x bfloat> %523, i32 0
  %525 = extractelement <2 x bfloat> %523, i32 1
  %526 = bitcast i32 %333 to <2 x bfloat>
  %527 = extractelement <2 x bfloat> %526, i32 0
  %528 = extractelement <2 x bfloat> %526, i32 1
  %529 = bitcast i32 %334 to <2 x bfloat>
  %530 = extractelement <2 x bfloat> %529, i32 0
  %531 = extractelement <2 x bfloat> %529, i32 1
  %532 = bitcast i32 %335 to <2 x bfloat>
  %533 = extractelement <2 x bfloat> %532, i32 0
  %534 = extractelement <2 x bfloat> %532, i32 1
  %535 = bitcast i32 %336 to <2 x bfloat>
  %536 = extractelement <2 x bfloat> %535, i32 0
  %537 = extractelement <2 x bfloat> %535, i32 1
  %538 = bitcast i32 %346 to <2 x bfloat>
  %539 = extractelement <2 x bfloat> %538, i32 0
  %540 = extractelement <2 x bfloat> %538, i32 1
  %541 = bitcast i32 %347 to <2 x bfloat>
  %542 = extractelement <2 x bfloat> %541, i32 0
  %543 = extractelement <2 x bfloat> %541, i32 1
  %544 = bitcast i32 %348 to <2 x bfloat>
  %545 = extractelement <2 x bfloat> %544, i32 0
  %546 = extractelement <2 x bfloat> %544, i32 1
  %547 = bitcast i32 %349 to <2 x bfloat>
  %548 = extractelement <2 x bfloat> %547, i32 0
  %549 = extractelement <2 x bfloat> %547, i32 1
  %550 = bitcast i32 %359 to <2 x bfloat>
  %551 = extractelement <2 x bfloat> %550, i32 0
  %552 = extractelement <2 x bfloat> %550, i32 1
  %553 = bitcast i32 %360 to <2 x bfloat>
  %554 = extractelement <2 x bfloat> %553, i32 0
  %555 = extractelement <2 x bfloat> %553, i32 1
  %556 = bitcast i32 %361 to <2 x bfloat>
  %557 = extractelement <2 x bfloat> %556, i32 0
  %558 = extractelement <2 x bfloat> %556, i32 1
  %559 = bitcast i32 %362 to <2 x bfloat>
  %560 = extractelement <2 x bfloat> %559, i32 0
  %561 = extractelement <2 x bfloat> %559, i32 1
  %562 = bitcast i32 %372 to <2 x bfloat>
  %563 = extractelement <2 x bfloat> %562, i32 0
  %564 = extractelement <2 x bfloat> %562, i32 1
  %565 = bitcast i32 %373 to <2 x bfloat>
  %566 = extractelement <2 x bfloat> %565, i32 0
  %567 = extractelement <2 x bfloat> %565, i32 1
  %568 = bitcast i32 %374 to <2 x bfloat>
  %569 = extractelement <2 x bfloat> %568, i32 0
  %570 = extractelement <2 x bfloat> %568, i32 1
  %571 = bitcast i32 %375 to <2 x bfloat>
  %572 = extractelement <2 x bfloat> %571, i32 0
  %573 = extractelement <2 x bfloat> %571, i32 1
  %574 = bitcast i32 %385 to <2 x bfloat>
  %575 = extractelement <2 x bfloat> %574, i32 0
  %576 = extractelement <2 x bfloat> %574, i32 1
  %577 = bitcast i32 %386 to <2 x bfloat>
  %578 = extractelement <2 x bfloat> %577, i32 0
  %579 = extractelement <2 x bfloat> %577, i32 1
  %580 = bitcast i32 %387 to <2 x bfloat>
  %581 = extractelement <2 x bfloat> %580, i32 0
  %582 = extractelement <2 x bfloat> %580, i32 1
  %583 = bitcast i32 %388 to <2 x bfloat>
  %584 = extractelement <2 x bfloat> %583, i32 0
  %585 = extractelement <2 x bfloat> %583, i32 1
  %586 = bitcast i32 %398 to <2 x bfloat>
  %587 = extractelement <2 x bfloat> %586, i32 0
  %588 = extractelement <2 x bfloat> %586, i32 1
  %589 = bitcast i32 %399 to <2 x bfloat>
  %590 = extractelement <2 x bfloat> %589, i32 0
  %591 = extractelement <2 x bfloat> %589, i32 1
  %592 = bitcast i32 %400 to <2 x bfloat>
  %593 = extractelement <2 x bfloat> %592, i32 0
  %594 = extractelement <2 x bfloat> %592, i32 1
  %595 = bitcast i32 %401 to <2 x bfloat>
  %596 = extractelement <2 x bfloat> %595, i32 0
  %597 = extractelement <2 x bfloat> %595, i32 1
  %598 = bitcast i32 %411 to <2 x bfloat>
  %599 = extractelement <2 x bfloat> %598, i32 0
  %600 = extractelement <2 x bfloat> %598, i32 1
  %601 = bitcast i32 %412 to <2 x bfloat>
  %602 = extractelement <2 x bfloat> %601, i32 0
  %603 = extractelement <2 x bfloat> %601, i32 1
  %604 = bitcast i32 %413 to <2 x bfloat>
  %605 = extractelement <2 x bfloat> %604, i32 0
  %606 = extractelement <2 x bfloat> %604, i32 1
  %607 = bitcast i32 %414 to <2 x bfloat>
  %608 = extractelement <2 x bfloat> %607, i32 0
  %609 = extractelement <2 x bfloat> %607, i32 1
  %610 = bitcast i32 %424 to <2 x bfloat>
  %611 = extractelement <2 x bfloat> %610, i32 0
  %612 = extractelement <2 x bfloat> %610, i32 1
  %613 = bitcast i32 %425 to <2 x bfloat>
  %614 = extractelement <2 x bfloat> %613, i32 0
  %615 = extractelement <2 x bfloat> %613, i32 1
  %616 = bitcast i32 %426 to <2 x bfloat>
  %617 = extractelement <2 x bfloat> %616, i32 0
  %618 = extractelement <2 x bfloat> %616, i32 1
  %619 = bitcast i32 %427 to <2 x bfloat>
  %620 = extractelement <2 x bfloat> %619, i32 0
  %621 = extractelement <2 x bfloat> %619, i32 1
  %622 = bitcast i32 %437 to <2 x bfloat>
  %623 = extractelement <2 x bfloat> %622, i32 0
  %624 = extractelement <2 x bfloat> %622, i32 1
  %625 = bitcast i32 %438 to <2 x bfloat>
  %626 = extractelement <2 x bfloat> %625, i32 0
  %627 = extractelement <2 x bfloat> %625, i32 1
  %628 = bitcast i32 %439 to <2 x bfloat>
  %629 = extractelement <2 x bfloat> %628, i32 0
  %630 = extractelement <2 x bfloat> %628, i32 1
  %631 = bitcast i32 %440 to <2 x bfloat>
  %632 = extractelement <2 x bfloat> %631, i32 0
  %633 = extractelement <2 x bfloat> %631, i32 1
  %634 = bitcast i32 %450 to <2 x bfloat>
  %635 = extractelement <2 x bfloat> %634, i32 0
  %636 = extractelement <2 x bfloat> %634, i32 1
  %637 = bitcast i32 %451 to <2 x bfloat>
  %638 = extractelement <2 x bfloat> %637, i32 0
  %639 = extractelement <2 x bfloat> %637, i32 1
  %640 = bitcast i32 %452 to <2 x bfloat>
  %641 = extractelement <2 x bfloat> %640, i32 0
  %642 = extractelement <2 x bfloat> %640, i32 1
  %643 = bitcast i32 %453 to <2 x bfloat>
  %644 = extractelement <2 x bfloat> %643, i32 0
  %645 = extractelement <2 x bfloat> %643, i32 1
  %646 = insertelement <2 x bfloat> undef, bfloat %455, i32 0
  %647 = insertelement <2 x bfloat> %646, bfloat %456, i32 1
  %648 = bitcast <2 x bfloat> %647 to i32
  %649 = insertelement <2 x bfloat> undef, bfloat %458, i32 0
  %650 = insertelement <2 x bfloat> %649, bfloat %459, i32 1
  %651 = bitcast <2 x bfloat> %650 to i32
  %652 = insertelement <2 x bfloat> undef, bfloat %461, i32 0
  %653 = insertelement <2 x bfloat> %652, bfloat %462, i32 1
  %654 = bitcast <2 x bfloat> %653 to i32
  %655 = insertelement <2 x bfloat> undef, bfloat %464, i32 0
  %656 = insertelement <2 x bfloat> %655, bfloat %465, i32 1
  %657 = bitcast <2 x bfloat> %656 to i32
  %658 = insertelement <2 x bfloat> undef, bfloat %467, i32 0
  %659 = insertelement <2 x bfloat> %658, bfloat %468, i32 1
  %660 = bitcast <2 x bfloat> %659 to i32
  %661 = insertelement <2 x bfloat> undef, bfloat %470, i32 0
  %662 = insertelement <2 x bfloat> %661, bfloat %471, i32 1
  %663 = bitcast <2 x bfloat> %662 to i32
  %664 = insertelement <2 x bfloat> undef, bfloat %473, i32 0
  %665 = insertelement <2 x bfloat> %664, bfloat %474, i32 1
  %666 = bitcast <2 x bfloat> %665 to i32
  %667 = insertelement <2 x bfloat> undef, bfloat %476, i32 0
  %668 = insertelement <2 x bfloat> %667, bfloat %477, i32 1
  %669 = bitcast <2 x bfloat> %668 to i32
  %670 = insertelement <2 x bfloat> undef, bfloat %479, i32 0
  %671 = insertelement <2 x bfloat> %670, bfloat %480, i32 1
  %672 = bitcast <2 x bfloat> %671 to i32
  %673 = insertelement <2 x bfloat> undef, bfloat %482, i32 0
  %674 = insertelement <2 x bfloat> %673, bfloat %483, i32 1
  %675 = bitcast <2 x bfloat> %674 to i32
  %676 = insertelement <2 x bfloat> undef, bfloat %485, i32 0
  %677 = insertelement <2 x bfloat> %676, bfloat %486, i32 1
  %678 = bitcast <2 x bfloat> %677 to i32
  %679 = insertelement <2 x bfloat> undef, bfloat %488, i32 0
  %680 = insertelement <2 x bfloat> %679, bfloat %489, i32 1
  %681 = bitcast <2 x bfloat> %680 to i32
  %682 = insertelement <2 x bfloat> undef, bfloat %491, i32 0
  %683 = insertelement <2 x bfloat> %682, bfloat %492, i32 1
  %684 = bitcast <2 x bfloat> %683 to i32
  %685 = insertelement <2 x bfloat> undef, bfloat %494, i32 0
  %686 = insertelement <2 x bfloat> %685, bfloat %495, i32 1
  %687 = bitcast <2 x bfloat> %686 to i32
  %688 = insertelement <2 x bfloat> undef, bfloat %497, i32 0
  %689 = insertelement <2 x bfloat> %688, bfloat %498, i32 1
  %690 = bitcast <2 x bfloat> %689 to i32
  %691 = insertelement <2 x bfloat> undef, bfloat %500, i32 0
  %692 = insertelement <2 x bfloat> %691, bfloat %501, i32 1
  %693 = bitcast <2 x bfloat> %692 to i32
  %694 = insertelement <2 x bfloat> undef, bfloat %503, i32 0
  %695 = insertelement <2 x bfloat> %694, bfloat %504, i32 1
  %696 = bitcast <2 x bfloat> %695 to i32
  %697 = insertelement <2 x bfloat> undef, bfloat %506, i32 0
  %698 = insertelement <2 x bfloat> %697, bfloat %507, i32 1
  %699 = bitcast <2 x bfloat> %698 to i32
  %700 = insertelement <2 x bfloat> undef, bfloat %509, i32 0
  %701 = insertelement <2 x bfloat> %700, bfloat %510, i32 1
  %702 = bitcast <2 x bfloat> %701 to i32
  %703 = insertelement <2 x bfloat> undef, bfloat %512, i32 0
  %704 = insertelement <2 x bfloat> %703, bfloat %513, i32 1
  %705 = bitcast <2 x bfloat> %704 to i32
  %706 = insertelement <2 x bfloat> undef, bfloat %515, i32 0
  %707 = insertelement <2 x bfloat> %706, bfloat %516, i32 1
  %708 = bitcast <2 x bfloat> %707 to i32
  %709 = insertelement <2 x bfloat> undef, bfloat %518, i32 0
  %710 = insertelement <2 x bfloat> %709, bfloat %519, i32 1
  %711 = bitcast <2 x bfloat> %710 to i32
  %712 = insertelement <2 x bfloat> undef, bfloat %521, i32 0
  %713 = insertelement <2 x bfloat> %712, bfloat %522, i32 1
  %714 = bitcast <2 x bfloat> %713 to i32
  %715 = insertelement <2 x bfloat> undef, bfloat %524, i32 0
  %716 = insertelement <2 x bfloat> %715, bfloat %525, i32 1
  %717 = bitcast <2 x bfloat> %716 to i32
  %718 = insertelement <2 x bfloat> undef, bfloat %527, i32 0
  %719 = insertelement <2 x bfloat> %718, bfloat %528, i32 1
  %720 = bitcast <2 x bfloat> %719 to i32
  %721 = insertelement <2 x bfloat> undef, bfloat %530, i32 0
  %722 = insertelement <2 x bfloat> %721, bfloat %531, i32 1
  %723 = bitcast <2 x bfloat> %722 to i32
  %724 = insertelement <2 x bfloat> undef, bfloat %533, i32 0
  %725 = insertelement <2 x bfloat> %724, bfloat %534, i32 1
  %726 = bitcast <2 x bfloat> %725 to i32
  %727 = insertelement <2 x bfloat> undef, bfloat %536, i32 0
  %728 = insertelement <2 x bfloat> %727, bfloat %537, i32 1
  %729 = bitcast <2 x bfloat> %728 to i32
  %730 = insertelement <2 x bfloat> undef, bfloat %539, i32 0
  %731 = insertelement <2 x bfloat> %730, bfloat %540, i32 1
  %732 = bitcast <2 x bfloat> %731 to i32
  %733 = insertelement <2 x bfloat> undef, bfloat %542, i32 0
  %734 = insertelement <2 x bfloat> %733, bfloat %543, i32 1
  %735 = bitcast <2 x bfloat> %734 to i32
  %736 = insertelement <2 x bfloat> undef, bfloat %545, i32 0
  %737 = insertelement <2 x bfloat> %736, bfloat %546, i32 1
  %738 = bitcast <2 x bfloat> %737 to i32
  %739 = insertelement <2 x bfloat> undef, bfloat %548, i32 0
  %740 = insertelement <2 x bfloat> %739, bfloat %549, i32 1
  %741 = bitcast <2 x bfloat> %740 to i32
  %742 = insertelement <2 x bfloat> undef, bfloat %551, i32 0
  %743 = insertelement <2 x bfloat> %742, bfloat %552, i32 1
  %744 = bitcast <2 x bfloat> %743 to i32
  %745 = insertelement <2 x bfloat> undef, bfloat %554, i32 0
  %746 = insertelement <2 x bfloat> %745, bfloat %555, i32 1
  %747 = bitcast <2 x bfloat> %746 to i32
  %748 = insertelement <2 x bfloat> undef, bfloat %557, i32 0
  %749 = insertelement <2 x bfloat> %748, bfloat %558, i32 1
  %750 = bitcast <2 x bfloat> %749 to i32
  %751 = insertelement <2 x bfloat> undef, bfloat %560, i32 0
  %752 = insertelement <2 x bfloat> %751, bfloat %561, i32 1
  %753 = bitcast <2 x bfloat> %752 to i32
  %754 = insertelement <2 x bfloat> undef, bfloat %563, i32 0
  %755 = insertelement <2 x bfloat> %754, bfloat %564, i32 1
  %756 = bitcast <2 x bfloat> %755 to i32
  %757 = insertelement <2 x bfloat> undef, bfloat %566, i32 0
  %758 = insertelement <2 x bfloat> %757, bfloat %567, i32 1
  %759 = bitcast <2 x bfloat> %758 to i32
  %760 = insertelement <2 x bfloat> undef, bfloat %569, i32 0
  %761 = insertelement <2 x bfloat> %760, bfloat %570, i32 1
  %762 = bitcast <2 x bfloat> %761 to i32
  %763 = insertelement <2 x bfloat> undef, bfloat %572, i32 0
  %764 = insertelement <2 x bfloat> %763, bfloat %573, i32 1
  %765 = bitcast <2 x bfloat> %764 to i32
  %766 = insertelement <2 x bfloat> undef, bfloat %575, i32 0
  %767 = insertelement <2 x bfloat> %766, bfloat %576, i32 1
  %768 = bitcast <2 x bfloat> %767 to i32
  %769 = insertelement <2 x bfloat> undef, bfloat %578, i32 0
  %770 = insertelement <2 x bfloat> %769, bfloat %579, i32 1
  %771 = bitcast <2 x bfloat> %770 to i32
  %772 = insertelement <2 x bfloat> undef, bfloat %581, i32 0
  %773 = insertelement <2 x bfloat> %772, bfloat %582, i32 1
  %774 = bitcast <2 x bfloat> %773 to i32
  %775 = insertelement <2 x bfloat> undef, bfloat %584, i32 0
  %776 = insertelement <2 x bfloat> %775, bfloat %585, i32 1
  %777 = bitcast <2 x bfloat> %776 to i32
  %778 = insertelement <2 x bfloat> undef, bfloat %587, i32 0
  %779 = insertelement <2 x bfloat> %778, bfloat %588, i32 1
  %780 = bitcast <2 x bfloat> %779 to i32
  %781 = insertelement <2 x bfloat> undef, bfloat %590, i32 0
  %782 = insertelement <2 x bfloat> %781, bfloat %591, i32 1
  %783 = bitcast <2 x bfloat> %782 to i32
  %784 = insertelement <2 x bfloat> undef, bfloat %593, i32 0
  %785 = insertelement <2 x bfloat> %784, bfloat %594, i32 1
  %786 = bitcast <2 x bfloat> %785 to i32
  %787 = insertelement <2 x bfloat> undef, bfloat %596, i32 0
  %788 = insertelement <2 x bfloat> %787, bfloat %597, i32 1
  %789 = bitcast <2 x bfloat> %788 to i32
  %790 = insertelement <2 x bfloat> undef, bfloat %599, i32 0
  %791 = insertelement <2 x bfloat> %790, bfloat %600, i32 1
  %792 = bitcast <2 x bfloat> %791 to i32
  %793 = insertelement <2 x bfloat> undef, bfloat %602, i32 0
  %794 = insertelement <2 x bfloat> %793, bfloat %603, i32 1
  %795 = bitcast <2 x bfloat> %794 to i32
  %796 = insertelement <2 x bfloat> undef, bfloat %605, i32 0
  %797 = insertelement <2 x bfloat> %796, bfloat %606, i32 1
  %798 = bitcast <2 x bfloat> %797 to i32
  %799 = insertelement <2 x bfloat> undef, bfloat %608, i32 0
  %800 = insertelement <2 x bfloat> %799, bfloat %609, i32 1
  %801 = bitcast <2 x bfloat> %800 to i32
  %802 = insertelement <2 x bfloat> undef, bfloat %611, i32 0
  %803 = insertelement <2 x bfloat> %802, bfloat %612, i32 1
  %804 = bitcast <2 x bfloat> %803 to i32
  %805 = insertelement <2 x bfloat> undef, bfloat %614, i32 0
  %806 = insertelement <2 x bfloat> %805, bfloat %615, i32 1
  %807 = bitcast <2 x bfloat> %806 to i32
  %808 = insertelement <2 x bfloat> undef, bfloat %617, i32 0
  %809 = insertelement <2 x bfloat> %808, bfloat %618, i32 1
  %810 = bitcast <2 x bfloat> %809 to i32
  %811 = insertelement <2 x bfloat> undef, bfloat %620, i32 0
  %812 = insertelement <2 x bfloat> %811, bfloat %621, i32 1
  %813 = bitcast <2 x bfloat> %812 to i32
  %814 = insertelement <2 x bfloat> undef, bfloat %623, i32 0
  %815 = insertelement <2 x bfloat> %814, bfloat %624, i32 1
  %816 = bitcast <2 x bfloat> %815 to i32
  %817 = insertelement <2 x bfloat> undef, bfloat %626, i32 0
  %818 = insertelement <2 x bfloat> %817, bfloat %627, i32 1
  %819 = bitcast <2 x bfloat> %818 to i32
  %820 = insertelement <2 x bfloat> undef, bfloat %629, i32 0
  %821 = insertelement <2 x bfloat> %820, bfloat %630, i32 1
  %822 = bitcast <2 x bfloat> %821 to i32
  %823 = insertelement <2 x bfloat> undef, bfloat %632, i32 0
  %824 = insertelement <2 x bfloat> %823, bfloat %633, i32 1
  %825 = bitcast <2 x bfloat> %824 to i32
  %826 = insertelement <2 x bfloat> undef, bfloat %635, i32 0
  %827 = insertelement <2 x bfloat> %826, bfloat %636, i32 1
  %828 = bitcast <2 x bfloat> %827 to i32
  %829 = insertelement <2 x bfloat> undef, bfloat %638, i32 0
  %830 = insertelement <2 x bfloat> %829, bfloat %639, i32 1
  %831 = bitcast <2 x bfloat> %830 to i32
  %832 = insertelement <2 x bfloat> undef, bfloat %641, i32 0
  %833 = insertelement <2 x bfloat> %832, bfloat %642, i32 1
  %834 = bitcast <2 x bfloat> %833 to i32
  %835 = insertelement <2 x bfloat> undef, bfloat %644, i32 0
  %836 = insertelement <2 x bfloat> %835, bfloat %645, i32 1
  %837 = bitcast <2 x bfloat> %836 to i32
  %838 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %232, 0
  %839 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %232, 1
  %840 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %232, 2
  %841 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %232, 3
  %842 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %232, 4
  %843 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %232, 5
  %844 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %232, 6
  %845 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %232, 7
  %846 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %232, 8
  %847 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %232, 9
  %848 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %232, 10
  %849 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %232, 11
  %850 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %232, 12
  %851 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %232, 13
  %852 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %232, 14
  %853 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %232, 15
  %854 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %838, float %839, float %840, float %841, i32 %648, i32 %651, i32 %654, i32 %657, i32 0, i32 0)
  %855 = extractvalue { float, float, float, float } %854, 0
  %856 = extractvalue { float, float, float, float } %854, 1
  %857 = extractvalue { float, float, float, float } %854, 2
  %858 = extractvalue { float, float, float, float } %854, 3
  %859 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %842, float %843, float %844, float %845, i32 %648, i32 %651, i32 %654, i32 %657, i32 0, i32 0)
  %860 = extractvalue { float, float, float, float } %859, 0
  %861 = extractvalue { float, float, float, float } %859, 1
  %862 = extractvalue { float, float, float, float } %859, 2
  %863 = extractvalue { float, float, float, float } %859, 3
  %864 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %846, float %847, float %848, float %849, i32 %744, i32 %747, i32 %750, i32 %753, i32 0, i32 0)
  %865 = extractvalue { float, float, float, float } %864, 0
  %866 = extractvalue { float, float, float, float } %864, 1
  %867 = extractvalue { float, float, float, float } %864, 2
  %868 = extractvalue { float, float, float, float } %864, 3
  %869 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %850, float %851, float %852, float %853, i32 %744, i32 %747, i32 %750, i32 %753, i32 0, i32 0)
  %870 = extractvalue { float, float, float, float } %869, 0
  %871 = extractvalue { float, float, float, float } %869, 1
  %872 = extractvalue { float, float, float, float } %869, 2
  %873 = extractvalue { float, float, float, float } %869, 3
  %874 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %855, float %856, float %857, float %858, i32 %660, i32 %663, i32 %666, i32 %669, i32 0, i32 0)
  %875 = extractvalue { float, float, float, float } %874, 0
  %876 = extractvalue { float, float, float, float } %874, 1
  %877 = extractvalue { float, float, float, float } %874, 2
  %878 = extractvalue { float, float, float, float } %874, 3
  %879 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %860, float %861, float %862, float %863, i32 %660, i32 %663, i32 %666, i32 %669, i32 0, i32 0)
  %880 = extractvalue { float, float, float, float } %879, 0
  %881 = extractvalue { float, float, float, float } %879, 1
  %882 = extractvalue { float, float, float, float } %879, 2
  %883 = extractvalue { float, float, float, float } %879, 3
  %884 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %865, float %866, float %867, float %868, i32 %756, i32 %759, i32 %762, i32 %765, i32 0, i32 0)
  %885 = extractvalue { float, float, float, float } %884, 0
  %886 = extractvalue { float, float, float, float } %884, 1
  %887 = extractvalue { float, float, float, float } %884, 2
  %888 = extractvalue { float, float, float, float } %884, 3
  %889 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %870, float %871, float %872, float %873, i32 %756, i32 %759, i32 %762, i32 %765, i32 0, i32 0)
  %890 = extractvalue { float, float, float, float } %889, 0
  %891 = extractvalue { float, float, float, float } %889, 1
  %892 = extractvalue { float, float, float, float } %889, 2
  %893 = extractvalue { float, float, float, float } %889, 3
  %894 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %875, float %876, float %877, float %878, i32 %672, i32 %675, i32 %678, i32 %681, i32 0, i32 0)
  %895 = extractvalue { float, float, float, float } %894, 0
  %896 = extractvalue { float, float, float, float } %894, 1
  %897 = extractvalue { float, float, float, float } %894, 2
  %898 = extractvalue { float, float, float, float } %894, 3
  %899 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %880, float %881, float %882, float %883, i32 %672, i32 %675, i32 %678, i32 %681, i32 0, i32 0)
  %900 = extractvalue { float, float, float, float } %899, 0
  %901 = extractvalue { float, float, float, float } %899, 1
  %902 = extractvalue { float, float, float, float } %899, 2
  %903 = extractvalue { float, float, float, float } %899, 3
  %904 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %885, float %886, float %887, float %888, i32 %768, i32 %771, i32 %774, i32 %777, i32 0, i32 0)
  %905 = extractvalue { float, float, float, float } %904, 0
  %906 = extractvalue { float, float, float, float } %904, 1
  %907 = extractvalue { float, float, float, float } %904, 2
  %908 = extractvalue { float, float, float, float } %904, 3
  %909 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %890, float %891, float %892, float %893, i32 %768, i32 %771, i32 %774, i32 %777, i32 0, i32 0)
  %910 = extractvalue { float, float, float, float } %909, 0
  %911 = extractvalue { float, float, float, float } %909, 1
  %912 = extractvalue { float, float, float, float } %909, 2
  %913 = extractvalue { float, float, float, float } %909, 3
  %914 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %895, float %896, float %897, float %898, i32 %684, i32 %687, i32 %690, i32 %693, i32 0, i32 0)
  %915 = extractvalue { float, float, float, float } %914, 0
  %916 = extractvalue { float, float, float, float } %914, 1
  %917 = extractvalue { float, float, float, float } %914, 2
  %918 = extractvalue { float, float, float, float } %914, 3
  %919 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %900, float %901, float %902, float %903, i32 %684, i32 %687, i32 %690, i32 %693, i32 0, i32 0)
  %920 = extractvalue { float, float, float, float } %919, 0
  %921 = extractvalue { float, float, float, float } %919, 1
  %922 = extractvalue { float, float, float, float } %919, 2
  %923 = extractvalue { float, float, float, float } %919, 3
  %924 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %905, float %906, float %907, float %908, i32 %780, i32 %783, i32 %786, i32 %789, i32 0, i32 0)
  %925 = extractvalue { float, float, float, float } %924, 0
  %926 = extractvalue { float, float, float, float } %924, 1
  %927 = extractvalue { float, float, float, float } %924, 2
  %928 = extractvalue { float, float, float, float } %924, 3
  %929 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %910, float %911, float %912, float %913, i32 %780, i32 %783, i32 %786, i32 %789, i32 0, i32 0)
  %930 = extractvalue { float, float, float, float } %929, 0
  %931 = extractvalue { float, float, float, float } %929, 1
  %932 = extractvalue { float, float, float, float } %929, 2
  %933 = extractvalue { float, float, float, float } %929, 3
  %934 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %915, float %916, float %917, float %918, i32 %696, i32 %699, i32 %702, i32 %705, i32 0, i32 0)
  %935 = extractvalue { float, float, float, float } %934, 0
  %936 = extractvalue { float, float, float, float } %934, 1
  %937 = extractvalue { float, float, float, float } %934, 2
  %938 = extractvalue { float, float, float, float } %934, 3
  %939 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %920, float %921, float %922, float %923, i32 %696, i32 %699, i32 %702, i32 %705, i32 0, i32 0)
  %940 = extractvalue { float, float, float, float } %939, 0
  %941 = extractvalue { float, float, float, float } %939, 1
  %942 = extractvalue { float, float, float, float } %939, 2
  %943 = extractvalue { float, float, float, float } %939, 3
  %944 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %925, float %926, float %927, float %928, i32 %792, i32 %795, i32 %798, i32 %801, i32 0, i32 0)
  %945 = extractvalue { float, float, float, float } %944, 0
  %946 = extractvalue { float, float, float, float } %944, 1
  %947 = extractvalue { float, float, float, float } %944, 2
  %948 = extractvalue { float, float, float, float } %944, 3
  %949 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %930, float %931, float %932, float %933, i32 %792, i32 %795, i32 %798, i32 %801, i32 0, i32 0)
  %950 = extractvalue { float, float, float, float } %949, 0
  %951 = extractvalue { float, float, float, float } %949, 1
  %952 = extractvalue { float, float, float, float } %949, 2
  %953 = extractvalue { float, float, float, float } %949, 3
  %954 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %935, float %936, float %937, float %938, i32 %708, i32 %711, i32 %714, i32 %717, i32 0, i32 0)
  %955 = extractvalue { float, float, float, float } %954, 0
  %956 = extractvalue { float, float, float, float } %954, 1
  %957 = extractvalue { float, float, float, float } %954, 2
  %958 = extractvalue { float, float, float, float } %954, 3
  %959 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %940, float %941, float %942, float %943, i32 %708, i32 %711, i32 %714, i32 %717, i32 0, i32 0)
  %960 = extractvalue { float, float, float, float } %959, 0
  %961 = extractvalue { float, float, float, float } %959, 1
  %962 = extractvalue { float, float, float, float } %959, 2
  %963 = extractvalue { float, float, float, float } %959, 3
  %964 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %945, float %946, float %947, float %948, i32 %804, i32 %807, i32 %810, i32 %813, i32 0, i32 0)
  %965 = extractvalue { float, float, float, float } %964, 0
  %966 = extractvalue { float, float, float, float } %964, 1
  %967 = extractvalue { float, float, float, float } %964, 2
  %968 = extractvalue { float, float, float, float } %964, 3
  %969 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %950, float %951, float %952, float %953, i32 %804, i32 %807, i32 %810, i32 %813, i32 0, i32 0)
  %970 = extractvalue { float, float, float, float } %969, 0
  %971 = extractvalue { float, float, float, float } %969, 1
  %972 = extractvalue { float, float, float, float } %969, 2
  %973 = extractvalue { float, float, float, float } %969, 3
  %974 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %955, float %956, float %957, float %958, i32 %720, i32 %723, i32 %726, i32 %729, i32 0, i32 0)
  %975 = extractvalue { float, float, float, float } %974, 0
  %976 = extractvalue { float, float, float, float } %974, 1
  %977 = extractvalue { float, float, float, float } %974, 2
  %978 = extractvalue { float, float, float, float } %974, 3
  %979 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %960, float %961, float %962, float %963, i32 %720, i32 %723, i32 %726, i32 %729, i32 0, i32 0)
  %980 = extractvalue { float, float, float, float } %979, 0
  %981 = extractvalue { float, float, float, float } %979, 1
  %982 = extractvalue { float, float, float, float } %979, 2
  %983 = extractvalue { float, float, float, float } %979, 3
  %984 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %965, float %966, float %967, float %968, i32 %816, i32 %819, i32 %822, i32 %825, i32 0, i32 0)
  %985 = extractvalue { float, float, float, float } %984, 0
  %986 = extractvalue { float, float, float, float } %984, 1
  %987 = extractvalue { float, float, float, float } %984, 2
  %988 = extractvalue { float, float, float, float } %984, 3
  %989 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %970, float %971, float %972, float %973, i32 %816, i32 %819, i32 %822, i32 %825, i32 0, i32 0)
  %990 = extractvalue { float, float, float, float } %989, 0
  %991 = extractvalue { float, float, float, float } %989, 1
  %992 = extractvalue { float, float, float, float } %989, 2
  %993 = extractvalue { float, float, float, float } %989, 3
  %994 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %975, float %976, float %977, float %978, i32 %732, i32 %735, i32 %738, i32 %741, i32 0, i32 0)
  %995 = extractvalue { float, float, float, float } %994, 0
  %996 = extractvalue { float, float, float, float } %994, 1
  %997 = extractvalue { float, float, float, float } %994, 2
  %998 = extractvalue { float, float, float, float } %994, 3
  %999 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %980, float %981, float %982, float %983, i32 %732, i32 %735, i32 %738, i32 %741, i32 0, i32 0)
  %1000 = extractvalue { float, float, float, float } %999, 0
  %1001 = extractvalue { float, float, float, float } %999, 1
  %1002 = extractvalue { float, float, float, float } %999, 2
  %1003 = extractvalue { float, float, float, float } %999, 3
  %1004 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %985, float %986, float %987, float %988, i32 %828, i32 %831, i32 %834, i32 %837, i32 0, i32 0)
  %1005 = extractvalue { float, float, float, float } %1004, 0
  %1006 = extractvalue { float, float, float, float } %1004, 1
  %1007 = extractvalue { float, float, float, float } %1004, 2
  %1008 = extractvalue { float, float, float, float } %1004, 3
  %1009 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %990, float %991, float %992, float %993, i32 %828, i32 %831, i32 %834, i32 %837, i32 0, i32 0)
  %1010 = extractvalue { float, float, float, float } %1009, 0
  %1011 = extractvalue { float, float, float, float } %1009, 1
  %1012 = extractvalue { float, float, float, float } %1009, 2
  %1013 = extractvalue { float, float, float, float } %1009, 3
  %1014 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } undef, float %995, 0
  %1015 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1014, float %996, 1
  %1016 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1015, float %997, 2
  %1017 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1016, float %998, 3
  %1018 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1017, float %1000, 4
  %1019 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1018, float %1001, 5
  %1020 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1019, float %1002, 6
  %1021 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1020, float %1003, 7
  %1022 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1021, float %1005, 8
  %1023 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1022, float %1006, 9
  %1024 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1023, float %1007, 10
  %1025 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1024, float %1008, 11
  %1026 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1025, float %1010, 12
  %1027 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1026, float %1011, 13
  %1028 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1027, float %1012, 14
  %1029 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1028, float %1013, 15
  %1030 = add i64 %231, 128
  %1031 = add i32 %233, 1
  %1032 = icmp slt i32 %1031, 3
  %1033 = select i1 %1032, i32 %1031, i32 0
  %1034 = add i64 %1030, %99
  %1035 = add i64 %73, %1034
  %1036 = add i64 %74, %1034
  %1037 = add i64 %75, %1034
  %1038 = add i64 %76, %1034
  %1039 = add i64 %77, %1034
  %1040 = add i64 %78, %1034
  %1041 = add i64 %79, %1034
  %1042 = add i64 %80, %1034
  %1043 = getelementptr bfloat, ptr addrspace(1) %20, i64 %1035
  %1044 = getelementptr bfloat, ptr addrspace(1) %20, i64 %1036
  %1045 = getelementptr bfloat, ptr addrspace(1) %20, i64 %1037
  %1046 = getelementptr bfloat, ptr addrspace(1) %20, i64 %1038
  %1047 = getelementptr bfloat, ptr addrspace(1) %20, i64 %1039
  %1048 = getelementptr bfloat, ptr addrspace(1) %20, i64 %1040
  %1049 = getelementptr bfloat, ptr addrspace(1) %20, i64 %1041
  %1050 = getelementptr bfloat, ptr addrspace(1) %20, i64 %1042
  %1051 = mul i32 %1033, 8192
  %1052 = add i32 %1051, 0
  %1053 = add i32 %1052, 0
  %1054 = add i32 %1053, 0
  %1055 = getelementptr bfloat, ptr addrspace(3) @global_smem, i32 %1054
  call void @llvm.nvvm.barrier0()
  %1056 = getelementptr inbounds bfloat, ptr addrspace(3) %1055, i32 %121
  %1057 = getelementptr inbounds bfloat, ptr addrspace(3) %1055, i32 %129
  %1058 = getelementptr inbounds bfloat, ptr addrspace(3) %1055, i32 %137
  %1059 = getelementptr inbounds bfloat, ptr addrspace(3) %1055, i32 %145
  %1060 = getelementptr inbounds bfloat, ptr addrspace(3) %1055, i32 %153
  %1061 = getelementptr inbounds bfloat, ptr addrspace(3) %1055, i32 %161
  %1062 = getelementptr inbounds bfloat, ptr addrspace(3) %1055, i32 %169
  %1063 = getelementptr inbounds bfloat, ptr addrspace(3) %1055, i32 %177
  %1064 = select i1 %238, i32 16, i32 0
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1056, ptr addrspace(1) %1043, i32 %1064)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1057, ptr addrspace(1) %1044, i32 %1064)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1058, ptr addrspace(1) %1045, i32 %1064)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1059, ptr addrspace(1) %1046, i32 %1064)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1060, ptr addrspace(1) %1047, i32 %1064)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1061, ptr addrspace(1) %1048, i32 %1064)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1062, ptr addrspace(1) %1049, i32 %1064)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1063, ptr addrspace(1) %1050, i32 %1064)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  %1065 = add i32 %234, 1
  %1066 = icmp slt i32 %1065, 3
  %1067 = select i1 %1066, i32 %1065, i32 0
  call void asm sideeffect "cp.async.wait_group 0x2;", ""()
  call void @llvm.nvvm.barrier0()
  %1068 = mul i32 %1067, 8192
  %1069 = add i32 %1068, 0
  %1070 = add i32 %1069, 0
  %1071 = add i32 %1070, 0
  %1072 = getelementptr bfloat, ptr addrspace(3) @global_smem, i32 %1071
  %1073 = insertvalue { ptr addrspace(3), i32, i32 } undef, ptr addrspace(3) %1072, 0
  %1074 = insertvalue { ptr addrspace(3), i32, i32 } %1073, i32 0, 1
  %1075 = insertvalue { ptr addrspace(3), i32, i32 } %1074, i32 0, 2
  %1076 = add i32 %230, 128
  br label %229

1077:                                             ; preds = %229
  call void asm sideeffect "cp.async.wait_group 0x0;", ""()
  call void @llvm.nvvm.barrier0()
  %1078 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %232, 0
  %1079 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %232, 1
  %1080 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %232, 2
  %1081 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %232, 3
  %1082 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %232, 4
  %1083 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %232, 5
  %1084 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %232, 6
  %1085 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %232, 7
  %1086 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %232, 8
  %1087 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %232, 9
  %1088 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %232, 10
  %1089 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %232, 11
  %1090 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %232, 12
  %1091 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %232, 13
  %1092 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %232, 14
  %1093 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %232, 15
  %1094 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1078)
  %1095 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1079)
  %1096 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1080)
  %1097 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1081)
  %1098 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1082)
  %1099 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1083)
  %1100 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1084)
  %1101 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1085)
  %1102 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1086)
  %1103 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1087)
  %1104 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1088)
  %1105 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1089)
  %1106 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1090)
  %1107 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1091)
  %1108 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1092)
  %1109 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1093)
  %1110 = mul i32 %15, 32
  %1111 = sext i32 %16 to i64
  %1112 = sext i32 %1110 to i64
  %1113 = xor i32 %92, 0
  %1114 = add i32 %1113, 0
  %1115 = sext i32 %1114 to i64
  %1116 = add i64 %1111, %1115
  %1117 = select i1 %94, i32 0, i32 1
  %1118 = xor i32 0, %1117
  %1119 = select i1 %30, i32 0, i32 2
  %1120 = xor i32 %1118, %1119
  %1121 = select i1 %34, i32 0, i32 4
  %1122 = xor i32 %1120, %1121
  %1123 = select i1 %38, i32 0, i32 8
  %1124 = xor i32 %1122, %1123
  %1125 = xor i32 %1124, 0
  %1126 = xor i32 %1124, 16
  %1127 = add i32 %1125, 0
  %1128 = add i32 %1126, 0
  %1129 = sext i32 %1127 to i64
  %1130 = sext i32 %1128 to i64
  %1131 = add i64 %1112, %1129
  %1132 = add i64 %1112, %1130
  %1133 = mul i64 %1131, 3072
  %1134 = mul i64 %1132, 3072
  %1135 = add i64 %1116, %1133
  %1136 = add i64 %1116, %1134
  %1137 = getelementptr bfloat, ptr addrspace(1) %4, i64 %1135
  %1138 = getelementptr bfloat, ptr addrspace(1) %4, i64 %1136
  %1139 = select i1 %82, i32 0, i32 128
  %1140 = xor i32 0, %1139
  %1141 = select i1 %86, i32 0, i32 256
  %1142 = xor i32 %1140, %1141
  %1143 = select i1 %90, i32 0, i32 1
  %1144 = xor i32 %1142, %1143
  %1145 = select i1 %94, i32 0, i32 2
  %1146 = xor i32 %1144, %1145
  %1147 = select i1 %30, i32 0, i32 4
  %1148 = xor i32 %1146, %1147
  %1149 = select i1 %34, i32 0, i32 512
  %1150 = xor i32 %1148, %1149
  %1151 = select i1 %38, i32 0, i32 16
  %1152 = xor i32 %1150, %1151
  %1153 = select i1 %30, i32 0, i32 128
  %1154 = xor i32 %96, %1153
  %1155 = select i1 %34, i32 0, i32 256
  %1156 = xor i32 %1154, %1155
  %1157 = select i1 %38, i32 0, i32 512
  %1158 = xor i32 %1156, %1157
  %1159 = xor i32 %1152, 0
  %1160 = lshr i32 %1159, 6
  %1161 = shl i32 %1160, 3
  %1162 = add i32 %1161, %1159
  %1163 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1162
  %1164 = insertelement <1 x bfloat> undef, bfloat %1094, i32 0
  %1165 = extractelement <1 x bfloat> %1164, i32 0
  %1166 = bitcast bfloat %1165 to i16
  %1167 = insertelement <1 x i16> undef, i16 %1166, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1163, <1 x i16> %1167, i1 true)
  %1168 = xor i32 %1152, 64
  %1169 = lshr i32 %1168, 6
  %1170 = shl i32 %1169, 3
  %1171 = add i32 %1170, %1168
  %1172 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1171
  %1173 = insertelement <1 x bfloat> undef, bfloat %1095, i32 0
  %1174 = extractelement <1 x bfloat> %1173, i32 0
  %1175 = bitcast bfloat %1174 to i16
  %1176 = insertelement <1 x i16> undef, i16 %1175, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1172, <1 x i16> %1176, i1 true)
  %1177 = xor i32 %1152, 8
  %1178 = lshr i32 %1177, 6
  %1179 = shl i32 %1178, 3
  %1180 = add i32 %1179, %1177
  %1181 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1180
  %1182 = insertelement <1 x bfloat> undef, bfloat %1096, i32 0
  %1183 = extractelement <1 x bfloat> %1182, i32 0
  %1184 = bitcast bfloat %1183 to i16
  %1185 = insertelement <1 x i16> undef, i16 %1184, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1181, <1 x i16> %1185, i1 true)
  %1186 = xor i32 %1152, 72
  %1187 = lshr i32 %1186, 6
  %1188 = shl i32 %1187, 3
  %1189 = add i32 %1188, %1186
  %1190 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1189
  %1191 = insertelement <1 x bfloat> undef, bfloat %1097, i32 0
  %1192 = extractelement <1 x bfloat> %1191, i32 0
  %1193 = bitcast bfloat %1192 to i16
  %1194 = insertelement <1 x i16> undef, i16 %1193, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1190, <1 x i16> %1194, i1 true)
  %1195 = xor i32 %1152, 32
  %1196 = lshr i32 %1195, 6
  %1197 = shl i32 %1196, 3
  %1198 = add i32 %1197, %1195
  %1199 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1198
  %1200 = insertelement <1 x bfloat> undef, bfloat %1102, i32 0
  %1201 = extractelement <1 x bfloat> %1200, i32 0
  %1202 = bitcast bfloat %1201 to i16
  %1203 = insertelement <1 x i16> undef, i16 %1202, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1199, <1 x i16> %1203, i1 true)
  %1204 = xor i32 %1152, 96
  %1205 = lshr i32 %1204, 6
  %1206 = shl i32 %1205, 3
  %1207 = add i32 %1206, %1204
  %1208 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1207
  %1209 = insertelement <1 x bfloat> undef, bfloat %1103, i32 0
  %1210 = extractelement <1 x bfloat> %1209, i32 0
  %1211 = bitcast bfloat %1210 to i16
  %1212 = insertelement <1 x i16> undef, i16 %1211, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1208, <1 x i16> %1212, i1 true)
  %1213 = xor i32 %1152, 40
  %1214 = lshr i32 %1213, 6
  %1215 = shl i32 %1214, 3
  %1216 = add i32 %1215, %1213
  %1217 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1216
  %1218 = insertelement <1 x bfloat> undef, bfloat %1104, i32 0
  %1219 = extractelement <1 x bfloat> %1218, i32 0
  %1220 = bitcast bfloat %1219 to i16
  %1221 = insertelement <1 x i16> undef, i16 %1220, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1217, <1 x i16> %1221, i1 true)
  %1222 = xor i32 %1152, 104
  %1223 = lshr i32 %1222, 6
  %1224 = shl i32 %1223, 3
  %1225 = add i32 %1224, %1222
  %1226 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1225
  %1227 = insertelement <1 x bfloat> undef, bfloat %1105, i32 0
  %1228 = extractelement <1 x bfloat> %1227, i32 0
  %1229 = bitcast bfloat %1228 to i16
  %1230 = insertelement <1 x i16> undef, i16 %1229, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1226, <1 x i16> %1230, i1 true)
  call void @llvm.nvvm.barrier0()
  %1231 = xor i32 %1158, 0
  %1232 = lshr i32 %1231, 6
  %1233 = shl i32 %1232, 3
  %1234 = add i32 %1233, %1231
  %1235 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1234
  %1236 = load <4 x i32>, ptr addrspace(3) %1235, align 16
  %1237 = extractelement <4 x i32> %1236, i32 0
  %1238 = extractelement <4 x i32> %1236, i32 1
  %1239 = extractelement <4 x i32> %1236, i32 2
  %1240 = extractelement <4 x i32> %1236, i32 3
  %1241 = insertelement <4 x i32> undef, i32 %1237, i32 0
  %1242 = insertelement <4 x i32> %1241, i32 %1238, i32 1
  %1243 = insertelement <4 x i32> %1242, i32 %1239, i32 2
  %1244 = insertelement <4 x i32> %1243, i32 %1240, i32 3
  %1245 = extractelement <4 x i32> %1244, i32 0
  %1246 = extractelement <4 x i32> %1244, i32 1
  %1247 = extractelement <4 x i32> %1244, i32 2
  %1248 = extractelement <4 x i32> %1244, i32 3
  %1249 = bitcast i32 %1245 to <2 x i16>
  %1250 = extractelement <2 x i16> %1249, i32 0
  %1251 = extractelement <2 x i16> %1249, i32 1
  %1252 = bitcast i32 %1246 to <2 x i16>
  %1253 = extractelement <2 x i16> %1252, i32 0
  %1254 = extractelement <2 x i16> %1252, i32 1
  %1255 = bitcast i32 %1247 to <2 x i16>
  %1256 = extractelement <2 x i16> %1255, i32 0
  %1257 = extractelement <2 x i16> %1255, i32 1
  %1258 = bitcast i32 %1248 to <2 x i16>
  %1259 = extractelement <2 x i16> %1258, i32 0
  %1260 = extractelement <2 x i16> %1258, i32 1
  %1261 = insertelement <8 x i16> undef, i16 %1250, i32 0
  %1262 = insertelement <8 x i16> %1261, i16 %1251, i32 1
  %1263 = insertelement <8 x i16> %1262, i16 %1253, i32 2
  %1264 = insertelement <8 x i16> %1263, i16 %1254, i32 3
  %1265 = insertelement <8 x i16> %1264, i16 %1256, i32 4
  %1266 = insertelement <8 x i16> %1265, i16 %1257, i32 5
  %1267 = insertelement <8 x i16> %1266, i16 %1259, i32 6
  %1268 = insertelement <8 x i16> %1267, i16 %1260, i32 7
  %1269 = extractelement <8 x i16> %1268, i32 0
  %1270 = extractelement <8 x i16> %1268, i32 1
  %1271 = extractelement <8 x i16> %1268, i32 2
  %1272 = extractelement <8 x i16> %1268, i32 3
  %1273 = extractelement <8 x i16> %1268, i32 4
  %1274 = extractelement <8 x i16> %1268, i32 5
  %1275 = extractelement <8 x i16> %1268, i32 6
  %1276 = extractelement <8 x i16> %1268, i32 7
  %1277 = bitcast i16 %1269 to bfloat
  %1278 = bitcast i16 %1270 to bfloat
  %1279 = bitcast i16 %1271 to bfloat
  %1280 = bitcast i16 %1272 to bfloat
  %1281 = bitcast i16 %1273 to bfloat
  %1282 = bitcast i16 %1274 to bfloat
  %1283 = bitcast i16 %1275 to bfloat
  %1284 = bitcast i16 %1276 to bfloat
  %1285 = insertelement <8 x bfloat> undef, bfloat %1277, i32 0
  %1286 = insertelement <8 x bfloat> %1285, bfloat %1278, i32 1
  %1287 = insertelement <8 x bfloat> %1286, bfloat %1279, i32 2
  %1288 = insertelement <8 x bfloat> %1287, bfloat %1280, i32 3
  %1289 = insertelement <8 x bfloat> %1288, bfloat %1281, i32 4
  %1290 = insertelement <8 x bfloat> %1289, bfloat %1282, i32 5
  %1291 = insertelement <8 x bfloat> %1290, bfloat %1283, i32 6
  %1292 = insertelement <8 x bfloat> %1291, bfloat %1284, i32 7
  %1293 = extractelement <8 x bfloat> %1292, i32 0
  %1294 = extractelement <8 x bfloat> %1292, i32 1
  %1295 = extractelement <8 x bfloat> %1292, i32 2
  %1296 = extractelement <8 x bfloat> %1292, i32 3
  %1297 = extractelement <8 x bfloat> %1292, i32 4
  %1298 = extractelement <8 x bfloat> %1292, i32 5
  %1299 = extractelement <8 x bfloat> %1292, i32 6
  %1300 = extractelement <8 x bfloat> %1292, i32 7
  call void @llvm.nvvm.barrier0()
  %1301 = insertelement <1 x bfloat> undef, bfloat %1098, i32 0
  %1302 = extractelement <1 x bfloat> %1301, i32 0
  %1303 = bitcast bfloat %1302 to i16
  %1304 = insertelement <1 x i16> undef, i16 %1303, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1163, <1 x i16> %1304, i1 true)
  %1305 = insertelement <1 x bfloat> undef, bfloat %1099, i32 0
  %1306 = extractelement <1 x bfloat> %1305, i32 0
  %1307 = bitcast bfloat %1306 to i16
  %1308 = insertelement <1 x i16> undef, i16 %1307, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1172, <1 x i16> %1308, i1 true)
  %1309 = insertelement <1 x bfloat> undef, bfloat %1100, i32 0
  %1310 = extractelement <1 x bfloat> %1309, i32 0
  %1311 = bitcast bfloat %1310 to i16
  %1312 = insertelement <1 x i16> undef, i16 %1311, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1181, <1 x i16> %1312, i1 true)
  %1313 = insertelement <1 x bfloat> undef, bfloat %1101, i32 0
  %1314 = extractelement <1 x bfloat> %1313, i32 0
  %1315 = bitcast bfloat %1314 to i16
  %1316 = insertelement <1 x i16> undef, i16 %1315, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1190, <1 x i16> %1316, i1 true)
  %1317 = insertelement <1 x bfloat> undef, bfloat %1106, i32 0
  %1318 = extractelement <1 x bfloat> %1317, i32 0
  %1319 = bitcast bfloat %1318 to i16
  %1320 = insertelement <1 x i16> undef, i16 %1319, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1199, <1 x i16> %1320, i1 true)
  %1321 = insertelement <1 x bfloat> undef, bfloat %1107, i32 0
  %1322 = extractelement <1 x bfloat> %1321, i32 0
  %1323 = bitcast bfloat %1322 to i16
  %1324 = insertelement <1 x i16> undef, i16 %1323, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1208, <1 x i16> %1324, i1 true)
  %1325 = insertelement <1 x bfloat> undef, bfloat %1108, i32 0
  %1326 = extractelement <1 x bfloat> %1325, i32 0
  %1327 = bitcast bfloat %1326 to i16
  %1328 = insertelement <1 x i16> undef, i16 %1327, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1217, <1 x i16> %1328, i1 true)
  %1329 = insertelement <1 x bfloat> undef, bfloat %1109, i32 0
  %1330 = extractelement <1 x bfloat> %1329, i32 0
  %1331 = bitcast bfloat %1330 to i16
  %1332 = insertelement <1 x i16> undef, i16 %1331, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1226, <1 x i16> %1332, i1 true)
  call void @llvm.nvvm.barrier0()
  %1333 = load <4 x i32>, ptr addrspace(3) %1235, align 16
  %1334 = extractelement <4 x i32> %1333, i32 0
  %1335 = extractelement <4 x i32> %1333, i32 1
  %1336 = extractelement <4 x i32> %1333, i32 2
  %1337 = extractelement <4 x i32> %1333, i32 3
  %1338 = insertelement <4 x i32> undef, i32 %1334, i32 0
  %1339 = insertelement <4 x i32> %1338, i32 %1335, i32 1
  %1340 = insertelement <4 x i32> %1339, i32 %1336, i32 2
  %1341 = insertelement <4 x i32> %1340, i32 %1337, i32 3
  %1342 = extractelement <4 x i32> %1341, i32 0
  %1343 = extractelement <4 x i32> %1341, i32 1
  %1344 = extractelement <4 x i32> %1341, i32 2
  %1345 = extractelement <4 x i32> %1341, i32 3
  %1346 = bitcast i32 %1342 to <2 x i16>
  %1347 = extractelement <2 x i16> %1346, i32 0
  %1348 = extractelement <2 x i16> %1346, i32 1
  %1349 = bitcast i32 %1343 to <2 x i16>
  %1350 = extractelement <2 x i16> %1349, i32 0
  %1351 = extractelement <2 x i16> %1349, i32 1
  %1352 = bitcast i32 %1344 to <2 x i16>
  %1353 = extractelement <2 x i16> %1352, i32 0
  %1354 = extractelement <2 x i16> %1352, i32 1
  %1355 = bitcast i32 %1345 to <2 x i16>
  %1356 = extractelement <2 x i16> %1355, i32 0
  %1357 = extractelement <2 x i16> %1355, i32 1
  %1358 = insertelement <8 x i16> undef, i16 %1347, i32 0
  %1359 = insertelement <8 x i16> %1358, i16 %1348, i32 1
  %1360 = insertelement <8 x i16> %1359, i16 %1350, i32 2
  %1361 = insertelement <8 x i16> %1360, i16 %1351, i32 3
  %1362 = insertelement <8 x i16> %1361, i16 %1353, i32 4
  %1363 = insertelement <8 x i16> %1362, i16 %1354, i32 5
  %1364 = insertelement <8 x i16> %1363, i16 %1356, i32 6
  %1365 = insertelement <8 x i16> %1364, i16 %1357, i32 7
  %1366 = extractelement <8 x i16> %1365, i32 0
  %1367 = extractelement <8 x i16> %1365, i32 1
  %1368 = extractelement <8 x i16> %1365, i32 2
  %1369 = extractelement <8 x i16> %1365, i32 3
  %1370 = extractelement <8 x i16> %1365, i32 4
  %1371 = extractelement <8 x i16> %1365, i32 5
  %1372 = extractelement <8 x i16> %1365, i32 6
  %1373 = extractelement <8 x i16> %1365, i32 7
  %1374 = bitcast i16 %1366 to bfloat
  %1375 = bitcast i16 %1367 to bfloat
  %1376 = bitcast i16 %1368 to bfloat
  %1377 = bitcast i16 %1369 to bfloat
  %1378 = bitcast i16 %1370 to bfloat
  %1379 = bitcast i16 %1371 to bfloat
  %1380 = bitcast i16 %1372 to bfloat
  %1381 = bitcast i16 %1373 to bfloat
  %1382 = insertelement <8 x bfloat> undef, bfloat %1374, i32 0
  %1383 = insertelement <8 x bfloat> %1382, bfloat %1375, i32 1
  %1384 = insertelement <8 x bfloat> %1383, bfloat %1376, i32 2
  %1385 = insertelement <8 x bfloat> %1384, bfloat %1377, i32 3
  %1386 = insertelement <8 x bfloat> %1385, bfloat %1378, i32 4
  %1387 = insertelement <8 x bfloat> %1386, bfloat %1379, i32 5
  %1388 = insertelement <8 x bfloat> %1387, bfloat %1380, i32 6
  %1389 = insertelement <8 x bfloat> %1388, bfloat %1381, i32 7
  %1390 = extractelement <8 x bfloat> %1389, i32 0
  %1391 = extractelement <8 x bfloat> %1389, i32 1
  %1392 = extractelement <8 x bfloat> %1389, i32 2
  %1393 = extractelement <8 x bfloat> %1389, i32 3
  %1394 = extractelement <8 x bfloat> %1389, i32 4
  %1395 = extractelement <8 x bfloat> %1389, i32 5
  %1396 = extractelement <8 x bfloat> %1389, i32 6
  %1397 = extractelement <8 x bfloat> %1389, i32 7
  %1398 = insertelement <2 x bfloat> undef, bfloat %1293, i32 0
  %1399 = insertelement <2 x bfloat> %1398, bfloat %1294, i32 1
  %1400 = bitcast <2 x bfloat> %1399 to i32
  %1401 = insertelement <2 x bfloat> undef, bfloat %1295, i32 0
  %1402 = insertelement <2 x bfloat> %1401, bfloat %1296, i32 1
  %1403 = bitcast <2 x bfloat> %1402 to i32
  %1404 = insertelement <2 x bfloat> undef, bfloat %1297, i32 0
  %1405 = insertelement <2 x bfloat> %1404, bfloat %1298, i32 1
  %1406 = bitcast <2 x bfloat> %1405 to i32
  %1407 = insertelement <2 x bfloat> undef, bfloat %1299, i32 0
  %1408 = insertelement <2 x bfloat> %1407, bfloat %1300, i32 1
  %1409 = bitcast <2 x bfloat> %1408 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %1400, i32 %1403, i32 %1406, i32 %1409, ptr addrspace(1) %1137)
  %1410 = insertelement <2 x bfloat> undef, bfloat %1390, i32 0
  %1411 = insertelement <2 x bfloat> %1410, bfloat %1391, i32 1
  %1412 = bitcast <2 x bfloat> %1411 to i32
  %1413 = insertelement <2 x bfloat> undef, bfloat %1392, i32 0
  %1414 = insertelement <2 x bfloat> %1413, bfloat %1393, i32 1
  %1415 = bitcast <2 x bfloat> %1414 to i32
  %1416 = insertelement <2 x bfloat> undef, bfloat %1394, i32 0
  %1417 = insertelement <2 x bfloat> %1416, bfloat %1395, i32 1
  %1418 = bitcast <2 x bfloat> %1417 to i32
  %1419 = insertelement <2 x bfloat> undef, bfloat %1396, i32 0
  %1420 = insertelement <2 x bfloat> %1419, bfloat %1397, i32 1
  %1421 = bitcast <2 x bfloat> %1420 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %1412, i32 %1415, i32 %1418, i32 %1421, ptr addrspace(1) %1138)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_50_impl(ptr, ptr, ptr, ptr, ptr, ptr) #4

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #5

declare float @__nv_rsqrtf(float)

define ptx_kernel void @fusion_50(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(65536) %arg1, ptr noalias align 128 dereferenceable(196608) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(65536) %arg4) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %6 = addrspacecast ptr null to ptr addrspace(1)
  %7 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %8 = sext i32 %7 to i64
  %9 = mul i64 %8, 3072
  %10 = add i64 %9, 2048
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

define ptx_kernel void @loop_convert_fusion(ptr noalias align 128 dereferenceable(393216) %0, ptr noalias align 128 dereferenceable(196608) %1) #0 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %5 = udiv i32 %4, 24
  %6 = urem i32 %4, 24
  %7 = mul i32 %6, 128
  %8 = add i32 %7, %3
  %9 = call bfloat @fused_convert_param_0_185(ptr %0, i32 %5, i32 %8)
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
  %20 = call bfloat @fused_convert_param_0_185(ptr %0, i32 %5, i32 %19)
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

define internal bfloat @fused_convert_param_0_185(ptr noalias %0, i32 %1, i32 %2) {
  %4 = mul i32 %1, 6144
  %5 = add i32 %4, %2
  %6 = getelementptr inbounds bfloat, ptr %0, i32 %5
  %7 = load bfloat, ptr %6, align 2, !invariant.load !3
  ret bfloat %7
}

declare float @__nv_fast_expf(float)

declare ptx_kernel void @fusion_51_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_51(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(196608) %arg3, ptr noalias align 128 dereferenceable(65536) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %6 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %7 = addrspacecast ptr null to ptr addrspace(1)
  %8 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %9 = sext i32 %8 to i64
  %10 = mul i64 %9, 3072
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
  %152 = add i64 %10, 2048
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

declare ptx_kernel void @fusion_52_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_52(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(196608) %arg3, ptr noalias align 128 dereferenceable(65536) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5, ptr noalias align 128 dereferenceable(65536) %arg6) #6 {
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
  %11 = mul i64 %10, 3072
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
  %98 = mul i64 %10, 1024
  %99 = getelementptr bfloat, ptr addrspace(1) %3, i64 %98
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
  %152 = add i64 %11, 1024
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
  %206 = getelementptr bfloat, ptr addrspace(1) %6, i64 %98
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
  %259 = add i64 %11, 2048
  %260 = getelementptr bfloat, ptr addrspace(1) %4, i64 %259
  %261 = getelementptr bfloat, ptr addrspace(1) %260, i64 %44
  %262 = getelementptr bfloat, ptr addrspace(1) %260, i64 %45
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
  %313 = getelementptr bfloat, ptr addrspace(1) %5, i64 %98
  %314 = getelementptr bfloat, ptr addrspace(1) %313, i64 %44
  %315 = getelementptr bfloat, ptr addrspace(1) %313, i64 %45
  %316 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %314)
  %317 = extractvalue { i32, i32, i32, i32 } %316, 0
  %318 = bitcast i32 %317 to <2 x bfloat>
  %319 = extractvalue { i32, i32, i32, i32 } %316, 1
  %320 = bitcast i32 %319 to <2 x bfloat>
  %321 = extractvalue { i32, i32, i32, i32 } %316, 2
  %322 = bitcast i32 %321 to <2 x bfloat>
  %323 = extractvalue { i32, i32, i32, i32 } %316, 3
  %324 = bitcast i32 %323 to <2 x bfloat>
  %325 = extractelement <2 x bfloat> %318, i32 0
  %326 = extractelement <2 x bfloat> %318, i32 1
  %327 = extractelement <2 x bfloat> %320, i32 0
  %328 = extractelement <2 x bfloat> %320, i32 1
  %329 = extractelement <2 x bfloat> %322, i32 0
  %330 = extractelement <2 x bfloat> %322, i32 1
  %331 = extractelement <2 x bfloat> %324, i32 0
  %332 = extractelement <2 x bfloat> %324, i32 1
  %333 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %315)
  %334 = extractvalue { i32, i32, i32, i32 } %333, 0
  %335 = bitcast i32 %334 to <2 x bfloat>
  %336 = extractvalue { i32, i32, i32, i32 } %333, 1
  %337 = bitcast i32 %336 to <2 x bfloat>
  %338 = extractvalue { i32, i32, i32, i32 } %333, 2
  %339 = bitcast i32 %338 to <2 x bfloat>
  %340 = extractvalue { i32, i32, i32, i32 } %333, 3
  %341 = bitcast i32 %340 to <2 x bfloat>
  %342 = extractelement <2 x bfloat> %335, i32 0
  %343 = extractelement <2 x bfloat> %335, i32 1
  %344 = extractelement <2 x bfloat> %337, i32 0
  %345 = extractelement <2 x bfloat> %337, i32 1
  %346 = extractelement <2 x bfloat> %339, i32 0
  %347 = extractelement <2 x bfloat> %339, i32 1
  %348 = extractelement <2 x bfloat> %341, i32 0
  %349 = extractelement <2 x bfloat> %341, i32 1
  %350 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %325)
  %351 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %326)
  %352 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %327)
  %353 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %328)
  %354 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %329)
  %355 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %330)
  %356 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %331)
  %357 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %332)
  %358 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %342)
  %359 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %343)
  %360 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %344)
  %361 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %345)
  %362 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %346)
  %363 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %347)
  %364 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %348)
  %365 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %349)
  %366 = fadd float %297, %350
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
  %382 = fadd float %243, %366
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
  %398 = fadd float %190, %382
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
  %414 = fadd float %136, %398
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
  %430 = fadd float %82, %414
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
  %459 = fmul float %443, %443
  %460 = fmul float %444, %444
  %461 = fmul float %445, %445
  %462 = fadd float %446, %447
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
  %474 = fadd float %473, %459
  %475 = fadd float %474, %460
  %476 = fadd float %475, %461
  %477 = bitcast float %476 to i32
  %478 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %477, i32 16, i32 31)
  %479 = bitcast i32 %478 to float
  %480 = fadd float %476, %479
  %481 = bitcast float %480 to i32
  %482 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %481, i32 8, i32 31)
  %483 = bitcast i32 %482 to float
  %484 = fadd float %480, %483
  %485 = bitcast float %484 to i32
  %486 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %485, i32 4, i32 31)
  %487 = bitcast i32 %486 to float
  %488 = fadd float %484, %487
  %489 = bitcast float %488 to i32
  %490 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %489, i32 2, i32 31)
  %491 = bitcast i32 %490 to float
  %492 = fadd float %488, %491
  %493 = bitcast float %492 to i32
  %494 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %493, i32 1, i32 31)
  %495 = bitcast i32 %494 to float
  %496 = fadd float %492, %495
  %497 = urem i32 %14, 32
  %498 = urem i32 %15, 2
  %499 = icmp eq i32 %497, 0
  %500 = and i1 true, %499
  %501 = add i32 0, %498
  %502 = getelementptr float, ptr addrspace(3) @global_smem, i32 %501
  %503 = insertelement <1 x float> undef, float %496, i32 0
  %504 = extractelement <1 x float> %503, i32 0
  %505 = bitcast float %504 to i32
  %506 = insertelement <1 x i32> undef, i32 %505, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %502, <1 x i32> %506, i1 %500)
  call void @llvm.nvvm.barrier0()
  %507 = icmp slt i32 %13, 2
  %508 = getelementptr float, ptr addrspace(3) @global_smem, i32 %13
  %509 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %508, i1 %507)
  %510 = insertelement <1 x i32> undef, i32 %509, i32 0
  %511 = extractelement <1 x i32> %510, i32 0
  %512 = bitcast i32 %511 to float
  %513 = insertelement <1 x float> undef, float %512, i32 0
  %514 = extractelement <1 x float> %513, i32 0
  %515 = bitcast float %514 to i32
  %516 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %515, i32 1, i32 31)
  %517 = bitcast i32 %516 to float
  %518 = fadd float %514, %517
  %519 = urem i32 %14, 2
  %520 = icmp eq i32 %519, 0
  %521 = and i1 %507, %520
  %522 = insertelement <1 x float> undef, float %518, i32 0
  %523 = extractelement <1 x float> %522, i32 0
  %524 = bitcast float %523 to i32
  %525 = insertelement <1 x i32> undef, i32 %524, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %508, <1 x i32> %525, i1 %521)
  call void @llvm.nvvm.barrier0()
  %526 = load float, ptr addrspace(3) @global_smem, align 4
  %527 = fmul float %526, 0x3F50000000000000
  %528 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %529 = bitcast i32 %528 to <1 x float>
  %530 = extractelement <1 x float> %529, i32 0
  %531 = fadd float %527, %530
  %532 = call float @__nv_rsqrtf(float %531)
  %533 = fmul float %430, %532
  %534 = fmul float %431, %532
  %535 = fmul float %432, %532
  %536 = fmul float %433, %532
  %537 = fmul float %434, %532
  %538 = fmul float %435, %532
  %539 = fmul float %436, %532
  %540 = fmul float %437, %532
  %541 = fmul float %438, %532
  %542 = fmul float %439, %532
  %543 = fmul float %440, %532
  %544 = fmul float %441, %532
  %545 = fmul float %442, %532
  %546 = fmul float %443, %532
  %547 = fmul float %444, %532
  %548 = fmul float %445, %532
  %549 = getelementptr bfloat, ptr addrspace(1) %2, i64 %44
  %550 = getelementptr bfloat, ptr addrspace(1) %2, i64 %45
  %551 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %549)
  %552 = extractvalue { i32, i32, i32, i32 } %551, 0
  %553 = bitcast i32 %552 to <2 x bfloat>
  %554 = extractvalue { i32, i32, i32, i32 } %551, 1
  %555 = bitcast i32 %554 to <2 x bfloat>
  %556 = extractvalue { i32, i32, i32, i32 } %551, 2
  %557 = bitcast i32 %556 to <2 x bfloat>
  %558 = extractvalue { i32, i32, i32, i32 } %551, 3
  %559 = bitcast i32 %558 to <2 x bfloat>
  %560 = extractelement <2 x bfloat> %553, i32 0
  %561 = extractelement <2 x bfloat> %553, i32 1
  %562 = extractelement <2 x bfloat> %555, i32 0
  %563 = extractelement <2 x bfloat> %555, i32 1
  %564 = extractelement <2 x bfloat> %557, i32 0
  %565 = extractelement <2 x bfloat> %557, i32 1
  %566 = extractelement <2 x bfloat> %559, i32 0
  %567 = extractelement <2 x bfloat> %559, i32 1
  %568 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %550)
  %569 = extractvalue { i32, i32, i32, i32 } %568, 0
  %570 = bitcast i32 %569 to <2 x bfloat>
  %571 = extractvalue { i32, i32, i32, i32 } %568, 1
  %572 = bitcast i32 %571 to <2 x bfloat>
  %573 = extractvalue { i32, i32, i32, i32 } %568, 2
  %574 = bitcast i32 %573 to <2 x bfloat>
  %575 = extractvalue { i32, i32, i32, i32 } %568, 3
  %576 = bitcast i32 %575 to <2 x bfloat>
  %577 = extractelement <2 x bfloat> %570, i32 0
  %578 = extractelement <2 x bfloat> %570, i32 1
  %579 = extractelement <2 x bfloat> %572, i32 0
  %580 = extractelement <2 x bfloat> %572, i32 1
  %581 = extractelement <2 x bfloat> %574, i32 0
  %582 = extractelement <2 x bfloat> %574, i32 1
  %583 = extractelement <2 x bfloat> %576, i32 0
  %584 = extractelement <2 x bfloat> %576, i32 1
  %585 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %560)
  %586 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %561)
  %587 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %562)
  %588 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %563)
  %589 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %564)
  %590 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %565)
  %591 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %566)
  %592 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %567)
  %593 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %577)
  %594 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %578)
  %595 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %579)
  %596 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %580)
  %597 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %581)
  %598 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %582)
  %599 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %583)
  %600 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %584)
  %601 = fmul float %533, %585
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
  %617 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %601)
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
  %633 = getelementptr bfloat, ptr addrspace(1) %7, i64 %98
  %634 = getelementptr bfloat, ptr addrspace(1) %633, i64 %44
  %635 = getelementptr bfloat, ptr addrspace(1) %633, i64 %45
  %636 = insertelement <2 x bfloat> undef, bfloat %617, i32 0
  %637 = insertelement <2 x bfloat> %636, bfloat %618, i32 1
  %638 = bitcast <2 x bfloat> %637 to i32
  %639 = insertelement <2 x bfloat> undef, bfloat %619, i32 0
  %640 = insertelement <2 x bfloat> %639, bfloat %620, i32 1
  %641 = bitcast <2 x bfloat> %640 to i32
  %642 = insertelement <2 x bfloat> undef, bfloat %621, i32 0
  %643 = insertelement <2 x bfloat> %642, bfloat %622, i32 1
  %644 = bitcast <2 x bfloat> %643 to i32
  %645 = insertelement <2 x bfloat> undef, bfloat %623, i32 0
  %646 = insertelement <2 x bfloat> %645, bfloat %624, i32 1
  %647 = bitcast <2 x bfloat> %646 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %638, i32 %641, i32 %644, i32 %647, ptr addrspace(1) %634)
  %648 = insertelement <2 x bfloat> undef, bfloat %625, i32 0
  %649 = insertelement <2 x bfloat> %648, bfloat %626, i32 1
  %650 = bitcast <2 x bfloat> %649 to i32
  %651 = insertelement <2 x bfloat> undef, bfloat %627, i32 0
  %652 = insertelement <2 x bfloat> %651, bfloat %628, i32 1
  %653 = bitcast <2 x bfloat> %652 to i32
  %654 = insertelement <2 x bfloat> undef, bfloat %629, i32 0
  %655 = insertelement <2 x bfloat> %654, bfloat %630, i32 1
  %656 = bitcast <2 x bfloat> %655 to i32
  %657 = insertelement <2 x bfloat> undef, bfloat %631, i32 0
  %658 = insertelement <2 x bfloat> %657, bfloat %632, i32 1
  %659 = bitcast <2 x bfloat> %658 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %650, i32 %653, i32 %656, i32 %659, ptr addrspace(1) %635)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_53_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_53(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(65536) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(65536) %arg3, ptr noalias align 128 dereferenceable(196608) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5, ptr noalias align 128 dereferenceable(65536) %arg6, ptr noalias align 128 dereferenceable(65536) %arg7) #6 {
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
  %153 = getelementptr bfloat, ptr addrspace(1) %4, i64 %12
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
  %260 = getelementptr bfloat, ptr addrspace(1) %7, i64 %12
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
  %367 = getelementptr bfloat, ptr addrspace(1) %6, i64 %12
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

define ptx_kernel void @wrapped_slice(ptr noalias align 128 dereferenceable(262144) %0, ptr noalias align 128 dereferenceable(65536) %1) #0 {
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

declare ptx_kernel void @fusion_45_impl(ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_45(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(262144) %arg1, ptr noalias align 16 dereferenceable(256) %arg2, ptr noalias align 128 dereferenceable(131072) %arg3) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr null to ptr addrspace(1)
  %6 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %7 = sext i32 %6 to i64
  %8 = urem i64 %7, 2
  %9 = mul i64 %8, 512
  %10 = udiv i64 %7, 2
  %11 = mul i64 %10, 4096
  %12 = add i64 %9, %11
  %13 = add i64 %12, 2048
  %14 = getelementptr bfloat, ptr addrspace(1) %2, i64 %13
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
  %43 = add i32 %42, 0
  %44 = sext i32 %43 to i64
  %45 = getelementptr bfloat, ptr addrspace(1) %14, i64 %44
  %46 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %45)
  %47 = extractvalue { i32, i32, i32, i32 } %46, 0
  %48 = bitcast i32 %47 to <2 x bfloat>
  %49 = extractvalue { i32, i32, i32, i32 } %46, 1
  %50 = bitcast i32 %49 to <2 x bfloat>
  %51 = extractvalue { i32, i32, i32, i32 } %46, 2
  %52 = bitcast i32 %51 to <2 x bfloat>
  %53 = extractvalue { i32, i32, i32, i32 } %46, 3
  %54 = bitcast i32 %53 to <2 x bfloat>
  %55 = extractelement <2 x bfloat> %48, i32 0
  %56 = extractelement <2 x bfloat> %48, i32 1
  %57 = extractelement <2 x bfloat> %50, i32 0
  %58 = extractelement <2 x bfloat> %50, i32 1
  %59 = extractelement <2 x bfloat> %52, i32 0
  %60 = extractelement <2 x bfloat> %52, i32 1
  %61 = extractelement <2 x bfloat> %54, i32 0
  %62 = extractelement <2 x bfloat> %54, i32 1
  %63 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %55)
  %64 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %56)
  %65 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %57)
  %66 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %58)
  %67 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %59)
  %68 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %60)
  %69 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %61)
  %70 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %62)
  %71 = fmul float %63, %63
  %72 = fmul float %64, %64
  %73 = fmul float %65, %65
  %74 = fmul float %66, %66
  %75 = fmul float %67, %67
  %76 = fmul float %68, %68
  %77 = fmul float %69, %69
  %78 = fmul float %70, %70
  %79 = fadd float %71, %72
  %80 = fadd float %79, %73
  %81 = fadd float %80, %74
  %82 = fadd float %81, %75
  %83 = fadd float %82, %76
  %84 = fadd float %83, %77
  %85 = fadd float %84, %78
  %86 = bitcast float %85 to i32
  %87 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %86, i32 8, i32 31)
  %88 = bitcast i32 %87 to float
  %89 = fadd float %85, %88
  %90 = bitcast float %89 to i32
  %91 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %90, i32 4, i32 31)
  %92 = bitcast i32 %91 to float
  %93 = fadd float %89, %92
  %94 = bitcast float %93 to i32
  %95 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %94, i32 2, i32 31)
  %96 = bitcast i32 %95 to float
  %97 = fadd float %93, %96
  %98 = bitcast float %97 to i32
  %99 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %98, i32 1, i32 31)
  %100 = bitcast i32 %99 to float
  %101 = fadd float %97, %100
  %102 = fmul float %101, 7.812500e-03
  %103 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %104 = bitcast i32 %103 to <1 x float>
  %105 = extractelement <1 x float> %104, i32 0
  %106 = fadd float %102, %105
  %107 = call float @__nv_rsqrtf(float %106)
  %108 = fmul float %63, %107
  %109 = fmul float %64, %107
  %110 = fmul float %65, %107
  %111 = fmul float %66, %107
  %112 = fmul float %67, %107
  %113 = fmul float %68, %107
  %114 = fmul float %69, %107
  %115 = fmul float %70, %107
  %116 = select i1 %19, i32 0, i32 2
  %117 = xor i32 0, %116
  %118 = select i1 %23, i32 0, i32 4
  %119 = xor i32 %117, %118
  %120 = select i1 %27, i32 0, i32 8
  %121 = xor i32 %119, %120
  %122 = select i1 %31, i32 0, i32 16
  %123 = xor i32 %121, %122
  %124 = select i1 %35, i32 0, i32 32
  %125 = xor i32 %123, %124
  %126 = select i1 %39, i32 0, i32 64
  %127 = xor i32 %125, %126
  %128 = xor i32 %127, 0
  %129 = add i32 %128, 0
  %130 = select i1 %19, i32 0, i32 4
  %131 = xor i32 0, %130
  %132 = select i1 %23, i32 0, i32 8
  %133 = xor i32 %131, %132
  %134 = select i1 %27, i32 0, i32 16
  %135 = xor i32 %133, %134
  %136 = select i1 %31, i32 0, i32 32
  %137 = xor i32 %135, %136
  %138 = select i1 %35, i32 0, i32 64
  %139 = xor i32 %137, %138
  %140 = xor i32 %139, 0
  %141 = add i32 %140, 0
  %142 = sext i32 %129 to i64
  %143 = sext i32 %141 to i64
  %144 = getelementptr bfloat, ptr addrspace(1) %3, i64 %142
  %145 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %144)
  %146 = bitcast i32 %145 to <2 x bfloat>
  %147 = extractelement <2 x bfloat> %146, i32 0
  %148 = extractelement <2 x bfloat> %146, i32 1
  %149 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %128
  %150 = insertelement <2 x bfloat> undef, bfloat %147, i32 0
  %151 = insertelement <2 x bfloat> %150, bfloat %148, i32 1
  %152 = extractelement <2 x bfloat> %151, i32 0
  %153 = extractelement <2 x bfloat> %151, i32 1
  %154 = bitcast bfloat %152 to i16
  %155 = bitcast bfloat %153 to i16
  %156 = insertelement <2 x i16> undef, i16 %154, i32 0
  %157 = insertelement <2 x i16> %156, i16 %155, i32 1
  %158 = extractelement <2 x i16> %157, i32 0
  %159 = extractelement <2 x i16> %157, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %149, i16 %158, i16 %159, i1 true)
  call void @llvm.nvvm.barrier0()
  %160 = xor i32 %33, 0
  %161 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %160
  %162 = load <4 x i32>, ptr addrspace(3) %161, align 16
  %163 = extractelement <4 x i32> %162, i32 0
  %164 = extractelement <4 x i32> %162, i32 1
  %165 = extractelement <4 x i32> %162, i32 2
  %166 = extractelement <4 x i32> %162, i32 3
  %167 = insertelement <4 x i32> undef, i32 %163, i32 0
  %168 = insertelement <4 x i32> %167, i32 %164, i32 1
  %169 = insertelement <4 x i32> %168, i32 %165, i32 2
  %170 = insertelement <4 x i32> %169, i32 %166, i32 3
  %171 = extractelement <4 x i32> %170, i32 0
  %172 = extractelement <4 x i32> %170, i32 1
  %173 = extractelement <4 x i32> %170, i32 2
  %174 = extractelement <4 x i32> %170, i32 3
  %175 = bitcast i32 %171 to <2 x i16>
  %176 = extractelement <2 x i16> %175, i32 0
  %177 = extractelement <2 x i16> %175, i32 1
  %178 = bitcast i32 %172 to <2 x i16>
  %179 = extractelement <2 x i16> %178, i32 0
  %180 = extractelement <2 x i16> %178, i32 1
  %181 = bitcast i32 %173 to <2 x i16>
  %182 = extractelement <2 x i16> %181, i32 0
  %183 = extractelement <2 x i16> %181, i32 1
  %184 = bitcast i32 %174 to <2 x i16>
  %185 = extractelement <2 x i16> %184, i32 0
  %186 = extractelement <2 x i16> %184, i32 1
  %187 = insertelement <8 x i16> undef, i16 %176, i32 0
  %188 = insertelement <8 x i16> %187, i16 %177, i32 1
  %189 = insertelement <8 x i16> %188, i16 %179, i32 2
  %190 = insertelement <8 x i16> %189, i16 %180, i32 3
  %191 = insertelement <8 x i16> %190, i16 %182, i32 4
  %192 = insertelement <8 x i16> %191, i16 %183, i32 5
  %193 = insertelement <8 x i16> %192, i16 %185, i32 6
  %194 = insertelement <8 x i16> %193, i16 %186, i32 7
  %195 = extractelement <8 x i16> %194, i32 0
  %196 = extractelement <8 x i16> %194, i32 1
  %197 = extractelement <8 x i16> %194, i32 2
  %198 = extractelement <8 x i16> %194, i32 3
  %199 = extractelement <8 x i16> %194, i32 4
  %200 = extractelement <8 x i16> %194, i32 5
  %201 = extractelement <8 x i16> %194, i32 6
  %202 = extractelement <8 x i16> %194, i32 7
  %203 = bitcast i16 %195 to bfloat
  %204 = bitcast i16 %196 to bfloat
  %205 = bitcast i16 %197 to bfloat
  %206 = bitcast i16 %198 to bfloat
  %207 = bitcast i16 %199 to bfloat
  %208 = bitcast i16 %200 to bfloat
  %209 = bitcast i16 %201 to bfloat
  %210 = bitcast i16 %202 to bfloat
  %211 = insertelement <8 x bfloat> undef, bfloat %203, i32 0
  %212 = insertelement <8 x bfloat> %211, bfloat %204, i32 1
  %213 = insertelement <8 x bfloat> %212, bfloat %205, i32 2
  %214 = insertelement <8 x bfloat> %213, bfloat %206, i32 3
  %215 = insertelement <8 x bfloat> %214, bfloat %207, i32 4
  %216 = insertelement <8 x bfloat> %215, bfloat %208, i32 5
  %217 = insertelement <8 x bfloat> %216, bfloat %209, i32 6
  %218 = insertelement <8 x bfloat> %217, bfloat %210, i32 7
  %219 = extractelement <8 x bfloat> %218, i32 0
  %220 = extractelement <8 x bfloat> %218, i32 1
  %221 = extractelement <8 x bfloat> %218, i32 2
  %222 = extractelement <8 x bfloat> %218, i32 3
  %223 = extractelement <8 x bfloat> %218, i32 4
  %224 = extractelement <8 x bfloat> %218, i32 5
  %225 = extractelement <8 x bfloat> %218, i32 6
  %226 = extractelement <8 x bfloat> %218, i32 7
  %227 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %219)
  %228 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %220)
  %229 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %221)
  %230 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %222)
  %231 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %223)
  %232 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %224)
  %233 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %225)
  %234 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %226)
  %235 = fmul float %108, %227
  %236 = fmul float %109, %228
  %237 = fmul float %110, %229
  %238 = fmul float %111, %230
  %239 = fmul float %112, %231
  %240 = fmul float %113, %232
  %241 = fmul float %114, %233
  %242 = fmul float %115, %234
  %243 = mul i64 %7, 512
  %244 = getelementptr float, ptr addrspace(1) %4, i64 %243
  %245 = select i1 %39, i32 0, i32 1
  %246 = xor i32 0, %245
  %247 = xor i32 %246, 0
  %248 = xor i32 %246, 2
  %249 = add i32 %247, 0
  %250 = add i32 %248, 0
  %251 = sext i32 %249 to i64
  %252 = sext i32 %250 to i64
  %253 = mul i64 %251, 128
  %254 = mul i64 %252, 128
  %255 = add i64 %253, %143
  %256 = add i64 %254, %143
  %257 = getelementptr float, ptr addrspace(1) %244, i64 %255
  %258 = getelementptr float, ptr addrspace(1) %244, i64 %256
  call void @llvm.nvvm.barrier0()
  %259 = select i1 %39, i32 0, i32 128
  %260 = xor i32 %139, %259
  %261 = lshr i32 %42, 7
  %262 = shl i32 %261, 3
  %263 = add i32 %262, %42
  %264 = getelementptr inbounds float, ptr addrspace(3) @global_smem, i32 %263
  %265 = insertelement <8 x float> undef, float %235, i32 0
  %266 = insertelement <8 x float> %265, float %236, i32 1
  %267 = insertelement <8 x float> %266, float %237, i32 2
  %268 = insertelement <8 x float> %267, float %238, i32 3
  %269 = insertelement <8 x float> %268, float %239, i32 4
  %270 = insertelement <8 x float> %269, float %240, i32 5
  %271 = insertelement <8 x float> %270, float %241, i32 6
  %272 = insertelement <8 x float> %271, float %242, i32 7
  %273 = extractelement <8 x float> %272, i32 0
  %274 = extractelement <8 x float> %272, i32 1
  %275 = extractelement <8 x float> %272, i32 2
  %276 = extractelement <8 x float> %272, i32 3
  %277 = extractelement <8 x float> %272, i32 4
  %278 = extractelement <8 x float> %272, i32 5
  %279 = extractelement <8 x float> %272, i32 6
  %280 = extractelement <8 x float> %272, i32 7
  %281 = bitcast float %273 to i32
  %282 = bitcast float %274 to i32
  %283 = bitcast float %275 to i32
  %284 = bitcast float %276 to i32
  %285 = bitcast float %277 to i32
  %286 = bitcast float %278 to i32
  %287 = bitcast float %279 to i32
  %288 = bitcast float %280 to i32
  %289 = insertelement <8 x i32> undef, i32 %281, i32 0
  %290 = insertelement <8 x i32> %289, i32 %282, i32 1
  %291 = insertelement <8 x i32> %290, i32 %283, i32 2
  %292 = insertelement <8 x i32> %291, i32 %284, i32 3
  %293 = insertelement <8 x i32> %292, i32 %285, i32 4
  %294 = insertelement <8 x i32> %293, i32 %286, i32 5
  %295 = insertelement <8 x i32> %294, i32 %287, i32 6
  %296 = insertelement <8 x i32> %295, i32 %288, i32 7
  %297 = extractelement <8 x i32> %296, i32 0
  %298 = extractelement <8 x i32> %296, i32 1
  %299 = extractelement <8 x i32> %296, i32 2
  %300 = extractelement <8 x i32> %296, i32 3
  %301 = extractelement <8 x i32> %296, i32 4
  %302 = extractelement <8 x i32> %296, i32 5
  %303 = extractelement <8 x i32> %296, i32 6
  %304 = extractelement <8 x i32> %296, i32 7
  %305 = insertelement <4 x i32> undef, i32 %297, i32 0
  %306 = insertelement <4 x i32> %305, i32 %298, i32 1
  %307 = insertelement <4 x i32> %306, i32 %299, i32 2
  %308 = insertelement <4 x i32> %307, i32 %300, i32 3
  %309 = extractelement <4 x i32> %308, i32 0
  %310 = extractelement <4 x i32> %308, i32 1
  %311 = extractelement <4 x i32> %308, i32 2
  %312 = extractelement <4 x i32> %308, i32 3
  call void asm sideeffect "@$5 st.shared.v4.b32 [ $0 + 0 ], { $1, $2, $3, $4 };", "r,r,r,r,r,b"(ptr addrspace(3) %264, i32 %309, i32 %310, i32 %311, i32 %312, i1 true)
  %313 = getelementptr inbounds i32, ptr addrspace(3) %264, i32 4
  %314 = insertelement <4 x i32> undef, i32 %301, i32 0
  %315 = insertelement <4 x i32> %314, i32 %302, i32 1
  %316 = insertelement <4 x i32> %315, i32 %303, i32 2
  %317 = insertelement <4 x i32> %316, i32 %304, i32 3
  %318 = extractelement <4 x i32> %317, i32 0
  %319 = extractelement <4 x i32> %317, i32 1
  %320 = extractelement <4 x i32> %317, i32 2
  %321 = extractelement <4 x i32> %317, i32 3
  call void asm sideeffect "@$5 st.shared.v4.b32 [ $0 + 0 ], { $1, $2, $3, $4 };", "r,r,r,r,r,b"(ptr addrspace(3) %313, i32 %318, i32 %319, i32 %320, i32 %321, i1 true)
  call void @llvm.nvvm.barrier0()
  %322 = xor i32 %260, 0
  %323 = lshr i32 %322, 7
  %324 = shl i32 %323, 3
  %325 = add i32 %324, %322
  %326 = getelementptr inbounds float, ptr addrspace(3) @global_smem, i32 %325
  %327 = load <4 x i32>, ptr addrspace(3) %326, align 16
  %328 = extractelement <4 x i32> %327, i32 0
  %329 = extractelement <4 x i32> %327, i32 1
  %330 = extractelement <4 x i32> %327, i32 2
  %331 = extractelement <4 x i32> %327, i32 3
  %332 = insertelement <4 x i32> undef, i32 %328, i32 0
  %333 = insertelement <4 x i32> %332, i32 %329, i32 1
  %334 = insertelement <4 x i32> %333, i32 %330, i32 2
  %335 = insertelement <4 x i32> %334, i32 %331, i32 3
  %336 = extractelement <4 x i32> %335, i32 0
  %337 = extractelement <4 x i32> %335, i32 1
  %338 = extractelement <4 x i32> %335, i32 2
  %339 = extractelement <4 x i32> %335, i32 3
  %340 = bitcast i32 %336 to float
  %341 = bitcast i32 %337 to float
  %342 = bitcast i32 %338 to float
  %343 = bitcast i32 %339 to float
  %344 = insertelement <4 x float> undef, float %340, i32 0
  %345 = insertelement <4 x float> %344, float %341, i32 1
  %346 = insertelement <4 x float> %345, float %342, i32 2
  %347 = insertelement <4 x float> %346, float %343, i32 3
  %348 = extractelement <4 x float> %347, i32 0
  %349 = extractelement <4 x float> %347, i32 1
  %350 = extractelement <4 x float> %347, i32 2
  %351 = extractelement <4 x float> %347, i32 3
  %352 = xor i32 %260, 256
  %353 = lshr i32 %352, 7
  %354 = shl i32 %353, 3
  %355 = add i32 %354, %352
  %356 = getelementptr inbounds float, ptr addrspace(3) @global_smem, i32 %355
  %357 = load <4 x i32>, ptr addrspace(3) %356, align 16
  %358 = extractelement <4 x i32> %357, i32 0
  %359 = extractelement <4 x i32> %357, i32 1
  %360 = extractelement <4 x i32> %357, i32 2
  %361 = extractelement <4 x i32> %357, i32 3
  %362 = insertelement <4 x i32> undef, i32 %358, i32 0
  %363 = insertelement <4 x i32> %362, i32 %359, i32 1
  %364 = insertelement <4 x i32> %363, i32 %360, i32 2
  %365 = insertelement <4 x i32> %364, i32 %361, i32 3
  %366 = extractelement <4 x i32> %365, i32 0
  %367 = extractelement <4 x i32> %365, i32 1
  %368 = extractelement <4 x i32> %365, i32 2
  %369 = extractelement <4 x i32> %365, i32 3
  %370 = bitcast i32 %366 to float
  %371 = bitcast i32 %367 to float
  %372 = bitcast i32 %368 to float
  %373 = bitcast i32 %369 to float
  %374 = insertelement <4 x float> undef, float %370, i32 0
  %375 = insertelement <4 x float> %374, float %371, i32 1
  %376 = insertelement <4 x float> %375, float %372, i32 2
  %377 = insertelement <4 x float> %376, float %373, i32 3
  %378 = extractelement <4 x float> %377, i32 0
  %379 = extractelement <4 x float> %377, i32 1
  %380 = extractelement <4 x float> %377, i32 2
  %381 = extractelement <4 x float> %377, i32 3
  %382 = insertelement <1 x float> undef, float %348, i32 0
  %383 = bitcast <1 x float> %382 to i32
  %384 = insertelement <1 x float> undef, float %349, i32 0
  %385 = bitcast <1 x float> %384 to i32
  %386 = insertelement <1 x float> undef, float %350, i32 0
  %387 = bitcast <1 x float> %386 to i32
  %388 = insertelement <1 x float> undef, float %351, i32 0
  %389 = bitcast <1 x float> %388 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %383, i32 %385, i32 %387, i32 %389, ptr addrspace(1) %257)
  %390 = insertelement <1 x float> undef, float %378, i32 0
  %391 = bitcast <1 x float> %390 to i32
  %392 = insertelement <1 x float> undef, float %379, i32 0
  %393 = bitcast <1 x float> %392 to i32
  %394 = insertelement <1 x float> undef, float %380, i32 0
  %395 = bitcast <1 x float> %394 to i32
  %396 = insertelement <1 x float> undef, float %381, i32 0
  %397 = bitcast <1 x float> %396 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %391, i32 %393, i32 %395, i32 %397, ptr addrspace(1) %258)
  ret void

entry:                                            ; No predecessors!
  ret void
}

define ptx_kernel void @input_concatenate_fusion(ptr noalias align 128 dereferenceable(131072) %0, ptr noalias align 16 dereferenceable(10485760) %1, ptr noalias align 16 dereferenceable(128) %2, ptr noalias align 128 dereferenceable(65536) %3) #0 {
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !1
  %7 = udiv i32 %6, 4
  %8 = urem i32 %5, 64
  %9 = udiv i32 %5, 64
  %10 = mul i32 %9, 128
  %11 = mul i32 %6, 256
  %12 = add i32 %10, %11
  %13 = add i32 %12, %8
  %14 = getelementptr inbounds float, ptr %0, i32 %13
  %15 = load float, ptr %14, align 4, !invariant.load !3
  %16 = call float @fused_concatenate_convert_255_7(ptr %0, ptr %1, ptr %2, i32 %7, i32 %8)
  %17 = fmul float %15, %16
  %18 = add i32 %8, 64
  %19 = add i32 %13, 64
  %20 = getelementptr inbounds float, ptr %0, i32 %19
  %21 = load float, ptr %20, align 4, !invariant.load !3
  %22 = call float @fused_concatenate_convert_255_7(ptr %0, ptr %1, ptr %2, i32 %7, i32 %18)
  %23 = fmul float %21, %22
  %24 = fsub float %17, %23
  %25 = fptrunc float %24 to bfloat
  %26 = getelementptr inbounds bfloat, ptr %3, i32 %13
  store bfloat %25, ptr %26, align 2
  %27 = load float, ptr %20, align 4, !invariant.load !3
  %28 = call float @fused_concatenate_convert_255_7(ptr %0, ptr %1, ptr %2, i32 %7, i32 %8)
  %29 = fmul float %27, %28
  %30 = load float, ptr %14, align 4, !invariant.load !3
  %31 = call float @fused_concatenate_convert_255_7(ptr %0, ptr %1, ptr %2, i32 %7, i32 %18)
  %32 = fmul float %30, %31
  %33 = fadd float %29, %32
  %34 = fptrunc float %33 to bfloat
  %35 = getelementptr inbounds bfloat, ptr %3, i32 %19
  store bfloat %34, ptr %35, align 2
  ret void
}

define internal float @fused_concatenate_convert_255_7(ptr noalias %0, ptr noalias %1, ptr noalias %2, i32 %3, i32 %4) {
  %6 = getelementptr inbounds i32, ptr %2, i32 %3
  %7 = load i32, ptr %6, align 4, !invariant.load !3
  %8 = call i32 @llvm.smin.i32(i32 %7, i32 40959)
  %9 = call i32 @llvm.smax.i32(i32 %8, i32 0)
  %10 = mul i32 %9, 128
  %11 = add i32 %10, %4
  %12 = getelementptr inbounds bfloat, ptr %1, i32 %11
  %13 = load bfloat, ptr %12, align 2, !invariant.load !3
  %14 = fpext bfloat %13 to float
  ret float %14
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
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
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
!2 = !{i32 0, i32 256}
!3 = !{}
!4 = !{i32 0, i32 768}
!5 = !{i32 0, i32 135456}

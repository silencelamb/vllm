; ModuleID = 'SyncTensorsGraph.219'
source_filename = "SyncTensorsGraph.219"
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

declare ptx_kernel void @gemm_fusion_dot_29_0_impl(ptr, ptr, ptr) #2

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #3

define ptx_kernel void @gemm_fusion_dot_29_0(ptr noalias align 16 dereferenceable(4194304) %arg0, ptr noalias align 128 dereferenceable(32768) %arg1) #0 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr null to ptr addrspace(1)
  %4 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %5 = sdiv i32 %4, 8
  %6 = mul i32 %5, 8
  %7 = sub i32 64, %6
  %8 = icmp slt i32 %7, 8
  %9 = select i1 %8, i32 %7, i32 8
  %10 = srem i32 %4, %9
  %11 = add i32 %6, %10
  %12 = srem i32 %4, 8
  %13 = sdiv i32 %12, %9
  %14 = mul i32 %11, 16
  %15 = sext i32 %14 to i64
  %16 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %17 = udiv i32 %16, 32
  %18 = and i32 %17, 1
  %19 = icmp eq i32 %18, 0
  %20 = select i1 %19, i32 0, i32 1
  %21 = xor i32 0, %20
  %22 = and i32 %17, 2
  %23 = icmp eq i32 %22, 0
  %24 = select i1 %23, i32 0, i32 2
  %25 = xor i32 %21, %24
  %26 = xor i32 %25, 0
  %27 = xor i32 %25, 4
  %28 = xor i32 %25, 8
  %29 = xor i32 %25, 12
  %30 = add i32 %26, 0
  %31 = add i32 %27, 0
  %32 = add i32 %28, 0
  %33 = add i32 %29, 0
  %34 = sext i32 %30 to i64
  %35 = sext i32 %31 to i64
  %36 = sext i32 %32 to i64
  %37 = sext i32 %33 to i64
  %38 = add i64 %15, %34
  %39 = add i64 %15, %35
  %40 = add i64 %15, %36
  %41 = add i64 %15, %37
  %42 = mul i64 %38, 2048
  %43 = mul i64 %39, 2048
  %44 = mul i64 %40, 2048
  %45 = mul i64 %41, 2048
  %46 = urem i32 %16, 32
  %47 = and i32 %46, 1
  %48 = icmp eq i32 %47, 0
  %49 = select i1 %48, i32 0, i32 8
  %50 = xor i32 0, %49
  %51 = and i32 %46, 2
  %52 = icmp eq i32 %51, 0
  %53 = select i1 %52, i32 0, i32 16
  %54 = xor i32 %50, %53
  %55 = and i32 %46, 4
  %56 = icmp eq i32 %55, 0
  %57 = select i1 %56, i32 0, i32 32
  %58 = xor i32 %54, %57
  %59 = and i32 %46, 8
  %60 = icmp eq i32 %59, 0
  %61 = select i1 %60, i32 0, i32 64
  %62 = xor i32 %58, %61
  %63 = and i32 %46, 16
  %64 = icmp eq i32 %63, 0
  %65 = select i1 %64, i32 0, i32 128
  %66 = xor i32 %62, %65
  %67 = xor i32 %66, 0
  %68 = add i32 %67, 0
  %69 = sext i32 %68 to i64
  %70 = add i64 %42, %69
  %71 = add i64 %43, %69
  %72 = add i64 %44, %69
  %73 = add i64 %45, %69
  %74 = getelementptr bfloat, ptr addrspace(1) %1, i64 %70
  %75 = getelementptr bfloat, ptr addrspace(1) %1, i64 %71
  %76 = getelementptr bfloat, ptr addrspace(1) %1, i64 %72
  %77 = getelementptr bfloat, ptr addrspace(1) %1, i64 %73
  %78 = select i1 %19, i32 0, i32 264
  %79 = xor i32 %66, %78
  %80 = select i1 %23, i32 0, i32 528
  %81 = xor i32 %79, %80
  %82 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %81
  %83 = xor i32 1056, %49
  %84 = xor i32 %83, %53
  %85 = xor i32 %84, %57
  %86 = xor i32 %85, %61
  %87 = xor i32 %86, %65
  %88 = xor i32 %87, %78
  %89 = xor i32 %88, %80
  %90 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %89
  %91 = xor i32 2048, %49
  %92 = xor i32 %91, %53
  %93 = xor i32 %92, %57
  %94 = xor i32 %93, %61
  %95 = xor i32 %94, %65
  %96 = xor i32 %95, %78
  %97 = xor i32 %96, %80
  %98 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %97
  %99 = xor i32 3104, %49
  %100 = xor i32 %99, %53
  %101 = xor i32 %100, %57
  %102 = xor i32 %101, %61
  %103 = xor i32 %102, %65
  %104 = xor i32 %103, %78
  %105 = xor i32 %104, %80
  %106 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %105
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %82, ptr addrspace(1) %74, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %90, ptr addrspace(1) %75, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %98, ptr addrspace(1) %76, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %106, ptr addrspace(1) %77, i32 16)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  %107 = add i64 %69, 256
  %108 = add i64 %42, %107
  %109 = add i64 %43, %107
  %110 = add i64 %44, %107
  %111 = add i64 %45, %107
  %112 = getelementptr bfloat, ptr addrspace(1) %1, i64 %108
  %113 = getelementptr bfloat, ptr addrspace(1) %1, i64 %109
  %114 = getelementptr bfloat, ptr addrspace(1) %1, i64 %110
  %115 = getelementptr bfloat, ptr addrspace(1) %1, i64 %111
  call void @llvm.nvvm.barrier0()
  %116 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 8192), i32 %81
  %117 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 8192), i32 %89
  %118 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 8192), i32 %97
  %119 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 8192), i32 %105
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %116, ptr addrspace(1) %112, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %117, ptr addrspace(1) %113, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %118, ptr addrspace(1) %114, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %119, ptr addrspace(1) %115, i32 16)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  call void asm sideeffect "cp.async.wait_group 0x1;", ""()
  call void @llvm.nvvm.barrier0()
  br label %120

120:                                              ; preds = %128, %0
  %121 = phi i32 [ %834, %128 ], [ 0, %0 ]
  %122 = phi i64 [ %800, %128 ], [ 256, %0 ]
  %123 = phi { float, float, float, float } [ %799, %128 ], [ zeroinitializer, %0 ]
  %124 = phi i32 [ %803, %128 ], [ 1, %0 ]
  %125 = phi i32 [ %825, %128 ], [ 0, %0 ]
  %126 = phi { ptr addrspace(3), i32, i32 } [ %833, %128 ], [ { ptr addrspace(3) @global_smem, i32 0, i32 0 }, %0 ]
  %127 = icmp slt i32 %121, 2048
  br i1 %127, label %128, label %835

128:                                              ; preds = %120
  %129 = icmp slt i32 %121, 1536
  %130 = extractvalue { ptr addrspace(3), i32, i32 } %126, 0
  %131 = select i1 %48, i32 0, i32 264
  %132 = xor i32 0, %131
  %133 = select i1 %52, i32 0, i32 528
  %134 = xor i32 %132, %133
  %135 = select i1 %56, i32 0, i32 1056
  %136 = xor i32 %134, %135
  %137 = select i1 %60, i32 0, i32 2048
  %138 = xor i32 %136, %137
  %139 = select i1 %64, i32 0, i32 8
  %140 = xor i32 %138, %139
  %141 = getelementptr inbounds bfloat, ptr addrspace(3) %130, i32 %140
  %142 = ptrtoint ptr addrspace(3) %141 to i32
  %143 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %142)
  %144 = extractvalue { i32, i32, i32, i32 } %143, 0
  %145 = extractvalue { i32, i32, i32, i32 } %143, 1
  %146 = extractvalue { i32, i32, i32, i32 } %143, 2
  %147 = extractvalue { i32, i32, i32, i32 } %143, 3
  %148 = xor i32 16, %131
  %149 = xor i32 %148, %133
  %150 = xor i32 %149, %135
  %151 = xor i32 %150, %137
  %152 = xor i32 %151, %139
  %153 = getelementptr inbounds bfloat, ptr addrspace(3) %130, i32 %152
  %154 = ptrtoint ptr addrspace(3) %153 to i32
  %155 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %154)
  %156 = extractvalue { i32, i32, i32, i32 } %155, 0
  %157 = extractvalue { i32, i32, i32, i32 } %155, 1
  %158 = extractvalue { i32, i32, i32, i32 } %155, 2
  %159 = extractvalue { i32, i32, i32, i32 } %155, 3
  %160 = xor i32 32, %131
  %161 = xor i32 %160, %133
  %162 = xor i32 %161, %135
  %163 = xor i32 %162, %137
  %164 = xor i32 %163, %139
  %165 = getelementptr inbounds bfloat, ptr addrspace(3) %130, i32 %164
  %166 = ptrtoint ptr addrspace(3) %165 to i32
  %167 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %166)
  %168 = extractvalue { i32, i32, i32, i32 } %167, 0
  %169 = extractvalue { i32, i32, i32, i32 } %167, 1
  %170 = extractvalue { i32, i32, i32, i32 } %167, 2
  %171 = extractvalue { i32, i32, i32, i32 } %167, 3
  %172 = xor i32 48, %131
  %173 = xor i32 %172, %133
  %174 = xor i32 %173, %135
  %175 = xor i32 %174, %137
  %176 = xor i32 %175, %139
  %177 = getelementptr inbounds bfloat, ptr addrspace(3) %130, i32 %176
  %178 = ptrtoint ptr addrspace(3) %177 to i32
  %179 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %178)
  %180 = extractvalue { i32, i32, i32, i32 } %179, 0
  %181 = extractvalue { i32, i32, i32, i32 } %179, 1
  %182 = extractvalue { i32, i32, i32, i32 } %179, 2
  %183 = extractvalue { i32, i32, i32, i32 } %179, 3
  %184 = xor i32 64, %131
  %185 = xor i32 %184, %133
  %186 = xor i32 %185, %135
  %187 = xor i32 %186, %137
  %188 = xor i32 %187, %139
  %189 = getelementptr inbounds bfloat, ptr addrspace(3) %130, i32 %188
  %190 = ptrtoint ptr addrspace(3) %189 to i32
  %191 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %190)
  %192 = extractvalue { i32, i32, i32, i32 } %191, 0
  %193 = extractvalue { i32, i32, i32, i32 } %191, 1
  %194 = extractvalue { i32, i32, i32, i32 } %191, 2
  %195 = extractvalue { i32, i32, i32, i32 } %191, 3
  %196 = xor i32 80, %131
  %197 = xor i32 %196, %133
  %198 = xor i32 %197, %135
  %199 = xor i32 %198, %137
  %200 = xor i32 %199, %139
  %201 = getelementptr inbounds bfloat, ptr addrspace(3) %130, i32 %200
  %202 = ptrtoint ptr addrspace(3) %201 to i32
  %203 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %202)
  %204 = extractvalue { i32, i32, i32, i32 } %203, 0
  %205 = extractvalue { i32, i32, i32, i32 } %203, 1
  %206 = extractvalue { i32, i32, i32, i32 } %203, 2
  %207 = extractvalue { i32, i32, i32, i32 } %203, 3
  %208 = xor i32 96, %131
  %209 = xor i32 %208, %133
  %210 = xor i32 %209, %135
  %211 = xor i32 %210, %137
  %212 = xor i32 %211, %139
  %213 = getelementptr inbounds bfloat, ptr addrspace(3) %130, i32 %212
  %214 = ptrtoint ptr addrspace(3) %213 to i32
  %215 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %214)
  %216 = extractvalue { i32, i32, i32, i32 } %215, 0
  %217 = extractvalue { i32, i32, i32, i32 } %215, 1
  %218 = extractvalue { i32, i32, i32, i32 } %215, 2
  %219 = extractvalue { i32, i32, i32, i32 } %215, 3
  %220 = xor i32 112, %131
  %221 = xor i32 %220, %133
  %222 = xor i32 %221, %135
  %223 = xor i32 %222, %137
  %224 = xor i32 %223, %139
  %225 = getelementptr inbounds bfloat, ptr addrspace(3) %130, i32 %224
  %226 = ptrtoint ptr addrspace(3) %225 to i32
  %227 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %226)
  %228 = extractvalue { i32, i32, i32, i32 } %227, 0
  %229 = extractvalue { i32, i32, i32, i32 } %227, 1
  %230 = extractvalue { i32, i32, i32, i32 } %227, 2
  %231 = extractvalue { i32, i32, i32, i32 } %227, 3
  %232 = xor i32 128, %131
  %233 = xor i32 %232, %133
  %234 = xor i32 %233, %135
  %235 = xor i32 %234, %137
  %236 = xor i32 %235, %139
  %237 = getelementptr inbounds bfloat, ptr addrspace(3) %130, i32 %236
  %238 = ptrtoint ptr addrspace(3) %237 to i32
  %239 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %238)
  %240 = extractvalue { i32, i32, i32, i32 } %239, 0
  %241 = extractvalue { i32, i32, i32, i32 } %239, 1
  %242 = extractvalue { i32, i32, i32, i32 } %239, 2
  %243 = extractvalue { i32, i32, i32, i32 } %239, 3
  %244 = xor i32 144, %131
  %245 = xor i32 %244, %133
  %246 = xor i32 %245, %135
  %247 = xor i32 %246, %137
  %248 = xor i32 %247, %139
  %249 = getelementptr inbounds bfloat, ptr addrspace(3) %130, i32 %248
  %250 = ptrtoint ptr addrspace(3) %249 to i32
  %251 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %250)
  %252 = extractvalue { i32, i32, i32, i32 } %251, 0
  %253 = extractvalue { i32, i32, i32, i32 } %251, 1
  %254 = extractvalue { i32, i32, i32, i32 } %251, 2
  %255 = extractvalue { i32, i32, i32, i32 } %251, 3
  %256 = xor i32 160, %131
  %257 = xor i32 %256, %133
  %258 = xor i32 %257, %135
  %259 = xor i32 %258, %137
  %260 = xor i32 %259, %139
  %261 = getelementptr inbounds bfloat, ptr addrspace(3) %130, i32 %260
  %262 = ptrtoint ptr addrspace(3) %261 to i32
  %263 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %262)
  %264 = extractvalue { i32, i32, i32, i32 } %263, 0
  %265 = extractvalue { i32, i32, i32, i32 } %263, 1
  %266 = extractvalue { i32, i32, i32, i32 } %263, 2
  %267 = extractvalue { i32, i32, i32, i32 } %263, 3
  %268 = xor i32 176, %131
  %269 = xor i32 %268, %133
  %270 = xor i32 %269, %135
  %271 = xor i32 %270, %137
  %272 = xor i32 %271, %139
  %273 = getelementptr inbounds bfloat, ptr addrspace(3) %130, i32 %272
  %274 = ptrtoint ptr addrspace(3) %273 to i32
  %275 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %274)
  %276 = extractvalue { i32, i32, i32, i32 } %275, 0
  %277 = extractvalue { i32, i32, i32, i32 } %275, 1
  %278 = extractvalue { i32, i32, i32, i32 } %275, 2
  %279 = extractvalue { i32, i32, i32, i32 } %275, 3
  %280 = xor i32 192, %131
  %281 = xor i32 %280, %133
  %282 = xor i32 %281, %135
  %283 = xor i32 %282, %137
  %284 = xor i32 %283, %139
  %285 = getelementptr inbounds bfloat, ptr addrspace(3) %130, i32 %284
  %286 = ptrtoint ptr addrspace(3) %285 to i32
  %287 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %286)
  %288 = extractvalue { i32, i32, i32, i32 } %287, 0
  %289 = extractvalue { i32, i32, i32, i32 } %287, 1
  %290 = extractvalue { i32, i32, i32, i32 } %287, 2
  %291 = extractvalue { i32, i32, i32, i32 } %287, 3
  %292 = xor i32 208, %131
  %293 = xor i32 %292, %133
  %294 = xor i32 %293, %135
  %295 = xor i32 %294, %137
  %296 = xor i32 %295, %139
  %297 = getelementptr inbounds bfloat, ptr addrspace(3) %130, i32 %296
  %298 = ptrtoint ptr addrspace(3) %297 to i32
  %299 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %298)
  %300 = extractvalue { i32, i32, i32, i32 } %299, 0
  %301 = extractvalue { i32, i32, i32, i32 } %299, 1
  %302 = extractvalue { i32, i32, i32, i32 } %299, 2
  %303 = extractvalue { i32, i32, i32, i32 } %299, 3
  %304 = xor i32 224, %131
  %305 = xor i32 %304, %133
  %306 = xor i32 %305, %135
  %307 = xor i32 %306, %137
  %308 = xor i32 %307, %139
  %309 = getelementptr inbounds bfloat, ptr addrspace(3) %130, i32 %308
  %310 = ptrtoint ptr addrspace(3) %309 to i32
  %311 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %310)
  %312 = extractvalue { i32, i32, i32, i32 } %311, 0
  %313 = extractvalue { i32, i32, i32, i32 } %311, 1
  %314 = extractvalue { i32, i32, i32, i32 } %311, 2
  %315 = extractvalue { i32, i32, i32, i32 } %311, 3
  %316 = xor i32 240, %131
  %317 = xor i32 %316, %133
  %318 = xor i32 %317, %135
  %319 = xor i32 %318, %137
  %320 = xor i32 %319, %139
  %321 = getelementptr inbounds bfloat, ptr addrspace(3) %130, i32 %320
  %322 = ptrtoint ptr addrspace(3) %321 to i32
  %323 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %322)
  %324 = extractvalue { i32, i32, i32, i32 } %323, 0
  %325 = extractvalue { i32, i32, i32, i32 } %323, 1
  %326 = extractvalue { i32, i32, i32, i32 } %323, 2
  %327 = extractvalue { i32, i32, i32, i32 } %323, 3
  %328 = bitcast i32 %144 to <2 x bfloat>
  %329 = extractelement <2 x bfloat> %328, i32 0
  %330 = extractelement <2 x bfloat> %328, i32 1
  %331 = bitcast i32 %145 to <2 x bfloat>
  %332 = extractelement <2 x bfloat> %331, i32 0
  %333 = extractelement <2 x bfloat> %331, i32 1
  %334 = bitcast i32 %146 to <2 x bfloat>
  %335 = extractelement <2 x bfloat> %334, i32 0
  %336 = extractelement <2 x bfloat> %334, i32 1
  %337 = bitcast i32 %147 to <2 x bfloat>
  %338 = extractelement <2 x bfloat> %337, i32 0
  %339 = extractelement <2 x bfloat> %337, i32 1
  %340 = bitcast i32 %156 to <2 x bfloat>
  %341 = extractelement <2 x bfloat> %340, i32 0
  %342 = extractelement <2 x bfloat> %340, i32 1
  %343 = bitcast i32 %157 to <2 x bfloat>
  %344 = extractelement <2 x bfloat> %343, i32 0
  %345 = extractelement <2 x bfloat> %343, i32 1
  %346 = bitcast i32 %158 to <2 x bfloat>
  %347 = extractelement <2 x bfloat> %346, i32 0
  %348 = extractelement <2 x bfloat> %346, i32 1
  %349 = bitcast i32 %159 to <2 x bfloat>
  %350 = extractelement <2 x bfloat> %349, i32 0
  %351 = extractelement <2 x bfloat> %349, i32 1
  %352 = bitcast i32 %168 to <2 x bfloat>
  %353 = extractelement <2 x bfloat> %352, i32 0
  %354 = extractelement <2 x bfloat> %352, i32 1
  %355 = bitcast i32 %169 to <2 x bfloat>
  %356 = extractelement <2 x bfloat> %355, i32 0
  %357 = extractelement <2 x bfloat> %355, i32 1
  %358 = bitcast i32 %170 to <2 x bfloat>
  %359 = extractelement <2 x bfloat> %358, i32 0
  %360 = extractelement <2 x bfloat> %358, i32 1
  %361 = bitcast i32 %171 to <2 x bfloat>
  %362 = extractelement <2 x bfloat> %361, i32 0
  %363 = extractelement <2 x bfloat> %361, i32 1
  %364 = bitcast i32 %180 to <2 x bfloat>
  %365 = extractelement <2 x bfloat> %364, i32 0
  %366 = extractelement <2 x bfloat> %364, i32 1
  %367 = bitcast i32 %181 to <2 x bfloat>
  %368 = extractelement <2 x bfloat> %367, i32 0
  %369 = extractelement <2 x bfloat> %367, i32 1
  %370 = bitcast i32 %182 to <2 x bfloat>
  %371 = extractelement <2 x bfloat> %370, i32 0
  %372 = extractelement <2 x bfloat> %370, i32 1
  %373 = bitcast i32 %183 to <2 x bfloat>
  %374 = extractelement <2 x bfloat> %373, i32 0
  %375 = extractelement <2 x bfloat> %373, i32 1
  %376 = bitcast i32 %192 to <2 x bfloat>
  %377 = extractelement <2 x bfloat> %376, i32 0
  %378 = extractelement <2 x bfloat> %376, i32 1
  %379 = bitcast i32 %193 to <2 x bfloat>
  %380 = extractelement <2 x bfloat> %379, i32 0
  %381 = extractelement <2 x bfloat> %379, i32 1
  %382 = bitcast i32 %194 to <2 x bfloat>
  %383 = extractelement <2 x bfloat> %382, i32 0
  %384 = extractelement <2 x bfloat> %382, i32 1
  %385 = bitcast i32 %195 to <2 x bfloat>
  %386 = extractelement <2 x bfloat> %385, i32 0
  %387 = extractelement <2 x bfloat> %385, i32 1
  %388 = bitcast i32 %204 to <2 x bfloat>
  %389 = extractelement <2 x bfloat> %388, i32 0
  %390 = extractelement <2 x bfloat> %388, i32 1
  %391 = bitcast i32 %205 to <2 x bfloat>
  %392 = extractelement <2 x bfloat> %391, i32 0
  %393 = extractelement <2 x bfloat> %391, i32 1
  %394 = bitcast i32 %206 to <2 x bfloat>
  %395 = extractelement <2 x bfloat> %394, i32 0
  %396 = extractelement <2 x bfloat> %394, i32 1
  %397 = bitcast i32 %207 to <2 x bfloat>
  %398 = extractelement <2 x bfloat> %397, i32 0
  %399 = extractelement <2 x bfloat> %397, i32 1
  %400 = bitcast i32 %216 to <2 x bfloat>
  %401 = extractelement <2 x bfloat> %400, i32 0
  %402 = extractelement <2 x bfloat> %400, i32 1
  %403 = bitcast i32 %217 to <2 x bfloat>
  %404 = extractelement <2 x bfloat> %403, i32 0
  %405 = extractelement <2 x bfloat> %403, i32 1
  %406 = bitcast i32 %218 to <2 x bfloat>
  %407 = extractelement <2 x bfloat> %406, i32 0
  %408 = extractelement <2 x bfloat> %406, i32 1
  %409 = bitcast i32 %219 to <2 x bfloat>
  %410 = extractelement <2 x bfloat> %409, i32 0
  %411 = extractelement <2 x bfloat> %409, i32 1
  %412 = bitcast i32 %228 to <2 x bfloat>
  %413 = extractelement <2 x bfloat> %412, i32 0
  %414 = extractelement <2 x bfloat> %412, i32 1
  %415 = bitcast i32 %229 to <2 x bfloat>
  %416 = extractelement <2 x bfloat> %415, i32 0
  %417 = extractelement <2 x bfloat> %415, i32 1
  %418 = bitcast i32 %230 to <2 x bfloat>
  %419 = extractelement <2 x bfloat> %418, i32 0
  %420 = extractelement <2 x bfloat> %418, i32 1
  %421 = bitcast i32 %231 to <2 x bfloat>
  %422 = extractelement <2 x bfloat> %421, i32 0
  %423 = extractelement <2 x bfloat> %421, i32 1
  %424 = bitcast i32 %240 to <2 x bfloat>
  %425 = extractelement <2 x bfloat> %424, i32 0
  %426 = extractelement <2 x bfloat> %424, i32 1
  %427 = bitcast i32 %241 to <2 x bfloat>
  %428 = extractelement <2 x bfloat> %427, i32 0
  %429 = extractelement <2 x bfloat> %427, i32 1
  %430 = bitcast i32 %242 to <2 x bfloat>
  %431 = extractelement <2 x bfloat> %430, i32 0
  %432 = extractelement <2 x bfloat> %430, i32 1
  %433 = bitcast i32 %243 to <2 x bfloat>
  %434 = extractelement <2 x bfloat> %433, i32 0
  %435 = extractelement <2 x bfloat> %433, i32 1
  %436 = bitcast i32 %252 to <2 x bfloat>
  %437 = extractelement <2 x bfloat> %436, i32 0
  %438 = extractelement <2 x bfloat> %436, i32 1
  %439 = bitcast i32 %253 to <2 x bfloat>
  %440 = extractelement <2 x bfloat> %439, i32 0
  %441 = extractelement <2 x bfloat> %439, i32 1
  %442 = bitcast i32 %254 to <2 x bfloat>
  %443 = extractelement <2 x bfloat> %442, i32 0
  %444 = extractelement <2 x bfloat> %442, i32 1
  %445 = bitcast i32 %255 to <2 x bfloat>
  %446 = extractelement <2 x bfloat> %445, i32 0
  %447 = extractelement <2 x bfloat> %445, i32 1
  %448 = bitcast i32 %264 to <2 x bfloat>
  %449 = extractelement <2 x bfloat> %448, i32 0
  %450 = extractelement <2 x bfloat> %448, i32 1
  %451 = bitcast i32 %265 to <2 x bfloat>
  %452 = extractelement <2 x bfloat> %451, i32 0
  %453 = extractelement <2 x bfloat> %451, i32 1
  %454 = bitcast i32 %266 to <2 x bfloat>
  %455 = extractelement <2 x bfloat> %454, i32 0
  %456 = extractelement <2 x bfloat> %454, i32 1
  %457 = bitcast i32 %267 to <2 x bfloat>
  %458 = extractelement <2 x bfloat> %457, i32 0
  %459 = extractelement <2 x bfloat> %457, i32 1
  %460 = bitcast i32 %276 to <2 x bfloat>
  %461 = extractelement <2 x bfloat> %460, i32 0
  %462 = extractelement <2 x bfloat> %460, i32 1
  %463 = bitcast i32 %277 to <2 x bfloat>
  %464 = extractelement <2 x bfloat> %463, i32 0
  %465 = extractelement <2 x bfloat> %463, i32 1
  %466 = bitcast i32 %278 to <2 x bfloat>
  %467 = extractelement <2 x bfloat> %466, i32 0
  %468 = extractelement <2 x bfloat> %466, i32 1
  %469 = bitcast i32 %279 to <2 x bfloat>
  %470 = extractelement <2 x bfloat> %469, i32 0
  %471 = extractelement <2 x bfloat> %469, i32 1
  %472 = bitcast i32 %288 to <2 x bfloat>
  %473 = extractelement <2 x bfloat> %472, i32 0
  %474 = extractelement <2 x bfloat> %472, i32 1
  %475 = bitcast i32 %289 to <2 x bfloat>
  %476 = extractelement <2 x bfloat> %475, i32 0
  %477 = extractelement <2 x bfloat> %475, i32 1
  %478 = bitcast i32 %290 to <2 x bfloat>
  %479 = extractelement <2 x bfloat> %478, i32 0
  %480 = extractelement <2 x bfloat> %478, i32 1
  %481 = bitcast i32 %291 to <2 x bfloat>
  %482 = extractelement <2 x bfloat> %481, i32 0
  %483 = extractelement <2 x bfloat> %481, i32 1
  %484 = bitcast i32 %300 to <2 x bfloat>
  %485 = extractelement <2 x bfloat> %484, i32 0
  %486 = extractelement <2 x bfloat> %484, i32 1
  %487 = bitcast i32 %301 to <2 x bfloat>
  %488 = extractelement <2 x bfloat> %487, i32 0
  %489 = extractelement <2 x bfloat> %487, i32 1
  %490 = bitcast i32 %302 to <2 x bfloat>
  %491 = extractelement <2 x bfloat> %490, i32 0
  %492 = extractelement <2 x bfloat> %490, i32 1
  %493 = bitcast i32 %303 to <2 x bfloat>
  %494 = extractelement <2 x bfloat> %493, i32 0
  %495 = extractelement <2 x bfloat> %493, i32 1
  %496 = bitcast i32 %312 to <2 x bfloat>
  %497 = extractelement <2 x bfloat> %496, i32 0
  %498 = extractelement <2 x bfloat> %496, i32 1
  %499 = bitcast i32 %313 to <2 x bfloat>
  %500 = extractelement <2 x bfloat> %499, i32 0
  %501 = extractelement <2 x bfloat> %499, i32 1
  %502 = bitcast i32 %314 to <2 x bfloat>
  %503 = extractelement <2 x bfloat> %502, i32 0
  %504 = extractelement <2 x bfloat> %502, i32 1
  %505 = bitcast i32 %315 to <2 x bfloat>
  %506 = extractelement <2 x bfloat> %505, i32 0
  %507 = extractelement <2 x bfloat> %505, i32 1
  %508 = bitcast i32 %324 to <2 x bfloat>
  %509 = extractelement <2 x bfloat> %508, i32 0
  %510 = extractelement <2 x bfloat> %508, i32 1
  %511 = bitcast i32 %325 to <2 x bfloat>
  %512 = extractelement <2 x bfloat> %511, i32 0
  %513 = extractelement <2 x bfloat> %511, i32 1
  %514 = bitcast i32 %326 to <2 x bfloat>
  %515 = extractelement <2 x bfloat> %514, i32 0
  %516 = extractelement <2 x bfloat> %514, i32 1
  %517 = bitcast i32 %327 to <2 x bfloat>
  %518 = extractelement <2 x bfloat> %517, i32 0
  %519 = extractelement <2 x bfloat> %517, i32 1
  %520 = insertelement <2 x bfloat> undef, bfloat %329, i32 0
  %521 = insertelement <2 x bfloat> %520, bfloat %330, i32 1
  %522 = bitcast <2 x bfloat> %521 to i32
  %523 = insertelement <2 x bfloat> undef, bfloat %332, i32 0
  %524 = insertelement <2 x bfloat> %523, bfloat %333, i32 1
  %525 = bitcast <2 x bfloat> %524 to i32
  %526 = insertelement <2 x bfloat> undef, bfloat %335, i32 0
  %527 = insertelement <2 x bfloat> %526, bfloat %336, i32 1
  %528 = bitcast <2 x bfloat> %527 to i32
  %529 = insertelement <2 x bfloat> undef, bfloat %338, i32 0
  %530 = insertelement <2 x bfloat> %529, bfloat %339, i32 1
  %531 = bitcast <2 x bfloat> %530 to i32
  %532 = insertelement <2 x bfloat> undef, bfloat %341, i32 0
  %533 = insertelement <2 x bfloat> %532, bfloat %342, i32 1
  %534 = bitcast <2 x bfloat> %533 to i32
  %535 = insertelement <2 x bfloat> undef, bfloat %344, i32 0
  %536 = insertelement <2 x bfloat> %535, bfloat %345, i32 1
  %537 = bitcast <2 x bfloat> %536 to i32
  %538 = insertelement <2 x bfloat> undef, bfloat %347, i32 0
  %539 = insertelement <2 x bfloat> %538, bfloat %348, i32 1
  %540 = bitcast <2 x bfloat> %539 to i32
  %541 = insertelement <2 x bfloat> undef, bfloat %350, i32 0
  %542 = insertelement <2 x bfloat> %541, bfloat %351, i32 1
  %543 = bitcast <2 x bfloat> %542 to i32
  %544 = insertelement <2 x bfloat> undef, bfloat %353, i32 0
  %545 = insertelement <2 x bfloat> %544, bfloat %354, i32 1
  %546 = bitcast <2 x bfloat> %545 to i32
  %547 = insertelement <2 x bfloat> undef, bfloat %356, i32 0
  %548 = insertelement <2 x bfloat> %547, bfloat %357, i32 1
  %549 = bitcast <2 x bfloat> %548 to i32
  %550 = insertelement <2 x bfloat> undef, bfloat %359, i32 0
  %551 = insertelement <2 x bfloat> %550, bfloat %360, i32 1
  %552 = bitcast <2 x bfloat> %551 to i32
  %553 = insertelement <2 x bfloat> undef, bfloat %362, i32 0
  %554 = insertelement <2 x bfloat> %553, bfloat %363, i32 1
  %555 = bitcast <2 x bfloat> %554 to i32
  %556 = insertelement <2 x bfloat> undef, bfloat %365, i32 0
  %557 = insertelement <2 x bfloat> %556, bfloat %366, i32 1
  %558 = bitcast <2 x bfloat> %557 to i32
  %559 = insertelement <2 x bfloat> undef, bfloat %368, i32 0
  %560 = insertelement <2 x bfloat> %559, bfloat %369, i32 1
  %561 = bitcast <2 x bfloat> %560 to i32
  %562 = insertelement <2 x bfloat> undef, bfloat %371, i32 0
  %563 = insertelement <2 x bfloat> %562, bfloat %372, i32 1
  %564 = bitcast <2 x bfloat> %563 to i32
  %565 = insertelement <2 x bfloat> undef, bfloat %374, i32 0
  %566 = insertelement <2 x bfloat> %565, bfloat %375, i32 1
  %567 = bitcast <2 x bfloat> %566 to i32
  %568 = insertelement <2 x bfloat> undef, bfloat %377, i32 0
  %569 = insertelement <2 x bfloat> %568, bfloat %378, i32 1
  %570 = bitcast <2 x bfloat> %569 to i32
  %571 = insertelement <2 x bfloat> undef, bfloat %380, i32 0
  %572 = insertelement <2 x bfloat> %571, bfloat %381, i32 1
  %573 = bitcast <2 x bfloat> %572 to i32
  %574 = insertelement <2 x bfloat> undef, bfloat %383, i32 0
  %575 = insertelement <2 x bfloat> %574, bfloat %384, i32 1
  %576 = bitcast <2 x bfloat> %575 to i32
  %577 = insertelement <2 x bfloat> undef, bfloat %386, i32 0
  %578 = insertelement <2 x bfloat> %577, bfloat %387, i32 1
  %579 = bitcast <2 x bfloat> %578 to i32
  %580 = insertelement <2 x bfloat> undef, bfloat %389, i32 0
  %581 = insertelement <2 x bfloat> %580, bfloat %390, i32 1
  %582 = bitcast <2 x bfloat> %581 to i32
  %583 = insertelement <2 x bfloat> undef, bfloat %392, i32 0
  %584 = insertelement <2 x bfloat> %583, bfloat %393, i32 1
  %585 = bitcast <2 x bfloat> %584 to i32
  %586 = insertelement <2 x bfloat> undef, bfloat %395, i32 0
  %587 = insertelement <2 x bfloat> %586, bfloat %396, i32 1
  %588 = bitcast <2 x bfloat> %587 to i32
  %589 = insertelement <2 x bfloat> undef, bfloat %398, i32 0
  %590 = insertelement <2 x bfloat> %589, bfloat %399, i32 1
  %591 = bitcast <2 x bfloat> %590 to i32
  %592 = insertelement <2 x bfloat> undef, bfloat %401, i32 0
  %593 = insertelement <2 x bfloat> %592, bfloat %402, i32 1
  %594 = bitcast <2 x bfloat> %593 to i32
  %595 = insertelement <2 x bfloat> undef, bfloat %404, i32 0
  %596 = insertelement <2 x bfloat> %595, bfloat %405, i32 1
  %597 = bitcast <2 x bfloat> %596 to i32
  %598 = insertelement <2 x bfloat> undef, bfloat %407, i32 0
  %599 = insertelement <2 x bfloat> %598, bfloat %408, i32 1
  %600 = bitcast <2 x bfloat> %599 to i32
  %601 = insertelement <2 x bfloat> undef, bfloat %410, i32 0
  %602 = insertelement <2 x bfloat> %601, bfloat %411, i32 1
  %603 = bitcast <2 x bfloat> %602 to i32
  %604 = insertelement <2 x bfloat> undef, bfloat %413, i32 0
  %605 = insertelement <2 x bfloat> %604, bfloat %414, i32 1
  %606 = bitcast <2 x bfloat> %605 to i32
  %607 = insertelement <2 x bfloat> undef, bfloat %416, i32 0
  %608 = insertelement <2 x bfloat> %607, bfloat %417, i32 1
  %609 = bitcast <2 x bfloat> %608 to i32
  %610 = insertelement <2 x bfloat> undef, bfloat %419, i32 0
  %611 = insertelement <2 x bfloat> %610, bfloat %420, i32 1
  %612 = bitcast <2 x bfloat> %611 to i32
  %613 = insertelement <2 x bfloat> undef, bfloat %422, i32 0
  %614 = insertelement <2 x bfloat> %613, bfloat %423, i32 1
  %615 = bitcast <2 x bfloat> %614 to i32
  %616 = insertelement <2 x bfloat> undef, bfloat %425, i32 0
  %617 = insertelement <2 x bfloat> %616, bfloat %426, i32 1
  %618 = bitcast <2 x bfloat> %617 to i32
  %619 = insertelement <2 x bfloat> undef, bfloat %428, i32 0
  %620 = insertelement <2 x bfloat> %619, bfloat %429, i32 1
  %621 = bitcast <2 x bfloat> %620 to i32
  %622 = insertelement <2 x bfloat> undef, bfloat %431, i32 0
  %623 = insertelement <2 x bfloat> %622, bfloat %432, i32 1
  %624 = bitcast <2 x bfloat> %623 to i32
  %625 = insertelement <2 x bfloat> undef, bfloat %434, i32 0
  %626 = insertelement <2 x bfloat> %625, bfloat %435, i32 1
  %627 = bitcast <2 x bfloat> %626 to i32
  %628 = insertelement <2 x bfloat> undef, bfloat %437, i32 0
  %629 = insertelement <2 x bfloat> %628, bfloat %438, i32 1
  %630 = bitcast <2 x bfloat> %629 to i32
  %631 = insertelement <2 x bfloat> undef, bfloat %440, i32 0
  %632 = insertelement <2 x bfloat> %631, bfloat %441, i32 1
  %633 = bitcast <2 x bfloat> %632 to i32
  %634 = insertelement <2 x bfloat> undef, bfloat %443, i32 0
  %635 = insertelement <2 x bfloat> %634, bfloat %444, i32 1
  %636 = bitcast <2 x bfloat> %635 to i32
  %637 = insertelement <2 x bfloat> undef, bfloat %446, i32 0
  %638 = insertelement <2 x bfloat> %637, bfloat %447, i32 1
  %639 = bitcast <2 x bfloat> %638 to i32
  %640 = insertelement <2 x bfloat> undef, bfloat %449, i32 0
  %641 = insertelement <2 x bfloat> %640, bfloat %450, i32 1
  %642 = bitcast <2 x bfloat> %641 to i32
  %643 = insertelement <2 x bfloat> undef, bfloat %452, i32 0
  %644 = insertelement <2 x bfloat> %643, bfloat %453, i32 1
  %645 = bitcast <2 x bfloat> %644 to i32
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
  %712 = extractvalue { float, float, float, float } %123, 0
  %713 = extractvalue { float, float, float, float } %123, 1
  %714 = extractvalue { float, float, float, float } %123, 2
  %715 = extractvalue { float, float, float, float } %123, 3
  %716 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %712, float %713, float %714, float %715, i32 %522, i32 %525, i32 %528, i32 %531, i32 0, i32 0)
  %717 = extractvalue { float, float, float, float } %716, 0
  %718 = extractvalue { float, float, float, float } %716, 1
  %719 = extractvalue { float, float, float, float } %716, 2
  %720 = extractvalue { float, float, float, float } %716, 3
  %721 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %717, float %718, float %719, float %720, i32 %534, i32 %537, i32 %540, i32 %543, i32 0, i32 0)
  %722 = extractvalue { float, float, float, float } %721, 0
  %723 = extractvalue { float, float, float, float } %721, 1
  %724 = extractvalue { float, float, float, float } %721, 2
  %725 = extractvalue { float, float, float, float } %721, 3
  %726 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %722, float %723, float %724, float %725, i32 %546, i32 %549, i32 %552, i32 %555, i32 0, i32 0)
  %727 = extractvalue { float, float, float, float } %726, 0
  %728 = extractvalue { float, float, float, float } %726, 1
  %729 = extractvalue { float, float, float, float } %726, 2
  %730 = extractvalue { float, float, float, float } %726, 3
  %731 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %727, float %728, float %729, float %730, i32 %558, i32 %561, i32 %564, i32 %567, i32 0, i32 0)
  %732 = extractvalue { float, float, float, float } %731, 0
  %733 = extractvalue { float, float, float, float } %731, 1
  %734 = extractvalue { float, float, float, float } %731, 2
  %735 = extractvalue { float, float, float, float } %731, 3
  %736 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %732, float %733, float %734, float %735, i32 %570, i32 %573, i32 %576, i32 %579, i32 0, i32 0)
  %737 = extractvalue { float, float, float, float } %736, 0
  %738 = extractvalue { float, float, float, float } %736, 1
  %739 = extractvalue { float, float, float, float } %736, 2
  %740 = extractvalue { float, float, float, float } %736, 3
  %741 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %737, float %738, float %739, float %740, i32 %582, i32 %585, i32 %588, i32 %591, i32 0, i32 0)
  %742 = extractvalue { float, float, float, float } %741, 0
  %743 = extractvalue { float, float, float, float } %741, 1
  %744 = extractvalue { float, float, float, float } %741, 2
  %745 = extractvalue { float, float, float, float } %741, 3
  %746 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %742, float %743, float %744, float %745, i32 %594, i32 %597, i32 %600, i32 %603, i32 0, i32 0)
  %747 = extractvalue { float, float, float, float } %746, 0
  %748 = extractvalue { float, float, float, float } %746, 1
  %749 = extractvalue { float, float, float, float } %746, 2
  %750 = extractvalue { float, float, float, float } %746, 3
  %751 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %747, float %748, float %749, float %750, i32 %606, i32 %609, i32 %612, i32 %615, i32 0, i32 0)
  %752 = extractvalue { float, float, float, float } %751, 0
  %753 = extractvalue { float, float, float, float } %751, 1
  %754 = extractvalue { float, float, float, float } %751, 2
  %755 = extractvalue { float, float, float, float } %751, 3
  %756 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %752, float %753, float %754, float %755, i32 %618, i32 %621, i32 %624, i32 %627, i32 0, i32 0)
  %757 = extractvalue { float, float, float, float } %756, 0
  %758 = extractvalue { float, float, float, float } %756, 1
  %759 = extractvalue { float, float, float, float } %756, 2
  %760 = extractvalue { float, float, float, float } %756, 3
  %761 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %757, float %758, float %759, float %760, i32 %630, i32 %633, i32 %636, i32 %639, i32 0, i32 0)
  %762 = extractvalue { float, float, float, float } %761, 0
  %763 = extractvalue { float, float, float, float } %761, 1
  %764 = extractvalue { float, float, float, float } %761, 2
  %765 = extractvalue { float, float, float, float } %761, 3
  %766 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %762, float %763, float %764, float %765, i32 %642, i32 %645, i32 %648, i32 %651, i32 0, i32 0)
  %767 = extractvalue { float, float, float, float } %766, 0
  %768 = extractvalue { float, float, float, float } %766, 1
  %769 = extractvalue { float, float, float, float } %766, 2
  %770 = extractvalue { float, float, float, float } %766, 3
  %771 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %767, float %768, float %769, float %770, i32 %654, i32 %657, i32 %660, i32 %663, i32 0, i32 0)
  %772 = extractvalue { float, float, float, float } %771, 0
  %773 = extractvalue { float, float, float, float } %771, 1
  %774 = extractvalue { float, float, float, float } %771, 2
  %775 = extractvalue { float, float, float, float } %771, 3
  %776 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %772, float %773, float %774, float %775, i32 %666, i32 %669, i32 %672, i32 %675, i32 0, i32 0)
  %777 = extractvalue { float, float, float, float } %776, 0
  %778 = extractvalue { float, float, float, float } %776, 1
  %779 = extractvalue { float, float, float, float } %776, 2
  %780 = extractvalue { float, float, float, float } %776, 3
  %781 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %777, float %778, float %779, float %780, i32 %678, i32 %681, i32 %684, i32 %687, i32 0, i32 0)
  %782 = extractvalue { float, float, float, float } %781, 0
  %783 = extractvalue { float, float, float, float } %781, 1
  %784 = extractvalue { float, float, float, float } %781, 2
  %785 = extractvalue { float, float, float, float } %781, 3
  %786 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %782, float %783, float %784, float %785, i32 %690, i32 %693, i32 %696, i32 %699, i32 0, i32 0)
  %787 = extractvalue { float, float, float, float } %786, 0
  %788 = extractvalue { float, float, float, float } %786, 1
  %789 = extractvalue { float, float, float, float } %786, 2
  %790 = extractvalue { float, float, float, float } %786, 3
  %791 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %787, float %788, float %789, float %790, i32 %702, i32 %705, i32 %708, i32 %711, i32 0, i32 0)
  %792 = extractvalue { float, float, float, float } %791, 0
  %793 = extractvalue { float, float, float, float } %791, 1
  %794 = extractvalue { float, float, float, float } %791, 2
  %795 = extractvalue { float, float, float, float } %791, 3
  %796 = insertvalue { float, float, float, float } undef, float %792, 0
  %797 = insertvalue { float, float, float, float } %796, float %793, 1
  %798 = insertvalue { float, float, float, float } %797, float %794, 2
  %799 = insertvalue { float, float, float, float } %798, float %795, 3
  %800 = add i64 %122, 256
  %801 = add i32 %124, 1
  %802 = icmp slt i32 %801, 2
  %803 = select i1 %802, i32 %801, i32 0
  %804 = add i64 %800, %69
  %805 = add i64 %42, %804
  %806 = add i64 %43, %804
  %807 = add i64 %44, %804
  %808 = add i64 %45, %804
  %809 = getelementptr bfloat, ptr addrspace(1) %1, i64 %805
  %810 = getelementptr bfloat, ptr addrspace(1) %1, i64 %806
  %811 = getelementptr bfloat, ptr addrspace(1) %1, i64 %807
  %812 = getelementptr bfloat, ptr addrspace(1) %1, i64 %808
  %813 = mul i32 %803, 4096
  %814 = add i32 %813, 0
  %815 = add i32 %814, 0
  %816 = add i32 %815, 0
  %817 = getelementptr bfloat, ptr addrspace(3) @global_smem, i32 %816
  call void @llvm.nvvm.barrier0()
  %818 = getelementptr inbounds bfloat, ptr addrspace(3) %817, i32 %81
  %819 = getelementptr inbounds bfloat, ptr addrspace(3) %817, i32 %89
  %820 = getelementptr inbounds bfloat, ptr addrspace(3) %817, i32 %97
  %821 = getelementptr inbounds bfloat, ptr addrspace(3) %817, i32 %105
  %822 = select i1 %129, i32 16, i32 0
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %818, ptr addrspace(1) %809, i32 %822)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %819, ptr addrspace(1) %810, i32 %822)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %820, ptr addrspace(1) %811, i32 %822)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %821, ptr addrspace(1) %812, i32 %822)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  %823 = add i32 %125, 1
  %824 = icmp slt i32 %823, 2
  %825 = select i1 %824, i32 %823, i32 0
  call void asm sideeffect "cp.async.wait_group 0x1;", ""()
  call void @llvm.nvvm.barrier0()
  %826 = mul i32 %825, 4096
  %827 = add i32 %826, 0
  %828 = add i32 %827, 0
  %829 = add i32 %828, 0
  %830 = getelementptr bfloat, ptr addrspace(3) @global_smem, i32 %829
  %831 = insertvalue { ptr addrspace(3), i32, i32 } undef, ptr addrspace(3) %830, 0
  %832 = insertvalue { ptr addrspace(3), i32, i32 } %831, i32 0, 1
  %833 = insertvalue { ptr addrspace(3), i32, i32 } %832, i32 0, 2
  %834 = add i32 %121, 256
  br label %120

835:                                              ; preds = %120
  call void asm sideeffect "cp.async.wait_group 0x0;", ""()
  call void @llvm.nvvm.barrier0()
  %836 = extractvalue { float, float, float, float } %123, 0
  %837 = extractvalue { float, float, float, float } %123, 1
  %838 = extractvalue { float, float, float, float } %123, 2
  %839 = extractvalue { float, float, float, float } %123, 3
  %840 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %836)
  %841 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %837)
  %842 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %838)
  %843 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %839)
  %844 = mul i32 %13, 16
  %845 = sext i32 %844 to i64
  %846 = select i1 %48, i32 0, i32 2
  %847 = xor i32 0, %846
  %848 = select i1 %52, i32 0, i32 4
  %849 = xor i32 %847, %848
  %850 = select i1 %56, i32 0, i32 8
  %851 = xor i32 %849, %850
  %852 = xor i32 %851, 0
  %853 = add i32 %852, 0
  %854 = select i1 %60, i32 0, i32 1
  %855 = xor i32 0, %854
  %856 = select i1 %64, i32 0, i32 2
  %857 = xor i32 %855, %856
  %858 = select i1 %19, i32 0, i32 4
  %859 = xor i32 %857, %858
  %860 = select i1 %23, i32 0, i32 8
  %861 = xor i32 %859, %860
  %862 = xor i32 %861, 0
  %863 = add i32 %862, 0
  %864 = sext i32 %853 to i64
  %865 = sext i32 %863 to i64
  %866 = add i64 %15, %864
  %867 = add i64 %845, %865
  %868 = mul i64 %867, 1024
  %869 = add i64 %866, %868
  %870 = getelementptr bfloat, ptr addrspace(1) %2, i64 %869
  %871 = select i1 %48, i32 0, i32 32
  %872 = xor i32 0, %871
  %873 = select i1 %52, i32 0, i32 64
  %874 = xor i32 %872, %873
  %875 = select i1 %56, i32 0, i32 1
  %876 = xor i32 %874, %875
  %877 = select i1 %60, i32 0, i32 2
  %878 = xor i32 %876, %877
  %879 = select i1 %64, i32 0, i32 4
  %880 = xor i32 %878, %879
  %881 = select i1 %19, i32 0, i32 128
  %882 = xor i32 %880, %881
  %883 = select i1 %60, i32 0, i32 16
  %884 = xor i32 %851, %883
  %885 = select i1 %64, i32 0, i32 32
  %886 = xor i32 %884, %885
  %887 = select i1 %19, i32 0, i32 64
  %888 = xor i32 %886, %887
  %889 = select i1 %23, i32 0, i32 128
  %890 = xor i32 %888, %889
  %891 = xor i32 %882, 0
  %892 = lshr i32 %891, 4
  %893 = shl i32 %892, 1
  %894 = add i32 %893, %891
  %895 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %894
  %896 = insertelement <1 x bfloat> undef, bfloat %840, i32 0
  %897 = extractelement <1 x bfloat> %896, i32 0
  %898 = bitcast bfloat %897 to i16
  %899 = insertelement <1 x i16> undef, i16 %898, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %895, <1 x i16> %899, i1 true)
  %900 = xor i32 %882, 16
  %901 = lshr i32 %900, 4
  %902 = shl i32 %901, 1
  %903 = add i32 %902, %900
  %904 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %903
  %905 = insertelement <1 x bfloat> undef, bfloat %841, i32 0
  %906 = extractelement <1 x bfloat> %905, i32 0
  %907 = bitcast bfloat %906 to i16
  %908 = insertelement <1 x i16> undef, i16 %907, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %904, <1 x i16> %908, i1 true)
  %909 = xor i32 %882, 8
  %910 = lshr i32 %909, 4
  %911 = shl i32 %910, 1
  %912 = add i32 %911, %909
  %913 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %912
  %914 = insertelement <1 x bfloat> undef, bfloat %842, i32 0
  %915 = extractelement <1 x bfloat> %914, i32 0
  %916 = bitcast bfloat %915 to i16
  %917 = insertelement <1 x i16> undef, i16 %916, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %913, <1 x i16> %917, i1 true)
  %918 = xor i32 %882, 24
  %919 = lshr i32 %918, 4
  %920 = shl i32 %919, 1
  %921 = add i32 %920, %918
  %922 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %921
  %923 = insertelement <1 x bfloat> undef, bfloat %843, i32 0
  %924 = extractelement <1 x bfloat> %923, i32 0
  %925 = bitcast bfloat %924 to i16
  %926 = insertelement <1 x i16> undef, i16 %925, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %922, <1 x i16> %926, i1 true)
  call void @llvm.nvvm.barrier0()
  %927 = xor i32 %890, 0
  %928 = lshr i32 %927, 4
  %929 = shl i32 %928, 1
  %930 = add i32 %929, %927
  %931 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %930
  %932 = load <2 x i16>, ptr addrspace(3) %931, align 4
  %933 = extractelement <2 x i16> %932, i32 0
  %934 = extractelement <2 x i16> %932, i32 1
  %935 = insertelement <2 x i16> undef, i16 %933, i32 0
  %936 = insertelement <2 x i16> %935, i16 %934, i32 1
  %937 = extractelement <2 x i16> %936, i32 0
  %938 = extractelement <2 x i16> %936, i32 1
  %939 = bitcast i16 %937 to bfloat
  %940 = bitcast i16 %938 to bfloat
  %941 = insertelement <2 x bfloat> undef, bfloat %939, i32 0
  %942 = insertelement <2 x bfloat> %941, bfloat %940, i32 1
  %943 = extractelement <2 x bfloat> %942, i32 0
  %944 = extractelement <2 x bfloat> %942, i32 1
  %945 = insertelement <2 x bfloat> undef, bfloat %943, i32 0
  %946 = insertelement <2 x bfloat> %945, bfloat %944, i32 1
  %947 = bitcast <2 x bfloat> %946 to i32
  call void asm sideeffect "st.global.b32 [ $1 + 0 ], { $0 };", "r,l"(i32 %947, ptr addrspace(1) %870)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_23_impl(ptr, ptr, ptr, ptr, ptr, ptr) #4

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #5

declare float @__nv_rsqrtf(float)

define ptx_kernel void @fusion_23(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(32768) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4) #6 {
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
  %12 = mul i64 %8, 256
  %13 = getelementptr bfloat, ptr addrspace(1) %3, i64 %12
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %15 = urem i32 %14, 32
  %16 = udiv i32 %14, 32
  %17 = and i32 %15, 1
  %18 = icmp eq i32 %17, 0
  %19 = select i1 %18, i32 0, i32 4
  %20 = xor i32 0, %19
  %21 = and i32 %15, 2
  %22 = icmp eq i32 %21, 0
  %23 = select i1 %22, i32 0, i32 8
  %24 = xor i32 %20, %23
  %25 = and i32 %15, 4
  %26 = icmp eq i32 %25, 0
  %27 = select i1 %26, i32 0, i32 16
  %28 = xor i32 %24, %27
  %29 = and i32 %15, 8
  %30 = icmp eq i32 %29, 0
  %31 = select i1 %30, i32 0, i32 32
  %32 = xor i32 %28, %31
  %33 = and i32 %15, 16
  %34 = icmp eq i32 %33, 0
  %35 = select i1 %34, i32 0, i32 64
  %36 = xor i32 %32, %35
  %37 = and i32 %16, 1
  %38 = icmp eq i32 %37, 0
  %39 = select i1 %38, i32 0, i32 128
  %40 = xor i32 %36, %39
  %41 = xor i32 %40, 0
  %42 = add i32 %41, 0
  %43 = sext i32 %42 to i64
  %44 = getelementptr bfloat, ptr addrspace(1) %13, i64 %43
  %45 = call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %44)
  %46 = extractvalue { i32, i32 } %45, 0
  %47 = bitcast i32 %46 to <2 x bfloat>
  %48 = extractvalue { i32, i32 } %45, 1
  %49 = bitcast i32 %48 to <2 x bfloat>
  %50 = extractelement <2 x bfloat> %47, i32 0
  %51 = extractelement <2 x bfloat> %47, i32 1
  %52 = extractelement <2 x bfloat> %49, i32 0
  %53 = extractelement <2 x bfloat> %49, i32 1
  %54 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50)
  %55 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51)
  %56 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %52)
  %57 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %53)
  %58 = getelementptr bfloat, ptr addrspace(1) %2, i64 %12
  %59 = getelementptr bfloat, ptr addrspace(1) %58, i64 %43
  %60 = call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %59)
  %61 = extractvalue { i32, i32 } %60, 0
  %62 = bitcast i32 %61 to <2 x bfloat>
  %63 = extractvalue { i32, i32 } %60, 1
  %64 = bitcast i32 %63 to <2 x bfloat>
  %65 = extractelement <2 x bfloat> %62, i32 0
  %66 = extractelement <2 x bfloat> %62, i32 1
  %67 = extractelement <2 x bfloat> %64, i32 0
  %68 = extractelement <2 x bfloat> %64, i32 1
  %69 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %65)
  %70 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %66)
  %71 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %67)
  %72 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %68)
  %73 = fadd float %54, %69
  %74 = fadd float %55, %70
  %75 = fadd float %56, %71
  %76 = fadd float %57, %72
  %77 = mul i64 %9, 1024
  %78 = getelementptr bfloat, ptr addrspace(1) %3, i64 %77
  %79 = select i1 %18, i32 0, i32 8
  %80 = xor i32 0, %79
  %81 = select i1 %22, i32 0, i32 16
  %82 = xor i32 %80, %81
  %83 = select i1 %26, i32 0, i32 32
  %84 = xor i32 %82, %83
  %85 = select i1 %30, i32 0, i32 64
  %86 = xor i32 %84, %85
  %87 = select i1 %34, i32 0, i32 128
  %88 = xor i32 %86, %87
  %89 = select i1 %38, i32 0, i32 256
  %90 = xor i32 %88, %89
  %91 = xor i32 %90, 0
  %92 = xor i32 %90, 512
  %93 = add i32 %91, 0
  %94 = add i32 %92, 0
  %95 = sext i32 %93 to i64
  %96 = sext i32 %94 to i64
  %97 = getelementptr bfloat, ptr addrspace(1) %78, i64 %95
  %98 = getelementptr bfloat, ptr addrspace(1) %78, i64 %96
  %99 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %97)
  %100 = extractvalue { i32, i32, i32, i32 } %99, 0
  %101 = bitcast i32 %100 to <2 x bfloat>
  %102 = extractvalue { i32, i32, i32, i32 } %99, 1
  %103 = bitcast i32 %102 to <2 x bfloat>
  %104 = extractvalue { i32, i32, i32, i32 } %99, 2
  %105 = bitcast i32 %104 to <2 x bfloat>
  %106 = extractvalue { i32, i32, i32, i32 } %99, 3
  %107 = bitcast i32 %106 to <2 x bfloat>
  %108 = extractelement <2 x bfloat> %101, i32 0
  %109 = extractelement <2 x bfloat> %101, i32 1
  %110 = extractelement <2 x bfloat> %103, i32 0
  %111 = extractelement <2 x bfloat> %103, i32 1
  %112 = extractelement <2 x bfloat> %105, i32 0
  %113 = extractelement <2 x bfloat> %105, i32 1
  %114 = extractelement <2 x bfloat> %107, i32 0
  %115 = extractelement <2 x bfloat> %107, i32 1
  %116 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %98)
  %117 = extractvalue { i32, i32, i32, i32 } %116, 0
  %118 = bitcast i32 %117 to <2 x bfloat>
  %119 = extractvalue { i32, i32, i32, i32 } %116, 1
  %120 = bitcast i32 %119 to <2 x bfloat>
  %121 = extractvalue { i32, i32, i32, i32 } %116, 2
  %122 = bitcast i32 %121 to <2 x bfloat>
  %123 = extractvalue { i32, i32, i32, i32 } %116, 3
  %124 = bitcast i32 %123 to <2 x bfloat>
  %125 = extractelement <2 x bfloat> %118, i32 0
  %126 = extractelement <2 x bfloat> %118, i32 1
  %127 = extractelement <2 x bfloat> %120, i32 0
  %128 = extractelement <2 x bfloat> %120, i32 1
  %129 = extractelement <2 x bfloat> %122, i32 0
  %130 = extractelement <2 x bfloat> %122, i32 1
  %131 = extractelement <2 x bfloat> %124, i32 0
  %132 = extractelement <2 x bfloat> %124, i32 1
  %133 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %108)
  %134 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %109)
  %135 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %110)
  %136 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %111)
  %137 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %112)
  %138 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %113)
  %139 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %114)
  %140 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %115)
  %141 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %125)
  %142 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %126)
  %143 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %127)
  %144 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %128)
  %145 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %129)
  %146 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %130)
  %147 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %131)
  %148 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %132)
  %149 = getelementptr bfloat, ptr addrspace(1) %2, i64 %77
  %150 = getelementptr bfloat, ptr addrspace(1) %149, i64 %95
  %151 = getelementptr bfloat, ptr addrspace(1) %149, i64 %96
  %152 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %150)
  %153 = extractvalue { i32, i32, i32, i32 } %152, 0
  %154 = bitcast i32 %153 to <2 x bfloat>
  %155 = extractvalue { i32, i32, i32, i32 } %152, 1
  %156 = bitcast i32 %155 to <2 x bfloat>
  %157 = extractvalue { i32, i32, i32, i32 } %152, 2
  %158 = bitcast i32 %157 to <2 x bfloat>
  %159 = extractvalue { i32, i32, i32, i32 } %152, 3
  %160 = bitcast i32 %159 to <2 x bfloat>
  %161 = extractelement <2 x bfloat> %154, i32 0
  %162 = extractelement <2 x bfloat> %154, i32 1
  %163 = extractelement <2 x bfloat> %156, i32 0
  %164 = extractelement <2 x bfloat> %156, i32 1
  %165 = extractelement <2 x bfloat> %158, i32 0
  %166 = extractelement <2 x bfloat> %158, i32 1
  %167 = extractelement <2 x bfloat> %160, i32 0
  %168 = extractelement <2 x bfloat> %160, i32 1
  %169 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %151)
  %170 = extractvalue { i32, i32, i32, i32 } %169, 0
  %171 = bitcast i32 %170 to <2 x bfloat>
  %172 = extractvalue { i32, i32, i32, i32 } %169, 1
  %173 = bitcast i32 %172 to <2 x bfloat>
  %174 = extractvalue { i32, i32, i32, i32 } %169, 2
  %175 = bitcast i32 %174 to <2 x bfloat>
  %176 = extractvalue { i32, i32, i32, i32 } %169, 3
  %177 = bitcast i32 %176 to <2 x bfloat>
  %178 = extractelement <2 x bfloat> %171, i32 0
  %179 = extractelement <2 x bfloat> %171, i32 1
  %180 = extractelement <2 x bfloat> %173, i32 0
  %181 = extractelement <2 x bfloat> %173, i32 1
  %182 = extractelement <2 x bfloat> %175, i32 0
  %183 = extractelement <2 x bfloat> %175, i32 1
  %184 = extractelement <2 x bfloat> %177, i32 0
  %185 = extractelement <2 x bfloat> %177, i32 1
  %186 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %161)
  %187 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %162)
  %188 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %163)
  %189 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %164)
  %190 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %165)
  %191 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %166)
  %192 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %167)
  %193 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %168)
  %194 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %178)
  %195 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %179)
  %196 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %180)
  %197 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %181)
  %198 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %182)
  %199 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %183)
  %200 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %184)
  %201 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %185)
  %202 = fadd float %133, %186
  %203 = fadd float %134, %187
  %204 = fadd float %135, %188
  %205 = fadd float %136, %189
  %206 = fadd float %137, %190
  %207 = fadd float %138, %191
  %208 = fadd float %139, %192
  %209 = fadd float %140, %193
  %210 = fadd float %141, %194
  %211 = fadd float %142, %195
  %212 = fadd float %143, %196
  %213 = fadd float %144, %197
  %214 = fadd float %145, %198
  %215 = fadd float %146, %199
  %216 = fadd float %147, %200
  %217 = fadd float %148, %201
  %218 = fmul float %202, %202
  %219 = fmul float %203, %203
  %220 = fmul float %204, %204
  %221 = fmul float %205, %205
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
  %234 = fadd float %218, %219
  %235 = fadd float %234, %220
  %236 = fadd float %235, %221
  %237 = fadd float %236, %222
  %238 = fadd float %237, %223
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
  %249 = bitcast float %248 to i32
  %250 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %249, i32 16, i32 31)
  %251 = bitcast i32 %250 to float
  %252 = fadd float %248, %251
  %253 = bitcast float %252 to i32
  %254 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %253, i32 8, i32 31)
  %255 = bitcast i32 %254 to float
  %256 = fadd float %252, %255
  %257 = bitcast float %256 to i32
  %258 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %257, i32 4, i32 31)
  %259 = bitcast i32 %258 to float
  %260 = fadd float %256, %259
  %261 = bitcast float %260 to i32
  %262 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %261, i32 2, i32 31)
  %263 = bitcast i32 %262 to float
  %264 = fadd float %260, %263
  %265 = bitcast float %264 to i32
  %266 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %265, i32 1, i32 31)
  %267 = bitcast i32 %266 to float
  %268 = fadd float %264, %267
  %269 = urem i32 %15, 32
  %270 = urem i32 %16, 2
  %271 = icmp eq i32 %269, 0
  %272 = and i1 true, %271
  %273 = add i32 0, %270
  %274 = getelementptr float, ptr addrspace(3) @global_smem, i32 %273
  %275 = insertelement <1 x float> undef, float %268, i32 0
  %276 = extractelement <1 x float> %275, i32 0
  %277 = bitcast float %276 to i32
  %278 = insertelement <1 x i32> undef, i32 %277, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %274, <1 x i32> %278, i1 %272)
  call void @llvm.nvvm.barrier0()
  %279 = icmp slt i32 %14, 2
  %280 = getelementptr float, ptr addrspace(3) @global_smem, i32 %14
  %281 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %280, i1 %279)
  %282 = insertelement <1 x i32> undef, i32 %281, i32 0
  %283 = extractelement <1 x i32> %282, i32 0
  %284 = bitcast i32 %283 to float
  %285 = insertelement <1 x float> undef, float %284, i32 0
  %286 = extractelement <1 x float> %285, i32 0
  %287 = bitcast float %286 to i32
  %288 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %287, i32 1, i32 31)
  %289 = bitcast i32 %288 to float
  %290 = fadd float %286, %289
  %291 = urem i32 %15, 2
  %292 = icmp eq i32 %291, 0
  %293 = and i1 %279, %292
  %294 = insertelement <1 x float> undef, float %290, i32 0
  %295 = extractelement <1 x float> %294, i32 0
  %296 = bitcast float %295 to i32
  %297 = insertelement <1 x i32> undef, i32 %296, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %280, <1 x i32> %297, i1 %293)
  call void @llvm.nvvm.barrier0()
  %298 = load float, ptr addrspace(3) @global_smem, align 4
  %299 = fmul float %298, 0x3F50000000000000
  %300 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %301 = bitcast i32 %300 to <1 x float>
  %302 = extractelement <1 x float> %301, i32 0
  %303 = fadd float %299, %302
  %304 = call float @__nv_rsqrtf(float %303)
  %305 = fmul float %73, %304
  %306 = fmul float %74, %304
  %307 = fmul float %75, %304
  %308 = fmul float %76, %304
  %309 = getelementptr bfloat, ptr addrspace(1) %4, i64 %11
  %310 = getelementptr bfloat, ptr addrspace(1) %309, i64 %43
  %311 = call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %310)
  %312 = extractvalue { i32, i32 } %311, 0
  %313 = bitcast i32 %312 to <2 x bfloat>
  %314 = extractvalue { i32, i32 } %311, 1
  %315 = bitcast i32 %314 to <2 x bfloat>
  %316 = extractelement <2 x bfloat> %313, i32 0
  %317 = extractelement <2 x bfloat> %313, i32 1
  %318 = extractelement <2 x bfloat> %315, i32 0
  %319 = extractelement <2 x bfloat> %315, i32 1
  %320 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316)
  %321 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317)
  %322 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %318)
  %323 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %319)
  %324 = fmul float %305, %320
  %325 = fmul float %306, %321
  %326 = fmul float %307, %322
  %327 = fmul float %308, %323
  %328 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %324)
  %329 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %325)
  %330 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %326)
  %331 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %327)
  %332 = getelementptr bfloat, ptr addrspace(1) %5, i64 %12
  %333 = getelementptr bfloat, ptr addrspace(1) %332, i64 %43
  %334 = insertelement <2 x bfloat> undef, bfloat %328, i32 0
  %335 = insertelement <2 x bfloat> %334, bfloat %329, i32 1
  %336 = bitcast <2 x bfloat> %335 to i32
  %337 = insertelement <2 x bfloat> undef, bfloat %330, i32 0
  %338 = insertelement <2 x bfloat> %337, bfloat %331, i32 1
  %339 = bitcast <2 x bfloat> %338 to i32
  call void asm sideeffect "st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l"(i32 %336, i32 %339, ptr addrspace(1) %333)
  ret void

entry:                                            ; No predecessors!
  ret void
}

define ptx_kernel void @loop_convert_fusion(ptr noalias align 128 dereferenceable(196608) %0, ptr noalias align 128 dereferenceable(98304) %1) #0 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !3
  %5 = udiv i32 %4, 24
  %6 = urem i32 %4, 24
  %7 = mul i32 %6, 128
  %8 = add i32 %7, %3
  %9 = call bfloat @fused_convert_param_0_107(ptr %0, i32 %5, i32 %8)
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
  %20 = call bfloat @fused_convert_param_0_107(ptr %0, i32 %5, i32 %19)
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

define internal bfloat @fused_convert_param_0_107(ptr noalias %0, i32 %1, i32 %2) {
  %4 = mul i32 %1, 6144
  %5 = add i32 %4, %2
  %6 = getelementptr inbounds bfloat, ptr %0, i32 %5
  %7 = load bfloat, ptr %6, align 2, !invariant.load !2
  ret bfloat %7
}

declare float @__nv_fast_expf(float)

declare ptx_kernel void @fusion_21_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_21(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5) #6 {
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
  %13 = mul i64 %9, 256
  %14 = getelementptr bfloat, ptr addrspace(1) %5, i64 %13
  %15 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %16 = urem i32 %15, 32
  %17 = udiv i32 %15, 32
  %18 = and i32 %16, 1
  %19 = icmp eq i32 %18, 0
  %20 = select i1 %19, i32 0, i32 4
  %21 = xor i32 0, %20
  %22 = and i32 %16, 2
  %23 = icmp eq i32 %22, 0
  %24 = select i1 %23, i32 0, i32 8
  %25 = xor i32 %21, %24
  %26 = and i32 %16, 4
  %27 = icmp eq i32 %26, 0
  %28 = select i1 %27, i32 0, i32 16
  %29 = xor i32 %25, %28
  %30 = and i32 %16, 8
  %31 = icmp eq i32 %30, 0
  %32 = select i1 %31, i32 0, i32 32
  %33 = xor i32 %29, %32
  %34 = and i32 %16, 16
  %35 = icmp eq i32 %34, 0
  %36 = select i1 %35, i32 0, i32 64
  %37 = xor i32 %33, %36
  %38 = and i32 %17, 1
  %39 = icmp eq i32 %38, 0
  %40 = select i1 %39, i32 0, i32 128
  %41 = xor i32 %37, %40
  %42 = xor i32 %41, 0
  %43 = add i32 %42, 0
  %44 = sext i32 %43 to i64
  %45 = getelementptr bfloat, ptr addrspace(1) %14, i64 %44
  %46 = call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %45)
  %47 = extractvalue { i32, i32 } %46, 0
  %48 = bitcast i32 %47 to <2 x bfloat>
  %49 = extractvalue { i32, i32 } %46, 1
  %50 = bitcast i32 %49 to <2 x bfloat>
  %51 = extractelement <2 x bfloat> %48, i32 0
  %52 = extractelement <2 x bfloat> %48, i32 1
  %53 = extractelement <2 x bfloat> %50, i32 0
  %54 = extractelement <2 x bfloat> %50, i32 1
  %55 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51)
  %56 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %52)
  %57 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %53)
  %58 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %54)
  %59 = getelementptr bfloat, ptr addrspace(1) %4, i64 %13
  %60 = getelementptr bfloat, ptr addrspace(1) %59, i64 %44
  %61 = call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %60)
  %62 = extractvalue { i32, i32 } %61, 0
  %63 = bitcast i32 %62 to <2 x bfloat>
  %64 = extractvalue { i32, i32 } %61, 1
  %65 = bitcast i32 %64 to <2 x bfloat>
  %66 = extractelement <2 x bfloat> %63, i32 0
  %67 = extractelement <2 x bfloat> %63, i32 1
  %68 = extractelement <2 x bfloat> %65, i32 0
  %69 = extractelement <2 x bfloat> %65, i32 1
  %70 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %66)
  %71 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %67)
  %72 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %68)
  %73 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %69)
  %74 = getelementptr bfloat, ptr addrspace(1) %3, i64 %13
  %75 = getelementptr bfloat, ptr addrspace(1) %74, i64 %44
  %76 = call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %75)
  %77 = extractvalue { i32, i32 } %76, 0
  %78 = bitcast i32 %77 to <2 x bfloat>
  %79 = extractvalue { i32, i32 } %76, 1
  %80 = bitcast i32 %79 to <2 x bfloat>
  %81 = extractelement <2 x bfloat> %78, i32 0
  %82 = extractelement <2 x bfloat> %78, i32 1
  %83 = extractelement <2 x bfloat> %80, i32 0
  %84 = extractelement <2 x bfloat> %80, i32 1
  %85 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81)
  %86 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82)
  %87 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83)
  %88 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84)
  %89 = fadd float %70, %85
  %90 = fadd float %71, %86
  %91 = fadd float %72, %87
  %92 = fadd float %73, %88
  %93 = fadd float %55, %89
  %94 = fadd float %56, %90
  %95 = fadd float %57, %91
  %96 = fadd float %58, %92
  %97 = mul i64 %10, 1024
  %98 = getelementptr bfloat, ptr addrspace(1) %5, i64 %97
  %99 = select i1 %19, i32 0, i32 8
  %100 = xor i32 0, %99
  %101 = select i1 %23, i32 0, i32 16
  %102 = xor i32 %100, %101
  %103 = select i1 %27, i32 0, i32 32
  %104 = xor i32 %102, %103
  %105 = select i1 %31, i32 0, i32 64
  %106 = xor i32 %104, %105
  %107 = select i1 %35, i32 0, i32 128
  %108 = xor i32 %106, %107
  %109 = select i1 %39, i32 0, i32 256
  %110 = xor i32 %108, %109
  %111 = xor i32 %110, 0
  %112 = xor i32 %110, 512
  %113 = add i32 %111, 0
  %114 = add i32 %112, 0
  %115 = sext i32 %113 to i64
  %116 = sext i32 %114 to i64
  %117 = getelementptr bfloat, ptr addrspace(1) %98, i64 %115
  %118 = getelementptr bfloat, ptr addrspace(1) %98, i64 %116
  %119 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %117)
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
  %136 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %118)
  %137 = extractvalue { i32, i32, i32, i32 } %136, 0
  %138 = bitcast i32 %137 to <2 x bfloat>
  %139 = extractvalue { i32, i32, i32, i32 } %136, 1
  %140 = bitcast i32 %139 to <2 x bfloat>
  %141 = extractvalue { i32, i32, i32, i32 } %136, 2
  %142 = bitcast i32 %141 to <2 x bfloat>
  %143 = extractvalue { i32, i32, i32, i32 } %136, 3
  %144 = bitcast i32 %143 to <2 x bfloat>
  %145 = extractelement <2 x bfloat> %138, i32 0
  %146 = extractelement <2 x bfloat> %138, i32 1
  %147 = extractelement <2 x bfloat> %140, i32 0
  %148 = extractelement <2 x bfloat> %140, i32 1
  %149 = extractelement <2 x bfloat> %142, i32 0
  %150 = extractelement <2 x bfloat> %142, i32 1
  %151 = extractelement <2 x bfloat> %144, i32 0
  %152 = extractelement <2 x bfloat> %144, i32 1
  %153 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %128)
  %154 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %129)
  %155 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %130)
  %156 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %131)
  %157 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %132)
  %158 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %133)
  %159 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %134)
  %160 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135)
  %161 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %145)
  %162 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %146)
  %163 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %147)
  %164 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %148)
  %165 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %149)
  %166 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %150)
  %167 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %151)
  %168 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152)
  %169 = getelementptr bfloat, ptr addrspace(1) %4, i64 %97
  %170 = getelementptr bfloat, ptr addrspace(1) %169, i64 %115
  %171 = getelementptr bfloat, ptr addrspace(1) %169, i64 %116
  %172 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %170)
  %173 = extractvalue { i32, i32, i32, i32 } %172, 0
  %174 = bitcast i32 %173 to <2 x bfloat>
  %175 = extractvalue { i32, i32, i32, i32 } %172, 1
  %176 = bitcast i32 %175 to <2 x bfloat>
  %177 = extractvalue { i32, i32, i32, i32 } %172, 2
  %178 = bitcast i32 %177 to <2 x bfloat>
  %179 = extractvalue { i32, i32, i32, i32 } %172, 3
  %180 = bitcast i32 %179 to <2 x bfloat>
  %181 = extractelement <2 x bfloat> %174, i32 0
  %182 = extractelement <2 x bfloat> %174, i32 1
  %183 = extractelement <2 x bfloat> %176, i32 0
  %184 = extractelement <2 x bfloat> %176, i32 1
  %185 = extractelement <2 x bfloat> %178, i32 0
  %186 = extractelement <2 x bfloat> %178, i32 1
  %187 = extractelement <2 x bfloat> %180, i32 0
  %188 = extractelement <2 x bfloat> %180, i32 1
  %189 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %171)
  %190 = extractvalue { i32, i32, i32, i32 } %189, 0
  %191 = bitcast i32 %190 to <2 x bfloat>
  %192 = extractvalue { i32, i32, i32, i32 } %189, 1
  %193 = bitcast i32 %192 to <2 x bfloat>
  %194 = extractvalue { i32, i32, i32, i32 } %189, 2
  %195 = bitcast i32 %194 to <2 x bfloat>
  %196 = extractvalue { i32, i32, i32, i32 } %189, 3
  %197 = bitcast i32 %196 to <2 x bfloat>
  %198 = extractelement <2 x bfloat> %191, i32 0
  %199 = extractelement <2 x bfloat> %191, i32 1
  %200 = extractelement <2 x bfloat> %193, i32 0
  %201 = extractelement <2 x bfloat> %193, i32 1
  %202 = extractelement <2 x bfloat> %195, i32 0
  %203 = extractelement <2 x bfloat> %195, i32 1
  %204 = extractelement <2 x bfloat> %197, i32 0
  %205 = extractelement <2 x bfloat> %197, i32 1
  %206 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %181)
  %207 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %182)
  %208 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %183)
  %209 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %184)
  %210 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %185)
  %211 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %186)
  %212 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %187)
  %213 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188)
  %214 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %198)
  %215 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %199)
  %216 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %200)
  %217 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %201)
  %218 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %202)
  %219 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %203)
  %220 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %204)
  %221 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205)
  %222 = getelementptr bfloat, ptr addrspace(1) %3, i64 %97
  %223 = getelementptr bfloat, ptr addrspace(1) %222, i64 %115
  %224 = getelementptr bfloat, ptr addrspace(1) %222, i64 %116
  %225 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %223)
  %226 = extractvalue { i32, i32, i32, i32 } %225, 0
  %227 = bitcast i32 %226 to <2 x bfloat>
  %228 = extractvalue { i32, i32, i32, i32 } %225, 1
  %229 = bitcast i32 %228 to <2 x bfloat>
  %230 = extractvalue { i32, i32, i32, i32 } %225, 2
  %231 = bitcast i32 %230 to <2 x bfloat>
  %232 = extractvalue { i32, i32, i32, i32 } %225, 3
  %233 = bitcast i32 %232 to <2 x bfloat>
  %234 = extractelement <2 x bfloat> %227, i32 0
  %235 = extractelement <2 x bfloat> %227, i32 1
  %236 = extractelement <2 x bfloat> %229, i32 0
  %237 = extractelement <2 x bfloat> %229, i32 1
  %238 = extractelement <2 x bfloat> %231, i32 0
  %239 = extractelement <2 x bfloat> %231, i32 1
  %240 = extractelement <2 x bfloat> %233, i32 0
  %241 = extractelement <2 x bfloat> %233, i32 1
  %242 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %224)
  %243 = extractvalue { i32, i32, i32, i32 } %242, 0
  %244 = bitcast i32 %243 to <2 x bfloat>
  %245 = extractvalue { i32, i32, i32, i32 } %242, 1
  %246 = bitcast i32 %245 to <2 x bfloat>
  %247 = extractvalue { i32, i32, i32, i32 } %242, 2
  %248 = bitcast i32 %247 to <2 x bfloat>
  %249 = extractvalue { i32, i32, i32, i32 } %242, 3
  %250 = bitcast i32 %249 to <2 x bfloat>
  %251 = extractelement <2 x bfloat> %244, i32 0
  %252 = extractelement <2 x bfloat> %244, i32 1
  %253 = extractelement <2 x bfloat> %246, i32 0
  %254 = extractelement <2 x bfloat> %246, i32 1
  %255 = extractelement <2 x bfloat> %248, i32 0
  %256 = extractelement <2 x bfloat> %248, i32 1
  %257 = extractelement <2 x bfloat> %250, i32 0
  %258 = extractelement <2 x bfloat> %250, i32 1
  %259 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %234)
  %260 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %235)
  %261 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %236)
  %262 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %237)
  %263 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %238)
  %264 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %239)
  %265 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %240)
  %266 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %241)
  %267 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %251)
  %268 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %252)
  %269 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %253)
  %270 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %254)
  %271 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %255)
  %272 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %256)
  %273 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %257)
  %274 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %258)
  %275 = fadd float %206, %259
  %276 = fadd float %207, %260
  %277 = fadd float %208, %261
  %278 = fadd float %209, %262
  %279 = fadd float %210, %263
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
  %291 = fadd float %153, %275
  %292 = fadd float %154, %276
  %293 = fadd float %155, %277
  %294 = fadd float %156, %278
  %295 = fadd float %157, %279
  %296 = fadd float %158, %280
  %297 = fadd float %159, %281
  %298 = fadd float %160, %282
  %299 = fadd float %161, %283
  %300 = fadd float %162, %284
  %301 = fadd float %163, %285
  %302 = fadd float %164, %286
  %303 = fadd float %165, %287
  %304 = fadd float %166, %288
  %305 = fadd float %167, %289
  %306 = fadd float %168, %290
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
  %358 = urem i32 %16, 32
  %359 = urem i32 %17, 2
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
  %368 = icmp slt i32 %15, 2
  %369 = getelementptr float, ptr addrspace(3) @global_smem, i32 %15
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
  %380 = urem i32 %16, 2
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
  %394 = fmul float %93, %393
  %395 = fmul float %94, %393
  %396 = fmul float %95, %393
  %397 = fmul float %96, %393
  %398 = getelementptr bfloat, ptr addrspace(1) %2, i64 %12
  %399 = getelementptr bfloat, ptr addrspace(1) %398, i64 %44
  %400 = call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %399)
  %401 = extractvalue { i32, i32 } %400, 0
  %402 = bitcast i32 %401 to <2 x bfloat>
  %403 = extractvalue { i32, i32 } %400, 1
  %404 = bitcast i32 %403 to <2 x bfloat>
  %405 = extractelement <2 x bfloat> %402, i32 0
  %406 = extractelement <2 x bfloat> %402, i32 1
  %407 = extractelement <2 x bfloat> %404, i32 0
  %408 = extractelement <2 x bfloat> %404, i32 1
  %409 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %405)
  %410 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %406)
  %411 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %407)
  %412 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %408)
  %413 = fmul float %394, %409
  %414 = fmul float %395, %410
  %415 = fmul float %396, %411
  %416 = fmul float %397, %412
  %417 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %413)
  %418 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %414)
  %419 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %415)
  %420 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %416)
  %421 = getelementptr bfloat, ptr addrspace(1) %6, i64 %13
  %422 = getelementptr bfloat, ptr addrspace(1) %421, i64 %44
  %423 = insertelement <2 x bfloat> undef, bfloat %417, i32 0
  %424 = insertelement <2 x bfloat> %423, bfloat %418, i32 1
  %425 = bitcast <2 x bfloat> %424 to i32
  %426 = insertelement <2 x bfloat> undef, bfloat %419, i32 0
  %427 = insertelement <2 x bfloat> %426, bfloat %420, i32 1
  %428 = bitcast <2 x bfloat> %427 to i32
  call void asm sideeffect "st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l"(i32 %425, i32 %428, ptr addrspace(1) %422)
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

declare ptx_kernel void @triton_softmax_3_0_impl(ptr, ptr, ptr, ptr) #7

define ptx_kernel void @triton_softmax_3_0(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2) #8 {
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
  %21 = call float @fused_concatenate_convert_136_17(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %9)
  %22 = fmul float %20, %21
  %23 = add i32 %9, 64
  %24 = add i32 %14, 64
  %25 = getelementptr inbounds float, ptr %0, i32 %24
  %26 = load float, ptr %25, align 4, !invariant.load !2
  %27 = getelementptr inbounds bfloat, ptr %1, i32 %23
  %28 = load bfloat, ptr %27, align 2, !invariant.load !2
  %29 = fpext bfloat %28 to float
  %30 = fmul float %26, %29
  %31 = call float @fused_concatenate_convert_136_17(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %23)
  %32 = fmul float %30, %31
  %33 = fsub float %22, %32
  %34 = fptrunc float %33 to bfloat
  %35 = getelementptr inbounds bfloat, ptr %4, i32 %14
  store bfloat %34, ptr %35, align 2
  %36 = load float, ptr %25, align 4, !invariant.load !2
  %37 = load bfloat, ptr %27, align 2, !invariant.load !2
  %38 = fpext bfloat %37 to float
  %39 = fmul float %36, %38
  %40 = call float @fused_concatenate_convert_136_17(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %9)
  %41 = fmul float %39, %40
  %42 = load float, ptr %15, align 4, !invariant.load !2
  %43 = load bfloat, ptr %17, align 2, !invariant.load !2
  %44 = fpext bfloat %43 to float
  %45 = fmul float %42, %44
  %46 = call float @fused_concatenate_convert_136_17(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %23)
  %47 = fmul float %45, %46
  %48 = fadd float %41, %47
  %49 = fptrunc float %48 to bfloat
  %50 = getelementptr inbounds bfloat, ptr %4, i32 %24
  store bfloat %49, ptr %50, align 2
  ret void
}

define internal float @fused_concatenate_convert_136_17(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, i32 %4, i32 %5) {
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

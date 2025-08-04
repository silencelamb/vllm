; ModuleID = 'SyncTensorsGraph.293'
source_filename = "SyncTensorsGraph.293"
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

declare ptx_kernel void @gemm_fusion_dot_7_0_impl(ptr, ptr, ptr, ptr) #2

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #3

define ptx_kernel void @gemm_fusion_dot_7_0(ptr noalias align 16 dereferenceable(4194304) %arg0, ptr noalias align 16 dereferenceable(4194304) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2) #0 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr null to ptr addrspace(1)
  %5 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %6 = sdiv i32 %5, 8
  %7 = mul i32 %6, 8
  %8 = sub i32 128, %7
  %9 = icmp slt i32 %8, 8
  %10 = select i1 %9, i32 %8, i32 8
  %11 = srem i32 %5, %10
  %12 = add i32 %7, %11
  %13 = srem i32 %5, 8
  %14 = sdiv i32 %13, %10
  %15 = mul i32 %12, 16
  %16 = icmp slt i32 %15, 1024
  %17 = select i1 %16, ptr addrspace(1) %1, ptr addrspace(1) %2
  %18 = add i32 %15, -1024
  %19 = select i1 %16, i32 %15, i32 %18
  %20 = sext i32 %19 to i64
  %21 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %22 = udiv i32 %21, 32
  %23 = and i32 %22, 1
  %24 = icmp eq i32 %23, 0
  %25 = select i1 %24, i32 0, i32 1
  %26 = xor i32 0, %25
  %27 = and i32 %22, 2
  %28 = icmp eq i32 %27, 0
  %29 = select i1 %28, i32 0, i32 2
  %30 = xor i32 %26, %29
  %31 = xor i32 %30, 0
  %32 = xor i32 %30, 4
  %33 = xor i32 %30, 8
  %34 = xor i32 %30, 12
  %35 = add i32 %31, 0
  %36 = add i32 %32, 0
  %37 = add i32 %33, 0
  %38 = add i32 %34, 0
  %39 = sext i32 %35 to i64
  %40 = sext i32 %36 to i64
  %41 = sext i32 %37 to i64
  %42 = sext i32 %38 to i64
  %43 = add i64 %20, %39
  %44 = add i64 %20, %40
  %45 = add i64 %20, %41
  %46 = add i64 %20, %42
  %47 = mul i64 %43, 2048
  %48 = mul i64 %44, 2048
  %49 = mul i64 %45, 2048
  %50 = mul i64 %46, 2048
  %51 = urem i32 %21, 32
  %52 = and i32 %51, 1
  %53 = icmp eq i32 %52, 0
  %54 = select i1 %53, i32 0, i32 8
  %55 = xor i32 0, %54
  %56 = and i32 %51, 2
  %57 = icmp eq i32 %56, 0
  %58 = select i1 %57, i32 0, i32 16
  %59 = xor i32 %55, %58
  %60 = and i32 %51, 4
  %61 = icmp eq i32 %60, 0
  %62 = select i1 %61, i32 0, i32 32
  %63 = xor i32 %59, %62
  %64 = and i32 %51, 8
  %65 = icmp eq i32 %64, 0
  %66 = select i1 %65, i32 0, i32 64
  %67 = xor i32 %63, %66
  %68 = and i32 %51, 16
  %69 = icmp eq i32 %68, 0
  %70 = select i1 %69, i32 0, i32 128
  %71 = xor i32 %67, %70
  %72 = xor i32 %71, 0
  %73 = add i32 %72, 0
  %74 = sext i32 %73 to i64
  %75 = add i64 %47, %74
  %76 = add i64 %48, %74
  %77 = add i64 %49, %74
  %78 = add i64 %50, %74
  %79 = getelementptr bfloat, ptr addrspace(1) %17, i64 %75
  %80 = getelementptr bfloat, ptr addrspace(1) %17, i64 %76
  %81 = getelementptr bfloat, ptr addrspace(1) %17, i64 %77
  %82 = getelementptr bfloat, ptr addrspace(1) %17, i64 %78
  %83 = select i1 %24, i32 0, i32 264
  %84 = xor i32 %71, %83
  %85 = select i1 %28, i32 0, i32 528
  %86 = xor i32 %84, %85
  %87 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %86
  %88 = xor i32 1056, %54
  %89 = xor i32 %88, %58
  %90 = xor i32 %89, %62
  %91 = xor i32 %90, %66
  %92 = xor i32 %91, %70
  %93 = xor i32 %92, %83
  %94 = xor i32 %93, %85
  %95 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %94
  %96 = xor i32 2048, %54
  %97 = xor i32 %96, %58
  %98 = xor i32 %97, %62
  %99 = xor i32 %98, %66
  %100 = xor i32 %99, %70
  %101 = xor i32 %100, %83
  %102 = xor i32 %101, %85
  %103 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %102
  %104 = xor i32 3104, %54
  %105 = xor i32 %104, %58
  %106 = xor i32 %105, %62
  %107 = xor i32 %106, %66
  %108 = xor i32 %107, %70
  %109 = xor i32 %108, %83
  %110 = xor i32 %109, %85
  %111 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %110
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %87, ptr addrspace(1) %79, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %95, ptr addrspace(1) %80, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %103, ptr addrspace(1) %81, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %111, ptr addrspace(1) %82, i32 16)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  %112 = add i64 %74, 256
  %113 = add i64 %47, %112
  %114 = add i64 %48, %112
  %115 = add i64 %49, %112
  %116 = add i64 %50, %112
  %117 = getelementptr bfloat, ptr addrspace(1) %17, i64 %113
  %118 = getelementptr bfloat, ptr addrspace(1) %17, i64 %114
  %119 = getelementptr bfloat, ptr addrspace(1) %17, i64 %115
  %120 = getelementptr bfloat, ptr addrspace(1) %17, i64 %116
  call void @llvm.nvvm.barrier0()
  %121 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 8192), i32 %86
  %122 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 8192), i32 %94
  %123 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 8192), i32 %102
  %124 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 8192), i32 %110
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %121, ptr addrspace(1) %117, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %122, ptr addrspace(1) %118, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %123, ptr addrspace(1) %119, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %124, ptr addrspace(1) %120, i32 16)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  call void asm sideeffect "cp.async.wait_group 0x1;", ""()
  call void @llvm.nvvm.barrier0()
  br label %125

125:                                              ; preds = %133, %0
  %126 = phi i32 [ %839, %133 ], [ 0, %0 ]
  %127 = phi i64 [ %805, %133 ], [ 256, %0 ]
  %128 = phi { float, float, float, float } [ %804, %133 ], [ zeroinitializer, %0 ]
  %129 = phi i32 [ %808, %133 ], [ 1, %0 ]
  %130 = phi i32 [ %830, %133 ], [ 0, %0 ]
  %131 = phi { ptr addrspace(3), i32, i32 } [ %838, %133 ], [ { ptr addrspace(3) @global_smem, i32 0, i32 0 }, %0 ]
  %132 = icmp slt i32 %126, 2048
  br i1 %132, label %133, label %840

133:                                              ; preds = %125
  %134 = icmp slt i32 %126, 1536
  %135 = extractvalue { ptr addrspace(3), i32, i32 } %131, 0
  %136 = select i1 %53, i32 0, i32 264
  %137 = xor i32 0, %136
  %138 = select i1 %57, i32 0, i32 528
  %139 = xor i32 %137, %138
  %140 = select i1 %61, i32 0, i32 1056
  %141 = xor i32 %139, %140
  %142 = select i1 %65, i32 0, i32 2048
  %143 = xor i32 %141, %142
  %144 = select i1 %69, i32 0, i32 8
  %145 = xor i32 %143, %144
  %146 = getelementptr inbounds bfloat, ptr addrspace(3) %135, i32 %145
  %147 = ptrtoint ptr addrspace(3) %146 to i32
  %148 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %147)
  %149 = extractvalue { i32, i32, i32, i32 } %148, 0
  %150 = extractvalue { i32, i32, i32, i32 } %148, 1
  %151 = extractvalue { i32, i32, i32, i32 } %148, 2
  %152 = extractvalue { i32, i32, i32, i32 } %148, 3
  %153 = xor i32 16, %136
  %154 = xor i32 %153, %138
  %155 = xor i32 %154, %140
  %156 = xor i32 %155, %142
  %157 = xor i32 %156, %144
  %158 = getelementptr inbounds bfloat, ptr addrspace(3) %135, i32 %157
  %159 = ptrtoint ptr addrspace(3) %158 to i32
  %160 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %159)
  %161 = extractvalue { i32, i32, i32, i32 } %160, 0
  %162 = extractvalue { i32, i32, i32, i32 } %160, 1
  %163 = extractvalue { i32, i32, i32, i32 } %160, 2
  %164 = extractvalue { i32, i32, i32, i32 } %160, 3
  %165 = xor i32 32, %136
  %166 = xor i32 %165, %138
  %167 = xor i32 %166, %140
  %168 = xor i32 %167, %142
  %169 = xor i32 %168, %144
  %170 = getelementptr inbounds bfloat, ptr addrspace(3) %135, i32 %169
  %171 = ptrtoint ptr addrspace(3) %170 to i32
  %172 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %171)
  %173 = extractvalue { i32, i32, i32, i32 } %172, 0
  %174 = extractvalue { i32, i32, i32, i32 } %172, 1
  %175 = extractvalue { i32, i32, i32, i32 } %172, 2
  %176 = extractvalue { i32, i32, i32, i32 } %172, 3
  %177 = xor i32 48, %136
  %178 = xor i32 %177, %138
  %179 = xor i32 %178, %140
  %180 = xor i32 %179, %142
  %181 = xor i32 %180, %144
  %182 = getelementptr inbounds bfloat, ptr addrspace(3) %135, i32 %181
  %183 = ptrtoint ptr addrspace(3) %182 to i32
  %184 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %183)
  %185 = extractvalue { i32, i32, i32, i32 } %184, 0
  %186 = extractvalue { i32, i32, i32, i32 } %184, 1
  %187 = extractvalue { i32, i32, i32, i32 } %184, 2
  %188 = extractvalue { i32, i32, i32, i32 } %184, 3
  %189 = xor i32 64, %136
  %190 = xor i32 %189, %138
  %191 = xor i32 %190, %140
  %192 = xor i32 %191, %142
  %193 = xor i32 %192, %144
  %194 = getelementptr inbounds bfloat, ptr addrspace(3) %135, i32 %193
  %195 = ptrtoint ptr addrspace(3) %194 to i32
  %196 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %195)
  %197 = extractvalue { i32, i32, i32, i32 } %196, 0
  %198 = extractvalue { i32, i32, i32, i32 } %196, 1
  %199 = extractvalue { i32, i32, i32, i32 } %196, 2
  %200 = extractvalue { i32, i32, i32, i32 } %196, 3
  %201 = xor i32 80, %136
  %202 = xor i32 %201, %138
  %203 = xor i32 %202, %140
  %204 = xor i32 %203, %142
  %205 = xor i32 %204, %144
  %206 = getelementptr inbounds bfloat, ptr addrspace(3) %135, i32 %205
  %207 = ptrtoint ptr addrspace(3) %206 to i32
  %208 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %207)
  %209 = extractvalue { i32, i32, i32, i32 } %208, 0
  %210 = extractvalue { i32, i32, i32, i32 } %208, 1
  %211 = extractvalue { i32, i32, i32, i32 } %208, 2
  %212 = extractvalue { i32, i32, i32, i32 } %208, 3
  %213 = xor i32 96, %136
  %214 = xor i32 %213, %138
  %215 = xor i32 %214, %140
  %216 = xor i32 %215, %142
  %217 = xor i32 %216, %144
  %218 = getelementptr inbounds bfloat, ptr addrspace(3) %135, i32 %217
  %219 = ptrtoint ptr addrspace(3) %218 to i32
  %220 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %219)
  %221 = extractvalue { i32, i32, i32, i32 } %220, 0
  %222 = extractvalue { i32, i32, i32, i32 } %220, 1
  %223 = extractvalue { i32, i32, i32, i32 } %220, 2
  %224 = extractvalue { i32, i32, i32, i32 } %220, 3
  %225 = xor i32 112, %136
  %226 = xor i32 %225, %138
  %227 = xor i32 %226, %140
  %228 = xor i32 %227, %142
  %229 = xor i32 %228, %144
  %230 = getelementptr inbounds bfloat, ptr addrspace(3) %135, i32 %229
  %231 = ptrtoint ptr addrspace(3) %230 to i32
  %232 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %231)
  %233 = extractvalue { i32, i32, i32, i32 } %232, 0
  %234 = extractvalue { i32, i32, i32, i32 } %232, 1
  %235 = extractvalue { i32, i32, i32, i32 } %232, 2
  %236 = extractvalue { i32, i32, i32, i32 } %232, 3
  %237 = xor i32 128, %136
  %238 = xor i32 %237, %138
  %239 = xor i32 %238, %140
  %240 = xor i32 %239, %142
  %241 = xor i32 %240, %144
  %242 = getelementptr inbounds bfloat, ptr addrspace(3) %135, i32 %241
  %243 = ptrtoint ptr addrspace(3) %242 to i32
  %244 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %243)
  %245 = extractvalue { i32, i32, i32, i32 } %244, 0
  %246 = extractvalue { i32, i32, i32, i32 } %244, 1
  %247 = extractvalue { i32, i32, i32, i32 } %244, 2
  %248 = extractvalue { i32, i32, i32, i32 } %244, 3
  %249 = xor i32 144, %136
  %250 = xor i32 %249, %138
  %251 = xor i32 %250, %140
  %252 = xor i32 %251, %142
  %253 = xor i32 %252, %144
  %254 = getelementptr inbounds bfloat, ptr addrspace(3) %135, i32 %253
  %255 = ptrtoint ptr addrspace(3) %254 to i32
  %256 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %255)
  %257 = extractvalue { i32, i32, i32, i32 } %256, 0
  %258 = extractvalue { i32, i32, i32, i32 } %256, 1
  %259 = extractvalue { i32, i32, i32, i32 } %256, 2
  %260 = extractvalue { i32, i32, i32, i32 } %256, 3
  %261 = xor i32 160, %136
  %262 = xor i32 %261, %138
  %263 = xor i32 %262, %140
  %264 = xor i32 %263, %142
  %265 = xor i32 %264, %144
  %266 = getelementptr inbounds bfloat, ptr addrspace(3) %135, i32 %265
  %267 = ptrtoint ptr addrspace(3) %266 to i32
  %268 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %267)
  %269 = extractvalue { i32, i32, i32, i32 } %268, 0
  %270 = extractvalue { i32, i32, i32, i32 } %268, 1
  %271 = extractvalue { i32, i32, i32, i32 } %268, 2
  %272 = extractvalue { i32, i32, i32, i32 } %268, 3
  %273 = xor i32 176, %136
  %274 = xor i32 %273, %138
  %275 = xor i32 %274, %140
  %276 = xor i32 %275, %142
  %277 = xor i32 %276, %144
  %278 = getelementptr inbounds bfloat, ptr addrspace(3) %135, i32 %277
  %279 = ptrtoint ptr addrspace(3) %278 to i32
  %280 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %279)
  %281 = extractvalue { i32, i32, i32, i32 } %280, 0
  %282 = extractvalue { i32, i32, i32, i32 } %280, 1
  %283 = extractvalue { i32, i32, i32, i32 } %280, 2
  %284 = extractvalue { i32, i32, i32, i32 } %280, 3
  %285 = xor i32 192, %136
  %286 = xor i32 %285, %138
  %287 = xor i32 %286, %140
  %288 = xor i32 %287, %142
  %289 = xor i32 %288, %144
  %290 = getelementptr inbounds bfloat, ptr addrspace(3) %135, i32 %289
  %291 = ptrtoint ptr addrspace(3) %290 to i32
  %292 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %291)
  %293 = extractvalue { i32, i32, i32, i32 } %292, 0
  %294 = extractvalue { i32, i32, i32, i32 } %292, 1
  %295 = extractvalue { i32, i32, i32, i32 } %292, 2
  %296 = extractvalue { i32, i32, i32, i32 } %292, 3
  %297 = xor i32 208, %136
  %298 = xor i32 %297, %138
  %299 = xor i32 %298, %140
  %300 = xor i32 %299, %142
  %301 = xor i32 %300, %144
  %302 = getelementptr inbounds bfloat, ptr addrspace(3) %135, i32 %301
  %303 = ptrtoint ptr addrspace(3) %302 to i32
  %304 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %303)
  %305 = extractvalue { i32, i32, i32, i32 } %304, 0
  %306 = extractvalue { i32, i32, i32, i32 } %304, 1
  %307 = extractvalue { i32, i32, i32, i32 } %304, 2
  %308 = extractvalue { i32, i32, i32, i32 } %304, 3
  %309 = xor i32 224, %136
  %310 = xor i32 %309, %138
  %311 = xor i32 %310, %140
  %312 = xor i32 %311, %142
  %313 = xor i32 %312, %144
  %314 = getelementptr inbounds bfloat, ptr addrspace(3) %135, i32 %313
  %315 = ptrtoint ptr addrspace(3) %314 to i32
  %316 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %315)
  %317 = extractvalue { i32, i32, i32, i32 } %316, 0
  %318 = extractvalue { i32, i32, i32, i32 } %316, 1
  %319 = extractvalue { i32, i32, i32, i32 } %316, 2
  %320 = extractvalue { i32, i32, i32, i32 } %316, 3
  %321 = xor i32 240, %136
  %322 = xor i32 %321, %138
  %323 = xor i32 %322, %140
  %324 = xor i32 %323, %142
  %325 = xor i32 %324, %144
  %326 = getelementptr inbounds bfloat, ptr addrspace(3) %135, i32 %325
  %327 = ptrtoint ptr addrspace(3) %326 to i32
  %328 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %327)
  %329 = extractvalue { i32, i32, i32, i32 } %328, 0
  %330 = extractvalue { i32, i32, i32, i32 } %328, 1
  %331 = extractvalue { i32, i32, i32, i32 } %328, 2
  %332 = extractvalue { i32, i32, i32, i32 } %328, 3
  %333 = bitcast i32 %149 to <2 x bfloat>
  %334 = extractelement <2 x bfloat> %333, i32 0
  %335 = extractelement <2 x bfloat> %333, i32 1
  %336 = bitcast i32 %150 to <2 x bfloat>
  %337 = extractelement <2 x bfloat> %336, i32 0
  %338 = extractelement <2 x bfloat> %336, i32 1
  %339 = bitcast i32 %151 to <2 x bfloat>
  %340 = extractelement <2 x bfloat> %339, i32 0
  %341 = extractelement <2 x bfloat> %339, i32 1
  %342 = bitcast i32 %152 to <2 x bfloat>
  %343 = extractelement <2 x bfloat> %342, i32 0
  %344 = extractelement <2 x bfloat> %342, i32 1
  %345 = bitcast i32 %161 to <2 x bfloat>
  %346 = extractelement <2 x bfloat> %345, i32 0
  %347 = extractelement <2 x bfloat> %345, i32 1
  %348 = bitcast i32 %162 to <2 x bfloat>
  %349 = extractelement <2 x bfloat> %348, i32 0
  %350 = extractelement <2 x bfloat> %348, i32 1
  %351 = bitcast i32 %163 to <2 x bfloat>
  %352 = extractelement <2 x bfloat> %351, i32 0
  %353 = extractelement <2 x bfloat> %351, i32 1
  %354 = bitcast i32 %164 to <2 x bfloat>
  %355 = extractelement <2 x bfloat> %354, i32 0
  %356 = extractelement <2 x bfloat> %354, i32 1
  %357 = bitcast i32 %173 to <2 x bfloat>
  %358 = extractelement <2 x bfloat> %357, i32 0
  %359 = extractelement <2 x bfloat> %357, i32 1
  %360 = bitcast i32 %174 to <2 x bfloat>
  %361 = extractelement <2 x bfloat> %360, i32 0
  %362 = extractelement <2 x bfloat> %360, i32 1
  %363 = bitcast i32 %175 to <2 x bfloat>
  %364 = extractelement <2 x bfloat> %363, i32 0
  %365 = extractelement <2 x bfloat> %363, i32 1
  %366 = bitcast i32 %176 to <2 x bfloat>
  %367 = extractelement <2 x bfloat> %366, i32 0
  %368 = extractelement <2 x bfloat> %366, i32 1
  %369 = bitcast i32 %185 to <2 x bfloat>
  %370 = extractelement <2 x bfloat> %369, i32 0
  %371 = extractelement <2 x bfloat> %369, i32 1
  %372 = bitcast i32 %186 to <2 x bfloat>
  %373 = extractelement <2 x bfloat> %372, i32 0
  %374 = extractelement <2 x bfloat> %372, i32 1
  %375 = bitcast i32 %187 to <2 x bfloat>
  %376 = extractelement <2 x bfloat> %375, i32 0
  %377 = extractelement <2 x bfloat> %375, i32 1
  %378 = bitcast i32 %188 to <2 x bfloat>
  %379 = extractelement <2 x bfloat> %378, i32 0
  %380 = extractelement <2 x bfloat> %378, i32 1
  %381 = bitcast i32 %197 to <2 x bfloat>
  %382 = extractelement <2 x bfloat> %381, i32 0
  %383 = extractelement <2 x bfloat> %381, i32 1
  %384 = bitcast i32 %198 to <2 x bfloat>
  %385 = extractelement <2 x bfloat> %384, i32 0
  %386 = extractelement <2 x bfloat> %384, i32 1
  %387 = bitcast i32 %199 to <2 x bfloat>
  %388 = extractelement <2 x bfloat> %387, i32 0
  %389 = extractelement <2 x bfloat> %387, i32 1
  %390 = bitcast i32 %200 to <2 x bfloat>
  %391 = extractelement <2 x bfloat> %390, i32 0
  %392 = extractelement <2 x bfloat> %390, i32 1
  %393 = bitcast i32 %209 to <2 x bfloat>
  %394 = extractelement <2 x bfloat> %393, i32 0
  %395 = extractelement <2 x bfloat> %393, i32 1
  %396 = bitcast i32 %210 to <2 x bfloat>
  %397 = extractelement <2 x bfloat> %396, i32 0
  %398 = extractelement <2 x bfloat> %396, i32 1
  %399 = bitcast i32 %211 to <2 x bfloat>
  %400 = extractelement <2 x bfloat> %399, i32 0
  %401 = extractelement <2 x bfloat> %399, i32 1
  %402 = bitcast i32 %212 to <2 x bfloat>
  %403 = extractelement <2 x bfloat> %402, i32 0
  %404 = extractelement <2 x bfloat> %402, i32 1
  %405 = bitcast i32 %221 to <2 x bfloat>
  %406 = extractelement <2 x bfloat> %405, i32 0
  %407 = extractelement <2 x bfloat> %405, i32 1
  %408 = bitcast i32 %222 to <2 x bfloat>
  %409 = extractelement <2 x bfloat> %408, i32 0
  %410 = extractelement <2 x bfloat> %408, i32 1
  %411 = bitcast i32 %223 to <2 x bfloat>
  %412 = extractelement <2 x bfloat> %411, i32 0
  %413 = extractelement <2 x bfloat> %411, i32 1
  %414 = bitcast i32 %224 to <2 x bfloat>
  %415 = extractelement <2 x bfloat> %414, i32 0
  %416 = extractelement <2 x bfloat> %414, i32 1
  %417 = bitcast i32 %233 to <2 x bfloat>
  %418 = extractelement <2 x bfloat> %417, i32 0
  %419 = extractelement <2 x bfloat> %417, i32 1
  %420 = bitcast i32 %234 to <2 x bfloat>
  %421 = extractelement <2 x bfloat> %420, i32 0
  %422 = extractelement <2 x bfloat> %420, i32 1
  %423 = bitcast i32 %235 to <2 x bfloat>
  %424 = extractelement <2 x bfloat> %423, i32 0
  %425 = extractelement <2 x bfloat> %423, i32 1
  %426 = bitcast i32 %236 to <2 x bfloat>
  %427 = extractelement <2 x bfloat> %426, i32 0
  %428 = extractelement <2 x bfloat> %426, i32 1
  %429 = bitcast i32 %245 to <2 x bfloat>
  %430 = extractelement <2 x bfloat> %429, i32 0
  %431 = extractelement <2 x bfloat> %429, i32 1
  %432 = bitcast i32 %246 to <2 x bfloat>
  %433 = extractelement <2 x bfloat> %432, i32 0
  %434 = extractelement <2 x bfloat> %432, i32 1
  %435 = bitcast i32 %247 to <2 x bfloat>
  %436 = extractelement <2 x bfloat> %435, i32 0
  %437 = extractelement <2 x bfloat> %435, i32 1
  %438 = bitcast i32 %248 to <2 x bfloat>
  %439 = extractelement <2 x bfloat> %438, i32 0
  %440 = extractelement <2 x bfloat> %438, i32 1
  %441 = bitcast i32 %257 to <2 x bfloat>
  %442 = extractelement <2 x bfloat> %441, i32 0
  %443 = extractelement <2 x bfloat> %441, i32 1
  %444 = bitcast i32 %258 to <2 x bfloat>
  %445 = extractelement <2 x bfloat> %444, i32 0
  %446 = extractelement <2 x bfloat> %444, i32 1
  %447 = bitcast i32 %259 to <2 x bfloat>
  %448 = extractelement <2 x bfloat> %447, i32 0
  %449 = extractelement <2 x bfloat> %447, i32 1
  %450 = bitcast i32 %260 to <2 x bfloat>
  %451 = extractelement <2 x bfloat> %450, i32 0
  %452 = extractelement <2 x bfloat> %450, i32 1
  %453 = bitcast i32 %269 to <2 x bfloat>
  %454 = extractelement <2 x bfloat> %453, i32 0
  %455 = extractelement <2 x bfloat> %453, i32 1
  %456 = bitcast i32 %270 to <2 x bfloat>
  %457 = extractelement <2 x bfloat> %456, i32 0
  %458 = extractelement <2 x bfloat> %456, i32 1
  %459 = bitcast i32 %271 to <2 x bfloat>
  %460 = extractelement <2 x bfloat> %459, i32 0
  %461 = extractelement <2 x bfloat> %459, i32 1
  %462 = bitcast i32 %272 to <2 x bfloat>
  %463 = extractelement <2 x bfloat> %462, i32 0
  %464 = extractelement <2 x bfloat> %462, i32 1
  %465 = bitcast i32 %281 to <2 x bfloat>
  %466 = extractelement <2 x bfloat> %465, i32 0
  %467 = extractelement <2 x bfloat> %465, i32 1
  %468 = bitcast i32 %282 to <2 x bfloat>
  %469 = extractelement <2 x bfloat> %468, i32 0
  %470 = extractelement <2 x bfloat> %468, i32 1
  %471 = bitcast i32 %283 to <2 x bfloat>
  %472 = extractelement <2 x bfloat> %471, i32 0
  %473 = extractelement <2 x bfloat> %471, i32 1
  %474 = bitcast i32 %284 to <2 x bfloat>
  %475 = extractelement <2 x bfloat> %474, i32 0
  %476 = extractelement <2 x bfloat> %474, i32 1
  %477 = bitcast i32 %293 to <2 x bfloat>
  %478 = extractelement <2 x bfloat> %477, i32 0
  %479 = extractelement <2 x bfloat> %477, i32 1
  %480 = bitcast i32 %294 to <2 x bfloat>
  %481 = extractelement <2 x bfloat> %480, i32 0
  %482 = extractelement <2 x bfloat> %480, i32 1
  %483 = bitcast i32 %295 to <2 x bfloat>
  %484 = extractelement <2 x bfloat> %483, i32 0
  %485 = extractelement <2 x bfloat> %483, i32 1
  %486 = bitcast i32 %296 to <2 x bfloat>
  %487 = extractelement <2 x bfloat> %486, i32 0
  %488 = extractelement <2 x bfloat> %486, i32 1
  %489 = bitcast i32 %305 to <2 x bfloat>
  %490 = extractelement <2 x bfloat> %489, i32 0
  %491 = extractelement <2 x bfloat> %489, i32 1
  %492 = bitcast i32 %306 to <2 x bfloat>
  %493 = extractelement <2 x bfloat> %492, i32 0
  %494 = extractelement <2 x bfloat> %492, i32 1
  %495 = bitcast i32 %307 to <2 x bfloat>
  %496 = extractelement <2 x bfloat> %495, i32 0
  %497 = extractelement <2 x bfloat> %495, i32 1
  %498 = bitcast i32 %308 to <2 x bfloat>
  %499 = extractelement <2 x bfloat> %498, i32 0
  %500 = extractelement <2 x bfloat> %498, i32 1
  %501 = bitcast i32 %317 to <2 x bfloat>
  %502 = extractelement <2 x bfloat> %501, i32 0
  %503 = extractelement <2 x bfloat> %501, i32 1
  %504 = bitcast i32 %318 to <2 x bfloat>
  %505 = extractelement <2 x bfloat> %504, i32 0
  %506 = extractelement <2 x bfloat> %504, i32 1
  %507 = bitcast i32 %319 to <2 x bfloat>
  %508 = extractelement <2 x bfloat> %507, i32 0
  %509 = extractelement <2 x bfloat> %507, i32 1
  %510 = bitcast i32 %320 to <2 x bfloat>
  %511 = extractelement <2 x bfloat> %510, i32 0
  %512 = extractelement <2 x bfloat> %510, i32 1
  %513 = bitcast i32 %329 to <2 x bfloat>
  %514 = extractelement <2 x bfloat> %513, i32 0
  %515 = extractelement <2 x bfloat> %513, i32 1
  %516 = bitcast i32 %330 to <2 x bfloat>
  %517 = extractelement <2 x bfloat> %516, i32 0
  %518 = extractelement <2 x bfloat> %516, i32 1
  %519 = bitcast i32 %331 to <2 x bfloat>
  %520 = extractelement <2 x bfloat> %519, i32 0
  %521 = extractelement <2 x bfloat> %519, i32 1
  %522 = bitcast i32 %332 to <2 x bfloat>
  %523 = extractelement <2 x bfloat> %522, i32 0
  %524 = extractelement <2 x bfloat> %522, i32 1
  %525 = insertelement <2 x bfloat> undef, bfloat %334, i32 0
  %526 = insertelement <2 x bfloat> %525, bfloat %335, i32 1
  %527 = bitcast <2 x bfloat> %526 to i32
  %528 = insertelement <2 x bfloat> undef, bfloat %337, i32 0
  %529 = insertelement <2 x bfloat> %528, bfloat %338, i32 1
  %530 = bitcast <2 x bfloat> %529 to i32
  %531 = insertelement <2 x bfloat> undef, bfloat %340, i32 0
  %532 = insertelement <2 x bfloat> %531, bfloat %341, i32 1
  %533 = bitcast <2 x bfloat> %532 to i32
  %534 = insertelement <2 x bfloat> undef, bfloat %343, i32 0
  %535 = insertelement <2 x bfloat> %534, bfloat %344, i32 1
  %536 = bitcast <2 x bfloat> %535 to i32
  %537 = insertelement <2 x bfloat> undef, bfloat %346, i32 0
  %538 = insertelement <2 x bfloat> %537, bfloat %347, i32 1
  %539 = bitcast <2 x bfloat> %538 to i32
  %540 = insertelement <2 x bfloat> undef, bfloat %349, i32 0
  %541 = insertelement <2 x bfloat> %540, bfloat %350, i32 1
  %542 = bitcast <2 x bfloat> %541 to i32
  %543 = insertelement <2 x bfloat> undef, bfloat %352, i32 0
  %544 = insertelement <2 x bfloat> %543, bfloat %353, i32 1
  %545 = bitcast <2 x bfloat> %544 to i32
  %546 = insertelement <2 x bfloat> undef, bfloat %355, i32 0
  %547 = insertelement <2 x bfloat> %546, bfloat %356, i32 1
  %548 = bitcast <2 x bfloat> %547 to i32
  %549 = insertelement <2 x bfloat> undef, bfloat %358, i32 0
  %550 = insertelement <2 x bfloat> %549, bfloat %359, i32 1
  %551 = bitcast <2 x bfloat> %550 to i32
  %552 = insertelement <2 x bfloat> undef, bfloat %361, i32 0
  %553 = insertelement <2 x bfloat> %552, bfloat %362, i32 1
  %554 = bitcast <2 x bfloat> %553 to i32
  %555 = insertelement <2 x bfloat> undef, bfloat %364, i32 0
  %556 = insertelement <2 x bfloat> %555, bfloat %365, i32 1
  %557 = bitcast <2 x bfloat> %556 to i32
  %558 = insertelement <2 x bfloat> undef, bfloat %367, i32 0
  %559 = insertelement <2 x bfloat> %558, bfloat %368, i32 1
  %560 = bitcast <2 x bfloat> %559 to i32
  %561 = insertelement <2 x bfloat> undef, bfloat %370, i32 0
  %562 = insertelement <2 x bfloat> %561, bfloat %371, i32 1
  %563 = bitcast <2 x bfloat> %562 to i32
  %564 = insertelement <2 x bfloat> undef, bfloat %373, i32 0
  %565 = insertelement <2 x bfloat> %564, bfloat %374, i32 1
  %566 = bitcast <2 x bfloat> %565 to i32
  %567 = insertelement <2 x bfloat> undef, bfloat %376, i32 0
  %568 = insertelement <2 x bfloat> %567, bfloat %377, i32 1
  %569 = bitcast <2 x bfloat> %568 to i32
  %570 = insertelement <2 x bfloat> undef, bfloat %379, i32 0
  %571 = insertelement <2 x bfloat> %570, bfloat %380, i32 1
  %572 = bitcast <2 x bfloat> %571 to i32
  %573 = insertelement <2 x bfloat> undef, bfloat %382, i32 0
  %574 = insertelement <2 x bfloat> %573, bfloat %383, i32 1
  %575 = bitcast <2 x bfloat> %574 to i32
  %576 = insertelement <2 x bfloat> undef, bfloat %385, i32 0
  %577 = insertelement <2 x bfloat> %576, bfloat %386, i32 1
  %578 = bitcast <2 x bfloat> %577 to i32
  %579 = insertelement <2 x bfloat> undef, bfloat %388, i32 0
  %580 = insertelement <2 x bfloat> %579, bfloat %389, i32 1
  %581 = bitcast <2 x bfloat> %580 to i32
  %582 = insertelement <2 x bfloat> undef, bfloat %391, i32 0
  %583 = insertelement <2 x bfloat> %582, bfloat %392, i32 1
  %584 = bitcast <2 x bfloat> %583 to i32
  %585 = insertelement <2 x bfloat> undef, bfloat %394, i32 0
  %586 = insertelement <2 x bfloat> %585, bfloat %395, i32 1
  %587 = bitcast <2 x bfloat> %586 to i32
  %588 = insertelement <2 x bfloat> undef, bfloat %397, i32 0
  %589 = insertelement <2 x bfloat> %588, bfloat %398, i32 1
  %590 = bitcast <2 x bfloat> %589 to i32
  %591 = insertelement <2 x bfloat> undef, bfloat %400, i32 0
  %592 = insertelement <2 x bfloat> %591, bfloat %401, i32 1
  %593 = bitcast <2 x bfloat> %592 to i32
  %594 = insertelement <2 x bfloat> undef, bfloat %403, i32 0
  %595 = insertelement <2 x bfloat> %594, bfloat %404, i32 1
  %596 = bitcast <2 x bfloat> %595 to i32
  %597 = insertelement <2 x bfloat> undef, bfloat %406, i32 0
  %598 = insertelement <2 x bfloat> %597, bfloat %407, i32 1
  %599 = bitcast <2 x bfloat> %598 to i32
  %600 = insertelement <2 x bfloat> undef, bfloat %409, i32 0
  %601 = insertelement <2 x bfloat> %600, bfloat %410, i32 1
  %602 = bitcast <2 x bfloat> %601 to i32
  %603 = insertelement <2 x bfloat> undef, bfloat %412, i32 0
  %604 = insertelement <2 x bfloat> %603, bfloat %413, i32 1
  %605 = bitcast <2 x bfloat> %604 to i32
  %606 = insertelement <2 x bfloat> undef, bfloat %415, i32 0
  %607 = insertelement <2 x bfloat> %606, bfloat %416, i32 1
  %608 = bitcast <2 x bfloat> %607 to i32
  %609 = insertelement <2 x bfloat> undef, bfloat %418, i32 0
  %610 = insertelement <2 x bfloat> %609, bfloat %419, i32 1
  %611 = bitcast <2 x bfloat> %610 to i32
  %612 = insertelement <2 x bfloat> undef, bfloat %421, i32 0
  %613 = insertelement <2 x bfloat> %612, bfloat %422, i32 1
  %614 = bitcast <2 x bfloat> %613 to i32
  %615 = insertelement <2 x bfloat> undef, bfloat %424, i32 0
  %616 = insertelement <2 x bfloat> %615, bfloat %425, i32 1
  %617 = bitcast <2 x bfloat> %616 to i32
  %618 = insertelement <2 x bfloat> undef, bfloat %427, i32 0
  %619 = insertelement <2 x bfloat> %618, bfloat %428, i32 1
  %620 = bitcast <2 x bfloat> %619 to i32
  %621 = insertelement <2 x bfloat> undef, bfloat %430, i32 0
  %622 = insertelement <2 x bfloat> %621, bfloat %431, i32 1
  %623 = bitcast <2 x bfloat> %622 to i32
  %624 = insertelement <2 x bfloat> undef, bfloat %433, i32 0
  %625 = insertelement <2 x bfloat> %624, bfloat %434, i32 1
  %626 = bitcast <2 x bfloat> %625 to i32
  %627 = insertelement <2 x bfloat> undef, bfloat %436, i32 0
  %628 = insertelement <2 x bfloat> %627, bfloat %437, i32 1
  %629 = bitcast <2 x bfloat> %628 to i32
  %630 = insertelement <2 x bfloat> undef, bfloat %439, i32 0
  %631 = insertelement <2 x bfloat> %630, bfloat %440, i32 1
  %632 = bitcast <2 x bfloat> %631 to i32
  %633 = insertelement <2 x bfloat> undef, bfloat %442, i32 0
  %634 = insertelement <2 x bfloat> %633, bfloat %443, i32 1
  %635 = bitcast <2 x bfloat> %634 to i32
  %636 = insertelement <2 x bfloat> undef, bfloat %445, i32 0
  %637 = insertelement <2 x bfloat> %636, bfloat %446, i32 1
  %638 = bitcast <2 x bfloat> %637 to i32
  %639 = insertelement <2 x bfloat> undef, bfloat %448, i32 0
  %640 = insertelement <2 x bfloat> %639, bfloat %449, i32 1
  %641 = bitcast <2 x bfloat> %640 to i32
  %642 = insertelement <2 x bfloat> undef, bfloat %451, i32 0
  %643 = insertelement <2 x bfloat> %642, bfloat %452, i32 1
  %644 = bitcast <2 x bfloat> %643 to i32
  %645 = insertelement <2 x bfloat> undef, bfloat %454, i32 0
  %646 = insertelement <2 x bfloat> %645, bfloat %455, i32 1
  %647 = bitcast <2 x bfloat> %646 to i32
  %648 = insertelement <2 x bfloat> undef, bfloat %457, i32 0
  %649 = insertelement <2 x bfloat> %648, bfloat %458, i32 1
  %650 = bitcast <2 x bfloat> %649 to i32
  %651 = insertelement <2 x bfloat> undef, bfloat %460, i32 0
  %652 = insertelement <2 x bfloat> %651, bfloat %461, i32 1
  %653 = bitcast <2 x bfloat> %652 to i32
  %654 = insertelement <2 x bfloat> undef, bfloat %463, i32 0
  %655 = insertelement <2 x bfloat> %654, bfloat %464, i32 1
  %656 = bitcast <2 x bfloat> %655 to i32
  %657 = insertelement <2 x bfloat> undef, bfloat %466, i32 0
  %658 = insertelement <2 x bfloat> %657, bfloat %467, i32 1
  %659 = bitcast <2 x bfloat> %658 to i32
  %660 = insertelement <2 x bfloat> undef, bfloat %469, i32 0
  %661 = insertelement <2 x bfloat> %660, bfloat %470, i32 1
  %662 = bitcast <2 x bfloat> %661 to i32
  %663 = insertelement <2 x bfloat> undef, bfloat %472, i32 0
  %664 = insertelement <2 x bfloat> %663, bfloat %473, i32 1
  %665 = bitcast <2 x bfloat> %664 to i32
  %666 = insertelement <2 x bfloat> undef, bfloat %475, i32 0
  %667 = insertelement <2 x bfloat> %666, bfloat %476, i32 1
  %668 = bitcast <2 x bfloat> %667 to i32
  %669 = insertelement <2 x bfloat> undef, bfloat %478, i32 0
  %670 = insertelement <2 x bfloat> %669, bfloat %479, i32 1
  %671 = bitcast <2 x bfloat> %670 to i32
  %672 = insertelement <2 x bfloat> undef, bfloat %481, i32 0
  %673 = insertelement <2 x bfloat> %672, bfloat %482, i32 1
  %674 = bitcast <2 x bfloat> %673 to i32
  %675 = insertelement <2 x bfloat> undef, bfloat %484, i32 0
  %676 = insertelement <2 x bfloat> %675, bfloat %485, i32 1
  %677 = bitcast <2 x bfloat> %676 to i32
  %678 = insertelement <2 x bfloat> undef, bfloat %487, i32 0
  %679 = insertelement <2 x bfloat> %678, bfloat %488, i32 1
  %680 = bitcast <2 x bfloat> %679 to i32
  %681 = insertelement <2 x bfloat> undef, bfloat %490, i32 0
  %682 = insertelement <2 x bfloat> %681, bfloat %491, i32 1
  %683 = bitcast <2 x bfloat> %682 to i32
  %684 = insertelement <2 x bfloat> undef, bfloat %493, i32 0
  %685 = insertelement <2 x bfloat> %684, bfloat %494, i32 1
  %686 = bitcast <2 x bfloat> %685 to i32
  %687 = insertelement <2 x bfloat> undef, bfloat %496, i32 0
  %688 = insertelement <2 x bfloat> %687, bfloat %497, i32 1
  %689 = bitcast <2 x bfloat> %688 to i32
  %690 = insertelement <2 x bfloat> undef, bfloat %499, i32 0
  %691 = insertelement <2 x bfloat> %690, bfloat %500, i32 1
  %692 = bitcast <2 x bfloat> %691 to i32
  %693 = insertelement <2 x bfloat> undef, bfloat %502, i32 0
  %694 = insertelement <2 x bfloat> %693, bfloat %503, i32 1
  %695 = bitcast <2 x bfloat> %694 to i32
  %696 = insertelement <2 x bfloat> undef, bfloat %505, i32 0
  %697 = insertelement <2 x bfloat> %696, bfloat %506, i32 1
  %698 = bitcast <2 x bfloat> %697 to i32
  %699 = insertelement <2 x bfloat> undef, bfloat %508, i32 0
  %700 = insertelement <2 x bfloat> %699, bfloat %509, i32 1
  %701 = bitcast <2 x bfloat> %700 to i32
  %702 = insertelement <2 x bfloat> undef, bfloat %511, i32 0
  %703 = insertelement <2 x bfloat> %702, bfloat %512, i32 1
  %704 = bitcast <2 x bfloat> %703 to i32
  %705 = insertelement <2 x bfloat> undef, bfloat %514, i32 0
  %706 = insertelement <2 x bfloat> %705, bfloat %515, i32 1
  %707 = bitcast <2 x bfloat> %706 to i32
  %708 = insertelement <2 x bfloat> undef, bfloat %517, i32 0
  %709 = insertelement <2 x bfloat> %708, bfloat %518, i32 1
  %710 = bitcast <2 x bfloat> %709 to i32
  %711 = insertelement <2 x bfloat> undef, bfloat %520, i32 0
  %712 = insertelement <2 x bfloat> %711, bfloat %521, i32 1
  %713 = bitcast <2 x bfloat> %712 to i32
  %714 = insertelement <2 x bfloat> undef, bfloat %523, i32 0
  %715 = insertelement <2 x bfloat> %714, bfloat %524, i32 1
  %716 = bitcast <2 x bfloat> %715 to i32
  %717 = extractvalue { float, float, float, float } %128, 0
  %718 = extractvalue { float, float, float, float } %128, 1
  %719 = extractvalue { float, float, float, float } %128, 2
  %720 = extractvalue { float, float, float, float } %128, 3
  %721 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %717, float %718, float %719, float %720, i32 %527, i32 %530, i32 %533, i32 %536, i32 0, i32 0)
  %722 = extractvalue { float, float, float, float } %721, 0
  %723 = extractvalue { float, float, float, float } %721, 1
  %724 = extractvalue { float, float, float, float } %721, 2
  %725 = extractvalue { float, float, float, float } %721, 3
  %726 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %722, float %723, float %724, float %725, i32 %539, i32 %542, i32 %545, i32 %548, i32 0, i32 0)
  %727 = extractvalue { float, float, float, float } %726, 0
  %728 = extractvalue { float, float, float, float } %726, 1
  %729 = extractvalue { float, float, float, float } %726, 2
  %730 = extractvalue { float, float, float, float } %726, 3
  %731 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %727, float %728, float %729, float %730, i32 %551, i32 %554, i32 %557, i32 %560, i32 0, i32 0)
  %732 = extractvalue { float, float, float, float } %731, 0
  %733 = extractvalue { float, float, float, float } %731, 1
  %734 = extractvalue { float, float, float, float } %731, 2
  %735 = extractvalue { float, float, float, float } %731, 3
  %736 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %732, float %733, float %734, float %735, i32 %563, i32 %566, i32 %569, i32 %572, i32 0, i32 0)
  %737 = extractvalue { float, float, float, float } %736, 0
  %738 = extractvalue { float, float, float, float } %736, 1
  %739 = extractvalue { float, float, float, float } %736, 2
  %740 = extractvalue { float, float, float, float } %736, 3
  %741 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %737, float %738, float %739, float %740, i32 %575, i32 %578, i32 %581, i32 %584, i32 0, i32 0)
  %742 = extractvalue { float, float, float, float } %741, 0
  %743 = extractvalue { float, float, float, float } %741, 1
  %744 = extractvalue { float, float, float, float } %741, 2
  %745 = extractvalue { float, float, float, float } %741, 3
  %746 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %742, float %743, float %744, float %745, i32 %587, i32 %590, i32 %593, i32 %596, i32 0, i32 0)
  %747 = extractvalue { float, float, float, float } %746, 0
  %748 = extractvalue { float, float, float, float } %746, 1
  %749 = extractvalue { float, float, float, float } %746, 2
  %750 = extractvalue { float, float, float, float } %746, 3
  %751 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %747, float %748, float %749, float %750, i32 %599, i32 %602, i32 %605, i32 %608, i32 0, i32 0)
  %752 = extractvalue { float, float, float, float } %751, 0
  %753 = extractvalue { float, float, float, float } %751, 1
  %754 = extractvalue { float, float, float, float } %751, 2
  %755 = extractvalue { float, float, float, float } %751, 3
  %756 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %752, float %753, float %754, float %755, i32 %611, i32 %614, i32 %617, i32 %620, i32 0, i32 0)
  %757 = extractvalue { float, float, float, float } %756, 0
  %758 = extractvalue { float, float, float, float } %756, 1
  %759 = extractvalue { float, float, float, float } %756, 2
  %760 = extractvalue { float, float, float, float } %756, 3
  %761 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %757, float %758, float %759, float %760, i32 %623, i32 %626, i32 %629, i32 %632, i32 0, i32 0)
  %762 = extractvalue { float, float, float, float } %761, 0
  %763 = extractvalue { float, float, float, float } %761, 1
  %764 = extractvalue { float, float, float, float } %761, 2
  %765 = extractvalue { float, float, float, float } %761, 3
  %766 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %762, float %763, float %764, float %765, i32 %635, i32 %638, i32 %641, i32 %644, i32 0, i32 0)
  %767 = extractvalue { float, float, float, float } %766, 0
  %768 = extractvalue { float, float, float, float } %766, 1
  %769 = extractvalue { float, float, float, float } %766, 2
  %770 = extractvalue { float, float, float, float } %766, 3
  %771 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %767, float %768, float %769, float %770, i32 %647, i32 %650, i32 %653, i32 %656, i32 0, i32 0)
  %772 = extractvalue { float, float, float, float } %771, 0
  %773 = extractvalue { float, float, float, float } %771, 1
  %774 = extractvalue { float, float, float, float } %771, 2
  %775 = extractvalue { float, float, float, float } %771, 3
  %776 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %772, float %773, float %774, float %775, i32 %659, i32 %662, i32 %665, i32 %668, i32 0, i32 0)
  %777 = extractvalue { float, float, float, float } %776, 0
  %778 = extractvalue { float, float, float, float } %776, 1
  %779 = extractvalue { float, float, float, float } %776, 2
  %780 = extractvalue { float, float, float, float } %776, 3
  %781 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %777, float %778, float %779, float %780, i32 %671, i32 %674, i32 %677, i32 %680, i32 0, i32 0)
  %782 = extractvalue { float, float, float, float } %781, 0
  %783 = extractvalue { float, float, float, float } %781, 1
  %784 = extractvalue { float, float, float, float } %781, 2
  %785 = extractvalue { float, float, float, float } %781, 3
  %786 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %782, float %783, float %784, float %785, i32 %683, i32 %686, i32 %689, i32 %692, i32 0, i32 0)
  %787 = extractvalue { float, float, float, float } %786, 0
  %788 = extractvalue { float, float, float, float } %786, 1
  %789 = extractvalue { float, float, float, float } %786, 2
  %790 = extractvalue { float, float, float, float } %786, 3
  %791 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %787, float %788, float %789, float %790, i32 %695, i32 %698, i32 %701, i32 %704, i32 0, i32 0)
  %792 = extractvalue { float, float, float, float } %791, 0
  %793 = extractvalue { float, float, float, float } %791, 1
  %794 = extractvalue { float, float, float, float } %791, 2
  %795 = extractvalue { float, float, float, float } %791, 3
  %796 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %792, float %793, float %794, float %795, i32 %707, i32 %710, i32 %713, i32 %716, i32 0, i32 0)
  %797 = extractvalue { float, float, float, float } %796, 0
  %798 = extractvalue { float, float, float, float } %796, 1
  %799 = extractvalue { float, float, float, float } %796, 2
  %800 = extractvalue { float, float, float, float } %796, 3
  %801 = insertvalue { float, float, float, float } undef, float %797, 0
  %802 = insertvalue { float, float, float, float } %801, float %798, 1
  %803 = insertvalue { float, float, float, float } %802, float %799, 2
  %804 = insertvalue { float, float, float, float } %803, float %800, 3
  %805 = add i64 %127, 256
  %806 = add i32 %129, 1
  %807 = icmp slt i32 %806, 2
  %808 = select i1 %807, i32 %806, i32 0
  %809 = add i64 %805, %74
  %810 = add i64 %47, %809
  %811 = add i64 %48, %809
  %812 = add i64 %49, %809
  %813 = add i64 %50, %809
  %814 = getelementptr bfloat, ptr addrspace(1) %17, i64 %810
  %815 = getelementptr bfloat, ptr addrspace(1) %17, i64 %811
  %816 = getelementptr bfloat, ptr addrspace(1) %17, i64 %812
  %817 = getelementptr bfloat, ptr addrspace(1) %17, i64 %813
  %818 = mul i32 %808, 4096
  %819 = add i32 %818, 0
  %820 = add i32 %819, 0
  %821 = add i32 %820, 0
  %822 = getelementptr bfloat, ptr addrspace(3) @global_smem, i32 %821
  call void @llvm.nvvm.barrier0()
  %823 = getelementptr inbounds bfloat, ptr addrspace(3) %822, i32 %86
  %824 = getelementptr inbounds bfloat, ptr addrspace(3) %822, i32 %94
  %825 = getelementptr inbounds bfloat, ptr addrspace(3) %822, i32 %102
  %826 = getelementptr inbounds bfloat, ptr addrspace(3) %822, i32 %110
  %827 = select i1 %134, i32 16, i32 0
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %823, ptr addrspace(1) %814, i32 %827)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %824, ptr addrspace(1) %815, i32 %827)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %825, ptr addrspace(1) %816, i32 %827)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %826, ptr addrspace(1) %817, i32 %827)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  %828 = add i32 %130, 1
  %829 = icmp slt i32 %828, 2
  %830 = select i1 %829, i32 %828, i32 0
  call void asm sideeffect "cp.async.wait_group 0x1;", ""()
  call void @llvm.nvvm.barrier0()
  %831 = mul i32 %830, 4096
  %832 = add i32 %831, 0
  %833 = add i32 %832, 0
  %834 = add i32 %833, 0
  %835 = getelementptr bfloat, ptr addrspace(3) @global_smem, i32 %834
  %836 = insertvalue { ptr addrspace(3), i32, i32 } undef, ptr addrspace(3) %835, 0
  %837 = insertvalue { ptr addrspace(3), i32, i32 } %836, i32 0, 1
  %838 = insertvalue { ptr addrspace(3), i32, i32 } %837, i32 0, 2
  %839 = add i32 %126, 256
  br label %125

840:                                              ; preds = %125
  call void asm sideeffect "cp.async.wait_group 0x0;", ""()
  call void @llvm.nvvm.barrier0()
  %841 = extractvalue { float, float, float, float } %128, 0
  %842 = extractvalue { float, float, float, float } %128, 1
  %843 = extractvalue { float, float, float, float } %128, 2
  %844 = extractvalue { float, float, float, float } %128, 3
  %845 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %841)
  %846 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %842)
  %847 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %843)
  %848 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %844)
  %849 = mul i32 %14, 16
  %850 = sext i32 %15 to i64
  %851 = sext i32 %849 to i64
  %852 = select i1 %53, i32 0, i32 2
  %853 = xor i32 0, %852
  %854 = select i1 %57, i32 0, i32 4
  %855 = xor i32 %853, %854
  %856 = select i1 %61, i32 0, i32 8
  %857 = xor i32 %855, %856
  %858 = xor i32 %857, 0
  %859 = add i32 %858, 0
  %860 = select i1 %65, i32 0, i32 1
  %861 = xor i32 0, %860
  %862 = select i1 %69, i32 0, i32 2
  %863 = xor i32 %861, %862
  %864 = select i1 %24, i32 0, i32 4
  %865 = xor i32 %863, %864
  %866 = select i1 %28, i32 0, i32 8
  %867 = xor i32 %865, %866
  %868 = xor i32 %867, 0
  %869 = add i32 %868, 0
  %870 = sext i32 %859 to i64
  %871 = sext i32 %869 to i64
  %872 = add i64 %850, %870
  %873 = add i64 %851, %871
  %874 = mul i64 %873, 2048
  %875 = add i64 %872, %874
  %876 = getelementptr bfloat, ptr addrspace(1) %3, i64 %875
  %877 = select i1 %53, i32 0, i32 32
  %878 = xor i32 0, %877
  %879 = select i1 %57, i32 0, i32 64
  %880 = xor i32 %878, %879
  %881 = select i1 %61, i32 0, i32 1
  %882 = xor i32 %880, %881
  %883 = select i1 %65, i32 0, i32 2
  %884 = xor i32 %882, %883
  %885 = select i1 %69, i32 0, i32 4
  %886 = xor i32 %884, %885
  %887 = select i1 %24, i32 0, i32 128
  %888 = xor i32 %886, %887
  %889 = select i1 %65, i32 0, i32 16
  %890 = xor i32 %857, %889
  %891 = select i1 %69, i32 0, i32 32
  %892 = xor i32 %890, %891
  %893 = select i1 %24, i32 0, i32 64
  %894 = xor i32 %892, %893
  %895 = select i1 %28, i32 0, i32 128
  %896 = xor i32 %894, %895
  %897 = xor i32 %888, 0
  %898 = lshr i32 %897, 4
  %899 = shl i32 %898, 1
  %900 = add i32 %899, %897
  %901 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %900
  %902 = insertelement <1 x bfloat> undef, bfloat %845, i32 0
  %903 = extractelement <1 x bfloat> %902, i32 0
  %904 = bitcast bfloat %903 to i16
  %905 = insertelement <1 x i16> undef, i16 %904, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %901, <1 x i16> %905, i1 true)
  %906 = xor i32 %888, 16
  %907 = lshr i32 %906, 4
  %908 = shl i32 %907, 1
  %909 = add i32 %908, %906
  %910 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %909
  %911 = insertelement <1 x bfloat> undef, bfloat %846, i32 0
  %912 = extractelement <1 x bfloat> %911, i32 0
  %913 = bitcast bfloat %912 to i16
  %914 = insertelement <1 x i16> undef, i16 %913, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %910, <1 x i16> %914, i1 true)
  %915 = xor i32 %888, 8
  %916 = lshr i32 %915, 4
  %917 = shl i32 %916, 1
  %918 = add i32 %917, %915
  %919 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %918
  %920 = insertelement <1 x bfloat> undef, bfloat %847, i32 0
  %921 = extractelement <1 x bfloat> %920, i32 0
  %922 = bitcast bfloat %921 to i16
  %923 = insertelement <1 x i16> undef, i16 %922, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %919, <1 x i16> %923, i1 true)
  %924 = xor i32 %888, 24
  %925 = lshr i32 %924, 4
  %926 = shl i32 %925, 1
  %927 = add i32 %926, %924
  %928 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %927
  %929 = insertelement <1 x bfloat> undef, bfloat %848, i32 0
  %930 = extractelement <1 x bfloat> %929, i32 0
  %931 = bitcast bfloat %930 to i16
  %932 = insertelement <1 x i16> undef, i16 %931, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %928, <1 x i16> %932, i1 true)
  call void @llvm.nvvm.barrier0()
  %933 = xor i32 %896, 0
  %934 = lshr i32 %933, 4
  %935 = shl i32 %934, 1
  %936 = add i32 %935, %933
  %937 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %936
  %938 = load <2 x i16>, ptr addrspace(3) %937, align 4
  %939 = extractelement <2 x i16> %938, i32 0
  %940 = extractelement <2 x i16> %938, i32 1
  %941 = insertelement <2 x i16> undef, i16 %939, i32 0
  %942 = insertelement <2 x i16> %941, i16 %940, i32 1
  %943 = extractelement <2 x i16> %942, i32 0
  %944 = extractelement <2 x i16> %942, i32 1
  %945 = bitcast i16 %943 to bfloat
  %946 = bitcast i16 %944 to bfloat
  %947 = insertelement <2 x bfloat> undef, bfloat %945, i32 0
  %948 = insertelement <2 x bfloat> %947, bfloat %946, i32 1
  %949 = extractelement <2 x bfloat> %948, i32 0
  %950 = extractelement <2 x bfloat> %948, i32 1
  %951 = insertelement <2 x bfloat> undef, bfloat %949, i32 0
  %952 = insertelement <2 x bfloat> %951, bfloat %950, i32 1
  %953 = bitcast <2 x bfloat> %952 to i32
  call void asm sideeffect "st.global.b32 [ $1 + 0 ], { $0 };", "r,l"(i32 %953, ptr addrspace(1) %876)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_38_impl(ptr, ptr, ptr, ptr, ptr, ptr) #4

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #5

declare float @__nv_rsqrtf(float)

define ptx_kernel void @fusion_38(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(32768) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4) #6 {
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
  %12 = mul i64 %9, 2048
  %13 = add i64 %11, %12
  %14 = add i64 %13, 1024
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
  %80 = add i64 %12, 1024
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

define ptx_kernel void @loop_convert_fusion_1(ptr noalias align 128 dereferenceable(196608) %0, ptr noalias align 128 dereferenceable(98304) %1) #0 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !3
  %5 = udiv i32 %4, 24
  %6 = urem i32 %4, 24
  %7 = mul i32 %6, 128
  %8 = add i32 %7, %3
  %9 = call bfloat @fused_convert_1_param_0_122(ptr %0, i32 %5, i32 %8)
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
  %20 = call bfloat @fused_convert_1_param_0_122(ptr %0, i32 %5, i32 %19)
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

define internal bfloat @fused_convert_1_param_0_122(ptr noalias %0, i32 %1, i32 %2) {
  %4 = mul i32 %1, 6144
  %5 = add i32 %4, %2
  %6 = getelementptr inbounds bfloat, ptr %0, i32 %5
  %7 = load bfloat, ptr %6, align 2, !invariant.load !2
  ret bfloat %7
}

declare float @__nv_fast_expf(float)

declare ptx_kernel void @fusion_36_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_36(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(65536) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5) #6 {
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
  %13 = mul i64 %10, 2048
  %14 = add i64 %12, %13
  %15 = getelementptr bfloat, ptr addrspace(1) %4, i64 %14
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
  %60 = mul i64 %9, 256
  %61 = getelementptr bfloat, ptr addrspace(1) %5, i64 %60
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
  %76 = add i64 %14, 1024
  %77 = getelementptr bfloat, ptr addrspace(1) %4, i64 %76
  %78 = getelementptr bfloat, ptr addrspace(1) %77, i64 %45
  %79 = call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %78)
  %80 = extractvalue { i32, i32 } %79, 0
  %81 = bitcast i32 %80 to <2 x bfloat>
  %82 = extractvalue { i32, i32 } %79, 1
  %83 = bitcast i32 %82 to <2 x bfloat>
  %84 = extractelement <2 x bfloat> %81, i32 0
  %85 = extractelement <2 x bfloat> %81, i32 1
  %86 = extractelement <2 x bfloat> %83, i32 0
  %87 = extractelement <2 x bfloat> %83, i32 1
  %88 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84)
  %89 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85)
  %90 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86)
  %91 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87)
  %92 = getelementptr bfloat, ptr addrspace(1) %3, i64 %60
  %93 = getelementptr bfloat, ptr addrspace(1) %92, i64 %45
  %94 = call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %93)
  %95 = extractvalue { i32, i32 } %94, 0
  %96 = bitcast i32 %95 to <2 x bfloat>
  %97 = extractvalue { i32, i32 } %94, 1
  %98 = bitcast i32 %97 to <2 x bfloat>
  %99 = extractelement <2 x bfloat> %96, i32 0
  %100 = extractelement <2 x bfloat> %96, i32 1
  %101 = extractelement <2 x bfloat> %98, i32 0
  %102 = extractelement <2 x bfloat> %98, i32 1
  %103 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99)
  %104 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100)
  %105 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101)
  %106 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102)
  %107 = fadd float %88, %103
  %108 = fadd float %89, %104
  %109 = fadd float %90, %105
  %110 = fadd float %91, %106
  %111 = fadd float %72, %107
  %112 = fadd float %73, %108
  %113 = fadd float %74, %109
  %114 = fadd float %75, %110
  %115 = fadd float %56, %111
  %116 = fadd float %57, %112
  %117 = fadd float %58, %113
  %118 = fadd float %59, %114
  %119 = getelementptr bfloat, ptr addrspace(1) %4, i64 %13
  %120 = select i1 %20, i32 0, i32 8
  %121 = xor i32 0, %120
  %122 = select i1 %24, i32 0, i32 16
  %123 = xor i32 %121, %122
  %124 = select i1 %28, i32 0, i32 32
  %125 = xor i32 %123, %124
  %126 = select i1 %32, i32 0, i32 64
  %127 = xor i32 %125, %126
  %128 = select i1 %36, i32 0, i32 128
  %129 = xor i32 %127, %128
  %130 = select i1 %40, i32 0, i32 256
  %131 = xor i32 %129, %130
  %132 = xor i32 %131, 0
  %133 = xor i32 %131, 512
  %134 = add i32 %132, 0
  %135 = add i32 %133, 0
  %136 = sext i32 %134 to i64
  %137 = sext i32 %135 to i64
  %138 = getelementptr bfloat, ptr addrspace(1) %119, i64 %136
  %139 = getelementptr bfloat, ptr addrspace(1) %119, i64 %137
  %140 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %138)
  %141 = extractvalue { i32, i32, i32, i32 } %140, 0
  %142 = bitcast i32 %141 to <2 x bfloat>
  %143 = extractvalue { i32, i32, i32, i32 } %140, 1
  %144 = bitcast i32 %143 to <2 x bfloat>
  %145 = extractvalue { i32, i32, i32, i32 } %140, 2
  %146 = bitcast i32 %145 to <2 x bfloat>
  %147 = extractvalue { i32, i32, i32, i32 } %140, 3
  %148 = bitcast i32 %147 to <2 x bfloat>
  %149 = extractelement <2 x bfloat> %142, i32 0
  %150 = extractelement <2 x bfloat> %142, i32 1
  %151 = extractelement <2 x bfloat> %144, i32 0
  %152 = extractelement <2 x bfloat> %144, i32 1
  %153 = extractelement <2 x bfloat> %146, i32 0
  %154 = extractelement <2 x bfloat> %146, i32 1
  %155 = extractelement <2 x bfloat> %148, i32 0
  %156 = extractelement <2 x bfloat> %148, i32 1
  %157 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %139)
  %158 = extractvalue { i32, i32, i32, i32 } %157, 0
  %159 = bitcast i32 %158 to <2 x bfloat>
  %160 = extractvalue { i32, i32, i32, i32 } %157, 1
  %161 = bitcast i32 %160 to <2 x bfloat>
  %162 = extractvalue { i32, i32, i32, i32 } %157, 2
  %163 = bitcast i32 %162 to <2 x bfloat>
  %164 = extractvalue { i32, i32, i32, i32 } %157, 3
  %165 = bitcast i32 %164 to <2 x bfloat>
  %166 = extractelement <2 x bfloat> %159, i32 0
  %167 = extractelement <2 x bfloat> %159, i32 1
  %168 = extractelement <2 x bfloat> %161, i32 0
  %169 = extractelement <2 x bfloat> %161, i32 1
  %170 = extractelement <2 x bfloat> %163, i32 0
  %171 = extractelement <2 x bfloat> %163, i32 1
  %172 = extractelement <2 x bfloat> %165, i32 0
  %173 = extractelement <2 x bfloat> %165, i32 1
  %174 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %149)
  %175 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %150)
  %176 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %151)
  %177 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152)
  %178 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153)
  %179 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154)
  %180 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155)
  %181 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156)
  %182 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %166)
  %183 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %167)
  %184 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %168)
  %185 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %169)
  %186 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %170)
  %187 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %171)
  %188 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %172)
  %189 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %173)
  %190 = mul i64 %10, 1024
  %191 = getelementptr bfloat, ptr addrspace(1) %5, i64 %190
  %192 = getelementptr bfloat, ptr addrspace(1) %191, i64 %136
  %193 = getelementptr bfloat, ptr addrspace(1) %191, i64 %137
  %194 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %192)
  %195 = extractvalue { i32, i32, i32, i32 } %194, 0
  %196 = bitcast i32 %195 to <2 x bfloat>
  %197 = extractvalue { i32, i32, i32, i32 } %194, 1
  %198 = bitcast i32 %197 to <2 x bfloat>
  %199 = extractvalue { i32, i32, i32, i32 } %194, 2
  %200 = bitcast i32 %199 to <2 x bfloat>
  %201 = extractvalue { i32, i32, i32, i32 } %194, 3
  %202 = bitcast i32 %201 to <2 x bfloat>
  %203 = extractelement <2 x bfloat> %196, i32 0
  %204 = extractelement <2 x bfloat> %196, i32 1
  %205 = extractelement <2 x bfloat> %198, i32 0
  %206 = extractelement <2 x bfloat> %198, i32 1
  %207 = extractelement <2 x bfloat> %200, i32 0
  %208 = extractelement <2 x bfloat> %200, i32 1
  %209 = extractelement <2 x bfloat> %202, i32 0
  %210 = extractelement <2 x bfloat> %202, i32 1
  %211 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %193)
  %212 = extractvalue { i32, i32, i32, i32 } %211, 0
  %213 = bitcast i32 %212 to <2 x bfloat>
  %214 = extractvalue { i32, i32, i32, i32 } %211, 1
  %215 = bitcast i32 %214 to <2 x bfloat>
  %216 = extractvalue { i32, i32, i32, i32 } %211, 2
  %217 = bitcast i32 %216 to <2 x bfloat>
  %218 = extractvalue { i32, i32, i32, i32 } %211, 3
  %219 = bitcast i32 %218 to <2 x bfloat>
  %220 = extractelement <2 x bfloat> %213, i32 0
  %221 = extractelement <2 x bfloat> %213, i32 1
  %222 = extractelement <2 x bfloat> %215, i32 0
  %223 = extractelement <2 x bfloat> %215, i32 1
  %224 = extractelement <2 x bfloat> %217, i32 0
  %225 = extractelement <2 x bfloat> %217, i32 1
  %226 = extractelement <2 x bfloat> %219, i32 0
  %227 = extractelement <2 x bfloat> %219, i32 1
  %228 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %203)
  %229 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %204)
  %230 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205)
  %231 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206)
  %232 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207)
  %233 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208)
  %234 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209)
  %235 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210)
  %236 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %220)
  %237 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %221)
  %238 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %222)
  %239 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %223)
  %240 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %224)
  %241 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %225)
  %242 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %226)
  %243 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %227)
  %244 = add i64 %13, 1024
  %245 = getelementptr bfloat, ptr addrspace(1) %4, i64 %244
  %246 = getelementptr bfloat, ptr addrspace(1) %245, i64 %136
  %247 = getelementptr bfloat, ptr addrspace(1) %245, i64 %137
  %248 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %246)
  %249 = extractvalue { i32, i32, i32, i32 } %248, 0
  %250 = bitcast i32 %249 to <2 x bfloat>
  %251 = extractvalue { i32, i32, i32, i32 } %248, 1
  %252 = bitcast i32 %251 to <2 x bfloat>
  %253 = extractvalue { i32, i32, i32, i32 } %248, 2
  %254 = bitcast i32 %253 to <2 x bfloat>
  %255 = extractvalue { i32, i32, i32, i32 } %248, 3
  %256 = bitcast i32 %255 to <2 x bfloat>
  %257 = extractelement <2 x bfloat> %250, i32 0
  %258 = extractelement <2 x bfloat> %250, i32 1
  %259 = extractelement <2 x bfloat> %252, i32 0
  %260 = extractelement <2 x bfloat> %252, i32 1
  %261 = extractelement <2 x bfloat> %254, i32 0
  %262 = extractelement <2 x bfloat> %254, i32 1
  %263 = extractelement <2 x bfloat> %256, i32 0
  %264 = extractelement <2 x bfloat> %256, i32 1
  %265 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %247)
  %266 = extractvalue { i32, i32, i32, i32 } %265, 0
  %267 = bitcast i32 %266 to <2 x bfloat>
  %268 = extractvalue { i32, i32, i32, i32 } %265, 1
  %269 = bitcast i32 %268 to <2 x bfloat>
  %270 = extractvalue { i32, i32, i32, i32 } %265, 2
  %271 = bitcast i32 %270 to <2 x bfloat>
  %272 = extractvalue { i32, i32, i32, i32 } %265, 3
  %273 = bitcast i32 %272 to <2 x bfloat>
  %274 = extractelement <2 x bfloat> %267, i32 0
  %275 = extractelement <2 x bfloat> %267, i32 1
  %276 = extractelement <2 x bfloat> %269, i32 0
  %277 = extractelement <2 x bfloat> %269, i32 1
  %278 = extractelement <2 x bfloat> %271, i32 0
  %279 = extractelement <2 x bfloat> %271, i32 1
  %280 = extractelement <2 x bfloat> %273, i32 0
  %281 = extractelement <2 x bfloat> %273, i32 1
  %282 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %257)
  %283 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %258)
  %284 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259)
  %285 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260)
  %286 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261)
  %287 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262)
  %288 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %263)
  %289 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %264)
  %290 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %274)
  %291 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %275)
  %292 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %276)
  %293 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %277)
  %294 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %278)
  %295 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %279)
  %296 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %280)
  %297 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %281)
  %298 = getelementptr bfloat, ptr addrspace(1) %3, i64 %190
  %299 = getelementptr bfloat, ptr addrspace(1) %298, i64 %136
  %300 = getelementptr bfloat, ptr addrspace(1) %298, i64 %137
  %301 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %299)
  %302 = extractvalue { i32, i32, i32, i32 } %301, 0
  %303 = bitcast i32 %302 to <2 x bfloat>
  %304 = extractvalue { i32, i32, i32, i32 } %301, 1
  %305 = bitcast i32 %304 to <2 x bfloat>
  %306 = extractvalue { i32, i32, i32, i32 } %301, 2
  %307 = bitcast i32 %306 to <2 x bfloat>
  %308 = extractvalue { i32, i32, i32, i32 } %301, 3
  %309 = bitcast i32 %308 to <2 x bfloat>
  %310 = extractelement <2 x bfloat> %303, i32 0
  %311 = extractelement <2 x bfloat> %303, i32 1
  %312 = extractelement <2 x bfloat> %305, i32 0
  %313 = extractelement <2 x bfloat> %305, i32 1
  %314 = extractelement <2 x bfloat> %307, i32 0
  %315 = extractelement <2 x bfloat> %307, i32 1
  %316 = extractelement <2 x bfloat> %309, i32 0
  %317 = extractelement <2 x bfloat> %309, i32 1
  %318 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %300)
  %319 = extractvalue { i32, i32, i32, i32 } %318, 0
  %320 = bitcast i32 %319 to <2 x bfloat>
  %321 = extractvalue { i32, i32, i32, i32 } %318, 1
  %322 = bitcast i32 %321 to <2 x bfloat>
  %323 = extractvalue { i32, i32, i32, i32 } %318, 2
  %324 = bitcast i32 %323 to <2 x bfloat>
  %325 = extractvalue { i32, i32, i32, i32 } %318, 3
  %326 = bitcast i32 %325 to <2 x bfloat>
  %327 = extractelement <2 x bfloat> %320, i32 0
  %328 = extractelement <2 x bfloat> %320, i32 1
  %329 = extractelement <2 x bfloat> %322, i32 0
  %330 = extractelement <2 x bfloat> %322, i32 1
  %331 = extractelement <2 x bfloat> %324, i32 0
  %332 = extractelement <2 x bfloat> %324, i32 1
  %333 = extractelement <2 x bfloat> %326, i32 0
  %334 = extractelement <2 x bfloat> %326, i32 1
  %335 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %310)
  %336 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %311)
  %337 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %312)
  %338 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313)
  %339 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314)
  %340 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315)
  %341 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316)
  %342 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317)
  %343 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %327)
  %344 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %328)
  %345 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %329)
  %346 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %330)
  %347 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %331)
  %348 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %332)
  %349 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %333)
  %350 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %334)
  %351 = fadd float %282, %335
  %352 = fadd float %283, %336
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
  %367 = fadd float %228, %351
  %368 = fadd float %229, %352
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
  %383 = fadd float %174, %367
  %384 = fadd float %175, %368
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
  %399 = fmul float %383, %383
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
  %415 = fadd float %399, %400
  %416 = fadd float %415, %401
  %417 = fadd float %416, %402
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
  %430 = bitcast float %429 to i32
  %431 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %430, i32 16, i32 31)
  %432 = bitcast i32 %431 to float
  %433 = fadd float %429, %432
  %434 = bitcast float %433 to i32
  %435 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %434, i32 8, i32 31)
  %436 = bitcast i32 %435 to float
  %437 = fadd float %433, %436
  %438 = bitcast float %437 to i32
  %439 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %438, i32 4, i32 31)
  %440 = bitcast i32 %439 to float
  %441 = fadd float %437, %440
  %442 = bitcast float %441 to i32
  %443 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %442, i32 2, i32 31)
  %444 = bitcast i32 %443 to float
  %445 = fadd float %441, %444
  %446 = bitcast float %445 to i32
  %447 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %446, i32 1, i32 31)
  %448 = bitcast i32 %447 to float
  %449 = fadd float %445, %448
  %450 = urem i32 %17, 32
  %451 = urem i32 %18, 2
  %452 = icmp eq i32 %450, 0
  %453 = and i1 true, %452
  %454 = add i32 0, %451
  %455 = getelementptr float, ptr addrspace(3) @global_smem, i32 %454
  %456 = insertelement <1 x float> undef, float %449, i32 0
  %457 = extractelement <1 x float> %456, i32 0
  %458 = bitcast float %457 to i32
  %459 = insertelement <1 x i32> undef, i32 %458, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %455, <1 x i32> %459, i1 %453)
  call void @llvm.nvvm.barrier0()
  %460 = icmp slt i32 %16, 2
  %461 = getelementptr float, ptr addrspace(3) @global_smem, i32 %16
  %462 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %461, i1 %460)
  %463 = insertelement <1 x i32> undef, i32 %462, i32 0
  %464 = extractelement <1 x i32> %463, i32 0
  %465 = bitcast i32 %464 to float
  %466 = insertelement <1 x float> undef, float %465, i32 0
  %467 = extractelement <1 x float> %466, i32 0
  %468 = bitcast float %467 to i32
  %469 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %468, i32 1, i32 31)
  %470 = bitcast i32 %469 to float
  %471 = fadd float %467, %470
  %472 = urem i32 %17, 2
  %473 = icmp eq i32 %472, 0
  %474 = and i1 %460, %473
  %475 = insertelement <1 x float> undef, float %471, i32 0
  %476 = extractelement <1 x float> %475, i32 0
  %477 = bitcast float %476 to i32
  %478 = insertelement <1 x i32> undef, i32 %477, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %461, <1 x i32> %478, i1 %474)
  call void @llvm.nvvm.barrier0()
  %479 = load float, ptr addrspace(3) @global_smem, align 4
  %480 = fmul float %479, 0x3F50000000000000
  %481 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %482 = bitcast i32 %481 to <1 x float>
  %483 = extractelement <1 x float> %482, i32 0
  %484 = fadd float %480, %483
  %485 = call float @__nv_rsqrtf(float %484)
  %486 = fmul float %115, %485
  %487 = fmul float %116, %485
  %488 = fmul float %117, %485
  %489 = fmul float %118, %485
  %490 = getelementptr bfloat, ptr addrspace(1) %2, i64 %12
  %491 = getelementptr bfloat, ptr addrspace(1) %490, i64 %45
  %492 = call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %491)
  %493 = extractvalue { i32, i32 } %492, 0
  %494 = bitcast i32 %493 to <2 x bfloat>
  %495 = extractvalue { i32, i32 } %492, 1
  %496 = bitcast i32 %495 to <2 x bfloat>
  %497 = extractelement <2 x bfloat> %494, i32 0
  %498 = extractelement <2 x bfloat> %494, i32 1
  %499 = extractelement <2 x bfloat> %496, i32 0
  %500 = extractelement <2 x bfloat> %496, i32 1
  %501 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %497)
  %502 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %498)
  %503 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %499)
  %504 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %500)
  %505 = fmul float %486, %501
  %506 = fmul float %487, %502
  %507 = fmul float %488, %503
  %508 = fmul float %489, %504
  %509 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %505)
  %510 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %506)
  %511 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %507)
  %512 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %508)
  %513 = getelementptr bfloat, ptr addrspace(1) %6, i64 %60
  %514 = getelementptr bfloat, ptr addrspace(1) %513, i64 %45
  %515 = insertelement <2 x bfloat> undef, bfloat %509, i32 0
  %516 = insertelement <2 x bfloat> %515, bfloat %510, i32 1
  %517 = bitcast <2 x bfloat> %516 to i32
  %518 = insertelement <2 x bfloat> undef, bfloat %511, i32 0
  %519 = insertelement <2 x bfloat> %518, bfloat %512, i32 1
  %520 = bitcast <2 x bfloat> %519 to i32
  call void asm sideeffect "st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l"(i32 %517, i32 %520, ptr addrspace(1) %514)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_34_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_34(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(32768) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(65536) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6) #6 {
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
  %14 = mul i64 %10, 256
  %15 = getelementptr bfloat, ptr addrspace(1) %2, i64 %14
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
  %60 = mul i64 %11, 2048
  %61 = add i64 %13, %60
  %62 = getelementptr bfloat, ptr addrspace(1) %5, i64 %61
  %63 = getelementptr bfloat, ptr addrspace(1) %62, i64 %45
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
  %77 = getelementptr bfloat, ptr addrspace(1) %6, i64 %14
  %78 = getelementptr bfloat, ptr addrspace(1) %77, i64 %45
  %79 = call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %78)
  %80 = extractvalue { i32, i32 } %79, 0
  %81 = bitcast i32 %80 to <2 x bfloat>
  %82 = extractvalue { i32, i32 } %79, 1
  %83 = bitcast i32 %82 to <2 x bfloat>
  %84 = extractelement <2 x bfloat> %81, i32 0
  %85 = extractelement <2 x bfloat> %81, i32 1
  %86 = extractelement <2 x bfloat> %83, i32 0
  %87 = extractelement <2 x bfloat> %83, i32 1
  %88 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84)
  %89 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85)
  %90 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86)
  %91 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87)
  %92 = add i64 %61, 1024
  %93 = getelementptr bfloat, ptr addrspace(1) %5, i64 %92
  %94 = getelementptr bfloat, ptr addrspace(1) %93, i64 %45
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
  %108 = getelementptr bfloat, ptr addrspace(1) %4, i64 %14
  %109 = getelementptr bfloat, ptr addrspace(1) %108, i64 %45
  %110 = call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %109)
  %111 = extractvalue { i32, i32 } %110, 0
  %112 = bitcast i32 %111 to <2 x bfloat>
  %113 = extractvalue { i32, i32 } %110, 1
  %114 = bitcast i32 %113 to <2 x bfloat>
  %115 = extractelement <2 x bfloat> %112, i32 0
  %116 = extractelement <2 x bfloat> %112, i32 1
  %117 = extractelement <2 x bfloat> %114, i32 0
  %118 = extractelement <2 x bfloat> %114, i32 1
  %119 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %115)
  %120 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %116)
  %121 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %117)
  %122 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %118)
  %123 = fadd float %104, %119
  %124 = fadd float %105, %120
  %125 = fadd float %106, %121
  %126 = fadd float %107, %122
  %127 = fadd float %88, %123
  %128 = fadd float %89, %124
  %129 = fadd float %90, %125
  %130 = fadd float %91, %126
  %131 = fadd float %73, %127
  %132 = fadd float %74, %128
  %133 = fadd float %75, %129
  %134 = fadd float %76, %130
  %135 = fadd float %56, %131
  %136 = fadd float %57, %132
  %137 = fadd float %58, %133
  %138 = fadd float %59, %134
  %139 = mul i64 %11, 1024
  %140 = getelementptr bfloat, ptr addrspace(1) %2, i64 %139
  %141 = select i1 %20, i32 0, i32 8
  %142 = xor i32 0, %141
  %143 = select i1 %24, i32 0, i32 16
  %144 = xor i32 %142, %143
  %145 = select i1 %28, i32 0, i32 32
  %146 = xor i32 %144, %145
  %147 = select i1 %32, i32 0, i32 64
  %148 = xor i32 %146, %147
  %149 = select i1 %36, i32 0, i32 128
  %150 = xor i32 %148, %149
  %151 = select i1 %40, i32 0, i32 256
  %152 = xor i32 %150, %151
  %153 = xor i32 %152, 0
  %154 = xor i32 %152, 512
  %155 = add i32 %153, 0
  %156 = add i32 %154, 0
  %157 = sext i32 %155 to i64
  %158 = sext i32 %156 to i64
  %159 = getelementptr bfloat, ptr addrspace(1) %140, i64 %157
  %160 = getelementptr bfloat, ptr addrspace(1) %140, i64 %158
  %161 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %159)
  %162 = extractvalue { i32, i32, i32, i32 } %161, 0
  %163 = bitcast i32 %162 to <2 x bfloat>
  %164 = extractvalue { i32, i32, i32, i32 } %161, 1
  %165 = bitcast i32 %164 to <2 x bfloat>
  %166 = extractvalue { i32, i32, i32, i32 } %161, 2
  %167 = bitcast i32 %166 to <2 x bfloat>
  %168 = extractvalue { i32, i32, i32, i32 } %161, 3
  %169 = bitcast i32 %168 to <2 x bfloat>
  %170 = extractelement <2 x bfloat> %163, i32 0
  %171 = extractelement <2 x bfloat> %163, i32 1
  %172 = extractelement <2 x bfloat> %165, i32 0
  %173 = extractelement <2 x bfloat> %165, i32 1
  %174 = extractelement <2 x bfloat> %167, i32 0
  %175 = extractelement <2 x bfloat> %167, i32 1
  %176 = extractelement <2 x bfloat> %169, i32 0
  %177 = extractelement <2 x bfloat> %169, i32 1
  %178 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %160)
  %179 = extractvalue { i32, i32, i32, i32 } %178, 0
  %180 = bitcast i32 %179 to <2 x bfloat>
  %181 = extractvalue { i32, i32, i32, i32 } %178, 1
  %182 = bitcast i32 %181 to <2 x bfloat>
  %183 = extractvalue { i32, i32, i32, i32 } %178, 2
  %184 = bitcast i32 %183 to <2 x bfloat>
  %185 = extractvalue { i32, i32, i32, i32 } %178, 3
  %186 = bitcast i32 %185 to <2 x bfloat>
  %187 = extractelement <2 x bfloat> %180, i32 0
  %188 = extractelement <2 x bfloat> %180, i32 1
  %189 = extractelement <2 x bfloat> %182, i32 0
  %190 = extractelement <2 x bfloat> %182, i32 1
  %191 = extractelement <2 x bfloat> %184, i32 0
  %192 = extractelement <2 x bfloat> %184, i32 1
  %193 = extractelement <2 x bfloat> %186, i32 0
  %194 = extractelement <2 x bfloat> %186, i32 1
  %195 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %170)
  %196 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %171)
  %197 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %172)
  %198 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %173)
  %199 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %174)
  %200 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %175)
  %201 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %176)
  %202 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %177)
  %203 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %187)
  %204 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188)
  %205 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189)
  %206 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190)
  %207 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191)
  %208 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192)
  %209 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193)
  %210 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194)
  %211 = getelementptr bfloat, ptr addrspace(1) %5, i64 %60
  %212 = getelementptr bfloat, ptr addrspace(1) %211, i64 %157
  %213 = getelementptr bfloat, ptr addrspace(1) %211, i64 %158
  %214 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %212)
  %215 = extractvalue { i32, i32, i32, i32 } %214, 0
  %216 = bitcast i32 %215 to <2 x bfloat>
  %217 = extractvalue { i32, i32, i32, i32 } %214, 1
  %218 = bitcast i32 %217 to <2 x bfloat>
  %219 = extractvalue { i32, i32, i32, i32 } %214, 2
  %220 = bitcast i32 %219 to <2 x bfloat>
  %221 = extractvalue { i32, i32, i32, i32 } %214, 3
  %222 = bitcast i32 %221 to <2 x bfloat>
  %223 = extractelement <2 x bfloat> %216, i32 0
  %224 = extractelement <2 x bfloat> %216, i32 1
  %225 = extractelement <2 x bfloat> %218, i32 0
  %226 = extractelement <2 x bfloat> %218, i32 1
  %227 = extractelement <2 x bfloat> %220, i32 0
  %228 = extractelement <2 x bfloat> %220, i32 1
  %229 = extractelement <2 x bfloat> %222, i32 0
  %230 = extractelement <2 x bfloat> %222, i32 1
  %231 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %213)
  %232 = extractvalue { i32, i32, i32, i32 } %231, 0
  %233 = bitcast i32 %232 to <2 x bfloat>
  %234 = extractvalue { i32, i32, i32, i32 } %231, 1
  %235 = bitcast i32 %234 to <2 x bfloat>
  %236 = extractvalue { i32, i32, i32, i32 } %231, 2
  %237 = bitcast i32 %236 to <2 x bfloat>
  %238 = extractvalue { i32, i32, i32, i32 } %231, 3
  %239 = bitcast i32 %238 to <2 x bfloat>
  %240 = extractelement <2 x bfloat> %233, i32 0
  %241 = extractelement <2 x bfloat> %233, i32 1
  %242 = extractelement <2 x bfloat> %235, i32 0
  %243 = extractelement <2 x bfloat> %235, i32 1
  %244 = extractelement <2 x bfloat> %237, i32 0
  %245 = extractelement <2 x bfloat> %237, i32 1
  %246 = extractelement <2 x bfloat> %239, i32 0
  %247 = extractelement <2 x bfloat> %239, i32 1
  %248 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %223)
  %249 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %224)
  %250 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %225)
  %251 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %226)
  %252 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %227)
  %253 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %228)
  %254 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %229)
  %255 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %230)
  %256 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %240)
  %257 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %241)
  %258 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242)
  %259 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243)
  %260 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244)
  %261 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245)
  %262 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246)
  %263 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %247)
  %264 = getelementptr bfloat, ptr addrspace(1) %6, i64 %139
  %265 = getelementptr bfloat, ptr addrspace(1) %264, i64 %157
  %266 = getelementptr bfloat, ptr addrspace(1) %264, i64 %158
  %267 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %265)
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
  %284 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %266)
  %285 = extractvalue { i32, i32, i32, i32 } %284, 0
  %286 = bitcast i32 %285 to <2 x bfloat>
  %287 = extractvalue { i32, i32, i32, i32 } %284, 1
  %288 = bitcast i32 %287 to <2 x bfloat>
  %289 = extractvalue { i32, i32, i32, i32 } %284, 2
  %290 = bitcast i32 %289 to <2 x bfloat>
  %291 = extractvalue { i32, i32, i32, i32 } %284, 3
  %292 = bitcast i32 %291 to <2 x bfloat>
  %293 = extractelement <2 x bfloat> %286, i32 0
  %294 = extractelement <2 x bfloat> %286, i32 1
  %295 = extractelement <2 x bfloat> %288, i32 0
  %296 = extractelement <2 x bfloat> %288, i32 1
  %297 = extractelement <2 x bfloat> %290, i32 0
  %298 = extractelement <2 x bfloat> %290, i32 1
  %299 = extractelement <2 x bfloat> %292, i32 0
  %300 = extractelement <2 x bfloat> %292, i32 1
  %301 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %276)
  %302 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %277)
  %303 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %278)
  %304 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %279)
  %305 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %280)
  %306 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %281)
  %307 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %282)
  %308 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %283)
  %309 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %293)
  %310 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %294)
  %311 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295)
  %312 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296)
  %313 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297)
  %314 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298)
  %315 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299)
  %316 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300)
  %317 = add i64 %60, 1024
  %318 = getelementptr bfloat, ptr addrspace(1) %5, i64 %317
  %319 = getelementptr bfloat, ptr addrspace(1) %318, i64 %157
  %320 = getelementptr bfloat, ptr addrspace(1) %318, i64 %158
  %321 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %319)
  %322 = extractvalue { i32, i32, i32, i32 } %321, 0
  %323 = bitcast i32 %322 to <2 x bfloat>
  %324 = extractvalue { i32, i32, i32, i32 } %321, 1
  %325 = bitcast i32 %324 to <2 x bfloat>
  %326 = extractvalue { i32, i32, i32, i32 } %321, 2
  %327 = bitcast i32 %326 to <2 x bfloat>
  %328 = extractvalue { i32, i32, i32, i32 } %321, 3
  %329 = bitcast i32 %328 to <2 x bfloat>
  %330 = extractelement <2 x bfloat> %323, i32 0
  %331 = extractelement <2 x bfloat> %323, i32 1
  %332 = extractelement <2 x bfloat> %325, i32 0
  %333 = extractelement <2 x bfloat> %325, i32 1
  %334 = extractelement <2 x bfloat> %327, i32 0
  %335 = extractelement <2 x bfloat> %327, i32 1
  %336 = extractelement <2 x bfloat> %329, i32 0
  %337 = extractelement <2 x bfloat> %329, i32 1
  %338 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %320)
  %339 = extractvalue { i32, i32, i32, i32 } %338, 0
  %340 = bitcast i32 %339 to <2 x bfloat>
  %341 = extractvalue { i32, i32, i32, i32 } %338, 1
  %342 = bitcast i32 %341 to <2 x bfloat>
  %343 = extractvalue { i32, i32, i32, i32 } %338, 2
  %344 = bitcast i32 %343 to <2 x bfloat>
  %345 = extractvalue { i32, i32, i32, i32 } %338, 3
  %346 = bitcast i32 %345 to <2 x bfloat>
  %347 = extractelement <2 x bfloat> %340, i32 0
  %348 = extractelement <2 x bfloat> %340, i32 1
  %349 = extractelement <2 x bfloat> %342, i32 0
  %350 = extractelement <2 x bfloat> %342, i32 1
  %351 = extractelement <2 x bfloat> %344, i32 0
  %352 = extractelement <2 x bfloat> %344, i32 1
  %353 = extractelement <2 x bfloat> %346, i32 0
  %354 = extractelement <2 x bfloat> %346, i32 1
  %355 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %330)
  %356 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %331)
  %357 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %332)
  %358 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %333)
  %359 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %334)
  %360 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %335)
  %361 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %336)
  %362 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %337)
  %363 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %347)
  %364 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %348)
  %365 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %349)
  %366 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %350)
  %367 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %351)
  %368 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %352)
  %369 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %353)
  %370 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %354)
  %371 = getelementptr bfloat, ptr addrspace(1) %4, i64 %139
  %372 = getelementptr bfloat, ptr addrspace(1) %371, i64 %157
  %373 = getelementptr bfloat, ptr addrspace(1) %371, i64 %158
  %374 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %372)
  %375 = extractvalue { i32, i32, i32, i32 } %374, 0
  %376 = bitcast i32 %375 to <2 x bfloat>
  %377 = extractvalue { i32, i32, i32, i32 } %374, 1
  %378 = bitcast i32 %377 to <2 x bfloat>
  %379 = extractvalue { i32, i32, i32, i32 } %374, 2
  %380 = bitcast i32 %379 to <2 x bfloat>
  %381 = extractvalue { i32, i32, i32, i32 } %374, 3
  %382 = bitcast i32 %381 to <2 x bfloat>
  %383 = extractelement <2 x bfloat> %376, i32 0
  %384 = extractelement <2 x bfloat> %376, i32 1
  %385 = extractelement <2 x bfloat> %378, i32 0
  %386 = extractelement <2 x bfloat> %378, i32 1
  %387 = extractelement <2 x bfloat> %380, i32 0
  %388 = extractelement <2 x bfloat> %380, i32 1
  %389 = extractelement <2 x bfloat> %382, i32 0
  %390 = extractelement <2 x bfloat> %382, i32 1
  %391 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %373)
  %392 = extractvalue { i32, i32, i32, i32 } %391, 0
  %393 = bitcast i32 %392 to <2 x bfloat>
  %394 = extractvalue { i32, i32, i32, i32 } %391, 1
  %395 = bitcast i32 %394 to <2 x bfloat>
  %396 = extractvalue { i32, i32, i32, i32 } %391, 2
  %397 = bitcast i32 %396 to <2 x bfloat>
  %398 = extractvalue { i32, i32, i32, i32 } %391, 3
  %399 = bitcast i32 %398 to <2 x bfloat>
  %400 = extractelement <2 x bfloat> %393, i32 0
  %401 = extractelement <2 x bfloat> %393, i32 1
  %402 = extractelement <2 x bfloat> %395, i32 0
  %403 = extractelement <2 x bfloat> %395, i32 1
  %404 = extractelement <2 x bfloat> %397, i32 0
  %405 = extractelement <2 x bfloat> %397, i32 1
  %406 = extractelement <2 x bfloat> %399, i32 0
  %407 = extractelement <2 x bfloat> %399, i32 1
  %408 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %383)
  %409 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %384)
  %410 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %385)
  %411 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %386)
  %412 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %387)
  %413 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %388)
  %414 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %389)
  %415 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %390)
  %416 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %400)
  %417 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %401)
  %418 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %402)
  %419 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %403)
  %420 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %404)
  %421 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %405)
  %422 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %406)
  %423 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %407)
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
  %436 = fadd float %367, %420
  %437 = fadd float %368, %421
  %438 = fadd float %369, %422
  %439 = fadd float %370, %423
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
  %452 = fadd float %313, %436
  %453 = fadd float %314, %437
  %454 = fadd float %315, %438
  %455 = fadd float %316, %439
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
  %468 = fadd float %260, %452
  %469 = fadd float %261, %453
  %470 = fadd float %262, %454
  %471 = fadd float %263, %455
  %472 = fadd float %195, %456
  %473 = fadd float %196, %457
  %474 = fadd float %197, %458
  %475 = fadd float %198, %459
  %476 = fadd float %199, %460
  %477 = fadd float %200, %461
  %478 = fadd float %201, %462
  %479 = fadd float %202, %463
  %480 = fadd float %203, %464
  %481 = fadd float %204, %465
  %482 = fadd float %205, %466
  %483 = fadd float %206, %467
  %484 = fadd float %207, %468
  %485 = fadd float %208, %469
  %486 = fadd float %209, %470
  %487 = fadd float %210, %471
  %488 = fmul float %472, %472
  %489 = fmul float %473, %473
  %490 = fmul float %474, %474
  %491 = fmul float %475, %475
  %492 = fmul float %476, %476
  %493 = fmul float %477, %477
  %494 = fmul float %478, %478
  %495 = fmul float %479, %479
  %496 = fmul float %480, %480
  %497 = fmul float %481, %481
  %498 = fmul float %482, %482
  %499 = fmul float %483, %483
  %500 = fmul float %484, %484
  %501 = fmul float %485, %485
  %502 = fmul float %486, %486
  %503 = fmul float %487, %487
  %504 = fadd float %488, %489
  %505 = fadd float %504, %490
  %506 = fadd float %505, %491
  %507 = fadd float %506, %492
  %508 = fadd float %507, %493
  %509 = fadd float %508, %494
  %510 = fadd float %509, %495
  %511 = fadd float %510, %496
  %512 = fadd float %511, %497
  %513 = fadd float %512, %498
  %514 = fadd float %513, %499
  %515 = fadd float %514, %500
  %516 = fadd float %515, %501
  %517 = fadd float %516, %502
  %518 = fadd float %517, %503
  %519 = bitcast float %518 to i32
  %520 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %519, i32 16, i32 31)
  %521 = bitcast i32 %520 to float
  %522 = fadd float %518, %521
  %523 = bitcast float %522 to i32
  %524 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %523, i32 8, i32 31)
  %525 = bitcast i32 %524 to float
  %526 = fadd float %522, %525
  %527 = bitcast float %526 to i32
  %528 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %527, i32 4, i32 31)
  %529 = bitcast i32 %528 to float
  %530 = fadd float %526, %529
  %531 = bitcast float %530 to i32
  %532 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %531, i32 2, i32 31)
  %533 = bitcast i32 %532 to float
  %534 = fadd float %530, %533
  %535 = bitcast float %534 to i32
  %536 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %535, i32 1, i32 31)
  %537 = bitcast i32 %536 to float
  %538 = fadd float %534, %537
  %539 = urem i32 %17, 32
  %540 = urem i32 %18, 2
  %541 = icmp eq i32 %539, 0
  %542 = and i1 true, %541
  %543 = add i32 0, %540
  %544 = getelementptr float, ptr addrspace(3) @global_smem, i32 %543
  %545 = insertelement <1 x float> undef, float %538, i32 0
  %546 = extractelement <1 x float> %545, i32 0
  %547 = bitcast float %546 to i32
  %548 = insertelement <1 x i32> undef, i32 %547, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %544, <1 x i32> %548, i1 %542)
  call void @llvm.nvvm.barrier0()
  %549 = icmp slt i32 %16, 2
  %550 = getelementptr float, ptr addrspace(3) @global_smem, i32 %16
  %551 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %550, i1 %549)
  %552 = insertelement <1 x i32> undef, i32 %551, i32 0
  %553 = extractelement <1 x i32> %552, i32 0
  %554 = bitcast i32 %553 to float
  %555 = insertelement <1 x float> undef, float %554, i32 0
  %556 = extractelement <1 x float> %555, i32 0
  %557 = bitcast float %556 to i32
  %558 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %557, i32 1, i32 31)
  %559 = bitcast i32 %558 to float
  %560 = fadd float %556, %559
  %561 = urem i32 %17, 2
  %562 = icmp eq i32 %561, 0
  %563 = and i1 %549, %562
  %564 = insertelement <1 x float> undef, float %560, i32 0
  %565 = extractelement <1 x float> %564, i32 0
  %566 = bitcast float %565 to i32
  %567 = insertelement <1 x i32> undef, i32 %566, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %550, <1 x i32> %567, i1 %563)
  call void @llvm.nvvm.barrier0()
  %568 = load float, ptr addrspace(3) @global_smem, align 4
  %569 = fmul float %568, 0x3F50000000000000
  %570 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %571 = bitcast i32 %570 to <1 x float>
  %572 = extractelement <1 x float> %571, i32 0
  %573 = fadd float %569, %572
  %574 = call float @__nv_rsqrtf(float %573)
  %575 = fmul float %135, %574
  %576 = fmul float %136, %574
  %577 = fmul float %137, %574
  %578 = fmul float %138, %574
  %579 = getelementptr bfloat, ptr addrspace(1) %3, i64 %13
  %580 = getelementptr bfloat, ptr addrspace(1) %579, i64 %45
  %581 = call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %580)
  %582 = extractvalue { i32, i32 } %581, 0
  %583 = bitcast i32 %582 to <2 x bfloat>
  %584 = extractvalue { i32, i32 } %581, 1
  %585 = bitcast i32 %584 to <2 x bfloat>
  %586 = extractelement <2 x bfloat> %583, i32 0
  %587 = extractelement <2 x bfloat> %583, i32 1
  %588 = extractelement <2 x bfloat> %585, i32 0
  %589 = extractelement <2 x bfloat> %585, i32 1
  %590 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %586)
  %591 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %587)
  %592 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %588)
  %593 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %589)
  %594 = fmul float %575, %590
  %595 = fmul float %576, %591
  %596 = fmul float %577, %592
  %597 = fmul float %578, %593
  %598 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %594)
  %599 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %595)
  %600 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %596)
  %601 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %597)
  %602 = getelementptr bfloat, ptr addrspace(1) %7, i64 %14
  %603 = getelementptr bfloat, ptr addrspace(1) %602, i64 %45
  %604 = insertelement <2 x bfloat> undef, bfloat %598, i32 0
  %605 = insertelement <2 x bfloat> %604, bfloat %599, i32 1
  %606 = bitcast <2 x bfloat> %605 to i32
  %607 = insertelement <2 x bfloat> undef, bfloat %600, i32 0
  %608 = insertelement <2 x bfloat> %607, bfloat %601, i32 1
  %609 = bitcast <2 x bfloat> %608 to i32
  call void asm sideeffect "st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l"(i32 %606, i32 %609, ptr addrspace(1) %603)
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

declare ptx_kernel void @triton_softmax_4_0_impl(ptr, ptr, ptr, ptr) #7

define ptx_kernel void @triton_softmax_4_0(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2) #8 {
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
  %21 = call float @fused_concatenate_convert_197_17(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %9)
  %22 = fmul float %20, %21
  %23 = add i32 %9, 64
  %24 = add i32 %14, 64
  %25 = getelementptr inbounds float, ptr %0, i32 %24
  %26 = load float, ptr %25, align 4, !invariant.load !2
  %27 = getelementptr inbounds bfloat, ptr %1, i32 %23
  %28 = load bfloat, ptr %27, align 2, !invariant.load !2
  %29 = fpext bfloat %28 to float
  %30 = fmul float %26, %29
  %31 = call float @fused_concatenate_convert_197_17(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %23)
  %32 = fmul float %30, %31
  %33 = fsub float %22, %32
  %34 = fptrunc float %33 to bfloat
  %35 = getelementptr inbounds bfloat, ptr %4, i32 %14
  store bfloat %34, ptr %35, align 2
  %36 = load float, ptr %25, align 4, !invariant.load !2
  %37 = load bfloat, ptr %27, align 2, !invariant.load !2
  %38 = fpext bfloat %37 to float
  %39 = fmul float %36, %38
  %40 = call float @fused_concatenate_convert_197_17(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %9)
  %41 = fmul float %39, %40
  %42 = load float, ptr %15, align 4, !invariant.load !2
  %43 = load bfloat, ptr %17, align 2, !invariant.load !2
  %44 = fpext bfloat %43 to float
  %45 = fmul float %42, %44
  %46 = call float @fused_concatenate_convert_197_17(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %23)
  %47 = fmul float %45, %46
  %48 = fadd float %41, %47
  %49 = fptrunc float %48 to bfloat
  %50 = getelementptr inbounds bfloat, ptr %4, i32 %24
  store bfloat %49, ptr %50, align 2
  ret void
}

define internal float @fused_concatenate_convert_197_17(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, i32 %4, i32 %5) {
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

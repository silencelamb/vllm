; ModuleID = 'SyncTensorsGraph.367'
source_filename = "SyncTensorsGraph.367"
target datalayout = "e-p6:32:32-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@global_smem = external addrspace(3) global [0 x i8], align 16

define ptx_kernel void @loop_gather_fusion(ptr noalias align 16 dereferenceable(311164928) %0, ptr noalias align 16 dereferenceable(512) %1, ptr noalias align 128 dereferenceable(262144) %2) #0 {
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

define ptx_kernel void @gemm_fusion_dot_11_0(ptr noalias align 16 dereferenceable(4194304) %arg0, ptr noalias align 16 dereferenceable(4194304) %arg1, ptr noalias align 16 dereferenceable(4194304) %arg2, ptr noalias align 128 dereferenceable(786432) %arg3) #0 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr null to ptr addrspace(1)
  %6 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %7 = sdiv i32 %6, 8
  %8 = mul i32 %7, 8
  %9 = sub i32 96, %8
  %10 = icmp slt i32 %9, 8
  %11 = select i1 %10, i32 %9, i32 8
  %12 = srem i32 %6, %11
  %13 = add i32 %8, %12
  %14 = srem i32 %6, 8
  %15 = sdiv i32 %14, %11
  %16 = mul i32 %13, 32
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
  %29 = and i32 %27, 4
  %30 = icmp eq i32 %29, 0
  %31 = select i1 %30, i32 0, i32 1
  %32 = xor i32 0, %31
  %33 = and i32 %27, 8
  %34 = icmp eq i32 %33, 0
  %35 = select i1 %34, i32 0, i32 2
  %36 = xor i32 %32, %35
  %37 = and i32 %27, 16
  %38 = icmp eq i32 %37, 0
  %39 = select i1 %38, i32 0, i32 4
  %40 = xor i32 %36, %39
  %41 = and i32 %28, 1
  %42 = icmp eq i32 %41, 0
  %43 = select i1 %42, i32 0, i32 8
  %44 = xor i32 %40, %43
  %45 = and i32 %28, 2
  %46 = icmp eq i32 %45, 0
  %47 = select i1 %46, i32 0, i32 16
  %48 = xor i32 %44, %47
  %49 = xor i32 %48, 0
  %50 = add i32 %49, 0
  %51 = and i32 %27, 1
  %52 = icmp eq i32 %51, 0
  %53 = select i1 %52, i32 0, i32 8
  %54 = xor i32 0, %53
  %55 = and i32 %27, 2
  %56 = icmp eq i32 %55, 0
  %57 = select i1 %56, i32 0, i32 16
  %58 = xor i32 %54, %57
  %59 = xor i32 %58, 0
  %60 = add i32 %59, 0
  %61 = sext i32 %50 to i64
  %62 = sext i32 %60 to i64
  %63 = add i64 %25, %61
  %64 = mul i64 %63, 2048
  %65 = add i64 %64, %62
  %66 = getelementptr bfloat, ptr addrspace(1) %20, i64 %65
  %67 = select i1 %30, i32 0, i32 32
  %68 = xor i32 %58, %67
  %69 = select i1 %34, i32 0, i32 72
  %70 = xor i32 %68, %69
  %71 = select i1 %38, i32 0, i32 144
  %72 = xor i32 %70, %71
  %73 = select i1 %42, i32 0, i32 256
  %74 = xor i32 %72, %73
  %75 = select i1 %46, i32 0, i32 512
  %76 = xor i32 %74, %75
  %77 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %76
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %77, ptr addrspace(1) %66, i32 16)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  %78 = add i64 %62, 32
  %79 = add i64 %64, %78
  %80 = getelementptr bfloat, ptr addrspace(1) %20, i64 %79
  call void @llvm.nvvm.barrier0()
  %81 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 2048), i32 %76
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %81, ptr addrspace(1) %80, i32 16)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  %82 = add i64 %62, 64
  %83 = add i64 %64, %82
  %84 = getelementptr bfloat, ptr addrspace(1) %20, i64 %83
  call void @llvm.nvvm.barrier0()
  %85 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 4096), i32 %76
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %85, ptr addrspace(1) %84, i32 16)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  call void asm sideeffect "cp.async.wait_group 0x2;", ""()
  call void @llvm.nvvm.barrier0()
  br label %86

86:                                               ; preds = %94, %0
  %87 = phi i32 [ %415, %94 ], [ 0, %0 ]
  %88 = phi i64 [ %390, %94 ], [ 64, %0 ]
  %89 = phi { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } [ %389, %94 ], [ zeroinitializer, %0 ]
  %90 = phi i32 [ %393, %94 ], [ 2, %0 ]
  %91 = phi i32 [ %406, %94 ], [ 0, %0 ]
  %92 = phi { ptr addrspace(3), i32, i32 } [ %414, %94 ], [ { ptr addrspace(3) @global_smem, i32 0, i32 0 }, %0 ]
  %93 = icmp slt i32 %87, 2048
  br i1 %93, label %94, label %416

94:                                               ; preds = %86
  %95 = icmp slt i32 %87, 1952
  %96 = extractvalue { ptr addrspace(3), i32, i32 } %92, 0
  %97 = select i1 %52, i32 0, i32 32
  %98 = xor i32 0, %97
  %99 = select i1 %56, i32 0, i32 72
  %100 = xor i32 %98, %99
  %101 = select i1 %30, i32 0, i32 144
  %102 = xor i32 %100, %101
  %103 = select i1 %34, i32 0, i32 256
  %104 = xor i32 %102, %103
  %105 = select i1 %38, i32 0, i32 8
  %106 = xor i32 %104, %105
  %107 = getelementptr inbounds bfloat, ptr addrspace(3) %96, i32 %106
  %108 = ptrtoint ptr addrspace(3) %107 to i32
  %109 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %108)
  %110 = extractvalue { i32, i32, i32, i32 } %109, 0
  %111 = extractvalue { i32, i32, i32, i32 } %109, 1
  %112 = extractvalue { i32, i32, i32, i32 } %109, 2
  %113 = extractvalue { i32, i32, i32, i32 } %109, 3
  %114 = xor i32 16, %97
  %115 = xor i32 %114, %99
  %116 = xor i32 %115, %101
  %117 = xor i32 %116, %103
  %118 = xor i32 %117, %105
  %119 = getelementptr inbounds bfloat, ptr addrspace(3) %96, i32 %118
  %120 = ptrtoint ptr addrspace(3) %119 to i32
  %121 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %120)
  %122 = extractvalue { i32, i32, i32, i32 } %121, 0
  %123 = extractvalue { i32, i32, i32, i32 } %121, 1
  %124 = extractvalue { i32, i32, i32, i32 } %121, 2
  %125 = extractvalue { i32, i32, i32, i32 } %121, 3
  %126 = xor i32 512, %97
  %127 = xor i32 %126, %99
  %128 = xor i32 %127, %101
  %129 = xor i32 %128, %103
  %130 = xor i32 %129, %105
  %131 = getelementptr inbounds bfloat, ptr addrspace(3) %96, i32 %130
  %132 = ptrtoint ptr addrspace(3) %131 to i32
  %133 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %132)
  %134 = extractvalue { i32, i32, i32, i32 } %133, 0
  %135 = extractvalue { i32, i32, i32, i32 } %133, 1
  %136 = extractvalue { i32, i32, i32, i32 } %133, 2
  %137 = extractvalue { i32, i32, i32, i32 } %133, 3
  %138 = xor i32 528, %97
  %139 = xor i32 %138, %99
  %140 = xor i32 %139, %101
  %141 = xor i32 %140, %103
  %142 = xor i32 %141, %105
  %143 = getelementptr inbounds bfloat, ptr addrspace(3) %96, i32 %142
  %144 = ptrtoint ptr addrspace(3) %143 to i32
  %145 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %144)
  %146 = extractvalue { i32, i32, i32, i32 } %145, 0
  %147 = extractvalue { i32, i32, i32, i32 } %145, 1
  %148 = extractvalue { i32, i32, i32, i32 } %145, 2
  %149 = extractvalue { i32, i32, i32, i32 } %145, 3
  %150 = bitcast i32 %110 to <2 x bfloat>
  %151 = extractelement <2 x bfloat> %150, i32 0
  %152 = extractelement <2 x bfloat> %150, i32 1
  %153 = bitcast i32 %111 to <2 x bfloat>
  %154 = extractelement <2 x bfloat> %153, i32 0
  %155 = extractelement <2 x bfloat> %153, i32 1
  %156 = bitcast i32 %112 to <2 x bfloat>
  %157 = extractelement <2 x bfloat> %156, i32 0
  %158 = extractelement <2 x bfloat> %156, i32 1
  %159 = bitcast i32 %113 to <2 x bfloat>
  %160 = extractelement <2 x bfloat> %159, i32 0
  %161 = extractelement <2 x bfloat> %159, i32 1
  %162 = bitcast i32 %122 to <2 x bfloat>
  %163 = extractelement <2 x bfloat> %162, i32 0
  %164 = extractelement <2 x bfloat> %162, i32 1
  %165 = bitcast i32 %123 to <2 x bfloat>
  %166 = extractelement <2 x bfloat> %165, i32 0
  %167 = extractelement <2 x bfloat> %165, i32 1
  %168 = bitcast i32 %124 to <2 x bfloat>
  %169 = extractelement <2 x bfloat> %168, i32 0
  %170 = extractelement <2 x bfloat> %168, i32 1
  %171 = bitcast i32 %125 to <2 x bfloat>
  %172 = extractelement <2 x bfloat> %171, i32 0
  %173 = extractelement <2 x bfloat> %171, i32 1
  %174 = bitcast i32 %134 to <2 x bfloat>
  %175 = extractelement <2 x bfloat> %174, i32 0
  %176 = extractelement <2 x bfloat> %174, i32 1
  %177 = bitcast i32 %135 to <2 x bfloat>
  %178 = extractelement <2 x bfloat> %177, i32 0
  %179 = extractelement <2 x bfloat> %177, i32 1
  %180 = bitcast i32 %136 to <2 x bfloat>
  %181 = extractelement <2 x bfloat> %180, i32 0
  %182 = extractelement <2 x bfloat> %180, i32 1
  %183 = bitcast i32 %137 to <2 x bfloat>
  %184 = extractelement <2 x bfloat> %183, i32 0
  %185 = extractelement <2 x bfloat> %183, i32 1
  %186 = bitcast i32 %146 to <2 x bfloat>
  %187 = extractelement <2 x bfloat> %186, i32 0
  %188 = extractelement <2 x bfloat> %186, i32 1
  %189 = bitcast i32 %147 to <2 x bfloat>
  %190 = extractelement <2 x bfloat> %189, i32 0
  %191 = extractelement <2 x bfloat> %189, i32 1
  %192 = bitcast i32 %148 to <2 x bfloat>
  %193 = extractelement <2 x bfloat> %192, i32 0
  %194 = extractelement <2 x bfloat> %192, i32 1
  %195 = bitcast i32 %149 to <2 x bfloat>
  %196 = extractelement <2 x bfloat> %195, i32 0
  %197 = extractelement <2 x bfloat> %195, i32 1
  %198 = insertelement <2 x bfloat> undef, bfloat %151, i32 0
  %199 = insertelement <2 x bfloat> %198, bfloat %152, i32 1
  %200 = bitcast <2 x bfloat> %199 to i32
  %201 = insertelement <2 x bfloat> undef, bfloat %154, i32 0
  %202 = insertelement <2 x bfloat> %201, bfloat %155, i32 1
  %203 = bitcast <2 x bfloat> %202 to i32
  %204 = insertelement <2 x bfloat> undef, bfloat %157, i32 0
  %205 = insertelement <2 x bfloat> %204, bfloat %158, i32 1
  %206 = bitcast <2 x bfloat> %205 to i32
  %207 = insertelement <2 x bfloat> undef, bfloat %160, i32 0
  %208 = insertelement <2 x bfloat> %207, bfloat %161, i32 1
  %209 = bitcast <2 x bfloat> %208 to i32
  %210 = insertelement <2 x bfloat> undef, bfloat %163, i32 0
  %211 = insertelement <2 x bfloat> %210, bfloat %164, i32 1
  %212 = bitcast <2 x bfloat> %211 to i32
  %213 = insertelement <2 x bfloat> undef, bfloat %166, i32 0
  %214 = insertelement <2 x bfloat> %213, bfloat %167, i32 1
  %215 = bitcast <2 x bfloat> %214 to i32
  %216 = insertelement <2 x bfloat> undef, bfloat %169, i32 0
  %217 = insertelement <2 x bfloat> %216, bfloat %170, i32 1
  %218 = bitcast <2 x bfloat> %217 to i32
  %219 = insertelement <2 x bfloat> undef, bfloat %172, i32 0
  %220 = insertelement <2 x bfloat> %219, bfloat %173, i32 1
  %221 = bitcast <2 x bfloat> %220 to i32
  %222 = insertelement <2 x bfloat> undef, bfloat %175, i32 0
  %223 = insertelement <2 x bfloat> %222, bfloat %176, i32 1
  %224 = bitcast <2 x bfloat> %223 to i32
  %225 = insertelement <2 x bfloat> undef, bfloat %178, i32 0
  %226 = insertelement <2 x bfloat> %225, bfloat %179, i32 1
  %227 = bitcast <2 x bfloat> %226 to i32
  %228 = insertelement <2 x bfloat> undef, bfloat %181, i32 0
  %229 = insertelement <2 x bfloat> %228, bfloat %182, i32 1
  %230 = bitcast <2 x bfloat> %229 to i32
  %231 = insertelement <2 x bfloat> undef, bfloat %184, i32 0
  %232 = insertelement <2 x bfloat> %231, bfloat %185, i32 1
  %233 = bitcast <2 x bfloat> %232 to i32
  %234 = insertelement <2 x bfloat> undef, bfloat %187, i32 0
  %235 = insertelement <2 x bfloat> %234, bfloat %188, i32 1
  %236 = bitcast <2 x bfloat> %235 to i32
  %237 = insertelement <2 x bfloat> undef, bfloat %190, i32 0
  %238 = insertelement <2 x bfloat> %237, bfloat %191, i32 1
  %239 = bitcast <2 x bfloat> %238 to i32
  %240 = insertelement <2 x bfloat> undef, bfloat %193, i32 0
  %241 = insertelement <2 x bfloat> %240, bfloat %194, i32 1
  %242 = bitcast <2 x bfloat> %241 to i32
  %243 = insertelement <2 x bfloat> undef, bfloat %196, i32 0
  %244 = insertelement <2 x bfloat> %243, bfloat %197, i32 1
  %245 = bitcast <2 x bfloat> %244 to i32
  %246 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 0
  %247 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 1
  %248 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 2
  %249 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 3
  %250 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 4
  %251 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 5
  %252 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 6
  %253 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 7
  %254 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 8
  %255 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 9
  %256 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 10
  %257 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 11
  %258 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 12
  %259 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 13
  %260 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 14
  %261 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 15
  %262 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 16
  %263 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 17
  %264 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 18
  %265 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 19
  %266 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 20
  %267 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 21
  %268 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 22
  %269 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 23
  %270 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 24
  %271 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 25
  %272 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 26
  %273 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 27
  %274 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 28
  %275 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 29
  %276 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 30
  %277 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 31
  %278 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %246, float %247, float %248, float %249, i32 %200, i32 %203, i32 %206, i32 %209, i32 0, i32 0)
  %279 = extractvalue { float, float, float, float } %278, 0
  %280 = extractvalue { float, float, float, float } %278, 1
  %281 = extractvalue { float, float, float, float } %278, 2
  %282 = extractvalue { float, float, float, float } %278, 3
  %283 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %250, float %251, float %252, float %253, i32 %200, i32 %203, i32 %206, i32 %209, i32 0, i32 0)
  %284 = extractvalue { float, float, float, float } %283, 0
  %285 = extractvalue { float, float, float, float } %283, 1
  %286 = extractvalue { float, float, float, float } %283, 2
  %287 = extractvalue { float, float, float, float } %283, 3
  %288 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %254, float %255, float %256, float %257, i32 %200, i32 %203, i32 %206, i32 %209, i32 0, i32 0)
  %289 = extractvalue { float, float, float, float } %288, 0
  %290 = extractvalue { float, float, float, float } %288, 1
  %291 = extractvalue { float, float, float, float } %288, 2
  %292 = extractvalue { float, float, float, float } %288, 3
  %293 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %258, float %259, float %260, float %261, i32 %200, i32 %203, i32 %206, i32 %209, i32 0, i32 0)
  %294 = extractvalue { float, float, float, float } %293, 0
  %295 = extractvalue { float, float, float, float } %293, 1
  %296 = extractvalue { float, float, float, float } %293, 2
  %297 = extractvalue { float, float, float, float } %293, 3
  %298 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %262, float %263, float %264, float %265, i32 %224, i32 %227, i32 %230, i32 %233, i32 0, i32 0)
  %299 = extractvalue { float, float, float, float } %298, 0
  %300 = extractvalue { float, float, float, float } %298, 1
  %301 = extractvalue { float, float, float, float } %298, 2
  %302 = extractvalue { float, float, float, float } %298, 3
  %303 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %266, float %267, float %268, float %269, i32 %224, i32 %227, i32 %230, i32 %233, i32 0, i32 0)
  %304 = extractvalue { float, float, float, float } %303, 0
  %305 = extractvalue { float, float, float, float } %303, 1
  %306 = extractvalue { float, float, float, float } %303, 2
  %307 = extractvalue { float, float, float, float } %303, 3
  %308 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %270, float %271, float %272, float %273, i32 %224, i32 %227, i32 %230, i32 %233, i32 0, i32 0)
  %309 = extractvalue { float, float, float, float } %308, 0
  %310 = extractvalue { float, float, float, float } %308, 1
  %311 = extractvalue { float, float, float, float } %308, 2
  %312 = extractvalue { float, float, float, float } %308, 3
  %313 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %274, float %275, float %276, float %277, i32 %224, i32 %227, i32 %230, i32 %233, i32 0, i32 0)
  %314 = extractvalue { float, float, float, float } %313, 0
  %315 = extractvalue { float, float, float, float } %313, 1
  %316 = extractvalue { float, float, float, float } %313, 2
  %317 = extractvalue { float, float, float, float } %313, 3
  %318 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %279, float %280, float %281, float %282, i32 %212, i32 %215, i32 %218, i32 %221, i32 0, i32 0)
  %319 = extractvalue { float, float, float, float } %318, 0
  %320 = extractvalue { float, float, float, float } %318, 1
  %321 = extractvalue { float, float, float, float } %318, 2
  %322 = extractvalue { float, float, float, float } %318, 3
  %323 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %284, float %285, float %286, float %287, i32 %212, i32 %215, i32 %218, i32 %221, i32 0, i32 0)
  %324 = extractvalue { float, float, float, float } %323, 0
  %325 = extractvalue { float, float, float, float } %323, 1
  %326 = extractvalue { float, float, float, float } %323, 2
  %327 = extractvalue { float, float, float, float } %323, 3
  %328 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %289, float %290, float %291, float %292, i32 %212, i32 %215, i32 %218, i32 %221, i32 0, i32 0)
  %329 = extractvalue { float, float, float, float } %328, 0
  %330 = extractvalue { float, float, float, float } %328, 1
  %331 = extractvalue { float, float, float, float } %328, 2
  %332 = extractvalue { float, float, float, float } %328, 3
  %333 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %294, float %295, float %296, float %297, i32 %212, i32 %215, i32 %218, i32 %221, i32 0, i32 0)
  %334 = extractvalue { float, float, float, float } %333, 0
  %335 = extractvalue { float, float, float, float } %333, 1
  %336 = extractvalue { float, float, float, float } %333, 2
  %337 = extractvalue { float, float, float, float } %333, 3
  %338 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %299, float %300, float %301, float %302, i32 %236, i32 %239, i32 %242, i32 %245, i32 0, i32 0)
  %339 = extractvalue { float, float, float, float } %338, 0
  %340 = extractvalue { float, float, float, float } %338, 1
  %341 = extractvalue { float, float, float, float } %338, 2
  %342 = extractvalue { float, float, float, float } %338, 3
  %343 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %304, float %305, float %306, float %307, i32 %236, i32 %239, i32 %242, i32 %245, i32 0, i32 0)
  %344 = extractvalue { float, float, float, float } %343, 0
  %345 = extractvalue { float, float, float, float } %343, 1
  %346 = extractvalue { float, float, float, float } %343, 2
  %347 = extractvalue { float, float, float, float } %343, 3
  %348 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %309, float %310, float %311, float %312, i32 %236, i32 %239, i32 %242, i32 %245, i32 0, i32 0)
  %349 = extractvalue { float, float, float, float } %348, 0
  %350 = extractvalue { float, float, float, float } %348, 1
  %351 = extractvalue { float, float, float, float } %348, 2
  %352 = extractvalue { float, float, float, float } %348, 3
  %353 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %314, float %315, float %316, float %317, i32 %236, i32 %239, i32 %242, i32 %245, i32 0, i32 0)
  %354 = extractvalue { float, float, float, float } %353, 0
  %355 = extractvalue { float, float, float, float } %353, 1
  %356 = extractvalue { float, float, float, float } %353, 2
  %357 = extractvalue { float, float, float, float } %353, 3
  %358 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } undef, float %319, 0
  %359 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %358, float %320, 1
  %360 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %359, float %321, 2
  %361 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %360, float %322, 3
  %362 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %361, float %324, 4
  %363 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, float %325, 5
  %364 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %363, float %326, 6
  %365 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %364, float %327, 7
  %366 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %365, float %329, 8
  %367 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %366, float %330, 9
  %368 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %367, float %331, 10
  %369 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %368, float %332, 11
  %370 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %369, float %334, 12
  %371 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %370, float %335, 13
  %372 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %371, float %336, 14
  %373 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %372, float %337, 15
  %374 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %373, float %339, 16
  %375 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %374, float %340, 17
  %376 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %375, float %341, 18
  %377 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %376, float %342, 19
  %378 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %377, float %344, 20
  %379 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %378, float %345, 21
  %380 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %379, float %346, 22
  %381 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %380, float %347, 23
  %382 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %381, float %349, 24
  %383 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %382, float %350, 25
  %384 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %383, float %351, 26
  %385 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %384, float %352, 27
  %386 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %385, float %354, 28
  %387 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %386, float %355, 29
  %388 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %387, float %356, 30
  %389 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %388, float %357, 31
  %390 = add i64 %88, 32
  %391 = add i32 %90, 1
  %392 = icmp slt i32 %391, 3
  %393 = select i1 %392, i32 %391, i32 0
  %394 = add i64 %390, %62
  %395 = add i64 %64, %394
  %396 = getelementptr bfloat, ptr addrspace(1) %20, i64 %395
  %397 = mul i32 %393, 1024
  %398 = add i32 %397, 0
  %399 = add i32 %398, 0
  %400 = add i32 %399, 0
  %401 = getelementptr bfloat, ptr addrspace(3) @global_smem, i32 %400
  call void @llvm.nvvm.barrier0()
  %402 = getelementptr inbounds bfloat, ptr addrspace(3) %401, i32 %76
  %403 = select i1 %95, i32 16, i32 0
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %402, ptr addrspace(1) %396, i32 %403)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  %404 = add i32 %91, 1
  %405 = icmp slt i32 %404, 3
  %406 = select i1 %405, i32 %404, i32 0
  call void asm sideeffect "cp.async.wait_group 0x2;", ""()
  call void @llvm.nvvm.barrier0()
  %407 = mul i32 %406, 1024
  %408 = add i32 %407, 0
  %409 = add i32 %408, 0
  %410 = add i32 %409, 0
  %411 = getelementptr bfloat, ptr addrspace(3) @global_smem, i32 %410
  %412 = insertvalue { ptr addrspace(3), i32, i32 } undef, ptr addrspace(3) %411, 0
  %413 = insertvalue { ptr addrspace(3), i32, i32 } %412, i32 0, 1
  %414 = insertvalue { ptr addrspace(3), i32, i32 } %413, i32 0, 2
  %415 = add i32 %87, 32
  br label %86

416:                                              ; preds = %86
  call void asm sideeffect "cp.async.wait_group 0x0;", ""()
  call void @llvm.nvvm.barrier0()
  %417 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 0
  %418 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 1
  %419 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 2
  %420 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 3
  %421 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 4
  %422 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 5
  %423 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 6
  %424 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 7
  %425 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 8
  %426 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 9
  %427 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 10
  %428 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 11
  %429 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 12
  %430 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 13
  %431 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 14
  %432 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 15
  %433 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 16
  %434 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 17
  %435 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 18
  %436 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 19
  %437 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 20
  %438 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 21
  %439 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 22
  %440 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 23
  %441 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 24
  %442 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 25
  %443 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 26
  %444 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 27
  %445 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 28
  %446 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 29
  %447 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 30
  %448 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %89, 31
  %449 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %417)
  %450 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %418)
  %451 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %419)
  %452 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %420)
  %453 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %421)
  %454 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %422)
  %455 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %423)
  %456 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %424)
  %457 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %425)
  %458 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %426)
  %459 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %427)
  %460 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %428)
  %461 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %429)
  %462 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %430)
  %463 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %431)
  %464 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %432)
  %465 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %433)
  %466 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %434)
  %467 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %435)
  %468 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %436)
  %469 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %437)
  %470 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %438)
  %471 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %439)
  %472 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %440)
  %473 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %441)
  %474 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %442)
  %475 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %443)
  %476 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %444)
  %477 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %445)
  %478 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %446)
  %479 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %447)
  %480 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %448)
  %481 = mul i32 %15, 128
  %482 = sext i32 %16 to i64
  %483 = sext i32 %481 to i64
  %484 = add i64 %482, %62
  %485 = xor i32 %48, 32
  %486 = xor i32 %48, 64
  %487 = xor i32 %48, 96
  %488 = add i32 %485, 0
  %489 = add i32 %486, 0
  %490 = add i32 %487, 0
  %491 = sext i32 %488 to i64
  %492 = sext i32 %489 to i64
  %493 = sext i32 %490 to i64
  %494 = add i64 %483, %61
  %495 = add i64 %483, %491
  %496 = add i64 %483, %492
  %497 = add i64 %483, %493
  %498 = mul i64 %494, 3072
  %499 = mul i64 %495, 3072
  %500 = mul i64 %496, 3072
  %501 = mul i64 %497, 3072
  %502 = add i64 %484, %498
  %503 = add i64 %484, %499
  %504 = add i64 %484, %500
  %505 = add i64 %484, %501
  %506 = getelementptr bfloat, ptr addrspace(1) %4, i64 %502
  %507 = getelementptr bfloat, ptr addrspace(1) %4, i64 %503
  %508 = getelementptr bfloat, ptr addrspace(1) %4, i64 %504
  %509 = getelementptr bfloat, ptr addrspace(1) %4, i64 %505
  %510 = select i1 %52, i32 0, i32 64
  %511 = xor i32 0, %510
  %512 = select i1 %56, i32 0, i32 128
  %513 = xor i32 %511, %512
  %514 = xor i32 %513, %31
  %515 = xor i32 %514, %35
  %516 = xor i32 %515, %39
  %517 = xor i32 %516, %73
  %518 = xor i32 %517, %75
  %519 = select i1 %34, i32 0, i32 64
  %520 = xor i32 %68, %519
  %521 = select i1 %38, i32 0, i32 128
  %522 = xor i32 %520, %521
  %523 = xor i32 %522, %73
  %524 = xor i32 %523, %75
  %525 = xor i32 %518, 0
  %526 = lshr i32 %525, 5
  %527 = shl i32 %526, 3
  %528 = add i32 %527, %525
  %529 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %528
  %530 = insertelement <1 x bfloat> undef, bfloat %449, i32 0
  %531 = extractelement <1 x bfloat> %530, i32 0
  %532 = bitcast bfloat %531 to i16
  %533 = insertelement <1 x i16> undef, i16 %532, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %529, <1 x i16> %533, i1 true)
  %534 = xor i32 %518, 32
  %535 = lshr i32 %534, 5
  %536 = shl i32 %535, 3
  %537 = add i32 %536, %534
  %538 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %537
  %539 = insertelement <1 x bfloat> undef, bfloat %450, i32 0
  %540 = extractelement <1 x bfloat> %539, i32 0
  %541 = bitcast bfloat %540 to i16
  %542 = insertelement <1 x i16> undef, i16 %541, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %538, <1 x i16> %542, i1 true)
  %543 = xor i32 %518, 8
  %544 = lshr i32 %543, 5
  %545 = shl i32 %544, 3
  %546 = add i32 %545, %543
  %547 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %546
  %548 = insertelement <1 x bfloat> undef, bfloat %451, i32 0
  %549 = extractelement <1 x bfloat> %548, i32 0
  %550 = bitcast bfloat %549 to i16
  %551 = insertelement <1 x i16> undef, i16 %550, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %547, <1 x i16> %551, i1 true)
  %552 = xor i32 %518, 40
  %553 = lshr i32 %552, 5
  %554 = shl i32 %553, 3
  %555 = add i32 %554, %552
  %556 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %555
  %557 = insertelement <1 x bfloat> undef, bfloat %452, i32 0
  %558 = extractelement <1 x bfloat> %557, i32 0
  %559 = bitcast bfloat %558 to i16
  %560 = insertelement <1 x i16> undef, i16 %559, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %556, <1 x i16> %560, i1 true)
  %561 = xor i32 %518, 16
  %562 = lshr i32 %561, 5
  %563 = shl i32 %562, 3
  %564 = add i32 %563, %561
  %565 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %564
  %566 = insertelement <1 x bfloat> undef, bfloat %465, i32 0
  %567 = extractelement <1 x bfloat> %566, i32 0
  %568 = bitcast bfloat %567 to i16
  %569 = insertelement <1 x i16> undef, i16 %568, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %565, <1 x i16> %569, i1 true)
  %570 = xor i32 %518, 48
  %571 = lshr i32 %570, 5
  %572 = shl i32 %571, 3
  %573 = add i32 %572, %570
  %574 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %573
  %575 = insertelement <1 x bfloat> undef, bfloat %466, i32 0
  %576 = extractelement <1 x bfloat> %575, i32 0
  %577 = bitcast bfloat %576 to i16
  %578 = insertelement <1 x i16> undef, i16 %577, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %574, <1 x i16> %578, i1 true)
  %579 = xor i32 %518, 24
  %580 = lshr i32 %579, 5
  %581 = shl i32 %580, 3
  %582 = add i32 %581, %579
  %583 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %582
  %584 = insertelement <1 x bfloat> undef, bfloat %467, i32 0
  %585 = extractelement <1 x bfloat> %584, i32 0
  %586 = bitcast bfloat %585 to i16
  %587 = insertelement <1 x i16> undef, i16 %586, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %583, <1 x i16> %587, i1 true)
  %588 = xor i32 %518, 56
  %589 = lshr i32 %588, 5
  %590 = shl i32 %589, 3
  %591 = add i32 %590, %588
  %592 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %591
  %593 = insertelement <1 x bfloat> undef, bfloat %468, i32 0
  %594 = extractelement <1 x bfloat> %593, i32 0
  %595 = bitcast bfloat %594 to i16
  %596 = insertelement <1 x i16> undef, i16 %595, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %592, <1 x i16> %596, i1 true)
  call void @llvm.nvvm.barrier0()
  %597 = xor i32 %524, 0
  %598 = lshr i32 %597, 5
  %599 = shl i32 %598, 3
  %600 = add i32 %599, %597
  %601 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %600
  %602 = load <4 x i32>, ptr addrspace(3) %601, align 16
  %603 = extractelement <4 x i32> %602, i32 0
  %604 = extractelement <4 x i32> %602, i32 1
  %605 = extractelement <4 x i32> %602, i32 2
  %606 = extractelement <4 x i32> %602, i32 3
  %607 = insertelement <4 x i32> undef, i32 %603, i32 0
  %608 = insertelement <4 x i32> %607, i32 %604, i32 1
  %609 = insertelement <4 x i32> %608, i32 %605, i32 2
  %610 = insertelement <4 x i32> %609, i32 %606, i32 3
  %611 = extractelement <4 x i32> %610, i32 0
  %612 = extractelement <4 x i32> %610, i32 1
  %613 = extractelement <4 x i32> %610, i32 2
  %614 = extractelement <4 x i32> %610, i32 3
  %615 = bitcast i32 %611 to <2 x i16>
  %616 = extractelement <2 x i16> %615, i32 0
  %617 = extractelement <2 x i16> %615, i32 1
  %618 = bitcast i32 %612 to <2 x i16>
  %619 = extractelement <2 x i16> %618, i32 0
  %620 = extractelement <2 x i16> %618, i32 1
  %621 = bitcast i32 %613 to <2 x i16>
  %622 = extractelement <2 x i16> %621, i32 0
  %623 = extractelement <2 x i16> %621, i32 1
  %624 = bitcast i32 %614 to <2 x i16>
  %625 = extractelement <2 x i16> %624, i32 0
  %626 = extractelement <2 x i16> %624, i32 1
  %627 = insertelement <8 x i16> undef, i16 %616, i32 0
  %628 = insertelement <8 x i16> %627, i16 %617, i32 1
  %629 = insertelement <8 x i16> %628, i16 %619, i32 2
  %630 = insertelement <8 x i16> %629, i16 %620, i32 3
  %631 = insertelement <8 x i16> %630, i16 %622, i32 4
  %632 = insertelement <8 x i16> %631, i16 %623, i32 5
  %633 = insertelement <8 x i16> %632, i16 %625, i32 6
  %634 = insertelement <8 x i16> %633, i16 %626, i32 7
  %635 = extractelement <8 x i16> %634, i32 0
  %636 = extractelement <8 x i16> %634, i32 1
  %637 = extractelement <8 x i16> %634, i32 2
  %638 = extractelement <8 x i16> %634, i32 3
  %639 = extractelement <8 x i16> %634, i32 4
  %640 = extractelement <8 x i16> %634, i32 5
  %641 = extractelement <8 x i16> %634, i32 6
  %642 = extractelement <8 x i16> %634, i32 7
  %643 = bitcast i16 %635 to bfloat
  %644 = bitcast i16 %636 to bfloat
  %645 = bitcast i16 %637 to bfloat
  %646 = bitcast i16 %638 to bfloat
  %647 = bitcast i16 %639 to bfloat
  %648 = bitcast i16 %640 to bfloat
  %649 = bitcast i16 %641 to bfloat
  %650 = bitcast i16 %642 to bfloat
  %651 = insertelement <8 x bfloat> undef, bfloat %643, i32 0
  %652 = insertelement <8 x bfloat> %651, bfloat %644, i32 1
  %653 = insertelement <8 x bfloat> %652, bfloat %645, i32 2
  %654 = insertelement <8 x bfloat> %653, bfloat %646, i32 3
  %655 = insertelement <8 x bfloat> %654, bfloat %647, i32 4
  %656 = insertelement <8 x bfloat> %655, bfloat %648, i32 5
  %657 = insertelement <8 x bfloat> %656, bfloat %649, i32 6
  %658 = insertelement <8 x bfloat> %657, bfloat %650, i32 7
  %659 = extractelement <8 x bfloat> %658, i32 0
  %660 = extractelement <8 x bfloat> %658, i32 1
  %661 = extractelement <8 x bfloat> %658, i32 2
  %662 = extractelement <8 x bfloat> %658, i32 3
  %663 = extractelement <8 x bfloat> %658, i32 4
  %664 = extractelement <8 x bfloat> %658, i32 5
  %665 = extractelement <8 x bfloat> %658, i32 6
  %666 = extractelement <8 x bfloat> %658, i32 7
  call void @llvm.nvvm.barrier0()
  %667 = insertelement <1 x bfloat> undef, bfloat %453, i32 0
  %668 = extractelement <1 x bfloat> %667, i32 0
  %669 = bitcast bfloat %668 to i16
  %670 = insertelement <1 x i16> undef, i16 %669, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %529, <1 x i16> %670, i1 true)
  %671 = insertelement <1 x bfloat> undef, bfloat %454, i32 0
  %672 = extractelement <1 x bfloat> %671, i32 0
  %673 = bitcast bfloat %672 to i16
  %674 = insertelement <1 x i16> undef, i16 %673, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %538, <1 x i16> %674, i1 true)
  %675 = insertelement <1 x bfloat> undef, bfloat %455, i32 0
  %676 = extractelement <1 x bfloat> %675, i32 0
  %677 = bitcast bfloat %676 to i16
  %678 = insertelement <1 x i16> undef, i16 %677, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %547, <1 x i16> %678, i1 true)
  %679 = insertelement <1 x bfloat> undef, bfloat %456, i32 0
  %680 = extractelement <1 x bfloat> %679, i32 0
  %681 = bitcast bfloat %680 to i16
  %682 = insertelement <1 x i16> undef, i16 %681, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %556, <1 x i16> %682, i1 true)
  %683 = insertelement <1 x bfloat> undef, bfloat %469, i32 0
  %684 = extractelement <1 x bfloat> %683, i32 0
  %685 = bitcast bfloat %684 to i16
  %686 = insertelement <1 x i16> undef, i16 %685, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %565, <1 x i16> %686, i1 true)
  %687 = insertelement <1 x bfloat> undef, bfloat %470, i32 0
  %688 = extractelement <1 x bfloat> %687, i32 0
  %689 = bitcast bfloat %688 to i16
  %690 = insertelement <1 x i16> undef, i16 %689, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %574, <1 x i16> %690, i1 true)
  %691 = insertelement <1 x bfloat> undef, bfloat %471, i32 0
  %692 = extractelement <1 x bfloat> %691, i32 0
  %693 = bitcast bfloat %692 to i16
  %694 = insertelement <1 x i16> undef, i16 %693, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %583, <1 x i16> %694, i1 true)
  %695 = insertelement <1 x bfloat> undef, bfloat %472, i32 0
  %696 = extractelement <1 x bfloat> %695, i32 0
  %697 = bitcast bfloat %696 to i16
  %698 = insertelement <1 x i16> undef, i16 %697, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %592, <1 x i16> %698, i1 true)
  call void @llvm.nvvm.barrier0()
  %699 = load <4 x i32>, ptr addrspace(3) %601, align 16
  %700 = extractelement <4 x i32> %699, i32 0
  %701 = extractelement <4 x i32> %699, i32 1
  %702 = extractelement <4 x i32> %699, i32 2
  %703 = extractelement <4 x i32> %699, i32 3
  %704 = insertelement <4 x i32> undef, i32 %700, i32 0
  %705 = insertelement <4 x i32> %704, i32 %701, i32 1
  %706 = insertelement <4 x i32> %705, i32 %702, i32 2
  %707 = insertelement <4 x i32> %706, i32 %703, i32 3
  %708 = extractelement <4 x i32> %707, i32 0
  %709 = extractelement <4 x i32> %707, i32 1
  %710 = extractelement <4 x i32> %707, i32 2
  %711 = extractelement <4 x i32> %707, i32 3
  %712 = bitcast i32 %708 to <2 x i16>
  %713 = extractelement <2 x i16> %712, i32 0
  %714 = extractelement <2 x i16> %712, i32 1
  %715 = bitcast i32 %709 to <2 x i16>
  %716 = extractelement <2 x i16> %715, i32 0
  %717 = extractelement <2 x i16> %715, i32 1
  %718 = bitcast i32 %710 to <2 x i16>
  %719 = extractelement <2 x i16> %718, i32 0
  %720 = extractelement <2 x i16> %718, i32 1
  %721 = bitcast i32 %711 to <2 x i16>
  %722 = extractelement <2 x i16> %721, i32 0
  %723 = extractelement <2 x i16> %721, i32 1
  %724 = insertelement <8 x i16> undef, i16 %713, i32 0
  %725 = insertelement <8 x i16> %724, i16 %714, i32 1
  %726 = insertelement <8 x i16> %725, i16 %716, i32 2
  %727 = insertelement <8 x i16> %726, i16 %717, i32 3
  %728 = insertelement <8 x i16> %727, i16 %719, i32 4
  %729 = insertelement <8 x i16> %728, i16 %720, i32 5
  %730 = insertelement <8 x i16> %729, i16 %722, i32 6
  %731 = insertelement <8 x i16> %730, i16 %723, i32 7
  %732 = extractelement <8 x i16> %731, i32 0
  %733 = extractelement <8 x i16> %731, i32 1
  %734 = extractelement <8 x i16> %731, i32 2
  %735 = extractelement <8 x i16> %731, i32 3
  %736 = extractelement <8 x i16> %731, i32 4
  %737 = extractelement <8 x i16> %731, i32 5
  %738 = extractelement <8 x i16> %731, i32 6
  %739 = extractelement <8 x i16> %731, i32 7
  %740 = bitcast i16 %732 to bfloat
  %741 = bitcast i16 %733 to bfloat
  %742 = bitcast i16 %734 to bfloat
  %743 = bitcast i16 %735 to bfloat
  %744 = bitcast i16 %736 to bfloat
  %745 = bitcast i16 %737 to bfloat
  %746 = bitcast i16 %738 to bfloat
  %747 = bitcast i16 %739 to bfloat
  %748 = insertelement <8 x bfloat> undef, bfloat %740, i32 0
  %749 = insertelement <8 x bfloat> %748, bfloat %741, i32 1
  %750 = insertelement <8 x bfloat> %749, bfloat %742, i32 2
  %751 = insertelement <8 x bfloat> %750, bfloat %743, i32 3
  %752 = insertelement <8 x bfloat> %751, bfloat %744, i32 4
  %753 = insertelement <8 x bfloat> %752, bfloat %745, i32 5
  %754 = insertelement <8 x bfloat> %753, bfloat %746, i32 6
  %755 = insertelement <8 x bfloat> %754, bfloat %747, i32 7
  %756 = extractelement <8 x bfloat> %755, i32 0
  %757 = extractelement <8 x bfloat> %755, i32 1
  %758 = extractelement <8 x bfloat> %755, i32 2
  %759 = extractelement <8 x bfloat> %755, i32 3
  %760 = extractelement <8 x bfloat> %755, i32 4
  %761 = extractelement <8 x bfloat> %755, i32 5
  %762 = extractelement <8 x bfloat> %755, i32 6
  %763 = extractelement <8 x bfloat> %755, i32 7
  call void @llvm.nvvm.barrier0()
  %764 = insertelement <1 x bfloat> undef, bfloat %457, i32 0
  %765 = extractelement <1 x bfloat> %764, i32 0
  %766 = bitcast bfloat %765 to i16
  %767 = insertelement <1 x i16> undef, i16 %766, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %529, <1 x i16> %767, i1 true)
  %768 = insertelement <1 x bfloat> undef, bfloat %458, i32 0
  %769 = extractelement <1 x bfloat> %768, i32 0
  %770 = bitcast bfloat %769 to i16
  %771 = insertelement <1 x i16> undef, i16 %770, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %538, <1 x i16> %771, i1 true)
  %772 = insertelement <1 x bfloat> undef, bfloat %459, i32 0
  %773 = extractelement <1 x bfloat> %772, i32 0
  %774 = bitcast bfloat %773 to i16
  %775 = insertelement <1 x i16> undef, i16 %774, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %547, <1 x i16> %775, i1 true)
  %776 = insertelement <1 x bfloat> undef, bfloat %460, i32 0
  %777 = extractelement <1 x bfloat> %776, i32 0
  %778 = bitcast bfloat %777 to i16
  %779 = insertelement <1 x i16> undef, i16 %778, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %556, <1 x i16> %779, i1 true)
  %780 = insertelement <1 x bfloat> undef, bfloat %473, i32 0
  %781 = extractelement <1 x bfloat> %780, i32 0
  %782 = bitcast bfloat %781 to i16
  %783 = insertelement <1 x i16> undef, i16 %782, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %565, <1 x i16> %783, i1 true)
  %784 = insertelement <1 x bfloat> undef, bfloat %474, i32 0
  %785 = extractelement <1 x bfloat> %784, i32 0
  %786 = bitcast bfloat %785 to i16
  %787 = insertelement <1 x i16> undef, i16 %786, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %574, <1 x i16> %787, i1 true)
  %788 = insertelement <1 x bfloat> undef, bfloat %475, i32 0
  %789 = extractelement <1 x bfloat> %788, i32 0
  %790 = bitcast bfloat %789 to i16
  %791 = insertelement <1 x i16> undef, i16 %790, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %583, <1 x i16> %791, i1 true)
  %792 = insertelement <1 x bfloat> undef, bfloat %476, i32 0
  %793 = extractelement <1 x bfloat> %792, i32 0
  %794 = bitcast bfloat %793 to i16
  %795 = insertelement <1 x i16> undef, i16 %794, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %592, <1 x i16> %795, i1 true)
  call void @llvm.nvvm.barrier0()
  %796 = load <4 x i32>, ptr addrspace(3) %601, align 16
  %797 = extractelement <4 x i32> %796, i32 0
  %798 = extractelement <4 x i32> %796, i32 1
  %799 = extractelement <4 x i32> %796, i32 2
  %800 = extractelement <4 x i32> %796, i32 3
  %801 = insertelement <4 x i32> undef, i32 %797, i32 0
  %802 = insertelement <4 x i32> %801, i32 %798, i32 1
  %803 = insertelement <4 x i32> %802, i32 %799, i32 2
  %804 = insertelement <4 x i32> %803, i32 %800, i32 3
  %805 = extractelement <4 x i32> %804, i32 0
  %806 = extractelement <4 x i32> %804, i32 1
  %807 = extractelement <4 x i32> %804, i32 2
  %808 = extractelement <4 x i32> %804, i32 3
  %809 = bitcast i32 %805 to <2 x i16>
  %810 = extractelement <2 x i16> %809, i32 0
  %811 = extractelement <2 x i16> %809, i32 1
  %812 = bitcast i32 %806 to <2 x i16>
  %813 = extractelement <2 x i16> %812, i32 0
  %814 = extractelement <2 x i16> %812, i32 1
  %815 = bitcast i32 %807 to <2 x i16>
  %816 = extractelement <2 x i16> %815, i32 0
  %817 = extractelement <2 x i16> %815, i32 1
  %818 = bitcast i32 %808 to <2 x i16>
  %819 = extractelement <2 x i16> %818, i32 0
  %820 = extractelement <2 x i16> %818, i32 1
  %821 = insertelement <8 x i16> undef, i16 %810, i32 0
  %822 = insertelement <8 x i16> %821, i16 %811, i32 1
  %823 = insertelement <8 x i16> %822, i16 %813, i32 2
  %824 = insertelement <8 x i16> %823, i16 %814, i32 3
  %825 = insertelement <8 x i16> %824, i16 %816, i32 4
  %826 = insertelement <8 x i16> %825, i16 %817, i32 5
  %827 = insertelement <8 x i16> %826, i16 %819, i32 6
  %828 = insertelement <8 x i16> %827, i16 %820, i32 7
  %829 = extractelement <8 x i16> %828, i32 0
  %830 = extractelement <8 x i16> %828, i32 1
  %831 = extractelement <8 x i16> %828, i32 2
  %832 = extractelement <8 x i16> %828, i32 3
  %833 = extractelement <8 x i16> %828, i32 4
  %834 = extractelement <8 x i16> %828, i32 5
  %835 = extractelement <8 x i16> %828, i32 6
  %836 = extractelement <8 x i16> %828, i32 7
  %837 = bitcast i16 %829 to bfloat
  %838 = bitcast i16 %830 to bfloat
  %839 = bitcast i16 %831 to bfloat
  %840 = bitcast i16 %832 to bfloat
  %841 = bitcast i16 %833 to bfloat
  %842 = bitcast i16 %834 to bfloat
  %843 = bitcast i16 %835 to bfloat
  %844 = bitcast i16 %836 to bfloat
  %845 = insertelement <8 x bfloat> undef, bfloat %837, i32 0
  %846 = insertelement <8 x bfloat> %845, bfloat %838, i32 1
  %847 = insertelement <8 x bfloat> %846, bfloat %839, i32 2
  %848 = insertelement <8 x bfloat> %847, bfloat %840, i32 3
  %849 = insertelement <8 x bfloat> %848, bfloat %841, i32 4
  %850 = insertelement <8 x bfloat> %849, bfloat %842, i32 5
  %851 = insertelement <8 x bfloat> %850, bfloat %843, i32 6
  %852 = insertelement <8 x bfloat> %851, bfloat %844, i32 7
  %853 = extractelement <8 x bfloat> %852, i32 0
  %854 = extractelement <8 x bfloat> %852, i32 1
  %855 = extractelement <8 x bfloat> %852, i32 2
  %856 = extractelement <8 x bfloat> %852, i32 3
  %857 = extractelement <8 x bfloat> %852, i32 4
  %858 = extractelement <8 x bfloat> %852, i32 5
  %859 = extractelement <8 x bfloat> %852, i32 6
  %860 = extractelement <8 x bfloat> %852, i32 7
  call void @llvm.nvvm.barrier0()
  %861 = insertelement <1 x bfloat> undef, bfloat %461, i32 0
  %862 = extractelement <1 x bfloat> %861, i32 0
  %863 = bitcast bfloat %862 to i16
  %864 = insertelement <1 x i16> undef, i16 %863, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %529, <1 x i16> %864, i1 true)
  %865 = insertelement <1 x bfloat> undef, bfloat %462, i32 0
  %866 = extractelement <1 x bfloat> %865, i32 0
  %867 = bitcast bfloat %866 to i16
  %868 = insertelement <1 x i16> undef, i16 %867, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %538, <1 x i16> %868, i1 true)
  %869 = insertelement <1 x bfloat> undef, bfloat %463, i32 0
  %870 = extractelement <1 x bfloat> %869, i32 0
  %871 = bitcast bfloat %870 to i16
  %872 = insertelement <1 x i16> undef, i16 %871, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %547, <1 x i16> %872, i1 true)
  %873 = insertelement <1 x bfloat> undef, bfloat %464, i32 0
  %874 = extractelement <1 x bfloat> %873, i32 0
  %875 = bitcast bfloat %874 to i16
  %876 = insertelement <1 x i16> undef, i16 %875, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %556, <1 x i16> %876, i1 true)
  %877 = insertelement <1 x bfloat> undef, bfloat %477, i32 0
  %878 = extractelement <1 x bfloat> %877, i32 0
  %879 = bitcast bfloat %878 to i16
  %880 = insertelement <1 x i16> undef, i16 %879, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %565, <1 x i16> %880, i1 true)
  %881 = insertelement <1 x bfloat> undef, bfloat %478, i32 0
  %882 = extractelement <1 x bfloat> %881, i32 0
  %883 = bitcast bfloat %882 to i16
  %884 = insertelement <1 x i16> undef, i16 %883, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %574, <1 x i16> %884, i1 true)
  %885 = insertelement <1 x bfloat> undef, bfloat %479, i32 0
  %886 = extractelement <1 x bfloat> %885, i32 0
  %887 = bitcast bfloat %886 to i16
  %888 = insertelement <1 x i16> undef, i16 %887, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %583, <1 x i16> %888, i1 true)
  %889 = insertelement <1 x bfloat> undef, bfloat %480, i32 0
  %890 = extractelement <1 x bfloat> %889, i32 0
  %891 = bitcast bfloat %890 to i16
  %892 = insertelement <1 x i16> undef, i16 %891, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %592, <1 x i16> %892, i1 true)
  call void @llvm.nvvm.barrier0()
  %893 = load <4 x i32>, ptr addrspace(3) %601, align 16
  %894 = extractelement <4 x i32> %893, i32 0
  %895 = extractelement <4 x i32> %893, i32 1
  %896 = extractelement <4 x i32> %893, i32 2
  %897 = extractelement <4 x i32> %893, i32 3
  %898 = insertelement <4 x i32> undef, i32 %894, i32 0
  %899 = insertelement <4 x i32> %898, i32 %895, i32 1
  %900 = insertelement <4 x i32> %899, i32 %896, i32 2
  %901 = insertelement <4 x i32> %900, i32 %897, i32 3
  %902 = extractelement <4 x i32> %901, i32 0
  %903 = extractelement <4 x i32> %901, i32 1
  %904 = extractelement <4 x i32> %901, i32 2
  %905 = extractelement <4 x i32> %901, i32 3
  %906 = bitcast i32 %902 to <2 x i16>
  %907 = extractelement <2 x i16> %906, i32 0
  %908 = extractelement <2 x i16> %906, i32 1
  %909 = bitcast i32 %903 to <2 x i16>
  %910 = extractelement <2 x i16> %909, i32 0
  %911 = extractelement <2 x i16> %909, i32 1
  %912 = bitcast i32 %904 to <2 x i16>
  %913 = extractelement <2 x i16> %912, i32 0
  %914 = extractelement <2 x i16> %912, i32 1
  %915 = bitcast i32 %905 to <2 x i16>
  %916 = extractelement <2 x i16> %915, i32 0
  %917 = extractelement <2 x i16> %915, i32 1
  %918 = insertelement <8 x i16> undef, i16 %907, i32 0
  %919 = insertelement <8 x i16> %918, i16 %908, i32 1
  %920 = insertelement <8 x i16> %919, i16 %910, i32 2
  %921 = insertelement <8 x i16> %920, i16 %911, i32 3
  %922 = insertelement <8 x i16> %921, i16 %913, i32 4
  %923 = insertelement <8 x i16> %922, i16 %914, i32 5
  %924 = insertelement <8 x i16> %923, i16 %916, i32 6
  %925 = insertelement <8 x i16> %924, i16 %917, i32 7
  %926 = extractelement <8 x i16> %925, i32 0
  %927 = extractelement <8 x i16> %925, i32 1
  %928 = extractelement <8 x i16> %925, i32 2
  %929 = extractelement <8 x i16> %925, i32 3
  %930 = extractelement <8 x i16> %925, i32 4
  %931 = extractelement <8 x i16> %925, i32 5
  %932 = extractelement <8 x i16> %925, i32 6
  %933 = extractelement <8 x i16> %925, i32 7
  %934 = bitcast i16 %926 to bfloat
  %935 = bitcast i16 %927 to bfloat
  %936 = bitcast i16 %928 to bfloat
  %937 = bitcast i16 %929 to bfloat
  %938 = bitcast i16 %930 to bfloat
  %939 = bitcast i16 %931 to bfloat
  %940 = bitcast i16 %932 to bfloat
  %941 = bitcast i16 %933 to bfloat
  %942 = insertelement <8 x bfloat> undef, bfloat %934, i32 0
  %943 = insertelement <8 x bfloat> %942, bfloat %935, i32 1
  %944 = insertelement <8 x bfloat> %943, bfloat %936, i32 2
  %945 = insertelement <8 x bfloat> %944, bfloat %937, i32 3
  %946 = insertelement <8 x bfloat> %945, bfloat %938, i32 4
  %947 = insertelement <8 x bfloat> %946, bfloat %939, i32 5
  %948 = insertelement <8 x bfloat> %947, bfloat %940, i32 6
  %949 = insertelement <8 x bfloat> %948, bfloat %941, i32 7
  %950 = extractelement <8 x bfloat> %949, i32 0
  %951 = extractelement <8 x bfloat> %949, i32 1
  %952 = extractelement <8 x bfloat> %949, i32 2
  %953 = extractelement <8 x bfloat> %949, i32 3
  %954 = extractelement <8 x bfloat> %949, i32 4
  %955 = extractelement <8 x bfloat> %949, i32 5
  %956 = extractelement <8 x bfloat> %949, i32 6
  %957 = extractelement <8 x bfloat> %949, i32 7
  %958 = insertelement <2 x bfloat> undef, bfloat %659, i32 0
  %959 = insertelement <2 x bfloat> %958, bfloat %660, i32 1
  %960 = bitcast <2 x bfloat> %959 to i32
  %961 = insertelement <2 x bfloat> undef, bfloat %661, i32 0
  %962 = insertelement <2 x bfloat> %961, bfloat %662, i32 1
  %963 = bitcast <2 x bfloat> %962 to i32
  %964 = insertelement <2 x bfloat> undef, bfloat %663, i32 0
  %965 = insertelement <2 x bfloat> %964, bfloat %664, i32 1
  %966 = bitcast <2 x bfloat> %965 to i32
  %967 = insertelement <2 x bfloat> undef, bfloat %665, i32 0
  %968 = insertelement <2 x bfloat> %967, bfloat %666, i32 1
  %969 = bitcast <2 x bfloat> %968 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %960, i32 %963, i32 %966, i32 %969, ptr addrspace(1) %506)
  %970 = insertelement <2 x bfloat> undef, bfloat %756, i32 0
  %971 = insertelement <2 x bfloat> %970, bfloat %757, i32 1
  %972 = bitcast <2 x bfloat> %971 to i32
  %973 = insertelement <2 x bfloat> undef, bfloat %758, i32 0
  %974 = insertelement <2 x bfloat> %973, bfloat %759, i32 1
  %975 = bitcast <2 x bfloat> %974 to i32
  %976 = insertelement <2 x bfloat> undef, bfloat %760, i32 0
  %977 = insertelement <2 x bfloat> %976, bfloat %761, i32 1
  %978 = bitcast <2 x bfloat> %977 to i32
  %979 = insertelement <2 x bfloat> undef, bfloat %762, i32 0
  %980 = insertelement <2 x bfloat> %979, bfloat %763, i32 1
  %981 = bitcast <2 x bfloat> %980 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %972, i32 %975, i32 %978, i32 %981, ptr addrspace(1) %507)
  %982 = insertelement <2 x bfloat> undef, bfloat %853, i32 0
  %983 = insertelement <2 x bfloat> %982, bfloat %854, i32 1
  %984 = bitcast <2 x bfloat> %983 to i32
  %985 = insertelement <2 x bfloat> undef, bfloat %855, i32 0
  %986 = insertelement <2 x bfloat> %985, bfloat %856, i32 1
  %987 = bitcast <2 x bfloat> %986 to i32
  %988 = insertelement <2 x bfloat> undef, bfloat %857, i32 0
  %989 = insertelement <2 x bfloat> %988, bfloat %858, i32 1
  %990 = bitcast <2 x bfloat> %989 to i32
  %991 = insertelement <2 x bfloat> undef, bfloat %859, i32 0
  %992 = insertelement <2 x bfloat> %991, bfloat %860, i32 1
  %993 = bitcast <2 x bfloat> %992 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %984, i32 %987, i32 %990, i32 %993, ptr addrspace(1) %508)
  %994 = insertelement <2 x bfloat> undef, bfloat %950, i32 0
  %995 = insertelement <2 x bfloat> %994, bfloat %951, i32 1
  %996 = bitcast <2 x bfloat> %995 to i32
  %997 = insertelement <2 x bfloat> undef, bfloat %952, i32 0
  %998 = insertelement <2 x bfloat> %997, bfloat %953, i32 1
  %999 = bitcast <2 x bfloat> %998 to i32
  %1000 = insertelement <2 x bfloat> undef, bfloat %954, i32 0
  %1001 = insertelement <2 x bfloat> %1000, bfloat %955, i32 1
  %1002 = bitcast <2 x bfloat> %1001 to i32
  %1003 = insertelement <2 x bfloat> undef, bfloat %956, i32 0
  %1004 = insertelement <2 x bfloat> %1003, bfloat %957, i32 1
  %1005 = bitcast <2 x bfloat> %1004 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %996, i32 %999, i32 %1002, i32 %1005, ptr addrspace(1) %509)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_54_impl(ptr, ptr, ptr, ptr, ptr, ptr) #4

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #5

declare float @__nv_rsqrtf(float)

define ptx_kernel void @fusion_54(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(262144) %arg1, ptr noalias align 128 dereferenceable(786432) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(262144) %arg4) #6 {
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

define ptx_kernel void @loop_convert_fusion(ptr noalias align 128 dereferenceable(1572864) %0, ptr noalias align 128 dereferenceable(786432) %1) #0 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %5 = udiv i32 %4, 6
  %6 = mul i32 %3, 4
  %7 = mul i32 %4, 512
  %8 = add i32 %6, %7
  %9 = urem i32 %4, 6
  %10 = mul i32 %9, 512
  %11 = add i32 %10, %6
  %12 = call bfloat @fused_convert_param_0_189(ptr %0, i32 %5, i32 %11)
  %13 = fpext bfloat %12 to float
  %14 = fneg float %13
  %15 = fptrunc float %14 to bfloat
  %16 = fpext bfloat %15 to float
  %17 = call float @__nv_fast_expf(float %16)
  %18 = fptrunc float %17 to bfloat
  %19 = fpext bfloat %18 to float
  %20 = fadd float %19, 1.000000e+00
  %21 = fdiv float 1.000000e+00, %20
  %22 = add i32 %11, 3072
  %23 = call bfloat @fused_convert_param_0_189(ptr %0, i32 %5, i32 %22)
  %24 = fmul float %13, %21
  %25 = fpext bfloat %23 to float
  %26 = fmul float %24, %25
  %27 = fptrunc float %26 to bfloat
  %28 = insertelement <4 x bfloat> zeroinitializer, bfloat %27, i64 0
  %29 = add i32 %11, 1
  %30 = call bfloat @fused_convert_param_0_189(ptr %0, i32 %5, i32 %29)
  %31 = fpext bfloat %30 to float
  %32 = fneg float %31
  %33 = fptrunc float %32 to bfloat
  %34 = fpext bfloat %33 to float
  %35 = call float @__nv_fast_expf(float %34)
  %36 = fptrunc float %35 to bfloat
  %37 = fpext bfloat %36 to float
  %38 = fadd float %37, 1.000000e+00
  %39 = fdiv float 1.000000e+00, %38
  %40 = add i32 %29, 3072
  %41 = call bfloat @fused_convert_param_0_189(ptr %0, i32 %5, i32 %40)
  %42 = fmul float %31, %39
  %43 = fpext bfloat %41 to float
  %44 = fmul float %42, %43
  %45 = fptrunc float %44 to bfloat
  %46 = insertelement <4 x bfloat> %28, bfloat %45, i64 1
  %47 = add i32 %11, 2
  %48 = call bfloat @fused_convert_param_0_189(ptr %0, i32 %5, i32 %47)
  %49 = fpext bfloat %48 to float
  %50 = fneg float %49
  %51 = fptrunc float %50 to bfloat
  %52 = fpext bfloat %51 to float
  %53 = call float @__nv_fast_expf(float %52)
  %54 = fptrunc float %53 to bfloat
  %55 = fpext bfloat %54 to float
  %56 = fadd float %55, 1.000000e+00
  %57 = fdiv float 1.000000e+00, %56
  %58 = add i32 %47, 3072
  %59 = call bfloat @fused_convert_param_0_189(ptr %0, i32 %5, i32 %58)
  %60 = fmul float %49, %57
  %61 = fpext bfloat %59 to float
  %62 = fmul float %60, %61
  %63 = fptrunc float %62 to bfloat
  %64 = insertelement <4 x bfloat> %46, bfloat %63, i64 2
  %65 = add i32 %11, 3
  %66 = call bfloat @fused_convert_param_0_189(ptr %0, i32 %5, i32 %65)
  %67 = fpext bfloat %66 to float
  %68 = fneg float %67
  %69 = fptrunc float %68 to bfloat
  %70 = fpext bfloat %69 to float
  %71 = call float @__nv_fast_expf(float %70)
  %72 = fptrunc float %71 to bfloat
  %73 = fpext bfloat %72 to float
  %74 = fadd float %73, 1.000000e+00
  %75 = fdiv float 1.000000e+00, %74
  %76 = add i32 %65, 3072
  %77 = call bfloat @fused_convert_param_0_189(ptr %0, i32 %5, i32 %76)
  %78 = fmul float %67, %75
  %79 = fpext bfloat %77 to float
  %80 = fmul float %78, %79
  %81 = fptrunc float %80 to bfloat
  %82 = insertelement <4 x bfloat> %64, bfloat %81, i64 3
  %83 = getelementptr inbounds bfloat, ptr %1, i32 %8
  store <4 x bfloat> %82, ptr %83, align 8
  ret void
}

define internal bfloat @fused_convert_param_0_189(ptr noalias %0, i32 %1, i32 %2) {
  %4 = mul i32 %1, 6144
  %5 = add i32 %4, %2
  %6 = getelementptr inbounds bfloat, ptr %0, i32 %5
  %7 = load bfloat, ptr %6, align 2, !invariant.load !3
  ret bfloat %7
}

declare float @__nv_fast_expf(float)

declare ptx_kernel void @fusion_52_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_52(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(262144) %arg2, ptr noalias align 128 dereferenceable(786432) %arg3, ptr noalias align 128 dereferenceable(262144) %arg4, ptr noalias align 128 dereferenceable(262144) %arg5) #6 {
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

declare ptx_kernel void @fusion_50_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_50(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(262144) %arg1, ptr noalias align 128 dereferenceable(786432) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(262144) %arg4, ptr noalias align 128 dereferenceable(262144) %arg5, ptr noalias align 128 dereferenceable(262144) %arg6) #6 {
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
  %12 = getelementptr bfloat, ptr addrspace(1) %3, i64 %11
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
  %99 = getelementptr bfloat, ptr addrspace(1) %2, i64 %98
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
  %153 = getelementptr bfloat, ptr addrspace(1) %3, i64 %152
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
  %260 = getelementptr bfloat, ptr addrspace(1) %3, i64 %259
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
  %549 = getelementptr bfloat, ptr addrspace(1) %4, i64 %44
  %550 = getelementptr bfloat, ptr addrspace(1) %4, i64 %45
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

declare ptx_kernel void @fusion_48_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_48(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(262144) %arg1, ptr noalias align 128 dereferenceable(262144) %arg2, ptr noalias align 128 dereferenceable(786432) %arg3, ptr noalias align 16 dereferenceable(2048) %arg4, ptr noalias align 128 dereferenceable(262144) %arg5, ptr noalias align 128 dereferenceable(262144) %arg6, ptr noalias align 128 dereferenceable(262144) %arg7) #6 {
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
  %100 = getelementptr bfloat, ptr addrspace(1) %4, i64 %99
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
  %153 = getelementptr bfloat, ptr addrspace(1) %3, i64 %12
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
  %207 = getelementptr bfloat, ptr addrspace(1) %4, i64 %206
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
  %314 = getelementptr bfloat, ptr addrspace(1) %4, i64 %313
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
  %619 = getelementptr bfloat, ptr addrspace(1) %5, i64 %45
  %620 = getelementptr bfloat, ptr addrspace(1) %5, i64 %46
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

define ptx_kernel void @wrapped_slice(ptr noalias align 128 dereferenceable(1048576) %0, ptr noalias align 128 dereferenceable(262144) %1) #0 {
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

declare ptx_kernel void @triton_softmax_5_0_impl(ptr, ptr, ptr, ptr) #4

define ptx_kernel void @triton_softmax_5_0(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(1048576) %arg1, ptr noalias align 128 dereferenceable(524288) %arg2) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr null to ptr addrspace(1)
  %5 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %6 = sext i32 %5 to i64
  %7 = urem i64 %6, 2
  %8 = mul i64 %7, 512
  %9 = udiv i64 %6, 2
  %10 = mul i64 %9, 4096
  %11 = add i64 %8, %10
  %12 = add i64 %11, 2048
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
  %42 = add i32 %41, 0
  %43 = sext i32 %42 to i64
  %44 = getelementptr bfloat, ptr addrspace(1) %13, i64 %43
  %45 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %44)
  %46 = extractvalue { i32, i32, i32, i32 } %45, 0
  %47 = bitcast i32 %46 to <2 x bfloat>
  %48 = extractvalue { i32, i32, i32, i32 } %45, 1
  %49 = bitcast i32 %48 to <2 x bfloat>
  %50 = extractvalue { i32, i32, i32, i32 } %45, 2
  %51 = bitcast i32 %50 to <2 x bfloat>
  %52 = extractvalue { i32, i32, i32, i32 } %45, 3
  %53 = bitcast i32 %52 to <2 x bfloat>
  %54 = extractelement <2 x bfloat> %47, i32 0
  %55 = extractelement <2 x bfloat> %47, i32 1
  %56 = extractelement <2 x bfloat> %49, i32 0
  %57 = extractelement <2 x bfloat> %49, i32 1
  %58 = extractelement <2 x bfloat> %51, i32 0
  %59 = extractelement <2 x bfloat> %51, i32 1
  %60 = extractelement <2 x bfloat> %53, i32 0
  %61 = extractelement <2 x bfloat> %53, i32 1
  %62 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %54)
  %63 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %55)
  %64 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %56)
  %65 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %57)
  %66 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %58)
  %67 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %59)
  %68 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %60)
  %69 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %61)
  %70 = fmul float %62, %62
  %71 = fmul float %63, %63
  %72 = fmul float %64, %64
  %73 = fmul float %65, %65
  %74 = fmul float %66, %66
  %75 = fmul float %67, %67
  %76 = fmul float %68, %68
  %77 = fmul float %69, %69
  %78 = fadd float %70, %71
  %79 = fadd float %78, %72
  %80 = fadd float %79, %73
  %81 = fadd float %80, %74
  %82 = fadd float %81, %75
  %83 = fadd float %82, %76
  %84 = fadd float %83, %77
  %85 = bitcast float %84 to i32
  %86 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %85, i32 8, i32 31)
  %87 = bitcast i32 %86 to float
  %88 = fadd float %84, %87
  %89 = bitcast float %88 to i32
  %90 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %89, i32 4, i32 31)
  %91 = bitcast i32 %90 to float
  %92 = fadd float %88, %91
  %93 = bitcast float %92 to i32
  %94 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %93, i32 2, i32 31)
  %95 = bitcast i32 %94 to float
  %96 = fadd float %92, %95
  %97 = bitcast float %96 to i32
  %98 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %97, i32 1, i32 31)
  %99 = bitcast i32 %98 to float
  %100 = fadd float %96, %99
  %101 = fmul float %100, 7.812500e-03
  %102 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %103 = bitcast i32 %102 to <1 x float>
  %104 = extractelement <1 x float> %103, i32 0
  %105 = fadd float %101, %104
  %106 = call float @__nv_rsqrtf(float %105)
  %107 = fmul float %62, %106
  %108 = fmul float %63, %106
  %109 = fmul float %64, %106
  %110 = fmul float %65, %106
  %111 = fmul float %66, %106
  %112 = fmul float %67, %106
  %113 = fmul float %68, %106
  %114 = fmul float %69, %106
  %115 = mul i64 %6, 512
  %116 = getelementptr float, ptr addrspace(1) %3, i64 %115
  %117 = select i1 %38, i32 0, i32 1
  %118 = xor i32 0, %117
  %119 = xor i32 %118, 0
  %120 = xor i32 %118, 2
  %121 = add i32 %119, 0
  %122 = add i32 %120, 0
  %123 = sext i32 %121 to i64
  %124 = sext i32 %122 to i64
  %125 = mul i64 %123, 128
  %126 = mul i64 %124, 128
  %127 = select i1 %18, i32 0, i32 4
  %128 = xor i32 0, %127
  %129 = select i1 %22, i32 0, i32 8
  %130 = xor i32 %128, %129
  %131 = select i1 %26, i32 0, i32 16
  %132 = xor i32 %130, %131
  %133 = select i1 %30, i32 0, i32 32
  %134 = xor i32 %132, %133
  %135 = select i1 %34, i32 0, i32 64
  %136 = xor i32 %134, %135
  %137 = xor i32 %136, 0
  %138 = add i32 %137, 0
  %139 = sext i32 %138 to i64
  %140 = add i64 %125, %139
  %141 = add i64 %126, %139
  %142 = getelementptr float, ptr addrspace(1) %116, i64 %140
  %143 = getelementptr float, ptr addrspace(1) %116, i64 %141
  %144 = select i1 %38, i32 0, i32 128
  %145 = xor i32 %136, %144
  %146 = lshr i32 %41, 7
  %147 = shl i32 %146, 3
  %148 = add i32 %147, %41
  %149 = getelementptr inbounds float, ptr addrspace(3) @global_smem, i32 %148
  %150 = insertelement <8 x float> undef, float %107, i32 0
  %151 = insertelement <8 x float> %150, float %108, i32 1
  %152 = insertelement <8 x float> %151, float %109, i32 2
  %153 = insertelement <8 x float> %152, float %110, i32 3
  %154 = insertelement <8 x float> %153, float %111, i32 4
  %155 = insertelement <8 x float> %154, float %112, i32 5
  %156 = insertelement <8 x float> %155, float %113, i32 6
  %157 = insertelement <8 x float> %156, float %114, i32 7
  %158 = extractelement <8 x float> %157, i32 0
  %159 = extractelement <8 x float> %157, i32 1
  %160 = extractelement <8 x float> %157, i32 2
  %161 = extractelement <8 x float> %157, i32 3
  %162 = extractelement <8 x float> %157, i32 4
  %163 = extractelement <8 x float> %157, i32 5
  %164 = extractelement <8 x float> %157, i32 6
  %165 = extractelement <8 x float> %157, i32 7
  %166 = bitcast float %158 to i32
  %167 = bitcast float %159 to i32
  %168 = bitcast float %160 to i32
  %169 = bitcast float %161 to i32
  %170 = bitcast float %162 to i32
  %171 = bitcast float %163 to i32
  %172 = bitcast float %164 to i32
  %173 = bitcast float %165 to i32
  %174 = insertelement <8 x i32> undef, i32 %166, i32 0
  %175 = insertelement <8 x i32> %174, i32 %167, i32 1
  %176 = insertelement <8 x i32> %175, i32 %168, i32 2
  %177 = insertelement <8 x i32> %176, i32 %169, i32 3
  %178 = insertelement <8 x i32> %177, i32 %170, i32 4
  %179 = insertelement <8 x i32> %178, i32 %171, i32 5
  %180 = insertelement <8 x i32> %179, i32 %172, i32 6
  %181 = insertelement <8 x i32> %180, i32 %173, i32 7
  %182 = extractelement <8 x i32> %181, i32 0
  %183 = extractelement <8 x i32> %181, i32 1
  %184 = extractelement <8 x i32> %181, i32 2
  %185 = extractelement <8 x i32> %181, i32 3
  %186 = extractelement <8 x i32> %181, i32 4
  %187 = extractelement <8 x i32> %181, i32 5
  %188 = extractelement <8 x i32> %181, i32 6
  %189 = extractelement <8 x i32> %181, i32 7
  %190 = insertelement <4 x i32> undef, i32 %182, i32 0
  %191 = insertelement <4 x i32> %190, i32 %183, i32 1
  %192 = insertelement <4 x i32> %191, i32 %184, i32 2
  %193 = insertelement <4 x i32> %192, i32 %185, i32 3
  %194 = extractelement <4 x i32> %193, i32 0
  %195 = extractelement <4 x i32> %193, i32 1
  %196 = extractelement <4 x i32> %193, i32 2
  %197 = extractelement <4 x i32> %193, i32 3
  call void asm sideeffect "@$5 st.shared.v4.b32 [ $0 + 0 ], { $1, $2, $3, $4 };", "r,r,r,r,r,b"(ptr addrspace(3) %149, i32 %194, i32 %195, i32 %196, i32 %197, i1 true)
  %198 = getelementptr inbounds i32, ptr addrspace(3) %149, i32 4
  %199 = insertelement <4 x i32> undef, i32 %186, i32 0
  %200 = insertelement <4 x i32> %199, i32 %187, i32 1
  %201 = insertelement <4 x i32> %200, i32 %188, i32 2
  %202 = insertelement <4 x i32> %201, i32 %189, i32 3
  %203 = extractelement <4 x i32> %202, i32 0
  %204 = extractelement <4 x i32> %202, i32 1
  %205 = extractelement <4 x i32> %202, i32 2
  %206 = extractelement <4 x i32> %202, i32 3
  call void asm sideeffect "@$5 st.shared.v4.b32 [ $0 + 0 ], { $1, $2, $3, $4 };", "r,r,r,r,r,b"(ptr addrspace(3) %198, i32 %203, i32 %204, i32 %205, i32 %206, i1 true)
  call void @llvm.nvvm.barrier0()
  %207 = xor i32 %145, 0
  %208 = lshr i32 %207, 7
  %209 = shl i32 %208, 3
  %210 = add i32 %209, %207
  %211 = getelementptr inbounds float, ptr addrspace(3) @global_smem, i32 %210
  %212 = load <4 x i32>, ptr addrspace(3) %211, align 16
  %213 = extractelement <4 x i32> %212, i32 0
  %214 = extractelement <4 x i32> %212, i32 1
  %215 = extractelement <4 x i32> %212, i32 2
  %216 = extractelement <4 x i32> %212, i32 3
  %217 = insertelement <4 x i32> undef, i32 %213, i32 0
  %218 = insertelement <4 x i32> %217, i32 %214, i32 1
  %219 = insertelement <4 x i32> %218, i32 %215, i32 2
  %220 = insertelement <4 x i32> %219, i32 %216, i32 3
  %221 = extractelement <4 x i32> %220, i32 0
  %222 = extractelement <4 x i32> %220, i32 1
  %223 = extractelement <4 x i32> %220, i32 2
  %224 = extractelement <4 x i32> %220, i32 3
  %225 = bitcast i32 %221 to float
  %226 = bitcast i32 %222 to float
  %227 = bitcast i32 %223 to float
  %228 = bitcast i32 %224 to float
  %229 = insertelement <4 x float> undef, float %225, i32 0
  %230 = insertelement <4 x float> %229, float %226, i32 1
  %231 = insertelement <4 x float> %230, float %227, i32 2
  %232 = insertelement <4 x float> %231, float %228, i32 3
  %233 = extractelement <4 x float> %232, i32 0
  %234 = extractelement <4 x float> %232, i32 1
  %235 = extractelement <4 x float> %232, i32 2
  %236 = extractelement <4 x float> %232, i32 3
  %237 = xor i32 %145, 256
  %238 = lshr i32 %237, 7
  %239 = shl i32 %238, 3
  %240 = add i32 %239, %237
  %241 = getelementptr inbounds float, ptr addrspace(3) @global_smem, i32 %240
  %242 = load <4 x i32>, ptr addrspace(3) %241, align 16
  %243 = extractelement <4 x i32> %242, i32 0
  %244 = extractelement <4 x i32> %242, i32 1
  %245 = extractelement <4 x i32> %242, i32 2
  %246 = extractelement <4 x i32> %242, i32 3
  %247 = insertelement <4 x i32> undef, i32 %243, i32 0
  %248 = insertelement <4 x i32> %247, i32 %244, i32 1
  %249 = insertelement <4 x i32> %248, i32 %245, i32 2
  %250 = insertelement <4 x i32> %249, i32 %246, i32 3
  %251 = extractelement <4 x i32> %250, i32 0
  %252 = extractelement <4 x i32> %250, i32 1
  %253 = extractelement <4 x i32> %250, i32 2
  %254 = extractelement <4 x i32> %250, i32 3
  %255 = bitcast i32 %251 to float
  %256 = bitcast i32 %252 to float
  %257 = bitcast i32 %253 to float
  %258 = bitcast i32 %254 to float
  %259 = insertelement <4 x float> undef, float %255, i32 0
  %260 = insertelement <4 x float> %259, float %256, i32 1
  %261 = insertelement <4 x float> %260, float %257, i32 2
  %262 = insertelement <4 x float> %261, float %258, i32 3
  %263 = extractelement <4 x float> %262, i32 0
  %264 = extractelement <4 x float> %262, i32 1
  %265 = extractelement <4 x float> %262, i32 2
  %266 = extractelement <4 x float> %262, i32 3
  %267 = insertelement <1 x float> undef, float %233, i32 0
  %268 = bitcast <1 x float> %267 to i32
  %269 = insertelement <1 x float> undef, float %234, i32 0
  %270 = bitcast <1 x float> %269 to i32
  %271 = insertelement <1 x float> undef, float %235, i32 0
  %272 = bitcast <1 x float> %271 to i32
  %273 = insertelement <1 x float> undef, float %236, i32 0
  %274 = bitcast <1 x float> %273 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %268, i32 %270, i32 %272, i32 %274, ptr addrspace(1) %142)
  %275 = insertelement <1 x float> undef, float %263, i32 0
  %276 = bitcast <1 x float> %275 to i32
  %277 = insertelement <1 x float> undef, float %264, i32 0
  %278 = bitcast <1 x float> %277 to i32
  %279 = insertelement <1 x float> undef, float %265, i32 0
  %280 = bitcast <1 x float> %279 to i32
  %281 = insertelement <1 x float> undef, float %266, i32 0
  %282 = bitcast <1 x float> %281 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %276, i32 %278, i32 %280, i32 %282, ptr addrspace(1) %143)
  ret void

entry:                                            ; No predecessors!
  ret void
}

define ptx_kernel void @input_concatenate_fusion(ptr noalias align 128 dereferenceable(524288) %0, ptr noalias align 16 dereferenceable(256) %1, ptr noalias align 16 dereferenceable(10485760) %2, ptr noalias align 16 dereferenceable(512) %3, ptr noalias align 128 dereferenceable(262144) %4) #0 {
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %8 = udiv i32 %7, 4
  %9 = urem i32 %6, 64
  %10 = udiv i32 %6, 64
  %11 = mul i32 %10, 128
  %12 = mul i32 %7, 256
  %13 = add i32 %11, %12
  %14 = add i32 %13, %9
  %15 = getelementptr inbounds float, ptr %0, i32 %14
  %16 = load float, ptr %15, align 4, !invariant.load !3
  %17 = getelementptr inbounds bfloat, ptr %1, i32 %9
  %18 = load bfloat, ptr %17, align 2, !invariant.load !3
  %19 = fpext bfloat %18 to float
  %20 = fmul float %16, %19
  %21 = call float @fused_concatenate_convert_255_7(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %9)
  %22 = fmul float %20, %21
  %23 = add i32 %9, 64
  %24 = add i32 %14, 64
  %25 = getelementptr inbounds float, ptr %0, i32 %24
  %26 = load float, ptr %25, align 4, !invariant.load !3
  %27 = getelementptr inbounds bfloat, ptr %1, i32 %23
  %28 = load bfloat, ptr %27, align 2, !invariant.load !3
  %29 = fpext bfloat %28 to float
  %30 = fmul float %26, %29
  %31 = call float @fused_concatenate_convert_255_7(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %23)
  %32 = fmul float %30, %31
  %33 = fsub float %22, %32
  %34 = fptrunc float %33 to bfloat
  %35 = getelementptr inbounds bfloat, ptr %4, i32 %14
  store bfloat %34, ptr %35, align 2
  %36 = load float, ptr %25, align 4, !invariant.load !3
  %37 = load bfloat, ptr %27, align 2, !invariant.load !3
  %38 = fpext bfloat %37 to float
  %39 = fmul float %36, %38
  %40 = call float @fused_concatenate_convert_255_7(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %9)
  %41 = fmul float %39, %40
  %42 = load float, ptr %15, align 4, !invariant.load !3
  %43 = load bfloat, ptr %17, align 2, !invariant.load !3
  %44 = fpext bfloat %43 to float
  %45 = fmul float %42, %44
  %46 = call float @fused_concatenate_convert_255_7(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %23)
  %47 = fmul float %45, %46
  %48 = fadd float %41, %47
  %49 = fptrunc float %48 to bfloat
  %50 = getelementptr inbounds bfloat, ptr %4, i32 %24
  store bfloat %49, ptr %50, align 2
  ret void
}

define internal float @fused_concatenate_convert_255_7(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, i32 %4, i32 %5) {
  %7 = getelementptr inbounds i32, ptr %3, i32 %4
  %8 = load i32, ptr %7, align 4, !invariant.load !3
  %9 = call i32 @llvm.smin.i32(i32 %8, i32 40959)
  %10 = call i32 @llvm.smax.i32(i32 %9, i32 0)
  %11 = mul i32 %10, 128
  %12 = add i32 %11, %5
  %13 = getelementptr inbounds bfloat, ptr %2, i32 %12
  %14 = load bfloat, ptr %13, align 2, !invariant.load !3
  %15 = fpext bfloat %14 to float
  ret float %15
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #1

define ptx_kernel void @loop_slice_fusion(ptr noalias align 16 dereferenceable(277413888) %0, ptr noalias align 128 dereferenceable(138706944) %1) #0 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
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
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
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
!2 = !{i32 0, i32 1024}
!3 = !{}
!4 = !{i32 0, i32 768}
!5 = !{i32 0, i32 512}
!6 = !{i32 0, i32 135456}

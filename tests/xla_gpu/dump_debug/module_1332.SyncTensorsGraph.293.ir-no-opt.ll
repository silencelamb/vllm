; ModuleID = 'SyncTensorsGraph.293'
source_filename = "SyncTensorsGraph.293"
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

declare ptx_kernel void @gemm_fusion_dot_7_0_impl(ptr, ptr, ptr, ptr) #2

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #3

define ptx_kernel void @gemm_fusion_dot_7_0(ptr noalias align 16 dereferenceable(4194304) %arg0, ptr noalias align 16 dereferenceable(4194304) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2) #0 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr null to ptr addrspace(1)
  %5 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %6 = sdiv i32 %5, 8
  %7 = mul i32 %6, 8
  %8 = sub i32 64, %7
  %9 = icmp slt i32 %8, 8
  %10 = select i1 %9, i32 %8, i32 8
  %11 = srem i32 %5, %10
  %12 = add i32 %7, %11
  %13 = srem i32 %5, 8
  %14 = sdiv i32 %13, %10
  %15 = mul i32 %12, 32
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
  %35 = xor i32 %30, 16
  %36 = xor i32 %30, 20
  %37 = xor i32 %30, 24
  %38 = xor i32 %30, 28
  %39 = add i32 %31, 0
  %40 = add i32 %32, 0
  %41 = add i32 %33, 0
  %42 = add i32 %34, 0
  %43 = add i32 %35, 0
  %44 = add i32 %36, 0
  %45 = add i32 %37, 0
  %46 = add i32 %38, 0
  %47 = sext i32 %39 to i64
  %48 = sext i32 %40 to i64
  %49 = sext i32 %41 to i64
  %50 = sext i32 %42 to i64
  %51 = sext i32 %43 to i64
  %52 = sext i32 %44 to i64
  %53 = sext i32 %45 to i64
  %54 = sext i32 %46 to i64
  %55 = add i64 %20, %47
  %56 = add i64 %20, %48
  %57 = add i64 %20, %49
  %58 = add i64 %20, %50
  %59 = add i64 %20, %51
  %60 = add i64 %20, %52
  %61 = add i64 %20, %53
  %62 = add i64 %20, %54
  %63 = mul i64 %55, 2048
  %64 = mul i64 %56, 2048
  %65 = mul i64 %57, 2048
  %66 = mul i64 %58, 2048
  %67 = mul i64 %59, 2048
  %68 = mul i64 %60, 2048
  %69 = mul i64 %61, 2048
  %70 = mul i64 %62, 2048
  %71 = urem i32 %21, 32
  %72 = and i32 %71, 1
  %73 = icmp eq i32 %72, 0
  %74 = select i1 %73, i32 0, i32 8
  %75 = xor i32 0, %74
  %76 = and i32 %71, 2
  %77 = icmp eq i32 %76, 0
  %78 = select i1 %77, i32 0, i32 16
  %79 = xor i32 %75, %78
  %80 = and i32 %71, 4
  %81 = icmp eq i32 %80, 0
  %82 = select i1 %81, i32 0, i32 32
  %83 = xor i32 %79, %82
  %84 = and i32 %71, 8
  %85 = icmp eq i32 %84, 0
  %86 = select i1 %85, i32 0, i32 64
  %87 = xor i32 %83, %86
  %88 = and i32 %71, 16
  %89 = icmp eq i32 %88, 0
  %90 = select i1 %89, i32 0, i32 128
  %91 = xor i32 %87, %90
  %92 = xor i32 %91, 0
  %93 = add i32 %92, 0
  %94 = sext i32 %93 to i64
  br label %95

95:                                               ; preds = %100, %0
  %96 = phi i32 [ %1154, %100 ], [ 0, %0 ]
  %97 = phi i64 [ %379, %100 ], [ 0, %0 ]
  %98 = phi { float, float, float, float, float, float, float, float } [ %1153, %100 ], [ zeroinitializer, %0 ]
  %99 = icmp slt i32 %96, 2048
  br i1 %99, label %100, label %1155

100:                                              ; preds = %95
  %101 = add i64 %97, %94
  %102 = add i64 %63, %101
  %103 = add i64 %64, %101
  %104 = add i64 %65, %101
  %105 = add i64 %66, %101
  %106 = add i64 %67, %101
  %107 = add i64 %68, %101
  %108 = add i64 %69, %101
  %109 = add i64 %70, %101
  %110 = getelementptr bfloat, ptr addrspace(1) %17, i64 %102
  %111 = getelementptr bfloat, ptr addrspace(1) %17, i64 %103
  %112 = getelementptr bfloat, ptr addrspace(1) %17, i64 %104
  %113 = getelementptr bfloat, ptr addrspace(1) %17, i64 %105
  %114 = getelementptr bfloat, ptr addrspace(1) %17, i64 %106
  %115 = getelementptr bfloat, ptr addrspace(1) %17, i64 %107
  %116 = getelementptr bfloat, ptr addrspace(1) %17, i64 %108
  %117 = getelementptr bfloat, ptr addrspace(1) %17, i64 %109
  %118 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %110)
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
  %135 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %111)
  %136 = extractvalue { i32, i32, i32, i32 } %135, 0
  %137 = bitcast i32 %136 to <2 x bfloat>
  %138 = extractvalue { i32, i32, i32, i32 } %135, 1
  %139 = bitcast i32 %138 to <2 x bfloat>
  %140 = extractvalue { i32, i32, i32, i32 } %135, 2
  %141 = bitcast i32 %140 to <2 x bfloat>
  %142 = extractvalue { i32, i32, i32, i32 } %135, 3
  %143 = bitcast i32 %142 to <2 x bfloat>
  %144 = extractelement <2 x bfloat> %137, i32 0
  %145 = extractelement <2 x bfloat> %137, i32 1
  %146 = extractelement <2 x bfloat> %139, i32 0
  %147 = extractelement <2 x bfloat> %139, i32 1
  %148 = extractelement <2 x bfloat> %141, i32 0
  %149 = extractelement <2 x bfloat> %141, i32 1
  %150 = extractelement <2 x bfloat> %143, i32 0
  %151 = extractelement <2 x bfloat> %143, i32 1
  %152 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %112)
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
  %169 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %113)
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
  %186 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %114)
  %187 = extractvalue { i32, i32, i32, i32 } %186, 0
  %188 = bitcast i32 %187 to <2 x bfloat>
  %189 = extractvalue { i32, i32, i32, i32 } %186, 1
  %190 = bitcast i32 %189 to <2 x bfloat>
  %191 = extractvalue { i32, i32, i32, i32 } %186, 2
  %192 = bitcast i32 %191 to <2 x bfloat>
  %193 = extractvalue { i32, i32, i32, i32 } %186, 3
  %194 = bitcast i32 %193 to <2 x bfloat>
  %195 = extractelement <2 x bfloat> %188, i32 0
  %196 = extractelement <2 x bfloat> %188, i32 1
  %197 = extractelement <2 x bfloat> %190, i32 0
  %198 = extractelement <2 x bfloat> %190, i32 1
  %199 = extractelement <2 x bfloat> %192, i32 0
  %200 = extractelement <2 x bfloat> %192, i32 1
  %201 = extractelement <2 x bfloat> %194, i32 0
  %202 = extractelement <2 x bfloat> %194, i32 1
  %203 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %115)
  %204 = extractvalue { i32, i32, i32, i32 } %203, 0
  %205 = bitcast i32 %204 to <2 x bfloat>
  %206 = extractvalue { i32, i32, i32, i32 } %203, 1
  %207 = bitcast i32 %206 to <2 x bfloat>
  %208 = extractvalue { i32, i32, i32, i32 } %203, 2
  %209 = bitcast i32 %208 to <2 x bfloat>
  %210 = extractvalue { i32, i32, i32, i32 } %203, 3
  %211 = bitcast i32 %210 to <2 x bfloat>
  %212 = extractelement <2 x bfloat> %205, i32 0
  %213 = extractelement <2 x bfloat> %205, i32 1
  %214 = extractelement <2 x bfloat> %207, i32 0
  %215 = extractelement <2 x bfloat> %207, i32 1
  %216 = extractelement <2 x bfloat> %209, i32 0
  %217 = extractelement <2 x bfloat> %209, i32 1
  %218 = extractelement <2 x bfloat> %211, i32 0
  %219 = extractelement <2 x bfloat> %211, i32 1
  %220 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %116)
  %221 = extractvalue { i32, i32, i32, i32 } %220, 0
  %222 = bitcast i32 %221 to <2 x bfloat>
  %223 = extractvalue { i32, i32, i32, i32 } %220, 1
  %224 = bitcast i32 %223 to <2 x bfloat>
  %225 = extractvalue { i32, i32, i32, i32 } %220, 2
  %226 = bitcast i32 %225 to <2 x bfloat>
  %227 = extractvalue { i32, i32, i32, i32 } %220, 3
  %228 = bitcast i32 %227 to <2 x bfloat>
  %229 = extractelement <2 x bfloat> %222, i32 0
  %230 = extractelement <2 x bfloat> %222, i32 1
  %231 = extractelement <2 x bfloat> %224, i32 0
  %232 = extractelement <2 x bfloat> %224, i32 1
  %233 = extractelement <2 x bfloat> %226, i32 0
  %234 = extractelement <2 x bfloat> %226, i32 1
  %235 = extractelement <2 x bfloat> %228, i32 0
  %236 = extractelement <2 x bfloat> %228, i32 1
  %237 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %117)
  %238 = extractvalue { i32, i32, i32, i32 } %237, 0
  %239 = bitcast i32 %238 to <2 x bfloat>
  %240 = extractvalue { i32, i32, i32, i32 } %237, 1
  %241 = bitcast i32 %240 to <2 x bfloat>
  %242 = extractvalue { i32, i32, i32, i32 } %237, 2
  %243 = bitcast i32 %242 to <2 x bfloat>
  %244 = extractvalue { i32, i32, i32, i32 } %237, 3
  %245 = bitcast i32 %244 to <2 x bfloat>
  %246 = extractelement <2 x bfloat> %239, i32 0
  %247 = extractelement <2 x bfloat> %239, i32 1
  %248 = extractelement <2 x bfloat> %241, i32 0
  %249 = extractelement <2 x bfloat> %241, i32 1
  %250 = extractelement <2 x bfloat> %243, i32 0
  %251 = extractelement <2 x bfloat> %243, i32 1
  %252 = extractelement <2 x bfloat> %245, i32 0
  %253 = extractelement <2 x bfloat> %245, i32 1
  call void @llvm.nvvm.barrier0()
  %254 = select i1 %24, i32 0, i32 264
  %255 = xor i32 %91, %254
  %256 = select i1 %28, i32 0, i32 528
  %257 = xor i32 %255, %256
  %258 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %257
  %259 = insertelement <8 x bfloat> undef, bfloat %127, i32 0
  %260 = insertelement <8 x bfloat> %259, bfloat %128, i32 1
  %261 = insertelement <8 x bfloat> %260, bfloat %129, i32 2
  %262 = insertelement <8 x bfloat> %261, bfloat %130, i32 3
  %263 = insertelement <8 x bfloat> %262, bfloat %131, i32 4
  %264 = insertelement <8 x bfloat> %263, bfloat %132, i32 5
  %265 = insertelement <8 x bfloat> %264, bfloat %133, i32 6
  %266 = insertelement <8 x bfloat> %265, bfloat %134, i32 7
  store <8 x bfloat> %266, ptr addrspace(3) %258, align 16
  %267 = xor i32 1056, %74
  %268 = xor i32 %267, %78
  %269 = xor i32 %268, %82
  %270 = xor i32 %269, %86
  %271 = xor i32 %270, %90
  %272 = xor i32 %271, %254
  %273 = xor i32 %272, %256
  %274 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %273
  %275 = insertelement <8 x bfloat> undef, bfloat %144, i32 0
  %276 = insertelement <8 x bfloat> %275, bfloat %145, i32 1
  %277 = insertelement <8 x bfloat> %276, bfloat %146, i32 2
  %278 = insertelement <8 x bfloat> %277, bfloat %147, i32 3
  %279 = insertelement <8 x bfloat> %278, bfloat %148, i32 4
  %280 = insertelement <8 x bfloat> %279, bfloat %149, i32 5
  %281 = insertelement <8 x bfloat> %280, bfloat %150, i32 6
  %282 = insertelement <8 x bfloat> %281, bfloat %151, i32 7
  store <8 x bfloat> %282, ptr addrspace(3) %274, align 16
  %283 = xor i32 2048, %74
  %284 = xor i32 %283, %78
  %285 = xor i32 %284, %82
  %286 = xor i32 %285, %86
  %287 = xor i32 %286, %90
  %288 = xor i32 %287, %254
  %289 = xor i32 %288, %256
  %290 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %289
  %291 = insertelement <8 x bfloat> undef, bfloat %161, i32 0
  %292 = insertelement <8 x bfloat> %291, bfloat %162, i32 1
  %293 = insertelement <8 x bfloat> %292, bfloat %163, i32 2
  %294 = insertelement <8 x bfloat> %293, bfloat %164, i32 3
  %295 = insertelement <8 x bfloat> %294, bfloat %165, i32 4
  %296 = insertelement <8 x bfloat> %295, bfloat %166, i32 5
  %297 = insertelement <8 x bfloat> %296, bfloat %167, i32 6
  %298 = insertelement <8 x bfloat> %297, bfloat %168, i32 7
  store <8 x bfloat> %298, ptr addrspace(3) %290, align 16
  %299 = xor i32 3104, %74
  %300 = xor i32 %299, %78
  %301 = xor i32 %300, %82
  %302 = xor i32 %301, %86
  %303 = xor i32 %302, %90
  %304 = xor i32 %303, %254
  %305 = xor i32 %304, %256
  %306 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %305
  %307 = insertelement <8 x bfloat> undef, bfloat %178, i32 0
  %308 = insertelement <8 x bfloat> %307, bfloat %179, i32 1
  %309 = insertelement <8 x bfloat> %308, bfloat %180, i32 2
  %310 = insertelement <8 x bfloat> %309, bfloat %181, i32 3
  %311 = insertelement <8 x bfloat> %310, bfloat %182, i32 4
  %312 = insertelement <8 x bfloat> %311, bfloat %183, i32 5
  %313 = insertelement <8 x bfloat> %312, bfloat %184, i32 6
  %314 = insertelement <8 x bfloat> %313, bfloat %185, i32 7
  store <8 x bfloat> %314, ptr addrspace(3) %306, align 16
  %315 = xor i32 4096, %74
  %316 = xor i32 %315, %78
  %317 = xor i32 %316, %82
  %318 = xor i32 %317, %86
  %319 = xor i32 %318, %90
  %320 = xor i32 %319, %254
  %321 = xor i32 %320, %256
  %322 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %321
  %323 = insertelement <8 x bfloat> undef, bfloat %195, i32 0
  %324 = insertelement <8 x bfloat> %323, bfloat %196, i32 1
  %325 = insertelement <8 x bfloat> %324, bfloat %197, i32 2
  %326 = insertelement <8 x bfloat> %325, bfloat %198, i32 3
  %327 = insertelement <8 x bfloat> %326, bfloat %199, i32 4
  %328 = insertelement <8 x bfloat> %327, bfloat %200, i32 5
  %329 = insertelement <8 x bfloat> %328, bfloat %201, i32 6
  %330 = insertelement <8 x bfloat> %329, bfloat %202, i32 7
  store <8 x bfloat> %330, ptr addrspace(3) %322, align 16
  %331 = xor i32 5152, %74
  %332 = xor i32 %331, %78
  %333 = xor i32 %332, %82
  %334 = xor i32 %333, %86
  %335 = xor i32 %334, %90
  %336 = xor i32 %335, %254
  %337 = xor i32 %336, %256
  %338 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %337
  %339 = insertelement <8 x bfloat> undef, bfloat %212, i32 0
  %340 = insertelement <8 x bfloat> %339, bfloat %213, i32 1
  %341 = insertelement <8 x bfloat> %340, bfloat %214, i32 2
  %342 = insertelement <8 x bfloat> %341, bfloat %215, i32 3
  %343 = insertelement <8 x bfloat> %342, bfloat %216, i32 4
  %344 = insertelement <8 x bfloat> %343, bfloat %217, i32 5
  %345 = insertelement <8 x bfloat> %344, bfloat %218, i32 6
  %346 = insertelement <8 x bfloat> %345, bfloat %219, i32 7
  store <8 x bfloat> %346, ptr addrspace(3) %338, align 16
  %347 = xor i32 6144, %74
  %348 = xor i32 %347, %78
  %349 = xor i32 %348, %82
  %350 = xor i32 %349, %86
  %351 = xor i32 %350, %90
  %352 = xor i32 %351, %254
  %353 = xor i32 %352, %256
  %354 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %353
  %355 = insertelement <8 x bfloat> undef, bfloat %229, i32 0
  %356 = insertelement <8 x bfloat> %355, bfloat %230, i32 1
  %357 = insertelement <8 x bfloat> %356, bfloat %231, i32 2
  %358 = insertelement <8 x bfloat> %357, bfloat %232, i32 3
  %359 = insertelement <8 x bfloat> %358, bfloat %233, i32 4
  %360 = insertelement <8 x bfloat> %359, bfloat %234, i32 5
  %361 = insertelement <8 x bfloat> %360, bfloat %235, i32 6
  %362 = insertelement <8 x bfloat> %361, bfloat %236, i32 7
  store <8 x bfloat> %362, ptr addrspace(3) %354, align 16
  %363 = xor i32 7200, %74
  %364 = xor i32 %363, %78
  %365 = xor i32 %364, %82
  %366 = xor i32 %365, %86
  %367 = xor i32 %366, %90
  %368 = xor i32 %367, %254
  %369 = xor i32 %368, %256
  %370 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %369
  %371 = insertelement <8 x bfloat> undef, bfloat %246, i32 0
  %372 = insertelement <8 x bfloat> %371, bfloat %247, i32 1
  %373 = insertelement <8 x bfloat> %372, bfloat %248, i32 2
  %374 = insertelement <8 x bfloat> %373, bfloat %249, i32 3
  %375 = insertelement <8 x bfloat> %374, bfloat %250, i32 4
  %376 = insertelement <8 x bfloat> %375, bfloat %251, i32 5
  %377 = insertelement <8 x bfloat> %376, bfloat %252, i32 6
  %378 = insertelement <8 x bfloat> %377, bfloat %253, i32 7
  store <8 x bfloat> %378, ptr addrspace(3) %370, align 16
  %379 = add i64 %97, 256
  call void @llvm.nvvm.barrier0()
  %380 = select i1 %73, i32 0, i32 264
  %381 = xor i32 0, %380
  %382 = select i1 %77, i32 0, i32 528
  %383 = xor i32 %381, %382
  %384 = select i1 %81, i32 0, i32 1056
  %385 = xor i32 %383, %384
  %386 = select i1 %85, i32 0, i32 2048
  %387 = xor i32 %385, %386
  %388 = select i1 %89, i32 0, i32 8
  %389 = xor i32 %387, %388
  %390 = select i1 %28, i32 0, i32 4096
  %391 = xor i32 %389, %390
  %392 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %391
  %393 = ptrtoint ptr addrspace(3) %392 to i32
  %394 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %393)
  %395 = extractvalue { i32, i32, i32, i32 } %394, 0
  %396 = extractvalue { i32, i32, i32, i32 } %394, 1
  %397 = extractvalue { i32, i32, i32, i32 } %394, 2
  %398 = extractvalue { i32, i32, i32, i32 } %394, 3
  %399 = xor i32 16, %380
  %400 = xor i32 %399, %382
  %401 = xor i32 %400, %384
  %402 = xor i32 %401, %386
  %403 = xor i32 %402, %388
  %404 = xor i32 %403, %390
  %405 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %404
  %406 = ptrtoint ptr addrspace(3) %405 to i32
  %407 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %406)
  %408 = extractvalue { i32, i32, i32, i32 } %407, 0
  %409 = extractvalue { i32, i32, i32, i32 } %407, 1
  %410 = extractvalue { i32, i32, i32, i32 } %407, 2
  %411 = extractvalue { i32, i32, i32, i32 } %407, 3
  %412 = xor i32 32, %380
  %413 = xor i32 %412, %382
  %414 = xor i32 %413, %384
  %415 = xor i32 %414, %386
  %416 = xor i32 %415, %388
  %417 = xor i32 %416, %390
  %418 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %417
  %419 = ptrtoint ptr addrspace(3) %418 to i32
  %420 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %419)
  %421 = extractvalue { i32, i32, i32, i32 } %420, 0
  %422 = extractvalue { i32, i32, i32, i32 } %420, 1
  %423 = extractvalue { i32, i32, i32, i32 } %420, 2
  %424 = extractvalue { i32, i32, i32, i32 } %420, 3
  %425 = xor i32 48, %380
  %426 = xor i32 %425, %382
  %427 = xor i32 %426, %384
  %428 = xor i32 %427, %386
  %429 = xor i32 %428, %388
  %430 = xor i32 %429, %390
  %431 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %430
  %432 = ptrtoint ptr addrspace(3) %431 to i32
  %433 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %432)
  %434 = extractvalue { i32, i32, i32, i32 } %433, 0
  %435 = extractvalue { i32, i32, i32, i32 } %433, 1
  %436 = extractvalue { i32, i32, i32, i32 } %433, 2
  %437 = extractvalue { i32, i32, i32, i32 } %433, 3
  %438 = xor i32 64, %380
  %439 = xor i32 %438, %382
  %440 = xor i32 %439, %384
  %441 = xor i32 %440, %386
  %442 = xor i32 %441, %388
  %443 = xor i32 %442, %390
  %444 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %443
  %445 = ptrtoint ptr addrspace(3) %444 to i32
  %446 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %445)
  %447 = extractvalue { i32, i32, i32, i32 } %446, 0
  %448 = extractvalue { i32, i32, i32, i32 } %446, 1
  %449 = extractvalue { i32, i32, i32, i32 } %446, 2
  %450 = extractvalue { i32, i32, i32, i32 } %446, 3
  %451 = xor i32 80, %380
  %452 = xor i32 %451, %382
  %453 = xor i32 %452, %384
  %454 = xor i32 %453, %386
  %455 = xor i32 %454, %388
  %456 = xor i32 %455, %390
  %457 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %456
  %458 = ptrtoint ptr addrspace(3) %457 to i32
  %459 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %458)
  %460 = extractvalue { i32, i32, i32, i32 } %459, 0
  %461 = extractvalue { i32, i32, i32, i32 } %459, 1
  %462 = extractvalue { i32, i32, i32, i32 } %459, 2
  %463 = extractvalue { i32, i32, i32, i32 } %459, 3
  %464 = xor i32 96, %380
  %465 = xor i32 %464, %382
  %466 = xor i32 %465, %384
  %467 = xor i32 %466, %386
  %468 = xor i32 %467, %388
  %469 = xor i32 %468, %390
  %470 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %469
  %471 = ptrtoint ptr addrspace(3) %470 to i32
  %472 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %471)
  %473 = extractvalue { i32, i32, i32, i32 } %472, 0
  %474 = extractvalue { i32, i32, i32, i32 } %472, 1
  %475 = extractvalue { i32, i32, i32, i32 } %472, 2
  %476 = extractvalue { i32, i32, i32, i32 } %472, 3
  %477 = xor i32 112, %380
  %478 = xor i32 %477, %382
  %479 = xor i32 %478, %384
  %480 = xor i32 %479, %386
  %481 = xor i32 %480, %388
  %482 = xor i32 %481, %390
  %483 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %482
  %484 = ptrtoint ptr addrspace(3) %483 to i32
  %485 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %484)
  %486 = extractvalue { i32, i32, i32, i32 } %485, 0
  %487 = extractvalue { i32, i32, i32, i32 } %485, 1
  %488 = extractvalue { i32, i32, i32, i32 } %485, 2
  %489 = extractvalue { i32, i32, i32, i32 } %485, 3
  %490 = xor i32 128, %380
  %491 = xor i32 %490, %382
  %492 = xor i32 %491, %384
  %493 = xor i32 %492, %386
  %494 = xor i32 %493, %388
  %495 = xor i32 %494, %390
  %496 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %495
  %497 = ptrtoint ptr addrspace(3) %496 to i32
  %498 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %497)
  %499 = extractvalue { i32, i32, i32, i32 } %498, 0
  %500 = extractvalue { i32, i32, i32, i32 } %498, 1
  %501 = extractvalue { i32, i32, i32, i32 } %498, 2
  %502 = extractvalue { i32, i32, i32, i32 } %498, 3
  %503 = xor i32 144, %380
  %504 = xor i32 %503, %382
  %505 = xor i32 %504, %384
  %506 = xor i32 %505, %386
  %507 = xor i32 %506, %388
  %508 = xor i32 %507, %390
  %509 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %508
  %510 = ptrtoint ptr addrspace(3) %509 to i32
  %511 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %510)
  %512 = extractvalue { i32, i32, i32, i32 } %511, 0
  %513 = extractvalue { i32, i32, i32, i32 } %511, 1
  %514 = extractvalue { i32, i32, i32, i32 } %511, 2
  %515 = extractvalue { i32, i32, i32, i32 } %511, 3
  %516 = xor i32 160, %380
  %517 = xor i32 %516, %382
  %518 = xor i32 %517, %384
  %519 = xor i32 %518, %386
  %520 = xor i32 %519, %388
  %521 = xor i32 %520, %390
  %522 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %521
  %523 = ptrtoint ptr addrspace(3) %522 to i32
  %524 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %523)
  %525 = extractvalue { i32, i32, i32, i32 } %524, 0
  %526 = extractvalue { i32, i32, i32, i32 } %524, 1
  %527 = extractvalue { i32, i32, i32, i32 } %524, 2
  %528 = extractvalue { i32, i32, i32, i32 } %524, 3
  %529 = xor i32 176, %380
  %530 = xor i32 %529, %382
  %531 = xor i32 %530, %384
  %532 = xor i32 %531, %386
  %533 = xor i32 %532, %388
  %534 = xor i32 %533, %390
  %535 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %534
  %536 = ptrtoint ptr addrspace(3) %535 to i32
  %537 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %536)
  %538 = extractvalue { i32, i32, i32, i32 } %537, 0
  %539 = extractvalue { i32, i32, i32, i32 } %537, 1
  %540 = extractvalue { i32, i32, i32, i32 } %537, 2
  %541 = extractvalue { i32, i32, i32, i32 } %537, 3
  %542 = xor i32 192, %380
  %543 = xor i32 %542, %382
  %544 = xor i32 %543, %384
  %545 = xor i32 %544, %386
  %546 = xor i32 %545, %388
  %547 = xor i32 %546, %390
  %548 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %547
  %549 = ptrtoint ptr addrspace(3) %548 to i32
  %550 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %549)
  %551 = extractvalue { i32, i32, i32, i32 } %550, 0
  %552 = extractvalue { i32, i32, i32, i32 } %550, 1
  %553 = extractvalue { i32, i32, i32, i32 } %550, 2
  %554 = extractvalue { i32, i32, i32, i32 } %550, 3
  %555 = xor i32 208, %380
  %556 = xor i32 %555, %382
  %557 = xor i32 %556, %384
  %558 = xor i32 %557, %386
  %559 = xor i32 %558, %388
  %560 = xor i32 %559, %390
  %561 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %560
  %562 = ptrtoint ptr addrspace(3) %561 to i32
  %563 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %562)
  %564 = extractvalue { i32, i32, i32, i32 } %563, 0
  %565 = extractvalue { i32, i32, i32, i32 } %563, 1
  %566 = extractvalue { i32, i32, i32, i32 } %563, 2
  %567 = extractvalue { i32, i32, i32, i32 } %563, 3
  %568 = xor i32 224, %380
  %569 = xor i32 %568, %382
  %570 = xor i32 %569, %384
  %571 = xor i32 %570, %386
  %572 = xor i32 %571, %388
  %573 = xor i32 %572, %390
  %574 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %573
  %575 = ptrtoint ptr addrspace(3) %574 to i32
  %576 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %575)
  %577 = extractvalue { i32, i32, i32, i32 } %576, 0
  %578 = extractvalue { i32, i32, i32, i32 } %576, 1
  %579 = extractvalue { i32, i32, i32, i32 } %576, 2
  %580 = extractvalue { i32, i32, i32, i32 } %576, 3
  %581 = xor i32 240, %380
  %582 = xor i32 %581, %382
  %583 = xor i32 %582, %384
  %584 = xor i32 %583, %386
  %585 = xor i32 %584, %388
  %586 = xor i32 %585, %390
  %587 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %586
  %588 = ptrtoint ptr addrspace(3) %587 to i32
  %589 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %588)
  %590 = extractvalue { i32, i32, i32, i32 } %589, 0
  %591 = extractvalue { i32, i32, i32, i32 } %589, 1
  %592 = extractvalue { i32, i32, i32, i32 } %589, 2
  %593 = extractvalue { i32, i32, i32, i32 } %589, 3
  %594 = bitcast i32 %395 to <2 x bfloat>
  %595 = extractelement <2 x bfloat> %594, i32 0
  %596 = extractelement <2 x bfloat> %594, i32 1
  %597 = bitcast i32 %396 to <2 x bfloat>
  %598 = extractelement <2 x bfloat> %597, i32 0
  %599 = extractelement <2 x bfloat> %597, i32 1
  %600 = bitcast i32 %397 to <2 x bfloat>
  %601 = extractelement <2 x bfloat> %600, i32 0
  %602 = extractelement <2 x bfloat> %600, i32 1
  %603 = bitcast i32 %398 to <2 x bfloat>
  %604 = extractelement <2 x bfloat> %603, i32 0
  %605 = extractelement <2 x bfloat> %603, i32 1
  %606 = bitcast i32 %408 to <2 x bfloat>
  %607 = extractelement <2 x bfloat> %606, i32 0
  %608 = extractelement <2 x bfloat> %606, i32 1
  %609 = bitcast i32 %409 to <2 x bfloat>
  %610 = extractelement <2 x bfloat> %609, i32 0
  %611 = extractelement <2 x bfloat> %609, i32 1
  %612 = bitcast i32 %410 to <2 x bfloat>
  %613 = extractelement <2 x bfloat> %612, i32 0
  %614 = extractelement <2 x bfloat> %612, i32 1
  %615 = bitcast i32 %411 to <2 x bfloat>
  %616 = extractelement <2 x bfloat> %615, i32 0
  %617 = extractelement <2 x bfloat> %615, i32 1
  %618 = bitcast i32 %421 to <2 x bfloat>
  %619 = extractelement <2 x bfloat> %618, i32 0
  %620 = extractelement <2 x bfloat> %618, i32 1
  %621 = bitcast i32 %422 to <2 x bfloat>
  %622 = extractelement <2 x bfloat> %621, i32 0
  %623 = extractelement <2 x bfloat> %621, i32 1
  %624 = bitcast i32 %423 to <2 x bfloat>
  %625 = extractelement <2 x bfloat> %624, i32 0
  %626 = extractelement <2 x bfloat> %624, i32 1
  %627 = bitcast i32 %424 to <2 x bfloat>
  %628 = extractelement <2 x bfloat> %627, i32 0
  %629 = extractelement <2 x bfloat> %627, i32 1
  %630 = bitcast i32 %434 to <2 x bfloat>
  %631 = extractelement <2 x bfloat> %630, i32 0
  %632 = extractelement <2 x bfloat> %630, i32 1
  %633 = bitcast i32 %435 to <2 x bfloat>
  %634 = extractelement <2 x bfloat> %633, i32 0
  %635 = extractelement <2 x bfloat> %633, i32 1
  %636 = bitcast i32 %436 to <2 x bfloat>
  %637 = extractelement <2 x bfloat> %636, i32 0
  %638 = extractelement <2 x bfloat> %636, i32 1
  %639 = bitcast i32 %437 to <2 x bfloat>
  %640 = extractelement <2 x bfloat> %639, i32 0
  %641 = extractelement <2 x bfloat> %639, i32 1
  %642 = bitcast i32 %447 to <2 x bfloat>
  %643 = extractelement <2 x bfloat> %642, i32 0
  %644 = extractelement <2 x bfloat> %642, i32 1
  %645 = bitcast i32 %448 to <2 x bfloat>
  %646 = extractelement <2 x bfloat> %645, i32 0
  %647 = extractelement <2 x bfloat> %645, i32 1
  %648 = bitcast i32 %449 to <2 x bfloat>
  %649 = extractelement <2 x bfloat> %648, i32 0
  %650 = extractelement <2 x bfloat> %648, i32 1
  %651 = bitcast i32 %450 to <2 x bfloat>
  %652 = extractelement <2 x bfloat> %651, i32 0
  %653 = extractelement <2 x bfloat> %651, i32 1
  %654 = bitcast i32 %460 to <2 x bfloat>
  %655 = extractelement <2 x bfloat> %654, i32 0
  %656 = extractelement <2 x bfloat> %654, i32 1
  %657 = bitcast i32 %461 to <2 x bfloat>
  %658 = extractelement <2 x bfloat> %657, i32 0
  %659 = extractelement <2 x bfloat> %657, i32 1
  %660 = bitcast i32 %462 to <2 x bfloat>
  %661 = extractelement <2 x bfloat> %660, i32 0
  %662 = extractelement <2 x bfloat> %660, i32 1
  %663 = bitcast i32 %463 to <2 x bfloat>
  %664 = extractelement <2 x bfloat> %663, i32 0
  %665 = extractelement <2 x bfloat> %663, i32 1
  %666 = bitcast i32 %473 to <2 x bfloat>
  %667 = extractelement <2 x bfloat> %666, i32 0
  %668 = extractelement <2 x bfloat> %666, i32 1
  %669 = bitcast i32 %474 to <2 x bfloat>
  %670 = extractelement <2 x bfloat> %669, i32 0
  %671 = extractelement <2 x bfloat> %669, i32 1
  %672 = bitcast i32 %475 to <2 x bfloat>
  %673 = extractelement <2 x bfloat> %672, i32 0
  %674 = extractelement <2 x bfloat> %672, i32 1
  %675 = bitcast i32 %476 to <2 x bfloat>
  %676 = extractelement <2 x bfloat> %675, i32 0
  %677 = extractelement <2 x bfloat> %675, i32 1
  %678 = bitcast i32 %486 to <2 x bfloat>
  %679 = extractelement <2 x bfloat> %678, i32 0
  %680 = extractelement <2 x bfloat> %678, i32 1
  %681 = bitcast i32 %487 to <2 x bfloat>
  %682 = extractelement <2 x bfloat> %681, i32 0
  %683 = extractelement <2 x bfloat> %681, i32 1
  %684 = bitcast i32 %488 to <2 x bfloat>
  %685 = extractelement <2 x bfloat> %684, i32 0
  %686 = extractelement <2 x bfloat> %684, i32 1
  %687 = bitcast i32 %489 to <2 x bfloat>
  %688 = extractelement <2 x bfloat> %687, i32 0
  %689 = extractelement <2 x bfloat> %687, i32 1
  %690 = bitcast i32 %499 to <2 x bfloat>
  %691 = extractelement <2 x bfloat> %690, i32 0
  %692 = extractelement <2 x bfloat> %690, i32 1
  %693 = bitcast i32 %500 to <2 x bfloat>
  %694 = extractelement <2 x bfloat> %693, i32 0
  %695 = extractelement <2 x bfloat> %693, i32 1
  %696 = bitcast i32 %501 to <2 x bfloat>
  %697 = extractelement <2 x bfloat> %696, i32 0
  %698 = extractelement <2 x bfloat> %696, i32 1
  %699 = bitcast i32 %502 to <2 x bfloat>
  %700 = extractelement <2 x bfloat> %699, i32 0
  %701 = extractelement <2 x bfloat> %699, i32 1
  %702 = bitcast i32 %512 to <2 x bfloat>
  %703 = extractelement <2 x bfloat> %702, i32 0
  %704 = extractelement <2 x bfloat> %702, i32 1
  %705 = bitcast i32 %513 to <2 x bfloat>
  %706 = extractelement <2 x bfloat> %705, i32 0
  %707 = extractelement <2 x bfloat> %705, i32 1
  %708 = bitcast i32 %514 to <2 x bfloat>
  %709 = extractelement <2 x bfloat> %708, i32 0
  %710 = extractelement <2 x bfloat> %708, i32 1
  %711 = bitcast i32 %515 to <2 x bfloat>
  %712 = extractelement <2 x bfloat> %711, i32 0
  %713 = extractelement <2 x bfloat> %711, i32 1
  %714 = bitcast i32 %525 to <2 x bfloat>
  %715 = extractelement <2 x bfloat> %714, i32 0
  %716 = extractelement <2 x bfloat> %714, i32 1
  %717 = bitcast i32 %526 to <2 x bfloat>
  %718 = extractelement <2 x bfloat> %717, i32 0
  %719 = extractelement <2 x bfloat> %717, i32 1
  %720 = bitcast i32 %527 to <2 x bfloat>
  %721 = extractelement <2 x bfloat> %720, i32 0
  %722 = extractelement <2 x bfloat> %720, i32 1
  %723 = bitcast i32 %528 to <2 x bfloat>
  %724 = extractelement <2 x bfloat> %723, i32 0
  %725 = extractelement <2 x bfloat> %723, i32 1
  %726 = bitcast i32 %538 to <2 x bfloat>
  %727 = extractelement <2 x bfloat> %726, i32 0
  %728 = extractelement <2 x bfloat> %726, i32 1
  %729 = bitcast i32 %539 to <2 x bfloat>
  %730 = extractelement <2 x bfloat> %729, i32 0
  %731 = extractelement <2 x bfloat> %729, i32 1
  %732 = bitcast i32 %540 to <2 x bfloat>
  %733 = extractelement <2 x bfloat> %732, i32 0
  %734 = extractelement <2 x bfloat> %732, i32 1
  %735 = bitcast i32 %541 to <2 x bfloat>
  %736 = extractelement <2 x bfloat> %735, i32 0
  %737 = extractelement <2 x bfloat> %735, i32 1
  %738 = bitcast i32 %551 to <2 x bfloat>
  %739 = extractelement <2 x bfloat> %738, i32 0
  %740 = extractelement <2 x bfloat> %738, i32 1
  %741 = bitcast i32 %552 to <2 x bfloat>
  %742 = extractelement <2 x bfloat> %741, i32 0
  %743 = extractelement <2 x bfloat> %741, i32 1
  %744 = bitcast i32 %553 to <2 x bfloat>
  %745 = extractelement <2 x bfloat> %744, i32 0
  %746 = extractelement <2 x bfloat> %744, i32 1
  %747 = bitcast i32 %554 to <2 x bfloat>
  %748 = extractelement <2 x bfloat> %747, i32 0
  %749 = extractelement <2 x bfloat> %747, i32 1
  %750 = bitcast i32 %564 to <2 x bfloat>
  %751 = extractelement <2 x bfloat> %750, i32 0
  %752 = extractelement <2 x bfloat> %750, i32 1
  %753 = bitcast i32 %565 to <2 x bfloat>
  %754 = extractelement <2 x bfloat> %753, i32 0
  %755 = extractelement <2 x bfloat> %753, i32 1
  %756 = bitcast i32 %566 to <2 x bfloat>
  %757 = extractelement <2 x bfloat> %756, i32 0
  %758 = extractelement <2 x bfloat> %756, i32 1
  %759 = bitcast i32 %567 to <2 x bfloat>
  %760 = extractelement <2 x bfloat> %759, i32 0
  %761 = extractelement <2 x bfloat> %759, i32 1
  %762 = bitcast i32 %577 to <2 x bfloat>
  %763 = extractelement <2 x bfloat> %762, i32 0
  %764 = extractelement <2 x bfloat> %762, i32 1
  %765 = bitcast i32 %578 to <2 x bfloat>
  %766 = extractelement <2 x bfloat> %765, i32 0
  %767 = extractelement <2 x bfloat> %765, i32 1
  %768 = bitcast i32 %579 to <2 x bfloat>
  %769 = extractelement <2 x bfloat> %768, i32 0
  %770 = extractelement <2 x bfloat> %768, i32 1
  %771 = bitcast i32 %580 to <2 x bfloat>
  %772 = extractelement <2 x bfloat> %771, i32 0
  %773 = extractelement <2 x bfloat> %771, i32 1
  %774 = bitcast i32 %590 to <2 x bfloat>
  %775 = extractelement <2 x bfloat> %774, i32 0
  %776 = extractelement <2 x bfloat> %774, i32 1
  %777 = bitcast i32 %591 to <2 x bfloat>
  %778 = extractelement <2 x bfloat> %777, i32 0
  %779 = extractelement <2 x bfloat> %777, i32 1
  %780 = bitcast i32 %592 to <2 x bfloat>
  %781 = extractelement <2 x bfloat> %780, i32 0
  %782 = extractelement <2 x bfloat> %780, i32 1
  %783 = bitcast i32 %593 to <2 x bfloat>
  %784 = extractelement <2 x bfloat> %783, i32 0
  %785 = extractelement <2 x bfloat> %783, i32 1
  %786 = insertelement <2 x bfloat> undef, bfloat %595, i32 0
  %787 = insertelement <2 x bfloat> %786, bfloat %596, i32 1
  %788 = bitcast <2 x bfloat> %787 to i32
  %789 = insertelement <2 x bfloat> undef, bfloat %598, i32 0
  %790 = insertelement <2 x bfloat> %789, bfloat %599, i32 1
  %791 = bitcast <2 x bfloat> %790 to i32
  %792 = insertelement <2 x bfloat> undef, bfloat %601, i32 0
  %793 = insertelement <2 x bfloat> %792, bfloat %602, i32 1
  %794 = bitcast <2 x bfloat> %793 to i32
  %795 = insertelement <2 x bfloat> undef, bfloat %604, i32 0
  %796 = insertelement <2 x bfloat> %795, bfloat %605, i32 1
  %797 = bitcast <2 x bfloat> %796 to i32
  %798 = insertelement <2 x bfloat> undef, bfloat %607, i32 0
  %799 = insertelement <2 x bfloat> %798, bfloat %608, i32 1
  %800 = bitcast <2 x bfloat> %799 to i32
  %801 = insertelement <2 x bfloat> undef, bfloat %610, i32 0
  %802 = insertelement <2 x bfloat> %801, bfloat %611, i32 1
  %803 = bitcast <2 x bfloat> %802 to i32
  %804 = insertelement <2 x bfloat> undef, bfloat %613, i32 0
  %805 = insertelement <2 x bfloat> %804, bfloat %614, i32 1
  %806 = bitcast <2 x bfloat> %805 to i32
  %807 = insertelement <2 x bfloat> undef, bfloat %616, i32 0
  %808 = insertelement <2 x bfloat> %807, bfloat %617, i32 1
  %809 = bitcast <2 x bfloat> %808 to i32
  %810 = insertelement <2 x bfloat> undef, bfloat %619, i32 0
  %811 = insertelement <2 x bfloat> %810, bfloat %620, i32 1
  %812 = bitcast <2 x bfloat> %811 to i32
  %813 = insertelement <2 x bfloat> undef, bfloat %622, i32 0
  %814 = insertelement <2 x bfloat> %813, bfloat %623, i32 1
  %815 = bitcast <2 x bfloat> %814 to i32
  %816 = insertelement <2 x bfloat> undef, bfloat %625, i32 0
  %817 = insertelement <2 x bfloat> %816, bfloat %626, i32 1
  %818 = bitcast <2 x bfloat> %817 to i32
  %819 = insertelement <2 x bfloat> undef, bfloat %628, i32 0
  %820 = insertelement <2 x bfloat> %819, bfloat %629, i32 1
  %821 = bitcast <2 x bfloat> %820 to i32
  %822 = insertelement <2 x bfloat> undef, bfloat %631, i32 0
  %823 = insertelement <2 x bfloat> %822, bfloat %632, i32 1
  %824 = bitcast <2 x bfloat> %823 to i32
  %825 = insertelement <2 x bfloat> undef, bfloat %634, i32 0
  %826 = insertelement <2 x bfloat> %825, bfloat %635, i32 1
  %827 = bitcast <2 x bfloat> %826 to i32
  %828 = insertelement <2 x bfloat> undef, bfloat %637, i32 0
  %829 = insertelement <2 x bfloat> %828, bfloat %638, i32 1
  %830 = bitcast <2 x bfloat> %829 to i32
  %831 = insertelement <2 x bfloat> undef, bfloat %640, i32 0
  %832 = insertelement <2 x bfloat> %831, bfloat %641, i32 1
  %833 = bitcast <2 x bfloat> %832 to i32
  %834 = insertelement <2 x bfloat> undef, bfloat %643, i32 0
  %835 = insertelement <2 x bfloat> %834, bfloat %644, i32 1
  %836 = bitcast <2 x bfloat> %835 to i32
  %837 = insertelement <2 x bfloat> undef, bfloat %646, i32 0
  %838 = insertelement <2 x bfloat> %837, bfloat %647, i32 1
  %839 = bitcast <2 x bfloat> %838 to i32
  %840 = insertelement <2 x bfloat> undef, bfloat %649, i32 0
  %841 = insertelement <2 x bfloat> %840, bfloat %650, i32 1
  %842 = bitcast <2 x bfloat> %841 to i32
  %843 = insertelement <2 x bfloat> undef, bfloat %652, i32 0
  %844 = insertelement <2 x bfloat> %843, bfloat %653, i32 1
  %845 = bitcast <2 x bfloat> %844 to i32
  %846 = insertelement <2 x bfloat> undef, bfloat %655, i32 0
  %847 = insertelement <2 x bfloat> %846, bfloat %656, i32 1
  %848 = bitcast <2 x bfloat> %847 to i32
  %849 = insertelement <2 x bfloat> undef, bfloat %658, i32 0
  %850 = insertelement <2 x bfloat> %849, bfloat %659, i32 1
  %851 = bitcast <2 x bfloat> %850 to i32
  %852 = insertelement <2 x bfloat> undef, bfloat %661, i32 0
  %853 = insertelement <2 x bfloat> %852, bfloat %662, i32 1
  %854 = bitcast <2 x bfloat> %853 to i32
  %855 = insertelement <2 x bfloat> undef, bfloat %664, i32 0
  %856 = insertelement <2 x bfloat> %855, bfloat %665, i32 1
  %857 = bitcast <2 x bfloat> %856 to i32
  %858 = insertelement <2 x bfloat> undef, bfloat %667, i32 0
  %859 = insertelement <2 x bfloat> %858, bfloat %668, i32 1
  %860 = bitcast <2 x bfloat> %859 to i32
  %861 = insertelement <2 x bfloat> undef, bfloat %670, i32 0
  %862 = insertelement <2 x bfloat> %861, bfloat %671, i32 1
  %863 = bitcast <2 x bfloat> %862 to i32
  %864 = insertelement <2 x bfloat> undef, bfloat %673, i32 0
  %865 = insertelement <2 x bfloat> %864, bfloat %674, i32 1
  %866 = bitcast <2 x bfloat> %865 to i32
  %867 = insertelement <2 x bfloat> undef, bfloat %676, i32 0
  %868 = insertelement <2 x bfloat> %867, bfloat %677, i32 1
  %869 = bitcast <2 x bfloat> %868 to i32
  %870 = insertelement <2 x bfloat> undef, bfloat %679, i32 0
  %871 = insertelement <2 x bfloat> %870, bfloat %680, i32 1
  %872 = bitcast <2 x bfloat> %871 to i32
  %873 = insertelement <2 x bfloat> undef, bfloat %682, i32 0
  %874 = insertelement <2 x bfloat> %873, bfloat %683, i32 1
  %875 = bitcast <2 x bfloat> %874 to i32
  %876 = insertelement <2 x bfloat> undef, bfloat %685, i32 0
  %877 = insertelement <2 x bfloat> %876, bfloat %686, i32 1
  %878 = bitcast <2 x bfloat> %877 to i32
  %879 = insertelement <2 x bfloat> undef, bfloat %688, i32 0
  %880 = insertelement <2 x bfloat> %879, bfloat %689, i32 1
  %881 = bitcast <2 x bfloat> %880 to i32
  %882 = insertelement <2 x bfloat> undef, bfloat %691, i32 0
  %883 = insertelement <2 x bfloat> %882, bfloat %692, i32 1
  %884 = bitcast <2 x bfloat> %883 to i32
  %885 = insertelement <2 x bfloat> undef, bfloat %694, i32 0
  %886 = insertelement <2 x bfloat> %885, bfloat %695, i32 1
  %887 = bitcast <2 x bfloat> %886 to i32
  %888 = insertelement <2 x bfloat> undef, bfloat %697, i32 0
  %889 = insertelement <2 x bfloat> %888, bfloat %698, i32 1
  %890 = bitcast <2 x bfloat> %889 to i32
  %891 = insertelement <2 x bfloat> undef, bfloat %700, i32 0
  %892 = insertelement <2 x bfloat> %891, bfloat %701, i32 1
  %893 = bitcast <2 x bfloat> %892 to i32
  %894 = insertelement <2 x bfloat> undef, bfloat %703, i32 0
  %895 = insertelement <2 x bfloat> %894, bfloat %704, i32 1
  %896 = bitcast <2 x bfloat> %895 to i32
  %897 = insertelement <2 x bfloat> undef, bfloat %706, i32 0
  %898 = insertelement <2 x bfloat> %897, bfloat %707, i32 1
  %899 = bitcast <2 x bfloat> %898 to i32
  %900 = insertelement <2 x bfloat> undef, bfloat %709, i32 0
  %901 = insertelement <2 x bfloat> %900, bfloat %710, i32 1
  %902 = bitcast <2 x bfloat> %901 to i32
  %903 = insertelement <2 x bfloat> undef, bfloat %712, i32 0
  %904 = insertelement <2 x bfloat> %903, bfloat %713, i32 1
  %905 = bitcast <2 x bfloat> %904 to i32
  %906 = insertelement <2 x bfloat> undef, bfloat %715, i32 0
  %907 = insertelement <2 x bfloat> %906, bfloat %716, i32 1
  %908 = bitcast <2 x bfloat> %907 to i32
  %909 = insertelement <2 x bfloat> undef, bfloat %718, i32 0
  %910 = insertelement <2 x bfloat> %909, bfloat %719, i32 1
  %911 = bitcast <2 x bfloat> %910 to i32
  %912 = insertelement <2 x bfloat> undef, bfloat %721, i32 0
  %913 = insertelement <2 x bfloat> %912, bfloat %722, i32 1
  %914 = bitcast <2 x bfloat> %913 to i32
  %915 = insertelement <2 x bfloat> undef, bfloat %724, i32 0
  %916 = insertelement <2 x bfloat> %915, bfloat %725, i32 1
  %917 = bitcast <2 x bfloat> %916 to i32
  %918 = insertelement <2 x bfloat> undef, bfloat %727, i32 0
  %919 = insertelement <2 x bfloat> %918, bfloat %728, i32 1
  %920 = bitcast <2 x bfloat> %919 to i32
  %921 = insertelement <2 x bfloat> undef, bfloat %730, i32 0
  %922 = insertelement <2 x bfloat> %921, bfloat %731, i32 1
  %923 = bitcast <2 x bfloat> %922 to i32
  %924 = insertelement <2 x bfloat> undef, bfloat %733, i32 0
  %925 = insertelement <2 x bfloat> %924, bfloat %734, i32 1
  %926 = bitcast <2 x bfloat> %925 to i32
  %927 = insertelement <2 x bfloat> undef, bfloat %736, i32 0
  %928 = insertelement <2 x bfloat> %927, bfloat %737, i32 1
  %929 = bitcast <2 x bfloat> %928 to i32
  %930 = insertelement <2 x bfloat> undef, bfloat %739, i32 0
  %931 = insertelement <2 x bfloat> %930, bfloat %740, i32 1
  %932 = bitcast <2 x bfloat> %931 to i32
  %933 = insertelement <2 x bfloat> undef, bfloat %742, i32 0
  %934 = insertelement <2 x bfloat> %933, bfloat %743, i32 1
  %935 = bitcast <2 x bfloat> %934 to i32
  %936 = insertelement <2 x bfloat> undef, bfloat %745, i32 0
  %937 = insertelement <2 x bfloat> %936, bfloat %746, i32 1
  %938 = bitcast <2 x bfloat> %937 to i32
  %939 = insertelement <2 x bfloat> undef, bfloat %748, i32 0
  %940 = insertelement <2 x bfloat> %939, bfloat %749, i32 1
  %941 = bitcast <2 x bfloat> %940 to i32
  %942 = insertelement <2 x bfloat> undef, bfloat %751, i32 0
  %943 = insertelement <2 x bfloat> %942, bfloat %752, i32 1
  %944 = bitcast <2 x bfloat> %943 to i32
  %945 = insertelement <2 x bfloat> undef, bfloat %754, i32 0
  %946 = insertelement <2 x bfloat> %945, bfloat %755, i32 1
  %947 = bitcast <2 x bfloat> %946 to i32
  %948 = insertelement <2 x bfloat> undef, bfloat %757, i32 0
  %949 = insertelement <2 x bfloat> %948, bfloat %758, i32 1
  %950 = bitcast <2 x bfloat> %949 to i32
  %951 = insertelement <2 x bfloat> undef, bfloat %760, i32 0
  %952 = insertelement <2 x bfloat> %951, bfloat %761, i32 1
  %953 = bitcast <2 x bfloat> %952 to i32
  %954 = insertelement <2 x bfloat> undef, bfloat %763, i32 0
  %955 = insertelement <2 x bfloat> %954, bfloat %764, i32 1
  %956 = bitcast <2 x bfloat> %955 to i32
  %957 = insertelement <2 x bfloat> undef, bfloat %766, i32 0
  %958 = insertelement <2 x bfloat> %957, bfloat %767, i32 1
  %959 = bitcast <2 x bfloat> %958 to i32
  %960 = insertelement <2 x bfloat> undef, bfloat %769, i32 0
  %961 = insertelement <2 x bfloat> %960, bfloat %770, i32 1
  %962 = bitcast <2 x bfloat> %961 to i32
  %963 = insertelement <2 x bfloat> undef, bfloat %772, i32 0
  %964 = insertelement <2 x bfloat> %963, bfloat %773, i32 1
  %965 = bitcast <2 x bfloat> %964 to i32
  %966 = insertelement <2 x bfloat> undef, bfloat %775, i32 0
  %967 = insertelement <2 x bfloat> %966, bfloat %776, i32 1
  %968 = bitcast <2 x bfloat> %967 to i32
  %969 = insertelement <2 x bfloat> undef, bfloat %778, i32 0
  %970 = insertelement <2 x bfloat> %969, bfloat %779, i32 1
  %971 = bitcast <2 x bfloat> %970 to i32
  %972 = insertelement <2 x bfloat> undef, bfloat %781, i32 0
  %973 = insertelement <2 x bfloat> %972, bfloat %782, i32 1
  %974 = bitcast <2 x bfloat> %973 to i32
  %975 = insertelement <2 x bfloat> undef, bfloat %784, i32 0
  %976 = insertelement <2 x bfloat> %975, bfloat %785, i32 1
  %977 = bitcast <2 x bfloat> %976 to i32
  %978 = extractvalue { float, float, float, float, float, float, float, float } %98, 0
  %979 = extractvalue { float, float, float, float, float, float, float, float } %98, 1
  %980 = extractvalue { float, float, float, float, float, float, float, float } %98, 2
  %981 = extractvalue { float, float, float, float, float, float, float, float } %98, 3
  %982 = extractvalue { float, float, float, float, float, float, float, float } %98, 4
  %983 = extractvalue { float, float, float, float, float, float, float, float } %98, 5
  %984 = extractvalue { float, float, float, float, float, float, float, float } %98, 6
  %985 = extractvalue { float, float, float, float, float, float, float, float } %98, 7
  %986 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %978, float %979, float %980, float %981, i32 %788, i32 %791, i32 %794, i32 %797, i32 0, i32 0)
  %987 = extractvalue { float, float, float, float } %986, 0
  %988 = extractvalue { float, float, float, float } %986, 1
  %989 = extractvalue { float, float, float, float } %986, 2
  %990 = extractvalue { float, float, float, float } %986, 3
  %991 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %982, float %983, float %984, float %985, i32 %788, i32 %791, i32 %794, i32 %797, i32 0, i32 0)
  %992 = extractvalue { float, float, float, float } %991, 0
  %993 = extractvalue { float, float, float, float } %991, 1
  %994 = extractvalue { float, float, float, float } %991, 2
  %995 = extractvalue { float, float, float, float } %991, 3
  %996 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %987, float %988, float %989, float %990, i32 %800, i32 %803, i32 %806, i32 %809, i32 0, i32 0)
  %997 = extractvalue { float, float, float, float } %996, 0
  %998 = extractvalue { float, float, float, float } %996, 1
  %999 = extractvalue { float, float, float, float } %996, 2
  %1000 = extractvalue { float, float, float, float } %996, 3
  %1001 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %992, float %993, float %994, float %995, i32 %800, i32 %803, i32 %806, i32 %809, i32 0, i32 0)
  %1002 = extractvalue { float, float, float, float } %1001, 0
  %1003 = extractvalue { float, float, float, float } %1001, 1
  %1004 = extractvalue { float, float, float, float } %1001, 2
  %1005 = extractvalue { float, float, float, float } %1001, 3
  %1006 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %997, float %998, float %999, float %1000, i32 %812, i32 %815, i32 %818, i32 %821, i32 0, i32 0)
  %1007 = extractvalue { float, float, float, float } %1006, 0
  %1008 = extractvalue { float, float, float, float } %1006, 1
  %1009 = extractvalue { float, float, float, float } %1006, 2
  %1010 = extractvalue { float, float, float, float } %1006, 3
  %1011 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1002, float %1003, float %1004, float %1005, i32 %812, i32 %815, i32 %818, i32 %821, i32 0, i32 0)
  %1012 = extractvalue { float, float, float, float } %1011, 0
  %1013 = extractvalue { float, float, float, float } %1011, 1
  %1014 = extractvalue { float, float, float, float } %1011, 2
  %1015 = extractvalue { float, float, float, float } %1011, 3
  %1016 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1007, float %1008, float %1009, float %1010, i32 %824, i32 %827, i32 %830, i32 %833, i32 0, i32 0)
  %1017 = extractvalue { float, float, float, float } %1016, 0
  %1018 = extractvalue { float, float, float, float } %1016, 1
  %1019 = extractvalue { float, float, float, float } %1016, 2
  %1020 = extractvalue { float, float, float, float } %1016, 3
  %1021 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1012, float %1013, float %1014, float %1015, i32 %824, i32 %827, i32 %830, i32 %833, i32 0, i32 0)
  %1022 = extractvalue { float, float, float, float } %1021, 0
  %1023 = extractvalue { float, float, float, float } %1021, 1
  %1024 = extractvalue { float, float, float, float } %1021, 2
  %1025 = extractvalue { float, float, float, float } %1021, 3
  %1026 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1017, float %1018, float %1019, float %1020, i32 %836, i32 %839, i32 %842, i32 %845, i32 0, i32 0)
  %1027 = extractvalue { float, float, float, float } %1026, 0
  %1028 = extractvalue { float, float, float, float } %1026, 1
  %1029 = extractvalue { float, float, float, float } %1026, 2
  %1030 = extractvalue { float, float, float, float } %1026, 3
  %1031 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1022, float %1023, float %1024, float %1025, i32 %836, i32 %839, i32 %842, i32 %845, i32 0, i32 0)
  %1032 = extractvalue { float, float, float, float } %1031, 0
  %1033 = extractvalue { float, float, float, float } %1031, 1
  %1034 = extractvalue { float, float, float, float } %1031, 2
  %1035 = extractvalue { float, float, float, float } %1031, 3
  %1036 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1027, float %1028, float %1029, float %1030, i32 %848, i32 %851, i32 %854, i32 %857, i32 0, i32 0)
  %1037 = extractvalue { float, float, float, float } %1036, 0
  %1038 = extractvalue { float, float, float, float } %1036, 1
  %1039 = extractvalue { float, float, float, float } %1036, 2
  %1040 = extractvalue { float, float, float, float } %1036, 3
  %1041 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1032, float %1033, float %1034, float %1035, i32 %848, i32 %851, i32 %854, i32 %857, i32 0, i32 0)
  %1042 = extractvalue { float, float, float, float } %1041, 0
  %1043 = extractvalue { float, float, float, float } %1041, 1
  %1044 = extractvalue { float, float, float, float } %1041, 2
  %1045 = extractvalue { float, float, float, float } %1041, 3
  %1046 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1037, float %1038, float %1039, float %1040, i32 %860, i32 %863, i32 %866, i32 %869, i32 0, i32 0)
  %1047 = extractvalue { float, float, float, float } %1046, 0
  %1048 = extractvalue { float, float, float, float } %1046, 1
  %1049 = extractvalue { float, float, float, float } %1046, 2
  %1050 = extractvalue { float, float, float, float } %1046, 3
  %1051 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1042, float %1043, float %1044, float %1045, i32 %860, i32 %863, i32 %866, i32 %869, i32 0, i32 0)
  %1052 = extractvalue { float, float, float, float } %1051, 0
  %1053 = extractvalue { float, float, float, float } %1051, 1
  %1054 = extractvalue { float, float, float, float } %1051, 2
  %1055 = extractvalue { float, float, float, float } %1051, 3
  %1056 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1047, float %1048, float %1049, float %1050, i32 %872, i32 %875, i32 %878, i32 %881, i32 0, i32 0)
  %1057 = extractvalue { float, float, float, float } %1056, 0
  %1058 = extractvalue { float, float, float, float } %1056, 1
  %1059 = extractvalue { float, float, float, float } %1056, 2
  %1060 = extractvalue { float, float, float, float } %1056, 3
  %1061 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1052, float %1053, float %1054, float %1055, i32 %872, i32 %875, i32 %878, i32 %881, i32 0, i32 0)
  %1062 = extractvalue { float, float, float, float } %1061, 0
  %1063 = extractvalue { float, float, float, float } %1061, 1
  %1064 = extractvalue { float, float, float, float } %1061, 2
  %1065 = extractvalue { float, float, float, float } %1061, 3
  %1066 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1057, float %1058, float %1059, float %1060, i32 %884, i32 %887, i32 %890, i32 %893, i32 0, i32 0)
  %1067 = extractvalue { float, float, float, float } %1066, 0
  %1068 = extractvalue { float, float, float, float } %1066, 1
  %1069 = extractvalue { float, float, float, float } %1066, 2
  %1070 = extractvalue { float, float, float, float } %1066, 3
  %1071 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1062, float %1063, float %1064, float %1065, i32 %884, i32 %887, i32 %890, i32 %893, i32 0, i32 0)
  %1072 = extractvalue { float, float, float, float } %1071, 0
  %1073 = extractvalue { float, float, float, float } %1071, 1
  %1074 = extractvalue { float, float, float, float } %1071, 2
  %1075 = extractvalue { float, float, float, float } %1071, 3
  %1076 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1067, float %1068, float %1069, float %1070, i32 %896, i32 %899, i32 %902, i32 %905, i32 0, i32 0)
  %1077 = extractvalue { float, float, float, float } %1076, 0
  %1078 = extractvalue { float, float, float, float } %1076, 1
  %1079 = extractvalue { float, float, float, float } %1076, 2
  %1080 = extractvalue { float, float, float, float } %1076, 3
  %1081 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1072, float %1073, float %1074, float %1075, i32 %896, i32 %899, i32 %902, i32 %905, i32 0, i32 0)
  %1082 = extractvalue { float, float, float, float } %1081, 0
  %1083 = extractvalue { float, float, float, float } %1081, 1
  %1084 = extractvalue { float, float, float, float } %1081, 2
  %1085 = extractvalue { float, float, float, float } %1081, 3
  %1086 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1077, float %1078, float %1079, float %1080, i32 %908, i32 %911, i32 %914, i32 %917, i32 0, i32 0)
  %1087 = extractvalue { float, float, float, float } %1086, 0
  %1088 = extractvalue { float, float, float, float } %1086, 1
  %1089 = extractvalue { float, float, float, float } %1086, 2
  %1090 = extractvalue { float, float, float, float } %1086, 3
  %1091 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1082, float %1083, float %1084, float %1085, i32 %908, i32 %911, i32 %914, i32 %917, i32 0, i32 0)
  %1092 = extractvalue { float, float, float, float } %1091, 0
  %1093 = extractvalue { float, float, float, float } %1091, 1
  %1094 = extractvalue { float, float, float, float } %1091, 2
  %1095 = extractvalue { float, float, float, float } %1091, 3
  %1096 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1087, float %1088, float %1089, float %1090, i32 %920, i32 %923, i32 %926, i32 %929, i32 0, i32 0)
  %1097 = extractvalue { float, float, float, float } %1096, 0
  %1098 = extractvalue { float, float, float, float } %1096, 1
  %1099 = extractvalue { float, float, float, float } %1096, 2
  %1100 = extractvalue { float, float, float, float } %1096, 3
  %1101 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1092, float %1093, float %1094, float %1095, i32 %920, i32 %923, i32 %926, i32 %929, i32 0, i32 0)
  %1102 = extractvalue { float, float, float, float } %1101, 0
  %1103 = extractvalue { float, float, float, float } %1101, 1
  %1104 = extractvalue { float, float, float, float } %1101, 2
  %1105 = extractvalue { float, float, float, float } %1101, 3
  %1106 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1097, float %1098, float %1099, float %1100, i32 %932, i32 %935, i32 %938, i32 %941, i32 0, i32 0)
  %1107 = extractvalue { float, float, float, float } %1106, 0
  %1108 = extractvalue { float, float, float, float } %1106, 1
  %1109 = extractvalue { float, float, float, float } %1106, 2
  %1110 = extractvalue { float, float, float, float } %1106, 3
  %1111 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1102, float %1103, float %1104, float %1105, i32 %932, i32 %935, i32 %938, i32 %941, i32 0, i32 0)
  %1112 = extractvalue { float, float, float, float } %1111, 0
  %1113 = extractvalue { float, float, float, float } %1111, 1
  %1114 = extractvalue { float, float, float, float } %1111, 2
  %1115 = extractvalue { float, float, float, float } %1111, 3
  %1116 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1107, float %1108, float %1109, float %1110, i32 %944, i32 %947, i32 %950, i32 %953, i32 0, i32 0)
  %1117 = extractvalue { float, float, float, float } %1116, 0
  %1118 = extractvalue { float, float, float, float } %1116, 1
  %1119 = extractvalue { float, float, float, float } %1116, 2
  %1120 = extractvalue { float, float, float, float } %1116, 3
  %1121 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1112, float %1113, float %1114, float %1115, i32 %944, i32 %947, i32 %950, i32 %953, i32 0, i32 0)
  %1122 = extractvalue { float, float, float, float } %1121, 0
  %1123 = extractvalue { float, float, float, float } %1121, 1
  %1124 = extractvalue { float, float, float, float } %1121, 2
  %1125 = extractvalue { float, float, float, float } %1121, 3
  %1126 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1117, float %1118, float %1119, float %1120, i32 %956, i32 %959, i32 %962, i32 %965, i32 0, i32 0)
  %1127 = extractvalue { float, float, float, float } %1126, 0
  %1128 = extractvalue { float, float, float, float } %1126, 1
  %1129 = extractvalue { float, float, float, float } %1126, 2
  %1130 = extractvalue { float, float, float, float } %1126, 3
  %1131 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1122, float %1123, float %1124, float %1125, i32 %956, i32 %959, i32 %962, i32 %965, i32 0, i32 0)
  %1132 = extractvalue { float, float, float, float } %1131, 0
  %1133 = extractvalue { float, float, float, float } %1131, 1
  %1134 = extractvalue { float, float, float, float } %1131, 2
  %1135 = extractvalue { float, float, float, float } %1131, 3
  %1136 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1127, float %1128, float %1129, float %1130, i32 %968, i32 %971, i32 %974, i32 %977, i32 0, i32 0)
  %1137 = extractvalue { float, float, float, float } %1136, 0
  %1138 = extractvalue { float, float, float, float } %1136, 1
  %1139 = extractvalue { float, float, float, float } %1136, 2
  %1140 = extractvalue { float, float, float, float } %1136, 3
  %1141 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1132, float %1133, float %1134, float %1135, i32 %968, i32 %971, i32 %974, i32 %977, i32 0, i32 0)
  %1142 = extractvalue { float, float, float, float } %1141, 0
  %1143 = extractvalue { float, float, float, float } %1141, 1
  %1144 = extractvalue { float, float, float, float } %1141, 2
  %1145 = extractvalue { float, float, float, float } %1141, 3
  %1146 = insertvalue { float, float, float, float, float, float, float, float } undef, float %1137, 0
  %1147 = insertvalue { float, float, float, float, float, float, float, float } %1146, float %1138, 1
  %1148 = insertvalue { float, float, float, float, float, float, float, float } %1147, float %1139, 2
  %1149 = insertvalue { float, float, float, float, float, float, float, float } %1148, float %1140, 3
  %1150 = insertvalue { float, float, float, float, float, float, float, float } %1149, float %1142, 4
  %1151 = insertvalue { float, float, float, float, float, float, float, float } %1150, float %1143, 5
  %1152 = insertvalue { float, float, float, float, float, float, float, float } %1151, float %1144, 6
  %1153 = insertvalue { float, float, float, float, float, float, float, float } %1152, float %1145, 7
  %1154 = add i32 %96, 256
  br label %95

1155:                                             ; preds = %95
  %1156 = extractvalue { float, float, float, float, float, float, float, float } %98, 0
  %1157 = extractvalue { float, float, float, float, float, float, float, float } %98, 1
  %1158 = extractvalue { float, float, float, float, float, float, float, float } %98, 2
  %1159 = extractvalue { float, float, float, float, float, float, float, float } %98, 3
  %1160 = extractvalue { float, float, float, float, float, float, float, float } %98, 4
  %1161 = extractvalue { float, float, float, float, float, float, float, float } %98, 5
  %1162 = extractvalue { float, float, float, float, float, float, float, float } %98, 6
  %1163 = extractvalue { float, float, float, float, float, float, float, float } %98, 7
  %1164 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1156)
  %1165 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1157)
  %1166 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1158)
  %1167 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1159)
  %1168 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1160)
  %1169 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1161)
  %1170 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1162)
  %1171 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1163)
  %1172 = mul i32 %14, 32
  %1173 = sext i32 %15 to i64
  %1174 = sext i32 %1172 to i64
  %1175 = xor i32 %79, 0
  %1176 = add i32 %1175, 0
  %1177 = select i1 %81, i32 0, i32 1
  %1178 = xor i32 0, %1177
  %1179 = select i1 %85, i32 0, i32 2
  %1180 = xor i32 %1178, %1179
  %1181 = select i1 %89, i32 0, i32 4
  %1182 = xor i32 %1180, %1181
  %1183 = select i1 %24, i32 0, i32 8
  %1184 = xor i32 %1182, %1183
  %1185 = select i1 %28, i32 0, i32 16
  %1186 = xor i32 %1184, %1185
  %1187 = xor i32 %1186, 0
  %1188 = add i32 %1187, 0
  %1189 = sext i32 %1176 to i64
  %1190 = sext i32 %1188 to i64
  %1191 = add i64 %1173, %1189
  %1192 = add i64 %1174, %1190
  %1193 = mul i64 %1192, 2048
  %1194 = add i64 %1191, %1193
  %1195 = getelementptr bfloat, ptr addrspace(1) %3, i64 %1194
  call void @llvm.nvvm.barrier0()
  %1196 = select i1 %73, i32 0, i32 64
  %1197 = xor i32 0, %1196
  %1198 = select i1 %77, i32 0, i32 128
  %1199 = xor i32 %1197, %1198
  %1200 = xor i32 %1199, %1177
  %1201 = xor i32 %1200, %1179
  %1202 = xor i32 %1201, %1181
  %1203 = select i1 %24, i32 0, i32 256
  %1204 = xor i32 %1202, %1203
  %1205 = xor i32 %1204, %1185
  %1206 = xor i32 %91, %1203
  %1207 = select i1 %28, i32 0, i32 512
  %1208 = xor i32 %1206, %1207
  %1209 = xor i32 %1205, 0
  %1210 = lshr i32 %1209, 5
  %1211 = shl i32 %1210, 3
  %1212 = add i32 %1211, %1209
  %1213 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1212
  %1214 = insertelement <1 x bfloat> undef, bfloat %1164, i32 0
  %1215 = extractelement <1 x bfloat> %1214, i32 0
  %1216 = bitcast bfloat %1215 to i16
  %1217 = insertelement <1 x i16> undef, i16 %1216, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1213, <1 x i16> %1217, i1 true)
  %1218 = xor i32 %1205, 32
  %1219 = lshr i32 %1218, 5
  %1220 = shl i32 %1219, 3
  %1221 = add i32 %1220, %1218
  %1222 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1221
  %1223 = insertelement <1 x bfloat> undef, bfloat %1165, i32 0
  %1224 = extractelement <1 x bfloat> %1223, i32 0
  %1225 = bitcast bfloat %1224 to i16
  %1226 = insertelement <1 x i16> undef, i16 %1225, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1222, <1 x i16> %1226, i1 true)
  %1227 = xor i32 %1205, 8
  %1228 = lshr i32 %1227, 5
  %1229 = shl i32 %1228, 3
  %1230 = add i32 %1229, %1227
  %1231 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1230
  %1232 = insertelement <1 x bfloat> undef, bfloat %1166, i32 0
  %1233 = extractelement <1 x bfloat> %1232, i32 0
  %1234 = bitcast bfloat %1233 to i16
  %1235 = insertelement <1 x i16> undef, i16 %1234, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1231, <1 x i16> %1235, i1 true)
  %1236 = xor i32 %1205, 40
  %1237 = lshr i32 %1236, 5
  %1238 = shl i32 %1237, 3
  %1239 = add i32 %1238, %1236
  %1240 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1239
  %1241 = insertelement <1 x bfloat> undef, bfloat %1167, i32 0
  %1242 = extractelement <1 x bfloat> %1241, i32 0
  %1243 = bitcast bfloat %1242 to i16
  %1244 = insertelement <1 x i16> undef, i16 %1243, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1240, <1 x i16> %1244, i1 true)
  %1245 = xor i32 %1205, 512
  %1246 = lshr i32 %1245, 5
  %1247 = shl i32 %1246, 3
  %1248 = add i32 %1247, %1245
  %1249 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1248
  %1250 = insertelement <1 x bfloat> undef, bfloat %1168, i32 0
  %1251 = extractelement <1 x bfloat> %1250, i32 0
  %1252 = bitcast bfloat %1251 to i16
  %1253 = insertelement <1 x i16> undef, i16 %1252, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1249, <1 x i16> %1253, i1 true)
  %1254 = xor i32 %1205, 544
  %1255 = lshr i32 %1254, 5
  %1256 = shl i32 %1255, 3
  %1257 = add i32 %1256, %1254
  %1258 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1257
  %1259 = insertelement <1 x bfloat> undef, bfloat %1169, i32 0
  %1260 = extractelement <1 x bfloat> %1259, i32 0
  %1261 = bitcast bfloat %1260 to i16
  %1262 = insertelement <1 x i16> undef, i16 %1261, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1258, <1 x i16> %1262, i1 true)
  %1263 = xor i32 %1205, 520
  %1264 = lshr i32 %1263, 5
  %1265 = shl i32 %1264, 3
  %1266 = add i32 %1265, %1263
  %1267 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1266
  %1268 = insertelement <1 x bfloat> undef, bfloat %1170, i32 0
  %1269 = extractelement <1 x bfloat> %1268, i32 0
  %1270 = bitcast bfloat %1269 to i16
  %1271 = insertelement <1 x i16> undef, i16 %1270, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1267, <1 x i16> %1271, i1 true)
  %1272 = xor i32 %1205, 552
  %1273 = lshr i32 %1272, 5
  %1274 = shl i32 %1273, 3
  %1275 = add i32 %1274, %1272
  %1276 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1275
  %1277 = insertelement <1 x bfloat> undef, bfloat %1171, i32 0
  %1278 = extractelement <1 x bfloat> %1277, i32 0
  %1279 = bitcast bfloat %1278 to i16
  %1280 = insertelement <1 x i16> undef, i16 %1279, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1276, <1 x i16> %1280, i1 true)
  call void @llvm.nvvm.barrier0()
  %1281 = xor i32 %1208, 0
  %1282 = lshr i32 %1281, 5
  %1283 = shl i32 %1282, 3
  %1284 = add i32 %1283, %1281
  %1285 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1284
  %1286 = load <4 x i32>, ptr addrspace(3) %1285, align 16
  %1287 = extractelement <4 x i32> %1286, i32 0
  %1288 = extractelement <4 x i32> %1286, i32 1
  %1289 = extractelement <4 x i32> %1286, i32 2
  %1290 = extractelement <4 x i32> %1286, i32 3
  %1291 = insertelement <4 x i32> undef, i32 %1287, i32 0
  %1292 = insertelement <4 x i32> %1291, i32 %1288, i32 1
  %1293 = insertelement <4 x i32> %1292, i32 %1289, i32 2
  %1294 = insertelement <4 x i32> %1293, i32 %1290, i32 3
  %1295 = extractelement <4 x i32> %1294, i32 0
  %1296 = extractelement <4 x i32> %1294, i32 1
  %1297 = extractelement <4 x i32> %1294, i32 2
  %1298 = extractelement <4 x i32> %1294, i32 3
  %1299 = bitcast i32 %1295 to <2 x i16>
  %1300 = extractelement <2 x i16> %1299, i32 0
  %1301 = extractelement <2 x i16> %1299, i32 1
  %1302 = bitcast i32 %1296 to <2 x i16>
  %1303 = extractelement <2 x i16> %1302, i32 0
  %1304 = extractelement <2 x i16> %1302, i32 1
  %1305 = bitcast i32 %1297 to <2 x i16>
  %1306 = extractelement <2 x i16> %1305, i32 0
  %1307 = extractelement <2 x i16> %1305, i32 1
  %1308 = bitcast i32 %1298 to <2 x i16>
  %1309 = extractelement <2 x i16> %1308, i32 0
  %1310 = extractelement <2 x i16> %1308, i32 1
  %1311 = insertelement <8 x i16> undef, i16 %1300, i32 0
  %1312 = insertelement <8 x i16> %1311, i16 %1301, i32 1
  %1313 = insertelement <8 x i16> %1312, i16 %1303, i32 2
  %1314 = insertelement <8 x i16> %1313, i16 %1304, i32 3
  %1315 = insertelement <8 x i16> %1314, i16 %1306, i32 4
  %1316 = insertelement <8 x i16> %1315, i16 %1307, i32 5
  %1317 = insertelement <8 x i16> %1316, i16 %1309, i32 6
  %1318 = insertelement <8 x i16> %1317, i16 %1310, i32 7
  %1319 = extractelement <8 x i16> %1318, i32 0
  %1320 = extractelement <8 x i16> %1318, i32 1
  %1321 = extractelement <8 x i16> %1318, i32 2
  %1322 = extractelement <8 x i16> %1318, i32 3
  %1323 = extractelement <8 x i16> %1318, i32 4
  %1324 = extractelement <8 x i16> %1318, i32 5
  %1325 = extractelement <8 x i16> %1318, i32 6
  %1326 = extractelement <8 x i16> %1318, i32 7
  %1327 = bitcast i16 %1319 to bfloat
  %1328 = bitcast i16 %1320 to bfloat
  %1329 = bitcast i16 %1321 to bfloat
  %1330 = bitcast i16 %1322 to bfloat
  %1331 = bitcast i16 %1323 to bfloat
  %1332 = bitcast i16 %1324 to bfloat
  %1333 = bitcast i16 %1325 to bfloat
  %1334 = bitcast i16 %1326 to bfloat
  %1335 = insertelement <8 x bfloat> undef, bfloat %1327, i32 0
  %1336 = insertelement <8 x bfloat> %1335, bfloat %1328, i32 1
  %1337 = insertelement <8 x bfloat> %1336, bfloat %1329, i32 2
  %1338 = insertelement <8 x bfloat> %1337, bfloat %1330, i32 3
  %1339 = insertelement <8 x bfloat> %1338, bfloat %1331, i32 4
  %1340 = insertelement <8 x bfloat> %1339, bfloat %1332, i32 5
  %1341 = insertelement <8 x bfloat> %1340, bfloat %1333, i32 6
  %1342 = insertelement <8 x bfloat> %1341, bfloat %1334, i32 7
  %1343 = extractelement <8 x bfloat> %1342, i32 0
  %1344 = extractelement <8 x bfloat> %1342, i32 1
  %1345 = extractelement <8 x bfloat> %1342, i32 2
  %1346 = extractelement <8 x bfloat> %1342, i32 3
  %1347 = extractelement <8 x bfloat> %1342, i32 4
  %1348 = extractelement <8 x bfloat> %1342, i32 5
  %1349 = extractelement <8 x bfloat> %1342, i32 6
  %1350 = extractelement <8 x bfloat> %1342, i32 7
  %1351 = insertelement <2 x bfloat> undef, bfloat %1343, i32 0
  %1352 = insertelement <2 x bfloat> %1351, bfloat %1344, i32 1
  %1353 = bitcast <2 x bfloat> %1352 to i32
  %1354 = insertelement <2 x bfloat> undef, bfloat %1345, i32 0
  %1355 = insertelement <2 x bfloat> %1354, bfloat %1346, i32 1
  %1356 = bitcast <2 x bfloat> %1355 to i32
  %1357 = insertelement <2 x bfloat> undef, bfloat %1347, i32 0
  %1358 = insertelement <2 x bfloat> %1357, bfloat %1348, i32 1
  %1359 = bitcast <2 x bfloat> %1358 to i32
  %1360 = insertelement <2 x bfloat> undef, bfloat %1349, i32 0
  %1361 = insertelement <2 x bfloat> %1360, bfloat %1350, i32 1
  %1362 = bitcast <2 x bfloat> %1361 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %1353, i32 %1356, i32 %1359, i32 %1362, ptr addrspace(1) %1195)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_38_impl(ptr, ptr, ptr, ptr, ptr, ptr) #4

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #5

declare float @__nv_rsqrtf(float)

define ptx_kernel void @fusion_38(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(65536) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(65536) %arg4) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %6 = addrspacecast ptr null to ptr addrspace(1)
  %7 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %8 = sext i32 %7 to i64
  %9 = mul i64 %8, 2048
  %10 = add i64 %9, 1024
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
  %9 = call bfloat @fused_convert_param_0_155(ptr %0, i32 %5, i32 %8)
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
  %20 = call bfloat @fused_convert_param_0_155(ptr %0, i32 %5, i32 %19)
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

define internal bfloat @fused_convert_param_0_155(ptr noalias %0, i32 %1, i32 %2) {
  %4 = mul i32 %1, 6144
  %5 = add i32 %4, %2
  %6 = getelementptr inbounds bfloat, ptr %0, i32 %5
  %7 = load bfloat, ptr %6, align 2, !invariant.load !3
  ret bfloat %7
}

declare float @__nv_fast_expf(float)

declare ptx_kernel void @fusion_39_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_39(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(131072) %arg3, ptr noalias align 128 dereferenceable(65536) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %6 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %7 = addrspacecast ptr null to ptr addrspace(1)
  %8 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %9 = sext i32 %8 to i64
  %10 = mul i64 %9, 2048
  %11 = getelementptr bfloat, ptr addrspace(1) %4, i64 %10
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
  %97 = mul i64 %9, 1024
  %98 = getelementptr bfloat, ptr addrspace(1) %5, i64 %97
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
  %151 = add i64 %10, 1024
  %152 = getelementptr bfloat, ptr addrspace(1) %4, i64 %151
  %153 = getelementptr bfloat, ptr addrspace(1) %152, i64 %43
  %154 = getelementptr bfloat, ptr addrspace(1) %152, i64 %44
  %155 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %153)
  %156 = extractvalue { i32, i32, i32, i32 } %155, 0
  %157 = bitcast i32 %156 to <2 x bfloat>
  %158 = extractvalue { i32, i32, i32, i32 } %155, 1
  %159 = bitcast i32 %158 to <2 x bfloat>
  %160 = extractvalue { i32, i32, i32, i32 } %155, 2
  %161 = bitcast i32 %160 to <2 x bfloat>
  %162 = extractvalue { i32, i32, i32, i32 } %155, 3
  %163 = bitcast i32 %162 to <2 x bfloat>
  %164 = extractelement <2 x bfloat> %157, i32 0
  %165 = extractelement <2 x bfloat> %157, i32 1
  %166 = extractelement <2 x bfloat> %159, i32 0
  %167 = extractelement <2 x bfloat> %159, i32 1
  %168 = extractelement <2 x bfloat> %161, i32 0
  %169 = extractelement <2 x bfloat> %161, i32 1
  %170 = extractelement <2 x bfloat> %163, i32 0
  %171 = extractelement <2 x bfloat> %163, i32 1
  %172 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %154)
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
  %189 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %164)
  %190 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %165)
  %191 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %166)
  %192 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %167)
  %193 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %168)
  %194 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %169)
  %195 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %170)
  %196 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %171)
  %197 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %181)
  %198 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %182)
  %199 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %183)
  %200 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %184)
  %201 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %185)
  %202 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %186)
  %203 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %187)
  %204 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188)
  %205 = getelementptr bfloat, ptr addrspace(1) %3, i64 %97
  %206 = getelementptr bfloat, ptr addrspace(1) %205, i64 %43
  %207 = getelementptr bfloat, ptr addrspace(1) %205, i64 %44
  %208 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %206)
  %209 = extractvalue { i32, i32, i32, i32 } %208, 0
  %210 = bitcast i32 %209 to <2 x bfloat>
  %211 = extractvalue { i32, i32, i32, i32 } %208, 1
  %212 = bitcast i32 %211 to <2 x bfloat>
  %213 = extractvalue { i32, i32, i32, i32 } %208, 2
  %214 = bitcast i32 %213 to <2 x bfloat>
  %215 = extractvalue { i32, i32, i32, i32 } %208, 3
  %216 = bitcast i32 %215 to <2 x bfloat>
  %217 = extractelement <2 x bfloat> %210, i32 0
  %218 = extractelement <2 x bfloat> %210, i32 1
  %219 = extractelement <2 x bfloat> %212, i32 0
  %220 = extractelement <2 x bfloat> %212, i32 1
  %221 = extractelement <2 x bfloat> %214, i32 0
  %222 = extractelement <2 x bfloat> %214, i32 1
  %223 = extractelement <2 x bfloat> %216, i32 0
  %224 = extractelement <2 x bfloat> %216, i32 1
  %225 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %207)
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
  %242 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %217)
  %243 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %218)
  %244 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %219)
  %245 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %220)
  %246 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %221)
  %247 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %222)
  %248 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %223)
  %249 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %224)
  %250 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %234)
  %251 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %235)
  %252 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %236)
  %253 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %237)
  %254 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %238)
  %255 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %239)
  %256 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %240)
  %257 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %241)
  %258 = fadd float %189, %242
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
  %274 = fadd float %135, %258
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
  %290 = fadd float %81, %274
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
  %306 = fmul float %290, %290
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
  %322 = fadd float %306, %307
  %323 = fadd float %322, %308
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
  %337 = bitcast float %336 to i32
  %338 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %337, i32 16, i32 31)
  %339 = bitcast i32 %338 to float
  %340 = fadd float %336, %339
  %341 = bitcast float %340 to i32
  %342 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %341, i32 8, i32 31)
  %343 = bitcast i32 %342 to float
  %344 = fadd float %340, %343
  %345 = bitcast float %344 to i32
  %346 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %345, i32 4, i32 31)
  %347 = bitcast i32 %346 to float
  %348 = fadd float %344, %347
  %349 = bitcast float %348 to i32
  %350 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %349, i32 2, i32 31)
  %351 = bitcast i32 %350 to float
  %352 = fadd float %348, %351
  %353 = bitcast float %352 to i32
  %354 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %353, i32 1, i32 31)
  %355 = bitcast i32 %354 to float
  %356 = fadd float %352, %355
  %357 = urem i32 %13, 32
  %358 = urem i32 %14, 2
  %359 = icmp eq i32 %357, 0
  %360 = and i1 true, %359
  %361 = add i32 0, %358
  %362 = getelementptr float, ptr addrspace(3) @global_smem, i32 %361
  %363 = insertelement <1 x float> undef, float %356, i32 0
  %364 = extractelement <1 x float> %363, i32 0
  %365 = bitcast float %364 to i32
  %366 = insertelement <1 x i32> undef, i32 %365, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %362, <1 x i32> %366, i1 %360)
  call void @llvm.nvvm.barrier0()
  %367 = icmp slt i32 %12, 2
  %368 = getelementptr float, ptr addrspace(3) @global_smem, i32 %12
  %369 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %368, i1 %367)
  %370 = insertelement <1 x i32> undef, i32 %369, i32 0
  %371 = extractelement <1 x i32> %370, i32 0
  %372 = bitcast i32 %371 to float
  %373 = insertelement <1 x float> undef, float %372, i32 0
  %374 = extractelement <1 x float> %373, i32 0
  %375 = bitcast float %374 to i32
  %376 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %375, i32 1, i32 31)
  %377 = bitcast i32 %376 to float
  %378 = fadd float %374, %377
  %379 = urem i32 %13, 2
  %380 = icmp eq i32 %379, 0
  %381 = and i1 %367, %380
  %382 = insertelement <1 x float> undef, float %378, i32 0
  %383 = extractelement <1 x float> %382, i32 0
  %384 = bitcast float %383 to i32
  %385 = insertelement <1 x i32> undef, i32 %384, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %368, <1 x i32> %385, i1 %381)
  call void @llvm.nvvm.barrier0()
  %386 = load float, ptr addrspace(3) @global_smem, align 4
  %387 = fmul float %386, 0x3F50000000000000
  %388 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %389 = bitcast i32 %388 to <1 x float>
  %390 = extractelement <1 x float> %389, i32 0
  %391 = fadd float %387, %390
  %392 = call float @__nv_rsqrtf(float %391)
  %393 = fmul float %290, %392
  %394 = fmul float %291, %392
  %395 = fmul float %292, %392
  %396 = fmul float %293, %392
  %397 = fmul float %294, %392
  %398 = fmul float %295, %392
  %399 = fmul float %296, %392
  %400 = fmul float %297, %392
  %401 = fmul float %298, %392
  %402 = fmul float %299, %392
  %403 = fmul float %300, %392
  %404 = fmul float %301, %392
  %405 = fmul float %302, %392
  %406 = fmul float %303, %392
  %407 = fmul float %304, %392
  %408 = fmul float %305, %392
  %409 = getelementptr bfloat, ptr addrspace(1) %2, i64 %43
  %410 = getelementptr bfloat, ptr addrspace(1) %2, i64 %44
  %411 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %409)
  %412 = extractvalue { i32, i32, i32, i32 } %411, 0
  %413 = bitcast i32 %412 to <2 x bfloat>
  %414 = extractvalue { i32, i32, i32, i32 } %411, 1
  %415 = bitcast i32 %414 to <2 x bfloat>
  %416 = extractvalue { i32, i32, i32, i32 } %411, 2
  %417 = bitcast i32 %416 to <2 x bfloat>
  %418 = extractvalue { i32, i32, i32, i32 } %411, 3
  %419 = bitcast i32 %418 to <2 x bfloat>
  %420 = extractelement <2 x bfloat> %413, i32 0
  %421 = extractelement <2 x bfloat> %413, i32 1
  %422 = extractelement <2 x bfloat> %415, i32 0
  %423 = extractelement <2 x bfloat> %415, i32 1
  %424 = extractelement <2 x bfloat> %417, i32 0
  %425 = extractelement <2 x bfloat> %417, i32 1
  %426 = extractelement <2 x bfloat> %419, i32 0
  %427 = extractelement <2 x bfloat> %419, i32 1
  %428 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %410)
  %429 = extractvalue { i32, i32, i32, i32 } %428, 0
  %430 = bitcast i32 %429 to <2 x bfloat>
  %431 = extractvalue { i32, i32, i32, i32 } %428, 1
  %432 = bitcast i32 %431 to <2 x bfloat>
  %433 = extractvalue { i32, i32, i32, i32 } %428, 2
  %434 = bitcast i32 %433 to <2 x bfloat>
  %435 = extractvalue { i32, i32, i32, i32 } %428, 3
  %436 = bitcast i32 %435 to <2 x bfloat>
  %437 = extractelement <2 x bfloat> %430, i32 0
  %438 = extractelement <2 x bfloat> %430, i32 1
  %439 = extractelement <2 x bfloat> %432, i32 0
  %440 = extractelement <2 x bfloat> %432, i32 1
  %441 = extractelement <2 x bfloat> %434, i32 0
  %442 = extractelement <2 x bfloat> %434, i32 1
  %443 = extractelement <2 x bfloat> %436, i32 0
  %444 = extractelement <2 x bfloat> %436, i32 1
  %445 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %420)
  %446 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %421)
  %447 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %422)
  %448 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %423)
  %449 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %424)
  %450 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %425)
  %451 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %426)
  %452 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %427)
  %453 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %437)
  %454 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %438)
  %455 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %439)
  %456 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %440)
  %457 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %441)
  %458 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %442)
  %459 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %443)
  %460 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %444)
  %461 = fmul float %393, %445
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
  %477 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %461)
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
  %493 = getelementptr bfloat, ptr addrspace(1) %6, i64 %97
  %494 = getelementptr bfloat, ptr addrspace(1) %493, i64 %43
  %495 = getelementptr bfloat, ptr addrspace(1) %493, i64 %44
  %496 = insertelement <2 x bfloat> undef, bfloat %477, i32 0
  %497 = insertelement <2 x bfloat> %496, bfloat %478, i32 1
  %498 = bitcast <2 x bfloat> %497 to i32
  %499 = insertelement <2 x bfloat> undef, bfloat %479, i32 0
  %500 = insertelement <2 x bfloat> %499, bfloat %480, i32 1
  %501 = bitcast <2 x bfloat> %500 to i32
  %502 = insertelement <2 x bfloat> undef, bfloat %481, i32 0
  %503 = insertelement <2 x bfloat> %502, bfloat %482, i32 1
  %504 = bitcast <2 x bfloat> %503 to i32
  %505 = insertelement <2 x bfloat> undef, bfloat %483, i32 0
  %506 = insertelement <2 x bfloat> %505, bfloat %484, i32 1
  %507 = bitcast <2 x bfloat> %506 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %498, i32 %501, i32 %504, i32 %507, ptr addrspace(1) %494)
  %508 = insertelement <2 x bfloat> undef, bfloat %485, i32 0
  %509 = insertelement <2 x bfloat> %508, bfloat %486, i32 1
  %510 = bitcast <2 x bfloat> %509 to i32
  %511 = insertelement <2 x bfloat> undef, bfloat %487, i32 0
  %512 = insertelement <2 x bfloat> %511, bfloat %488, i32 1
  %513 = bitcast <2 x bfloat> %512 to i32
  %514 = insertelement <2 x bfloat> undef, bfloat %489, i32 0
  %515 = insertelement <2 x bfloat> %514, bfloat %490, i32 1
  %516 = bitcast <2 x bfloat> %515 to i32
  %517 = insertelement <2 x bfloat> undef, bfloat %491, i32 0
  %518 = insertelement <2 x bfloat> %517, bfloat %492, i32 1
  %519 = bitcast <2 x bfloat> %518 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %510, i32 %513, i32 %516, i32 %519, ptr addrspace(1) %495)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_40_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_40(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(65536) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(65536) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5, ptr noalias align 128 dereferenceable(65536) %arg6) #6 {
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
  %11 = mul i64 %10, 1024
  %12 = getelementptr bfloat, ptr addrspace(1) %2, i64 %11
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
  %98 = mul i64 %10, 2048
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
  %152 = getelementptr bfloat, ptr addrspace(1) %6, i64 %11
  %153 = getelementptr bfloat, ptr addrspace(1) %152, i64 %44
  %154 = getelementptr bfloat, ptr addrspace(1) %152, i64 %45
  %155 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %153)
  %156 = extractvalue { i32, i32, i32, i32 } %155, 0
  %157 = bitcast i32 %156 to <2 x bfloat>
  %158 = extractvalue { i32, i32, i32, i32 } %155, 1
  %159 = bitcast i32 %158 to <2 x bfloat>
  %160 = extractvalue { i32, i32, i32, i32 } %155, 2
  %161 = bitcast i32 %160 to <2 x bfloat>
  %162 = extractvalue { i32, i32, i32, i32 } %155, 3
  %163 = bitcast i32 %162 to <2 x bfloat>
  %164 = extractelement <2 x bfloat> %157, i32 0
  %165 = extractelement <2 x bfloat> %157, i32 1
  %166 = extractelement <2 x bfloat> %159, i32 0
  %167 = extractelement <2 x bfloat> %159, i32 1
  %168 = extractelement <2 x bfloat> %161, i32 0
  %169 = extractelement <2 x bfloat> %161, i32 1
  %170 = extractelement <2 x bfloat> %163, i32 0
  %171 = extractelement <2 x bfloat> %163, i32 1
  %172 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %154)
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
  %189 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %164)
  %190 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %165)
  %191 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %166)
  %192 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %167)
  %193 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %168)
  %194 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %169)
  %195 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %170)
  %196 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %171)
  %197 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %181)
  %198 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %182)
  %199 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %183)
  %200 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %184)
  %201 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %185)
  %202 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %186)
  %203 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %187)
  %204 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188)
  %205 = add i64 %98, 1024
  %206 = getelementptr bfloat, ptr addrspace(1) %5, i64 %205
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
  %259 = getelementptr bfloat, ptr addrspace(1) %4, i64 %11
  %260 = getelementptr bfloat, ptr addrspace(1) %259, i64 %44
  %261 = getelementptr bfloat, ptr addrspace(1) %259, i64 %45
  %262 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %260)
  %263 = extractvalue { i32, i32, i32, i32 } %262, 0
  %264 = bitcast i32 %263 to <2 x bfloat>
  %265 = extractvalue { i32, i32, i32, i32 } %262, 1
  %266 = bitcast i32 %265 to <2 x bfloat>
  %267 = extractvalue { i32, i32, i32, i32 } %262, 2
  %268 = bitcast i32 %267 to <2 x bfloat>
  %269 = extractvalue { i32, i32, i32, i32 } %262, 3
  %270 = bitcast i32 %269 to <2 x bfloat>
  %271 = extractelement <2 x bfloat> %264, i32 0
  %272 = extractelement <2 x bfloat> %264, i32 1
  %273 = extractelement <2 x bfloat> %266, i32 0
  %274 = extractelement <2 x bfloat> %266, i32 1
  %275 = extractelement <2 x bfloat> %268, i32 0
  %276 = extractelement <2 x bfloat> %268, i32 1
  %277 = extractelement <2 x bfloat> %270, i32 0
  %278 = extractelement <2 x bfloat> %270, i32 1
  %279 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %261)
  %280 = extractvalue { i32, i32, i32, i32 } %279, 0
  %281 = bitcast i32 %280 to <2 x bfloat>
  %282 = extractvalue { i32, i32, i32, i32 } %279, 1
  %283 = bitcast i32 %282 to <2 x bfloat>
  %284 = extractvalue { i32, i32, i32, i32 } %279, 2
  %285 = bitcast i32 %284 to <2 x bfloat>
  %286 = extractvalue { i32, i32, i32, i32 } %279, 3
  %287 = bitcast i32 %286 to <2 x bfloat>
  %288 = extractelement <2 x bfloat> %281, i32 0
  %289 = extractelement <2 x bfloat> %281, i32 1
  %290 = extractelement <2 x bfloat> %283, i32 0
  %291 = extractelement <2 x bfloat> %283, i32 1
  %292 = extractelement <2 x bfloat> %285, i32 0
  %293 = extractelement <2 x bfloat> %285, i32 1
  %294 = extractelement <2 x bfloat> %287, i32 0
  %295 = extractelement <2 x bfloat> %287, i32 1
  %296 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %271)
  %297 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %272)
  %298 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %273)
  %299 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %274)
  %300 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %275)
  %301 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %276)
  %302 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %277)
  %303 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %278)
  %304 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %288)
  %305 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %289)
  %306 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %290)
  %307 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %291)
  %308 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %292)
  %309 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %293)
  %310 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %294)
  %311 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295)
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
  %327 = fadd float %258, %311
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
  %343 = fadd float %204, %327
  %344 = fadd float %136, %328
  %345 = fadd float %137, %329
  %346 = fadd float %138, %330
  %347 = fadd float %139, %331
  %348 = fadd float %140, %332
  %349 = fadd float %141, %333
  %350 = fadd float %142, %334
  %351 = fadd float %143, %335
  %352 = fadd float %144, %336
  %353 = fadd float %145, %337
  %354 = fadd float %146, %338
  %355 = fadd float %147, %339
  %356 = fadd float %148, %340
  %357 = fadd float %149, %341
  %358 = fadd float %150, %342
  %359 = fadd float %151, %343
  %360 = fadd float %82, %344
  %361 = fadd float %83, %345
  %362 = fadd float %84, %346
  %363 = fadd float %85, %347
  %364 = fadd float %86, %348
  %365 = fadd float %87, %349
  %366 = fadd float %88, %350
  %367 = fadd float %89, %351
  %368 = fadd float %90, %352
  %369 = fadd float %91, %353
  %370 = fadd float %92, %354
  %371 = fadd float %93, %355
  %372 = fadd float %94, %356
  %373 = fadd float %95, %357
  %374 = fadd float %96, %358
  %375 = fadd float %97, %359
  %376 = fmul float %360, %360
  %377 = fmul float %361, %361
  %378 = fmul float %362, %362
  %379 = fmul float %363, %363
  %380 = fmul float %364, %364
  %381 = fmul float %365, %365
  %382 = fmul float %366, %366
  %383 = fmul float %367, %367
  %384 = fmul float %368, %368
  %385 = fmul float %369, %369
  %386 = fmul float %370, %370
  %387 = fmul float %371, %371
  %388 = fmul float %372, %372
  %389 = fmul float %373, %373
  %390 = fmul float %374, %374
  %391 = fmul float %375, %375
  %392 = fadd float %376, %377
  %393 = fadd float %392, %378
  %394 = fadd float %393, %379
  %395 = fadd float %394, %380
  %396 = fadd float %395, %381
  %397 = fadd float %396, %382
  %398 = fadd float %397, %383
  %399 = fadd float %398, %384
  %400 = fadd float %399, %385
  %401 = fadd float %400, %386
  %402 = fadd float %401, %387
  %403 = fadd float %402, %388
  %404 = fadd float %403, %389
  %405 = fadd float %404, %390
  %406 = fadd float %405, %391
  %407 = bitcast float %406 to i32
  %408 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %407, i32 16, i32 31)
  %409 = bitcast i32 %408 to float
  %410 = fadd float %406, %409
  %411 = bitcast float %410 to i32
  %412 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %411, i32 8, i32 31)
  %413 = bitcast i32 %412 to float
  %414 = fadd float %410, %413
  %415 = bitcast float %414 to i32
  %416 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %415, i32 4, i32 31)
  %417 = bitcast i32 %416 to float
  %418 = fadd float %414, %417
  %419 = bitcast float %418 to i32
  %420 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %419, i32 2, i32 31)
  %421 = bitcast i32 %420 to float
  %422 = fadd float %418, %421
  %423 = bitcast float %422 to i32
  %424 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %423, i32 1, i32 31)
  %425 = bitcast i32 %424 to float
  %426 = fadd float %422, %425
  %427 = urem i32 %14, 32
  %428 = urem i32 %15, 2
  %429 = icmp eq i32 %427, 0
  %430 = and i1 true, %429
  %431 = add i32 0, %428
  %432 = getelementptr float, ptr addrspace(3) @global_smem, i32 %431
  %433 = insertelement <1 x float> undef, float %426, i32 0
  %434 = extractelement <1 x float> %433, i32 0
  %435 = bitcast float %434 to i32
  %436 = insertelement <1 x i32> undef, i32 %435, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %432, <1 x i32> %436, i1 %430)
  call void @llvm.nvvm.barrier0()
  %437 = icmp slt i32 %13, 2
  %438 = getelementptr float, ptr addrspace(3) @global_smem, i32 %13
  %439 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %438, i1 %437)
  %440 = insertelement <1 x i32> undef, i32 %439, i32 0
  %441 = extractelement <1 x i32> %440, i32 0
  %442 = bitcast i32 %441 to float
  %443 = insertelement <1 x float> undef, float %442, i32 0
  %444 = extractelement <1 x float> %443, i32 0
  %445 = bitcast float %444 to i32
  %446 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %445, i32 1, i32 31)
  %447 = bitcast i32 %446 to float
  %448 = fadd float %444, %447
  %449 = urem i32 %14, 2
  %450 = icmp eq i32 %449, 0
  %451 = and i1 %437, %450
  %452 = insertelement <1 x float> undef, float %448, i32 0
  %453 = extractelement <1 x float> %452, i32 0
  %454 = bitcast float %453 to i32
  %455 = insertelement <1 x i32> undef, i32 %454, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %438, <1 x i32> %455, i1 %451)
  call void @llvm.nvvm.barrier0()
  %456 = load float, ptr addrspace(3) @global_smem, align 4
  %457 = fmul float %456, 0x3F50000000000000
  %458 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %459 = bitcast i32 %458 to <1 x float>
  %460 = extractelement <1 x float> %459, i32 0
  %461 = fadd float %457, %460
  %462 = call float @__nv_rsqrtf(float %461)
  %463 = fmul float %360, %462
  %464 = fmul float %361, %462
  %465 = fmul float %362, %462
  %466 = fmul float %363, %462
  %467 = fmul float %364, %462
  %468 = fmul float %365, %462
  %469 = fmul float %366, %462
  %470 = fmul float %367, %462
  %471 = fmul float %368, %462
  %472 = fmul float %369, %462
  %473 = fmul float %370, %462
  %474 = fmul float %371, %462
  %475 = fmul float %372, %462
  %476 = fmul float %373, %462
  %477 = fmul float %374, %462
  %478 = fmul float %375, %462
  %479 = getelementptr bfloat, ptr addrspace(1) %3, i64 %44
  %480 = getelementptr bfloat, ptr addrspace(1) %3, i64 %45
  %481 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %479)
  %482 = extractvalue { i32, i32, i32, i32 } %481, 0
  %483 = bitcast i32 %482 to <2 x bfloat>
  %484 = extractvalue { i32, i32, i32, i32 } %481, 1
  %485 = bitcast i32 %484 to <2 x bfloat>
  %486 = extractvalue { i32, i32, i32, i32 } %481, 2
  %487 = bitcast i32 %486 to <2 x bfloat>
  %488 = extractvalue { i32, i32, i32, i32 } %481, 3
  %489 = bitcast i32 %488 to <2 x bfloat>
  %490 = extractelement <2 x bfloat> %483, i32 0
  %491 = extractelement <2 x bfloat> %483, i32 1
  %492 = extractelement <2 x bfloat> %485, i32 0
  %493 = extractelement <2 x bfloat> %485, i32 1
  %494 = extractelement <2 x bfloat> %487, i32 0
  %495 = extractelement <2 x bfloat> %487, i32 1
  %496 = extractelement <2 x bfloat> %489, i32 0
  %497 = extractelement <2 x bfloat> %489, i32 1
  %498 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %480)
  %499 = extractvalue { i32, i32, i32, i32 } %498, 0
  %500 = bitcast i32 %499 to <2 x bfloat>
  %501 = extractvalue { i32, i32, i32, i32 } %498, 1
  %502 = bitcast i32 %501 to <2 x bfloat>
  %503 = extractvalue { i32, i32, i32, i32 } %498, 2
  %504 = bitcast i32 %503 to <2 x bfloat>
  %505 = extractvalue { i32, i32, i32, i32 } %498, 3
  %506 = bitcast i32 %505 to <2 x bfloat>
  %507 = extractelement <2 x bfloat> %500, i32 0
  %508 = extractelement <2 x bfloat> %500, i32 1
  %509 = extractelement <2 x bfloat> %502, i32 0
  %510 = extractelement <2 x bfloat> %502, i32 1
  %511 = extractelement <2 x bfloat> %504, i32 0
  %512 = extractelement <2 x bfloat> %504, i32 1
  %513 = extractelement <2 x bfloat> %506, i32 0
  %514 = extractelement <2 x bfloat> %506, i32 1
  %515 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %490)
  %516 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %491)
  %517 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %492)
  %518 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %493)
  %519 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %494)
  %520 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %495)
  %521 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %496)
  %522 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %497)
  %523 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %507)
  %524 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %508)
  %525 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %509)
  %526 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %510)
  %527 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %511)
  %528 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %512)
  %529 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %513)
  %530 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %514)
  %531 = fmul float %463, %515
  %532 = fmul float %464, %516
  %533 = fmul float %465, %517
  %534 = fmul float %466, %518
  %535 = fmul float %467, %519
  %536 = fmul float %468, %520
  %537 = fmul float %469, %521
  %538 = fmul float %470, %522
  %539 = fmul float %471, %523
  %540 = fmul float %472, %524
  %541 = fmul float %473, %525
  %542 = fmul float %474, %526
  %543 = fmul float %475, %527
  %544 = fmul float %476, %528
  %545 = fmul float %477, %529
  %546 = fmul float %478, %530
  %547 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %531)
  %548 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %532)
  %549 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %533)
  %550 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %534)
  %551 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %535)
  %552 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %536)
  %553 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %537)
  %554 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %538)
  %555 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %539)
  %556 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %540)
  %557 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %541)
  %558 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %542)
  %559 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %543)
  %560 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %544)
  %561 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %545)
  %562 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %546)
  %563 = getelementptr bfloat, ptr addrspace(1) %7, i64 %11
  %564 = getelementptr bfloat, ptr addrspace(1) %563, i64 %44
  %565 = getelementptr bfloat, ptr addrspace(1) %563, i64 %45
  %566 = insertelement <2 x bfloat> undef, bfloat %547, i32 0
  %567 = insertelement <2 x bfloat> %566, bfloat %548, i32 1
  %568 = bitcast <2 x bfloat> %567 to i32
  %569 = insertelement <2 x bfloat> undef, bfloat %549, i32 0
  %570 = insertelement <2 x bfloat> %569, bfloat %550, i32 1
  %571 = bitcast <2 x bfloat> %570 to i32
  %572 = insertelement <2 x bfloat> undef, bfloat %551, i32 0
  %573 = insertelement <2 x bfloat> %572, bfloat %552, i32 1
  %574 = bitcast <2 x bfloat> %573 to i32
  %575 = insertelement <2 x bfloat> undef, bfloat %553, i32 0
  %576 = insertelement <2 x bfloat> %575, bfloat %554, i32 1
  %577 = bitcast <2 x bfloat> %576 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %568, i32 %571, i32 %574, i32 %577, ptr addrspace(1) %564)
  %578 = insertelement <2 x bfloat> undef, bfloat %555, i32 0
  %579 = insertelement <2 x bfloat> %578, bfloat %556, i32 1
  %580 = bitcast <2 x bfloat> %579 to i32
  %581 = insertelement <2 x bfloat> undef, bfloat %557, i32 0
  %582 = insertelement <2 x bfloat> %581, bfloat %558, i32 1
  %583 = bitcast <2 x bfloat> %582 to i32
  %584 = insertelement <2 x bfloat> undef, bfloat %559, i32 0
  %585 = insertelement <2 x bfloat> %584, bfloat %560, i32 1
  %586 = bitcast <2 x bfloat> %585 to i32
  %587 = insertelement <2 x bfloat> undef, bfloat %561, i32 0
  %588 = insertelement <2 x bfloat> %587, bfloat %562, i32 1
  %589 = bitcast <2 x bfloat> %588 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %580, i32 %583, i32 %586, i32 %589, ptr addrspace(1) %565)
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

declare ptx_kernel void @fusion_34_impl(ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_34(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(262144) %arg1, ptr noalias align 16 dereferenceable(256) %arg2, ptr noalias align 128 dereferenceable(131072) %arg3) #6 {
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
  %16 = call float @fused_concatenate_convert_197_7(ptr %0, ptr %1, ptr %2, i32 %7, i32 %8)
  %17 = fmul float %15, %16
  %18 = add i32 %8, 64
  %19 = add i32 %13, 64
  %20 = getelementptr inbounds float, ptr %0, i32 %19
  %21 = load float, ptr %20, align 4, !invariant.load !3
  %22 = call float @fused_concatenate_convert_197_7(ptr %0, ptr %1, ptr %2, i32 %7, i32 %18)
  %23 = fmul float %21, %22
  %24 = fsub float %17, %23
  %25 = fptrunc float %24 to bfloat
  %26 = getelementptr inbounds bfloat, ptr %3, i32 %13
  store bfloat %25, ptr %26, align 2
  %27 = load float, ptr %20, align 4, !invariant.load !3
  %28 = call float @fused_concatenate_convert_197_7(ptr %0, ptr %1, ptr %2, i32 %7, i32 %8)
  %29 = fmul float %27, %28
  %30 = load float, ptr %14, align 4, !invariant.load !3
  %31 = call float @fused_concatenate_convert_197_7(ptr %0, ptr %1, ptr %2, i32 %7, i32 %18)
  %32 = fmul float %30, %31
  %33 = fadd float %29, %32
  %34 = fptrunc float %33 to bfloat
  %35 = getelementptr inbounds bfloat, ptr %3, i32 %19
  store bfloat %34, ptr %35, align 2
  ret void
}

define internal float @fused_concatenate_convert_197_7(ptr noalias %0, ptr noalias %1, ptr noalias %2, i32 %3, i32 %4) {
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

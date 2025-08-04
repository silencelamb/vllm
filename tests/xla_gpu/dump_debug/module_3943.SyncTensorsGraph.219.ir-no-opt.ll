; ModuleID = 'SyncTensorsGraph.219'
source_filename = "SyncTensorsGraph.219"
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

declare ptx_kernel void @gemm_fusion_dot_29_0_impl(ptr, ptr, ptr) #2

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #3

define ptx_kernel void @gemm_fusion_dot_29_0(ptr noalias align 16 dereferenceable(4194304) %arg0, ptr noalias align 128 dereferenceable(262144) %arg1) #0 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr null to ptr addrspace(1)
  %4 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %5 = sdiv i32 %4, 512
  %6 = mul i32 %5, 8
  %7 = sub i32 4, %6
  %8 = icmp slt i32 %7, 8
  %9 = select i1 %8, i32 %7, i32 8
  %10 = srem i32 %4, %9
  %11 = add i32 %6, %10
  %12 = srem i32 %4, 512
  %13 = sdiv i32 %12, %9
  %14 = mul i32 %13, 16
  %15 = sext i32 %14 to i64
  %16 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %17 = urem i32 %16, 32
  %18 = udiv i32 %16, 32
  %19 = and i32 %17, 1
  %20 = icmp eq i32 %19, 0
  %21 = select i1 %20, i32 0, i32 8
  %22 = xor i32 0, %21
  %23 = and i32 %17, 2
  %24 = icmp eq i32 %23, 0
  %25 = select i1 %24, i32 0, i32 16
  %26 = xor i32 %22, %25
  %27 = and i32 %17, 4
  %28 = icmp eq i32 %27, 0
  %29 = select i1 %28, i32 0, i32 32
  %30 = xor i32 %26, %29
  %31 = and i32 %17, 8
  %32 = icmp eq i32 %31, 0
  %33 = select i1 %32, i32 0, i32 64
  %34 = xor i32 %30, %33
  %35 = and i32 %17, 16
  %36 = icmp eq i32 %35, 0
  %37 = select i1 %36, i32 0, i32 128
  %38 = xor i32 %34, %37
  %39 = and i32 %18, 1
  %40 = icmp eq i32 %39, 0
  %41 = select i1 %40, i32 0, i32 256
  %42 = xor i32 %38, %41
  %43 = xor i32 %42, 0
  %44 = add i32 %43, 0
  %45 = sext i32 %44 to i64
  %46 = and i32 %18, 2
  %47 = icmp eq i32 %46, 0
  %48 = select i1 %47, i32 0, i32 1
  %49 = xor i32 0, %48
  %50 = xor i32 %49, 0
  %51 = xor i32 %49, 2
  %52 = xor i32 %49, 4
  %53 = xor i32 %49, 6
  %54 = xor i32 %49, 8
  %55 = xor i32 %49, 10
  %56 = xor i32 %49, 12
  %57 = xor i32 %49, 14
  %58 = add i32 %50, 0
  %59 = add i32 %51, 0
  %60 = add i32 %52, 0
  %61 = add i32 %53, 0
  %62 = add i32 %54, 0
  %63 = add i32 %55, 0
  %64 = add i32 %56, 0
  %65 = add i32 %57, 0
  %66 = sext i32 %58 to i64
  %67 = sext i32 %59 to i64
  %68 = sext i32 %60 to i64
  %69 = sext i32 %61 to i64
  %70 = sext i32 %62 to i64
  %71 = sext i32 %63 to i64
  %72 = sext i32 %64 to i64
  %73 = sext i32 %65 to i64
  %74 = add i64 %15, %66
  %75 = add i64 %15, %67
  %76 = add i64 %15, %68
  %77 = add i64 %15, %69
  %78 = add i64 %15, %70
  %79 = add i64 %15, %71
  %80 = add i64 %15, %72
  %81 = add i64 %15, %73
  %82 = mul i64 %74, 2048
  %83 = mul i64 %75, 2048
  %84 = mul i64 %76, 2048
  %85 = mul i64 %77, 2048
  %86 = mul i64 %78, 2048
  %87 = mul i64 %79, 2048
  %88 = mul i64 %80, 2048
  %89 = mul i64 %81, 2048
  br label %90

90:                                               ; preds = %95, %0
  %91 = phi i32 [ %1139, %95 ], [ 0, %0 ]
  %92 = phi i64 [ %372, %95 ], [ 0, %0 ]
  %93 = phi { float, float, float, float } [ %1138, %95 ], [ zeroinitializer, %0 ]
  %94 = icmp slt i32 %91, 2048
  br i1 %94, label %95, label %1140

95:                                               ; preds = %90
  %96 = add i64 %92, %45
  %97 = add i64 %96, %82
  %98 = add i64 %96, %83
  %99 = add i64 %96, %84
  %100 = add i64 %96, %85
  %101 = add i64 %96, %86
  %102 = add i64 %96, %87
  %103 = add i64 %96, %88
  %104 = add i64 %96, %89
  %105 = getelementptr bfloat, ptr addrspace(1) %1, i64 %97
  %106 = getelementptr bfloat, ptr addrspace(1) %1, i64 %98
  %107 = getelementptr bfloat, ptr addrspace(1) %1, i64 %99
  %108 = getelementptr bfloat, ptr addrspace(1) %1, i64 %100
  %109 = getelementptr bfloat, ptr addrspace(1) %1, i64 %101
  %110 = getelementptr bfloat, ptr addrspace(1) %1, i64 %102
  %111 = getelementptr bfloat, ptr addrspace(1) %1, i64 %103
  %112 = getelementptr bfloat, ptr addrspace(1) %1, i64 %104
  %113 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %105)
  %114 = extractvalue { i32, i32, i32, i32 } %113, 0
  %115 = bitcast i32 %114 to <2 x bfloat>
  %116 = extractvalue { i32, i32, i32, i32 } %113, 1
  %117 = bitcast i32 %116 to <2 x bfloat>
  %118 = extractvalue { i32, i32, i32, i32 } %113, 2
  %119 = bitcast i32 %118 to <2 x bfloat>
  %120 = extractvalue { i32, i32, i32, i32 } %113, 3
  %121 = bitcast i32 %120 to <2 x bfloat>
  %122 = extractelement <2 x bfloat> %115, i32 0
  %123 = extractelement <2 x bfloat> %115, i32 1
  %124 = extractelement <2 x bfloat> %117, i32 0
  %125 = extractelement <2 x bfloat> %117, i32 1
  %126 = extractelement <2 x bfloat> %119, i32 0
  %127 = extractelement <2 x bfloat> %119, i32 1
  %128 = extractelement <2 x bfloat> %121, i32 0
  %129 = extractelement <2 x bfloat> %121, i32 1
  %130 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %106)
  %131 = extractvalue { i32, i32, i32, i32 } %130, 0
  %132 = bitcast i32 %131 to <2 x bfloat>
  %133 = extractvalue { i32, i32, i32, i32 } %130, 1
  %134 = bitcast i32 %133 to <2 x bfloat>
  %135 = extractvalue { i32, i32, i32, i32 } %130, 2
  %136 = bitcast i32 %135 to <2 x bfloat>
  %137 = extractvalue { i32, i32, i32, i32 } %130, 3
  %138 = bitcast i32 %137 to <2 x bfloat>
  %139 = extractelement <2 x bfloat> %132, i32 0
  %140 = extractelement <2 x bfloat> %132, i32 1
  %141 = extractelement <2 x bfloat> %134, i32 0
  %142 = extractelement <2 x bfloat> %134, i32 1
  %143 = extractelement <2 x bfloat> %136, i32 0
  %144 = extractelement <2 x bfloat> %136, i32 1
  %145 = extractelement <2 x bfloat> %138, i32 0
  %146 = extractelement <2 x bfloat> %138, i32 1
  %147 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %107)
  %148 = extractvalue { i32, i32, i32, i32 } %147, 0
  %149 = bitcast i32 %148 to <2 x bfloat>
  %150 = extractvalue { i32, i32, i32, i32 } %147, 1
  %151 = bitcast i32 %150 to <2 x bfloat>
  %152 = extractvalue { i32, i32, i32, i32 } %147, 2
  %153 = bitcast i32 %152 to <2 x bfloat>
  %154 = extractvalue { i32, i32, i32, i32 } %147, 3
  %155 = bitcast i32 %154 to <2 x bfloat>
  %156 = extractelement <2 x bfloat> %149, i32 0
  %157 = extractelement <2 x bfloat> %149, i32 1
  %158 = extractelement <2 x bfloat> %151, i32 0
  %159 = extractelement <2 x bfloat> %151, i32 1
  %160 = extractelement <2 x bfloat> %153, i32 0
  %161 = extractelement <2 x bfloat> %153, i32 1
  %162 = extractelement <2 x bfloat> %155, i32 0
  %163 = extractelement <2 x bfloat> %155, i32 1
  %164 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %108)
  %165 = extractvalue { i32, i32, i32, i32 } %164, 0
  %166 = bitcast i32 %165 to <2 x bfloat>
  %167 = extractvalue { i32, i32, i32, i32 } %164, 1
  %168 = bitcast i32 %167 to <2 x bfloat>
  %169 = extractvalue { i32, i32, i32, i32 } %164, 2
  %170 = bitcast i32 %169 to <2 x bfloat>
  %171 = extractvalue { i32, i32, i32, i32 } %164, 3
  %172 = bitcast i32 %171 to <2 x bfloat>
  %173 = extractelement <2 x bfloat> %166, i32 0
  %174 = extractelement <2 x bfloat> %166, i32 1
  %175 = extractelement <2 x bfloat> %168, i32 0
  %176 = extractelement <2 x bfloat> %168, i32 1
  %177 = extractelement <2 x bfloat> %170, i32 0
  %178 = extractelement <2 x bfloat> %170, i32 1
  %179 = extractelement <2 x bfloat> %172, i32 0
  %180 = extractelement <2 x bfloat> %172, i32 1
  %181 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %109)
  %182 = extractvalue { i32, i32, i32, i32 } %181, 0
  %183 = bitcast i32 %182 to <2 x bfloat>
  %184 = extractvalue { i32, i32, i32, i32 } %181, 1
  %185 = bitcast i32 %184 to <2 x bfloat>
  %186 = extractvalue { i32, i32, i32, i32 } %181, 2
  %187 = bitcast i32 %186 to <2 x bfloat>
  %188 = extractvalue { i32, i32, i32, i32 } %181, 3
  %189 = bitcast i32 %188 to <2 x bfloat>
  %190 = extractelement <2 x bfloat> %183, i32 0
  %191 = extractelement <2 x bfloat> %183, i32 1
  %192 = extractelement <2 x bfloat> %185, i32 0
  %193 = extractelement <2 x bfloat> %185, i32 1
  %194 = extractelement <2 x bfloat> %187, i32 0
  %195 = extractelement <2 x bfloat> %187, i32 1
  %196 = extractelement <2 x bfloat> %189, i32 0
  %197 = extractelement <2 x bfloat> %189, i32 1
  %198 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %110)
  %199 = extractvalue { i32, i32, i32, i32 } %198, 0
  %200 = bitcast i32 %199 to <2 x bfloat>
  %201 = extractvalue { i32, i32, i32, i32 } %198, 1
  %202 = bitcast i32 %201 to <2 x bfloat>
  %203 = extractvalue { i32, i32, i32, i32 } %198, 2
  %204 = bitcast i32 %203 to <2 x bfloat>
  %205 = extractvalue { i32, i32, i32, i32 } %198, 3
  %206 = bitcast i32 %205 to <2 x bfloat>
  %207 = extractelement <2 x bfloat> %200, i32 0
  %208 = extractelement <2 x bfloat> %200, i32 1
  %209 = extractelement <2 x bfloat> %202, i32 0
  %210 = extractelement <2 x bfloat> %202, i32 1
  %211 = extractelement <2 x bfloat> %204, i32 0
  %212 = extractelement <2 x bfloat> %204, i32 1
  %213 = extractelement <2 x bfloat> %206, i32 0
  %214 = extractelement <2 x bfloat> %206, i32 1
  %215 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %111)
  %216 = extractvalue { i32, i32, i32, i32 } %215, 0
  %217 = bitcast i32 %216 to <2 x bfloat>
  %218 = extractvalue { i32, i32, i32, i32 } %215, 1
  %219 = bitcast i32 %218 to <2 x bfloat>
  %220 = extractvalue { i32, i32, i32, i32 } %215, 2
  %221 = bitcast i32 %220 to <2 x bfloat>
  %222 = extractvalue { i32, i32, i32, i32 } %215, 3
  %223 = bitcast i32 %222 to <2 x bfloat>
  %224 = extractelement <2 x bfloat> %217, i32 0
  %225 = extractelement <2 x bfloat> %217, i32 1
  %226 = extractelement <2 x bfloat> %219, i32 0
  %227 = extractelement <2 x bfloat> %219, i32 1
  %228 = extractelement <2 x bfloat> %221, i32 0
  %229 = extractelement <2 x bfloat> %221, i32 1
  %230 = extractelement <2 x bfloat> %223, i32 0
  %231 = extractelement <2 x bfloat> %223, i32 1
  %232 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %112)
  %233 = extractvalue { i32, i32, i32, i32 } %232, 0
  %234 = bitcast i32 %233 to <2 x bfloat>
  %235 = extractvalue { i32, i32, i32, i32 } %232, 1
  %236 = bitcast i32 %235 to <2 x bfloat>
  %237 = extractvalue { i32, i32, i32, i32 } %232, 2
  %238 = bitcast i32 %237 to <2 x bfloat>
  %239 = extractvalue { i32, i32, i32, i32 } %232, 3
  %240 = bitcast i32 %239 to <2 x bfloat>
  %241 = extractelement <2 x bfloat> %234, i32 0
  %242 = extractelement <2 x bfloat> %234, i32 1
  %243 = extractelement <2 x bfloat> %236, i32 0
  %244 = extractelement <2 x bfloat> %236, i32 1
  %245 = extractelement <2 x bfloat> %238, i32 0
  %246 = extractelement <2 x bfloat> %238, i32 1
  %247 = extractelement <2 x bfloat> %240, i32 0
  %248 = extractelement <2 x bfloat> %240, i32 1
  call void @llvm.nvvm.barrier0()
  %249 = select i1 %47, i32 0, i32 520
  %250 = xor i32 %42, %249
  %251 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %250
  %252 = insertelement <8 x bfloat> undef, bfloat %122, i32 0
  %253 = insertelement <8 x bfloat> %252, bfloat %123, i32 1
  %254 = insertelement <8 x bfloat> %253, bfloat %124, i32 2
  %255 = insertelement <8 x bfloat> %254, bfloat %125, i32 3
  %256 = insertelement <8 x bfloat> %255, bfloat %126, i32 4
  %257 = insertelement <8 x bfloat> %256, bfloat %127, i32 5
  %258 = insertelement <8 x bfloat> %257, bfloat %128, i32 6
  %259 = insertelement <8 x bfloat> %258, bfloat %129, i32 7
  store <8 x bfloat> %259, ptr addrspace(3) %251, align 16
  %260 = xor i32 1040, %21
  %261 = xor i32 %260, %25
  %262 = xor i32 %261, %29
  %263 = xor i32 %262, %33
  %264 = xor i32 %263, %37
  %265 = xor i32 %264, %41
  %266 = xor i32 %265, %249
  %267 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %266
  %268 = insertelement <8 x bfloat> undef, bfloat %139, i32 0
  %269 = insertelement <8 x bfloat> %268, bfloat %140, i32 1
  %270 = insertelement <8 x bfloat> %269, bfloat %141, i32 2
  %271 = insertelement <8 x bfloat> %270, bfloat %142, i32 3
  %272 = insertelement <8 x bfloat> %271, bfloat %143, i32 4
  %273 = insertelement <8 x bfloat> %272, bfloat %144, i32 5
  %274 = insertelement <8 x bfloat> %273, bfloat %145, i32 6
  %275 = insertelement <8 x bfloat> %274, bfloat %146, i32 7
  store <8 x bfloat> %275, ptr addrspace(3) %267, align 16
  %276 = xor i32 2080, %21
  %277 = xor i32 %276, %25
  %278 = xor i32 %277, %29
  %279 = xor i32 %278, %33
  %280 = xor i32 %279, %37
  %281 = xor i32 %280, %41
  %282 = xor i32 %281, %249
  %283 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %282
  %284 = insertelement <8 x bfloat> undef, bfloat %156, i32 0
  %285 = insertelement <8 x bfloat> %284, bfloat %157, i32 1
  %286 = insertelement <8 x bfloat> %285, bfloat %158, i32 2
  %287 = insertelement <8 x bfloat> %286, bfloat %159, i32 3
  %288 = insertelement <8 x bfloat> %287, bfloat %160, i32 4
  %289 = insertelement <8 x bfloat> %288, bfloat %161, i32 5
  %290 = insertelement <8 x bfloat> %289, bfloat %162, i32 6
  %291 = insertelement <8 x bfloat> %290, bfloat %163, i32 7
  store <8 x bfloat> %291, ptr addrspace(3) %283, align 16
  %292 = xor i32 3120, %21
  %293 = xor i32 %292, %25
  %294 = xor i32 %293, %29
  %295 = xor i32 %294, %33
  %296 = xor i32 %295, %37
  %297 = xor i32 %296, %41
  %298 = xor i32 %297, %249
  %299 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %298
  %300 = insertelement <8 x bfloat> undef, bfloat %173, i32 0
  %301 = insertelement <8 x bfloat> %300, bfloat %174, i32 1
  %302 = insertelement <8 x bfloat> %301, bfloat %175, i32 2
  %303 = insertelement <8 x bfloat> %302, bfloat %176, i32 3
  %304 = insertelement <8 x bfloat> %303, bfloat %177, i32 4
  %305 = insertelement <8 x bfloat> %304, bfloat %178, i32 5
  %306 = insertelement <8 x bfloat> %305, bfloat %179, i32 6
  %307 = insertelement <8 x bfloat> %306, bfloat %180, i32 7
  store <8 x bfloat> %307, ptr addrspace(3) %299, align 16
  %308 = xor i32 4096, %21
  %309 = xor i32 %308, %25
  %310 = xor i32 %309, %29
  %311 = xor i32 %310, %33
  %312 = xor i32 %311, %37
  %313 = xor i32 %312, %41
  %314 = xor i32 %313, %249
  %315 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %314
  %316 = insertelement <8 x bfloat> undef, bfloat %190, i32 0
  %317 = insertelement <8 x bfloat> %316, bfloat %191, i32 1
  %318 = insertelement <8 x bfloat> %317, bfloat %192, i32 2
  %319 = insertelement <8 x bfloat> %318, bfloat %193, i32 3
  %320 = insertelement <8 x bfloat> %319, bfloat %194, i32 4
  %321 = insertelement <8 x bfloat> %320, bfloat %195, i32 5
  %322 = insertelement <8 x bfloat> %321, bfloat %196, i32 6
  %323 = insertelement <8 x bfloat> %322, bfloat %197, i32 7
  store <8 x bfloat> %323, ptr addrspace(3) %315, align 16
  %324 = xor i32 5136, %21
  %325 = xor i32 %324, %25
  %326 = xor i32 %325, %29
  %327 = xor i32 %326, %33
  %328 = xor i32 %327, %37
  %329 = xor i32 %328, %41
  %330 = xor i32 %329, %249
  %331 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %330
  %332 = insertelement <8 x bfloat> undef, bfloat %207, i32 0
  %333 = insertelement <8 x bfloat> %332, bfloat %208, i32 1
  %334 = insertelement <8 x bfloat> %333, bfloat %209, i32 2
  %335 = insertelement <8 x bfloat> %334, bfloat %210, i32 3
  %336 = insertelement <8 x bfloat> %335, bfloat %211, i32 4
  %337 = insertelement <8 x bfloat> %336, bfloat %212, i32 5
  %338 = insertelement <8 x bfloat> %337, bfloat %213, i32 6
  %339 = insertelement <8 x bfloat> %338, bfloat %214, i32 7
  store <8 x bfloat> %339, ptr addrspace(3) %331, align 16
  %340 = xor i32 6176, %21
  %341 = xor i32 %340, %25
  %342 = xor i32 %341, %29
  %343 = xor i32 %342, %33
  %344 = xor i32 %343, %37
  %345 = xor i32 %344, %41
  %346 = xor i32 %345, %249
  %347 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %346
  %348 = insertelement <8 x bfloat> undef, bfloat %224, i32 0
  %349 = insertelement <8 x bfloat> %348, bfloat %225, i32 1
  %350 = insertelement <8 x bfloat> %349, bfloat %226, i32 2
  %351 = insertelement <8 x bfloat> %350, bfloat %227, i32 3
  %352 = insertelement <8 x bfloat> %351, bfloat %228, i32 4
  %353 = insertelement <8 x bfloat> %352, bfloat %229, i32 5
  %354 = insertelement <8 x bfloat> %353, bfloat %230, i32 6
  %355 = insertelement <8 x bfloat> %354, bfloat %231, i32 7
  store <8 x bfloat> %355, ptr addrspace(3) %347, align 16
  %356 = xor i32 7216, %21
  %357 = xor i32 %356, %25
  %358 = xor i32 %357, %29
  %359 = xor i32 %358, %33
  %360 = xor i32 %359, %37
  %361 = xor i32 %360, %41
  %362 = xor i32 %361, %249
  %363 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %362
  %364 = insertelement <8 x bfloat> undef, bfloat %241, i32 0
  %365 = insertelement <8 x bfloat> %364, bfloat %242, i32 1
  %366 = insertelement <8 x bfloat> %365, bfloat %243, i32 2
  %367 = insertelement <8 x bfloat> %366, bfloat %244, i32 3
  %368 = insertelement <8 x bfloat> %367, bfloat %245, i32 4
  %369 = insertelement <8 x bfloat> %368, bfloat %246, i32 5
  %370 = insertelement <8 x bfloat> %369, bfloat %247, i32 6
  %371 = insertelement <8 x bfloat> %370, bfloat %248, i32 7
  store <8 x bfloat> %371, ptr addrspace(3) %363, align 16
  %372 = add i64 %92, 512
  call void @llvm.nvvm.barrier0()
  %373 = select i1 %20, i32 0, i32 520
  %374 = xor i32 0, %373
  %375 = select i1 %24, i32 0, i32 1040
  %376 = xor i32 %374, %375
  %377 = select i1 %28, i32 0, i32 2080
  %378 = xor i32 %376, %377
  %379 = select i1 %32, i32 0, i32 8
  %380 = xor i32 %378, %379
  %381 = select i1 %36, i32 0, i32 16
  %382 = xor i32 %380, %381
  %383 = select i1 %40, i32 0, i32 4096
  %384 = xor i32 %382, %383
  %385 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %384
  %386 = ptrtoint ptr addrspace(3) %385 to i32
  %387 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %386)
  %388 = extractvalue { i32, i32, i32, i32 } %387, 0
  %389 = extractvalue { i32, i32, i32, i32 } %387, 1
  %390 = extractvalue { i32, i32, i32, i32 } %387, 2
  %391 = extractvalue { i32, i32, i32, i32 } %387, 3
  %392 = xor i32 32, %373
  %393 = xor i32 %392, %375
  %394 = xor i32 %393, %377
  %395 = xor i32 %394, %379
  %396 = xor i32 %395, %381
  %397 = xor i32 %396, %383
  %398 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %397
  %399 = ptrtoint ptr addrspace(3) %398 to i32
  %400 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %399)
  %401 = extractvalue { i32, i32, i32, i32 } %400, 0
  %402 = extractvalue { i32, i32, i32, i32 } %400, 1
  %403 = extractvalue { i32, i32, i32, i32 } %400, 2
  %404 = extractvalue { i32, i32, i32, i32 } %400, 3
  %405 = xor i32 64, %373
  %406 = xor i32 %405, %375
  %407 = xor i32 %406, %377
  %408 = xor i32 %407, %379
  %409 = xor i32 %408, %381
  %410 = xor i32 %409, %383
  %411 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %410
  %412 = ptrtoint ptr addrspace(3) %411 to i32
  %413 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %412)
  %414 = extractvalue { i32, i32, i32, i32 } %413, 0
  %415 = extractvalue { i32, i32, i32, i32 } %413, 1
  %416 = extractvalue { i32, i32, i32, i32 } %413, 2
  %417 = extractvalue { i32, i32, i32, i32 } %413, 3
  %418 = xor i32 96, %373
  %419 = xor i32 %418, %375
  %420 = xor i32 %419, %377
  %421 = xor i32 %420, %379
  %422 = xor i32 %421, %381
  %423 = xor i32 %422, %383
  %424 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %423
  %425 = ptrtoint ptr addrspace(3) %424 to i32
  %426 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %425)
  %427 = extractvalue { i32, i32, i32, i32 } %426, 0
  %428 = extractvalue { i32, i32, i32, i32 } %426, 1
  %429 = extractvalue { i32, i32, i32, i32 } %426, 2
  %430 = extractvalue { i32, i32, i32, i32 } %426, 3
  %431 = xor i32 128, %373
  %432 = xor i32 %431, %375
  %433 = xor i32 %432, %377
  %434 = xor i32 %433, %379
  %435 = xor i32 %434, %381
  %436 = xor i32 %435, %383
  %437 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %436
  %438 = ptrtoint ptr addrspace(3) %437 to i32
  %439 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %438)
  %440 = extractvalue { i32, i32, i32, i32 } %439, 0
  %441 = extractvalue { i32, i32, i32, i32 } %439, 1
  %442 = extractvalue { i32, i32, i32, i32 } %439, 2
  %443 = extractvalue { i32, i32, i32, i32 } %439, 3
  %444 = xor i32 160, %373
  %445 = xor i32 %444, %375
  %446 = xor i32 %445, %377
  %447 = xor i32 %446, %379
  %448 = xor i32 %447, %381
  %449 = xor i32 %448, %383
  %450 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %449
  %451 = ptrtoint ptr addrspace(3) %450 to i32
  %452 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %451)
  %453 = extractvalue { i32, i32, i32, i32 } %452, 0
  %454 = extractvalue { i32, i32, i32, i32 } %452, 1
  %455 = extractvalue { i32, i32, i32, i32 } %452, 2
  %456 = extractvalue { i32, i32, i32, i32 } %452, 3
  %457 = xor i32 192, %373
  %458 = xor i32 %457, %375
  %459 = xor i32 %458, %377
  %460 = xor i32 %459, %379
  %461 = xor i32 %460, %381
  %462 = xor i32 %461, %383
  %463 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %462
  %464 = ptrtoint ptr addrspace(3) %463 to i32
  %465 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %464)
  %466 = extractvalue { i32, i32, i32, i32 } %465, 0
  %467 = extractvalue { i32, i32, i32, i32 } %465, 1
  %468 = extractvalue { i32, i32, i32, i32 } %465, 2
  %469 = extractvalue { i32, i32, i32, i32 } %465, 3
  %470 = xor i32 224, %373
  %471 = xor i32 %470, %375
  %472 = xor i32 %471, %377
  %473 = xor i32 %472, %379
  %474 = xor i32 %473, %381
  %475 = xor i32 %474, %383
  %476 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %475
  %477 = ptrtoint ptr addrspace(3) %476 to i32
  %478 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %477)
  %479 = extractvalue { i32, i32, i32, i32 } %478, 0
  %480 = extractvalue { i32, i32, i32, i32 } %478, 1
  %481 = extractvalue { i32, i32, i32, i32 } %478, 2
  %482 = extractvalue { i32, i32, i32, i32 } %478, 3
  %483 = xor i32 256, %373
  %484 = xor i32 %483, %375
  %485 = xor i32 %484, %377
  %486 = xor i32 %485, %379
  %487 = xor i32 %486, %381
  %488 = xor i32 %487, %383
  %489 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %488
  %490 = ptrtoint ptr addrspace(3) %489 to i32
  %491 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %490)
  %492 = extractvalue { i32, i32, i32, i32 } %491, 0
  %493 = extractvalue { i32, i32, i32, i32 } %491, 1
  %494 = extractvalue { i32, i32, i32, i32 } %491, 2
  %495 = extractvalue { i32, i32, i32, i32 } %491, 3
  %496 = xor i32 288, %373
  %497 = xor i32 %496, %375
  %498 = xor i32 %497, %377
  %499 = xor i32 %498, %379
  %500 = xor i32 %499, %381
  %501 = xor i32 %500, %383
  %502 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %501
  %503 = ptrtoint ptr addrspace(3) %502 to i32
  %504 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %503)
  %505 = extractvalue { i32, i32, i32, i32 } %504, 0
  %506 = extractvalue { i32, i32, i32, i32 } %504, 1
  %507 = extractvalue { i32, i32, i32, i32 } %504, 2
  %508 = extractvalue { i32, i32, i32, i32 } %504, 3
  %509 = xor i32 320, %373
  %510 = xor i32 %509, %375
  %511 = xor i32 %510, %377
  %512 = xor i32 %511, %379
  %513 = xor i32 %512, %381
  %514 = xor i32 %513, %383
  %515 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %514
  %516 = ptrtoint ptr addrspace(3) %515 to i32
  %517 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %516)
  %518 = extractvalue { i32, i32, i32, i32 } %517, 0
  %519 = extractvalue { i32, i32, i32, i32 } %517, 1
  %520 = extractvalue { i32, i32, i32, i32 } %517, 2
  %521 = extractvalue { i32, i32, i32, i32 } %517, 3
  %522 = xor i32 352, %373
  %523 = xor i32 %522, %375
  %524 = xor i32 %523, %377
  %525 = xor i32 %524, %379
  %526 = xor i32 %525, %381
  %527 = xor i32 %526, %383
  %528 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %527
  %529 = ptrtoint ptr addrspace(3) %528 to i32
  %530 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %529)
  %531 = extractvalue { i32, i32, i32, i32 } %530, 0
  %532 = extractvalue { i32, i32, i32, i32 } %530, 1
  %533 = extractvalue { i32, i32, i32, i32 } %530, 2
  %534 = extractvalue { i32, i32, i32, i32 } %530, 3
  %535 = xor i32 384, %373
  %536 = xor i32 %535, %375
  %537 = xor i32 %536, %377
  %538 = xor i32 %537, %379
  %539 = xor i32 %538, %381
  %540 = xor i32 %539, %383
  %541 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %540
  %542 = ptrtoint ptr addrspace(3) %541 to i32
  %543 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %542)
  %544 = extractvalue { i32, i32, i32, i32 } %543, 0
  %545 = extractvalue { i32, i32, i32, i32 } %543, 1
  %546 = extractvalue { i32, i32, i32, i32 } %543, 2
  %547 = extractvalue { i32, i32, i32, i32 } %543, 3
  %548 = xor i32 416, %373
  %549 = xor i32 %548, %375
  %550 = xor i32 %549, %377
  %551 = xor i32 %550, %379
  %552 = xor i32 %551, %381
  %553 = xor i32 %552, %383
  %554 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %553
  %555 = ptrtoint ptr addrspace(3) %554 to i32
  %556 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %555)
  %557 = extractvalue { i32, i32, i32, i32 } %556, 0
  %558 = extractvalue { i32, i32, i32, i32 } %556, 1
  %559 = extractvalue { i32, i32, i32, i32 } %556, 2
  %560 = extractvalue { i32, i32, i32, i32 } %556, 3
  %561 = xor i32 448, %373
  %562 = xor i32 %561, %375
  %563 = xor i32 %562, %377
  %564 = xor i32 %563, %379
  %565 = xor i32 %564, %381
  %566 = xor i32 %565, %383
  %567 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %566
  %568 = ptrtoint ptr addrspace(3) %567 to i32
  %569 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %568)
  %570 = extractvalue { i32, i32, i32, i32 } %569, 0
  %571 = extractvalue { i32, i32, i32, i32 } %569, 1
  %572 = extractvalue { i32, i32, i32, i32 } %569, 2
  %573 = extractvalue { i32, i32, i32, i32 } %569, 3
  %574 = xor i32 480, %373
  %575 = xor i32 %574, %375
  %576 = xor i32 %575, %377
  %577 = xor i32 %576, %379
  %578 = xor i32 %577, %381
  %579 = xor i32 %578, %383
  %580 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %579
  %581 = ptrtoint ptr addrspace(3) %580 to i32
  %582 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %581)
  %583 = extractvalue { i32, i32, i32, i32 } %582, 0
  %584 = extractvalue { i32, i32, i32, i32 } %582, 1
  %585 = extractvalue { i32, i32, i32, i32 } %582, 2
  %586 = extractvalue { i32, i32, i32, i32 } %582, 3
  %587 = bitcast i32 %388 to <2 x bfloat>
  %588 = extractelement <2 x bfloat> %587, i32 0
  %589 = extractelement <2 x bfloat> %587, i32 1
  %590 = bitcast i32 %389 to <2 x bfloat>
  %591 = extractelement <2 x bfloat> %590, i32 0
  %592 = extractelement <2 x bfloat> %590, i32 1
  %593 = bitcast i32 %390 to <2 x bfloat>
  %594 = extractelement <2 x bfloat> %593, i32 0
  %595 = extractelement <2 x bfloat> %593, i32 1
  %596 = bitcast i32 %391 to <2 x bfloat>
  %597 = extractelement <2 x bfloat> %596, i32 0
  %598 = extractelement <2 x bfloat> %596, i32 1
  %599 = bitcast i32 %401 to <2 x bfloat>
  %600 = extractelement <2 x bfloat> %599, i32 0
  %601 = extractelement <2 x bfloat> %599, i32 1
  %602 = bitcast i32 %402 to <2 x bfloat>
  %603 = extractelement <2 x bfloat> %602, i32 0
  %604 = extractelement <2 x bfloat> %602, i32 1
  %605 = bitcast i32 %403 to <2 x bfloat>
  %606 = extractelement <2 x bfloat> %605, i32 0
  %607 = extractelement <2 x bfloat> %605, i32 1
  %608 = bitcast i32 %404 to <2 x bfloat>
  %609 = extractelement <2 x bfloat> %608, i32 0
  %610 = extractelement <2 x bfloat> %608, i32 1
  %611 = bitcast i32 %414 to <2 x bfloat>
  %612 = extractelement <2 x bfloat> %611, i32 0
  %613 = extractelement <2 x bfloat> %611, i32 1
  %614 = bitcast i32 %415 to <2 x bfloat>
  %615 = extractelement <2 x bfloat> %614, i32 0
  %616 = extractelement <2 x bfloat> %614, i32 1
  %617 = bitcast i32 %416 to <2 x bfloat>
  %618 = extractelement <2 x bfloat> %617, i32 0
  %619 = extractelement <2 x bfloat> %617, i32 1
  %620 = bitcast i32 %417 to <2 x bfloat>
  %621 = extractelement <2 x bfloat> %620, i32 0
  %622 = extractelement <2 x bfloat> %620, i32 1
  %623 = bitcast i32 %427 to <2 x bfloat>
  %624 = extractelement <2 x bfloat> %623, i32 0
  %625 = extractelement <2 x bfloat> %623, i32 1
  %626 = bitcast i32 %428 to <2 x bfloat>
  %627 = extractelement <2 x bfloat> %626, i32 0
  %628 = extractelement <2 x bfloat> %626, i32 1
  %629 = bitcast i32 %429 to <2 x bfloat>
  %630 = extractelement <2 x bfloat> %629, i32 0
  %631 = extractelement <2 x bfloat> %629, i32 1
  %632 = bitcast i32 %430 to <2 x bfloat>
  %633 = extractelement <2 x bfloat> %632, i32 0
  %634 = extractelement <2 x bfloat> %632, i32 1
  %635 = bitcast i32 %440 to <2 x bfloat>
  %636 = extractelement <2 x bfloat> %635, i32 0
  %637 = extractelement <2 x bfloat> %635, i32 1
  %638 = bitcast i32 %441 to <2 x bfloat>
  %639 = extractelement <2 x bfloat> %638, i32 0
  %640 = extractelement <2 x bfloat> %638, i32 1
  %641 = bitcast i32 %442 to <2 x bfloat>
  %642 = extractelement <2 x bfloat> %641, i32 0
  %643 = extractelement <2 x bfloat> %641, i32 1
  %644 = bitcast i32 %443 to <2 x bfloat>
  %645 = extractelement <2 x bfloat> %644, i32 0
  %646 = extractelement <2 x bfloat> %644, i32 1
  %647 = bitcast i32 %453 to <2 x bfloat>
  %648 = extractelement <2 x bfloat> %647, i32 0
  %649 = extractelement <2 x bfloat> %647, i32 1
  %650 = bitcast i32 %454 to <2 x bfloat>
  %651 = extractelement <2 x bfloat> %650, i32 0
  %652 = extractelement <2 x bfloat> %650, i32 1
  %653 = bitcast i32 %455 to <2 x bfloat>
  %654 = extractelement <2 x bfloat> %653, i32 0
  %655 = extractelement <2 x bfloat> %653, i32 1
  %656 = bitcast i32 %456 to <2 x bfloat>
  %657 = extractelement <2 x bfloat> %656, i32 0
  %658 = extractelement <2 x bfloat> %656, i32 1
  %659 = bitcast i32 %466 to <2 x bfloat>
  %660 = extractelement <2 x bfloat> %659, i32 0
  %661 = extractelement <2 x bfloat> %659, i32 1
  %662 = bitcast i32 %467 to <2 x bfloat>
  %663 = extractelement <2 x bfloat> %662, i32 0
  %664 = extractelement <2 x bfloat> %662, i32 1
  %665 = bitcast i32 %468 to <2 x bfloat>
  %666 = extractelement <2 x bfloat> %665, i32 0
  %667 = extractelement <2 x bfloat> %665, i32 1
  %668 = bitcast i32 %469 to <2 x bfloat>
  %669 = extractelement <2 x bfloat> %668, i32 0
  %670 = extractelement <2 x bfloat> %668, i32 1
  %671 = bitcast i32 %479 to <2 x bfloat>
  %672 = extractelement <2 x bfloat> %671, i32 0
  %673 = extractelement <2 x bfloat> %671, i32 1
  %674 = bitcast i32 %480 to <2 x bfloat>
  %675 = extractelement <2 x bfloat> %674, i32 0
  %676 = extractelement <2 x bfloat> %674, i32 1
  %677 = bitcast i32 %481 to <2 x bfloat>
  %678 = extractelement <2 x bfloat> %677, i32 0
  %679 = extractelement <2 x bfloat> %677, i32 1
  %680 = bitcast i32 %482 to <2 x bfloat>
  %681 = extractelement <2 x bfloat> %680, i32 0
  %682 = extractelement <2 x bfloat> %680, i32 1
  %683 = bitcast i32 %492 to <2 x bfloat>
  %684 = extractelement <2 x bfloat> %683, i32 0
  %685 = extractelement <2 x bfloat> %683, i32 1
  %686 = bitcast i32 %493 to <2 x bfloat>
  %687 = extractelement <2 x bfloat> %686, i32 0
  %688 = extractelement <2 x bfloat> %686, i32 1
  %689 = bitcast i32 %494 to <2 x bfloat>
  %690 = extractelement <2 x bfloat> %689, i32 0
  %691 = extractelement <2 x bfloat> %689, i32 1
  %692 = bitcast i32 %495 to <2 x bfloat>
  %693 = extractelement <2 x bfloat> %692, i32 0
  %694 = extractelement <2 x bfloat> %692, i32 1
  %695 = bitcast i32 %505 to <2 x bfloat>
  %696 = extractelement <2 x bfloat> %695, i32 0
  %697 = extractelement <2 x bfloat> %695, i32 1
  %698 = bitcast i32 %506 to <2 x bfloat>
  %699 = extractelement <2 x bfloat> %698, i32 0
  %700 = extractelement <2 x bfloat> %698, i32 1
  %701 = bitcast i32 %507 to <2 x bfloat>
  %702 = extractelement <2 x bfloat> %701, i32 0
  %703 = extractelement <2 x bfloat> %701, i32 1
  %704 = bitcast i32 %508 to <2 x bfloat>
  %705 = extractelement <2 x bfloat> %704, i32 0
  %706 = extractelement <2 x bfloat> %704, i32 1
  %707 = bitcast i32 %518 to <2 x bfloat>
  %708 = extractelement <2 x bfloat> %707, i32 0
  %709 = extractelement <2 x bfloat> %707, i32 1
  %710 = bitcast i32 %519 to <2 x bfloat>
  %711 = extractelement <2 x bfloat> %710, i32 0
  %712 = extractelement <2 x bfloat> %710, i32 1
  %713 = bitcast i32 %520 to <2 x bfloat>
  %714 = extractelement <2 x bfloat> %713, i32 0
  %715 = extractelement <2 x bfloat> %713, i32 1
  %716 = bitcast i32 %521 to <2 x bfloat>
  %717 = extractelement <2 x bfloat> %716, i32 0
  %718 = extractelement <2 x bfloat> %716, i32 1
  %719 = bitcast i32 %531 to <2 x bfloat>
  %720 = extractelement <2 x bfloat> %719, i32 0
  %721 = extractelement <2 x bfloat> %719, i32 1
  %722 = bitcast i32 %532 to <2 x bfloat>
  %723 = extractelement <2 x bfloat> %722, i32 0
  %724 = extractelement <2 x bfloat> %722, i32 1
  %725 = bitcast i32 %533 to <2 x bfloat>
  %726 = extractelement <2 x bfloat> %725, i32 0
  %727 = extractelement <2 x bfloat> %725, i32 1
  %728 = bitcast i32 %534 to <2 x bfloat>
  %729 = extractelement <2 x bfloat> %728, i32 0
  %730 = extractelement <2 x bfloat> %728, i32 1
  %731 = bitcast i32 %544 to <2 x bfloat>
  %732 = extractelement <2 x bfloat> %731, i32 0
  %733 = extractelement <2 x bfloat> %731, i32 1
  %734 = bitcast i32 %545 to <2 x bfloat>
  %735 = extractelement <2 x bfloat> %734, i32 0
  %736 = extractelement <2 x bfloat> %734, i32 1
  %737 = bitcast i32 %546 to <2 x bfloat>
  %738 = extractelement <2 x bfloat> %737, i32 0
  %739 = extractelement <2 x bfloat> %737, i32 1
  %740 = bitcast i32 %547 to <2 x bfloat>
  %741 = extractelement <2 x bfloat> %740, i32 0
  %742 = extractelement <2 x bfloat> %740, i32 1
  %743 = bitcast i32 %557 to <2 x bfloat>
  %744 = extractelement <2 x bfloat> %743, i32 0
  %745 = extractelement <2 x bfloat> %743, i32 1
  %746 = bitcast i32 %558 to <2 x bfloat>
  %747 = extractelement <2 x bfloat> %746, i32 0
  %748 = extractelement <2 x bfloat> %746, i32 1
  %749 = bitcast i32 %559 to <2 x bfloat>
  %750 = extractelement <2 x bfloat> %749, i32 0
  %751 = extractelement <2 x bfloat> %749, i32 1
  %752 = bitcast i32 %560 to <2 x bfloat>
  %753 = extractelement <2 x bfloat> %752, i32 0
  %754 = extractelement <2 x bfloat> %752, i32 1
  %755 = bitcast i32 %570 to <2 x bfloat>
  %756 = extractelement <2 x bfloat> %755, i32 0
  %757 = extractelement <2 x bfloat> %755, i32 1
  %758 = bitcast i32 %571 to <2 x bfloat>
  %759 = extractelement <2 x bfloat> %758, i32 0
  %760 = extractelement <2 x bfloat> %758, i32 1
  %761 = bitcast i32 %572 to <2 x bfloat>
  %762 = extractelement <2 x bfloat> %761, i32 0
  %763 = extractelement <2 x bfloat> %761, i32 1
  %764 = bitcast i32 %573 to <2 x bfloat>
  %765 = extractelement <2 x bfloat> %764, i32 0
  %766 = extractelement <2 x bfloat> %764, i32 1
  %767 = bitcast i32 %583 to <2 x bfloat>
  %768 = extractelement <2 x bfloat> %767, i32 0
  %769 = extractelement <2 x bfloat> %767, i32 1
  %770 = bitcast i32 %584 to <2 x bfloat>
  %771 = extractelement <2 x bfloat> %770, i32 0
  %772 = extractelement <2 x bfloat> %770, i32 1
  %773 = bitcast i32 %585 to <2 x bfloat>
  %774 = extractelement <2 x bfloat> %773, i32 0
  %775 = extractelement <2 x bfloat> %773, i32 1
  %776 = bitcast i32 %586 to <2 x bfloat>
  %777 = extractelement <2 x bfloat> %776, i32 0
  %778 = extractelement <2 x bfloat> %776, i32 1
  %779 = insertelement <2 x bfloat> undef, bfloat %588, i32 0
  %780 = insertelement <2 x bfloat> %779, bfloat %589, i32 1
  %781 = bitcast <2 x bfloat> %780 to i32
  %782 = insertelement <2 x bfloat> undef, bfloat %591, i32 0
  %783 = insertelement <2 x bfloat> %782, bfloat %592, i32 1
  %784 = bitcast <2 x bfloat> %783 to i32
  %785 = insertelement <2 x bfloat> undef, bfloat %594, i32 0
  %786 = insertelement <2 x bfloat> %785, bfloat %595, i32 1
  %787 = bitcast <2 x bfloat> %786 to i32
  %788 = insertelement <2 x bfloat> undef, bfloat %597, i32 0
  %789 = insertelement <2 x bfloat> %788, bfloat %598, i32 1
  %790 = bitcast <2 x bfloat> %789 to i32
  %791 = insertelement <2 x bfloat> undef, bfloat %600, i32 0
  %792 = insertelement <2 x bfloat> %791, bfloat %601, i32 1
  %793 = bitcast <2 x bfloat> %792 to i32
  %794 = insertelement <2 x bfloat> undef, bfloat %603, i32 0
  %795 = insertelement <2 x bfloat> %794, bfloat %604, i32 1
  %796 = bitcast <2 x bfloat> %795 to i32
  %797 = insertelement <2 x bfloat> undef, bfloat %606, i32 0
  %798 = insertelement <2 x bfloat> %797, bfloat %607, i32 1
  %799 = bitcast <2 x bfloat> %798 to i32
  %800 = insertelement <2 x bfloat> undef, bfloat %609, i32 0
  %801 = insertelement <2 x bfloat> %800, bfloat %610, i32 1
  %802 = bitcast <2 x bfloat> %801 to i32
  %803 = insertelement <2 x bfloat> undef, bfloat %612, i32 0
  %804 = insertelement <2 x bfloat> %803, bfloat %613, i32 1
  %805 = bitcast <2 x bfloat> %804 to i32
  %806 = insertelement <2 x bfloat> undef, bfloat %615, i32 0
  %807 = insertelement <2 x bfloat> %806, bfloat %616, i32 1
  %808 = bitcast <2 x bfloat> %807 to i32
  %809 = insertelement <2 x bfloat> undef, bfloat %618, i32 0
  %810 = insertelement <2 x bfloat> %809, bfloat %619, i32 1
  %811 = bitcast <2 x bfloat> %810 to i32
  %812 = insertelement <2 x bfloat> undef, bfloat %621, i32 0
  %813 = insertelement <2 x bfloat> %812, bfloat %622, i32 1
  %814 = bitcast <2 x bfloat> %813 to i32
  %815 = insertelement <2 x bfloat> undef, bfloat %624, i32 0
  %816 = insertelement <2 x bfloat> %815, bfloat %625, i32 1
  %817 = bitcast <2 x bfloat> %816 to i32
  %818 = insertelement <2 x bfloat> undef, bfloat %627, i32 0
  %819 = insertelement <2 x bfloat> %818, bfloat %628, i32 1
  %820 = bitcast <2 x bfloat> %819 to i32
  %821 = insertelement <2 x bfloat> undef, bfloat %630, i32 0
  %822 = insertelement <2 x bfloat> %821, bfloat %631, i32 1
  %823 = bitcast <2 x bfloat> %822 to i32
  %824 = insertelement <2 x bfloat> undef, bfloat %633, i32 0
  %825 = insertelement <2 x bfloat> %824, bfloat %634, i32 1
  %826 = bitcast <2 x bfloat> %825 to i32
  %827 = insertelement <2 x bfloat> undef, bfloat %636, i32 0
  %828 = insertelement <2 x bfloat> %827, bfloat %637, i32 1
  %829 = bitcast <2 x bfloat> %828 to i32
  %830 = insertelement <2 x bfloat> undef, bfloat %639, i32 0
  %831 = insertelement <2 x bfloat> %830, bfloat %640, i32 1
  %832 = bitcast <2 x bfloat> %831 to i32
  %833 = insertelement <2 x bfloat> undef, bfloat %642, i32 0
  %834 = insertelement <2 x bfloat> %833, bfloat %643, i32 1
  %835 = bitcast <2 x bfloat> %834 to i32
  %836 = insertelement <2 x bfloat> undef, bfloat %645, i32 0
  %837 = insertelement <2 x bfloat> %836, bfloat %646, i32 1
  %838 = bitcast <2 x bfloat> %837 to i32
  %839 = insertelement <2 x bfloat> undef, bfloat %648, i32 0
  %840 = insertelement <2 x bfloat> %839, bfloat %649, i32 1
  %841 = bitcast <2 x bfloat> %840 to i32
  %842 = insertelement <2 x bfloat> undef, bfloat %651, i32 0
  %843 = insertelement <2 x bfloat> %842, bfloat %652, i32 1
  %844 = bitcast <2 x bfloat> %843 to i32
  %845 = insertelement <2 x bfloat> undef, bfloat %654, i32 0
  %846 = insertelement <2 x bfloat> %845, bfloat %655, i32 1
  %847 = bitcast <2 x bfloat> %846 to i32
  %848 = insertelement <2 x bfloat> undef, bfloat %657, i32 0
  %849 = insertelement <2 x bfloat> %848, bfloat %658, i32 1
  %850 = bitcast <2 x bfloat> %849 to i32
  %851 = insertelement <2 x bfloat> undef, bfloat %660, i32 0
  %852 = insertelement <2 x bfloat> %851, bfloat %661, i32 1
  %853 = bitcast <2 x bfloat> %852 to i32
  %854 = insertelement <2 x bfloat> undef, bfloat %663, i32 0
  %855 = insertelement <2 x bfloat> %854, bfloat %664, i32 1
  %856 = bitcast <2 x bfloat> %855 to i32
  %857 = insertelement <2 x bfloat> undef, bfloat %666, i32 0
  %858 = insertelement <2 x bfloat> %857, bfloat %667, i32 1
  %859 = bitcast <2 x bfloat> %858 to i32
  %860 = insertelement <2 x bfloat> undef, bfloat %669, i32 0
  %861 = insertelement <2 x bfloat> %860, bfloat %670, i32 1
  %862 = bitcast <2 x bfloat> %861 to i32
  %863 = insertelement <2 x bfloat> undef, bfloat %672, i32 0
  %864 = insertelement <2 x bfloat> %863, bfloat %673, i32 1
  %865 = bitcast <2 x bfloat> %864 to i32
  %866 = insertelement <2 x bfloat> undef, bfloat %675, i32 0
  %867 = insertelement <2 x bfloat> %866, bfloat %676, i32 1
  %868 = bitcast <2 x bfloat> %867 to i32
  %869 = insertelement <2 x bfloat> undef, bfloat %678, i32 0
  %870 = insertelement <2 x bfloat> %869, bfloat %679, i32 1
  %871 = bitcast <2 x bfloat> %870 to i32
  %872 = insertelement <2 x bfloat> undef, bfloat %681, i32 0
  %873 = insertelement <2 x bfloat> %872, bfloat %682, i32 1
  %874 = bitcast <2 x bfloat> %873 to i32
  %875 = insertelement <2 x bfloat> undef, bfloat %684, i32 0
  %876 = insertelement <2 x bfloat> %875, bfloat %685, i32 1
  %877 = bitcast <2 x bfloat> %876 to i32
  %878 = insertelement <2 x bfloat> undef, bfloat %687, i32 0
  %879 = insertelement <2 x bfloat> %878, bfloat %688, i32 1
  %880 = bitcast <2 x bfloat> %879 to i32
  %881 = insertelement <2 x bfloat> undef, bfloat %690, i32 0
  %882 = insertelement <2 x bfloat> %881, bfloat %691, i32 1
  %883 = bitcast <2 x bfloat> %882 to i32
  %884 = insertelement <2 x bfloat> undef, bfloat %693, i32 0
  %885 = insertelement <2 x bfloat> %884, bfloat %694, i32 1
  %886 = bitcast <2 x bfloat> %885 to i32
  %887 = insertelement <2 x bfloat> undef, bfloat %696, i32 0
  %888 = insertelement <2 x bfloat> %887, bfloat %697, i32 1
  %889 = bitcast <2 x bfloat> %888 to i32
  %890 = insertelement <2 x bfloat> undef, bfloat %699, i32 0
  %891 = insertelement <2 x bfloat> %890, bfloat %700, i32 1
  %892 = bitcast <2 x bfloat> %891 to i32
  %893 = insertelement <2 x bfloat> undef, bfloat %702, i32 0
  %894 = insertelement <2 x bfloat> %893, bfloat %703, i32 1
  %895 = bitcast <2 x bfloat> %894 to i32
  %896 = insertelement <2 x bfloat> undef, bfloat %705, i32 0
  %897 = insertelement <2 x bfloat> %896, bfloat %706, i32 1
  %898 = bitcast <2 x bfloat> %897 to i32
  %899 = insertelement <2 x bfloat> undef, bfloat %708, i32 0
  %900 = insertelement <2 x bfloat> %899, bfloat %709, i32 1
  %901 = bitcast <2 x bfloat> %900 to i32
  %902 = insertelement <2 x bfloat> undef, bfloat %711, i32 0
  %903 = insertelement <2 x bfloat> %902, bfloat %712, i32 1
  %904 = bitcast <2 x bfloat> %903 to i32
  %905 = insertelement <2 x bfloat> undef, bfloat %714, i32 0
  %906 = insertelement <2 x bfloat> %905, bfloat %715, i32 1
  %907 = bitcast <2 x bfloat> %906 to i32
  %908 = insertelement <2 x bfloat> undef, bfloat %717, i32 0
  %909 = insertelement <2 x bfloat> %908, bfloat %718, i32 1
  %910 = bitcast <2 x bfloat> %909 to i32
  %911 = insertelement <2 x bfloat> undef, bfloat %720, i32 0
  %912 = insertelement <2 x bfloat> %911, bfloat %721, i32 1
  %913 = bitcast <2 x bfloat> %912 to i32
  %914 = insertelement <2 x bfloat> undef, bfloat %723, i32 0
  %915 = insertelement <2 x bfloat> %914, bfloat %724, i32 1
  %916 = bitcast <2 x bfloat> %915 to i32
  %917 = insertelement <2 x bfloat> undef, bfloat %726, i32 0
  %918 = insertelement <2 x bfloat> %917, bfloat %727, i32 1
  %919 = bitcast <2 x bfloat> %918 to i32
  %920 = insertelement <2 x bfloat> undef, bfloat %729, i32 0
  %921 = insertelement <2 x bfloat> %920, bfloat %730, i32 1
  %922 = bitcast <2 x bfloat> %921 to i32
  %923 = insertelement <2 x bfloat> undef, bfloat %732, i32 0
  %924 = insertelement <2 x bfloat> %923, bfloat %733, i32 1
  %925 = bitcast <2 x bfloat> %924 to i32
  %926 = insertelement <2 x bfloat> undef, bfloat %735, i32 0
  %927 = insertelement <2 x bfloat> %926, bfloat %736, i32 1
  %928 = bitcast <2 x bfloat> %927 to i32
  %929 = insertelement <2 x bfloat> undef, bfloat %738, i32 0
  %930 = insertelement <2 x bfloat> %929, bfloat %739, i32 1
  %931 = bitcast <2 x bfloat> %930 to i32
  %932 = insertelement <2 x bfloat> undef, bfloat %741, i32 0
  %933 = insertelement <2 x bfloat> %932, bfloat %742, i32 1
  %934 = bitcast <2 x bfloat> %933 to i32
  %935 = insertelement <2 x bfloat> undef, bfloat %744, i32 0
  %936 = insertelement <2 x bfloat> %935, bfloat %745, i32 1
  %937 = bitcast <2 x bfloat> %936 to i32
  %938 = insertelement <2 x bfloat> undef, bfloat %747, i32 0
  %939 = insertelement <2 x bfloat> %938, bfloat %748, i32 1
  %940 = bitcast <2 x bfloat> %939 to i32
  %941 = insertelement <2 x bfloat> undef, bfloat %750, i32 0
  %942 = insertelement <2 x bfloat> %941, bfloat %751, i32 1
  %943 = bitcast <2 x bfloat> %942 to i32
  %944 = insertelement <2 x bfloat> undef, bfloat %753, i32 0
  %945 = insertelement <2 x bfloat> %944, bfloat %754, i32 1
  %946 = bitcast <2 x bfloat> %945 to i32
  %947 = insertelement <2 x bfloat> undef, bfloat %756, i32 0
  %948 = insertelement <2 x bfloat> %947, bfloat %757, i32 1
  %949 = bitcast <2 x bfloat> %948 to i32
  %950 = insertelement <2 x bfloat> undef, bfloat %759, i32 0
  %951 = insertelement <2 x bfloat> %950, bfloat %760, i32 1
  %952 = bitcast <2 x bfloat> %951 to i32
  %953 = insertelement <2 x bfloat> undef, bfloat %762, i32 0
  %954 = insertelement <2 x bfloat> %953, bfloat %763, i32 1
  %955 = bitcast <2 x bfloat> %954 to i32
  %956 = insertelement <2 x bfloat> undef, bfloat %765, i32 0
  %957 = insertelement <2 x bfloat> %956, bfloat %766, i32 1
  %958 = bitcast <2 x bfloat> %957 to i32
  %959 = insertelement <2 x bfloat> undef, bfloat %768, i32 0
  %960 = insertelement <2 x bfloat> %959, bfloat %769, i32 1
  %961 = bitcast <2 x bfloat> %960 to i32
  %962 = insertelement <2 x bfloat> undef, bfloat %771, i32 0
  %963 = insertelement <2 x bfloat> %962, bfloat %772, i32 1
  %964 = bitcast <2 x bfloat> %963 to i32
  %965 = insertelement <2 x bfloat> undef, bfloat %774, i32 0
  %966 = insertelement <2 x bfloat> %965, bfloat %775, i32 1
  %967 = bitcast <2 x bfloat> %966 to i32
  %968 = insertelement <2 x bfloat> undef, bfloat %777, i32 0
  %969 = insertelement <2 x bfloat> %968, bfloat %778, i32 1
  %970 = bitcast <2 x bfloat> %969 to i32
  %971 = extractvalue { float, float, float, float } %93, 0
  %972 = extractvalue { float, float, float, float } %93, 1
  %973 = extractvalue { float, float, float, float } %93, 2
  %974 = extractvalue { float, float, float, float } %93, 3
  %975 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %971, float %972, float %973, float %974, i32 0, i32 0, i32 0, i32 0, i32 %781, i32 %784)
  %976 = extractvalue { float, float, float, float } %975, 0
  %977 = extractvalue { float, float, float, float } %975, 1
  %978 = extractvalue { float, float, float, float } %975, 2
  %979 = extractvalue { float, float, float, float } %975, 3
  %980 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %976, float %977, float %978, float %979, i32 0, i32 0, i32 0, i32 0, i32 %787, i32 %790)
  %981 = extractvalue { float, float, float, float } %980, 0
  %982 = extractvalue { float, float, float, float } %980, 1
  %983 = extractvalue { float, float, float, float } %980, 2
  %984 = extractvalue { float, float, float, float } %980, 3
  %985 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %981, float %982, float %983, float %984, i32 0, i32 0, i32 0, i32 0, i32 %793, i32 %796)
  %986 = extractvalue { float, float, float, float } %985, 0
  %987 = extractvalue { float, float, float, float } %985, 1
  %988 = extractvalue { float, float, float, float } %985, 2
  %989 = extractvalue { float, float, float, float } %985, 3
  %990 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %986, float %987, float %988, float %989, i32 0, i32 0, i32 0, i32 0, i32 %799, i32 %802)
  %991 = extractvalue { float, float, float, float } %990, 0
  %992 = extractvalue { float, float, float, float } %990, 1
  %993 = extractvalue { float, float, float, float } %990, 2
  %994 = extractvalue { float, float, float, float } %990, 3
  %995 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %991, float %992, float %993, float %994, i32 0, i32 0, i32 0, i32 0, i32 %805, i32 %808)
  %996 = extractvalue { float, float, float, float } %995, 0
  %997 = extractvalue { float, float, float, float } %995, 1
  %998 = extractvalue { float, float, float, float } %995, 2
  %999 = extractvalue { float, float, float, float } %995, 3
  %1000 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %996, float %997, float %998, float %999, i32 0, i32 0, i32 0, i32 0, i32 %811, i32 %814)
  %1001 = extractvalue { float, float, float, float } %1000, 0
  %1002 = extractvalue { float, float, float, float } %1000, 1
  %1003 = extractvalue { float, float, float, float } %1000, 2
  %1004 = extractvalue { float, float, float, float } %1000, 3
  %1005 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1001, float %1002, float %1003, float %1004, i32 0, i32 0, i32 0, i32 0, i32 %817, i32 %820)
  %1006 = extractvalue { float, float, float, float } %1005, 0
  %1007 = extractvalue { float, float, float, float } %1005, 1
  %1008 = extractvalue { float, float, float, float } %1005, 2
  %1009 = extractvalue { float, float, float, float } %1005, 3
  %1010 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1006, float %1007, float %1008, float %1009, i32 0, i32 0, i32 0, i32 0, i32 %823, i32 %826)
  %1011 = extractvalue { float, float, float, float } %1010, 0
  %1012 = extractvalue { float, float, float, float } %1010, 1
  %1013 = extractvalue { float, float, float, float } %1010, 2
  %1014 = extractvalue { float, float, float, float } %1010, 3
  %1015 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1011, float %1012, float %1013, float %1014, i32 0, i32 0, i32 0, i32 0, i32 %829, i32 %832)
  %1016 = extractvalue { float, float, float, float } %1015, 0
  %1017 = extractvalue { float, float, float, float } %1015, 1
  %1018 = extractvalue { float, float, float, float } %1015, 2
  %1019 = extractvalue { float, float, float, float } %1015, 3
  %1020 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1016, float %1017, float %1018, float %1019, i32 0, i32 0, i32 0, i32 0, i32 %835, i32 %838)
  %1021 = extractvalue { float, float, float, float } %1020, 0
  %1022 = extractvalue { float, float, float, float } %1020, 1
  %1023 = extractvalue { float, float, float, float } %1020, 2
  %1024 = extractvalue { float, float, float, float } %1020, 3
  %1025 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1021, float %1022, float %1023, float %1024, i32 0, i32 0, i32 0, i32 0, i32 %841, i32 %844)
  %1026 = extractvalue { float, float, float, float } %1025, 0
  %1027 = extractvalue { float, float, float, float } %1025, 1
  %1028 = extractvalue { float, float, float, float } %1025, 2
  %1029 = extractvalue { float, float, float, float } %1025, 3
  %1030 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1026, float %1027, float %1028, float %1029, i32 0, i32 0, i32 0, i32 0, i32 %847, i32 %850)
  %1031 = extractvalue { float, float, float, float } %1030, 0
  %1032 = extractvalue { float, float, float, float } %1030, 1
  %1033 = extractvalue { float, float, float, float } %1030, 2
  %1034 = extractvalue { float, float, float, float } %1030, 3
  %1035 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1031, float %1032, float %1033, float %1034, i32 0, i32 0, i32 0, i32 0, i32 %853, i32 %856)
  %1036 = extractvalue { float, float, float, float } %1035, 0
  %1037 = extractvalue { float, float, float, float } %1035, 1
  %1038 = extractvalue { float, float, float, float } %1035, 2
  %1039 = extractvalue { float, float, float, float } %1035, 3
  %1040 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1036, float %1037, float %1038, float %1039, i32 0, i32 0, i32 0, i32 0, i32 %859, i32 %862)
  %1041 = extractvalue { float, float, float, float } %1040, 0
  %1042 = extractvalue { float, float, float, float } %1040, 1
  %1043 = extractvalue { float, float, float, float } %1040, 2
  %1044 = extractvalue { float, float, float, float } %1040, 3
  %1045 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1041, float %1042, float %1043, float %1044, i32 0, i32 0, i32 0, i32 0, i32 %865, i32 %868)
  %1046 = extractvalue { float, float, float, float } %1045, 0
  %1047 = extractvalue { float, float, float, float } %1045, 1
  %1048 = extractvalue { float, float, float, float } %1045, 2
  %1049 = extractvalue { float, float, float, float } %1045, 3
  %1050 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1046, float %1047, float %1048, float %1049, i32 0, i32 0, i32 0, i32 0, i32 %871, i32 %874)
  %1051 = extractvalue { float, float, float, float } %1050, 0
  %1052 = extractvalue { float, float, float, float } %1050, 1
  %1053 = extractvalue { float, float, float, float } %1050, 2
  %1054 = extractvalue { float, float, float, float } %1050, 3
  %1055 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1051, float %1052, float %1053, float %1054, i32 0, i32 0, i32 0, i32 0, i32 %877, i32 %880)
  %1056 = extractvalue { float, float, float, float } %1055, 0
  %1057 = extractvalue { float, float, float, float } %1055, 1
  %1058 = extractvalue { float, float, float, float } %1055, 2
  %1059 = extractvalue { float, float, float, float } %1055, 3
  %1060 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1056, float %1057, float %1058, float %1059, i32 0, i32 0, i32 0, i32 0, i32 %883, i32 %886)
  %1061 = extractvalue { float, float, float, float } %1060, 0
  %1062 = extractvalue { float, float, float, float } %1060, 1
  %1063 = extractvalue { float, float, float, float } %1060, 2
  %1064 = extractvalue { float, float, float, float } %1060, 3
  %1065 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1061, float %1062, float %1063, float %1064, i32 0, i32 0, i32 0, i32 0, i32 %889, i32 %892)
  %1066 = extractvalue { float, float, float, float } %1065, 0
  %1067 = extractvalue { float, float, float, float } %1065, 1
  %1068 = extractvalue { float, float, float, float } %1065, 2
  %1069 = extractvalue { float, float, float, float } %1065, 3
  %1070 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1066, float %1067, float %1068, float %1069, i32 0, i32 0, i32 0, i32 0, i32 %895, i32 %898)
  %1071 = extractvalue { float, float, float, float } %1070, 0
  %1072 = extractvalue { float, float, float, float } %1070, 1
  %1073 = extractvalue { float, float, float, float } %1070, 2
  %1074 = extractvalue { float, float, float, float } %1070, 3
  %1075 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1071, float %1072, float %1073, float %1074, i32 0, i32 0, i32 0, i32 0, i32 %901, i32 %904)
  %1076 = extractvalue { float, float, float, float } %1075, 0
  %1077 = extractvalue { float, float, float, float } %1075, 1
  %1078 = extractvalue { float, float, float, float } %1075, 2
  %1079 = extractvalue { float, float, float, float } %1075, 3
  %1080 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1076, float %1077, float %1078, float %1079, i32 0, i32 0, i32 0, i32 0, i32 %907, i32 %910)
  %1081 = extractvalue { float, float, float, float } %1080, 0
  %1082 = extractvalue { float, float, float, float } %1080, 1
  %1083 = extractvalue { float, float, float, float } %1080, 2
  %1084 = extractvalue { float, float, float, float } %1080, 3
  %1085 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1081, float %1082, float %1083, float %1084, i32 0, i32 0, i32 0, i32 0, i32 %913, i32 %916)
  %1086 = extractvalue { float, float, float, float } %1085, 0
  %1087 = extractvalue { float, float, float, float } %1085, 1
  %1088 = extractvalue { float, float, float, float } %1085, 2
  %1089 = extractvalue { float, float, float, float } %1085, 3
  %1090 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1086, float %1087, float %1088, float %1089, i32 0, i32 0, i32 0, i32 0, i32 %919, i32 %922)
  %1091 = extractvalue { float, float, float, float } %1090, 0
  %1092 = extractvalue { float, float, float, float } %1090, 1
  %1093 = extractvalue { float, float, float, float } %1090, 2
  %1094 = extractvalue { float, float, float, float } %1090, 3
  %1095 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1091, float %1092, float %1093, float %1094, i32 0, i32 0, i32 0, i32 0, i32 %925, i32 %928)
  %1096 = extractvalue { float, float, float, float } %1095, 0
  %1097 = extractvalue { float, float, float, float } %1095, 1
  %1098 = extractvalue { float, float, float, float } %1095, 2
  %1099 = extractvalue { float, float, float, float } %1095, 3
  %1100 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1096, float %1097, float %1098, float %1099, i32 0, i32 0, i32 0, i32 0, i32 %931, i32 %934)
  %1101 = extractvalue { float, float, float, float } %1100, 0
  %1102 = extractvalue { float, float, float, float } %1100, 1
  %1103 = extractvalue { float, float, float, float } %1100, 2
  %1104 = extractvalue { float, float, float, float } %1100, 3
  %1105 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1101, float %1102, float %1103, float %1104, i32 0, i32 0, i32 0, i32 0, i32 %937, i32 %940)
  %1106 = extractvalue { float, float, float, float } %1105, 0
  %1107 = extractvalue { float, float, float, float } %1105, 1
  %1108 = extractvalue { float, float, float, float } %1105, 2
  %1109 = extractvalue { float, float, float, float } %1105, 3
  %1110 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1106, float %1107, float %1108, float %1109, i32 0, i32 0, i32 0, i32 0, i32 %943, i32 %946)
  %1111 = extractvalue { float, float, float, float } %1110, 0
  %1112 = extractvalue { float, float, float, float } %1110, 1
  %1113 = extractvalue { float, float, float, float } %1110, 2
  %1114 = extractvalue { float, float, float, float } %1110, 3
  %1115 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1111, float %1112, float %1113, float %1114, i32 0, i32 0, i32 0, i32 0, i32 %949, i32 %952)
  %1116 = extractvalue { float, float, float, float } %1115, 0
  %1117 = extractvalue { float, float, float, float } %1115, 1
  %1118 = extractvalue { float, float, float, float } %1115, 2
  %1119 = extractvalue { float, float, float, float } %1115, 3
  %1120 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1116, float %1117, float %1118, float %1119, i32 0, i32 0, i32 0, i32 0, i32 %955, i32 %958)
  %1121 = extractvalue { float, float, float, float } %1120, 0
  %1122 = extractvalue { float, float, float, float } %1120, 1
  %1123 = extractvalue { float, float, float, float } %1120, 2
  %1124 = extractvalue { float, float, float, float } %1120, 3
  %1125 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1121, float %1122, float %1123, float %1124, i32 0, i32 0, i32 0, i32 0, i32 %961, i32 %964)
  %1126 = extractvalue { float, float, float, float } %1125, 0
  %1127 = extractvalue { float, float, float, float } %1125, 1
  %1128 = extractvalue { float, float, float, float } %1125, 2
  %1129 = extractvalue { float, float, float, float } %1125, 3
  %1130 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1126, float %1127, float %1128, float %1129, i32 0, i32 0, i32 0, i32 0, i32 %967, i32 %970)
  %1131 = extractvalue { float, float, float, float } %1130, 0
  %1132 = extractvalue { float, float, float, float } %1130, 1
  %1133 = extractvalue { float, float, float, float } %1130, 2
  %1134 = extractvalue { float, float, float, float } %1130, 3
  %1135 = insertvalue { float, float, float, float } undef, float %1131, 0
  %1136 = insertvalue { float, float, float, float } %1135, float %1132, 1
  %1137 = insertvalue { float, float, float, float } %1136, float %1133, 2
  %1138 = insertvalue { float, float, float, float } %1137, float %1134, 3
  %1139 = add i32 %91, 512
  br label %90

1140:                                             ; preds = %90
  %1141 = extractvalue { float, float, float, float } %93, 0
  %1142 = extractvalue { float, float, float, float } %93, 1
  %1143 = extractvalue { float, float, float, float } %93, 2
  %1144 = extractvalue { float, float, float, float } %93, 3
  %1145 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1141)
  %1146 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1142)
  %1147 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1143)
  %1148 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1144)
  %1149 = mul i32 %11, 32
  %1150 = sext i32 %1149 to i64
  %1151 = select i1 %28, i32 0, i32 1
  %1152 = xor i32 0, %1151
  %1153 = select i1 %32, i32 0, i32 2
  %1154 = xor i32 %1152, %1153
  %1155 = select i1 %36, i32 0, i32 4
  %1156 = xor i32 %1154, %1155
  %1157 = select i1 %40, i32 0, i32 8
  %1158 = xor i32 %1156, %1157
  %1159 = select i1 %47, i32 0, i32 16
  %1160 = xor i32 %1158, %1159
  %1161 = xor i32 %1160, 0
  %1162 = add i32 %1161, 0
  %1163 = sext i32 %1162 to i64
  %1164 = add i64 %1150, %1163
  %1165 = mul i64 %1164, 1024
  %1166 = select i1 %20, i32 0, i32 4
  %1167 = xor i32 0, %1166
  %1168 = select i1 %24, i32 0, i32 8
  %1169 = xor i32 %1167, %1168
  %1170 = xor i32 %1169, 0
  %1171 = add i32 %1170, 0
  %1172 = sext i32 %1171 to i64
  %1173 = add i64 %15, %1172
  %1174 = add i64 %1165, %1173
  %1175 = getelementptr bfloat, ptr addrspace(1) %2, i64 %1174
  call void @llvm.nvvm.barrier0()
  %1176 = select i1 %20, i32 0, i32 2
  %1177 = xor i32 0, %1176
  %1178 = select i1 %24, i32 0, i32 4
  %1179 = xor i32 %1177, %1178
  %1180 = select i1 %28, i32 0, i32 16
  %1181 = xor i32 %1179, %1180
  %1182 = select i1 %32, i32 0, i32 32
  %1183 = xor i32 %1181, %1182
  %1184 = select i1 %36, i32 0, i32 64
  %1185 = xor i32 %1183, %1184
  %1186 = xor i32 %1185, %1157
  %1187 = select i1 %47, i32 0, i32 256
  %1188 = xor i32 %1186, %1187
  %1189 = xor i32 %1169, %1180
  %1190 = xor i32 %1189, %1182
  %1191 = xor i32 %1190, %1184
  %1192 = select i1 %40, i32 0, i32 128
  %1193 = xor i32 %1191, %1192
  %1194 = xor i32 %1193, %1187
  %1195 = xor i32 %1188, 0
  %1196 = lshr i32 %1195, 4
  %1197 = shl i32 %1196, 2
  %1198 = add i32 %1197, %1195
  %1199 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1198
  %1200 = insertelement <2 x bfloat> undef, bfloat %1145, i32 0
  %1201 = insertelement <2 x bfloat> %1200, bfloat %1146, i32 1
  %1202 = extractelement <2 x bfloat> %1201, i32 0
  %1203 = extractelement <2 x bfloat> %1201, i32 1
  %1204 = bitcast bfloat %1202 to i16
  %1205 = bitcast bfloat %1203 to i16
  %1206 = insertelement <2 x i16> undef, i16 %1204, i32 0
  %1207 = insertelement <2 x i16> %1206, i16 %1205, i32 1
  %1208 = extractelement <2 x i16> %1207, i32 0
  %1209 = extractelement <2 x i16> %1207, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1199, i16 %1208, i16 %1209, i1 true)
  %1210 = xor i32 %1188, 128
  %1211 = lshr i32 %1210, 4
  %1212 = shl i32 %1211, 2
  %1213 = add i32 %1212, %1210
  %1214 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1213
  %1215 = insertelement <2 x bfloat> undef, bfloat %1147, i32 0
  %1216 = insertelement <2 x bfloat> %1215, bfloat %1148, i32 1
  %1217 = extractelement <2 x bfloat> %1216, i32 0
  %1218 = extractelement <2 x bfloat> %1216, i32 1
  %1219 = bitcast bfloat %1217 to i16
  %1220 = bitcast bfloat %1218 to i16
  %1221 = insertelement <2 x i16> undef, i16 %1219, i32 0
  %1222 = insertelement <2 x i16> %1221, i16 %1220, i32 1
  %1223 = extractelement <2 x i16> %1222, i32 0
  %1224 = extractelement <2 x i16> %1222, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1214, i16 %1223, i16 %1224, i1 true)
  call void @llvm.nvvm.barrier0()
  %1225 = xor i32 %1194, 0
  %1226 = lshr i32 %1225, 4
  %1227 = shl i32 %1226, 2
  %1228 = add i32 %1227, %1225
  %1229 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1228
  %1230 = load <4 x i16>, ptr addrspace(3) %1229, align 8
  %1231 = extractelement <4 x i16> %1230, i32 0
  %1232 = extractelement <4 x i16> %1230, i32 1
  %1233 = extractelement <4 x i16> %1230, i32 2
  %1234 = extractelement <4 x i16> %1230, i32 3
  %1235 = insertelement <4 x i16> undef, i16 %1231, i32 0
  %1236 = insertelement <4 x i16> %1235, i16 %1232, i32 1
  %1237 = insertelement <4 x i16> %1236, i16 %1233, i32 2
  %1238 = insertelement <4 x i16> %1237, i16 %1234, i32 3
  %1239 = extractelement <4 x i16> %1238, i32 0
  %1240 = extractelement <4 x i16> %1238, i32 1
  %1241 = extractelement <4 x i16> %1238, i32 2
  %1242 = extractelement <4 x i16> %1238, i32 3
  %1243 = bitcast i16 %1239 to bfloat
  %1244 = bitcast i16 %1240 to bfloat
  %1245 = bitcast i16 %1241 to bfloat
  %1246 = bitcast i16 %1242 to bfloat
  %1247 = insertelement <4 x bfloat> undef, bfloat %1243, i32 0
  %1248 = insertelement <4 x bfloat> %1247, bfloat %1244, i32 1
  %1249 = insertelement <4 x bfloat> %1248, bfloat %1245, i32 2
  %1250 = insertelement <4 x bfloat> %1249, bfloat %1246, i32 3
  %1251 = extractelement <4 x bfloat> %1250, i32 0
  %1252 = extractelement <4 x bfloat> %1250, i32 1
  %1253 = extractelement <4 x bfloat> %1250, i32 2
  %1254 = extractelement <4 x bfloat> %1250, i32 3
  %1255 = insertelement <2 x bfloat> undef, bfloat %1251, i32 0
  %1256 = insertelement <2 x bfloat> %1255, bfloat %1252, i32 1
  %1257 = bitcast <2 x bfloat> %1256 to i32
  %1258 = insertelement <2 x bfloat> undef, bfloat %1253, i32 0
  %1259 = insertelement <2 x bfloat> %1258, bfloat %1254, i32 1
  %1260 = bitcast <2 x bfloat> %1259 to i32
  call void asm sideeffect "st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l"(i32 %1257, i32 %1260, ptr addrspace(1) %1175)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_24_impl(ptr, ptr, ptr, ptr, ptr, ptr) #4

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #5

declare float @__nv_rsqrtf(float)

define ptx_kernel void @fusion_24(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(262144) %arg1, ptr noalias align 128 dereferenceable(262144) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(262144) %arg4) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %6 = addrspacecast ptr null to ptr addrspace(1)
  %7 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %8 = sext i32 %7 to i64
  %9 = mul i64 %8, 1024
  %10 = getelementptr bfloat, ptr addrspace(1) %3, i64 %9
  %11 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %12 = urem i32 %11, 32
  %13 = udiv i32 %11, 32
  %14 = and i32 %12, 1
  %15 = icmp eq i32 %14, 0
  %16 = select i1 %15, i32 0, i32 8
  %17 = xor i32 0, %16
  %18 = and i32 %12, 2
  %19 = icmp eq i32 %18, 0
  %20 = select i1 %19, i32 0, i32 16
  %21 = xor i32 %17, %20
  %22 = and i32 %12, 4
  %23 = icmp eq i32 %22, 0
  %24 = select i1 %23, i32 0, i32 32
  %25 = xor i32 %21, %24
  %26 = and i32 %12, 8
  %27 = icmp eq i32 %26, 0
  %28 = select i1 %27, i32 0, i32 64
  %29 = xor i32 %25, %28
  %30 = and i32 %12, 16
  %31 = icmp eq i32 %30, 0
  %32 = select i1 %31, i32 0, i32 128
  %33 = xor i32 %29, %32
  %34 = and i32 %13, 1
  %35 = icmp eq i32 %34, 0
  %36 = select i1 %35, i32 0, i32 256
  %37 = xor i32 %33, %36
  %38 = xor i32 %37, 0
  %39 = xor i32 %37, 512
  %40 = add i32 %38, 0
  %41 = add i32 %39, 0
  %42 = sext i32 %40 to i64
  %43 = sext i32 %41 to i64
  %44 = getelementptr bfloat, ptr addrspace(1) %10, i64 %42
  %45 = getelementptr bfloat, ptr addrspace(1) %10, i64 %43
  %46 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %44)
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
  %63 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %45)
  %64 = extractvalue { i32, i32, i32, i32 } %63, 0
  %65 = bitcast i32 %64 to <2 x bfloat>
  %66 = extractvalue { i32, i32, i32, i32 } %63, 1
  %67 = bitcast i32 %66 to <2 x bfloat>
  %68 = extractvalue { i32, i32, i32, i32 } %63, 2
  %69 = bitcast i32 %68 to <2 x bfloat>
  %70 = extractvalue { i32, i32, i32, i32 } %63, 3
  %71 = bitcast i32 %70 to <2 x bfloat>
  %72 = extractelement <2 x bfloat> %65, i32 0
  %73 = extractelement <2 x bfloat> %65, i32 1
  %74 = extractelement <2 x bfloat> %67, i32 0
  %75 = extractelement <2 x bfloat> %67, i32 1
  %76 = extractelement <2 x bfloat> %69, i32 0
  %77 = extractelement <2 x bfloat> %69, i32 1
  %78 = extractelement <2 x bfloat> %71, i32 0
  %79 = extractelement <2 x bfloat> %71, i32 1
  %80 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %55)
  %81 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %56)
  %82 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %57)
  %83 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %58)
  %84 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %59)
  %85 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %60)
  %86 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %61)
  %87 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %62)
  %88 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %72)
  %89 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %73)
  %90 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %74)
  %91 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %75)
  %92 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %76)
  %93 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %77)
  %94 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %78)
  %95 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %79)
  %96 = getelementptr bfloat, ptr addrspace(1) %2, i64 %9
  %97 = getelementptr bfloat, ptr addrspace(1) %96, i64 %42
  %98 = getelementptr bfloat, ptr addrspace(1) %96, i64 %43
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
  %149 = fadd float %80, %133
  %150 = fadd float %81, %134
  %151 = fadd float %82, %135
  %152 = fadd float %83, %136
  %153 = fadd float %84, %137
  %154 = fadd float %85, %138
  %155 = fadd float %86, %139
  %156 = fadd float %87, %140
  %157 = fadd float %88, %141
  %158 = fadd float %89, %142
  %159 = fadd float %90, %143
  %160 = fadd float %91, %144
  %161 = fadd float %92, %145
  %162 = fadd float %93, %146
  %163 = fadd float %94, %147
  %164 = fadd float %95, %148
  %165 = fmul float %149, %149
  %166 = fmul float %150, %150
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
  %181 = fadd float %165, %166
  %182 = fadd float %181, %167
  %183 = fadd float %182, %168
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
  %196 = bitcast float %195 to i32
  %197 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %196, i32 16, i32 31)
  %198 = bitcast i32 %197 to float
  %199 = fadd float %195, %198
  %200 = bitcast float %199 to i32
  %201 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %200, i32 8, i32 31)
  %202 = bitcast i32 %201 to float
  %203 = fadd float %199, %202
  %204 = bitcast float %203 to i32
  %205 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %204, i32 4, i32 31)
  %206 = bitcast i32 %205 to float
  %207 = fadd float %203, %206
  %208 = bitcast float %207 to i32
  %209 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %208, i32 2, i32 31)
  %210 = bitcast i32 %209 to float
  %211 = fadd float %207, %210
  %212 = bitcast float %211 to i32
  %213 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %212, i32 1, i32 31)
  %214 = bitcast i32 %213 to float
  %215 = fadd float %211, %214
  %216 = urem i32 %12, 32
  %217 = urem i32 %13, 2
  %218 = icmp eq i32 %216, 0
  %219 = and i1 true, %218
  %220 = add i32 0, %217
  %221 = getelementptr float, ptr addrspace(3) @global_smem, i32 %220
  %222 = insertelement <1 x float> undef, float %215, i32 0
  %223 = extractelement <1 x float> %222, i32 0
  %224 = bitcast float %223 to i32
  %225 = insertelement <1 x i32> undef, i32 %224, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %221, <1 x i32> %225, i1 %219)
  call void @llvm.nvvm.barrier0()
  %226 = icmp slt i32 %11, 2
  %227 = getelementptr float, ptr addrspace(3) @global_smem, i32 %11
  %228 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %227, i1 %226)
  %229 = insertelement <1 x i32> undef, i32 %228, i32 0
  %230 = extractelement <1 x i32> %229, i32 0
  %231 = bitcast i32 %230 to float
  %232 = insertelement <1 x float> undef, float %231, i32 0
  %233 = extractelement <1 x float> %232, i32 0
  %234 = bitcast float %233 to i32
  %235 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %234, i32 1, i32 31)
  %236 = bitcast i32 %235 to float
  %237 = fadd float %233, %236
  %238 = urem i32 %12, 2
  %239 = icmp eq i32 %238, 0
  %240 = and i1 %226, %239
  %241 = insertelement <1 x float> undef, float %237, i32 0
  %242 = extractelement <1 x float> %241, i32 0
  %243 = bitcast float %242 to i32
  %244 = insertelement <1 x i32> undef, i32 %243, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %227, <1 x i32> %244, i1 %240)
  call void @llvm.nvvm.barrier0()
  %245 = load float, ptr addrspace(3) @global_smem, align 4
  %246 = fmul float %245, 0x3F50000000000000
  %247 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %248 = bitcast i32 %247 to <1 x float>
  %249 = extractelement <1 x float> %248, i32 0
  %250 = fadd float %246, %249
  %251 = call float @__nv_rsqrtf(float %250)
  %252 = fmul float %149, %251
  %253 = fmul float %150, %251
  %254 = fmul float %151, %251
  %255 = fmul float %152, %251
  %256 = fmul float %153, %251
  %257 = fmul float %154, %251
  %258 = fmul float %155, %251
  %259 = fmul float %156, %251
  %260 = fmul float %157, %251
  %261 = fmul float %158, %251
  %262 = fmul float %159, %251
  %263 = fmul float %160, %251
  %264 = fmul float %161, %251
  %265 = fmul float %162, %251
  %266 = fmul float %163, %251
  %267 = fmul float %164, %251
  %268 = getelementptr bfloat, ptr addrspace(1) %4, i64 %42
  %269 = getelementptr bfloat, ptr addrspace(1) %4, i64 %43
  %270 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %268)
  %271 = extractvalue { i32, i32, i32, i32 } %270, 0
  %272 = bitcast i32 %271 to <2 x bfloat>
  %273 = extractvalue { i32, i32, i32, i32 } %270, 1
  %274 = bitcast i32 %273 to <2 x bfloat>
  %275 = extractvalue { i32, i32, i32, i32 } %270, 2
  %276 = bitcast i32 %275 to <2 x bfloat>
  %277 = extractvalue { i32, i32, i32, i32 } %270, 3
  %278 = bitcast i32 %277 to <2 x bfloat>
  %279 = extractelement <2 x bfloat> %272, i32 0
  %280 = extractelement <2 x bfloat> %272, i32 1
  %281 = extractelement <2 x bfloat> %274, i32 0
  %282 = extractelement <2 x bfloat> %274, i32 1
  %283 = extractelement <2 x bfloat> %276, i32 0
  %284 = extractelement <2 x bfloat> %276, i32 1
  %285 = extractelement <2 x bfloat> %278, i32 0
  %286 = extractelement <2 x bfloat> %278, i32 1
  %287 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %269)
  %288 = extractvalue { i32, i32, i32, i32 } %287, 0
  %289 = bitcast i32 %288 to <2 x bfloat>
  %290 = extractvalue { i32, i32, i32, i32 } %287, 1
  %291 = bitcast i32 %290 to <2 x bfloat>
  %292 = extractvalue { i32, i32, i32, i32 } %287, 2
  %293 = bitcast i32 %292 to <2 x bfloat>
  %294 = extractvalue { i32, i32, i32, i32 } %287, 3
  %295 = bitcast i32 %294 to <2 x bfloat>
  %296 = extractelement <2 x bfloat> %289, i32 0
  %297 = extractelement <2 x bfloat> %289, i32 1
  %298 = extractelement <2 x bfloat> %291, i32 0
  %299 = extractelement <2 x bfloat> %291, i32 1
  %300 = extractelement <2 x bfloat> %293, i32 0
  %301 = extractelement <2 x bfloat> %293, i32 1
  %302 = extractelement <2 x bfloat> %295, i32 0
  %303 = extractelement <2 x bfloat> %295, i32 1
  %304 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %279)
  %305 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %280)
  %306 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %281)
  %307 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %282)
  %308 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %283)
  %309 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %284)
  %310 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %285)
  %311 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %286)
  %312 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296)
  %313 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297)
  %314 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298)
  %315 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299)
  %316 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300)
  %317 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %301)
  %318 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %302)
  %319 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %303)
  %320 = fmul float %252, %304
  %321 = fmul float %253, %305
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
  %336 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %320)
  %337 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %321)
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
  %352 = getelementptr bfloat, ptr addrspace(1) %5, i64 %9
  %353 = getelementptr bfloat, ptr addrspace(1) %352, i64 %42
  %354 = getelementptr bfloat, ptr addrspace(1) %352, i64 %43
  %355 = insertelement <2 x bfloat> undef, bfloat %336, i32 0
  %356 = insertelement <2 x bfloat> %355, bfloat %337, i32 1
  %357 = bitcast <2 x bfloat> %356 to i32
  %358 = insertelement <2 x bfloat> undef, bfloat %338, i32 0
  %359 = insertelement <2 x bfloat> %358, bfloat %339, i32 1
  %360 = bitcast <2 x bfloat> %359 to i32
  %361 = insertelement <2 x bfloat> undef, bfloat %340, i32 0
  %362 = insertelement <2 x bfloat> %361, bfloat %341, i32 1
  %363 = bitcast <2 x bfloat> %362 to i32
  %364 = insertelement <2 x bfloat> undef, bfloat %342, i32 0
  %365 = insertelement <2 x bfloat> %364, bfloat %343, i32 1
  %366 = bitcast <2 x bfloat> %365 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %357, i32 %360, i32 %363, i32 %366, ptr addrspace(1) %353)
  %367 = insertelement <2 x bfloat> undef, bfloat %344, i32 0
  %368 = insertelement <2 x bfloat> %367, bfloat %345, i32 1
  %369 = bitcast <2 x bfloat> %368 to i32
  %370 = insertelement <2 x bfloat> undef, bfloat %346, i32 0
  %371 = insertelement <2 x bfloat> %370, bfloat %347, i32 1
  %372 = bitcast <2 x bfloat> %371 to i32
  %373 = insertelement <2 x bfloat> undef, bfloat %348, i32 0
  %374 = insertelement <2 x bfloat> %373, bfloat %349, i32 1
  %375 = bitcast <2 x bfloat> %374 to i32
  %376 = insertelement <2 x bfloat> undef, bfloat %350, i32 0
  %377 = insertelement <2 x bfloat> %376, bfloat %351, i32 1
  %378 = bitcast <2 x bfloat> %377 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %369, i32 %372, i32 %375, i32 %378, ptr addrspace(1) %354)
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
  %12 = call bfloat @fused_convert_param_0_108(ptr %0, i32 %5, i32 %11)
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
  %23 = call bfloat @fused_convert_param_0_108(ptr %0, i32 %5, i32 %22)
  %24 = fmul float %13, %21
  %25 = fpext bfloat %23 to float
  %26 = fmul float %24, %25
  %27 = fptrunc float %26 to bfloat
  %28 = insertelement <4 x bfloat> zeroinitializer, bfloat %27, i64 0
  %29 = add i32 %11, 1
  %30 = call bfloat @fused_convert_param_0_108(ptr %0, i32 %5, i32 %29)
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
  %41 = call bfloat @fused_convert_param_0_108(ptr %0, i32 %5, i32 %40)
  %42 = fmul float %31, %39
  %43 = fpext bfloat %41 to float
  %44 = fmul float %42, %43
  %45 = fptrunc float %44 to bfloat
  %46 = insertelement <4 x bfloat> %28, bfloat %45, i64 1
  %47 = add i32 %11, 2
  %48 = call bfloat @fused_convert_param_0_108(ptr %0, i32 %5, i32 %47)
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
  %59 = call bfloat @fused_convert_param_0_108(ptr %0, i32 %5, i32 %58)
  %60 = fmul float %49, %57
  %61 = fpext bfloat %59 to float
  %62 = fmul float %60, %61
  %63 = fptrunc float %62 to bfloat
  %64 = insertelement <4 x bfloat> %46, bfloat %63, i64 2
  %65 = add i32 %11, 3
  %66 = call bfloat @fused_convert_param_0_108(ptr %0, i32 %5, i32 %65)
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
  %77 = call bfloat @fused_convert_param_0_108(ptr %0, i32 %5, i32 %76)
  %78 = fmul float %67, %75
  %79 = fpext bfloat %77 to float
  %80 = fmul float %78, %79
  %81 = fptrunc float %80 to bfloat
  %82 = insertelement <4 x bfloat> %64, bfloat %81, i64 3
  %83 = getelementptr inbounds bfloat, ptr %1, i32 %8
  store <4 x bfloat> %82, ptr %83, align 8
  ret void
}

define internal bfloat @fused_convert_param_0_108(ptr noalias %0, i32 %1, i32 %2) {
  %4 = mul i32 %1, 6144
  %5 = add i32 %4, %2
  %6 = getelementptr inbounds bfloat, ptr %0, i32 %5
  %7 = load bfloat, ptr %6, align 2, !invariant.load !3
  ret bfloat %7
}

declare float @__nv_fast_expf(float)

declare ptx_kernel void @fusion_22_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_22(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(262144) %arg1, ptr noalias align 128 dereferenceable(262144) %arg2, ptr noalias align 128 dereferenceable(262144) %arg3, ptr noalias align 16 dereferenceable(2048) %arg4, ptr noalias align 128 dereferenceable(262144) %arg5) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %6 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %7 = addrspacecast ptr null to ptr addrspace(1)
  %8 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %9 = sext i32 %8 to i64
  %10 = mul i64 %9, 1024
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
  %97 = getelementptr bfloat, ptr addrspace(1) %3, i64 %10
  %98 = getelementptr bfloat, ptr addrspace(1) %97, i64 %43
  %99 = getelementptr bfloat, ptr addrspace(1) %97, i64 %44
  %100 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %98)
  %101 = extractvalue { i32, i32, i32, i32 } %100, 0
  %102 = bitcast i32 %101 to <2 x bfloat>
  %103 = extractvalue { i32, i32, i32, i32 } %100, 1
  %104 = bitcast i32 %103 to <2 x bfloat>
  %105 = extractvalue { i32, i32, i32, i32 } %100, 2
  %106 = bitcast i32 %105 to <2 x bfloat>
  %107 = extractvalue { i32, i32, i32, i32 } %100, 3
  %108 = bitcast i32 %107 to <2 x bfloat>
  %109 = extractelement <2 x bfloat> %102, i32 0
  %110 = extractelement <2 x bfloat> %102, i32 1
  %111 = extractelement <2 x bfloat> %104, i32 0
  %112 = extractelement <2 x bfloat> %104, i32 1
  %113 = extractelement <2 x bfloat> %106, i32 0
  %114 = extractelement <2 x bfloat> %106, i32 1
  %115 = extractelement <2 x bfloat> %108, i32 0
  %116 = extractelement <2 x bfloat> %108, i32 1
  %117 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %99)
  %118 = extractvalue { i32, i32, i32, i32 } %117, 0
  %119 = bitcast i32 %118 to <2 x bfloat>
  %120 = extractvalue { i32, i32, i32, i32 } %117, 1
  %121 = bitcast i32 %120 to <2 x bfloat>
  %122 = extractvalue { i32, i32, i32, i32 } %117, 2
  %123 = bitcast i32 %122 to <2 x bfloat>
  %124 = extractvalue { i32, i32, i32, i32 } %117, 3
  %125 = bitcast i32 %124 to <2 x bfloat>
  %126 = extractelement <2 x bfloat> %119, i32 0
  %127 = extractelement <2 x bfloat> %119, i32 1
  %128 = extractelement <2 x bfloat> %121, i32 0
  %129 = extractelement <2 x bfloat> %121, i32 1
  %130 = extractelement <2 x bfloat> %123, i32 0
  %131 = extractelement <2 x bfloat> %123, i32 1
  %132 = extractelement <2 x bfloat> %125, i32 0
  %133 = extractelement <2 x bfloat> %125, i32 1
  %134 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %109)
  %135 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %110)
  %136 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %111)
  %137 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %112)
  %138 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %113)
  %139 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %114)
  %140 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %115)
  %141 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %116)
  %142 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %126)
  %143 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %127)
  %144 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %128)
  %145 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %129)
  %146 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %130)
  %147 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %131)
  %148 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %132)
  %149 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %133)
  %150 = getelementptr bfloat, ptr addrspace(1) %2, i64 %10
  %151 = getelementptr bfloat, ptr addrspace(1) %150, i64 %43
  %152 = getelementptr bfloat, ptr addrspace(1) %150, i64 %44
  %153 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %151)
  %154 = extractvalue { i32, i32, i32, i32 } %153, 0
  %155 = bitcast i32 %154 to <2 x bfloat>
  %156 = extractvalue { i32, i32, i32, i32 } %153, 1
  %157 = bitcast i32 %156 to <2 x bfloat>
  %158 = extractvalue { i32, i32, i32, i32 } %153, 2
  %159 = bitcast i32 %158 to <2 x bfloat>
  %160 = extractvalue { i32, i32, i32, i32 } %153, 3
  %161 = bitcast i32 %160 to <2 x bfloat>
  %162 = extractelement <2 x bfloat> %155, i32 0
  %163 = extractelement <2 x bfloat> %155, i32 1
  %164 = extractelement <2 x bfloat> %157, i32 0
  %165 = extractelement <2 x bfloat> %157, i32 1
  %166 = extractelement <2 x bfloat> %159, i32 0
  %167 = extractelement <2 x bfloat> %159, i32 1
  %168 = extractelement <2 x bfloat> %161, i32 0
  %169 = extractelement <2 x bfloat> %161, i32 1
  %170 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %152)
  %171 = extractvalue { i32, i32, i32, i32 } %170, 0
  %172 = bitcast i32 %171 to <2 x bfloat>
  %173 = extractvalue { i32, i32, i32, i32 } %170, 1
  %174 = bitcast i32 %173 to <2 x bfloat>
  %175 = extractvalue { i32, i32, i32, i32 } %170, 2
  %176 = bitcast i32 %175 to <2 x bfloat>
  %177 = extractvalue { i32, i32, i32, i32 } %170, 3
  %178 = bitcast i32 %177 to <2 x bfloat>
  %179 = extractelement <2 x bfloat> %172, i32 0
  %180 = extractelement <2 x bfloat> %172, i32 1
  %181 = extractelement <2 x bfloat> %174, i32 0
  %182 = extractelement <2 x bfloat> %174, i32 1
  %183 = extractelement <2 x bfloat> %176, i32 0
  %184 = extractelement <2 x bfloat> %176, i32 1
  %185 = extractelement <2 x bfloat> %178, i32 0
  %186 = extractelement <2 x bfloat> %178, i32 1
  %187 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %162)
  %188 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %163)
  %189 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %164)
  %190 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %165)
  %191 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %166)
  %192 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %167)
  %193 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %168)
  %194 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %169)
  %195 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %179)
  %196 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %180)
  %197 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %181)
  %198 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %182)
  %199 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %183)
  %200 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %184)
  %201 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %185)
  %202 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %186)
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
  %218 = fadd float %149, %202
  %219 = fadd float %81, %203
  %220 = fadd float %82, %204
  %221 = fadd float %83, %205
  %222 = fadd float %84, %206
  %223 = fadd float %85, %207
  %224 = fadd float %86, %208
  %225 = fadd float %87, %209
  %226 = fadd float %88, %210
  %227 = fadd float %89, %211
  %228 = fadd float %90, %212
  %229 = fadd float %91, %213
  %230 = fadd float %92, %214
  %231 = fadd float %93, %215
  %232 = fadd float %94, %216
  %233 = fadd float %95, %217
  %234 = fadd float %96, %218
  %235 = fmul float %219, %219
  %236 = fmul float %220, %220
  %237 = fmul float %221, %221
  %238 = fmul float %222, %222
  %239 = fmul float %223, %223
  %240 = fmul float %224, %224
  %241 = fmul float %225, %225
  %242 = fmul float %226, %226
  %243 = fmul float %227, %227
  %244 = fmul float %228, %228
  %245 = fmul float %229, %229
  %246 = fmul float %230, %230
  %247 = fmul float %231, %231
  %248 = fmul float %232, %232
  %249 = fmul float %233, %233
  %250 = fmul float %234, %234
  %251 = fadd float %235, %236
  %252 = fadd float %251, %237
  %253 = fadd float %252, %238
  %254 = fadd float %253, %239
  %255 = fadd float %254, %240
  %256 = fadd float %255, %241
  %257 = fadd float %256, %242
  %258 = fadd float %257, %243
  %259 = fadd float %258, %244
  %260 = fadd float %259, %245
  %261 = fadd float %260, %246
  %262 = fadd float %261, %247
  %263 = fadd float %262, %248
  %264 = fadd float %263, %249
  %265 = fadd float %264, %250
  %266 = bitcast float %265 to i32
  %267 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %266, i32 16, i32 31)
  %268 = bitcast i32 %267 to float
  %269 = fadd float %265, %268
  %270 = bitcast float %269 to i32
  %271 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %270, i32 8, i32 31)
  %272 = bitcast i32 %271 to float
  %273 = fadd float %269, %272
  %274 = bitcast float %273 to i32
  %275 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %274, i32 4, i32 31)
  %276 = bitcast i32 %275 to float
  %277 = fadd float %273, %276
  %278 = bitcast float %277 to i32
  %279 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %278, i32 2, i32 31)
  %280 = bitcast i32 %279 to float
  %281 = fadd float %277, %280
  %282 = bitcast float %281 to i32
  %283 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %282, i32 1, i32 31)
  %284 = bitcast i32 %283 to float
  %285 = fadd float %281, %284
  %286 = urem i32 %13, 32
  %287 = urem i32 %14, 2
  %288 = icmp eq i32 %286, 0
  %289 = and i1 true, %288
  %290 = add i32 0, %287
  %291 = getelementptr float, ptr addrspace(3) @global_smem, i32 %290
  %292 = insertelement <1 x float> undef, float %285, i32 0
  %293 = extractelement <1 x float> %292, i32 0
  %294 = bitcast float %293 to i32
  %295 = insertelement <1 x i32> undef, i32 %294, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %291, <1 x i32> %295, i1 %289)
  call void @llvm.nvvm.barrier0()
  %296 = icmp slt i32 %12, 2
  %297 = getelementptr float, ptr addrspace(3) @global_smem, i32 %12
  %298 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %297, i1 %296)
  %299 = insertelement <1 x i32> undef, i32 %298, i32 0
  %300 = extractelement <1 x i32> %299, i32 0
  %301 = bitcast i32 %300 to float
  %302 = insertelement <1 x float> undef, float %301, i32 0
  %303 = extractelement <1 x float> %302, i32 0
  %304 = bitcast float %303 to i32
  %305 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %304, i32 1, i32 31)
  %306 = bitcast i32 %305 to float
  %307 = fadd float %303, %306
  %308 = urem i32 %13, 2
  %309 = icmp eq i32 %308, 0
  %310 = and i1 %296, %309
  %311 = insertelement <1 x float> undef, float %307, i32 0
  %312 = extractelement <1 x float> %311, i32 0
  %313 = bitcast float %312 to i32
  %314 = insertelement <1 x i32> undef, i32 %313, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %297, <1 x i32> %314, i1 %310)
  call void @llvm.nvvm.barrier0()
  %315 = load float, ptr addrspace(3) @global_smem, align 4
  %316 = fmul float %315, 0x3F50000000000000
  %317 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %318 = bitcast i32 %317 to <1 x float>
  %319 = extractelement <1 x float> %318, i32 0
  %320 = fadd float %316, %319
  %321 = call float @__nv_rsqrtf(float %320)
  %322 = fmul float %219, %321
  %323 = fmul float %220, %321
  %324 = fmul float %221, %321
  %325 = fmul float %222, %321
  %326 = fmul float %223, %321
  %327 = fmul float %224, %321
  %328 = fmul float %225, %321
  %329 = fmul float %226, %321
  %330 = fmul float %227, %321
  %331 = fmul float %228, %321
  %332 = fmul float %229, %321
  %333 = fmul float %230, %321
  %334 = fmul float %231, %321
  %335 = fmul float %232, %321
  %336 = fmul float %233, %321
  %337 = fmul float %234, %321
  %338 = getelementptr bfloat, ptr addrspace(1) %5, i64 %43
  %339 = getelementptr bfloat, ptr addrspace(1) %5, i64 %44
  %340 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %338)
  %341 = extractvalue { i32, i32, i32, i32 } %340, 0
  %342 = bitcast i32 %341 to <2 x bfloat>
  %343 = extractvalue { i32, i32, i32, i32 } %340, 1
  %344 = bitcast i32 %343 to <2 x bfloat>
  %345 = extractvalue { i32, i32, i32, i32 } %340, 2
  %346 = bitcast i32 %345 to <2 x bfloat>
  %347 = extractvalue { i32, i32, i32, i32 } %340, 3
  %348 = bitcast i32 %347 to <2 x bfloat>
  %349 = extractelement <2 x bfloat> %342, i32 0
  %350 = extractelement <2 x bfloat> %342, i32 1
  %351 = extractelement <2 x bfloat> %344, i32 0
  %352 = extractelement <2 x bfloat> %344, i32 1
  %353 = extractelement <2 x bfloat> %346, i32 0
  %354 = extractelement <2 x bfloat> %346, i32 1
  %355 = extractelement <2 x bfloat> %348, i32 0
  %356 = extractelement <2 x bfloat> %348, i32 1
  %357 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %339)
  %358 = extractvalue { i32, i32, i32, i32 } %357, 0
  %359 = bitcast i32 %358 to <2 x bfloat>
  %360 = extractvalue { i32, i32, i32, i32 } %357, 1
  %361 = bitcast i32 %360 to <2 x bfloat>
  %362 = extractvalue { i32, i32, i32, i32 } %357, 2
  %363 = bitcast i32 %362 to <2 x bfloat>
  %364 = extractvalue { i32, i32, i32, i32 } %357, 3
  %365 = bitcast i32 %364 to <2 x bfloat>
  %366 = extractelement <2 x bfloat> %359, i32 0
  %367 = extractelement <2 x bfloat> %359, i32 1
  %368 = extractelement <2 x bfloat> %361, i32 0
  %369 = extractelement <2 x bfloat> %361, i32 1
  %370 = extractelement <2 x bfloat> %363, i32 0
  %371 = extractelement <2 x bfloat> %363, i32 1
  %372 = extractelement <2 x bfloat> %365, i32 0
  %373 = extractelement <2 x bfloat> %365, i32 1
  %374 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %349)
  %375 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %350)
  %376 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %351)
  %377 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %352)
  %378 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %353)
  %379 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %354)
  %380 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %355)
  %381 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %356)
  %382 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %366)
  %383 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %367)
  %384 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %368)
  %385 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %369)
  %386 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %370)
  %387 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %371)
  %388 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %372)
  %389 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %373)
  %390 = fmul float %322, %374
  %391 = fmul float %323, %375
  %392 = fmul float %324, %376
  %393 = fmul float %325, %377
  %394 = fmul float %326, %378
  %395 = fmul float %327, %379
  %396 = fmul float %328, %380
  %397 = fmul float %329, %381
  %398 = fmul float %330, %382
  %399 = fmul float %331, %383
  %400 = fmul float %332, %384
  %401 = fmul float %333, %385
  %402 = fmul float %334, %386
  %403 = fmul float %335, %387
  %404 = fmul float %336, %388
  %405 = fmul float %337, %389
  %406 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %390)
  %407 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %391)
  %408 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %392)
  %409 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %393)
  %410 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %394)
  %411 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %395)
  %412 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %396)
  %413 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %397)
  %414 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %398)
  %415 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %399)
  %416 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %400)
  %417 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %401)
  %418 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %402)
  %419 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %403)
  %420 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %404)
  %421 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %405)
  %422 = getelementptr bfloat, ptr addrspace(1) %6, i64 %10
  %423 = getelementptr bfloat, ptr addrspace(1) %422, i64 %43
  %424 = getelementptr bfloat, ptr addrspace(1) %422, i64 %44
  %425 = insertelement <2 x bfloat> undef, bfloat %406, i32 0
  %426 = insertelement <2 x bfloat> %425, bfloat %407, i32 1
  %427 = bitcast <2 x bfloat> %426 to i32
  %428 = insertelement <2 x bfloat> undef, bfloat %408, i32 0
  %429 = insertelement <2 x bfloat> %428, bfloat %409, i32 1
  %430 = bitcast <2 x bfloat> %429 to i32
  %431 = insertelement <2 x bfloat> undef, bfloat %410, i32 0
  %432 = insertelement <2 x bfloat> %431, bfloat %411, i32 1
  %433 = bitcast <2 x bfloat> %432 to i32
  %434 = insertelement <2 x bfloat> undef, bfloat %412, i32 0
  %435 = insertelement <2 x bfloat> %434, bfloat %413, i32 1
  %436 = bitcast <2 x bfloat> %435 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %427, i32 %430, i32 %433, i32 %436, ptr addrspace(1) %423)
  %437 = insertelement <2 x bfloat> undef, bfloat %414, i32 0
  %438 = insertelement <2 x bfloat> %437, bfloat %415, i32 1
  %439 = bitcast <2 x bfloat> %438 to i32
  %440 = insertelement <2 x bfloat> undef, bfloat %416, i32 0
  %441 = insertelement <2 x bfloat> %440, bfloat %417, i32 1
  %442 = bitcast <2 x bfloat> %441 to i32
  %443 = insertelement <2 x bfloat> undef, bfloat %418, i32 0
  %444 = insertelement <2 x bfloat> %443, bfloat %419, i32 1
  %445 = bitcast <2 x bfloat> %444 to i32
  %446 = insertelement <2 x bfloat> undef, bfloat %420, i32 0
  %447 = insertelement <2 x bfloat> %446, bfloat %421, i32 1
  %448 = bitcast <2 x bfloat> %447 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %439, i32 %442, i32 %445, i32 %448, ptr addrspace(1) %424)
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

declare ptx_kernel void @triton_softmax_3_0_impl(ptr, ptr, ptr, ptr) #4

define ptx_kernel void @triton_softmax_3_0(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(1048576) %arg1, ptr noalias align 128 dereferenceable(524288) %arg2) #6 {
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
  %21 = call float @fused_concatenate_convert_136_7(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %9)
  %22 = fmul float %20, %21
  %23 = add i32 %9, 64
  %24 = add i32 %14, 64
  %25 = getelementptr inbounds float, ptr %0, i32 %24
  %26 = load float, ptr %25, align 4, !invariant.load !3
  %27 = getelementptr inbounds bfloat, ptr %1, i32 %23
  %28 = load bfloat, ptr %27, align 2, !invariant.load !3
  %29 = fpext bfloat %28 to float
  %30 = fmul float %26, %29
  %31 = call float @fused_concatenate_convert_136_7(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %23)
  %32 = fmul float %30, %31
  %33 = fsub float %22, %32
  %34 = fptrunc float %33 to bfloat
  %35 = getelementptr inbounds bfloat, ptr %4, i32 %14
  store bfloat %34, ptr %35, align 2
  %36 = load float, ptr %25, align 4, !invariant.load !3
  %37 = load bfloat, ptr %27, align 2, !invariant.load !3
  %38 = fpext bfloat %37 to float
  %39 = fmul float %36, %38
  %40 = call float @fused_concatenate_convert_136_7(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %9)
  %41 = fmul float %39, %40
  %42 = load float, ptr %15, align 4, !invariant.load !3
  %43 = load bfloat, ptr %17, align 2, !invariant.load !3
  %44 = fpext bfloat %43 to float
  %45 = fmul float %42, %44
  %46 = call float @fused_concatenate_convert_136_7(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %23)
  %47 = fmul float %45, %46
  %48 = fadd float %41, %47
  %49 = fptrunc float %48 to bfloat
  %50 = getelementptr inbounds bfloat, ptr %4, i32 %24
  store bfloat %49, ptr %50, align 2
  ret void
}

define internal float @fused_concatenate_convert_136_7(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, i32 %4, i32 %5) {
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

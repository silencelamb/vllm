; ModuleID = 'SyncTensorsGraph.1033'
source_filename = "SyncTensorsGraph.1033"
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

define ptx_kernel void @wrapped_concatenate(ptr noalias align 16 dereferenceable(4194304) %0, ptr noalias align 16 dereferenceable(4194304) %1, ptr noalias align 16 dereferenceable(4194304) %2, ptr noalias align 16 dereferenceable(4194304) %3, ptr noalias align 16 dereferenceable(4194304) %4, ptr noalias align 16 dereferenceable(4194304) %5, ptr noalias align 16 dereferenceable(4194304) %6, ptr noalias align 16 dereferenceable(4194304) %7, ptr noalias align 16 dereferenceable(4194304) %8, ptr noalias align 16 dereferenceable(4194304) %9, ptr noalias align 16 dereferenceable(4194304) %10, ptr noalias align 16 dereferenceable(4194304) %11, ptr noalias align 128 dereferenceable(50331648) %12) #0 {
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %15 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %16 = udiv i32 %15, 16
  %17 = icmp ult i32 %16, 6144
  br i1 %17, label %18, label %93

18:                                               ; preds = %13
  %19 = icmp ult i32 %16, 3072
  br i1 %19, label %20, label %53

20:                                               ; preds = %18
  %21 = icmp ult i32 %16, 1024
  br i1 %21, label %22, label %27

22:                                               ; preds = %20
  %23 = mul i32 %15, 128
  %24 = add i32 %23, %14
  %25 = getelementptr inbounds bfloat, ptr %0, i32 %24
  %26 = load bfloat, ptr %25, align 2, !invariant.load !3
  br label %50

27:                                               ; preds = %20
  %28 = icmp ult i32 %16, 2048
  br i1 %28, label %29, label %38

29:                                               ; preds = %27
  %30 = sub i32 %16, 1024
  %31 = urem i32 %15, 16
  %32 = mul i32 %31, 128
  %33 = add i32 %32, %14
  %34 = mul i32 %30, 2048
  %35 = add i32 %33, %34
  %36 = getelementptr inbounds bfloat, ptr %1, i32 %35
  %37 = load bfloat, ptr %36, align 2, !invariant.load !3
  br label %47

38:                                               ; preds = %27
  %39 = sub i32 %16, 2048
  %40 = urem i32 %15, 16
  %41 = mul i32 %40, 128
  %42 = add i32 %41, %14
  %43 = mul i32 %39, 2048
  %44 = add i32 %42, %43
  %45 = getelementptr inbounds bfloat, ptr %2, i32 %44
  %46 = load bfloat, ptr %45, align 2, !invariant.load !3
  br label %47

47:                                               ; preds = %29, %38
  %48 = phi bfloat [ %46, %38 ], [ %37, %29 ]
  br label %49

49:                                               ; preds = %47
  br label %50

50:                                               ; preds = %22, %49
  %51 = phi bfloat [ %48, %49 ], [ %26, %22 ]
  br label %52

52:                                               ; preds = %50
  br label %90

53:                                               ; preds = %18
  %54 = icmp ult i32 %16, 4096
  br i1 %54, label %55, label %64

55:                                               ; preds = %53
  %56 = sub i32 %16, 3072
  %57 = urem i32 %15, 16
  %58 = mul i32 %57, 128
  %59 = add i32 %58, %14
  %60 = mul i32 %56, 2048
  %61 = add i32 %59, %60
  %62 = getelementptr inbounds bfloat, ptr %3, i32 %61
  %63 = load bfloat, ptr %62, align 2, !invariant.load !3
  br label %87

64:                                               ; preds = %53
  %65 = icmp ult i32 %16, 5120
  br i1 %65, label %66, label %75

66:                                               ; preds = %64
  %67 = sub i32 %16, 4096
  %68 = urem i32 %15, 16
  %69 = mul i32 %68, 128
  %70 = add i32 %69, %14
  %71 = mul i32 %67, 2048
  %72 = add i32 %70, %71
  %73 = getelementptr inbounds bfloat, ptr %4, i32 %72
  %74 = load bfloat, ptr %73, align 2, !invariant.load !3
  br label %84

75:                                               ; preds = %64
  %76 = sub i32 %16, 5120
  %77 = urem i32 %15, 16
  %78 = mul i32 %77, 128
  %79 = add i32 %78, %14
  %80 = mul i32 %76, 2048
  %81 = add i32 %79, %80
  %82 = getelementptr inbounds bfloat, ptr %5, i32 %81
  %83 = load bfloat, ptr %82, align 2, !invariant.load !3
  br label %84

84:                                               ; preds = %66, %75
  %85 = phi bfloat [ %83, %75 ], [ %74, %66 ]
  br label %86

86:                                               ; preds = %84
  br label %87

87:                                               ; preds = %55, %86
  %88 = phi bfloat [ %85, %86 ], [ %63, %55 ]
  br label %89

89:                                               ; preds = %87
  br label %90

90:                                               ; preds = %52, %89
  %91 = phi bfloat [ %88, %89 ], [ %51, %52 ]
  br label %92

92:                                               ; preds = %90
  br label %172

93:                                               ; preds = %13
  %94 = icmp ult i32 %16, 9216
  br i1 %94, label %95, label %132

95:                                               ; preds = %93
  %96 = icmp ult i32 %16, 7168
  br i1 %96, label %97, label %106

97:                                               ; preds = %95
  %98 = sub i32 %16, 6144
  %99 = urem i32 %15, 16
  %100 = mul i32 %99, 128
  %101 = add i32 %100, %14
  %102 = mul i32 %98, 2048
  %103 = add i32 %101, %102
  %104 = getelementptr inbounds bfloat, ptr %6, i32 %103
  %105 = load bfloat, ptr %104, align 2, !invariant.load !3
  br label %129

106:                                              ; preds = %95
  %107 = icmp ult i32 %16, 8192
  br i1 %107, label %108, label %117

108:                                              ; preds = %106
  %109 = sub i32 %16, 7168
  %110 = urem i32 %15, 16
  %111 = mul i32 %110, 128
  %112 = add i32 %111, %14
  %113 = mul i32 %109, 2048
  %114 = add i32 %112, %113
  %115 = getelementptr inbounds bfloat, ptr %7, i32 %114
  %116 = load bfloat, ptr %115, align 2, !invariant.load !3
  br label %126

117:                                              ; preds = %106
  %118 = sub i32 %16, 8192
  %119 = urem i32 %15, 16
  %120 = mul i32 %119, 128
  %121 = add i32 %120, %14
  %122 = mul i32 %118, 2048
  %123 = add i32 %121, %122
  %124 = getelementptr inbounds bfloat, ptr %8, i32 %123
  %125 = load bfloat, ptr %124, align 2, !invariant.load !3
  br label %126

126:                                              ; preds = %108, %117
  %127 = phi bfloat [ %125, %117 ], [ %116, %108 ]
  br label %128

128:                                              ; preds = %126
  br label %129

129:                                              ; preds = %97, %128
  %130 = phi bfloat [ %127, %128 ], [ %105, %97 ]
  br label %131

131:                                              ; preds = %129
  br label %169

132:                                              ; preds = %93
  %133 = icmp ult i32 %16, 10240
  br i1 %133, label %134, label %143

134:                                              ; preds = %132
  %135 = sub i32 %16, 9216
  %136 = urem i32 %15, 16
  %137 = mul i32 %136, 128
  %138 = add i32 %137, %14
  %139 = mul i32 %135, 2048
  %140 = add i32 %138, %139
  %141 = getelementptr inbounds bfloat, ptr %9, i32 %140
  %142 = load bfloat, ptr %141, align 2, !invariant.load !3
  br label %166

143:                                              ; preds = %132
  %144 = icmp ult i32 %16, 11264
  br i1 %144, label %145, label %154

145:                                              ; preds = %143
  %146 = sub i32 %16, 10240
  %147 = urem i32 %15, 16
  %148 = mul i32 %147, 128
  %149 = add i32 %148, %14
  %150 = mul i32 %146, 2048
  %151 = add i32 %149, %150
  %152 = getelementptr inbounds bfloat, ptr %10, i32 %151
  %153 = load bfloat, ptr %152, align 2, !invariant.load !3
  br label %163

154:                                              ; preds = %143
  %155 = sub i32 %16, 11264
  %156 = urem i32 %15, 16
  %157 = mul i32 %156, 128
  %158 = add i32 %157, %14
  %159 = mul i32 %155, 2048
  %160 = add i32 %158, %159
  %161 = getelementptr inbounds bfloat, ptr %11, i32 %160
  %162 = load bfloat, ptr %161, align 2, !invariant.load !3
  br label %163

163:                                              ; preds = %145, %154
  %164 = phi bfloat [ %162, %154 ], [ %153, %145 ]
  br label %165

165:                                              ; preds = %163
  br label %166

166:                                              ; preds = %134, %165
  %167 = phi bfloat [ %164, %165 ], [ %142, %134 ]
  br label %168

168:                                              ; preds = %166
  br label %169

169:                                              ; preds = %131, %168
  %170 = phi bfloat [ %167, %168 ], [ %130, %131 ]
  br label %171

171:                                              ; preds = %169
  br label %172

172:                                              ; preds = %92, %171
  %173 = phi bfloat [ %170, %171 ], [ %91, %92 ]
  br label %174

174:                                              ; preds = %172
  %175 = mul i32 %15, 128
  %176 = add i32 %175, %14
  %177 = getelementptr inbounds bfloat, ptr %12, i32 %176
  store bfloat %173, ptr %177, align 2
  ret void
}

declare ptx_kernel void @gemm_fusion_dot_47_0_impl(ptr, ptr, ptr) #2

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #3

define ptx_kernel void @gemm_fusion_dot_47_0(ptr noalias align 128 dereferenceable(50331648) %arg0, ptr noalias align 128 dereferenceable(3145728) %arg1) #0 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr null to ptr addrspace(1)
  %4 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %5 = sdiv i32 %4, 1536
  %6 = mul i32 %5, 8
  %7 = sub i32 1, %6
  %8 = icmp slt i32 %7, 8
  %9 = select i1 %8, i32 %7, i32 8
  %10 = srem i32 %4, %9
  %11 = add i32 %6, %10
  %12 = srem i32 %4, 1536
  %13 = sdiv i32 %12, %9
  %14 = mul i32 %13, 64
  %15 = sext i32 %14 to i64
  %16 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %17 = urem i32 %16, 32
  %18 = and i32 %17, 1
  %19 = icmp eq i32 %18, 0
  %20 = select i1 %19, i32 0, i32 8
  %21 = xor i32 0, %20
  %22 = and i32 %17, 2
  %23 = icmp eq i32 %22, 0
  %24 = select i1 %23, i32 0, i32 16
  %25 = xor i32 %21, %24
  %26 = and i32 %17, 4
  %27 = icmp eq i32 %26, 0
  %28 = select i1 %27, i32 0, i32 32
  %29 = xor i32 %25, %28
  %30 = and i32 %17, 8
  %31 = icmp eq i32 %30, 0
  %32 = select i1 %31, i32 0, i32 64
  %33 = xor i32 %29, %32
  %34 = xor i32 %33, 0
  %35 = add i32 %34, 0
  %36 = sext i32 %35 to i64
  %37 = udiv i32 %16, 32
  %38 = and i32 %17, 16
  %39 = icmp eq i32 %38, 0
  %40 = select i1 %39, i32 0, i32 1
  %41 = xor i32 0, %40
  %42 = and i32 %37, 1
  %43 = icmp eq i32 %42, 0
  %44 = select i1 %43, i32 0, i32 2
  %45 = xor i32 %41, %44
  %46 = and i32 %37, 2
  %47 = icmp eq i32 %46, 0
  %48 = select i1 %47, i32 0, i32 4
  %49 = xor i32 %45, %48
  %50 = xor i32 %49, 0
  %51 = xor i32 %49, 8
  %52 = xor i32 %49, 16
  %53 = xor i32 %49, 24
  %54 = xor i32 %49, 32
  %55 = xor i32 %49, 40
  %56 = xor i32 %49, 48
  %57 = xor i32 %49, 56
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
  %90 = add i64 %36, %82
  %91 = add i64 %36, %83
  %92 = add i64 %36, %84
  %93 = add i64 %36, %85
  %94 = add i64 %36, %86
  %95 = add i64 %36, %87
  %96 = add i64 %36, %88
  %97 = add i64 %36, %89
  %98 = getelementptr bfloat, ptr addrspace(1) %1, i64 %90
  %99 = getelementptr bfloat, ptr addrspace(1) %1, i64 %91
  %100 = getelementptr bfloat, ptr addrspace(1) %1, i64 %92
  %101 = getelementptr bfloat, ptr addrspace(1) %1, i64 %93
  %102 = getelementptr bfloat, ptr addrspace(1) %1, i64 %94
  %103 = getelementptr bfloat, ptr addrspace(1) %1, i64 %95
  %104 = getelementptr bfloat, ptr addrspace(1) %1, i64 %96
  %105 = getelementptr bfloat, ptr addrspace(1) %1, i64 %97
  %106 = select i1 %39, i32 0, i32 136
  %107 = xor i32 %33, %106
  %108 = select i1 %43, i32 0, i32 272
  %109 = xor i32 %107, %108
  %110 = select i1 %47, i32 0, i32 544
  %111 = xor i32 %109, %110
  %112 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %111
  %113 = xor i32 1024, %20
  %114 = xor i32 %113, %24
  %115 = xor i32 %114, %28
  %116 = xor i32 %115, %32
  %117 = xor i32 %116, %106
  %118 = xor i32 %117, %108
  %119 = xor i32 %118, %110
  %120 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %119
  %121 = xor i32 2048, %20
  %122 = xor i32 %121, %24
  %123 = xor i32 %122, %28
  %124 = xor i32 %123, %32
  %125 = xor i32 %124, %106
  %126 = xor i32 %125, %108
  %127 = xor i32 %126, %110
  %128 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %127
  %129 = xor i32 3072, %20
  %130 = xor i32 %129, %24
  %131 = xor i32 %130, %28
  %132 = xor i32 %131, %32
  %133 = xor i32 %132, %106
  %134 = xor i32 %133, %108
  %135 = xor i32 %134, %110
  %136 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %135
  %137 = xor i32 4096, %20
  %138 = xor i32 %137, %24
  %139 = xor i32 %138, %28
  %140 = xor i32 %139, %32
  %141 = xor i32 %140, %106
  %142 = xor i32 %141, %108
  %143 = xor i32 %142, %110
  %144 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %143
  %145 = xor i32 5120, %20
  %146 = xor i32 %145, %24
  %147 = xor i32 %146, %28
  %148 = xor i32 %147, %32
  %149 = xor i32 %148, %106
  %150 = xor i32 %149, %108
  %151 = xor i32 %150, %110
  %152 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %151
  %153 = xor i32 6144, %20
  %154 = xor i32 %153, %24
  %155 = xor i32 %154, %28
  %156 = xor i32 %155, %32
  %157 = xor i32 %156, %106
  %158 = xor i32 %157, %108
  %159 = xor i32 %158, %110
  %160 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %159
  %161 = xor i32 7168, %20
  %162 = xor i32 %161, %24
  %163 = xor i32 %162, %28
  %164 = xor i32 %163, %32
  %165 = xor i32 %164, %106
  %166 = xor i32 %165, %108
  %167 = xor i32 %166, %110
  %168 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %167
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %112, ptr addrspace(1) %98, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %120, ptr addrspace(1) %99, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %128, ptr addrspace(1) %100, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %136, ptr addrspace(1) %101, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %144, ptr addrspace(1) %102, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %152, ptr addrspace(1) %103, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %160, ptr addrspace(1) %104, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %168, ptr addrspace(1) %105, i32 16)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  %169 = add i64 %36, 128
  %170 = add i64 %169, %82
  %171 = add i64 %169, %83
  %172 = add i64 %169, %84
  %173 = add i64 %169, %85
  %174 = add i64 %169, %86
  %175 = add i64 %169, %87
  %176 = add i64 %169, %88
  %177 = add i64 %169, %89
  %178 = getelementptr bfloat, ptr addrspace(1) %1, i64 %170
  %179 = getelementptr bfloat, ptr addrspace(1) %1, i64 %171
  %180 = getelementptr bfloat, ptr addrspace(1) %1, i64 %172
  %181 = getelementptr bfloat, ptr addrspace(1) %1, i64 %173
  %182 = getelementptr bfloat, ptr addrspace(1) %1, i64 %174
  %183 = getelementptr bfloat, ptr addrspace(1) %1, i64 %175
  %184 = getelementptr bfloat, ptr addrspace(1) %1, i64 %176
  %185 = getelementptr bfloat, ptr addrspace(1) %1, i64 %177
  call void @llvm.nvvm.barrier0()
  %186 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i32 %111
  %187 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i32 %119
  %188 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i32 %127
  %189 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i32 %135
  %190 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i32 %143
  %191 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i32 %151
  %192 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i32 %159
  %193 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i32 %167
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %186, ptr addrspace(1) %178, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %187, ptr addrspace(1) %179, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %188, ptr addrspace(1) %180, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %189, ptr addrspace(1) %181, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %190, ptr addrspace(1) %182, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %191, ptr addrspace(1) %183, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %192, ptr addrspace(1) %184, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %193, ptr addrspace(1) %185, i32 16)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  %194 = add i64 %36, 256
  %195 = add i64 %194, %82
  %196 = add i64 %194, %83
  %197 = add i64 %194, %84
  %198 = add i64 %194, %85
  %199 = add i64 %194, %86
  %200 = add i64 %194, %87
  %201 = add i64 %194, %88
  %202 = add i64 %194, %89
  %203 = getelementptr bfloat, ptr addrspace(1) %1, i64 %195
  %204 = getelementptr bfloat, ptr addrspace(1) %1, i64 %196
  %205 = getelementptr bfloat, ptr addrspace(1) %1, i64 %197
  %206 = getelementptr bfloat, ptr addrspace(1) %1, i64 %198
  %207 = getelementptr bfloat, ptr addrspace(1) %1, i64 %199
  %208 = getelementptr bfloat, ptr addrspace(1) %1, i64 %200
  %209 = getelementptr bfloat, ptr addrspace(1) %1, i64 %201
  %210 = getelementptr bfloat, ptr addrspace(1) %1, i64 %202
  call void @llvm.nvvm.barrier0()
  %211 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %111
  %212 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %119
  %213 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %127
  %214 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %135
  %215 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %143
  %216 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %151
  %217 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %159
  %218 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %167
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %211, ptr addrspace(1) %203, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %212, ptr addrspace(1) %204, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %213, ptr addrspace(1) %205, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %214, ptr addrspace(1) %206, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %215, ptr addrspace(1) %207, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %216, ptr addrspace(1) %208, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %217, ptr addrspace(1) %209, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %218, ptr addrspace(1) %210, i32 16)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  call void asm sideeffect "cp.async.wait_group 0x2;", ""()
  call void @llvm.nvvm.barrier0()
  br label %219

219:                                              ; preds = %227, %0
  %220 = phi i32 [ %1642, %227 ], [ 0, %0 ]
  %221 = phi i64 [ %1596, %227 ], [ 256, %0 ]
  %222 = phi { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } [ %1595, %227 ], [ zeroinitializer, %0 ]
  %223 = phi i32 [ %1599, %227 ], [ 2, %0 ]
  %224 = phi i32 [ %1633, %227 ], [ 0, %0 ]
  %225 = phi { ptr addrspace(3), i32, i32 } [ %1641, %227 ], [ { ptr addrspace(3) @global_smem, i32 0, i32 0 }, %0 ]
  %226 = icmp slt i32 %220, 2048
  br i1 %226, label %227, label %1643

227:                                              ; preds = %219
  %228 = icmp slt i32 %220, 1664
  %229 = extractvalue { ptr addrspace(3), i32, i32 } %225, 0
  %230 = select i1 %19, i32 0, i32 136
  %231 = xor i32 0, %230
  %232 = select i1 %23, i32 0, i32 272
  %233 = xor i32 %231, %232
  %234 = select i1 %27, i32 0, i32 544
  %235 = xor i32 %233, %234
  %236 = select i1 %31, i32 0, i32 8
  %237 = xor i32 %235, %236
  %238 = select i1 %39, i32 0, i32 16
  %239 = xor i32 %237, %238
  %240 = select i1 %43, i32 0, i32 1024
  %241 = xor i32 %239, %240
  %242 = getelementptr inbounds bfloat, ptr addrspace(3) %229, i32 %241
  %243 = ptrtoint ptr addrspace(3) %242 to i32
  %244 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %243)
  %245 = extractvalue { i32, i32, i32, i32 } %244, 0
  %246 = extractvalue { i32, i32, i32, i32 } %244, 1
  %247 = extractvalue { i32, i32, i32, i32 } %244, 2
  %248 = extractvalue { i32, i32, i32, i32 } %244, 3
  %249 = xor i32 32, %230
  %250 = xor i32 %249, %232
  %251 = xor i32 %250, %234
  %252 = xor i32 %251, %236
  %253 = xor i32 %252, %238
  %254 = xor i32 %253, %240
  %255 = getelementptr inbounds bfloat, ptr addrspace(3) %229, i32 %254
  %256 = ptrtoint ptr addrspace(3) %255 to i32
  %257 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %256)
  %258 = extractvalue { i32, i32, i32, i32 } %257, 0
  %259 = extractvalue { i32, i32, i32, i32 } %257, 1
  %260 = extractvalue { i32, i32, i32, i32 } %257, 2
  %261 = extractvalue { i32, i32, i32, i32 } %257, 3
  %262 = xor i32 64, %230
  %263 = xor i32 %262, %232
  %264 = xor i32 %263, %234
  %265 = xor i32 %264, %236
  %266 = xor i32 %265, %238
  %267 = xor i32 %266, %240
  %268 = getelementptr inbounds bfloat, ptr addrspace(3) %229, i32 %267
  %269 = ptrtoint ptr addrspace(3) %268 to i32
  %270 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %269)
  %271 = extractvalue { i32, i32, i32, i32 } %270, 0
  %272 = extractvalue { i32, i32, i32, i32 } %270, 1
  %273 = extractvalue { i32, i32, i32, i32 } %270, 2
  %274 = extractvalue { i32, i32, i32, i32 } %270, 3
  %275 = xor i32 96, %230
  %276 = xor i32 %275, %232
  %277 = xor i32 %276, %234
  %278 = xor i32 %277, %236
  %279 = xor i32 %278, %238
  %280 = xor i32 %279, %240
  %281 = getelementptr inbounds bfloat, ptr addrspace(3) %229, i32 %280
  %282 = ptrtoint ptr addrspace(3) %281 to i32
  %283 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %282)
  %284 = extractvalue { i32, i32, i32, i32 } %283, 0
  %285 = extractvalue { i32, i32, i32, i32 } %283, 1
  %286 = extractvalue { i32, i32, i32, i32 } %283, 2
  %287 = extractvalue { i32, i32, i32, i32 } %283, 3
  %288 = xor i32 2048, %230
  %289 = xor i32 %288, %232
  %290 = xor i32 %289, %234
  %291 = xor i32 %290, %236
  %292 = xor i32 %291, %238
  %293 = xor i32 %292, %240
  %294 = getelementptr inbounds bfloat, ptr addrspace(3) %229, i32 %293
  %295 = ptrtoint ptr addrspace(3) %294 to i32
  %296 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %295)
  %297 = extractvalue { i32, i32, i32, i32 } %296, 0
  %298 = extractvalue { i32, i32, i32, i32 } %296, 1
  %299 = extractvalue { i32, i32, i32, i32 } %296, 2
  %300 = extractvalue { i32, i32, i32, i32 } %296, 3
  %301 = xor i32 2080, %230
  %302 = xor i32 %301, %232
  %303 = xor i32 %302, %234
  %304 = xor i32 %303, %236
  %305 = xor i32 %304, %238
  %306 = xor i32 %305, %240
  %307 = getelementptr inbounds bfloat, ptr addrspace(3) %229, i32 %306
  %308 = ptrtoint ptr addrspace(3) %307 to i32
  %309 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %308)
  %310 = extractvalue { i32, i32, i32, i32 } %309, 0
  %311 = extractvalue { i32, i32, i32, i32 } %309, 1
  %312 = extractvalue { i32, i32, i32, i32 } %309, 2
  %313 = extractvalue { i32, i32, i32, i32 } %309, 3
  %314 = xor i32 2112, %230
  %315 = xor i32 %314, %232
  %316 = xor i32 %315, %234
  %317 = xor i32 %316, %236
  %318 = xor i32 %317, %238
  %319 = xor i32 %318, %240
  %320 = getelementptr inbounds bfloat, ptr addrspace(3) %229, i32 %319
  %321 = ptrtoint ptr addrspace(3) %320 to i32
  %322 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %321)
  %323 = extractvalue { i32, i32, i32, i32 } %322, 0
  %324 = extractvalue { i32, i32, i32, i32 } %322, 1
  %325 = extractvalue { i32, i32, i32, i32 } %322, 2
  %326 = extractvalue { i32, i32, i32, i32 } %322, 3
  %327 = xor i32 2144, %230
  %328 = xor i32 %327, %232
  %329 = xor i32 %328, %234
  %330 = xor i32 %329, %236
  %331 = xor i32 %330, %238
  %332 = xor i32 %331, %240
  %333 = getelementptr inbounds bfloat, ptr addrspace(3) %229, i32 %332
  %334 = ptrtoint ptr addrspace(3) %333 to i32
  %335 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %334)
  %336 = extractvalue { i32, i32, i32, i32 } %335, 0
  %337 = extractvalue { i32, i32, i32, i32 } %335, 1
  %338 = extractvalue { i32, i32, i32, i32 } %335, 2
  %339 = extractvalue { i32, i32, i32, i32 } %335, 3
  %340 = xor i32 4096, %230
  %341 = xor i32 %340, %232
  %342 = xor i32 %341, %234
  %343 = xor i32 %342, %236
  %344 = xor i32 %343, %238
  %345 = xor i32 %344, %240
  %346 = getelementptr inbounds bfloat, ptr addrspace(3) %229, i32 %345
  %347 = ptrtoint ptr addrspace(3) %346 to i32
  %348 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %347)
  %349 = extractvalue { i32, i32, i32, i32 } %348, 0
  %350 = extractvalue { i32, i32, i32, i32 } %348, 1
  %351 = extractvalue { i32, i32, i32, i32 } %348, 2
  %352 = extractvalue { i32, i32, i32, i32 } %348, 3
  %353 = xor i32 4128, %230
  %354 = xor i32 %353, %232
  %355 = xor i32 %354, %234
  %356 = xor i32 %355, %236
  %357 = xor i32 %356, %238
  %358 = xor i32 %357, %240
  %359 = getelementptr inbounds bfloat, ptr addrspace(3) %229, i32 %358
  %360 = ptrtoint ptr addrspace(3) %359 to i32
  %361 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %360)
  %362 = extractvalue { i32, i32, i32, i32 } %361, 0
  %363 = extractvalue { i32, i32, i32, i32 } %361, 1
  %364 = extractvalue { i32, i32, i32, i32 } %361, 2
  %365 = extractvalue { i32, i32, i32, i32 } %361, 3
  %366 = xor i32 4160, %230
  %367 = xor i32 %366, %232
  %368 = xor i32 %367, %234
  %369 = xor i32 %368, %236
  %370 = xor i32 %369, %238
  %371 = xor i32 %370, %240
  %372 = getelementptr inbounds bfloat, ptr addrspace(3) %229, i32 %371
  %373 = ptrtoint ptr addrspace(3) %372 to i32
  %374 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %373)
  %375 = extractvalue { i32, i32, i32, i32 } %374, 0
  %376 = extractvalue { i32, i32, i32, i32 } %374, 1
  %377 = extractvalue { i32, i32, i32, i32 } %374, 2
  %378 = extractvalue { i32, i32, i32, i32 } %374, 3
  %379 = xor i32 4192, %230
  %380 = xor i32 %379, %232
  %381 = xor i32 %380, %234
  %382 = xor i32 %381, %236
  %383 = xor i32 %382, %238
  %384 = xor i32 %383, %240
  %385 = getelementptr inbounds bfloat, ptr addrspace(3) %229, i32 %384
  %386 = ptrtoint ptr addrspace(3) %385 to i32
  %387 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %386)
  %388 = extractvalue { i32, i32, i32, i32 } %387, 0
  %389 = extractvalue { i32, i32, i32, i32 } %387, 1
  %390 = extractvalue { i32, i32, i32, i32 } %387, 2
  %391 = extractvalue { i32, i32, i32, i32 } %387, 3
  %392 = xor i32 6144, %230
  %393 = xor i32 %392, %232
  %394 = xor i32 %393, %234
  %395 = xor i32 %394, %236
  %396 = xor i32 %395, %238
  %397 = xor i32 %396, %240
  %398 = getelementptr inbounds bfloat, ptr addrspace(3) %229, i32 %397
  %399 = ptrtoint ptr addrspace(3) %398 to i32
  %400 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %399)
  %401 = extractvalue { i32, i32, i32, i32 } %400, 0
  %402 = extractvalue { i32, i32, i32, i32 } %400, 1
  %403 = extractvalue { i32, i32, i32, i32 } %400, 2
  %404 = extractvalue { i32, i32, i32, i32 } %400, 3
  %405 = xor i32 6176, %230
  %406 = xor i32 %405, %232
  %407 = xor i32 %406, %234
  %408 = xor i32 %407, %236
  %409 = xor i32 %408, %238
  %410 = xor i32 %409, %240
  %411 = getelementptr inbounds bfloat, ptr addrspace(3) %229, i32 %410
  %412 = ptrtoint ptr addrspace(3) %411 to i32
  %413 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %412)
  %414 = extractvalue { i32, i32, i32, i32 } %413, 0
  %415 = extractvalue { i32, i32, i32, i32 } %413, 1
  %416 = extractvalue { i32, i32, i32, i32 } %413, 2
  %417 = extractvalue { i32, i32, i32, i32 } %413, 3
  %418 = xor i32 6208, %230
  %419 = xor i32 %418, %232
  %420 = xor i32 %419, %234
  %421 = xor i32 %420, %236
  %422 = xor i32 %421, %238
  %423 = xor i32 %422, %240
  %424 = getelementptr inbounds bfloat, ptr addrspace(3) %229, i32 %423
  %425 = ptrtoint ptr addrspace(3) %424 to i32
  %426 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %425)
  %427 = extractvalue { i32, i32, i32, i32 } %426, 0
  %428 = extractvalue { i32, i32, i32, i32 } %426, 1
  %429 = extractvalue { i32, i32, i32, i32 } %426, 2
  %430 = extractvalue { i32, i32, i32, i32 } %426, 3
  %431 = xor i32 6240, %230
  %432 = xor i32 %431, %232
  %433 = xor i32 %432, %234
  %434 = xor i32 %433, %236
  %435 = xor i32 %434, %238
  %436 = xor i32 %435, %240
  %437 = getelementptr inbounds bfloat, ptr addrspace(3) %229, i32 %436
  %438 = ptrtoint ptr addrspace(3) %437 to i32
  %439 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %438)
  %440 = extractvalue { i32, i32, i32, i32 } %439, 0
  %441 = extractvalue { i32, i32, i32, i32 } %439, 1
  %442 = extractvalue { i32, i32, i32, i32 } %439, 2
  %443 = extractvalue { i32, i32, i32, i32 } %439, 3
  %444 = bitcast i32 %245 to <2 x bfloat>
  %445 = extractelement <2 x bfloat> %444, i32 0
  %446 = extractelement <2 x bfloat> %444, i32 1
  %447 = bitcast i32 %246 to <2 x bfloat>
  %448 = extractelement <2 x bfloat> %447, i32 0
  %449 = extractelement <2 x bfloat> %447, i32 1
  %450 = bitcast i32 %247 to <2 x bfloat>
  %451 = extractelement <2 x bfloat> %450, i32 0
  %452 = extractelement <2 x bfloat> %450, i32 1
  %453 = bitcast i32 %248 to <2 x bfloat>
  %454 = extractelement <2 x bfloat> %453, i32 0
  %455 = extractelement <2 x bfloat> %453, i32 1
  %456 = bitcast i32 %258 to <2 x bfloat>
  %457 = extractelement <2 x bfloat> %456, i32 0
  %458 = extractelement <2 x bfloat> %456, i32 1
  %459 = bitcast i32 %259 to <2 x bfloat>
  %460 = extractelement <2 x bfloat> %459, i32 0
  %461 = extractelement <2 x bfloat> %459, i32 1
  %462 = bitcast i32 %260 to <2 x bfloat>
  %463 = extractelement <2 x bfloat> %462, i32 0
  %464 = extractelement <2 x bfloat> %462, i32 1
  %465 = bitcast i32 %261 to <2 x bfloat>
  %466 = extractelement <2 x bfloat> %465, i32 0
  %467 = extractelement <2 x bfloat> %465, i32 1
  %468 = bitcast i32 %271 to <2 x bfloat>
  %469 = extractelement <2 x bfloat> %468, i32 0
  %470 = extractelement <2 x bfloat> %468, i32 1
  %471 = bitcast i32 %272 to <2 x bfloat>
  %472 = extractelement <2 x bfloat> %471, i32 0
  %473 = extractelement <2 x bfloat> %471, i32 1
  %474 = bitcast i32 %273 to <2 x bfloat>
  %475 = extractelement <2 x bfloat> %474, i32 0
  %476 = extractelement <2 x bfloat> %474, i32 1
  %477 = bitcast i32 %274 to <2 x bfloat>
  %478 = extractelement <2 x bfloat> %477, i32 0
  %479 = extractelement <2 x bfloat> %477, i32 1
  %480 = bitcast i32 %284 to <2 x bfloat>
  %481 = extractelement <2 x bfloat> %480, i32 0
  %482 = extractelement <2 x bfloat> %480, i32 1
  %483 = bitcast i32 %285 to <2 x bfloat>
  %484 = extractelement <2 x bfloat> %483, i32 0
  %485 = extractelement <2 x bfloat> %483, i32 1
  %486 = bitcast i32 %286 to <2 x bfloat>
  %487 = extractelement <2 x bfloat> %486, i32 0
  %488 = extractelement <2 x bfloat> %486, i32 1
  %489 = bitcast i32 %287 to <2 x bfloat>
  %490 = extractelement <2 x bfloat> %489, i32 0
  %491 = extractelement <2 x bfloat> %489, i32 1
  %492 = bitcast i32 %297 to <2 x bfloat>
  %493 = extractelement <2 x bfloat> %492, i32 0
  %494 = extractelement <2 x bfloat> %492, i32 1
  %495 = bitcast i32 %298 to <2 x bfloat>
  %496 = extractelement <2 x bfloat> %495, i32 0
  %497 = extractelement <2 x bfloat> %495, i32 1
  %498 = bitcast i32 %299 to <2 x bfloat>
  %499 = extractelement <2 x bfloat> %498, i32 0
  %500 = extractelement <2 x bfloat> %498, i32 1
  %501 = bitcast i32 %300 to <2 x bfloat>
  %502 = extractelement <2 x bfloat> %501, i32 0
  %503 = extractelement <2 x bfloat> %501, i32 1
  %504 = bitcast i32 %310 to <2 x bfloat>
  %505 = extractelement <2 x bfloat> %504, i32 0
  %506 = extractelement <2 x bfloat> %504, i32 1
  %507 = bitcast i32 %311 to <2 x bfloat>
  %508 = extractelement <2 x bfloat> %507, i32 0
  %509 = extractelement <2 x bfloat> %507, i32 1
  %510 = bitcast i32 %312 to <2 x bfloat>
  %511 = extractelement <2 x bfloat> %510, i32 0
  %512 = extractelement <2 x bfloat> %510, i32 1
  %513 = bitcast i32 %313 to <2 x bfloat>
  %514 = extractelement <2 x bfloat> %513, i32 0
  %515 = extractelement <2 x bfloat> %513, i32 1
  %516 = bitcast i32 %323 to <2 x bfloat>
  %517 = extractelement <2 x bfloat> %516, i32 0
  %518 = extractelement <2 x bfloat> %516, i32 1
  %519 = bitcast i32 %324 to <2 x bfloat>
  %520 = extractelement <2 x bfloat> %519, i32 0
  %521 = extractelement <2 x bfloat> %519, i32 1
  %522 = bitcast i32 %325 to <2 x bfloat>
  %523 = extractelement <2 x bfloat> %522, i32 0
  %524 = extractelement <2 x bfloat> %522, i32 1
  %525 = bitcast i32 %326 to <2 x bfloat>
  %526 = extractelement <2 x bfloat> %525, i32 0
  %527 = extractelement <2 x bfloat> %525, i32 1
  %528 = bitcast i32 %336 to <2 x bfloat>
  %529 = extractelement <2 x bfloat> %528, i32 0
  %530 = extractelement <2 x bfloat> %528, i32 1
  %531 = bitcast i32 %337 to <2 x bfloat>
  %532 = extractelement <2 x bfloat> %531, i32 0
  %533 = extractelement <2 x bfloat> %531, i32 1
  %534 = bitcast i32 %338 to <2 x bfloat>
  %535 = extractelement <2 x bfloat> %534, i32 0
  %536 = extractelement <2 x bfloat> %534, i32 1
  %537 = bitcast i32 %339 to <2 x bfloat>
  %538 = extractelement <2 x bfloat> %537, i32 0
  %539 = extractelement <2 x bfloat> %537, i32 1
  %540 = bitcast i32 %349 to <2 x bfloat>
  %541 = extractelement <2 x bfloat> %540, i32 0
  %542 = extractelement <2 x bfloat> %540, i32 1
  %543 = bitcast i32 %350 to <2 x bfloat>
  %544 = extractelement <2 x bfloat> %543, i32 0
  %545 = extractelement <2 x bfloat> %543, i32 1
  %546 = bitcast i32 %351 to <2 x bfloat>
  %547 = extractelement <2 x bfloat> %546, i32 0
  %548 = extractelement <2 x bfloat> %546, i32 1
  %549 = bitcast i32 %352 to <2 x bfloat>
  %550 = extractelement <2 x bfloat> %549, i32 0
  %551 = extractelement <2 x bfloat> %549, i32 1
  %552 = bitcast i32 %362 to <2 x bfloat>
  %553 = extractelement <2 x bfloat> %552, i32 0
  %554 = extractelement <2 x bfloat> %552, i32 1
  %555 = bitcast i32 %363 to <2 x bfloat>
  %556 = extractelement <2 x bfloat> %555, i32 0
  %557 = extractelement <2 x bfloat> %555, i32 1
  %558 = bitcast i32 %364 to <2 x bfloat>
  %559 = extractelement <2 x bfloat> %558, i32 0
  %560 = extractelement <2 x bfloat> %558, i32 1
  %561 = bitcast i32 %365 to <2 x bfloat>
  %562 = extractelement <2 x bfloat> %561, i32 0
  %563 = extractelement <2 x bfloat> %561, i32 1
  %564 = bitcast i32 %375 to <2 x bfloat>
  %565 = extractelement <2 x bfloat> %564, i32 0
  %566 = extractelement <2 x bfloat> %564, i32 1
  %567 = bitcast i32 %376 to <2 x bfloat>
  %568 = extractelement <2 x bfloat> %567, i32 0
  %569 = extractelement <2 x bfloat> %567, i32 1
  %570 = bitcast i32 %377 to <2 x bfloat>
  %571 = extractelement <2 x bfloat> %570, i32 0
  %572 = extractelement <2 x bfloat> %570, i32 1
  %573 = bitcast i32 %378 to <2 x bfloat>
  %574 = extractelement <2 x bfloat> %573, i32 0
  %575 = extractelement <2 x bfloat> %573, i32 1
  %576 = bitcast i32 %388 to <2 x bfloat>
  %577 = extractelement <2 x bfloat> %576, i32 0
  %578 = extractelement <2 x bfloat> %576, i32 1
  %579 = bitcast i32 %389 to <2 x bfloat>
  %580 = extractelement <2 x bfloat> %579, i32 0
  %581 = extractelement <2 x bfloat> %579, i32 1
  %582 = bitcast i32 %390 to <2 x bfloat>
  %583 = extractelement <2 x bfloat> %582, i32 0
  %584 = extractelement <2 x bfloat> %582, i32 1
  %585 = bitcast i32 %391 to <2 x bfloat>
  %586 = extractelement <2 x bfloat> %585, i32 0
  %587 = extractelement <2 x bfloat> %585, i32 1
  %588 = bitcast i32 %401 to <2 x bfloat>
  %589 = extractelement <2 x bfloat> %588, i32 0
  %590 = extractelement <2 x bfloat> %588, i32 1
  %591 = bitcast i32 %402 to <2 x bfloat>
  %592 = extractelement <2 x bfloat> %591, i32 0
  %593 = extractelement <2 x bfloat> %591, i32 1
  %594 = bitcast i32 %403 to <2 x bfloat>
  %595 = extractelement <2 x bfloat> %594, i32 0
  %596 = extractelement <2 x bfloat> %594, i32 1
  %597 = bitcast i32 %404 to <2 x bfloat>
  %598 = extractelement <2 x bfloat> %597, i32 0
  %599 = extractelement <2 x bfloat> %597, i32 1
  %600 = bitcast i32 %414 to <2 x bfloat>
  %601 = extractelement <2 x bfloat> %600, i32 0
  %602 = extractelement <2 x bfloat> %600, i32 1
  %603 = bitcast i32 %415 to <2 x bfloat>
  %604 = extractelement <2 x bfloat> %603, i32 0
  %605 = extractelement <2 x bfloat> %603, i32 1
  %606 = bitcast i32 %416 to <2 x bfloat>
  %607 = extractelement <2 x bfloat> %606, i32 0
  %608 = extractelement <2 x bfloat> %606, i32 1
  %609 = bitcast i32 %417 to <2 x bfloat>
  %610 = extractelement <2 x bfloat> %609, i32 0
  %611 = extractelement <2 x bfloat> %609, i32 1
  %612 = bitcast i32 %427 to <2 x bfloat>
  %613 = extractelement <2 x bfloat> %612, i32 0
  %614 = extractelement <2 x bfloat> %612, i32 1
  %615 = bitcast i32 %428 to <2 x bfloat>
  %616 = extractelement <2 x bfloat> %615, i32 0
  %617 = extractelement <2 x bfloat> %615, i32 1
  %618 = bitcast i32 %429 to <2 x bfloat>
  %619 = extractelement <2 x bfloat> %618, i32 0
  %620 = extractelement <2 x bfloat> %618, i32 1
  %621 = bitcast i32 %430 to <2 x bfloat>
  %622 = extractelement <2 x bfloat> %621, i32 0
  %623 = extractelement <2 x bfloat> %621, i32 1
  %624 = bitcast i32 %440 to <2 x bfloat>
  %625 = extractelement <2 x bfloat> %624, i32 0
  %626 = extractelement <2 x bfloat> %624, i32 1
  %627 = bitcast i32 %441 to <2 x bfloat>
  %628 = extractelement <2 x bfloat> %627, i32 0
  %629 = extractelement <2 x bfloat> %627, i32 1
  %630 = bitcast i32 %442 to <2 x bfloat>
  %631 = extractelement <2 x bfloat> %630, i32 0
  %632 = extractelement <2 x bfloat> %630, i32 1
  %633 = bitcast i32 %443 to <2 x bfloat>
  %634 = extractelement <2 x bfloat> %633, i32 0
  %635 = extractelement <2 x bfloat> %633, i32 1
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
  %717 = insertelement <2 x bfloat> undef, bfloat %526, i32 0
  %718 = insertelement <2 x bfloat> %717, bfloat %527, i32 1
  %719 = bitcast <2 x bfloat> %718 to i32
  %720 = insertelement <2 x bfloat> undef, bfloat %529, i32 0
  %721 = insertelement <2 x bfloat> %720, bfloat %530, i32 1
  %722 = bitcast <2 x bfloat> %721 to i32
  %723 = insertelement <2 x bfloat> undef, bfloat %532, i32 0
  %724 = insertelement <2 x bfloat> %723, bfloat %533, i32 1
  %725 = bitcast <2 x bfloat> %724 to i32
  %726 = insertelement <2 x bfloat> undef, bfloat %535, i32 0
  %727 = insertelement <2 x bfloat> %726, bfloat %536, i32 1
  %728 = bitcast <2 x bfloat> %727 to i32
  %729 = insertelement <2 x bfloat> undef, bfloat %538, i32 0
  %730 = insertelement <2 x bfloat> %729, bfloat %539, i32 1
  %731 = bitcast <2 x bfloat> %730 to i32
  %732 = insertelement <2 x bfloat> undef, bfloat %541, i32 0
  %733 = insertelement <2 x bfloat> %732, bfloat %542, i32 1
  %734 = bitcast <2 x bfloat> %733 to i32
  %735 = insertelement <2 x bfloat> undef, bfloat %544, i32 0
  %736 = insertelement <2 x bfloat> %735, bfloat %545, i32 1
  %737 = bitcast <2 x bfloat> %736 to i32
  %738 = insertelement <2 x bfloat> undef, bfloat %547, i32 0
  %739 = insertelement <2 x bfloat> %738, bfloat %548, i32 1
  %740 = bitcast <2 x bfloat> %739 to i32
  %741 = insertelement <2 x bfloat> undef, bfloat %550, i32 0
  %742 = insertelement <2 x bfloat> %741, bfloat %551, i32 1
  %743 = bitcast <2 x bfloat> %742 to i32
  %744 = insertelement <2 x bfloat> undef, bfloat %553, i32 0
  %745 = insertelement <2 x bfloat> %744, bfloat %554, i32 1
  %746 = bitcast <2 x bfloat> %745 to i32
  %747 = insertelement <2 x bfloat> undef, bfloat %556, i32 0
  %748 = insertelement <2 x bfloat> %747, bfloat %557, i32 1
  %749 = bitcast <2 x bfloat> %748 to i32
  %750 = insertelement <2 x bfloat> undef, bfloat %559, i32 0
  %751 = insertelement <2 x bfloat> %750, bfloat %560, i32 1
  %752 = bitcast <2 x bfloat> %751 to i32
  %753 = insertelement <2 x bfloat> undef, bfloat %562, i32 0
  %754 = insertelement <2 x bfloat> %753, bfloat %563, i32 1
  %755 = bitcast <2 x bfloat> %754 to i32
  %756 = insertelement <2 x bfloat> undef, bfloat %565, i32 0
  %757 = insertelement <2 x bfloat> %756, bfloat %566, i32 1
  %758 = bitcast <2 x bfloat> %757 to i32
  %759 = insertelement <2 x bfloat> undef, bfloat %568, i32 0
  %760 = insertelement <2 x bfloat> %759, bfloat %569, i32 1
  %761 = bitcast <2 x bfloat> %760 to i32
  %762 = insertelement <2 x bfloat> undef, bfloat %571, i32 0
  %763 = insertelement <2 x bfloat> %762, bfloat %572, i32 1
  %764 = bitcast <2 x bfloat> %763 to i32
  %765 = insertelement <2 x bfloat> undef, bfloat %574, i32 0
  %766 = insertelement <2 x bfloat> %765, bfloat %575, i32 1
  %767 = bitcast <2 x bfloat> %766 to i32
  %768 = insertelement <2 x bfloat> undef, bfloat %577, i32 0
  %769 = insertelement <2 x bfloat> %768, bfloat %578, i32 1
  %770 = bitcast <2 x bfloat> %769 to i32
  %771 = insertelement <2 x bfloat> undef, bfloat %580, i32 0
  %772 = insertelement <2 x bfloat> %771, bfloat %581, i32 1
  %773 = bitcast <2 x bfloat> %772 to i32
  %774 = insertelement <2 x bfloat> undef, bfloat %583, i32 0
  %775 = insertelement <2 x bfloat> %774, bfloat %584, i32 1
  %776 = bitcast <2 x bfloat> %775 to i32
  %777 = insertelement <2 x bfloat> undef, bfloat %586, i32 0
  %778 = insertelement <2 x bfloat> %777, bfloat %587, i32 1
  %779 = bitcast <2 x bfloat> %778 to i32
  %780 = insertelement <2 x bfloat> undef, bfloat %589, i32 0
  %781 = insertelement <2 x bfloat> %780, bfloat %590, i32 1
  %782 = bitcast <2 x bfloat> %781 to i32
  %783 = insertelement <2 x bfloat> undef, bfloat %592, i32 0
  %784 = insertelement <2 x bfloat> %783, bfloat %593, i32 1
  %785 = bitcast <2 x bfloat> %784 to i32
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
  %828 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 0
  %829 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 1
  %830 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 2
  %831 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 3
  %832 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 4
  %833 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 5
  %834 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 6
  %835 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 7
  %836 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 8
  %837 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 9
  %838 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 10
  %839 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 11
  %840 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 12
  %841 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 13
  %842 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 14
  %843 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 15
  %844 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 16
  %845 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 17
  %846 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 18
  %847 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 19
  %848 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 20
  %849 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 21
  %850 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 22
  %851 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 23
  %852 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 24
  %853 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 25
  %854 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 26
  %855 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 27
  %856 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 28
  %857 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 29
  %858 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 30
  %859 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 31
  %860 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 32
  %861 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 33
  %862 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 34
  %863 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 35
  %864 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 36
  %865 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 37
  %866 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 38
  %867 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 39
  %868 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 40
  %869 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 41
  %870 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 42
  %871 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 43
  %872 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 44
  %873 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 45
  %874 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 46
  %875 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 47
  %876 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 48
  %877 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 49
  %878 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 50
  %879 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 51
  %880 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 52
  %881 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 53
  %882 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 54
  %883 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 55
  %884 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 56
  %885 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 57
  %886 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 58
  %887 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 59
  %888 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 60
  %889 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 61
  %890 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 62
  %891 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 63
  %892 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %828, float %829, float %830, float %831, i32 0, i32 0, i32 0, i32 0, i32 %638, i32 %641)
  %893 = extractvalue { float, float, float, float } %892, 0
  %894 = extractvalue { float, float, float, float } %892, 1
  %895 = extractvalue { float, float, float, float } %892, 2
  %896 = extractvalue { float, float, float, float } %892, 3
  %897 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %832, float %833, float %834, float %835, i32 0, i32 0, i32 0, i32 0, i32 %686, i32 %689)
  %898 = extractvalue { float, float, float, float } %897, 0
  %899 = extractvalue { float, float, float, float } %897, 1
  %900 = extractvalue { float, float, float, float } %897, 2
  %901 = extractvalue { float, float, float, float } %897, 3
  %902 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %836, float %837, float %838, float %839, i32 0, i32 0, i32 0, i32 0, i32 %734, i32 %737)
  %903 = extractvalue { float, float, float, float } %902, 0
  %904 = extractvalue { float, float, float, float } %902, 1
  %905 = extractvalue { float, float, float, float } %902, 2
  %906 = extractvalue { float, float, float, float } %902, 3
  %907 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %840, float %841, float %842, float %843, i32 0, i32 0, i32 0, i32 0, i32 %782, i32 %785)
  %908 = extractvalue { float, float, float, float } %907, 0
  %909 = extractvalue { float, float, float, float } %907, 1
  %910 = extractvalue { float, float, float, float } %907, 2
  %911 = extractvalue { float, float, float, float } %907, 3
  %912 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %844, float %845, float %846, float %847, i32 0, i32 0, i32 0, i32 0, i32 %638, i32 %641)
  %913 = extractvalue { float, float, float, float } %912, 0
  %914 = extractvalue { float, float, float, float } %912, 1
  %915 = extractvalue { float, float, float, float } %912, 2
  %916 = extractvalue { float, float, float, float } %912, 3
  %917 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %848, float %849, float %850, float %851, i32 0, i32 0, i32 0, i32 0, i32 %686, i32 %689)
  %918 = extractvalue { float, float, float, float } %917, 0
  %919 = extractvalue { float, float, float, float } %917, 1
  %920 = extractvalue { float, float, float, float } %917, 2
  %921 = extractvalue { float, float, float, float } %917, 3
  %922 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %852, float %853, float %854, float %855, i32 0, i32 0, i32 0, i32 0, i32 %734, i32 %737)
  %923 = extractvalue { float, float, float, float } %922, 0
  %924 = extractvalue { float, float, float, float } %922, 1
  %925 = extractvalue { float, float, float, float } %922, 2
  %926 = extractvalue { float, float, float, float } %922, 3
  %927 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %856, float %857, float %858, float %859, i32 0, i32 0, i32 0, i32 0, i32 %782, i32 %785)
  %928 = extractvalue { float, float, float, float } %927, 0
  %929 = extractvalue { float, float, float, float } %927, 1
  %930 = extractvalue { float, float, float, float } %927, 2
  %931 = extractvalue { float, float, float, float } %927, 3
  %932 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %860, float %861, float %862, float %863, i32 0, i32 0, i32 0, i32 0, i32 %638, i32 %641)
  %933 = extractvalue { float, float, float, float } %932, 0
  %934 = extractvalue { float, float, float, float } %932, 1
  %935 = extractvalue { float, float, float, float } %932, 2
  %936 = extractvalue { float, float, float, float } %932, 3
  %937 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %864, float %865, float %866, float %867, i32 0, i32 0, i32 0, i32 0, i32 %686, i32 %689)
  %938 = extractvalue { float, float, float, float } %937, 0
  %939 = extractvalue { float, float, float, float } %937, 1
  %940 = extractvalue { float, float, float, float } %937, 2
  %941 = extractvalue { float, float, float, float } %937, 3
  %942 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %868, float %869, float %870, float %871, i32 0, i32 0, i32 0, i32 0, i32 %734, i32 %737)
  %943 = extractvalue { float, float, float, float } %942, 0
  %944 = extractvalue { float, float, float, float } %942, 1
  %945 = extractvalue { float, float, float, float } %942, 2
  %946 = extractvalue { float, float, float, float } %942, 3
  %947 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %872, float %873, float %874, float %875, i32 0, i32 0, i32 0, i32 0, i32 %782, i32 %785)
  %948 = extractvalue { float, float, float, float } %947, 0
  %949 = extractvalue { float, float, float, float } %947, 1
  %950 = extractvalue { float, float, float, float } %947, 2
  %951 = extractvalue { float, float, float, float } %947, 3
  %952 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %876, float %877, float %878, float %879, i32 0, i32 0, i32 0, i32 0, i32 %638, i32 %641)
  %953 = extractvalue { float, float, float, float } %952, 0
  %954 = extractvalue { float, float, float, float } %952, 1
  %955 = extractvalue { float, float, float, float } %952, 2
  %956 = extractvalue { float, float, float, float } %952, 3
  %957 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %880, float %881, float %882, float %883, i32 0, i32 0, i32 0, i32 0, i32 %686, i32 %689)
  %958 = extractvalue { float, float, float, float } %957, 0
  %959 = extractvalue { float, float, float, float } %957, 1
  %960 = extractvalue { float, float, float, float } %957, 2
  %961 = extractvalue { float, float, float, float } %957, 3
  %962 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %884, float %885, float %886, float %887, i32 0, i32 0, i32 0, i32 0, i32 %734, i32 %737)
  %963 = extractvalue { float, float, float, float } %962, 0
  %964 = extractvalue { float, float, float, float } %962, 1
  %965 = extractvalue { float, float, float, float } %962, 2
  %966 = extractvalue { float, float, float, float } %962, 3
  %967 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %888, float %889, float %890, float %891, i32 0, i32 0, i32 0, i32 0, i32 %782, i32 %785)
  %968 = extractvalue { float, float, float, float } %967, 0
  %969 = extractvalue { float, float, float, float } %967, 1
  %970 = extractvalue { float, float, float, float } %967, 2
  %971 = extractvalue { float, float, float, float } %967, 3
  %972 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %893, float %894, float %895, float %896, i32 0, i32 0, i32 0, i32 0, i32 %644, i32 %647)
  %973 = extractvalue { float, float, float, float } %972, 0
  %974 = extractvalue { float, float, float, float } %972, 1
  %975 = extractvalue { float, float, float, float } %972, 2
  %976 = extractvalue { float, float, float, float } %972, 3
  %977 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %898, float %899, float %900, float %901, i32 0, i32 0, i32 0, i32 0, i32 %692, i32 %695)
  %978 = extractvalue { float, float, float, float } %977, 0
  %979 = extractvalue { float, float, float, float } %977, 1
  %980 = extractvalue { float, float, float, float } %977, 2
  %981 = extractvalue { float, float, float, float } %977, 3
  %982 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %903, float %904, float %905, float %906, i32 0, i32 0, i32 0, i32 0, i32 %740, i32 %743)
  %983 = extractvalue { float, float, float, float } %982, 0
  %984 = extractvalue { float, float, float, float } %982, 1
  %985 = extractvalue { float, float, float, float } %982, 2
  %986 = extractvalue { float, float, float, float } %982, 3
  %987 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %908, float %909, float %910, float %911, i32 0, i32 0, i32 0, i32 0, i32 %788, i32 %791)
  %988 = extractvalue { float, float, float, float } %987, 0
  %989 = extractvalue { float, float, float, float } %987, 1
  %990 = extractvalue { float, float, float, float } %987, 2
  %991 = extractvalue { float, float, float, float } %987, 3
  %992 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %913, float %914, float %915, float %916, i32 0, i32 0, i32 0, i32 0, i32 %644, i32 %647)
  %993 = extractvalue { float, float, float, float } %992, 0
  %994 = extractvalue { float, float, float, float } %992, 1
  %995 = extractvalue { float, float, float, float } %992, 2
  %996 = extractvalue { float, float, float, float } %992, 3
  %997 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %918, float %919, float %920, float %921, i32 0, i32 0, i32 0, i32 0, i32 %692, i32 %695)
  %998 = extractvalue { float, float, float, float } %997, 0
  %999 = extractvalue { float, float, float, float } %997, 1
  %1000 = extractvalue { float, float, float, float } %997, 2
  %1001 = extractvalue { float, float, float, float } %997, 3
  %1002 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %923, float %924, float %925, float %926, i32 0, i32 0, i32 0, i32 0, i32 %740, i32 %743)
  %1003 = extractvalue { float, float, float, float } %1002, 0
  %1004 = extractvalue { float, float, float, float } %1002, 1
  %1005 = extractvalue { float, float, float, float } %1002, 2
  %1006 = extractvalue { float, float, float, float } %1002, 3
  %1007 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %928, float %929, float %930, float %931, i32 0, i32 0, i32 0, i32 0, i32 %788, i32 %791)
  %1008 = extractvalue { float, float, float, float } %1007, 0
  %1009 = extractvalue { float, float, float, float } %1007, 1
  %1010 = extractvalue { float, float, float, float } %1007, 2
  %1011 = extractvalue { float, float, float, float } %1007, 3
  %1012 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %933, float %934, float %935, float %936, i32 0, i32 0, i32 0, i32 0, i32 %644, i32 %647)
  %1013 = extractvalue { float, float, float, float } %1012, 0
  %1014 = extractvalue { float, float, float, float } %1012, 1
  %1015 = extractvalue { float, float, float, float } %1012, 2
  %1016 = extractvalue { float, float, float, float } %1012, 3
  %1017 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %938, float %939, float %940, float %941, i32 0, i32 0, i32 0, i32 0, i32 %692, i32 %695)
  %1018 = extractvalue { float, float, float, float } %1017, 0
  %1019 = extractvalue { float, float, float, float } %1017, 1
  %1020 = extractvalue { float, float, float, float } %1017, 2
  %1021 = extractvalue { float, float, float, float } %1017, 3
  %1022 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %943, float %944, float %945, float %946, i32 0, i32 0, i32 0, i32 0, i32 %740, i32 %743)
  %1023 = extractvalue { float, float, float, float } %1022, 0
  %1024 = extractvalue { float, float, float, float } %1022, 1
  %1025 = extractvalue { float, float, float, float } %1022, 2
  %1026 = extractvalue { float, float, float, float } %1022, 3
  %1027 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %948, float %949, float %950, float %951, i32 0, i32 0, i32 0, i32 0, i32 %788, i32 %791)
  %1028 = extractvalue { float, float, float, float } %1027, 0
  %1029 = extractvalue { float, float, float, float } %1027, 1
  %1030 = extractvalue { float, float, float, float } %1027, 2
  %1031 = extractvalue { float, float, float, float } %1027, 3
  %1032 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %953, float %954, float %955, float %956, i32 0, i32 0, i32 0, i32 0, i32 %644, i32 %647)
  %1033 = extractvalue { float, float, float, float } %1032, 0
  %1034 = extractvalue { float, float, float, float } %1032, 1
  %1035 = extractvalue { float, float, float, float } %1032, 2
  %1036 = extractvalue { float, float, float, float } %1032, 3
  %1037 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %958, float %959, float %960, float %961, i32 0, i32 0, i32 0, i32 0, i32 %692, i32 %695)
  %1038 = extractvalue { float, float, float, float } %1037, 0
  %1039 = extractvalue { float, float, float, float } %1037, 1
  %1040 = extractvalue { float, float, float, float } %1037, 2
  %1041 = extractvalue { float, float, float, float } %1037, 3
  %1042 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %963, float %964, float %965, float %966, i32 0, i32 0, i32 0, i32 0, i32 %740, i32 %743)
  %1043 = extractvalue { float, float, float, float } %1042, 0
  %1044 = extractvalue { float, float, float, float } %1042, 1
  %1045 = extractvalue { float, float, float, float } %1042, 2
  %1046 = extractvalue { float, float, float, float } %1042, 3
  %1047 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %968, float %969, float %970, float %971, i32 0, i32 0, i32 0, i32 0, i32 %788, i32 %791)
  %1048 = extractvalue { float, float, float, float } %1047, 0
  %1049 = extractvalue { float, float, float, float } %1047, 1
  %1050 = extractvalue { float, float, float, float } %1047, 2
  %1051 = extractvalue { float, float, float, float } %1047, 3
  %1052 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %973, float %974, float %975, float %976, i32 0, i32 0, i32 0, i32 0, i32 %650, i32 %653)
  %1053 = extractvalue { float, float, float, float } %1052, 0
  %1054 = extractvalue { float, float, float, float } %1052, 1
  %1055 = extractvalue { float, float, float, float } %1052, 2
  %1056 = extractvalue { float, float, float, float } %1052, 3
  %1057 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %978, float %979, float %980, float %981, i32 0, i32 0, i32 0, i32 0, i32 %698, i32 %701)
  %1058 = extractvalue { float, float, float, float } %1057, 0
  %1059 = extractvalue { float, float, float, float } %1057, 1
  %1060 = extractvalue { float, float, float, float } %1057, 2
  %1061 = extractvalue { float, float, float, float } %1057, 3
  %1062 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %983, float %984, float %985, float %986, i32 0, i32 0, i32 0, i32 0, i32 %746, i32 %749)
  %1063 = extractvalue { float, float, float, float } %1062, 0
  %1064 = extractvalue { float, float, float, float } %1062, 1
  %1065 = extractvalue { float, float, float, float } %1062, 2
  %1066 = extractvalue { float, float, float, float } %1062, 3
  %1067 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %988, float %989, float %990, float %991, i32 0, i32 0, i32 0, i32 0, i32 %794, i32 %797)
  %1068 = extractvalue { float, float, float, float } %1067, 0
  %1069 = extractvalue { float, float, float, float } %1067, 1
  %1070 = extractvalue { float, float, float, float } %1067, 2
  %1071 = extractvalue { float, float, float, float } %1067, 3
  %1072 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %993, float %994, float %995, float %996, i32 0, i32 0, i32 0, i32 0, i32 %650, i32 %653)
  %1073 = extractvalue { float, float, float, float } %1072, 0
  %1074 = extractvalue { float, float, float, float } %1072, 1
  %1075 = extractvalue { float, float, float, float } %1072, 2
  %1076 = extractvalue { float, float, float, float } %1072, 3
  %1077 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %998, float %999, float %1000, float %1001, i32 0, i32 0, i32 0, i32 0, i32 %698, i32 %701)
  %1078 = extractvalue { float, float, float, float } %1077, 0
  %1079 = extractvalue { float, float, float, float } %1077, 1
  %1080 = extractvalue { float, float, float, float } %1077, 2
  %1081 = extractvalue { float, float, float, float } %1077, 3
  %1082 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1003, float %1004, float %1005, float %1006, i32 0, i32 0, i32 0, i32 0, i32 %746, i32 %749)
  %1083 = extractvalue { float, float, float, float } %1082, 0
  %1084 = extractvalue { float, float, float, float } %1082, 1
  %1085 = extractvalue { float, float, float, float } %1082, 2
  %1086 = extractvalue { float, float, float, float } %1082, 3
  %1087 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1008, float %1009, float %1010, float %1011, i32 0, i32 0, i32 0, i32 0, i32 %794, i32 %797)
  %1088 = extractvalue { float, float, float, float } %1087, 0
  %1089 = extractvalue { float, float, float, float } %1087, 1
  %1090 = extractvalue { float, float, float, float } %1087, 2
  %1091 = extractvalue { float, float, float, float } %1087, 3
  %1092 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1013, float %1014, float %1015, float %1016, i32 0, i32 0, i32 0, i32 0, i32 %650, i32 %653)
  %1093 = extractvalue { float, float, float, float } %1092, 0
  %1094 = extractvalue { float, float, float, float } %1092, 1
  %1095 = extractvalue { float, float, float, float } %1092, 2
  %1096 = extractvalue { float, float, float, float } %1092, 3
  %1097 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1018, float %1019, float %1020, float %1021, i32 0, i32 0, i32 0, i32 0, i32 %698, i32 %701)
  %1098 = extractvalue { float, float, float, float } %1097, 0
  %1099 = extractvalue { float, float, float, float } %1097, 1
  %1100 = extractvalue { float, float, float, float } %1097, 2
  %1101 = extractvalue { float, float, float, float } %1097, 3
  %1102 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1023, float %1024, float %1025, float %1026, i32 0, i32 0, i32 0, i32 0, i32 %746, i32 %749)
  %1103 = extractvalue { float, float, float, float } %1102, 0
  %1104 = extractvalue { float, float, float, float } %1102, 1
  %1105 = extractvalue { float, float, float, float } %1102, 2
  %1106 = extractvalue { float, float, float, float } %1102, 3
  %1107 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1028, float %1029, float %1030, float %1031, i32 0, i32 0, i32 0, i32 0, i32 %794, i32 %797)
  %1108 = extractvalue { float, float, float, float } %1107, 0
  %1109 = extractvalue { float, float, float, float } %1107, 1
  %1110 = extractvalue { float, float, float, float } %1107, 2
  %1111 = extractvalue { float, float, float, float } %1107, 3
  %1112 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1033, float %1034, float %1035, float %1036, i32 0, i32 0, i32 0, i32 0, i32 %650, i32 %653)
  %1113 = extractvalue { float, float, float, float } %1112, 0
  %1114 = extractvalue { float, float, float, float } %1112, 1
  %1115 = extractvalue { float, float, float, float } %1112, 2
  %1116 = extractvalue { float, float, float, float } %1112, 3
  %1117 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1038, float %1039, float %1040, float %1041, i32 0, i32 0, i32 0, i32 0, i32 %698, i32 %701)
  %1118 = extractvalue { float, float, float, float } %1117, 0
  %1119 = extractvalue { float, float, float, float } %1117, 1
  %1120 = extractvalue { float, float, float, float } %1117, 2
  %1121 = extractvalue { float, float, float, float } %1117, 3
  %1122 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1043, float %1044, float %1045, float %1046, i32 0, i32 0, i32 0, i32 0, i32 %746, i32 %749)
  %1123 = extractvalue { float, float, float, float } %1122, 0
  %1124 = extractvalue { float, float, float, float } %1122, 1
  %1125 = extractvalue { float, float, float, float } %1122, 2
  %1126 = extractvalue { float, float, float, float } %1122, 3
  %1127 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1048, float %1049, float %1050, float %1051, i32 0, i32 0, i32 0, i32 0, i32 %794, i32 %797)
  %1128 = extractvalue { float, float, float, float } %1127, 0
  %1129 = extractvalue { float, float, float, float } %1127, 1
  %1130 = extractvalue { float, float, float, float } %1127, 2
  %1131 = extractvalue { float, float, float, float } %1127, 3
  %1132 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1053, float %1054, float %1055, float %1056, i32 0, i32 0, i32 0, i32 0, i32 %656, i32 %659)
  %1133 = extractvalue { float, float, float, float } %1132, 0
  %1134 = extractvalue { float, float, float, float } %1132, 1
  %1135 = extractvalue { float, float, float, float } %1132, 2
  %1136 = extractvalue { float, float, float, float } %1132, 3
  %1137 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1058, float %1059, float %1060, float %1061, i32 0, i32 0, i32 0, i32 0, i32 %704, i32 %707)
  %1138 = extractvalue { float, float, float, float } %1137, 0
  %1139 = extractvalue { float, float, float, float } %1137, 1
  %1140 = extractvalue { float, float, float, float } %1137, 2
  %1141 = extractvalue { float, float, float, float } %1137, 3
  %1142 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1063, float %1064, float %1065, float %1066, i32 0, i32 0, i32 0, i32 0, i32 %752, i32 %755)
  %1143 = extractvalue { float, float, float, float } %1142, 0
  %1144 = extractvalue { float, float, float, float } %1142, 1
  %1145 = extractvalue { float, float, float, float } %1142, 2
  %1146 = extractvalue { float, float, float, float } %1142, 3
  %1147 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1068, float %1069, float %1070, float %1071, i32 0, i32 0, i32 0, i32 0, i32 %800, i32 %803)
  %1148 = extractvalue { float, float, float, float } %1147, 0
  %1149 = extractvalue { float, float, float, float } %1147, 1
  %1150 = extractvalue { float, float, float, float } %1147, 2
  %1151 = extractvalue { float, float, float, float } %1147, 3
  %1152 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1073, float %1074, float %1075, float %1076, i32 0, i32 0, i32 0, i32 0, i32 %656, i32 %659)
  %1153 = extractvalue { float, float, float, float } %1152, 0
  %1154 = extractvalue { float, float, float, float } %1152, 1
  %1155 = extractvalue { float, float, float, float } %1152, 2
  %1156 = extractvalue { float, float, float, float } %1152, 3
  %1157 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1078, float %1079, float %1080, float %1081, i32 0, i32 0, i32 0, i32 0, i32 %704, i32 %707)
  %1158 = extractvalue { float, float, float, float } %1157, 0
  %1159 = extractvalue { float, float, float, float } %1157, 1
  %1160 = extractvalue { float, float, float, float } %1157, 2
  %1161 = extractvalue { float, float, float, float } %1157, 3
  %1162 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1083, float %1084, float %1085, float %1086, i32 0, i32 0, i32 0, i32 0, i32 %752, i32 %755)
  %1163 = extractvalue { float, float, float, float } %1162, 0
  %1164 = extractvalue { float, float, float, float } %1162, 1
  %1165 = extractvalue { float, float, float, float } %1162, 2
  %1166 = extractvalue { float, float, float, float } %1162, 3
  %1167 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1088, float %1089, float %1090, float %1091, i32 0, i32 0, i32 0, i32 0, i32 %800, i32 %803)
  %1168 = extractvalue { float, float, float, float } %1167, 0
  %1169 = extractvalue { float, float, float, float } %1167, 1
  %1170 = extractvalue { float, float, float, float } %1167, 2
  %1171 = extractvalue { float, float, float, float } %1167, 3
  %1172 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1093, float %1094, float %1095, float %1096, i32 0, i32 0, i32 0, i32 0, i32 %656, i32 %659)
  %1173 = extractvalue { float, float, float, float } %1172, 0
  %1174 = extractvalue { float, float, float, float } %1172, 1
  %1175 = extractvalue { float, float, float, float } %1172, 2
  %1176 = extractvalue { float, float, float, float } %1172, 3
  %1177 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1098, float %1099, float %1100, float %1101, i32 0, i32 0, i32 0, i32 0, i32 %704, i32 %707)
  %1178 = extractvalue { float, float, float, float } %1177, 0
  %1179 = extractvalue { float, float, float, float } %1177, 1
  %1180 = extractvalue { float, float, float, float } %1177, 2
  %1181 = extractvalue { float, float, float, float } %1177, 3
  %1182 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1103, float %1104, float %1105, float %1106, i32 0, i32 0, i32 0, i32 0, i32 %752, i32 %755)
  %1183 = extractvalue { float, float, float, float } %1182, 0
  %1184 = extractvalue { float, float, float, float } %1182, 1
  %1185 = extractvalue { float, float, float, float } %1182, 2
  %1186 = extractvalue { float, float, float, float } %1182, 3
  %1187 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1108, float %1109, float %1110, float %1111, i32 0, i32 0, i32 0, i32 0, i32 %800, i32 %803)
  %1188 = extractvalue { float, float, float, float } %1187, 0
  %1189 = extractvalue { float, float, float, float } %1187, 1
  %1190 = extractvalue { float, float, float, float } %1187, 2
  %1191 = extractvalue { float, float, float, float } %1187, 3
  %1192 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1113, float %1114, float %1115, float %1116, i32 0, i32 0, i32 0, i32 0, i32 %656, i32 %659)
  %1193 = extractvalue { float, float, float, float } %1192, 0
  %1194 = extractvalue { float, float, float, float } %1192, 1
  %1195 = extractvalue { float, float, float, float } %1192, 2
  %1196 = extractvalue { float, float, float, float } %1192, 3
  %1197 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1118, float %1119, float %1120, float %1121, i32 0, i32 0, i32 0, i32 0, i32 %704, i32 %707)
  %1198 = extractvalue { float, float, float, float } %1197, 0
  %1199 = extractvalue { float, float, float, float } %1197, 1
  %1200 = extractvalue { float, float, float, float } %1197, 2
  %1201 = extractvalue { float, float, float, float } %1197, 3
  %1202 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1123, float %1124, float %1125, float %1126, i32 0, i32 0, i32 0, i32 0, i32 %752, i32 %755)
  %1203 = extractvalue { float, float, float, float } %1202, 0
  %1204 = extractvalue { float, float, float, float } %1202, 1
  %1205 = extractvalue { float, float, float, float } %1202, 2
  %1206 = extractvalue { float, float, float, float } %1202, 3
  %1207 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1128, float %1129, float %1130, float %1131, i32 0, i32 0, i32 0, i32 0, i32 %800, i32 %803)
  %1208 = extractvalue { float, float, float, float } %1207, 0
  %1209 = extractvalue { float, float, float, float } %1207, 1
  %1210 = extractvalue { float, float, float, float } %1207, 2
  %1211 = extractvalue { float, float, float, float } %1207, 3
  %1212 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1133, float %1134, float %1135, float %1136, i32 0, i32 0, i32 0, i32 0, i32 %662, i32 %665)
  %1213 = extractvalue { float, float, float, float } %1212, 0
  %1214 = extractvalue { float, float, float, float } %1212, 1
  %1215 = extractvalue { float, float, float, float } %1212, 2
  %1216 = extractvalue { float, float, float, float } %1212, 3
  %1217 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1138, float %1139, float %1140, float %1141, i32 0, i32 0, i32 0, i32 0, i32 %710, i32 %713)
  %1218 = extractvalue { float, float, float, float } %1217, 0
  %1219 = extractvalue { float, float, float, float } %1217, 1
  %1220 = extractvalue { float, float, float, float } %1217, 2
  %1221 = extractvalue { float, float, float, float } %1217, 3
  %1222 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1143, float %1144, float %1145, float %1146, i32 0, i32 0, i32 0, i32 0, i32 %758, i32 %761)
  %1223 = extractvalue { float, float, float, float } %1222, 0
  %1224 = extractvalue { float, float, float, float } %1222, 1
  %1225 = extractvalue { float, float, float, float } %1222, 2
  %1226 = extractvalue { float, float, float, float } %1222, 3
  %1227 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1148, float %1149, float %1150, float %1151, i32 0, i32 0, i32 0, i32 0, i32 %806, i32 %809)
  %1228 = extractvalue { float, float, float, float } %1227, 0
  %1229 = extractvalue { float, float, float, float } %1227, 1
  %1230 = extractvalue { float, float, float, float } %1227, 2
  %1231 = extractvalue { float, float, float, float } %1227, 3
  %1232 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1153, float %1154, float %1155, float %1156, i32 0, i32 0, i32 0, i32 0, i32 %662, i32 %665)
  %1233 = extractvalue { float, float, float, float } %1232, 0
  %1234 = extractvalue { float, float, float, float } %1232, 1
  %1235 = extractvalue { float, float, float, float } %1232, 2
  %1236 = extractvalue { float, float, float, float } %1232, 3
  %1237 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1158, float %1159, float %1160, float %1161, i32 0, i32 0, i32 0, i32 0, i32 %710, i32 %713)
  %1238 = extractvalue { float, float, float, float } %1237, 0
  %1239 = extractvalue { float, float, float, float } %1237, 1
  %1240 = extractvalue { float, float, float, float } %1237, 2
  %1241 = extractvalue { float, float, float, float } %1237, 3
  %1242 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1163, float %1164, float %1165, float %1166, i32 0, i32 0, i32 0, i32 0, i32 %758, i32 %761)
  %1243 = extractvalue { float, float, float, float } %1242, 0
  %1244 = extractvalue { float, float, float, float } %1242, 1
  %1245 = extractvalue { float, float, float, float } %1242, 2
  %1246 = extractvalue { float, float, float, float } %1242, 3
  %1247 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1168, float %1169, float %1170, float %1171, i32 0, i32 0, i32 0, i32 0, i32 %806, i32 %809)
  %1248 = extractvalue { float, float, float, float } %1247, 0
  %1249 = extractvalue { float, float, float, float } %1247, 1
  %1250 = extractvalue { float, float, float, float } %1247, 2
  %1251 = extractvalue { float, float, float, float } %1247, 3
  %1252 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1173, float %1174, float %1175, float %1176, i32 0, i32 0, i32 0, i32 0, i32 %662, i32 %665)
  %1253 = extractvalue { float, float, float, float } %1252, 0
  %1254 = extractvalue { float, float, float, float } %1252, 1
  %1255 = extractvalue { float, float, float, float } %1252, 2
  %1256 = extractvalue { float, float, float, float } %1252, 3
  %1257 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1178, float %1179, float %1180, float %1181, i32 0, i32 0, i32 0, i32 0, i32 %710, i32 %713)
  %1258 = extractvalue { float, float, float, float } %1257, 0
  %1259 = extractvalue { float, float, float, float } %1257, 1
  %1260 = extractvalue { float, float, float, float } %1257, 2
  %1261 = extractvalue { float, float, float, float } %1257, 3
  %1262 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1183, float %1184, float %1185, float %1186, i32 0, i32 0, i32 0, i32 0, i32 %758, i32 %761)
  %1263 = extractvalue { float, float, float, float } %1262, 0
  %1264 = extractvalue { float, float, float, float } %1262, 1
  %1265 = extractvalue { float, float, float, float } %1262, 2
  %1266 = extractvalue { float, float, float, float } %1262, 3
  %1267 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1188, float %1189, float %1190, float %1191, i32 0, i32 0, i32 0, i32 0, i32 %806, i32 %809)
  %1268 = extractvalue { float, float, float, float } %1267, 0
  %1269 = extractvalue { float, float, float, float } %1267, 1
  %1270 = extractvalue { float, float, float, float } %1267, 2
  %1271 = extractvalue { float, float, float, float } %1267, 3
  %1272 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1193, float %1194, float %1195, float %1196, i32 0, i32 0, i32 0, i32 0, i32 %662, i32 %665)
  %1273 = extractvalue { float, float, float, float } %1272, 0
  %1274 = extractvalue { float, float, float, float } %1272, 1
  %1275 = extractvalue { float, float, float, float } %1272, 2
  %1276 = extractvalue { float, float, float, float } %1272, 3
  %1277 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1198, float %1199, float %1200, float %1201, i32 0, i32 0, i32 0, i32 0, i32 %710, i32 %713)
  %1278 = extractvalue { float, float, float, float } %1277, 0
  %1279 = extractvalue { float, float, float, float } %1277, 1
  %1280 = extractvalue { float, float, float, float } %1277, 2
  %1281 = extractvalue { float, float, float, float } %1277, 3
  %1282 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1203, float %1204, float %1205, float %1206, i32 0, i32 0, i32 0, i32 0, i32 %758, i32 %761)
  %1283 = extractvalue { float, float, float, float } %1282, 0
  %1284 = extractvalue { float, float, float, float } %1282, 1
  %1285 = extractvalue { float, float, float, float } %1282, 2
  %1286 = extractvalue { float, float, float, float } %1282, 3
  %1287 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1208, float %1209, float %1210, float %1211, i32 0, i32 0, i32 0, i32 0, i32 %806, i32 %809)
  %1288 = extractvalue { float, float, float, float } %1287, 0
  %1289 = extractvalue { float, float, float, float } %1287, 1
  %1290 = extractvalue { float, float, float, float } %1287, 2
  %1291 = extractvalue { float, float, float, float } %1287, 3
  %1292 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1213, float %1214, float %1215, float %1216, i32 0, i32 0, i32 0, i32 0, i32 %668, i32 %671)
  %1293 = extractvalue { float, float, float, float } %1292, 0
  %1294 = extractvalue { float, float, float, float } %1292, 1
  %1295 = extractvalue { float, float, float, float } %1292, 2
  %1296 = extractvalue { float, float, float, float } %1292, 3
  %1297 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1218, float %1219, float %1220, float %1221, i32 0, i32 0, i32 0, i32 0, i32 %716, i32 %719)
  %1298 = extractvalue { float, float, float, float } %1297, 0
  %1299 = extractvalue { float, float, float, float } %1297, 1
  %1300 = extractvalue { float, float, float, float } %1297, 2
  %1301 = extractvalue { float, float, float, float } %1297, 3
  %1302 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1223, float %1224, float %1225, float %1226, i32 0, i32 0, i32 0, i32 0, i32 %764, i32 %767)
  %1303 = extractvalue { float, float, float, float } %1302, 0
  %1304 = extractvalue { float, float, float, float } %1302, 1
  %1305 = extractvalue { float, float, float, float } %1302, 2
  %1306 = extractvalue { float, float, float, float } %1302, 3
  %1307 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1228, float %1229, float %1230, float %1231, i32 0, i32 0, i32 0, i32 0, i32 %812, i32 %815)
  %1308 = extractvalue { float, float, float, float } %1307, 0
  %1309 = extractvalue { float, float, float, float } %1307, 1
  %1310 = extractvalue { float, float, float, float } %1307, 2
  %1311 = extractvalue { float, float, float, float } %1307, 3
  %1312 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1233, float %1234, float %1235, float %1236, i32 0, i32 0, i32 0, i32 0, i32 %668, i32 %671)
  %1313 = extractvalue { float, float, float, float } %1312, 0
  %1314 = extractvalue { float, float, float, float } %1312, 1
  %1315 = extractvalue { float, float, float, float } %1312, 2
  %1316 = extractvalue { float, float, float, float } %1312, 3
  %1317 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1238, float %1239, float %1240, float %1241, i32 0, i32 0, i32 0, i32 0, i32 %716, i32 %719)
  %1318 = extractvalue { float, float, float, float } %1317, 0
  %1319 = extractvalue { float, float, float, float } %1317, 1
  %1320 = extractvalue { float, float, float, float } %1317, 2
  %1321 = extractvalue { float, float, float, float } %1317, 3
  %1322 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1243, float %1244, float %1245, float %1246, i32 0, i32 0, i32 0, i32 0, i32 %764, i32 %767)
  %1323 = extractvalue { float, float, float, float } %1322, 0
  %1324 = extractvalue { float, float, float, float } %1322, 1
  %1325 = extractvalue { float, float, float, float } %1322, 2
  %1326 = extractvalue { float, float, float, float } %1322, 3
  %1327 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1248, float %1249, float %1250, float %1251, i32 0, i32 0, i32 0, i32 0, i32 %812, i32 %815)
  %1328 = extractvalue { float, float, float, float } %1327, 0
  %1329 = extractvalue { float, float, float, float } %1327, 1
  %1330 = extractvalue { float, float, float, float } %1327, 2
  %1331 = extractvalue { float, float, float, float } %1327, 3
  %1332 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1253, float %1254, float %1255, float %1256, i32 0, i32 0, i32 0, i32 0, i32 %668, i32 %671)
  %1333 = extractvalue { float, float, float, float } %1332, 0
  %1334 = extractvalue { float, float, float, float } %1332, 1
  %1335 = extractvalue { float, float, float, float } %1332, 2
  %1336 = extractvalue { float, float, float, float } %1332, 3
  %1337 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1258, float %1259, float %1260, float %1261, i32 0, i32 0, i32 0, i32 0, i32 %716, i32 %719)
  %1338 = extractvalue { float, float, float, float } %1337, 0
  %1339 = extractvalue { float, float, float, float } %1337, 1
  %1340 = extractvalue { float, float, float, float } %1337, 2
  %1341 = extractvalue { float, float, float, float } %1337, 3
  %1342 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1263, float %1264, float %1265, float %1266, i32 0, i32 0, i32 0, i32 0, i32 %764, i32 %767)
  %1343 = extractvalue { float, float, float, float } %1342, 0
  %1344 = extractvalue { float, float, float, float } %1342, 1
  %1345 = extractvalue { float, float, float, float } %1342, 2
  %1346 = extractvalue { float, float, float, float } %1342, 3
  %1347 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1268, float %1269, float %1270, float %1271, i32 0, i32 0, i32 0, i32 0, i32 %812, i32 %815)
  %1348 = extractvalue { float, float, float, float } %1347, 0
  %1349 = extractvalue { float, float, float, float } %1347, 1
  %1350 = extractvalue { float, float, float, float } %1347, 2
  %1351 = extractvalue { float, float, float, float } %1347, 3
  %1352 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1273, float %1274, float %1275, float %1276, i32 0, i32 0, i32 0, i32 0, i32 %668, i32 %671)
  %1353 = extractvalue { float, float, float, float } %1352, 0
  %1354 = extractvalue { float, float, float, float } %1352, 1
  %1355 = extractvalue { float, float, float, float } %1352, 2
  %1356 = extractvalue { float, float, float, float } %1352, 3
  %1357 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1278, float %1279, float %1280, float %1281, i32 0, i32 0, i32 0, i32 0, i32 %716, i32 %719)
  %1358 = extractvalue { float, float, float, float } %1357, 0
  %1359 = extractvalue { float, float, float, float } %1357, 1
  %1360 = extractvalue { float, float, float, float } %1357, 2
  %1361 = extractvalue { float, float, float, float } %1357, 3
  %1362 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1283, float %1284, float %1285, float %1286, i32 0, i32 0, i32 0, i32 0, i32 %764, i32 %767)
  %1363 = extractvalue { float, float, float, float } %1362, 0
  %1364 = extractvalue { float, float, float, float } %1362, 1
  %1365 = extractvalue { float, float, float, float } %1362, 2
  %1366 = extractvalue { float, float, float, float } %1362, 3
  %1367 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1288, float %1289, float %1290, float %1291, i32 0, i32 0, i32 0, i32 0, i32 %812, i32 %815)
  %1368 = extractvalue { float, float, float, float } %1367, 0
  %1369 = extractvalue { float, float, float, float } %1367, 1
  %1370 = extractvalue { float, float, float, float } %1367, 2
  %1371 = extractvalue { float, float, float, float } %1367, 3
  %1372 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1293, float %1294, float %1295, float %1296, i32 0, i32 0, i32 0, i32 0, i32 %674, i32 %677)
  %1373 = extractvalue { float, float, float, float } %1372, 0
  %1374 = extractvalue { float, float, float, float } %1372, 1
  %1375 = extractvalue { float, float, float, float } %1372, 2
  %1376 = extractvalue { float, float, float, float } %1372, 3
  %1377 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1298, float %1299, float %1300, float %1301, i32 0, i32 0, i32 0, i32 0, i32 %722, i32 %725)
  %1378 = extractvalue { float, float, float, float } %1377, 0
  %1379 = extractvalue { float, float, float, float } %1377, 1
  %1380 = extractvalue { float, float, float, float } %1377, 2
  %1381 = extractvalue { float, float, float, float } %1377, 3
  %1382 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1303, float %1304, float %1305, float %1306, i32 0, i32 0, i32 0, i32 0, i32 %770, i32 %773)
  %1383 = extractvalue { float, float, float, float } %1382, 0
  %1384 = extractvalue { float, float, float, float } %1382, 1
  %1385 = extractvalue { float, float, float, float } %1382, 2
  %1386 = extractvalue { float, float, float, float } %1382, 3
  %1387 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1308, float %1309, float %1310, float %1311, i32 0, i32 0, i32 0, i32 0, i32 %818, i32 %821)
  %1388 = extractvalue { float, float, float, float } %1387, 0
  %1389 = extractvalue { float, float, float, float } %1387, 1
  %1390 = extractvalue { float, float, float, float } %1387, 2
  %1391 = extractvalue { float, float, float, float } %1387, 3
  %1392 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1313, float %1314, float %1315, float %1316, i32 0, i32 0, i32 0, i32 0, i32 %674, i32 %677)
  %1393 = extractvalue { float, float, float, float } %1392, 0
  %1394 = extractvalue { float, float, float, float } %1392, 1
  %1395 = extractvalue { float, float, float, float } %1392, 2
  %1396 = extractvalue { float, float, float, float } %1392, 3
  %1397 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1318, float %1319, float %1320, float %1321, i32 0, i32 0, i32 0, i32 0, i32 %722, i32 %725)
  %1398 = extractvalue { float, float, float, float } %1397, 0
  %1399 = extractvalue { float, float, float, float } %1397, 1
  %1400 = extractvalue { float, float, float, float } %1397, 2
  %1401 = extractvalue { float, float, float, float } %1397, 3
  %1402 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1323, float %1324, float %1325, float %1326, i32 0, i32 0, i32 0, i32 0, i32 %770, i32 %773)
  %1403 = extractvalue { float, float, float, float } %1402, 0
  %1404 = extractvalue { float, float, float, float } %1402, 1
  %1405 = extractvalue { float, float, float, float } %1402, 2
  %1406 = extractvalue { float, float, float, float } %1402, 3
  %1407 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1328, float %1329, float %1330, float %1331, i32 0, i32 0, i32 0, i32 0, i32 %818, i32 %821)
  %1408 = extractvalue { float, float, float, float } %1407, 0
  %1409 = extractvalue { float, float, float, float } %1407, 1
  %1410 = extractvalue { float, float, float, float } %1407, 2
  %1411 = extractvalue { float, float, float, float } %1407, 3
  %1412 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1333, float %1334, float %1335, float %1336, i32 0, i32 0, i32 0, i32 0, i32 %674, i32 %677)
  %1413 = extractvalue { float, float, float, float } %1412, 0
  %1414 = extractvalue { float, float, float, float } %1412, 1
  %1415 = extractvalue { float, float, float, float } %1412, 2
  %1416 = extractvalue { float, float, float, float } %1412, 3
  %1417 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1338, float %1339, float %1340, float %1341, i32 0, i32 0, i32 0, i32 0, i32 %722, i32 %725)
  %1418 = extractvalue { float, float, float, float } %1417, 0
  %1419 = extractvalue { float, float, float, float } %1417, 1
  %1420 = extractvalue { float, float, float, float } %1417, 2
  %1421 = extractvalue { float, float, float, float } %1417, 3
  %1422 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1343, float %1344, float %1345, float %1346, i32 0, i32 0, i32 0, i32 0, i32 %770, i32 %773)
  %1423 = extractvalue { float, float, float, float } %1422, 0
  %1424 = extractvalue { float, float, float, float } %1422, 1
  %1425 = extractvalue { float, float, float, float } %1422, 2
  %1426 = extractvalue { float, float, float, float } %1422, 3
  %1427 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1348, float %1349, float %1350, float %1351, i32 0, i32 0, i32 0, i32 0, i32 %818, i32 %821)
  %1428 = extractvalue { float, float, float, float } %1427, 0
  %1429 = extractvalue { float, float, float, float } %1427, 1
  %1430 = extractvalue { float, float, float, float } %1427, 2
  %1431 = extractvalue { float, float, float, float } %1427, 3
  %1432 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1353, float %1354, float %1355, float %1356, i32 0, i32 0, i32 0, i32 0, i32 %674, i32 %677)
  %1433 = extractvalue { float, float, float, float } %1432, 0
  %1434 = extractvalue { float, float, float, float } %1432, 1
  %1435 = extractvalue { float, float, float, float } %1432, 2
  %1436 = extractvalue { float, float, float, float } %1432, 3
  %1437 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1358, float %1359, float %1360, float %1361, i32 0, i32 0, i32 0, i32 0, i32 %722, i32 %725)
  %1438 = extractvalue { float, float, float, float } %1437, 0
  %1439 = extractvalue { float, float, float, float } %1437, 1
  %1440 = extractvalue { float, float, float, float } %1437, 2
  %1441 = extractvalue { float, float, float, float } %1437, 3
  %1442 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1363, float %1364, float %1365, float %1366, i32 0, i32 0, i32 0, i32 0, i32 %770, i32 %773)
  %1443 = extractvalue { float, float, float, float } %1442, 0
  %1444 = extractvalue { float, float, float, float } %1442, 1
  %1445 = extractvalue { float, float, float, float } %1442, 2
  %1446 = extractvalue { float, float, float, float } %1442, 3
  %1447 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1368, float %1369, float %1370, float %1371, i32 0, i32 0, i32 0, i32 0, i32 %818, i32 %821)
  %1448 = extractvalue { float, float, float, float } %1447, 0
  %1449 = extractvalue { float, float, float, float } %1447, 1
  %1450 = extractvalue { float, float, float, float } %1447, 2
  %1451 = extractvalue { float, float, float, float } %1447, 3
  %1452 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1373, float %1374, float %1375, float %1376, i32 0, i32 0, i32 0, i32 0, i32 %680, i32 %683)
  %1453 = extractvalue { float, float, float, float } %1452, 0
  %1454 = extractvalue { float, float, float, float } %1452, 1
  %1455 = extractvalue { float, float, float, float } %1452, 2
  %1456 = extractvalue { float, float, float, float } %1452, 3
  %1457 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1378, float %1379, float %1380, float %1381, i32 0, i32 0, i32 0, i32 0, i32 %728, i32 %731)
  %1458 = extractvalue { float, float, float, float } %1457, 0
  %1459 = extractvalue { float, float, float, float } %1457, 1
  %1460 = extractvalue { float, float, float, float } %1457, 2
  %1461 = extractvalue { float, float, float, float } %1457, 3
  %1462 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1383, float %1384, float %1385, float %1386, i32 0, i32 0, i32 0, i32 0, i32 %776, i32 %779)
  %1463 = extractvalue { float, float, float, float } %1462, 0
  %1464 = extractvalue { float, float, float, float } %1462, 1
  %1465 = extractvalue { float, float, float, float } %1462, 2
  %1466 = extractvalue { float, float, float, float } %1462, 3
  %1467 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1388, float %1389, float %1390, float %1391, i32 0, i32 0, i32 0, i32 0, i32 %824, i32 %827)
  %1468 = extractvalue { float, float, float, float } %1467, 0
  %1469 = extractvalue { float, float, float, float } %1467, 1
  %1470 = extractvalue { float, float, float, float } %1467, 2
  %1471 = extractvalue { float, float, float, float } %1467, 3
  %1472 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1393, float %1394, float %1395, float %1396, i32 0, i32 0, i32 0, i32 0, i32 %680, i32 %683)
  %1473 = extractvalue { float, float, float, float } %1472, 0
  %1474 = extractvalue { float, float, float, float } %1472, 1
  %1475 = extractvalue { float, float, float, float } %1472, 2
  %1476 = extractvalue { float, float, float, float } %1472, 3
  %1477 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1398, float %1399, float %1400, float %1401, i32 0, i32 0, i32 0, i32 0, i32 %728, i32 %731)
  %1478 = extractvalue { float, float, float, float } %1477, 0
  %1479 = extractvalue { float, float, float, float } %1477, 1
  %1480 = extractvalue { float, float, float, float } %1477, 2
  %1481 = extractvalue { float, float, float, float } %1477, 3
  %1482 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1403, float %1404, float %1405, float %1406, i32 0, i32 0, i32 0, i32 0, i32 %776, i32 %779)
  %1483 = extractvalue { float, float, float, float } %1482, 0
  %1484 = extractvalue { float, float, float, float } %1482, 1
  %1485 = extractvalue { float, float, float, float } %1482, 2
  %1486 = extractvalue { float, float, float, float } %1482, 3
  %1487 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1408, float %1409, float %1410, float %1411, i32 0, i32 0, i32 0, i32 0, i32 %824, i32 %827)
  %1488 = extractvalue { float, float, float, float } %1487, 0
  %1489 = extractvalue { float, float, float, float } %1487, 1
  %1490 = extractvalue { float, float, float, float } %1487, 2
  %1491 = extractvalue { float, float, float, float } %1487, 3
  %1492 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1413, float %1414, float %1415, float %1416, i32 0, i32 0, i32 0, i32 0, i32 %680, i32 %683)
  %1493 = extractvalue { float, float, float, float } %1492, 0
  %1494 = extractvalue { float, float, float, float } %1492, 1
  %1495 = extractvalue { float, float, float, float } %1492, 2
  %1496 = extractvalue { float, float, float, float } %1492, 3
  %1497 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1418, float %1419, float %1420, float %1421, i32 0, i32 0, i32 0, i32 0, i32 %728, i32 %731)
  %1498 = extractvalue { float, float, float, float } %1497, 0
  %1499 = extractvalue { float, float, float, float } %1497, 1
  %1500 = extractvalue { float, float, float, float } %1497, 2
  %1501 = extractvalue { float, float, float, float } %1497, 3
  %1502 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1423, float %1424, float %1425, float %1426, i32 0, i32 0, i32 0, i32 0, i32 %776, i32 %779)
  %1503 = extractvalue { float, float, float, float } %1502, 0
  %1504 = extractvalue { float, float, float, float } %1502, 1
  %1505 = extractvalue { float, float, float, float } %1502, 2
  %1506 = extractvalue { float, float, float, float } %1502, 3
  %1507 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1428, float %1429, float %1430, float %1431, i32 0, i32 0, i32 0, i32 0, i32 %824, i32 %827)
  %1508 = extractvalue { float, float, float, float } %1507, 0
  %1509 = extractvalue { float, float, float, float } %1507, 1
  %1510 = extractvalue { float, float, float, float } %1507, 2
  %1511 = extractvalue { float, float, float, float } %1507, 3
  %1512 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1433, float %1434, float %1435, float %1436, i32 0, i32 0, i32 0, i32 0, i32 %680, i32 %683)
  %1513 = extractvalue { float, float, float, float } %1512, 0
  %1514 = extractvalue { float, float, float, float } %1512, 1
  %1515 = extractvalue { float, float, float, float } %1512, 2
  %1516 = extractvalue { float, float, float, float } %1512, 3
  %1517 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1438, float %1439, float %1440, float %1441, i32 0, i32 0, i32 0, i32 0, i32 %728, i32 %731)
  %1518 = extractvalue { float, float, float, float } %1517, 0
  %1519 = extractvalue { float, float, float, float } %1517, 1
  %1520 = extractvalue { float, float, float, float } %1517, 2
  %1521 = extractvalue { float, float, float, float } %1517, 3
  %1522 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1443, float %1444, float %1445, float %1446, i32 0, i32 0, i32 0, i32 0, i32 %776, i32 %779)
  %1523 = extractvalue { float, float, float, float } %1522, 0
  %1524 = extractvalue { float, float, float, float } %1522, 1
  %1525 = extractvalue { float, float, float, float } %1522, 2
  %1526 = extractvalue { float, float, float, float } %1522, 3
  %1527 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1448, float %1449, float %1450, float %1451, i32 0, i32 0, i32 0, i32 0, i32 %824, i32 %827)
  %1528 = extractvalue { float, float, float, float } %1527, 0
  %1529 = extractvalue { float, float, float, float } %1527, 1
  %1530 = extractvalue { float, float, float, float } %1527, 2
  %1531 = extractvalue { float, float, float, float } %1527, 3
  %1532 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } undef, float %1453, 0
  %1533 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1532, float %1454, 1
  %1534 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1533, float %1455, 2
  %1535 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1534, float %1456, 3
  %1536 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1535, float %1458, 4
  %1537 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1536, float %1459, 5
  %1538 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1537, float %1460, 6
  %1539 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1538, float %1461, 7
  %1540 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1539, float %1463, 8
  %1541 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1540, float %1464, 9
  %1542 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1541, float %1465, 10
  %1543 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1542, float %1466, 11
  %1544 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1543, float %1468, 12
  %1545 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1544, float %1469, 13
  %1546 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1545, float %1470, 14
  %1547 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1546, float %1471, 15
  %1548 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1547, float %1473, 16
  %1549 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1548, float %1474, 17
  %1550 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1549, float %1475, 18
  %1551 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1550, float %1476, 19
  %1552 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1551, float %1478, 20
  %1553 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1552, float %1479, 21
  %1554 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1553, float %1480, 22
  %1555 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1554, float %1481, 23
  %1556 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1555, float %1483, 24
  %1557 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1556, float %1484, 25
  %1558 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1557, float %1485, 26
  %1559 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1558, float %1486, 27
  %1560 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1559, float %1488, 28
  %1561 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1560, float %1489, 29
  %1562 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1561, float %1490, 30
  %1563 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1562, float %1491, 31
  %1564 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1563, float %1493, 32
  %1565 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1564, float %1494, 33
  %1566 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1565, float %1495, 34
  %1567 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1566, float %1496, 35
  %1568 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1567, float %1498, 36
  %1569 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1568, float %1499, 37
  %1570 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1569, float %1500, 38
  %1571 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1570, float %1501, 39
  %1572 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1571, float %1503, 40
  %1573 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1572, float %1504, 41
  %1574 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1573, float %1505, 42
  %1575 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1574, float %1506, 43
  %1576 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1575, float %1508, 44
  %1577 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1576, float %1509, 45
  %1578 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1577, float %1510, 46
  %1579 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1578, float %1511, 47
  %1580 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1579, float %1513, 48
  %1581 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1580, float %1514, 49
  %1582 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1581, float %1515, 50
  %1583 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1582, float %1516, 51
  %1584 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1583, float %1518, 52
  %1585 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1584, float %1519, 53
  %1586 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1585, float %1520, 54
  %1587 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1586, float %1521, 55
  %1588 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1587, float %1523, 56
  %1589 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1588, float %1524, 57
  %1590 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1589, float %1525, 58
  %1591 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1590, float %1526, 59
  %1592 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1591, float %1528, 60
  %1593 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1592, float %1529, 61
  %1594 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1593, float %1530, 62
  %1595 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1594, float %1531, 63
  %1596 = add i64 %221, 128
  %1597 = add i32 %223, 1
  %1598 = icmp slt i32 %1597, 3
  %1599 = select i1 %1598, i32 %1597, i32 0
  %1600 = add i64 %1596, %36
  %1601 = add i64 %1600, %82
  %1602 = add i64 %1600, %83
  %1603 = add i64 %1600, %84
  %1604 = add i64 %1600, %85
  %1605 = add i64 %1600, %86
  %1606 = add i64 %1600, %87
  %1607 = add i64 %1600, %88
  %1608 = add i64 %1600, %89
  %1609 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1601
  %1610 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1602
  %1611 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1603
  %1612 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1604
  %1613 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1605
  %1614 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1606
  %1615 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1607
  %1616 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1608
  %1617 = mul i32 %1599, 8192
  %1618 = add i32 %1617, 0
  %1619 = add i32 %1618, 0
  %1620 = add i32 %1619, 0
  %1621 = getelementptr bfloat, ptr addrspace(3) @global_smem, i32 %1620
  call void @llvm.nvvm.barrier0()
  %1622 = getelementptr inbounds bfloat, ptr addrspace(3) %1621, i32 %111
  %1623 = getelementptr inbounds bfloat, ptr addrspace(3) %1621, i32 %119
  %1624 = getelementptr inbounds bfloat, ptr addrspace(3) %1621, i32 %127
  %1625 = getelementptr inbounds bfloat, ptr addrspace(3) %1621, i32 %135
  %1626 = getelementptr inbounds bfloat, ptr addrspace(3) %1621, i32 %143
  %1627 = getelementptr inbounds bfloat, ptr addrspace(3) %1621, i32 %151
  %1628 = getelementptr inbounds bfloat, ptr addrspace(3) %1621, i32 %159
  %1629 = getelementptr inbounds bfloat, ptr addrspace(3) %1621, i32 %167
  %1630 = select i1 %228, i32 16, i32 0
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1622, ptr addrspace(1) %1609, i32 %1630)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1623, ptr addrspace(1) %1610, i32 %1630)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1624, ptr addrspace(1) %1611, i32 %1630)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1625, ptr addrspace(1) %1612, i32 %1630)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1626, ptr addrspace(1) %1613, i32 %1630)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1627, ptr addrspace(1) %1614, i32 %1630)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1628, ptr addrspace(1) %1615, i32 %1630)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1629, ptr addrspace(1) %1616, i32 %1630)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  %1631 = add i32 %224, 1
  %1632 = icmp slt i32 %1631, 3
  %1633 = select i1 %1632, i32 %1631, i32 0
  call void asm sideeffect "cp.async.wait_group 0x2;", ""()
  call void @llvm.nvvm.barrier0()
  %1634 = mul i32 %1633, 8192
  %1635 = add i32 %1634, 0
  %1636 = add i32 %1635, 0
  %1637 = add i32 %1636, 0
  %1638 = getelementptr bfloat, ptr addrspace(3) @global_smem, i32 %1637
  %1639 = insertvalue { ptr addrspace(3), i32, i32 } undef, ptr addrspace(3) %1638, 0
  %1640 = insertvalue { ptr addrspace(3), i32, i32 } %1639, i32 0, 1
  %1641 = insertvalue { ptr addrspace(3), i32, i32 } %1640, i32 0, 2
  %1642 = add i32 %220, 128
  br label %219

1643:                                             ; preds = %219
  call void asm sideeffect "cp.async.wait_group 0x0;", ""()
  call void @llvm.nvvm.barrier0()
  %1644 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 0
  %1645 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 1
  %1646 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 2
  %1647 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 3
  %1648 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 4
  %1649 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 5
  %1650 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 6
  %1651 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 7
  %1652 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 8
  %1653 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 9
  %1654 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 10
  %1655 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 11
  %1656 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 12
  %1657 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 13
  %1658 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 14
  %1659 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 15
  %1660 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 16
  %1661 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 17
  %1662 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 18
  %1663 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 19
  %1664 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 20
  %1665 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 21
  %1666 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 22
  %1667 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 23
  %1668 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 24
  %1669 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 25
  %1670 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 26
  %1671 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 27
  %1672 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 28
  %1673 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 29
  %1674 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 30
  %1675 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 31
  %1676 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 32
  %1677 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 33
  %1678 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 34
  %1679 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 35
  %1680 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 36
  %1681 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 37
  %1682 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 38
  %1683 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 39
  %1684 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 40
  %1685 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 41
  %1686 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 42
  %1687 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 43
  %1688 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 44
  %1689 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 45
  %1690 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 46
  %1691 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 47
  %1692 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 48
  %1693 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 49
  %1694 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 50
  %1695 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 51
  %1696 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 52
  %1697 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 53
  %1698 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 54
  %1699 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 55
  %1700 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 56
  %1701 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 57
  %1702 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 58
  %1703 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 59
  %1704 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 60
  %1705 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 61
  %1706 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 62
  %1707 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 63
  %1708 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1644)
  %1709 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1645)
  %1710 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1646)
  %1711 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1647)
  %1712 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1648)
  %1713 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1649)
  %1714 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1650)
  %1715 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1651)
  %1716 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1652)
  %1717 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1653)
  %1718 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1654)
  %1719 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1655)
  %1720 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1656)
  %1721 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1657)
  %1722 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1658)
  %1723 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1659)
  %1724 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1660)
  %1725 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1661)
  %1726 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1662)
  %1727 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1663)
  %1728 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1664)
  %1729 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1665)
  %1730 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1666)
  %1731 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1667)
  %1732 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1668)
  %1733 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1669)
  %1734 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1670)
  %1735 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1671)
  %1736 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1672)
  %1737 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1673)
  %1738 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1674)
  %1739 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1675)
  %1740 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1676)
  %1741 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1677)
  %1742 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1678)
  %1743 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1679)
  %1744 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1680)
  %1745 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1681)
  %1746 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1682)
  %1747 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1683)
  %1748 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1684)
  %1749 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1685)
  %1750 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1686)
  %1751 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1687)
  %1752 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1688)
  %1753 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1689)
  %1754 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1690)
  %1755 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1691)
  %1756 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1692)
  %1757 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1693)
  %1758 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1694)
  %1759 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1695)
  %1760 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1696)
  %1761 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1697)
  %1762 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1698)
  %1763 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1699)
  %1764 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1700)
  %1765 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1701)
  %1766 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1702)
  %1767 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1703)
  %1768 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1704)
  %1769 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1705)
  %1770 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1706)
  %1771 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1707)
  %1772 = mul i32 %11, 128
  %1773 = sext i32 %1772 to i64
  %1774 = select i1 %31, i32 0, i32 1
  %1775 = xor i32 0, %1774
  %1776 = select i1 %39, i32 0, i32 2
  %1777 = xor i32 %1775, %1776
  %1778 = select i1 %43, i32 0, i32 4
  %1779 = xor i32 %1777, %1778
  %1780 = select i1 %47, i32 0, i32 8
  %1781 = xor i32 %1779, %1780
  %1782 = xor i32 %1781, 0
  %1783 = xor i32 %1781, 16
  %1784 = xor i32 %1781, 32
  %1785 = xor i32 %1781, 48
  %1786 = xor i32 %1781, 64
  %1787 = xor i32 %1781, 80
  %1788 = xor i32 %1781, 96
  %1789 = xor i32 %1781, 112
  %1790 = add i32 %1782, 0
  %1791 = add i32 %1783, 0
  %1792 = add i32 %1784, 0
  %1793 = add i32 %1785, 0
  %1794 = add i32 %1786, 0
  %1795 = add i32 %1787, 0
  %1796 = add i32 %1788, 0
  %1797 = add i32 %1789, 0
  %1798 = sext i32 %1790 to i64
  %1799 = sext i32 %1791 to i64
  %1800 = sext i32 %1792 to i64
  %1801 = sext i32 %1793 to i64
  %1802 = sext i32 %1794 to i64
  %1803 = sext i32 %1795 to i64
  %1804 = sext i32 %1796 to i64
  %1805 = sext i32 %1797 to i64
  %1806 = add i64 %1773, %1798
  %1807 = add i64 %1773, %1799
  %1808 = add i64 %1773, %1800
  %1809 = add i64 %1773, %1801
  %1810 = add i64 %1773, %1802
  %1811 = add i64 %1773, %1803
  %1812 = add i64 %1773, %1804
  %1813 = add i64 %1773, %1805
  %1814 = mul i64 %1806, 12288
  %1815 = mul i64 %1807, 12288
  %1816 = mul i64 %1808, 12288
  %1817 = mul i64 %1809, 12288
  %1818 = mul i64 %1810, 12288
  %1819 = mul i64 %1811, 12288
  %1820 = mul i64 %1812, 12288
  %1821 = mul i64 %1813, 12288
  %1822 = xor i32 %29, 0
  %1823 = add i32 %1822, 0
  %1824 = sext i32 %1823 to i64
  %1825 = add i64 %15, %1824
  %1826 = add i64 %1814, %1825
  %1827 = add i64 %1815, %1825
  %1828 = add i64 %1816, %1825
  %1829 = add i64 %1817, %1825
  %1830 = add i64 %1818, %1825
  %1831 = add i64 %1819, %1825
  %1832 = add i64 %1820, %1825
  %1833 = add i64 %1821, %1825
  %1834 = getelementptr bfloat, ptr addrspace(1) %2, i64 %1826
  %1835 = getelementptr bfloat, ptr addrspace(1) %2, i64 %1827
  %1836 = getelementptr bfloat, ptr addrspace(1) %2, i64 %1828
  %1837 = getelementptr bfloat, ptr addrspace(1) %2, i64 %1829
  %1838 = getelementptr bfloat, ptr addrspace(1) %2, i64 %1830
  %1839 = getelementptr bfloat, ptr addrspace(1) %2, i64 %1831
  %1840 = getelementptr bfloat, ptr addrspace(1) %2, i64 %1832
  %1841 = getelementptr bfloat, ptr addrspace(1) %2, i64 %1833
  %1842 = select i1 %19, i32 0, i32 2
  %1843 = xor i32 0, %1842
  %1844 = select i1 %23, i32 0, i32 4
  %1845 = xor i32 %1843, %1844
  %1846 = select i1 %27, i32 0, i32 64
  %1847 = xor i32 %1845, %1846
  %1848 = select i1 %31, i32 0, i32 128
  %1849 = xor i32 %1847, %1848
  %1850 = select i1 %39, i32 0, i32 256
  %1851 = xor i32 %1849, %1850
  %1852 = select i1 %43, i32 0, i32 8
  %1853 = xor i32 %1851, %1852
  %1854 = select i1 %47, i32 0, i32 1024
  %1855 = xor i32 %1853, %1854
  %1856 = select i1 %39, i32 0, i32 128
  %1857 = xor i32 %33, %1856
  %1858 = select i1 %43, i32 0, i32 256
  %1859 = xor i32 %1857, %1858
  %1860 = select i1 %47, i32 0, i32 512
  %1861 = xor i32 %1859, %1860
  %1862 = xor i32 %1855, 0
  %1863 = lshr i32 %1862, 6
  %1864 = shl i32 %1863, 3
  %1865 = add i32 %1864, %1862
  %1866 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1865
  %1867 = insertelement <2 x bfloat> undef, bfloat %1708, i32 0
  %1868 = insertelement <2 x bfloat> %1867, bfloat %1709, i32 1
  %1869 = extractelement <2 x bfloat> %1868, i32 0
  %1870 = extractelement <2 x bfloat> %1868, i32 1
  %1871 = bitcast bfloat %1869 to i16
  %1872 = bitcast bfloat %1870 to i16
  %1873 = insertelement <2 x i16> undef, i16 %1871, i32 0
  %1874 = insertelement <2 x i16> %1873, i16 %1872, i32 1
  %1875 = extractelement <2 x i16> %1874, i32 0
  %1876 = extractelement <2 x i16> %1874, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1866, i16 %1875, i16 %1876, i1 true)
  %1877 = xor i32 %1855, 512
  %1878 = lshr i32 %1877, 6
  %1879 = shl i32 %1878, 3
  %1880 = add i32 %1879, %1877
  %1881 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1880
  %1882 = insertelement <2 x bfloat> undef, bfloat %1710, i32 0
  %1883 = insertelement <2 x bfloat> %1882, bfloat %1711, i32 1
  %1884 = extractelement <2 x bfloat> %1883, i32 0
  %1885 = extractelement <2 x bfloat> %1883, i32 1
  %1886 = bitcast bfloat %1884 to i16
  %1887 = bitcast bfloat %1885 to i16
  %1888 = insertelement <2 x i16> undef, i16 %1886, i32 0
  %1889 = insertelement <2 x i16> %1888, i16 %1887, i32 1
  %1890 = extractelement <2 x i16> %1889, i32 0
  %1891 = extractelement <2 x i16> %1889, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1881, i16 %1890, i16 %1891, i1 true)
  %1892 = xor i32 %1855, 16
  %1893 = lshr i32 %1892, 6
  %1894 = shl i32 %1893, 3
  %1895 = add i32 %1894, %1892
  %1896 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1895
  %1897 = insertelement <2 x bfloat> undef, bfloat %1712, i32 0
  %1898 = insertelement <2 x bfloat> %1897, bfloat %1713, i32 1
  %1899 = extractelement <2 x bfloat> %1898, i32 0
  %1900 = extractelement <2 x bfloat> %1898, i32 1
  %1901 = bitcast bfloat %1899 to i16
  %1902 = bitcast bfloat %1900 to i16
  %1903 = insertelement <2 x i16> undef, i16 %1901, i32 0
  %1904 = insertelement <2 x i16> %1903, i16 %1902, i32 1
  %1905 = extractelement <2 x i16> %1904, i32 0
  %1906 = extractelement <2 x i16> %1904, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1896, i16 %1905, i16 %1906, i1 true)
  %1907 = xor i32 %1855, 528
  %1908 = lshr i32 %1907, 6
  %1909 = shl i32 %1908, 3
  %1910 = add i32 %1909, %1907
  %1911 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1910
  %1912 = insertelement <2 x bfloat> undef, bfloat %1714, i32 0
  %1913 = insertelement <2 x bfloat> %1912, bfloat %1715, i32 1
  %1914 = extractelement <2 x bfloat> %1913, i32 0
  %1915 = extractelement <2 x bfloat> %1913, i32 1
  %1916 = bitcast bfloat %1914 to i16
  %1917 = bitcast bfloat %1915 to i16
  %1918 = insertelement <2 x i16> undef, i16 %1916, i32 0
  %1919 = insertelement <2 x i16> %1918, i16 %1917, i32 1
  %1920 = extractelement <2 x i16> %1919, i32 0
  %1921 = extractelement <2 x i16> %1919, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1911, i16 %1920, i16 %1921, i1 true)
  %1922 = xor i32 %1855, 32
  %1923 = lshr i32 %1922, 6
  %1924 = shl i32 %1923, 3
  %1925 = add i32 %1924, %1922
  %1926 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1925
  %1927 = insertelement <2 x bfloat> undef, bfloat %1716, i32 0
  %1928 = insertelement <2 x bfloat> %1927, bfloat %1717, i32 1
  %1929 = extractelement <2 x bfloat> %1928, i32 0
  %1930 = extractelement <2 x bfloat> %1928, i32 1
  %1931 = bitcast bfloat %1929 to i16
  %1932 = bitcast bfloat %1930 to i16
  %1933 = insertelement <2 x i16> undef, i16 %1931, i32 0
  %1934 = insertelement <2 x i16> %1933, i16 %1932, i32 1
  %1935 = extractelement <2 x i16> %1934, i32 0
  %1936 = extractelement <2 x i16> %1934, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1926, i16 %1935, i16 %1936, i1 true)
  %1937 = xor i32 %1855, 544
  %1938 = lshr i32 %1937, 6
  %1939 = shl i32 %1938, 3
  %1940 = add i32 %1939, %1937
  %1941 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1940
  %1942 = insertelement <2 x bfloat> undef, bfloat %1718, i32 0
  %1943 = insertelement <2 x bfloat> %1942, bfloat %1719, i32 1
  %1944 = extractelement <2 x bfloat> %1943, i32 0
  %1945 = extractelement <2 x bfloat> %1943, i32 1
  %1946 = bitcast bfloat %1944 to i16
  %1947 = bitcast bfloat %1945 to i16
  %1948 = insertelement <2 x i16> undef, i16 %1946, i32 0
  %1949 = insertelement <2 x i16> %1948, i16 %1947, i32 1
  %1950 = extractelement <2 x i16> %1949, i32 0
  %1951 = extractelement <2 x i16> %1949, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1941, i16 %1950, i16 %1951, i1 true)
  %1952 = xor i32 %1855, 48
  %1953 = lshr i32 %1952, 6
  %1954 = shl i32 %1953, 3
  %1955 = add i32 %1954, %1952
  %1956 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1955
  %1957 = insertelement <2 x bfloat> undef, bfloat %1720, i32 0
  %1958 = insertelement <2 x bfloat> %1957, bfloat %1721, i32 1
  %1959 = extractelement <2 x bfloat> %1958, i32 0
  %1960 = extractelement <2 x bfloat> %1958, i32 1
  %1961 = bitcast bfloat %1959 to i16
  %1962 = bitcast bfloat %1960 to i16
  %1963 = insertelement <2 x i16> undef, i16 %1961, i32 0
  %1964 = insertelement <2 x i16> %1963, i16 %1962, i32 1
  %1965 = extractelement <2 x i16> %1964, i32 0
  %1966 = extractelement <2 x i16> %1964, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1956, i16 %1965, i16 %1966, i1 true)
  %1967 = xor i32 %1855, 560
  %1968 = lshr i32 %1967, 6
  %1969 = shl i32 %1968, 3
  %1970 = add i32 %1969, %1967
  %1971 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1970
  %1972 = insertelement <2 x bfloat> undef, bfloat %1722, i32 0
  %1973 = insertelement <2 x bfloat> %1972, bfloat %1723, i32 1
  %1974 = extractelement <2 x bfloat> %1973, i32 0
  %1975 = extractelement <2 x bfloat> %1973, i32 1
  %1976 = bitcast bfloat %1974 to i16
  %1977 = bitcast bfloat %1975 to i16
  %1978 = insertelement <2 x i16> undef, i16 %1976, i32 0
  %1979 = insertelement <2 x i16> %1978, i16 %1977, i32 1
  %1980 = extractelement <2 x i16> %1979, i32 0
  %1981 = extractelement <2 x i16> %1979, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1971, i16 %1980, i16 %1981, i1 true)
  call void @llvm.nvvm.barrier0()
  %1982 = xor i32 %1861, 0
  %1983 = lshr i32 %1982, 6
  %1984 = shl i32 %1983, 3
  %1985 = add i32 %1984, %1982
  %1986 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1985
  %1987 = load <4 x i32>, ptr addrspace(3) %1986, align 16
  %1988 = extractelement <4 x i32> %1987, i32 0
  %1989 = extractelement <4 x i32> %1987, i32 1
  %1990 = extractelement <4 x i32> %1987, i32 2
  %1991 = extractelement <4 x i32> %1987, i32 3
  %1992 = insertelement <4 x i32> undef, i32 %1988, i32 0
  %1993 = insertelement <4 x i32> %1992, i32 %1989, i32 1
  %1994 = insertelement <4 x i32> %1993, i32 %1990, i32 2
  %1995 = insertelement <4 x i32> %1994, i32 %1991, i32 3
  %1996 = extractelement <4 x i32> %1995, i32 0
  %1997 = extractelement <4 x i32> %1995, i32 1
  %1998 = extractelement <4 x i32> %1995, i32 2
  %1999 = extractelement <4 x i32> %1995, i32 3
  %2000 = bitcast i32 %1996 to <2 x i16>
  %2001 = extractelement <2 x i16> %2000, i32 0
  %2002 = extractelement <2 x i16> %2000, i32 1
  %2003 = bitcast i32 %1997 to <2 x i16>
  %2004 = extractelement <2 x i16> %2003, i32 0
  %2005 = extractelement <2 x i16> %2003, i32 1
  %2006 = bitcast i32 %1998 to <2 x i16>
  %2007 = extractelement <2 x i16> %2006, i32 0
  %2008 = extractelement <2 x i16> %2006, i32 1
  %2009 = bitcast i32 %1999 to <2 x i16>
  %2010 = extractelement <2 x i16> %2009, i32 0
  %2011 = extractelement <2 x i16> %2009, i32 1
  %2012 = insertelement <8 x i16> undef, i16 %2001, i32 0
  %2013 = insertelement <8 x i16> %2012, i16 %2002, i32 1
  %2014 = insertelement <8 x i16> %2013, i16 %2004, i32 2
  %2015 = insertelement <8 x i16> %2014, i16 %2005, i32 3
  %2016 = insertelement <8 x i16> %2015, i16 %2007, i32 4
  %2017 = insertelement <8 x i16> %2016, i16 %2008, i32 5
  %2018 = insertelement <8 x i16> %2017, i16 %2010, i32 6
  %2019 = insertelement <8 x i16> %2018, i16 %2011, i32 7
  %2020 = extractelement <8 x i16> %2019, i32 0
  %2021 = extractelement <8 x i16> %2019, i32 1
  %2022 = extractelement <8 x i16> %2019, i32 2
  %2023 = extractelement <8 x i16> %2019, i32 3
  %2024 = extractelement <8 x i16> %2019, i32 4
  %2025 = extractelement <8 x i16> %2019, i32 5
  %2026 = extractelement <8 x i16> %2019, i32 6
  %2027 = extractelement <8 x i16> %2019, i32 7
  %2028 = bitcast i16 %2020 to bfloat
  %2029 = bitcast i16 %2021 to bfloat
  %2030 = bitcast i16 %2022 to bfloat
  %2031 = bitcast i16 %2023 to bfloat
  %2032 = bitcast i16 %2024 to bfloat
  %2033 = bitcast i16 %2025 to bfloat
  %2034 = bitcast i16 %2026 to bfloat
  %2035 = bitcast i16 %2027 to bfloat
  %2036 = insertelement <8 x bfloat> undef, bfloat %2028, i32 0
  %2037 = insertelement <8 x bfloat> %2036, bfloat %2029, i32 1
  %2038 = insertelement <8 x bfloat> %2037, bfloat %2030, i32 2
  %2039 = insertelement <8 x bfloat> %2038, bfloat %2031, i32 3
  %2040 = insertelement <8 x bfloat> %2039, bfloat %2032, i32 4
  %2041 = insertelement <8 x bfloat> %2040, bfloat %2033, i32 5
  %2042 = insertelement <8 x bfloat> %2041, bfloat %2034, i32 6
  %2043 = insertelement <8 x bfloat> %2042, bfloat %2035, i32 7
  %2044 = extractelement <8 x bfloat> %2043, i32 0
  %2045 = extractelement <8 x bfloat> %2043, i32 1
  %2046 = extractelement <8 x bfloat> %2043, i32 2
  %2047 = extractelement <8 x bfloat> %2043, i32 3
  %2048 = extractelement <8 x bfloat> %2043, i32 4
  %2049 = extractelement <8 x bfloat> %2043, i32 5
  %2050 = extractelement <8 x bfloat> %2043, i32 6
  %2051 = extractelement <8 x bfloat> %2043, i32 7
  %2052 = xor i32 %1861, 1024
  %2053 = lshr i32 %2052, 6
  %2054 = shl i32 %2053, 3
  %2055 = add i32 %2054, %2052
  %2056 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %2055
  %2057 = load <4 x i32>, ptr addrspace(3) %2056, align 16
  %2058 = extractelement <4 x i32> %2057, i32 0
  %2059 = extractelement <4 x i32> %2057, i32 1
  %2060 = extractelement <4 x i32> %2057, i32 2
  %2061 = extractelement <4 x i32> %2057, i32 3
  %2062 = insertelement <4 x i32> undef, i32 %2058, i32 0
  %2063 = insertelement <4 x i32> %2062, i32 %2059, i32 1
  %2064 = insertelement <4 x i32> %2063, i32 %2060, i32 2
  %2065 = insertelement <4 x i32> %2064, i32 %2061, i32 3
  %2066 = extractelement <4 x i32> %2065, i32 0
  %2067 = extractelement <4 x i32> %2065, i32 1
  %2068 = extractelement <4 x i32> %2065, i32 2
  %2069 = extractelement <4 x i32> %2065, i32 3
  %2070 = bitcast i32 %2066 to <2 x i16>
  %2071 = extractelement <2 x i16> %2070, i32 0
  %2072 = extractelement <2 x i16> %2070, i32 1
  %2073 = bitcast i32 %2067 to <2 x i16>
  %2074 = extractelement <2 x i16> %2073, i32 0
  %2075 = extractelement <2 x i16> %2073, i32 1
  %2076 = bitcast i32 %2068 to <2 x i16>
  %2077 = extractelement <2 x i16> %2076, i32 0
  %2078 = extractelement <2 x i16> %2076, i32 1
  %2079 = bitcast i32 %2069 to <2 x i16>
  %2080 = extractelement <2 x i16> %2079, i32 0
  %2081 = extractelement <2 x i16> %2079, i32 1
  %2082 = insertelement <8 x i16> undef, i16 %2071, i32 0
  %2083 = insertelement <8 x i16> %2082, i16 %2072, i32 1
  %2084 = insertelement <8 x i16> %2083, i16 %2074, i32 2
  %2085 = insertelement <8 x i16> %2084, i16 %2075, i32 3
  %2086 = insertelement <8 x i16> %2085, i16 %2077, i32 4
  %2087 = insertelement <8 x i16> %2086, i16 %2078, i32 5
  %2088 = insertelement <8 x i16> %2087, i16 %2080, i32 6
  %2089 = insertelement <8 x i16> %2088, i16 %2081, i32 7
  %2090 = extractelement <8 x i16> %2089, i32 0
  %2091 = extractelement <8 x i16> %2089, i32 1
  %2092 = extractelement <8 x i16> %2089, i32 2
  %2093 = extractelement <8 x i16> %2089, i32 3
  %2094 = extractelement <8 x i16> %2089, i32 4
  %2095 = extractelement <8 x i16> %2089, i32 5
  %2096 = extractelement <8 x i16> %2089, i32 6
  %2097 = extractelement <8 x i16> %2089, i32 7
  %2098 = bitcast i16 %2090 to bfloat
  %2099 = bitcast i16 %2091 to bfloat
  %2100 = bitcast i16 %2092 to bfloat
  %2101 = bitcast i16 %2093 to bfloat
  %2102 = bitcast i16 %2094 to bfloat
  %2103 = bitcast i16 %2095 to bfloat
  %2104 = bitcast i16 %2096 to bfloat
  %2105 = bitcast i16 %2097 to bfloat
  %2106 = insertelement <8 x bfloat> undef, bfloat %2098, i32 0
  %2107 = insertelement <8 x bfloat> %2106, bfloat %2099, i32 1
  %2108 = insertelement <8 x bfloat> %2107, bfloat %2100, i32 2
  %2109 = insertelement <8 x bfloat> %2108, bfloat %2101, i32 3
  %2110 = insertelement <8 x bfloat> %2109, bfloat %2102, i32 4
  %2111 = insertelement <8 x bfloat> %2110, bfloat %2103, i32 5
  %2112 = insertelement <8 x bfloat> %2111, bfloat %2104, i32 6
  %2113 = insertelement <8 x bfloat> %2112, bfloat %2105, i32 7
  %2114 = extractelement <8 x bfloat> %2113, i32 0
  %2115 = extractelement <8 x bfloat> %2113, i32 1
  %2116 = extractelement <8 x bfloat> %2113, i32 2
  %2117 = extractelement <8 x bfloat> %2113, i32 3
  %2118 = extractelement <8 x bfloat> %2113, i32 4
  %2119 = extractelement <8 x bfloat> %2113, i32 5
  %2120 = extractelement <8 x bfloat> %2113, i32 6
  %2121 = extractelement <8 x bfloat> %2113, i32 7
  call void @llvm.nvvm.barrier0()
  %2122 = insertelement <2 x bfloat> undef, bfloat %1724, i32 0
  %2123 = insertelement <2 x bfloat> %2122, bfloat %1725, i32 1
  %2124 = extractelement <2 x bfloat> %2123, i32 0
  %2125 = extractelement <2 x bfloat> %2123, i32 1
  %2126 = bitcast bfloat %2124 to i16
  %2127 = bitcast bfloat %2125 to i16
  %2128 = insertelement <2 x i16> undef, i16 %2126, i32 0
  %2129 = insertelement <2 x i16> %2128, i16 %2127, i32 1
  %2130 = extractelement <2 x i16> %2129, i32 0
  %2131 = extractelement <2 x i16> %2129, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1866, i16 %2130, i16 %2131, i1 true)
  %2132 = insertelement <2 x bfloat> undef, bfloat %1726, i32 0
  %2133 = insertelement <2 x bfloat> %2132, bfloat %1727, i32 1
  %2134 = extractelement <2 x bfloat> %2133, i32 0
  %2135 = extractelement <2 x bfloat> %2133, i32 1
  %2136 = bitcast bfloat %2134 to i16
  %2137 = bitcast bfloat %2135 to i16
  %2138 = insertelement <2 x i16> undef, i16 %2136, i32 0
  %2139 = insertelement <2 x i16> %2138, i16 %2137, i32 1
  %2140 = extractelement <2 x i16> %2139, i32 0
  %2141 = extractelement <2 x i16> %2139, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1881, i16 %2140, i16 %2141, i1 true)
  %2142 = insertelement <2 x bfloat> undef, bfloat %1728, i32 0
  %2143 = insertelement <2 x bfloat> %2142, bfloat %1729, i32 1
  %2144 = extractelement <2 x bfloat> %2143, i32 0
  %2145 = extractelement <2 x bfloat> %2143, i32 1
  %2146 = bitcast bfloat %2144 to i16
  %2147 = bitcast bfloat %2145 to i16
  %2148 = insertelement <2 x i16> undef, i16 %2146, i32 0
  %2149 = insertelement <2 x i16> %2148, i16 %2147, i32 1
  %2150 = extractelement <2 x i16> %2149, i32 0
  %2151 = extractelement <2 x i16> %2149, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1896, i16 %2150, i16 %2151, i1 true)
  %2152 = insertelement <2 x bfloat> undef, bfloat %1730, i32 0
  %2153 = insertelement <2 x bfloat> %2152, bfloat %1731, i32 1
  %2154 = extractelement <2 x bfloat> %2153, i32 0
  %2155 = extractelement <2 x bfloat> %2153, i32 1
  %2156 = bitcast bfloat %2154 to i16
  %2157 = bitcast bfloat %2155 to i16
  %2158 = insertelement <2 x i16> undef, i16 %2156, i32 0
  %2159 = insertelement <2 x i16> %2158, i16 %2157, i32 1
  %2160 = extractelement <2 x i16> %2159, i32 0
  %2161 = extractelement <2 x i16> %2159, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1911, i16 %2160, i16 %2161, i1 true)
  %2162 = insertelement <2 x bfloat> undef, bfloat %1732, i32 0
  %2163 = insertelement <2 x bfloat> %2162, bfloat %1733, i32 1
  %2164 = extractelement <2 x bfloat> %2163, i32 0
  %2165 = extractelement <2 x bfloat> %2163, i32 1
  %2166 = bitcast bfloat %2164 to i16
  %2167 = bitcast bfloat %2165 to i16
  %2168 = insertelement <2 x i16> undef, i16 %2166, i32 0
  %2169 = insertelement <2 x i16> %2168, i16 %2167, i32 1
  %2170 = extractelement <2 x i16> %2169, i32 0
  %2171 = extractelement <2 x i16> %2169, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1926, i16 %2170, i16 %2171, i1 true)
  %2172 = insertelement <2 x bfloat> undef, bfloat %1734, i32 0
  %2173 = insertelement <2 x bfloat> %2172, bfloat %1735, i32 1
  %2174 = extractelement <2 x bfloat> %2173, i32 0
  %2175 = extractelement <2 x bfloat> %2173, i32 1
  %2176 = bitcast bfloat %2174 to i16
  %2177 = bitcast bfloat %2175 to i16
  %2178 = insertelement <2 x i16> undef, i16 %2176, i32 0
  %2179 = insertelement <2 x i16> %2178, i16 %2177, i32 1
  %2180 = extractelement <2 x i16> %2179, i32 0
  %2181 = extractelement <2 x i16> %2179, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1941, i16 %2180, i16 %2181, i1 true)
  %2182 = insertelement <2 x bfloat> undef, bfloat %1736, i32 0
  %2183 = insertelement <2 x bfloat> %2182, bfloat %1737, i32 1
  %2184 = extractelement <2 x bfloat> %2183, i32 0
  %2185 = extractelement <2 x bfloat> %2183, i32 1
  %2186 = bitcast bfloat %2184 to i16
  %2187 = bitcast bfloat %2185 to i16
  %2188 = insertelement <2 x i16> undef, i16 %2186, i32 0
  %2189 = insertelement <2 x i16> %2188, i16 %2187, i32 1
  %2190 = extractelement <2 x i16> %2189, i32 0
  %2191 = extractelement <2 x i16> %2189, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1956, i16 %2190, i16 %2191, i1 true)
  %2192 = insertelement <2 x bfloat> undef, bfloat %1738, i32 0
  %2193 = insertelement <2 x bfloat> %2192, bfloat %1739, i32 1
  %2194 = extractelement <2 x bfloat> %2193, i32 0
  %2195 = extractelement <2 x bfloat> %2193, i32 1
  %2196 = bitcast bfloat %2194 to i16
  %2197 = bitcast bfloat %2195 to i16
  %2198 = insertelement <2 x i16> undef, i16 %2196, i32 0
  %2199 = insertelement <2 x i16> %2198, i16 %2197, i32 1
  %2200 = extractelement <2 x i16> %2199, i32 0
  %2201 = extractelement <2 x i16> %2199, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1971, i16 %2200, i16 %2201, i1 true)
  call void @llvm.nvvm.barrier0()
  %2202 = load <4 x i32>, ptr addrspace(3) %1986, align 16
  %2203 = extractelement <4 x i32> %2202, i32 0
  %2204 = extractelement <4 x i32> %2202, i32 1
  %2205 = extractelement <4 x i32> %2202, i32 2
  %2206 = extractelement <4 x i32> %2202, i32 3
  %2207 = insertelement <4 x i32> undef, i32 %2203, i32 0
  %2208 = insertelement <4 x i32> %2207, i32 %2204, i32 1
  %2209 = insertelement <4 x i32> %2208, i32 %2205, i32 2
  %2210 = insertelement <4 x i32> %2209, i32 %2206, i32 3
  %2211 = extractelement <4 x i32> %2210, i32 0
  %2212 = extractelement <4 x i32> %2210, i32 1
  %2213 = extractelement <4 x i32> %2210, i32 2
  %2214 = extractelement <4 x i32> %2210, i32 3
  %2215 = bitcast i32 %2211 to <2 x i16>
  %2216 = extractelement <2 x i16> %2215, i32 0
  %2217 = extractelement <2 x i16> %2215, i32 1
  %2218 = bitcast i32 %2212 to <2 x i16>
  %2219 = extractelement <2 x i16> %2218, i32 0
  %2220 = extractelement <2 x i16> %2218, i32 1
  %2221 = bitcast i32 %2213 to <2 x i16>
  %2222 = extractelement <2 x i16> %2221, i32 0
  %2223 = extractelement <2 x i16> %2221, i32 1
  %2224 = bitcast i32 %2214 to <2 x i16>
  %2225 = extractelement <2 x i16> %2224, i32 0
  %2226 = extractelement <2 x i16> %2224, i32 1
  %2227 = insertelement <8 x i16> undef, i16 %2216, i32 0
  %2228 = insertelement <8 x i16> %2227, i16 %2217, i32 1
  %2229 = insertelement <8 x i16> %2228, i16 %2219, i32 2
  %2230 = insertelement <8 x i16> %2229, i16 %2220, i32 3
  %2231 = insertelement <8 x i16> %2230, i16 %2222, i32 4
  %2232 = insertelement <8 x i16> %2231, i16 %2223, i32 5
  %2233 = insertelement <8 x i16> %2232, i16 %2225, i32 6
  %2234 = insertelement <8 x i16> %2233, i16 %2226, i32 7
  %2235 = extractelement <8 x i16> %2234, i32 0
  %2236 = extractelement <8 x i16> %2234, i32 1
  %2237 = extractelement <8 x i16> %2234, i32 2
  %2238 = extractelement <8 x i16> %2234, i32 3
  %2239 = extractelement <8 x i16> %2234, i32 4
  %2240 = extractelement <8 x i16> %2234, i32 5
  %2241 = extractelement <8 x i16> %2234, i32 6
  %2242 = extractelement <8 x i16> %2234, i32 7
  %2243 = bitcast i16 %2235 to bfloat
  %2244 = bitcast i16 %2236 to bfloat
  %2245 = bitcast i16 %2237 to bfloat
  %2246 = bitcast i16 %2238 to bfloat
  %2247 = bitcast i16 %2239 to bfloat
  %2248 = bitcast i16 %2240 to bfloat
  %2249 = bitcast i16 %2241 to bfloat
  %2250 = bitcast i16 %2242 to bfloat
  %2251 = insertelement <8 x bfloat> undef, bfloat %2243, i32 0
  %2252 = insertelement <8 x bfloat> %2251, bfloat %2244, i32 1
  %2253 = insertelement <8 x bfloat> %2252, bfloat %2245, i32 2
  %2254 = insertelement <8 x bfloat> %2253, bfloat %2246, i32 3
  %2255 = insertelement <8 x bfloat> %2254, bfloat %2247, i32 4
  %2256 = insertelement <8 x bfloat> %2255, bfloat %2248, i32 5
  %2257 = insertelement <8 x bfloat> %2256, bfloat %2249, i32 6
  %2258 = insertelement <8 x bfloat> %2257, bfloat %2250, i32 7
  %2259 = extractelement <8 x bfloat> %2258, i32 0
  %2260 = extractelement <8 x bfloat> %2258, i32 1
  %2261 = extractelement <8 x bfloat> %2258, i32 2
  %2262 = extractelement <8 x bfloat> %2258, i32 3
  %2263 = extractelement <8 x bfloat> %2258, i32 4
  %2264 = extractelement <8 x bfloat> %2258, i32 5
  %2265 = extractelement <8 x bfloat> %2258, i32 6
  %2266 = extractelement <8 x bfloat> %2258, i32 7
  %2267 = load <4 x i32>, ptr addrspace(3) %2056, align 16
  %2268 = extractelement <4 x i32> %2267, i32 0
  %2269 = extractelement <4 x i32> %2267, i32 1
  %2270 = extractelement <4 x i32> %2267, i32 2
  %2271 = extractelement <4 x i32> %2267, i32 3
  %2272 = insertelement <4 x i32> undef, i32 %2268, i32 0
  %2273 = insertelement <4 x i32> %2272, i32 %2269, i32 1
  %2274 = insertelement <4 x i32> %2273, i32 %2270, i32 2
  %2275 = insertelement <4 x i32> %2274, i32 %2271, i32 3
  %2276 = extractelement <4 x i32> %2275, i32 0
  %2277 = extractelement <4 x i32> %2275, i32 1
  %2278 = extractelement <4 x i32> %2275, i32 2
  %2279 = extractelement <4 x i32> %2275, i32 3
  %2280 = bitcast i32 %2276 to <2 x i16>
  %2281 = extractelement <2 x i16> %2280, i32 0
  %2282 = extractelement <2 x i16> %2280, i32 1
  %2283 = bitcast i32 %2277 to <2 x i16>
  %2284 = extractelement <2 x i16> %2283, i32 0
  %2285 = extractelement <2 x i16> %2283, i32 1
  %2286 = bitcast i32 %2278 to <2 x i16>
  %2287 = extractelement <2 x i16> %2286, i32 0
  %2288 = extractelement <2 x i16> %2286, i32 1
  %2289 = bitcast i32 %2279 to <2 x i16>
  %2290 = extractelement <2 x i16> %2289, i32 0
  %2291 = extractelement <2 x i16> %2289, i32 1
  %2292 = insertelement <8 x i16> undef, i16 %2281, i32 0
  %2293 = insertelement <8 x i16> %2292, i16 %2282, i32 1
  %2294 = insertelement <8 x i16> %2293, i16 %2284, i32 2
  %2295 = insertelement <8 x i16> %2294, i16 %2285, i32 3
  %2296 = insertelement <8 x i16> %2295, i16 %2287, i32 4
  %2297 = insertelement <8 x i16> %2296, i16 %2288, i32 5
  %2298 = insertelement <8 x i16> %2297, i16 %2290, i32 6
  %2299 = insertelement <8 x i16> %2298, i16 %2291, i32 7
  %2300 = extractelement <8 x i16> %2299, i32 0
  %2301 = extractelement <8 x i16> %2299, i32 1
  %2302 = extractelement <8 x i16> %2299, i32 2
  %2303 = extractelement <8 x i16> %2299, i32 3
  %2304 = extractelement <8 x i16> %2299, i32 4
  %2305 = extractelement <8 x i16> %2299, i32 5
  %2306 = extractelement <8 x i16> %2299, i32 6
  %2307 = extractelement <8 x i16> %2299, i32 7
  %2308 = bitcast i16 %2300 to bfloat
  %2309 = bitcast i16 %2301 to bfloat
  %2310 = bitcast i16 %2302 to bfloat
  %2311 = bitcast i16 %2303 to bfloat
  %2312 = bitcast i16 %2304 to bfloat
  %2313 = bitcast i16 %2305 to bfloat
  %2314 = bitcast i16 %2306 to bfloat
  %2315 = bitcast i16 %2307 to bfloat
  %2316 = insertelement <8 x bfloat> undef, bfloat %2308, i32 0
  %2317 = insertelement <8 x bfloat> %2316, bfloat %2309, i32 1
  %2318 = insertelement <8 x bfloat> %2317, bfloat %2310, i32 2
  %2319 = insertelement <8 x bfloat> %2318, bfloat %2311, i32 3
  %2320 = insertelement <8 x bfloat> %2319, bfloat %2312, i32 4
  %2321 = insertelement <8 x bfloat> %2320, bfloat %2313, i32 5
  %2322 = insertelement <8 x bfloat> %2321, bfloat %2314, i32 6
  %2323 = insertelement <8 x bfloat> %2322, bfloat %2315, i32 7
  %2324 = extractelement <8 x bfloat> %2323, i32 0
  %2325 = extractelement <8 x bfloat> %2323, i32 1
  %2326 = extractelement <8 x bfloat> %2323, i32 2
  %2327 = extractelement <8 x bfloat> %2323, i32 3
  %2328 = extractelement <8 x bfloat> %2323, i32 4
  %2329 = extractelement <8 x bfloat> %2323, i32 5
  %2330 = extractelement <8 x bfloat> %2323, i32 6
  %2331 = extractelement <8 x bfloat> %2323, i32 7
  call void @llvm.nvvm.barrier0()
  %2332 = insertelement <2 x bfloat> undef, bfloat %1740, i32 0
  %2333 = insertelement <2 x bfloat> %2332, bfloat %1741, i32 1
  %2334 = extractelement <2 x bfloat> %2333, i32 0
  %2335 = extractelement <2 x bfloat> %2333, i32 1
  %2336 = bitcast bfloat %2334 to i16
  %2337 = bitcast bfloat %2335 to i16
  %2338 = insertelement <2 x i16> undef, i16 %2336, i32 0
  %2339 = insertelement <2 x i16> %2338, i16 %2337, i32 1
  %2340 = extractelement <2 x i16> %2339, i32 0
  %2341 = extractelement <2 x i16> %2339, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1866, i16 %2340, i16 %2341, i1 true)
  %2342 = insertelement <2 x bfloat> undef, bfloat %1742, i32 0
  %2343 = insertelement <2 x bfloat> %2342, bfloat %1743, i32 1
  %2344 = extractelement <2 x bfloat> %2343, i32 0
  %2345 = extractelement <2 x bfloat> %2343, i32 1
  %2346 = bitcast bfloat %2344 to i16
  %2347 = bitcast bfloat %2345 to i16
  %2348 = insertelement <2 x i16> undef, i16 %2346, i32 0
  %2349 = insertelement <2 x i16> %2348, i16 %2347, i32 1
  %2350 = extractelement <2 x i16> %2349, i32 0
  %2351 = extractelement <2 x i16> %2349, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1881, i16 %2350, i16 %2351, i1 true)
  %2352 = insertelement <2 x bfloat> undef, bfloat %1744, i32 0
  %2353 = insertelement <2 x bfloat> %2352, bfloat %1745, i32 1
  %2354 = extractelement <2 x bfloat> %2353, i32 0
  %2355 = extractelement <2 x bfloat> %2353, i32 1
  %2356 = bitcast bfloat %2354 to i16
  %2357 = bitcast bfloat %2355 to i16
  %2358 = insertelement <2 x i16> undef, i16 %2356, i32 0
  %2359 = insertelement <2 x i16> %2358, i16 %2357, i32 1
  %2360 = extractelement <2 x i16> %2359, i32 0
  %2361 = extractelement <2 x i16> %2359, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1896, i16 %2360, i16 %2361, i1 true)
  %2362 = insertelement <2 x bfloat> undef, bfloat %1746, i32 0
  %2363 = insertelement <2 x bfloat> %2362, bfloat %1747, i32 1
  %2364 = extractelement <2 x bfloat> %2363, i32 0
  %2365 = extractelement <2 x bfloat> %2363, i32 1
  %2366 = bitcast bfloat %2364 to i16
  %2367 = bitcast bfloat %2365 to i16
  %2368 = insertelement <2 x i16> undef, i16 %2366, i32 0
  %2369 = insertelement <2 x i16> %2368, i16 %2367, i32 1
  %2370 = extractelement <2 x i16> %2369, i32 0
  %2371 = extractelement <2 x i16> %2369, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1911, i16 %2370, i16 %2371, i1 true)
  %2372 = insertelement <2 x bfloat> undef, bfloat %1748, i32 0
  %2373 = insertelement <2 x bfloat> %2372, bfloat %1749, i32 1
  %2374 = extractelement <2 x bfloat> %2373, i32 0
  %2375 = extractelement <2 x bfloat> %2373, i32 1
  %2376 = bitcast bfloat %2374 to i16
  %2377 = bitcast bfloat %2375 to i16
  %2378 = insertelement <2 x i16> undef, i16 %2376, i32 0
  %2379 = insertelement <2 x i16> %2378, i16 %2377, i32 1
  %2380 = extractelement <2 x i16> %2379, i32 0
  %2381 = extractelement <2 x i16> %2379, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1926, i16 %2380, i16 %2381, i1 true)
  %2382 = insertelement <2 x bfloat> undef, bfloat %1750, i32 0
  %2383 = insertelement <2 x bfloat> %2382, bfloat %1751, i32 1
  %2384 = extractelement <2 x bfloat> %2383, i32 0
  %2385 = extractelement <2 x bfloat> %2383, i32 1
  %2386 = bitcast bfloat %2384 to i16
  %2387 = bitcast bfloat %2385 to i16
  %2388 = insertelement <2 x i16> undef, i16 %2386, i32 0
  %2389 = insertelement <2 x i16> %2388, i16 %2387, i32 1
  %2390 = extractelement <2 x i16> %2389, i32 0
  %2391 = extractelement <2 x i16> %2389, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1941, i16 %2390, i16 %2391, i1 true)
  %2392 = insertelement <2 x bfloat> undef, bfloat %1752, i32 0
  %2393 = insertelement <2 x bfloat> %2392, bfloat %1753, i32 1
  %2394 = extractelement <2 x bfloat> %2393, i32 0
  %2395 = extractelement <2 x bfloat> %2393, i32 1
  %2396 = bitcast bfloat %2394 to i16
  %2397 = bitcast bfloat %2395 to i16
  %2398 = insertelement <2 x i16> undef, i16 %2396, i32 0
  %2399 = insertelement <2 x i16> %2398, i16 %2397, i32 1
  %2400 = extractelement <2 x i16> %2399, i32 0
  %2401 = extractelement <2 x i16> %2399, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1956, i16 %2400, i16 %2401, i1 true)
  %2402 = insertelement <2 x bfloat> undef, bfloat %1754, i32 0
  %2403 = insertelement <2 x bfloat> %2402, bfloat %1755, i32 1
  %2404 = extractelement <2 x bfloat> %2403, i32 0
  %2405 = extractelement <2 x bfloat> %2403, i32 1
  %2406 = bitcast bfloat %2404 to i16
  %2407 = bitcast bfloat %2405 to i16
  %2408 = insertelement <2 x i16> undef, i16 %2406, i32 0
  %2409 = insertelement <2 x i16> %2408, i16 %2407, i32 1
  %2410 = extractelement <2 x i16> %2409, i32 0
  %2411 = extractelement <2 x i16> %2409, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1971, i16 %2410, i16 %2411, i1 true)
  call void @llvm.nvvm.barrier0()
  %2412 = load <4 x i32>, ptr addrspace(3) %1986, align 16
  %2413 = extractelement <4 x i32> %2412, i32 0
  %2414 = extractelement <4 x i32> %2412, i32 1
  %2415 = extractelement <4 x i32> %2412, i32 2
  %2416 = extractelement <4 x i32> %2412, i32 3
  %2417 = insertelement <4 x i32> undef, i32 %2413, i32 0
  %2418 = insertelement <4 x i32> %2417, i32 %2414, i32 1
  %2419 = insertelement <4 x i32> %2418, i32 %2415, i32 2
  %2420 = insertelement <4 x i32> %2419, i32 %2416, i32 3
  %2421 = extractelement <4 x i32> %2420, i32 0
  %2422 = extractelement <4 x i32> %2420, i32 1
  %2423 = extractelement <4 x i32> %2420, i32 2
  %2424 = extractelement <4 x i32> %2420, i32 3
  %2425 = bitcast i32 %2421 to <2 x i16>
  %2426 = extractelement <2 x i16> %2425, i32 0
  %2427 = extractelement <2 x i16> %2425, i32 1
  %2428 = bitcast i32 %2422 to <2 x i16>
  %2429 = extractelement <2 x i16> %2428, i32 0
  %2430 = extractelement <2 x i16> %2428, i32 1
  %2431 = bitcast i32 %2423 to <2 x i16>
  %2432 = extractelement <2 x i16> %2431, i32 0
  %2433 = extractelement <2 x i16> %2431, i32 1
  %2434 = bitcast i32 %2424 to <2 x i16>
  %2435 = extractelement <2 x i16> %2434, i32 0
  %2436 = extractelement <2 x i16> %2434, i32 1
  %2437 = insertelement <8 x i16> undef, i16 %2426, i32 0
  %2438 = insertelement <8 x i16> %2437, i16 %2427, i32 1
  %2439 = insertelement <8 x i16> %2438, i16 %2429, i32 2
  %2440 = insertelement <8 x i16> %2439, i16 %2430, i32 3
  %2441 = insertelement <8 x i16> %2440, i16 %2432, i32 4
  %2442 = insertelement <8 x i16> %2441, i16 %2433, i32 5
  %2443 = insertelement <8 x i16> %2442, i16 %2435, i32 6
  %2444 = insertelement <8 x i16> %2443, i16 %2436, i32 7
  %2445 = extractelement <8 x i16> %2444, i32 0
  %2446 = extractelement <8 x i16> %2444, i32 1
  %2447 = extractelement <8 x i16> %2444, i32 2
  %2448 = extractelement <8 x i16> %2444, i32 3
  %2449 = extractelement <8 x i16> %2444, i32 4
  %2450 = extractelement <8 x i16> %2444, i32 5
  %2451 = extractelement <8 x i16> %2444, i32 6
  %2452 = extractelement <8 x i16> %2444, i32 7
  %2453 = bitcast i16 %2445 to bfloat
  %2454 = bitcast i16 %2446 to bfloat
  %2455 = bitcast i16 %2447 to bfloat
  %2456 = bitcast i16 %2448 to bfloat
  %2457 = bitcast i16 %2449 to bfloat
  %2458 = bitcast i16 %2450 to bfloat
  %2459 = bitcast i16 %2451 to bfloat
  %2460 = bitcast i16 %2452 to bfloat
  %2461 = insertelement <8 x bfloat> undef, bfloat %2453, i32 0
  %2462 = insertelement <8 x bfloat> %2461, bfloat %2454, i32 1
  %2463 = insertelement <8 x bfloat> %2462, bfloat %2455, i32 2
  %2464 = insertelement <8 x bfloat> %2463, bfloat %2456, i32 3
  %2465 = insertelement <8 x bfloat> %2464, bfloat %2457, i32 4
  %2466 = insertelement <8 x bfloat> %2465, bfloat %2458, i32 5
  %2467 = insertelement <8 x bfloat> %2466, bfloat %2459, i32 6
  %2468 = insertelement <8 x bfloat> %2467, bfloat %2460, i32 7
  %2469 = extractelement <8 x bfloat> %2468, i32 0
  %2470 = extractelement <8 x bfloat> %2468, i32 1
  %2471 = extractelement <8 x bfloat> %2468, i32 2
  %2472 = extractelement <8 x bfloat> %2468, i32 3
  %2473 = extractelement <8 x bfloat> %2468, i32 4
  %2474 = extractelement <8 x bfloat> %2468, i32 5
  %2475 = extractelement <8 x bfloat> %2468, i32 6
  %2476 = extractelement <8 x bfloat> %2468, i32 7
  %2477 = load <4 x i32>, ptr addrspace(3) %2056, align 16
  %2478 = extractelement <4 x i32> %2477, i32 0
  %2479 = extractelement <4 x i32> %2477, i32 1
  %2480 = extractelement <4 x i32> %2477, i32 2
  %2481 = extractelement <4 x i32> %2477, i32 3
  %2482 = insertelement <4 x i32> undef, i32 %2478, i32 0
  %2483 = insertelement <4 x i32> %2482, i32 %2479, i32 1
  %2484 = insertelement <4 x i32> %2483, i32 %2480, i32 2
  %2485 = insertelement <4 x i32> %2484, i32 %2481, i32 3
  %2486 = extractelement <4 x i32> %2485, i32 0
  %2487 = extractelement <4 x i32> %2485, i32 1
  %2488 = extractelement <4 x i32> %2485, i32 2
  %2489 = extractelement <4 x i32> %2485, i32 3
  %2490 = bitcast i32 %2486 to <2 x i16>
  %2491 = extractelement <2 x i16> %2490, i32 0
  %2492 = extractelement <2 x i16> %2490, i32 1
  %2493 = bitcast i32 %2487 to <2 x i16>
  %2494 = extractelement <2 x i16> %2493, i32 0
  %2495 = extractelement <2 x i16> %2493, i32 1
  %2496 = bitcast i32 %2488 to <2 x i16>
  %2497 = extractelement <2 x i16> %2496, i32 0
  %2498 = extractelement <2 x i16> %2496, i32 1
  %2499 = bitcast i32 %2489 to <2 x i16>
  %2500 = extractelement <2 x i16> %2499, i32 0
  %2501 = extractelement <2 x i16> %2499, i32 1
  %2502 = insertelement <8 x i16> undef, i16 %2491, i32 0
  %2503 = insertelement <8 x i16> %2502, i16 %2492, i32 1
  %2504 = insertelement <8 x i16> %2503, i16 %2494, i32 2
  %2505 = insertelement <8 x i16> %2504, i16 %2495, i32 3
  %2506 = insertelement <8 x i16> %2505, i16 %2497, i32 4
  %2507 = insertelement <8 x i16> %2506, i16 %2498, i32 5
  %2508 = insertelement <8 x i16> %2507, i16 %2500, i32 6
  %2509 = insertelement <8 x i16> %2508, i16 %2501, i32 7
  %2510 = extractelement <8 x i16> %2509, i32 0
  %2511 = extractelement <8 x i16> %2509, i32 1
  %2512 = extractelement <8 x i16> %2509, i32 2
  %2513 = extractelement <8 x i16> %2509, i32 3
  %2514 = extractelement <8 x i16> %2509, i32 4
  %2515 = extractelement <8 x i16> %2509, i32 5
  %2516 = extractelement <8 x i16> %2509, i32 6
  %2517 = extractelement <8 x i16> %2509, i32 7
  %2518 = bitcast i16 %2510 to bfloat
  %2519 = bitcast i16 %2511 to bfloat
  %2520 = bitcast i16 %2512 to bfloat
  %2521 = bitcast i16 %2513 to bfloat
  %2522 = bitcast i16 %2514 to bfloat
  %2523 = bitcast i16 %2515 to bfloat
  %2524 = bitcast i16 %2516 to bfloat
  %2525 = bitcast i16 %2517 to bfloat
  %2526 = insertelement <8 x bfloat> undef, bfloat %2518, i32 0
  %2527 = insertelement <8 x bfloat> %2526, bfloat %2519, i32 1
  %2528 = insertelement <8 x bfloat> %2527, bfloat %2520, i32 2
  %2529 = insertelement <8 x bfloat> %2528, bfloat %2521, i32 3
  %2530 = insertelement <8 x bfloat> %2529, bfloat %2522, i32 4
  %2531 = insertelement <8 x bfloat> %2530, bfloat %2523, i32 5
  %2532 = insertelement <8 x bfloat> %2531, bfloat %2524, i32 6
  %2533 = insertelement <8 x bfloat> %2532, bfloat %2525, i32 7
  %2534 = extractelement <8 x bfloat> %2533, i32 0
  %2535 = extractelement <8 x bfloat> %2533, i32 1
  %2536 = extractelement <8 x bfloat> %2533, i32 2
  %2537 = extractelement <8 x bfloat> %2533, i32 3
  %2538 = extractelement <8 x bfloat> %2533, i32 4
  %2539 = extractelement <8 x bfloat> %2533, i32 5
  %2540 = extractelement <8 x bfloat> %2533, i32 6
  %2541 = extractelement <8 x bfloat> %2533, i32 7
  call void @llvm.nvvm.barrier0()
  %2542 = insertelement <2 x bfloat> undef, bfloat %1756, i32 0
  %2543 = insertelement <2 x bfloat> %2542, bfloat %1757, i32 1
  %2544 = extractelement <2 x bfloat> %2543, i32 0
  %2545 = extractelement <2 x bfloat> %2543, i32 1
  %2546 = bitcast bfloat %2544 to i16
  %2547 = bitcast bfloat %2545 to i16
  %2548 = insertelement <2 x i16> undef, i16 %2546, i32 0
  %2549 = insertelement <2 x i16> %2548, i16 %2547, i32 1
  %2550 = extractelement <2 x i16> %2549, i32 0
  %2551 = extractelement <2 x i16> %2549, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1866, i16 %2550, i16 %2551, i1 true)
  %2552 = insertelement <2 x bfloat> undef, bfloat %1758, i32 0
  %2553 = insertelement <2 x bfloat> %2552, bfloat %1759, i32 1
  %2554 = extractelement <2 x bfloat> %2553, i32 0
  %2555 = extractelement <2 x bfloat> %2553, i32 1
  %2556 = bitcast bfloat %2554 to i16
  %2557 = bitcast bfloat %2555 to i16
  %2558 = insertelement <2 x i16> undef, i16 %2556, i32 0
  %2559 = insertelement <2 x i16> %2558, i16 %2557, i32 1
  %2560 = extractelement <2 x i16> %2559, i32 0
  %2561 = extractelement <2 x i16> %2559, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1881, i16 %2560, i16 %2561, i1 true)
  %2562 = insertelement <2 x bfloat> undef, bfloat %1760, i32 0
  %2563 = insertelement <2 x bfloat> %2562, bfloat %1761, i32 1
  %2564 = extractelement <2 x bfloat> %2563, i32 0
  %2565 = extractelement <2 x bfloat> %2563, i32 1
  %2566 = bitcast bfloat %2564 to i16
  %2567 = bitcast bfloat %2565 to i16
  %2568 = insertelement <2 x i16> undef, i16 %2566, i32 0
  %2569 = insertelement <2 x i16> %2568, i16 %2567, i32 1
  %2570 = extractelement <2 x i16> %2569, i32 0
  %2571 = extractelement <2 x i16> %2569, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1896, i16 %2570, i16 %2571, i1 true)
  %2572 = insertelement <2 x bfloat> undef, bfloat %1762, i32 0
  %2573 = insertelement <2 x bfloat> %2572, bfloat %1763, i32 1
  %2574 = extractelement <2 x bfloat> %2573, i32 0
  %2575 = extractelement <2 x bfloat> %2573, i32 1
  %2576 = bitcast bfloat %2574 to i16
  %2577 = bitcast bfloat %2575 to i16
  %2578 = insertelement <2 x i16> undef, i16 %2576, i32 0
  %2579 = insertelement <2 x i16> %2578, i16 %2577, i32 1
  %2580 = extractelement <2 x i16> %2579, i32 0
  %2581 = extractelement <2 x i16> %2579, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1911, i16 %2580, i16 %2581, i1 true)
  %2582 = insertelement <2 x bfloat> undef, bfloat %1764, i32 0
  %2583 = insertelement <2 x bfloat> %2582, bfloat %1765, i32 1
  %2584 = extractelement <2 x bfloat> %2583, i32 0
  %2585 = extractelement <2 x bfloat> %2583, i32 1
  %2586 = bitcast bfloat %2584 to i16
  %2587 = bitcast bfloat %2585 to i16
  %2588 = insertelement <2 x i16> undef, i16 %2586, i32 0
  %2589 = insertelement <2 x i16> %2588, i16 %2587, i32 1
  %2590 = extractelement <2 x i16> %2589, i32 0
  %2591 = extractelement <2 x i16> %2589, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1926, i16 %2590, i16 %2591, i1 true)
  %2592 = insertelement <2 x bfloat> undef, bfloat %1766, i32 0
  %2593 = insertelement <2 x bfloat> %2592, bfloat %1767, i32 1
  %2594 = extractelement <2 x bfloat> %2593, i32 0
  %2595 = extractelement <2 x bfloat> %2593, i32 1
  %2596 = bitcast bfloat %2594 to i16
  %2597 = bitcast bfloat %2595 to i16
  %2598 = insertelement <2 x i16> undef, i16 %2596, i32 0
  %2599 = insertelement <2 x i16> %2598, i16 %2597, i32 1
  %2600 = extractelement <2 x i16> %2599, i32 0
  %2601 = extractelement <2 x i16> %2599, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1941, i16 %2600, i16 %2601, i1 true)
  %2602 = insertelement <2 x bfloat> undef, bfloat %1768, i32 0
  %2603 = insertelement <2 x bfloat> %2602, bfloat %1769, i32 1
  %2604 = extractelement <2 x bfloat> %2603, i32 0
  %2605 = extractelement <2 x bfloat> %2603, i32 1
  %2606 = bitcast bfloat %2604 to i16
  %2607 = bitcast bfloat %2605 to i16
  %2608 = insertelement <2 x i16> undef, i16 %2606, i32 0
  %2609 = insertelement <2 x i16> %2608, i16 %2607, i32 1
  %2610 = extractelement <2 x i16> %2609, i32 0
  %2611 = extractelement <2 x i16> %2609, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1956, i16 %2610, i16 %2611, i1 true)
  %2612 = insertelement <2 x bfloat> undef, bfloat %1770, i32 0
  %2613 = insertelement <2 x bfloat> %2612, bfloat %1771, i32 1
  %2614 = extractelement <2 x bfloat> %2613, i32 0
  %2615 = extractelement <2 x bfloat> %2613, i32 1
  %2616 = bitcast bfloat %2614 to i16
  %2617 = bitcast bfloat %2615 to i16
  %2618 = insertelement <2 x i16> undef, i16 %2616, i32 0
  %2619 = insertelement <2 x i16> %2618, i16 %2617, i32 1
  %2620 = extractelement <2 x i16> %2619, i32 0
  %2621 = extractelement <2 x i16> %2619, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1971, i16 %2620, i16 %2621, i1 true)
  call void @llvm.nvvm.barrier0()
  %2622 = load <4 x i32>, ptr addrspace(3) %1986, align 16
  %2623 = extractelement <4 x i32> %2622, i32 0
  %2624 = extractelement <4 x i32> %2622, i32 1
  %2625 = extractelement <4 x i32> %2622, i32 2
  %2626 = extractelement <4 x i32> %2622, i32 3
  %2627 = insertelement <4 x i32> undef, i32 %2623, i32 0
  %2628 = insertelement <4 x i32> %2627, i32 %2624, i32 1
  %2629 = insertelement <4 x i32> %2628, i32 %2625, i32 2
  %2630 = insertelement <4 x i32> %2629, i32 %2626, i32 3
  %2631 = extractelement <4 x i32> %2630, i32 0
  %2632 = extractelement <4 x i32> %2630, i32 1
  %2633 = extractelement <4 x i32> %2630, i32 2
  %2634 = extractelement <4 x i32> %2630, i32 3
  %2635 = bitcast i32 %2631 to <2 x i16>
  %2636 = extractelement <2 x i16> %2635, i32 0
  %2637 = extractelement <2 x i16> %2635, i32 1
  %2638 = bitcast i32 %2632 to <2 x i16>
  %2639 = extractelement <2 x i16> %2638, i32 0
  %2640 = extractelement <2 x i16> %2638, i32 1
  %2641 = bitcast i32 %2633 to <2 x i16>
  %2642 = extractelement <2 x i16> %2641, i32 0
  %2643 = extractelement <2 x i16> %2641, i32 1
  %2644 = bitcast i32 %2634 to <2 x i16>
  %2645 = extractelement <2 x i16> %2644, i32 0
  %2646 = extractelement <2 x i16> %2644, i32 1
  %2647 = insertelement <8 x i16> undef, i16 %2636, i32 0
  %2648 = insertelement <8 x i16> %2647, i16 %2637, i32 1
  %2649 = insertelement <8 x i16> %2648, i16 %2639, i32 2
  %2650 = insertelement <8 x i16> %2649, i16 %2640, i32 3
  %2651 = insertelement <8 x i16> %2650, i16 %2642, i32 4
  %2652 = insertelement <8 x i16> %2651, i16 %2643, i32 5
  %2653 = insertelement <8 x i16> %2652, i16 %2645, i32 6
  %2654 = insertelement <8 x i16> %2653, i16 %2646, i32 7
  %2655 = extractelement <8 x i16> %2654, i32 0
  %2656 = extractelement <8 x i16> %2654, i32 1
  %2657 = extractelement <8 x i16> %2654, i32 2
  %2658 = extractelement <8 x i16> %2654, i32 3
  %2659 = extractelement <8 x i16> %2654, i32 4
  %2660 = extractelement <8 x i16> %2654, i32 5
  %2661 = extractelement <8 x i16> %2654, i32 6
  %2662 = extractelement <8 x i16> %2654, i32 7
  %2663 = bitcast i16 %2655 to bfloat
  %2664 = bitcast i16 %2656 to bfloat
  %2665 = bitcast i16 %2657 to bfloat
  %2666 = bitcast i16 %2658 to bfloat
  %2667 = bitcast i16 %2659 to bfloat
  %2668 = bitcast i16 %2660 to bfloat
  %2669 = bitcast i16 %2661 to bfloat
  %2670 = bitcast i16 %2662 to bfloat
  %2671 = insertelement <8 x bfloat> undef, bfloat %2663, i32 0
  %2672 = insertelement <8 x bfloat> %2671, bfloat %2664, i32 1
  %2673 = insertelement <8 x bfloat> %2672, bfloat %2665, i32 2
  %2674 = insertelement <8 x bfloat> %2673, bfloat %2666, i32 3
  %2675 = insertelement <8 x bfloat> %2674, bfloat %2667, i32 4
  %2676 = insertelement <8 x bfloat> %2675, bfloat %2668, i32 5
  %2677 = insertelement <8 x bfloat> %2676, bfloat %2669, i32 6
  %2678 = insertelement <8 x bfloat> %2677, bfloat %2670, i32 7
  %2679 = extractelement <8 x bfloat> %2678, i32 0
  %2680 = extractelement <8 x bfloat> %2678, i32 1
  %2681 = extractelement <8 x bfloat> %2678, i32 2
  %2682 = extractelement <8 x bfloat> %2678, i32 3
  %2683 = extractelement <8 x bfloat> %2678, i32 4
  %2684 = extractelement <8 x bfloat> %2678, i32 5
  %2685 = extractelement <8 x bfloat> %2678, i32 6
  %2686 = extractelement <8 x bfloat> %2678, i32 7
  %2687 = load <4 x i32>, ptr addrspace(3) %2056, align 16
  %2688 = extractelement <4 x i32> %2687, i32 0
  %2689 = extractelement <4 x i32> %2687, i32 1
  %2690 = extractelement <4 x i32> %2687, i32 2
  %2691 = extractelement <4 x i32> %2687, i32 3
  %2692 = insertelement <4 x i32> undef, i32 %2688, i32 0
  %2693 = insertelement <4 x i32> %2692, i32 %2689, i32 1
  %2694 = insertelement <4 x i32> %2693, i32 %2690, i32 2
  %2695 = insertelement <4 x i32> %2694, i32 %2691, i32 3
  %2696 = extractelement <4 x i32> %2695, i32 0
  %2697 = extractelement <4 x i32> %2695, i32 1
  %2698 = extractelement <4 x i32> %2695, i32 2
  %2699 = extractelement <4 x i32> %2695, i32 3
  %2700 = bitcast i32 %2696 to <2 x i16>
  %2701 = extractelement <2 x i16> %2700, i32 0
  %2702 = extractelement <2 x i16> %2700, i32 1
  %2703 = bitcast i32 %2697 to <2 x i16>
  %2704 = extractelement <2 x i16> %2703, i32 0
  %2705 = extractelement <2 x i16> %2703, i32 1
  %2706 = bitcast i32 %2698 to <2 x i16>
  %2707 = extractelement <2 x i16> %2706, i32 0
  %2708 = extractelement <2 x i16> %2706, i32 1
  %2709 = bitcast i32 %2699 to <2 x i16>
  %2710 = extractelement <2 x i16> %2709, i32 0
  %2711 = extractelement <2 x i16> %2709, i32 1
  %2712 = insertelement <8 x i16> undef, i16 %2701, i32 0
  %2713 = insertelement <8 x i16> %2712, i16 %2702, i32 1
  %2714 = insertelement <8 x i16> %2713, i16 %2704, i32 2
  %2715 = insertelement <8 x i16> %2714, i16 %2705, i32 3
  %2716 = insertelement <8 x i16> %2715, i16 %2707, i32 4
  %2717 = insertelement <8 x i16> %2716, i16 %2708, i32 5
  %2718 = insertelement <8 x i16> %2717, i16 %2710, i32 6
  %2719 = insertelement <8 x i16> %2718, i16 %2711, i32 7
  %2720 = extractelement <8 x i16> %2719, i32 0
  %2721 = extractelement <8 x i16> %2719, i32 1
  %2722 = extractelement <8 x i16> %2719, i32 2
  %2723 = extractelement <8 x i16> %2719, i32 3
  %2724 = extractelement <8 x i16> %2719, i32 4
  %2725 = extractelement <8 x i16> %2719, i32 5
  %2726 = extractelement <8 x i16> %2719, i32 6
  %2727 = extractelement <8 x i16> %2719, i32 7
  %2728 = bitcast i16 %2720 to bfloat
  %2729 = bitcast i16 %2721 to bfloat
  %2730 = bitcast i16 %2722 to bfloat
  %2731 = bitcast i16 %2723 to bfloat
  %2732 = bitcast i16 %2724 to bfloat
  %2733 = bitcast i16 %2725 to bfloat
  %2734 = bitcast i16 %2726 to bfloat
  %2735 = bitcast i16 %2727 to bfloat
  %2736 = insertelement <8 x bfloat> undef, bfloat %2728, i32 0
  %2737 = insertelement <8 x bfloat> %2736, bfloat %2729, i32 1
  %2738 = insertelement <8 x bfloat> %2737, bfloat %2730, i32 2
  %2739 = insertelement <8 x bfloat> %2738, bfloat %2731, i32 3
  %2740 = insertelement <8 x bfloat> %2739, bfloat %2732, i32 4
  %2741 = insertelement <8 x bfloat> %2740, bfloat %2733, i32 5
  %2742 = insertelement <8 x bfloat> %2741, bfloat %2734, i32 6
  %2743 = insertelement <8 x bfloat> %2742, bfloat %2735, i32 7
  %2744 = extractelement <8 x bfloat> %2743, i32 0
  %2745 = extractelement <8 x bfloat> %2743, i32 1
  %2746 = extractelement <8 x bfloat> %2743, i32 2
  %2747 = extractelement <8 x bfloat> %2743, i32 3
  %2748 = extractelement <8 x bfloat> %2743, i32 4
  %2749 = extractelement <8 x bfloat> %2743, i32 5
  %2750 = extractelement <8 x bfloat> %2743, i32 6
  %2751 = extractelement <8 x bfloat> %2743, i32 7
  %2752 = insertelement <2 x bfloat> undef, bfloat %2044, i32 0
  %2753 = insertelement <2 x bfloat> %2752, bfloat %2045, i32 1
  %2754 = bitcast <2 x bfloat> %2753 to i32
  %2755 = insertelement <2 x bfloat> undef, bfloat %2046, i32 0
  %2756 = insertelement <2 x bfloat> %2755, bfloat %2047, i32 1
  %2757 = bitcast <2 x bfloat> %2756 to i32
  %2758 = insertelement <2 x bfloat> undef, bfloat %2048, i32 0
  %2759 = insertelement <2 x bfloat> %2758, bfloat %2049, i32 1
  %2760 = bitcast <2 x bfloat> %2759 to i32
  %2761 = insertelement <2 x bfloat> undef, bfloat %2050, i32 0
  %2762 = insertelement <2 x bfloat> %2761, bfloat %2051, i32 1
  %2763 = bitcast <2 x bfloat> %2762 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %2754, i32 %2757, i32 %2760, i32 %2763, ptr addrspace(1) %1834)
  %2764 = insertelement <2 x bfloat> undef, bfloat %2114, i32 0
  %2765 = insertelement <2 x bfloat> %2764, bfloat %2115, i32 1
  %2766 = bitcast <2 x bfloat> %2765 to i32
  %2767 = insertelement <2 x bfloat> undef, bfloat %2116, i32 0
  %2768 = insertelement <2 x bfloat> %2767, bfloat %2117, i32 1
  %2769 = bitcast <2 x bfloat> %2768 to i32
  %2770 = insertelement <2 x bfloat> undef, bfloat %2118, i32 0
  %2771 = insertelement <2 x bfloat> %2770, bfloat %2119, i32 1
  %2772 = bitcast <2 x bfloat> %2771 to i32
  %2773 = insertelement <2 x bfloat> undef, bfloat %2120, i32 0
  %2774 = insertelement <2 x bfloat> %2773, bfloat %2121, i32 1
  %2775 = bitcast <2 x bfloat> %2774 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %2766, i32 %2769, i32 %2772, i32 %2775, ptr addrspace(1) %1835)
  %2776 = insertelement <2 x bfloat> undef, bfloat %2259, i32 0
  %2777 = insertelement <2 x bfloat> %2776, bfloat %2260, i32 1
  %2778 = bitcast <2 x bfloat> %2777 to i32
  %2779 = insertelement <2 x bfloat> undef, bfloat %2261, i32 0
  %2780 = insertelement <2 x bfloat> %2779, bfloat %2262, i32 1
  %2781 = bitcast <2 x bfloat> %2780 to i32
  %2782 = insertelement <2 x bfloat> undef, bfloat %2263, i32 0
  %2783 = insertelement <2 x bfloat> %2782, bfloat %2264, i32 1
  %2784 = bitcast <2 x bfloat> %2783 to i32
  %2785 = insertelement <2 x bfloat> undef, bfloat %2265, i32 0
  %2786 = insertelement <2 x bfloat> %2785, bfloat %2266, i32 1
  %2787 = bitcast <2 x bfloat> %2786 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %2778, i32 %2781, i32 %2784, i32 %2787, ptr addrspace(1) %1836)
  %2788 = insertelement <2 x bfloat> undef, bfloat %2324, i32 0
  %2789 = insertelement <2 x bfloat> %2788, bfloat %2325, i32 1
  %2790 = bitcast <2 x bfloat> %2789 to i32
  %2791 = insertelement <2 x bfloat> undef, bfloat %2326, i32 0
  %2792 = insertelement <2 x bfloat> %2791, bfloat %2327, i32 1
  %2793 = bitcast <2 x bfloat> %2792 to i32
  %2794 = insertelement <2 x bfloat> undef, bfloat %2328, i32 0
  %2795 = insertelement <2 x bfloat> %2794, bfloat %2329, i32 1
  %2796 = bitcast <2 x bfloat> %2795 to i32
  %2797 = insertelement <2 x bfloat> undef, bfloat %2330, i32 0
  %2798 = insertelement <2 x bfloat> %2797, bfloat %2331, i32 1
  %2799 = bitcast <2 x bfloat> %2798 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %2790, i32 %2793, i32 %2796, i32 %2799, ptr addrspace(1) %1837)
  %2800 = insertelement <2 x bfloat> undef, bfloat %2469, i32 0
  %2801 = insertelement <2 x bfloat> %2800, bfloat %2470, i32 1
  %2802 = bitcast <2 x bfloat> %2801 to i32
  %2803 = insertelement <2 x bfloat> undef, bfloat %2471, i32 0
  %2804 = insertelement <2 x bfloat> %2803, bfloat %2472, i32 1
  %2805 = bitcast <2 x bfloat> %2804 to i32
  %2806 = insertelement <2 x bfloat> undef, bfloat %2473, i32 0
  %2807 = insertelement <2 x bfloat> %2806, bfloat %2474, i32 1
  %2808 = bitcast <2 x bfloat> %2807 to i32
  %2809 = insertelement <2 x bfloat> undef, bfloat %2475, i32 0
  %2810 = insertelement <2 x bfloat> %2809, bfloat %2476, i32 1
  %2811 = bitcast <2 x bfloat> %2810 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %2802, i32 %2805, i32 %2808, i32 %2811, ptr addrspace(1) %1838)
  %2812 = insertelement <2 x bfloat> undef, bfloat %2534, i32 0
  %2813 = insertelement <2 x bfloat> %2812, bfloat %2535, i32 1
  %2814 = bitcast <2 x bfloat> %2813 to i32
  %2815 = insertelement <2 x bfloat> undef, bfloat %2536, i32 0
  %2816 = insertelement <2 x bfloat> %2815, bfloat %2537, i32 1
  %2817 = bitcast <2 x bfloat> %2816 to i32
  %2818 = insertelement <2 x bfloat> undef, bfloat %2538, i32 0
  %2819 = insertelement <2 x bfloat> %2818, bfloat %2539, i32 1
  %2820 = bitcast <2 x bfloat> %2819 to i32
  %2821 = insertelement <2 x bfloat> undef, bfloat %2540, i32 0
  %2822 = insertelement <2 x bfloat> %2821, bfloat %2541, i32 1
  %2823 = bitcast <2 x bfloat> %2822 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %2814, i32 %2817, i32 %2820, i32 %2823, ptr addrspace(1) %1839)
  %2824 = insertelement <2 x bfloat> undef, bfloat %2679, i32 0
  %2825 = insertelement <2 x bfloat> %2824, bfloat %2680, i32 1
  %2826 = bitcast <2 x bfloat> %2825 to i32
  %2827 = insertelement <2 x bfloat> undef, bfloat %2681, i32 0
  %2828 = insertelement <2 x bfloat> %2827, bfloat %2682, i32 1
  %2829 = bitcast <2 x bfloat> %2828 to i32
  %2830 = insertelement <2 x bfloat> undef, bfloat %2683, i32 0
  %2831 = insertelement <2 x bfloat> %2830, bfloat %2684, i32 1
  %2832 = bitcast <2 x bfloat> %2831 to i32
  %2833 = insertelement <2 x bfloat> undef, bfloat %2685, i32 0
  %2834 = insertelement <2 x bfloat> %2833, bfloat %2686, i32 1
  %2835 = bitcast <2 x bfloat> %2834 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %2826, i32 %2829, i32 %2832, i32 %2835, ptr addrspace(1) %1840)
  %2836 = insertelement <2 x bfloat> undef, bfloat %2744, i32 0
  %2837 = insertelement <2 x bfloat> %2836, bfloat %2745, i32 1
  %2838 = bitcast <2 x bfloat> %2837 to i32
  %2839 = insertelement <2 x bfloat> undef, bfloat %2746, i32 0
  %2840 = insertelement <2 x bfloat> %2839, bfloat %2747, i32 1
  %2841 = bitcast <2 x bfloat> %2840 to i32
  %2842 = insertelement <2 x bfloat> undef, bfloat %2748, i32 0
  %2843 = insertelement <2 x bfloat> %2842, bfloat %2749, i32 1
  %2844 = bitcast <2 x bfloat> %2843 to i32
  %2845 = insertelement <2 x bfloat> undef, bfloat %2750, i32 0
  %2846 = insertelement <2 x bfloat> %2845, bfloat %2751, i32 1
  %2847 = bitcast <2 x bfloat> %2846 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %2838, i32 %2841, i32 %2844, i32 %2847, ptr addrspace(1) %1841)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_180_impl(ptr, ptr, ptr, ptr, ptr, ptr) #4

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #5

declare float @__nv_rsqrtf(float)

define ptx_kernel void @fusion_180(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(262144) %arg1, ptr noalias align 128 dereferenceable(3145728) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(262144) %arg4) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %6 = addrspacecast ptr null to ptr addrspace(1)
  %7 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %8 = sext i32 %7 to i64
  %9 = mul i64 %8, 12288
  %10 = add i64 %9, 11264
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
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %5 = udiv i32 %4, 6
  %6 = mul i32 %3, 4
  %7 = mul i32 %4, 512
  %8 = add i32 %6, %7
  %9 = urem i32 %4, 6
  %10 = mul i32 %9, 512
  %11 = add i32 %10, %6
  %12 = call bfloat @fused_convert_param_0_518(ptr %0, i32 %5, i32 %11)
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
  %23 = call bfloat @fused_convert_param_0_518(ptr %0, i32 %5, i32 %22)
  %24 = fmul float %13, %21
  %25 = fpext bfloat %23 to float
  %26 = fmul float %24, %25
  %27 = fptrunc float %26 to bfloat
  %28 = insertelement <4 x bfloat> zeroinitializer, bfloat %27, i64 0
  %29 = add i32 %11, 1
  %30 = call bfloat @fused_convert_param_0_518(ptr %0, i32 %5, i32 %29)
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
  %41 = call bfloat @fused_convert_param_0_518(ptr %0, i32 %5, i32 %40)
  %42 = fmul float %31, %39
  %43 = fpext bfloat %41 to float
  %44 = fmul float %42, %43
  %45 = fptrunc float %44 to bfloat
  %46 = insertelement <4 x bfloat> %28, bfloat %45, i64 1
  %47 = add i32 %11, 2
  %48 = call bfloat @fused_convert_param_0_518(ptr %0, i32 %5, i32 %47)
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
  %59 = call bfloat @fused_convert_param_0_518(ptr %0, i32 %5, i32 %58)
  %60 = fmul float %49, %57
  %61 = fpext bfloat %59 to float
  %62 = fmul float %60, %61
  %63 = fptrunc float %62 to bfloat
  %64 = insertelement <4 x bfloat> %46, bfloat %63, i64 2
  %65 = add i32 %11, 3
  %66 = call bfloat @fused_convert_param_0_518(ptr %0, i32 %5, i32 %65)
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
  %77 = call bfloat @fused_convert_param_0_518(ptr %0, i32 %5, i32 %76)
  %78 = fmul float %67, %75
  %79 = fpext bfloat %77 to float
  %80 = fmul float %78, %79
  %81 = fptrunc float %80 to bfloat
  %82 = insertelement <4 x bfloat> %64, bfloat %81, i64 3
  %83 = getelementptr inbounds bfloat, ptr %1, i32 %8
  store <4 x bfloat> %82, ptr %83, align 8
  ret void
}

define internal bfloat @fused_convert_param_0_518(ptr noalias %0, i32 %1, i32 %2) {
  %4 = mul i32 %1, 6144
  %5 = add i32 %4, %2
  %6 = getelementptr inbounds bfloat, ptr %0, i32 %5
  %7 = load bfloat, ptr %6, align 2, !invariant.load !3
  ret bfloat %7
}

declare float @__nv_fast_expf(float)

declare ptx_kernel void @fusion_178_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_178(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(262144) %arg2, ptr noalias align 128 dereferenceable(3145728) %arg3, ptr noalias align 128 dereferenceable(262144) %arg4, ptr noalias align 128 dereferenceable(262144) %arg5) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %6 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %7 = addrspacecast ptr null to ptr addrspace(1)
  %8 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %9 = sext i32 %8 to i64
  %10 = mul i64 %9, 12288
  %11 = add i64 %10, 10240
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
  %152 = add i64 %10, 11264
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

declare ptx_kernel void @fusion_176_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_176(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(262144) %arg1, ptr noalias align 128 dereferenceable(3145728) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(262144) %arg4, ptr noalias align 128 dereferenceable(262144) %arg5, ptr noalias align 128 dereferenceable(262144) %arg6) #6 {
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
  %11 = mul i64 %10, 12288
  %12 = add i64 %11, 9216
  %13 = getelementptr bfloat, ptr addrspace(1) %3, i64 %12
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
  %99 = mul i64 %10, 1024
  %100 = getelementptr bfloat, ptr addrspace(1) %2, i64 %99
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
  %153 = add i64 %11, 10240
  %154 = getelementptr bfloat, ptr addrspace(1) %3, i64 %153
  %155 = getelementptr bfloat, ptr addrspace(1) %154, i64 %45
  %156 = getelementptr bfloat, ptr addrspace(1) %154, i64 %46
  %157 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %155)
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
  %174 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %156)
  %175 = extractvalue { i32, i32, i32, i32 } %174, 0
  %176 = bitcast i32 %175 to <2 x bfloat>
  %177 = extractvalue { i32, i32, i32, i32 } %174, 1
  %178 = bitcast i32 %177 to <2 x bfloat>
  %179 = extractvalue { i32, i32, i32, i32 } %174, 2
  %180 = bitcast i32 %179 to <2 x bfloat>
  %181 = extractvalue { i32, i32, i32, i32 } %174, 3
  %182 = bitcast i32 %181 to <2 x bfloat>
  %183 = extractelement <2 x bfloat> %176, i32 0
  %184 = extractelement <2 x bfloat> %176, i32 1
  %185 = extractelement <2 x bfloat> %178, i32 0
  %186 = extractelement <2 x bfloat> %178, i32 1
  %187 = extractelement <2 x bfloat> %180, i32 0
  %188 = extractelement <2 x bfloat> %180, i32 1
  %189 = extractelement <2 x bfloat> %182, i32 0
  %190 = extractelement <2 x bfloat> %182, i32 1
  %191 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %166)
  %192 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %167)
  %193 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %168)
  %194 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %169)
  %195 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %170)
  %196 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %171)
  %197 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %172)
  %198 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %173)
  %199 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %183)
  %200 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %184)
  %201 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %185)
  %202 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %186)
  %203 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %187)
  %204 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188)
  %205 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189)
  %206 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190)
  %207 = getelementptr bfloat, ptr addrspace(1) %6, i64 %99
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
  %260 = add i64 %11, 11264
  %261 = getelementptr bfloat, ptr addrspace(1) %3, i64 %260
  %262 = getelementptr bfloat, ptr addrspace(1) %261, i64 %45
  %263 = getelementptr bfloat, ptr addrspace(1) %261, i64 %46
  %264 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %262)
  %265 = extractvalue { i32, i32, i32, i32 } %264, 0
  %266 = bitcast i32 %265 to <2 x bfloat>
  %267 = extractvalue { i32, i32, i32, i32 } %264, 1
  %268 = bitcast i32 %267 to <2 x bfloat>
  %269 = extractvalue { i32, i32, i32, i32 } %264, 2
  %270 = bitcast i32 %269 to <2 x bfloat>
  %271 = extractvalue { i32, i32, i32, i32 } %264, 3
  %272 = bitcast i32 %271 to <2 x bfloat>
  %273 = extractelement <2 x bfloat> %266, i32 0
  %274 = extractelement <2 x bfloat> %266, i32 1
  %275 = extractelement <2 x bfloat> %268, i32 0
  %276 = extractelement <2 x bfloat> %268, i32 1
  %277 = extractelement <2 x bfloat> %270, i32 0
  %278 = extractelement <2 x bfloat> %270, i32 1
  %279 = extractelement <2 x bfloat> %272, i32 0
  %280 = extractelement <2 x bfloat> %272, i32 1
  %281 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %263)
  %282 = extractvalue { i32, i32, i32, i32 } %281, 0
  %283 = bitcast i32 %282 to <2 x bfloat>
  %284 = extractvalue { i32, i32, i32, i32 } %281, 1
  %285 = bitcast i32 %284 to <2 x bfloat>
  %286 = extractvalue { i32, i32, i32, i32 } %281, 2
  %287 = bitcast i32 %286 to <2 x bfloat>
  %288 = extractvalue { i32, i32, i32, i32 } %281, 3
  %289 = bitcast i32 %288 to <2 x bfloat>
  %290 = extractelement <2 x bfloat> %283, i32 0
  %291 = extractelement <2 x bfloat> %283, i32 1
  %292 = extractelement <2 x bfloat> %285, i32 0
  %293 = extractelement <2 x bfloat> %285, i32 1
  %294 = extractelement <2 x bfloat> %287, i32 0
  %295 = extractelement <2 x bfloat> %287, i32 1
  %296 = extractelement <2 x bfloat> %289, i32 0
  %297 = extractelement <2 x bfloat> %289, i32 1
  %298 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %273)
  %299 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %274)
  %300 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %275)
  %301 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %276)
  %302 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %277)
  %303 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %278)
  %304 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %279)
  %305 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %280)
  %306 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %290)
  %307 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %291)
  %308 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %292)
  %309 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %293)
  %310 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %294)
  %311 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295)
  %312 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296)
  %313 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297)
  %314 = getelementptr bfloat, ptr addrspace(1) %5, i64 %99
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
  %382 = fadd float %313, %366
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
  %398 = fadd float %259, %382
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
  %414 = fadd float %206, %398
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
  %430 = fadd float %152, %414
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
  %446 = fadd float %98, %430
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
  %462 = fmul float %446, %446
  %463 = fadd float %447, %448
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
  %477 = fadd float %476, %462
  %478 = bitcast float %477 to i32
  %479 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %478, i32 16, i32 31)
  %480 = bitcast i32 %479 to float
  %481 = fadd float %477, %480
  %482 = bitcast float %481 to i32
  %483 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %482, i32 8, i32 31)
  %484 = bitcast i32 %483 to float
  %485 = fadd float %481, %484
  %486 = bitcast float %485 to i32
  %487 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %486, i32 4, i32 31)
  %488 = bitcast i32 %487 to float
  %489 = fadd float %485, %488
  %490 = bitcast float %489 to i32
  %491 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %490, i32 2, i32 31)
  %492 = bitcast i32 %491 to float
  %493 = fadd float %489, %492
  %494 = bitcast float %493 to i32
  %495 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %494, i32 1, i32 31)
  %496 = bitcast i32 %495 to float
  %497 = fadd float %493, %496
  %498 = urem i32 %15, 32
  %499 = urem i32 %16, 2
  %500 = icmp eq i32 %498, 0
  %501 = and i1 true, %500
  %502 = add i32 0, %499
  %503 = getelementptr float, ptr addrspace(3) @global_smem, i32 %502
  %504 = insertelement <1 x float> undef, float %497, i32 0
  %505 = extractelement <1 x float> %504, i32 0
  %506 = bitcast float %505 to i32
  %507 = insertelement <1 x i32> undef, i32 %506, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %503, <1 x i32> %507, i1 %501)
  call void @llvm.nvvm.barrier0()
  %508 = icmp slt i32 %14, 2
  %509 = getelementptr float, ptr addrspace(3) @global_smem, i32 %14
  %510 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %509, i1 %508)
  %511 = insertelement <1 x i32> undef, i32 %510, i32 0
  %512 = extractelement <1 x i32> %511, i32 0
  %513 = bitcast i32 %512 to float
  %514 = insertelement <1 x float> undef, float %513, i32 0
  %515 = extractelement <1 x float> %514, i32 0
  %516 = bitcast float %515 to i32
  %517 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %516, i32 1, i32 31)
  %518 = bitcast i32 %517 to float
  %519 = fadd float %515, %518
  %520 = urem i32 %15, 2
  %521 = icmp eq i32 %520, 0
  %522 = and i1 %508, %521
  %523 = insertelement <1 x float> undef, float %519, i32 0
  %524 = extractelement <1 x float> %523, i32 0
  %525 = bitcast float %524 to i32
  %526 = insertelement <1 x i32> undef, i32 %525, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %509, <1 x i32> %526, i1 %522)
  call void @llvm.nvvm.barrier0()
  %527 = load float, ptr addrspace(3) @global_smem, align 4
  %528 = fmul float %527, 0x3F50000000000000
  %529 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %530 = bitcast i32 %529 to <1 x float>
  %531 = extractelement <1 x float> %530, i32 0
  %532 = fadd float %528, %531
  %533 = call float @__nv_rsqrtf(float %532)
  %534 = fmul float %431, %533
  %535 = fmul float %432, %533
  %536 = fmul float %433, %533
  %537 = fmul float %434, %533
  %538 = fmul float %435, %533
  %539 = fmul float %436, %533
  %540 = fmul float %437, %533
  %541 = fmul float %438, %533
  %542 = fmul float %439, %533
  %543 = fmul float %440, %533
  %544 = fmul float %441, %533
  %545 = fmul float %442, %533
  %546 = fmul float %443, %533
  %547 = fmul float %444, %533
  %548 = fmul float %445, %533
  %549 = fmul float %446, %533
  %550 = getelementptr bfloat, ptr addrspace(1) %4, i64 %45
  %551 = getelementptr bfloat, ptr addrspace(1) %4, i64 %46
  %552 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %550)
  %553 = extractvalue { i32, i32, i32, i32 } %552, 0
  %554 = bitcast i32 %553 to <2 x bfloat>
  %555 = extractvalue { i32, i32, i32, i32 } %552, 1
  %556 = bitcast i32 %555 to <2 x bfloat>
  %557 = extractvalue { i32, i32, i32, i32 } %552, 2
  %558 = bitcast i32 %557 to <2 x bfloat>
  %559 = extractvalue { i32, i32, i32, i32 } %552, 3
  %560 = bitcast i32 %559 to <2 x bfloat>
  %561 = extractelement <2 x bfloat> %554, i32 0
  %562 = extractelement <2 x bfloat> %554, i32 1
  %563 = extractelement <2 x bfloat> %556, i32 0
  %564 = extractelement <2 x bfloat> %556, i32 1
  %565 = extractelement <2 x bfloat> %558, i32 0
  %566 = extractelement <2 x bfloat> %558, i32 1
  %567 = extractelement <2 x bfloat> %560, i32 0
  %568 = extractelement <2 x bfloat> %560, i32 1
  %569 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %551)
  %570 = extractvalue { i32, i32, i32, i32 } %569, 0
  %571 = bitcast i32 %570 to <2 x bfloat>
  %572 = extractvalue { i32, i32, i32, i32 } %569, 1
  %573 = bitcast i32 %572 to <2 x bfloat>
  %574 = extractvalue { i32, i32, i32, i32 } %569, 2
  %575 = bitcast i32 %574 to <2 x bfloat>
  %576 = extractvalue { i32, i32, i32, i32 } %569, 3
  %577 = bitcast i32 %576 to <2 x bfloat>
  %578 = extractelement <2 x bfloat> %571, i32 0
  %579 = extractelement <2 x bfloat> %571, i32 1
  %580 = extractelement <2 x bfloat> %573, i32 0
  %581 = extractelement <2 x bfloat> %573, i32 1
  %582 = extractelement <2 x bfloat> %575, i32 0
  %583 = extractelement <2 x bfloat> %575, i32 1
  %584 = extractelement <2 x bfloat> %577, i32 0
  %585 = extractelement <2 x bfloat> %577, i32 1
  %586 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %561)
  %587 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %562)
  %588 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %563)
  %589 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %564)
  %590 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %565)
  %591 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %566)
  %592 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %567)
  %593 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %568)
  %594 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %578)
  %595 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %579)
  %596 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %580)
  %597 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %581)
  %598 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %582)
  %599 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %583)
  %600 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %584)
  %601 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %585)
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
  %617 = fmul float %549, %601
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
  %633 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %617)
  %634 = getelementptr bfloat, ptr addrspace(1) %7, i64 %99
  %635 = getelementptr bfloat, ptr addrspace(1) %634, i64 %45
  %636 = getelementptr bfloat, ptr addrspace(1) %634, i64 %46
  %637 = insertelement <2 x bfloat> undef, bfloat %618, i32 0
  %638 = insertelement <2 x bfloat> %637, bfloat %619, i32 1
  %639 = bitcast <2 x bfloat> %638 to i32
  %640 = insertelement <2 x bfloat> undef, bfloat %620, i32 0
  %641 = insertelement <2 x bfloat> %640, bfloat %621, i32 1
  %642 = bitcast <2 x bfloat> %641 to i32
  %643 = insertelement <2 x bfloat> undef, bfloat %622, i32 0
  %644 = insertelement <2 x bfloat> %643, bfloat %623, i32 1
  %645 = bitcast <2 x bfloat> %644 to i32
  %646 = insertelement <2 x bfloat> undef, bfloat %624, i32 0
  %647 = insertelement <2 x bfloat> %646, bfloat %625, i32 1
  %648 = bitcast <2 x bfloat> %647 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %639, i32 %642, i32 %645, i32 %648, ptr addrspace(1) %635)
  %649 = insertelement <2 x bfloat> undef, bfloat %626, i32 0
  %650 = insertelement <2 x bfloat> %649, bfloat %627, i32 1
  %651 = bitcast <2 x bfloat> %650 to i32
  %652 = insertelement <2 x bfloat> undef, bfloat %628, i32 0
  %653 = insertelement <2 x bfloat> %652, bfloat %629, i32 1
  %654 = bitcast <2 x bfloat> %653 to i32
  %655 = insertelement <2 x bfloat> undef, bfloat %630, i32 0
  %656 = insertelement <2 x bfloat> %655, bfloat %631, i32 1
  %657 = bitcast <2 x bfloat> %656 to i32
  %658 = insertelement <2 x bfloat> undef, bfloat %632, i32 0
  %659 = insertelement <2 x bfloat> %658, bfloat %633, i32 1
  %660 = bitcast <2 x bfloat> %659 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %651, i32 %654, i32 %657, i32 %660, ptr addrspace(1) %636)
  ret void

entry:                                            ; No predecessors!
  ret void
}

define ptx_kernel void @loop_add_fusion(ptr noalias align 128 dereferenceable(3145728) %0, ptr noalias align 128 dereferenceable(262144) %1, ptr noalias align 128 dereferenceable(262144) %2, ptr noalias align 128 dereferenceable(262144) %3, ptr noalias align 128 dereferenceable(262144) %4, ptr noalias align 128 dereferenceable(524288) %5) #0 {
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %9 = udiv i32 %8, 8
  %10 = urem i32 %8, 8
  %11 = mul i32 %10, 128
  %12 = add i32 %11, %7
  %13 = mul i32 %8, 128
  %14 = add i32 %13, %7
  %15 = getelementptr inbounds bfloat, ptr %3, i32 %14
  %16 = load bfloat, ptr %15, align 2, !invariant.load !3
  %17 = getelementptr inbounds bfloat, ptr %4, i32 %14
  %18 = load bfloat, ptr %17, align 2, !invariant.load !3
  %19 = add i32 %12, 11264
  %20 = call float @fused_add_convert_611_20(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, i32 %9, i32 %19)
  %21 = fpext bfloat %16 to float
  %22 = fpext bfloat %18 to float
  %23 = fadd float %20, %21
  %24 = getelementptr inbounds bfloat, ptr %2, i32 %14
  %25 = load bfloat, ptr %24, align 2, !invariant.load !3
  %26 = add i32 %12, 10240
  %27 = call float @fused_add_convert_611_20(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, i32 %9, i32 %26)
  %28 = fadd float %22, %23
  %29 = fpext bfloat %25 to float
  %30 = fadd float %27, %28
  %31 = getelementptr inbounds bfloat, ptr %1, i32 %14
  %32 = load bfloat, ptr %31, align 2, !invariant.load !3
  %33 = add i32 %12, 9216
  %34 = call float @fused_add_convert_611_20(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, i32 %9, i32 %33)
  %35 = fadd float %29, %30
  %36 = fpext bfloat %32 to float
  %37 = fadd float %34, %35
  %38 = add i32 %12, 8192
  %39 = call float @fused_add_convert_611_20(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, i32 %9, i32 %38)
  %40 = fadd float %36, %37
  %41 = fadd float %39, %40
  %42 = getelementptr inbounds float, ptr %5, i32 %14
  store float %41, ptr %42, align 4
  ret void
}

define internal float @fused_add_convert_611_20(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, i32 %5, i32 %6) {
  %8 = mul i32 %5, 12288
  %9 = add i32 %8, %6
  %10 = getelementptr inbounds bfloat, ptr %0, i32 %9
  %11 = load bfloat, ptr %10, align 2, !invariant.load !3
  %12 = fpext bfloat %11 to float
  ret float %12
}

declare ptx_kernel void @fusion_174_impl(ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_174(ptr noalias align 128 dereferenceable(524288) %arg0, ptr noalias align 16 dereferenceable(4) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(262144) %arg3) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr null to ptr addrspace(1)
  %6 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %7 = sext i32 %6 to i64
  %8 = mul i64 %7, 1024
  %9 = getelementptr float, ptr addrspace(1) %1, i64 %8
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %11 = urem i32 %10, 32
  %12 = udiv i32 %10, 32
  %13 = and i32 %11, 1
  %14 = icmp eq i32 %13, 0
  %15 = select i1 %14, i32 0, i32 8
  %16 = xor i32 0, %15
  %17 = and i32 %11, 2
  %18 = icmp eq i32 %17, 0
  %19 = select i1 %18, i32 0, i32 16
  %20 = xor i32 %16, %19
  %21 = and i32 %11, 4
  %22 = icmp eq i32 %21, 0
  %23 = select i1 %22, i32 0, i32 32
  %24 = xor i32 %20, %23
  %25 = and i32 %11, 8
  %26 = icmp eq i32 %25, 0
  %27 = select i1 %26, i32 0, i32 64
  %28 = xor i32 %24, %27
  %29 = and i32 %11, 16
  %30 = icmp eq i32 %29, 0
  %31 = select i1 %30, i32 0, i32 128
  %32 = xor i32 %28, %31
  %33 = and i32 %12, 1
  %34 = icmp eq i32 %33, 0
  %35 = select i1 %34, i32 0, i32 256
  %36 = xor i32 %32, %35
  %37 = xor i32 %36, 0
  %38 = xor i32 %36, 4
  %39 = xor i32 %36, 512
  %40 = xor i32 %36, 516
  %41 = add i32 %37, 0
  %42 = add i32 %38, 0
  %43 = add i32 %39, 0
  %44 = add i32 %40, 0
  %45 = sext i32 %41 to i64
  %46 = sext i32 %42 to i64
  %47 = sext i32 %43 to i64
  %48 = sext i32 %44 to i64
  %49 = getelementptr float, ptr addrspace(1) %9, i64 %45
  %50 = getelementptr float, ptr addrspace(1) %9, i64 %46
  %51 = getelementptr float, ptr addrspace(1) %9, i64 %47
  %52 = getelementptr float, ptr addrspace(1) %9, i64 %48
  %53 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %49)
  %54 = extractvalue { i32, i32, i32, i32 } %53, 0
  %55 = bitcast i32 %54 to <1 x float>
  %56 = extractvalue { i32, i32, i32, i32 } %53, 1
  %57 = bitcast i32 %56 to <1 x float>
  %58 = extractvalue { i32, i32, i32, i32 } %53, 2
  %59 = bitcast i32 %58 to <1 x float>
  %60 = extractvalue { i32, i32, i32, i32 } %53, 3
  %61 = bitcast i32 %60 to <1 x float>
  %62 = extractelement <1 x float> %55, i32 0
  %63 = extractelement <1 x float> %57, i32 0
  %64 = extractelement <1 x float> %59, i32 0
  %65 = extractelement <1 x float> %61, i32 0
  %66 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %50)
  %67 = extractvalue { i32, i32, i32, i32 } %66, 0
  %68 = bitcast i32 %67 to <1 x float>
  %69 = extractvalue { i32, i32, i32, i32 } %66, 1
  %70 = bitcast i32 %69 to <1 x float>
  %71 = extractvalue { i32, i32, i32, i32 } %66, 2
  %72 = bitcast i32 %71 to <1 x float>
  %73 = extractvalue { i32, i32, i32, i32 } %66, 3
  %74 = bitcast i32 %73 to <1 x float>
  %75 = extractelement <1 x float> %68, i32 0
  %76 = extractelement <1 x float> %70, i32 0
  %77 = extractelement <1 x float> %72, i32 0
  %78 = extractelement <1 x float> %74, i32 0
  %79 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %51)
  %80 = extractvalue { i32, i32, i32, i32 } %79, 0
  %81 = bitcast i32 %80 to <1 x float>
  %82 = extractvalue { i32, i32, i32, i32 } %79, 1
  %83 = bitcast i32 %82 to <1 x float>
  %84 = extractvalue { i32, i32, i32, i32 } %79, 2
  %85 = bitcast i32 %84 to <1 x float>
  %86 = extractvalue { i32, i32, i32, i32 } %79, 3
  %87 = bitcast i32 %86 to <1 x float>
  %88 = extractelement <1 x float> %81, i32 0
  %89 = extractelement <1 x float> %83, i32 0
  %90 = extractelement <1 x float> %85, i32 0
  %91 = extractelement <1 x float> %87, i32 0
  %92 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %52)
  %93 = extractvalue { i32, i32, i32, i32 } %92, 0
  %94 = bitcast i32 %93 to <1 x float>
  %95 = extractvalue { i32, i32, i32, i32 } %92, 1
  %96 = bitcast i32 %95 to <1 x float>
  %97 = extractvalue { i32, i32, i32, i32 } %92, 2
  %98 = bitcast i32 %97 to <1 x float>
  %99 = extractvalue { i32, i32, i32, i32 } %92, 3
  %100 = bitcast i32 %99 to <1 x float>
  %101 = extractelement <1 x float> %94, i32 0
  %102 = extractelement <1 x float> %96, i32 0
  %103 = extractelement <1 x float> %98, i32 0
  %104 = extractelement <1 x float> %100, i32 0
  %105 = fmul float %62, %62
  %106 = fmul float %63, %63
  %107 = fmul float %64, %64
  %108 = fmul float %65, %65
  %109 = fmul float %75, %75
  %110 = fmul float %76, %76
  %111 = fmul float %77, %77
  %112 = fmul float %78, %78
  %113 = fmul float %88, %88
  %114 = fmul float %89, %89
  %115 = fmul float %90, %90
  %116 = fmul float %91, %91
  %117 = fmul float %101, %101
  %118 = fmul float %102, %102
  %119 = fmul float %103, %103
  %120 = fmul float %104, %104
  %121 = fadd float %105, %106
  %122 = fadd float %121, %107
  %123 = fadd float %122, %108
  %124 = fadd float %123, %109
  %125 = fadd float %124, %110
  %126 = fadd float %125, %111
  %127 = fadd float %126, %112
  %128 = fadd float %127, %113
  %129 = fadd float %128, %114
  %130 = fadd float %129, %115
  %131 = fadd float %130, %116
  %132 = fadd float %131, %117
  %133 = fadd float %132, %118
  %134 = fadd float %133, %119
  %135 = fadd float %134, %120
  %136 = bitcast float %135 to i32
  %137 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %136, i32 16, i32 31)
  %138 = bitcast i32 %137 to float
  %139 = fadd float %135, %138
  %140 = bitcast float %139 to i32
  %141 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %140, i32 8, i32 31)
  %142 = bitcast i32 %141 to float
  %143 = fadd float %139, %142
  %144 = bitcast float %143 to i32
  %145 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %144, i32 4, i32 31)
  %146 = bitcast i32 %145 to float
  %147 = fadd float %143, %146
  %148 = bitcast float %147 to i32
  %149 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %148, i32 2, i32 31)
  %150 = bitcast i32 %149 to float
  %151 = fadd float %147, %150
  %152 = bitcast float %151 to i32
  %153 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %152, i32 1, i32 31)
  %154 = bitcast i32 %153 to float
  %155 = fadd float %151, %154
  %156 = urem i32 %11, 32
  %157 = urem i32 %12, 2
  %158 = icmp eq i32 %156, 0
  %159 = and i1 true, %158
  %160 = add i32 0, %157
  %161 = getelementptr float, ptr addrspace(3) @global_smem, i32 %160
  %162 = insertelement <1 x float> undef, float %155, i32 0
  %163 = extractelement <1 x float> %162, i32 0
  %164 = bitcast float %163 to i32
  %165 = insertelement <1 x i32> undef, i32 %164, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %161, <1 x i32> %165, i1 %159)
  call void @llvm.nvvm.barrier0()
  %166 = icmp slt i32 %10, 2
  %167 = getelementptr float, ptr addrspace(3) @global_smem, i32 %10
  %168 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %167, i1 %166)
  %169 = insertelement <1 x i32> undef, i32 %168, i32 0
  %170 = extractelement <1 x i32> %169, i32 0
  %171 = bitcast i32 %170 to float
  %172 = insertelement <1 x float> undef, float %171, i32 0
  %173 = extractelement <1 x float> %172, i32 0
  %174 = bitcast float %173 to i32
  %175 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %174, i32 1, i32 31)
  %176 = bitcast i32 %175 to float
  %177 = fadd float %173, %176
  %178 = urem i32 %11, 2
  %179 = icmp eq i32 %178, 0
  %180 = and i1 %166, %179
  %181 = insertelement <1 x float> undef, float %177, i32 0
  %182 = extractelement <1 x float> %181, i32 0
  %183 = bitcast float %182 to i32
  %184 = insertelement <1 x i32> undef, i32 %183, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %167, <1 x i32> %184, i1 %180)
  call void @llvm.nvvm.barrier0()
  %185 = load float, ptr addrspace(3) @global_smem, align 4
  %186 = fmul float %185, 0x3F50000000000000
  %187 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %2)
  %188 = bitcast i32 %187 to <1 x float>
  %189 = extractelement <1 x float> %188, i32 0
  %190 = fadd float %186, %189
  %191 = call float @__nv_rsqrtf(float %190)
  %192 = fmul float %62, %191
  %193 = fmul float %63, %191
  %194 = fmul float %64, %191
  %195 = fmul float %65, %191
  %196 = fmul float %75, %191
  %197 = fmul float %76, %191
  %198 = fmul float %77, %191
  %199 = fmul float %78, %191
  %200 = fmul float %88, %191
  %201 = fmul float %89, %191
  %202 = fmul float %90, %191
  %203 = fmul float %91, %191
  %204 = fmul float %101, %191
  %205 = fmul float %102, %191
  %206 = fmul float %103, %191
  %207 = fmul float %104, %191
  %208 = getelementptr bfloat, ptr addrspace(1) %3, i64 %45
  %209 = getelementptr bfloat, ptr addrspace(1) %3, i64 %47
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
  %260 = fmul float %192, %244
  %261 = fmul float %193, %245
  %262 = fmul float %194, %246
  %263 = fmul float %195, %247
  %264 = fmul float %196, %248
  %265 = fmul float %197, %249
  %266 = fmul float %198, %250
  %267 = fmul float %199, %251
  %268 = fmul float %200, %252
  %269 = fmul float %201, %253
  %270 = fmul float %202, %254
  %271 = fmul float %203, %255
  %272 = fmul float %204, %256
  %273 = fmul float %205, %257
  %274 = fmul float %206, %258
  %275 = fmul float %207, %259
  %276 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %260)
  %277 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %261)
  %278 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %262)
  %279 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %263)
  %280 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %264)
  %281 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %265)
  %282 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %266)
  %283 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %267)
  %284 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %268)
  %285 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %269)
  %286 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %270)
  %287 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %271)
  %288 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %272)
  %289 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %273)
  %290 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %274)
  %291 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %275)
  %292 = getelementptr bfloat, ptr addrspace(1) %4, i64 %8
  %293 = getelementptr bfloat, ptr addrspace(1) %292, i64 %45
  %294 = getelementptr bfloat, ptr addrspace(1) %292, i64 %47
  %295 = insertelement <2 x bfloat> undef, bfloat %276, i32 0
  %296 = insertelement <2 x bfloat> %295, bfloat %277, i32 1
  %297 = bitcast <2 x bfloat> %296 to i32
  %298 = insertelement <2 x bfloat> undef, bfloat %278, i32 0
  %299 = insertelement <2 x bfloat> %298, bfloat %279, i32 1
  %300 = bitcast <2 x bfloat> %299 to i32
  %301 = insertelement <2 x bfloat> undef, bfloat %280, i32 0
  %302 = insertelement <2 x bfloat> %301, bfloat %281, i32 1
  %303 = bitcast <2 x bfloat> %302 to i32
  %304 = insertelement <2 x bfloat> undef, bfloat %282, i32 0
  %305 = insertelement <2 x bfloat> %304, bfloat %283, i32 1
  %306 = bitcast <2 x bfloat> %305 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %297, i32 %300, i32 %303, i32 %306, ptr addrspace(1) %293)
  %307 = insertelement <2 x bfloat> undef, bfloat %284, i32 0
  %308 = insertelement <2 x bfloat> %307, bfloat %285, i32 1
  %309 = bitcast <2 x bfloat> %308 to i32
  %310 = insertelement <2 x bfloat> undef, bfloat %286, i32 0
  %311 = insertelement <2 x bfloat> %310, bfloat %287, i32 1
  %312 = bitcast <2 x bfloat> %311 to i32
  %313 = insertelement <2 x bfloat> undef, bfloat %288, i32 0
  %314 = insertelement <2 x bfloat> %313, bfloat %289, i32 1
  %315 = bitcast <2 x bfloat> %314 to i32
  %316 = insertelement <2 x bfloat> undef, bfloat %290, i32 0
  %317 = insertelement <2 x bfloat> %316, bfloat %291, i32 1
  %318 = bitcast <2 x bfloat> %317 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %309, i32 %312, i32 %315, i32 %318, ptr addrspace(1) %294)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_172_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_172(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(524288) %arg1, ptr noalias align 128 dereferenceable(262144) %arg2, ptr noalias align 128 dereferenceable(3145728) %arg3, ptr noalias align 16 dereferenceable(2048) %arg4, ptr noalias align 128 dereferenceable(262144) %arg5) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %6 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %7 = addrspacecast ptr null to ptr addrspace(1)
  %8 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %9 = sext i32 %8 to i64
  %10 = mul i64 %9, 12288
  %11 = add i64 %10, 7168
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
  %41 = xor i32 %39, 4
  %42 = xor i32 %39, 512
  %43 = xor i32 %39, 516
  %44 = add i32 %40, 0
  %45 = add i32 %41, 0
  %46 = add i32 %42, 0
  %47 = add i32 %43, 0
  %48 = sext i32 %44 to i64
  %49 = sext i32 %45 to i64
  %50 = sext i32 %46 to i64
  %51 = sext i32 %47 to i64
  %52 = getelementptr bfloat, ptr addrspace(1) %12, i64 %48
  %53 = getelementptr bfloat, ptr addrspace(1) %12, i64 %50
  %54 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %52)
  %55 = extractvalue { i32, i32, i32, i32 } %54, 0
  %56 = bitcast i32 %55 to <2 x bfloat>
  %57 = extractvalue { i32, i32, i32, i32 } %54, 1
  %58 = bitcast i32 %57 to <2 x bfloat>
  %59 = extractvalue { i32, i32, i32, i32 } %54, 2
  %60 = bitcast i32 %59 to <2 x bfloat>
  %61 = extractvalue { i32, i32, i32, i32 } %54, 3
  %62 = bitcast i32 %61 to <2 x bfloat>
  %63 = extractelement <2 x bfloat> %56, i32 0
  %64 = extractelement <2 x bfloat> %56, i32 1
  %65 = extractelement <2 x bfloat> %58, i32 0
  %66 = extractelement <2 x bfloat> %58, i32 1
  %67 = extractelement <2 x bfloat> %60, i32 0
  %68 = extractelement <2 x bfloat> %60, i32 1
  %69 = extractelement <2 x bfloat> %62, i32 0
  %70 = extractelement <2 x bfloat> %62, i32 1
  %71 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %53)
  %72 = extractvalue { i32, i32, i32, i32 } %71, 0
  %73 = bitcast i32 %72 to <2 x bfloat>
  %74 = extractvalue { i32, i32, i32, i32 } %71, 1
  %75 = bitcast i32 %74 to <2 x bfloat>
  %76 = extractvalue { i32, i32, i32, i32 } %71, 2
  %77 = bitcast i32 %76 to <2 x bfloat>
  %78 = extractvalue { i32, i32, i32, i32 } %71, 3
  %79 = bitcast i32 %78 to <2 x bfloat>
  %80 = extractelement <2 x bfloat> %73, i32 0
  %81 = extractelement <2 x bfloat> %73, i32 1
  %82 = extractelement <2 x bfloat> %75, i32 0
  %83 = extractelement <2 x bfloat> %75, i32 1
  %84 = extractelement <2 x bfloat> %77, i32 0
  %85 = extractelement <2 x bfloat> %77, i32 1
  %86 = extractelement <2 x bfloat> %79, i32 0
  %87 = extractelement <2 x bfloat> %79, i32 1
  %88 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %63)
  %89 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %64)
  %90 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %65)
  %91 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %66)
  %92 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %67)
  %93 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %68)
  %94 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %69)
  %95 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %70)
  %96 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %80)
  %97 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81)
  %98 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82)
  %99 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83)
  %100 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84)
  %101 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85)
  %102 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86)
  %103 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87)
  %104 = mul i64 %9, 1024
  %105 = getelementptr bfloat, ptr addrspace(1) %3, i64 %104
  %106 = getelementptr bfloat, ptr addrspace(1) %105, i64 %48
  %107 = getelementptr bfloat, ptr addrspace(1) %105, i64 %50
  %108 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %106)
  %109 = extractvalue { i32, i32, i32, i32 } %108, 0
  %110 = bitcast i32 %109 to <2 x bfloat>
  %111 = extractvalue { i32, i32, i32, i32 } %108, 1
  %112 = bitcast i32 %111 to <2 x bfloat>
  %113 = extractvalue { i32, i32, i32, i32 } %108, 2
  %114 = bitcast i32 %113 to <2 x bfloat>
  %115 = extractvalue { i32, i32, i32, i32 } %108, 3
  %116 = bitcast i32 %115 to <2 x bfloat>
  %117 = extractelement <2 x bfloat> %110, i32 0
  %118 = extractelement <2 x bfloat> %110, i32 1
  %119 = extractelement <2 x bfloat> %112, i32 0
  %120 = extractelement <2 x bfloat> %112, i32 1
  %121 = extractelement <2 x bfloat> %114, i32 0
  %122 = extractelement <2 x bfloat> %114, i32 1
  %123 = extractelement <2 x bfloat> %116, i32 0
  %124 = extractelement <2 x bfloat> %116, i32 1
  %125 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %107)
  %126 = extractvalue { i32, i32, i32, i32 } %125, 0
  %127 = bitcast i32 %126 to <2 x bfloat>
  %128 = extractvalue { i32, i32, i32, i32 } %125, 1
  %129 = bitcast i32 %128 to <2 x bfloat>
  %130 = extractvalue { i32, i32, i32, i32 } %125, 2
  %131 = bitcast i32 %130 to <2 x bfloat>
  %132 = extractvalue { i32, i32, i32, i32 } %125, 3
  %133 = bitcast i32 %132 to <2 x bfloat>
  %134 = extractelement <2 x bfloat> %127, i32 0
  %135 = extractelement <2 x bfloat> %127, i32 1
  %136 = extractelement <2 x bfloat> %129, i32 0
  %137 = extractelement <2 x bfloat> %129, i32 1
  %138 = extractelement <2 x bfloat> %131, i32 0
  %139 = extractelement <2 x bfloat> %131, i32 1
  %140 = extractelement <2 x bfloat> %133, i32 0
  %141 = extractelement <2 x bfloat> %133, i32 1
  %142 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %117)
  %143 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %118)
  %144 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %119)
  %145 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %120)
  %146 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %121)
  %147 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %122)
  %148 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %123)
  %149 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %124)
  %150 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %134)
  %151 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135)
  %152 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136)
  %153 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137)
  %154 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138)
  %155 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139)
  %156 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140)
  %157 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141)
  %158 = getelementptr float, ptr addrspace(1) %2, i64 %104
  %159 = getelementptr float, ptr addrspace(1) %158, i64 %48
  %160 = getelementptr float, ptr addrspace(1) %158, i64 %49
  %161 = getelementptr float, ptr addrspace(1) %158, i64 %50
  %162 = getelementptr float, ptr addrspace(1) %158, i64 %51
  %163 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %159)
  %164 = extractvalue { i32, i32, i32, i32 } %163, 0
  %165 = bitcast i32 %164 to <1 x float>
  %166 = extractvalue { i32, i32, i32, i32 } %163, 1
  %167 = bitcast i32 %166 to <1 x float>
  %168 = extractvalue { i32, i32, i32, i32 } %163, 2
  %169 = bitcast i32 %168 to <1 x float>
  %170 = extractvalue { i32, i32, i32, i32 } %163, 3
  %171 = bitcast i32 %170 to <1 x float>
  %172 = extractelement <1 x float> %165, i32 0
  %173 = extractelement <1 x float> %167, i32 0
  %174 = extractelement <1 x float> %169, i32 0
  %175 = extractelement <1 x float> %171, i32 0
  %176 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %160)
  %177 = extractvalue { i32, i32, i32, i32 } %176, 0
  %178 = bitcast i32 %177 to <1 x float>
  %179 = extractvalue { i32, i32, i32, i32 } %176, 1
  %180 = bitcast i32 %179 to <1 x float>
  %181 = extractvalue { i32, i32, i32, i32 } %176, 2
  %182 = bitcast i32 %181 to <1 x float>
  %183 = extractvalue { i32, i32, i32, i32 } %176, 3
  %184 = bitcast i32 %183 to <1 x float>
  %185 = extractelement <1 x float> %178, i32 0
  %186 = extractelement <1 x float> %180, i32 0
  %187 = extractelement <1 x float> %182, i32 0
  %188 = extractelement <1 x float> %184, i32 0
  %189 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %161)
  %190 = extractvalue { i32, i32, i32, i32 } %189, 0
  %191 = bitcast i32 %190 to <1 x float>
  %192 = extractvalue { i32, i32, i32, i32 } %189, 1
  %193 = bitcast i32 %192 to <1 x float>
  %194 = extractvalue { i32, i32, i32, i32 } %189, 2
  %195 = bitcast i32 %194 to <1 x float>
  %196 = extractvalue { i32, i32, i32, i32 } %189, 3
  %197 = bitcast i32 %196 to <1 x float>
  %198 = extractelement <1 x float> %191, i32 0
  %199 = extractelement <1 x float> %193, i32 0
  %200 = extractelement <1 x float> %195, i32 0
  %201 = extractelement <1 x float> %197, i32 0
  %202 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %162)
  %203 = extractvalue { i32, i32, i32, i32 } %202, 0
  %204 = bitcast i32 %203 to <1 x float>
  %205 = extractvalue { i32, i32, i32, i32 } %202, 1
  %206 = bitcast i32 %205 to <1 x float>
  %207 = extractvalue { i32, i32, i32, i32 } %202, 2
  %208 = bitcast i32 %207 to <1 x float>
  %209 = extractvalue { i32, i32, i32, i32 } %202, 3
  %210 = bitcast i32 %209 to <1 x float>
  %211 = extractelement <1 x float> %204, i32 0
  %212 = extractelement <1 x float> %206, i32 0
  %213 = extractelement <1 x float> %208, i32 0
  %214 = extractelement <1 x float> %210, i32 0
  %215 = fadd float %142, %172
  %216 = fadd float %143, %173
  %217 = fadd float %144, %174
  %218 = fadd float %145, %175
  %219 = fadd float %146, %185
  %220 = fadd float %147, %186
  %221 = fadd float %148, %187
  %222 = fadd float %149, %188
  %223 = fadd float %150, %198
  %224 = fadd float %151, %199
  %225 = fadd float %152, %200
  %226 = fadd float %153, %201
  %227 = fadd float %154, %211
  %228 = fadd float %155, %212
  %229 = fadd float %156, %213
  %230 = fadd float %157, %214
  %231 = fadd float %88, %215
  %232 = fadd float %89, %216
  %233 = fadd float %90, %217
  %234 = fadd float %91, %218
  %235 = fadd float %92, %219
  %236 = fadd float %93, %220
  %237 = fadd float %94, %221
  %238 = fadd float %95, %222
  %239 = fadd float %96, %223
  %240 = fadd float %97, %224
  %241 = fadd float %98, %225
  %242 = fadd float %99, %226
  %243 = fadd float %100, %227
  %244 = fadd float %101, %228
  %245 = fadd float %102, %229
  %246 = fadd float %103, %230
  %247 = fmul float %231, %231
  %248 = fmul float %232, %232
  %249 = fmul float %233, %233
  %250 = fmul float %234, %234
  %251 = fmul float %235, %235
  %252 = fmul float %236, %236
  %253 = fmul float %237, %237
  %254 = fmul float %238, %238
  %255 = fmul float %239, %239
  %256 = fmul float %240, %240
  %257 = fmul float %241, %241
  %258 = fmul float %242, %242
  %259 = fmul float %243, %243
  %260 = fmul float %244, %244
  %261 = fmul float %245, %245
  %262 = fmul float %246, %246
  %263 = fadd float %247, %248
  %264 = fadd float %263, %249
  %265 = fadd float %264, %250
  %266 = fadd float %265, %251
  %267 = fadd float %266, %252
  %268 = fadd float %267, %253
  %269 = fadd float %268, %254
  %270 = fadd float %269, %255
  %271 = fadd float %270, %256
  %272 = fadd float %271, %257
  %273 = fadd float %272, %258
  %274 = fadd float %273, %259
  %275 = fadd float %274, %260
  %276 = fadd float %275, %261
  %277 = fadd float %276, %262
  %278 = bitcast float %277 to i32
  %279 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %278, i32 16, i32 31)
  %280 = bitcast i32 %279 to float
  %281 = fadd float %277, %280
  %282 = bitcast float %281 to i32
  %283 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %282, i32 8, i32 31)
  %284 = bitcast i32 %283 to float
  %285 = fadd float %281, %284
  %286 = bitcast float %285 to i32
  %287 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %286, i32 4, i32 31)
  %288 = bitcast i32 %287 to float
  %289 = fadd float %285, %288
  %290 = bitcast float %289 to i32
  %291 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %290, i32 2, i32 31)
  %292 = bitcast i32 %291 to float
  %293 = fadd float %289, %292
  %294 = bitcast float %293 to i32
  %295 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %294, i32 1, i32 31)
  %296 = bitcast i32 %295 to float
  %297 = fadd float %293, %296
  %298 = urem i32 %14, 32
  %299 = urem i32 %15, 2
  %300 = icmp eq i32 %298, 0
  %301 = and i1 true, %300
  %302 = add i32 0, %299
  %303 = getelementptr float, ptr addrspace(3) @global_smem, i32 %302
  %304 = insertelement <1 x float> undef, float %297, i32 0
  %305 = extractelement <1 x float> %304, i32 0
  %306 = bitcast float %305 to i32
  %307 = insertelement <1 x i32> undef, i32 %306, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %303, <1 x i32> %307, i1 %301)
  call void @llvm.nvvm.barrier0()
  %308 = icmp slt i32 %13, 2
  %309 = getelementptr float, ptr addrspace(3) @global_smem, i32 %13
  %310 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %309, i1 %308)
  %311 = insertelement <1 x i32> undef, i32 %310, i32 0
  %312 = extractelement <1 x i32> %311, i32 0
  %313 = bitcast i32 %312 to float
  %314 = insertelement <1 x float> undef, float %313, i32 0
  %315 = extractelement <1 x float> %314, i32 0
  %316 = bitcast float %315 to i32
  %317 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %316, i32 1, i32 31)
  %318 = bitcast i32 %317 to float
  %319 = fadd float %315, %318
  %320 = urem i32 %14, 2
  %321 = icmp eq i32 %320, 0
  %322 = and i1 %308, %321
  %323 = insertelement <1 x float> undef, float %319, i32 0
  %324 = extractelement <1 x float> %323, i32 0
  %325 = bitcast float %324 to i32
  %326 = insertelement <1 x i32> undef, i32 %325, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %309, <1 x i32> %326, i1 %322)
  call void @llvm.nvvm.barrier0()
  %327 = load float, ptr addrspace(3) @global_smem, align 4
  %328 = fmul float %327, 0x3F50000000000000
  %329 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %330 = bitcast i32 %329 to <1 x float>
  %331 = extractelement <1 x float> %330, i32 0
  %332 = fadd float %328, %331
  %333 = call float @__nv_rsqrtf(float %332)
  %334 = fmul float %231, %333
  %335 = fmul float %232, %333
  %336 = fmul float %233, %333
  %337 = fmul float %234, %333
  %338 = fmul float %235, %333
  %339 = fmul float %236, %333
  %340 = fmul float %237, %333
  %341 = fmul float %238, %333
  %342 = fmul float %239, %333
  %343 = fmul float %240, %333
  %344 = fmul float %241, %333
  %345 = fmul float %242, %333
  %346 = fmul float %243, %333
  %347 = fmul float %244, %333
  %348 = fmul float %245, %333
  %349 = fmul float %246, %333
  %350 = getelementptr bfloat, ptr addrspace(1) %5, i64 %48
  %351 = getelementptr bfloat, ptr addrspace(1) %5, i64 %50
  %352 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %350)
  %353 = extractvalue { i32, i32, i32, i32 } %352, 0
  %354 = bitcast i32 %353 to <2 x bfloat>
  %355 = extractvalue { i32, i32, i32, i32 } %352, 1
  %356 = bitcast i32 %355 to <2 x bfloat>
  %357 = extractvalue { i32, i32, i32, i32 } %352, 2
  %358 = bitcast i32 %357 to <2 x bfloat>
  %359 = extractvalue { i32, i32, i32, i32 } %352, 3
  %360 = bitcast i32 %359 to <2 x bfloat>
  %361 = extractelement <2 x bfloat> %354, i32 0
  %362 = extractelement <2 x bfloat> %354, i32 1
  %363 = extractelement <2 x bfloat> %356, i32 0
  %364 = extractelement <2 x bfloat> %356, i32 1
  %365 = extractelement <2 x bfloat> %358, i32 0
  %366 = extractelement <2 x bfloat> %358, i32 1
  %367 = extractelement <2 x bfloat> %360, i32 0
  %368 = extractelement <2 x bfloat> %360, i32 1
  %369 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %351)
  %370 = extractvalue { i32, i32, i32, i32 } %369, 0
  %371 = bitcast i32 %370 to <2 x bfloat>
  %372 = extractvalue { i32, i32, i32, i32 } %369, 1
  %373 = bitcast i32 %372 to <2 x bfloat>
  %374 = extractvalue { i32, i32, i32, i32 } %369, 2
  %375 = bitcast i32 %374 to <2 x bfloat>
  %376 = extractvalue { i32, i32, i32, i32 } %369, 3
  %377 = bitcast i32 %376 to <2 x bfloat>
  %378 = extractelement <2 x bfloat> %371, i32 0
  %379 = extractelement <2 x bfloat> %371, i32 1
  %380 = extractelement <2 x bfloat> %373, i32 0
  %381 = extractelement <2 x bfloat> %373, i32 1
  %382 = extractelement <2 x bfloat> %375, i32 0
  %383 = extractelement <2 x bfloat> %375, i32 1
  %384 = extractelement <2 x bfloat> %377, i32 0
  %385 = extractelement <2 x bfloat> %377, i32 1
  %386 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %361)
  %387 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %362)
  %388 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %363)
  %389 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %364)
  %390 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %365)
  %391 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %366)
  %392 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %367)
  %393 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %368)
  %394 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %378)
  %395 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %379)
  %396 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %380)
  %397 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %381)
  %398 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %382)
  %399 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %383)
  %400 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %384)
  %401 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %385)
  %402 = fmul float %334, %386
  %403 = fmul float %335, %387
  %404 = fmul float %336, %388
  %405 = fmul float %337, %389
  %406 = fmul float %338, %390
  %407 = fmul float %339, %391
  %408 = fmul float %340, %392
  %409 = fmul float %341, %393
  %410 = fmul float %342, %394
  %411 = fmul float %343, %395
  %412 = fmul float %344, %396
  %413 = fmul float %345, %397
  %414 = fmul float %346, %398
  %415 = fmul float %347, %399
  %416 = fmul float %348, %400
  %417 = fmul float %349, %401
  %418 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %402)
  %419 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %403)
  %420 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %404)
  %421 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %405)
  %422 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %406)
  %423 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %407)
  %424 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %408)
  %425 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %409)
  %426 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %410)
  %427 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %411)
  %428 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %412)
  %429 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %413)
  %430 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %414)
  %431 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %415)
  %432 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %416)
  %433 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %417)
  %434 = getelementptr bfloat, ptr addrspace(1) %6, i64 %104
  %435 = getelementptr bfloat, ptr addrspace(1) %434, i64 %48
  %436 = getelementptr bfloat, ptr addrspace(1) %434, i64 %50
  %437 = insertelement <2 x bfloat> undef, bfloat %418, i32 0
  %438 = insertelement <2 x bfloat> %437, bfloat %419, i32 1
  %439 = bitcast <2 x bfloat> %438 to i32
  %440 = insertelement <2 x bfloat> undef, bfloat %420, i32 0
  %441 = insertelement <2 x bfloat> %440, bfloat %421, i32 1
  %442 = bitcast <2 x bfloat> %441 to i32
  %443 = insertelement <2 x bfloat> undef, bfloat %422, i32 0
  %444 = insertelement <2 x bfloat> %443, bfloat %423, i32 1
  %445 = bitcast <2 x bfloat> %444 to i32
  %446 = insertelement <2 x bfloat> undef, bfloat %424, i32 0
  %447 = insertelement <2 x bfloat> %446, bfloat %425, i32 1
  %448 = bitcast <2 x bfloat> %447 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %439, i32 %442, i32 %445, i32 %448, ptr addrspace(1) %435)
  %449 = insertelement <2 x bfloat> undef, bfloat %426, i32 0
  %450 = insertelement <2 x bfloat> %449, bfloat %427, i32 1
  %451 = bitcast <2 x bfloat> %450 to i32
  %452 = insertelement <2 x bfloat> undef, bfloat %428, i32 0
  %453 = insertelement <2 x bfloat> %452, bfloat %429, i32 1
  %454 = bitcast <2 x bfloat> %453 to i32
  %455 = insertelement <2 x bfloat> undef, bfloat %430, i32 0
  %456 = insertelement <2 x bfloat> %455, bfloat %431, i32 1
  %457 = bitcast <2 x bfloat> %456 to i32
  %458 = insertelement <2 x bfloat> undef, bfloat %432, i32 0
  %459 = insertelement <2 x bfloat> %458, bfloat %433, i32 1
  %460 = bitcast <2 x bfloat> %459 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %451, i32 %454, i32 %457, i32 %460, ptr addrspace(1) %436)
  ret void

entry:                                            ; No predecessors!
  ret void
}

define ptx_kernel void @loop_add_fusion_1(ptr noalias align 128 dereferenceable(3145728) %0, ptr noalias align 128 dereferenceable(262144) %1, ptr noalias align 128 dereferenceable(524288) %2, ptr noalias align 128 dereferenceable(262144) %3) #0 {
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %7 = udiv i32 %6, 8
  %8 = urem i32 %6, 8
  %9 = mul i32 %8, 128
  %10 = add i32 %9, %5
  %11 = mul i32 %6, 128
  %12 = add i32 %11, %5
  %13 = getelementptr inbounds bfloat, ptr %3, i32 %12
  %14 = load bfloat, ptr %13, align 2, !invariant.load !3
  %15 = fpext bfloat %14 to float
  %16 = getelementptr inbounds float, ptr %2, i32 %12
  %17 = load float, ptr %16, align 4
  %18 = getelementptr inbounds bfloat, ptr %1, i32 %12
  %19 = load bfloat, ptr %18, align 2, !invariant.load !3
  %20 = add i32 %10, 7168
  %21 = call float @fused_add_1_convert_611_24(ptr %0, ptr %1, ptr %2, ptr %3, i32 %7, i32 %20)
  %22 = fadd float %15, %17
  %23 = fpext bfloat %19 to float
  %24 = fadd float %21, %22
  %25 = add i32 %10, 6144
  %26 = call float @fused_add_1_convert_611_24(ptr %0, ptr %1, ptr %2, ptr %3, i32 %7, i32 %25)
  %27 = fadd float %23, %24
  %28 = fadd float %26, %27
  store float %28, ptr %16, align 4
  ret void
}

define internal float @fused_add_1_convert_611_24(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, i32 %4, i32 %5) {
  %7 = mul i32 %4, 12288
  %8 = add i32 %7, %5
  %9 = getelementptr inbounds bfloat, ptr %0, i32 %8
  %10 = load bfloat, ptr %9, align 2, !invariant.load !3
  %11 = fpext bfloat %10 to float
  ret float %11
}

declare ptx_kernel void @fusion_168_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_168(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(524288) %arg1, ptr noalias align 128 dereferenceable(262144) %arg2, ptr noalias align 128 dereferenceable(3145728) %arg3, ptr noalias align 16 dereferenceable(2048) %arg4, ptr noalias align 128 dereferenceable(262144) %arg5) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %6 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %7 = addrspacecast ptr null to ptr addrspace(1)
  %8 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %9 = sext i32 %8 to i64
  %10 = mul i64 %9, 12288
  %11 = add i64 %10, 5120
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
  %41 = xor i32 %39, 4
  %42 = xor i32 %39, 512
  %43 = xor i32 %39, 516
  %44 = add i32 %40, 0
  %45 = add i32 %41, 0
  %46 = add i32 %42, 0
  %47 = add i32 %43, 0
  %48 = sext i32 %44 to i64
  %49 = sext i32 %45 to i64
  %50 = sext i32 %46 to i64
  %51 = sext i32 %47 to i64
  %52 = getelementptr bfloat, ptr addrspace(1) %12, i64 %48
  %53 = getelementptr bfloat, ptr addrspace(1) %12, i64 %50
  %54 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %52)
  %55 = extractvalue { i32, i32, i32, i32 } %54, 0
  %56 = bitcast i32 %55 to <2 x bfloat>
  %57 = extractvalue { i32, i32, i32, i32 } %54, 1
  %58 = bitcast i32 %57 to <2 x bfloat>
  %59 = extractvalue { i32, i32, i32, i32 } %54, 2
  %60 = bitcast i32 %59 to <2 x bfloat>
  %61 = extractvalue { i32, i32, i32, i32 } %54, 3
  %62 = bitcast i32 %61 to <2 x bfloat>
  %63 = extractelement <2 x bfloat> %56, i32 0
  %64 = extractelement <2 x bfloat> %56, i32 1
  %65 = extractelement <2 x bfloat> %58, i32 0
  %66 = extractelement <2 x bfloat> %58, i32 1
  %67 = extractelement <2 x bfloat> %60, i32 0
  %68 = extractelement <2 x bfloat> %60, i32 1
  %69 = extractelement <2 x bfloat> %62, i32 0
  %70 = extractelement <2 x bfloat> %62, i32 1
  %71 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %53)
  %72 = extractvalue { i32, i32, i32, i32 } %71, 0
  %73 = bitcast i32 %72 to <2 x bfloat>
  %74 = extractvalue { i32, i32, i32, i32 } %71, 1
  %75 = bitcast i32 %74 to <2 x bfloat>
  %76 = extractvalue { i32, i32, i32, i32 } %71, 2
  %77 = bitcast i32 %76 to <2 x bfloat>
  %78 = extractvalue { i32, i32, i32, i32 } %71, 3
  %79 = bitcast i32 %78 to <2 x bfloat>
  %80 = extractelement <2 x bfloat> %73, i32 0
  %81 = extractelement <2 x bfloat> %73, i32 1
  %82 = extractelement <2 x bfloat> %75, i32 0
  %83 = extractelement <2 x bfloat> %75, i32 1
  %84 = extractelement <2 x bfloat> %77, i32 0
  %85 = extractelement <2 x bfloat> %77, i32 1
  %86 = extractelement <2 x bfloat> %79, i32 0
  %87 = extractelement <2 x bfloat> %79, i32 1
  %88 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %63)
  %89 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %64)
  %90 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %65)
  %91 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %66)
  %92 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %67)
  %93 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %68)
  %94 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %69)
  %95 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %70)
  %96 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %80)
  %97 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81)
  %98 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82)
  %99 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83)
  %100 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84)
  %101 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85)
  %102 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86)
  %103 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87)
  %104 = mul i64 %9, 1024
  %105 = getelementptr bfloat, ptr addrspace(1) %3, i64 %104
  %106 = getelementptr bfloat, ptr addrspace(1) %105, i64 %48
  %107 = getelementptr bfloat, ptr addrspace(1) %105, i64 %50
  %108 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %106)
  %109 = extractvalue { i32, i32, i32, i32 } %108, 0
  %110 = bitcast i32 %109 to <2 x bfloat>
  %111 = extractvalue { i32, i32, i32, i32 } %108, 1
  %112 = bitcast i32 %111 to <2 x bfloat>
  %113 = extractvalue { i32, i32, i32, i32 } %108, 2
  %114 = bitcast i32 %113 to <2 x bfloat>
  %115 = extractvalue { i32, i32, i32, i32 } %108, 3
  %116 = bitcast i32 %115 to <2 x bfloat>
  %117 = extractelement <2 x bfloat> %110, i32 0
  %118 = extractelement <2 x bfloat> %110, i32 1
  %119 = extractelement <2 x bfloat> %112, i32 0
  %120 = extractelement <2 x bfloat> %112, i32 1
  %121 = extractelement <2 x bfloat> %114, i32 0
  %122 = extractelement <2 x bfloat> %114, i32 1
  %123 = extractelement <2 x bfloat> %116, i32 0
  %124 = extractelement <2 x bfloat> %116, i32 1
  %125 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %107)
  %126 = extractvalue { i32, i32, i32, i32 } %125, 0
  %127 = bitcast i32 %126 to <2 x bfloat>
  %128 = extractvalue { i32, i32, i32, i32 } %125, 1
  %129 = bitcast i32 %128 to <2 x bfloat>
  %130 = extractvalue { i32, i32, i32, i32 } %125, 2
  %131 = bitcast i32 %130 to <2 x bfloat>
  %132 = extractvalue { i32, i32, i32, i32 } %125, 3
  %133 = bitcast i32 %132 to <2 x bfloat>
  %134 = extractelement <2 x bfloat> %127, i32 0
  %135 = extractelement <2 x bfloat> %127, i32 1
  %136 = extractelement <2 x bfloat> %129, i32 0
  %137 = extractelement <2 x bfloat> %129, i32 1
  %138 = extractelement <2 x bfloat> %131, i32 0
  %139 = extractelement <2 x bfloat> %131, i32 1
  %140 = extractelement <2 x bfloat> %133, i32 0
  %141 = extractelement <2 x bfloat> %133, i32 1
  %142 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %117)
  %143 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %118)
  %144 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %119)
  %145 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %120)
  %146 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %121)
  %147 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %122)
  %148 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %123)
  %149 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %124)
  %150 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %134)
  %151 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135)
  %152 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136)
  %153 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137)
  %154 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138)
  %155 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139)
  %156 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140)
  %157 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141)
  %158 = getelementptr float, ptr addrspace(1) %2, i64 %104
  %159 = getelementptr float, ptr addrspace(1) %158, i64 %48
  %160 = getelementptr float, ptr addrspace(1) %158, i64 %49
  %161 = getelementptr float, ptr addrspace(1) %158, i64 %50
  %162 = getelementptr float, ptr addrspace(1) %158, i64 %51
  %163 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %159)
  %164 = extractvalue { i32, i32, i32, i32 } %163, 0
  %165 = bitcast i32 %164 to <1 x float>
  %166 = extractvalue { i32, i32, i32, i32 } %163, 1
  %167 = bitcast i32 %166 to <1 x float>
  %168 = extractvalue { i32, i32, i32, i32 } %163, 2
  %169 = bitcast i32 %168 to <1 x float>
  %170 = extractvalue { i32, i32, i32, i32 } %163, 3
  %171 = bitcast i32 %170 to <1 x float>
  %172 = extractelement <1 x float> %165, i32 0
  %173 = extractelement <1 x float> %167, i32 0
  %174 = extractelement <1 x float> %169, i32 0
  %175 = extractelement <1 x float> %171, i32 0
  %176 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %160)
  %177 = extractvalue { i32, i32, i32, i32 } %176, 0
  %178 = bitcast i32 %177 to <1 x float>
  %179 = extractvalue { i32, i32, i32, i32 } %176, 1
  %180 = bitcast i32 %179 to <1 x float>
  %181 = extractvalue { i32, i32, i32, i32 } %176, 2
  %182 = bitcast i32 %181 to <1 x float>
  %183 = extractvalue { i32, i32, i32, i32 } %176, 3
  %184 = bitcast i32 %183 to <1 x float>
  %185 = extractelement <1 x float> %178, i32 0
  %186 = extractelement <1 x float> %180, i32 0
  %187 = extractelement <1 x float> %182, i32 0
  %188 = extractelement <1 x float> %184, i32 0
  %189 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %161)
  %190 = extractvalue { i32, i32, i32, i32 } %189, 0
  %191 = bitcast i32 %190 to <1 x float>
  %192 = extractvalue { i32, i32, i32, i32 } %189, 1
  %193 = bitcast i32 %192 to <1 x float>
  %194 = extractvalue { i32, i32, i32, i32 } %189, 2
  %195 = bitcast i32 %194 to <1 x float>
  %196 = extractvalue { i32, i32, i32, i32 } %189, 3
  %197 = bitcast i32 %196 to <1 x float>
  %198 = extractelement <1 x float> %191, i32 0
  %199 = extractelement <1 x float> %193, i32 0
  %200 = extractelement <1 x float> %195, i32 0
  %201 = extractelement <1 x float> %197, i32 0
  %202 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %162)
  %203 = extractvalue { i32, i32, i32, i32 } %202, 0
  %204 = bitcast i32 %203 to <1 x float>
  %205 = extractvalue { i32, i32, i32, i32 } %202, 1
  %206 = bitcast i32 %205 to <1 x float>
  %207 = extractvalue { i32, i32, i32, i32 } %202, 2
  %208 = bitcast i32 %207 to <1 x float>
  %209 = extractvalue { i32, i32, i32, i32 } %202, 3
  %210 = bitcast i32 %209 to <1 x float>
  %211 = extractelement <1 x float> %204, i32 0
  %212 = extractelement <1 x float> %206, i32 0
  %213 = extractelement <1 x float> %208, i32 0
  %214 = extractelement <1 x float> %210, i32 0
  %215 = fadd float %142, %172
  %216 = fadd float %143, %173
  %217 = fadd float %144, %174
  %218 = fadd float %145, %175
  %219 = fadd float %146, %185
  %220 = fadd float %147, %186
  %221 = fadd float %148, %187
  %222 = fadd float %149, %188
  %223 = fadd float %150, %198
  %224 = fadd float %151, %199
  %225 = fadd float %152, %200
  %226 = fadd float %153, %201
  %227 = fadd float %154, %211
  %228 = fadd float %155, %212
  %229 = fadd float %156, %213
  %230 = fadd float %157, %214
  %231 = fadd float %88, %215
  %232 = fadd float %89, %216
  %233 = fadd float %90, %217
  %234 = fadd float %91, %218
  %235 = fadd float %92, %219
  %236 = fadd float %93, %220
  %237 = fadd float %94, %221
  %238 = fadd float %95, %222
  %239 = fadd float %96, %223
  %240 = fadd float %97, %224
  %241 = fadd float %98, %225
  %242 = fadd float %99, %226
  %243 = fadd float %100, %227
  %244 = fadd float %101, %228
  %245 = fadd float %102, %229
  %246 = fadd float %103, %230
  %247 = fmul float %231, %231
  %248 = fmul float %232, %232
  %249 = fmul float %233, %233
  %250 = fmul float %234, %234
  %251 = fmul float %235, %235
  %252 = fmul float %236, %236
  %253 = fmul float %237, %237
  %254 = fmul float %238, %238
  %255 = fmul float %239, %239
  %256 = fmul float %240, %240
  %257 = fmul float %241, %241
  %258 = fmul float %242, %242
  %259 = fmul float %243, %243
  %260 = fmul float %244, %244
  %261 = fmul float %245, %245
  %262 = fmul float %246, %246
  %263 = fadd float %247, %248
  %264 = fadd float %263, %249
  %265 = fadd float %264, %250
  %266 = fadd float %265, %251
  %267 = fadd float %266, %252
  %268 = fadd float %267, %253
  %269 = fadd float %268, %254
  %270 = fadd float %269, %255
  %271 = fadd float %270, %256
  %272 = fadd float %271, %257
  %273 = fadd float %272, %258
  %274 = fadd float %273, %259
  %275 = fadd float %274, %260
  %276 = fadd float %275, %261
  %277 = fadd float %276, %262
  %278 = bitcast float %277 to i32
  %279 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %278, i32 16, i32 31)
  %280 = bitcast i32 %279 to float
  %281 = fadd float %277, %280
  %282 = bitcast float %281 to i32
  %283 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %282, i32 8, i32 31)
  %284 = bitcast i32 %283 to float
  %285 = fadd float %281, %284
  %286 = bitcast float %285 to i32
  %287 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %286, i32 4, i32 31)
  %288 = bitcast i32 %287 to float
  %289 = fadd float %285, %288
  %290 = bitcast float %289 to i32
  %291 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %290, i32 2, i32 31)
  %292 = bitcast i32 %291 to float
  %293 = fadd float %289, %292
  %294 = bitcast float %293 to i32
  %295 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %294, i32 1, i32 31)
  %296 = bitcast i32 %295 to float
  %297 = fadd float %293, %296
  %298 = urem i32 %14, 32
  %299 = urem i32 %15, 2
  %300 = icmp eq i32 %298, 0
  %301 = and i1 true, %300
  %302 = add i32 0, %299
  %303 = getelementptr float, ptr addrspace(3) @global_smem, i32 %302
  %304 = insertelement <1 x float> undef, float %297, i32 0
  %305 = extractelement <1 x float> %304, i32 0
  %306 = bitcast float %305 to i32
  %307 = insertelement <1 x i32> undef, i32 %306, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %303, <1 x i32> %307, i1 %301)
  call void @llvm.nvvm.barrier0()
  %308 = icmp slt i32 %13, 2
  %309 = getelementptr float, ptr addrspace(3) @global_smem, i32 %13
  %310 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %309, i1 %308)
  %311 = insertelement <1 x i32> undef, i32 %310, i32 0
  %312 = extractelement <1 x i32> %311, i32 0
  %313 = bitcast i32 %312 to float
  %314 = insertelement <1 x float> undef, float %313, i32 0
  %315 = extractelement <1 x float> %314, i32 0
  %316 = bitcast float %315 to i32
  %317 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %316, i32 1, i32 31)
  %318 = bitcast i32 %317 to float
  %319 = fadd float %315, %318
  %320 = urem i32 %14, 2
  %321 = icmp eq i32 %320, 0
  %322 = and i1 %308, %321
  %323 = insertelement <1 x float> undef, float %319, i32 0
  %324 = extractelement <1 x float> %323, i32 0
  %325 = bitcast float %324 to i32
  %326 = insertelement <1 x i32> undef, i32 %325, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %309, <1 x i32> %326, i1 %322)
  call void @llvm.nvvm.barrier0()
  %327 = load float, ptr addrspace(3) @global_smem, align 4
  %328 = fmul float %327, 0x3F50000000000000
  %329 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %330 = bitcast i32 %329 to <1 x float>
  %331 = extractelement <1 x float> %330, i32 0
  %332 = fadd float %328, %331
  %333 = call float @__nv_rsqrtf(float %332)
  %334 = fmul float %231, %333
  %335 = fmul float %232, %333
  %336 = fmul float %233, %333
  %337 = fmul float %234, %333
  %338 = fmul float %235, %333
  %339 = fmul float %236, %333
  %340 = fmul float %237, %333
  %341 = fmul float %238, %333
  %342 = fmul float %239, %333
  %343 = fmul float %240, %333
  %344 = fmul float %241, %333
  %345 = fmul float %242, %333
  %346 = fmul float %243, %333
  %347 = fmul float %244, %333
  %348 = fmul float %245, %333
  %349 = fmul float %246, %333
  %350 = getelementptr bfloat, ptr addrspace(1) %5, i64 %48
  %351 = getelementptr bfloat, ptr addrspace(1) %5, i64 %50
  %352 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %350)
  %353 = extractvalue { i32, i32, i32, i32 } %352, 0
  %354 = bitcast i32 %353 to <2 x bfloat>
  %355 = extractvalue { i32, i32, i32, i32 } %352, 1
  %356 = bitcast i32 %355 to <2 x bfloat>
  %357 = extractvalue { i32, i32, i32, i32 } %352, 2
  %358 = bitcast i32 %357 to <2 x bfloat>
  %359 = extractvalue { i32, i32, i32, i32 } %352, 3
  %360 = bitcast i32 %359 to <2 x bfloat>
  %361 = extractelement <2 x bfloat> %354, i32 0
  %362 = extractelement <2 x bfloat> %354, i32 1
  %363 = extractelement <2 x bfloat> %356, i32 0
  %364 = extractelement <2 x bfloat> %356, i32 1
  %365 = extractelement <2 x bfloat> %358, i32 0
  %366 = extractelement <2 x bfloat> %358, i32 1
  %367 = extractelement <2 x bfloat> %360, i32 0
  %368 = extractelement <2 x bfloat> %360, i32 1
  %369 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %351)
  %370 = extractvalue { i32, i32, i32, i32 } %369, 0
  %371 = bitcast i32 %370 to <2 x bfloat>
  %372 = extractvalue { i32, i32, i32, i32 } %369, 1
  %373 = bitcast i32 %372 to <2 x bfloat>
  %374 = extractvalue { i32, i32, i32, i32 } %369, 2
  %375 = bitcast i32 %374 to <2 x bfloat>
  %376 = extractvalue { i32, i32, i32, i32 } %369, 3
  %377 = bitcast i32 %376 to <2 x bfloat>
  %378 = extractelement <2 x bfloat> %371, i32 0
  %379 = extractelement <2 x bfloat> %371, i32 1
  %380 = extractelement <2 x bfloat> %373, i32 0
  %381 = extractelement <2 x bfloat> %373, i32 1
  %382 = extractelement <2 x bfloat> %375, i32 0
  %383 = extractelement <2 x bfloat> %375, i32 1
  %384 = extractelement <2 x bfloat> %377, i32 0
  %385 = extractelement <2 x bfloat> %377, i32 1
  %386 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %361)
  %387 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %362)
  %388 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %363)
  %389 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %364)
  %390 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %365)
  %391 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %366)
  %392 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %367)
  %393 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %368)
  %394 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %378)
  %395 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %379)
  %396 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %380)
  %397 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %381)
  %398 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %382)
  %399 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %383)
  %400 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %384)
  %401 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %385)
  %402 = fmul float %334, %386
  %403 = fmul float %335, %387
  %404 = fmul float %336, %388
  %405 = fmul float %337, %389
  %406 = fmul float %338, %390
  %407 = fmul float %339, %391
  %408 = fmul float %340, %392
  %409 = fmul float %341, %393
  %410 = fmul float %342, %394
  %411 = fmul float %343, %395
  %412 = fmul float %344, %396
  %413 = fmul float %345, %397
  %414 = fmul float %346, %398
  %415 = fmul float %347, %399
  %416 = fmul float %348, %400
  %417 = fmul float %349, %401
  %418 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %402)
  %419 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %403)
  %420 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %404)
  %421 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %405)
  %422 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %406)
  %423 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %407)
  %424 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %408)
  %425 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %409)
  %426 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %410)
  %427 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %411)
  %428 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %412)
  %429 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %413)
  %430 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %414)
  %431 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %415)
  %432 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %416)
  %433 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %417)
  %434 = getelementptr bfloat, ptr addrspace(1) %6, i64 %104
  %435 = getelementptr bfloat, ptr addrspace(1) %434, i64 %48
  %436 = getelementptr bfloat, ptr addrspace(1) %434, i64 %50
  %437 = insertelement <2 x bfloat> undef, bfloat %418, i32 0
  %438 = insertelement <2 x bfloat> %437, bfloat %419, i32 1
  %439 = bitcast <2 x bfloat> %438 to i32
  %440 = insertelement <2 x bfloat> undef, bfloat %420, i32 0
  %441 = insertelement <2 x bfloat> %440, bfloat %421, i32 1
  %442 = bitcast <2 x bfloat> %441 to i32
  %443 = insertelement <2 x bfloat> undef, bfloat %422, i32 0
  %444 = insertelement <2 x bfloat> %443, bfloat %423, i32 1
  %445 = bitcast <2 x bfloat> %444 to i32
  %446 = insertelement <2 x bfloat> undef, bfloat %424, i32 0
  %447 = insertelement <2 x bfloat> %446, bfloat %425, i32 1
  %448 = bitcast <2 x bfloat> %447 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %439, i32 %442, i32 %445, i32 %448, ptr addrspace(1) %435)
  %449 = insertelement <2 x bfloat> undef, bfloat %426, i32 0
  %450 = insertelement <2 x bfloat> %449, bfloat %427, i32 1
  %451 = bitcast <2 x bfloat> %450 to i32
  %452 = insertelement <2 x bfloat> undef, bfloat %428, i32 0
  %453 = insertelement <2 x bfloat> %452, bfloat %429, i32 1
  %454 = bitcast <2 x bfloat> %453 to i32
  %455 = insertelement <2 x bfloat> undef, bfloat %430, i32 0
  %456 = insertelement <2 x bfloat> %455, bfloat %431, i32 1
  %457 = bitcast <2 x bfloat> %456 to i32
  %458 = insertelement <2 x bfloat> undef, bfloat %432, i32 0
  %459 = insertelement <2 x bfloat> %458, bfloat %433, i32 1
  %460 = bitcast <2 x bfloat> %459 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %451, i32 %454, i32 %457, i32 %460, ptr addrspace(1) %436)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_166_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_166(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(524288) %arg2, ptr noalias align 128 dereferenceable(262144) %arg3, ptr noalias align 128 dereferenceable(3145728) %arg4, ptr noalias align 128 dereferenceable(262144) %arg5, ptr noalias align 128 dereferenceable(262144) %arg6) #6 {
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
  %11 = mul i64 %10, 12288
  %12 = add i64 %11, 4096
  %13 = getelementptr bfloat, ptr addrspace(1) %5, i64 %12
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
  %42 = xor i32 %40, 4
  %43 = xor i32 %40, 512
  %44 = xor i32 %40, 516
  %45 = add i32 %41, 0
  %46 = add i32 %42, 0
  %47 = add i32 %43, 0
  %48 = add i32 %44, 0
  %49 = sext i32 %45 to i64
  %50 = sext i32 %46 to i64
  %51 = sext i32 %47 to i64
  %52 = sext i32 %48 to i64
  %53 = getelementptr bfloat, ptr addrspace(1) %13, i64 %49
  %54 = getelementptr bfloat, ptr addrspace(1) %13, i64 %51
  %55 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %53)
  %56 = extractvalue { i32, i32, i32, i32 } %55, 0
  %57 = bitcast i32 %56 to <2 x bfloat>
  %58 = extractvalue { i32, i32, i32, i32 } %55, 1
  %59 = bitcast i32 %58 to <2 x bfloat>
  %60 = extractvalue { i32, i32, i32, i32 } %55, 2
  %61 = bitcast i32 %60 to <2 x bfloat>
  %62 = extractvalue { i32, i32, i32, i32 } %55, 3
  %63 = bitcast i32 %62 to <2 x bfloat>
  %64 = extractelement <2 x bfloat> %57, i32 0
  %65 = extractelement <2 x bfloat> %57, i32 1
  %66 = extractelement <2 x bfloat> %59, i32 0
  %67 = extractelement <2 x bfloat> %59, i32 1
  %68 = extractelement <2 x bfloat> %61, i32 0
  %69 = extractelement <2 x bfloat> %61, i32 1
  %70 = extractelement <2 x bfloat> %63, i32 0
  %71 = extractelement <2 x bfloat> %63, i32 1
  %72 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %54)
  %73 = extractvalue { i32, i32, i32, i32 } %72, 0
  %74 = bitcast i32 %73 to <2 x bfloat>
  %75 = extractvalue { i32, i32, i32, i32 } %72, 1
  %76 = bitcast i32 %75 to <2 x bfloat>
  %77 = extractvalue { i32, i32, i32, i32 } %72, 2
  %78 = bitcast i32 %77 to <2 x bfloat>
  %79 = extractvalue { i32, i32, i32, i32 } %72, 3
  %80 = bitcast i32 %79 to <2 x bfloat>
  %81 = extractelement <2 x bfloat> %74, i32 0
  %82 = extractelement <2 x bfloat> %74, i32 1
  %83 = extractelement <2 x bfloat> %76, i32 0
  %84 = extractelement <2 x bfloat> %76, i32 1
  %85 = extractelement <2 x bfloat> %78, i32 0
  %86 = extractelement <2 x bfloat> %78, i32 1
  %87 = extractelement <2 x bfloat> %80, i32 0
  %88 = extractelement <2 x bfloat> %80, i32 1
  %89 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %64)
  %90 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %65)
  %91 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %66)
  %92 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %67)
  %93 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %68)
  %94 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %69)
  %95 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %70)
  %96 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %71)
  %97 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81)
  %98 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82)
  %99 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83)
  %100 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84)
  %101 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85)
  %102 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86)
  %103 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87)
  %104 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88)
  %105 = mul i64 %10, 1024
  %106 = getelementptr bfloat, ptr addrspace(1) %6, i64 %105
  %107 = getelementptr bfloat, ptr addrspace(1) %106, i64 %49
  %108 = getelementptr bfloat, ptr addrspace(1) %106, i64 %51
  %109 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %107)
  %110 = extractvalue { i32, i32, i32, i32 } %109, 0
  %111 = bitcast i32 %110 to <2 x bfloat>
  %112 = extractvalue { i32, i32, i32, i32 } %109, 1
  %113 = bitcast i32 %112 to <2 x bfloat>
  %114 = extractvalue { i32, i32, i32, i32 } %109, 2
  %115 = bitcast i32 %114 to <2 x bfloat>
  %116 = extractvalue { i32, i32, i32, i32 } %109, 3
  %117 = bitcast i32 %116 to <2 x bfloat>
  %118 = extractelement <2 x bfloat> %111, i32 0
  %119 = extractelement <2 x bfloat> %111, i32 1
  %120 = extractelement <2 x bfloat> %113, i32 0
  %121 = extractelement <2 x bfloat> %113, i32 1
  %122 = extractelement <2 x bfloat> %115, i32 0
  %123 = extractelement <2 x bfloat> %115, i32 1
  %124 = extractelement <2 x bfloat> %117, i32 0
  %125 = extractelement <2 x bfloat> %117, i32 1
  %126 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %108)
  %127 = extractvalue { i32, i32, i32, i32 } %126, 0
  %128 = bitcast i32 %127 to <2 x bfloat>
  %129 = extractvalue { i32, i32, i32, i32 } %126, 1
  %130 = bitcast i32 %129 to <2 x bfloat>
  %131 = extractvalue { i32, i32, i32, i32 } %126, 2
  %132 = bitcast i32 %131 to <2 x bfloat>
  %133 = extractvalue { i32, i32, i32, i32 } %126, 3
  %134 = bitcast i32 %133 to <2 x bfloat>
  %135 = extractelement <2 x bfloat> %128, i32 0
  %136 = extractelement <2 x bfloat> %128, i32 1
  %137 = extractelement <2 x bfloat> %130, i32 0
  %138 = extractelement <2 x bfloat> %130, i32 1
  %139 = extractelement <2 x bfloat> %132, i32 0
  %140 = extractelement <2 x bfloat> %132, i32 1
  %141 = extractelement <2 x bfloat> %134, i32 0
  %142 = extractelement <2 x bfloat> %134, i32 1
  %143 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %118)
  %144 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %119)
  %145 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %120)
  %146 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %121)
  %147 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %122)
  %148 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %123)
  %149 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %124)
  %150 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %125)
  %151 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135)
  %152 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136)
  %153 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137)
  %154 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138)
  %155 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139)
  %156 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140)
  %157 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141)
  %158 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142)
  %159 = add i64 %11, 5120
  %160 = getelementptr bfloat, ptr addrspace(1) %5, i64 %159
  %161 = getelementptr bfloat, ptr addrspace(1) %160, i64 %49
  %162 = getelementptr bfloat, ptr addrspace(1) %160, i64 %51
  %163 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %161)
  %164 = extractvalue { i32, i32, i32, i32 } %163, 0
  %165 = bitcast i32 %164 to <2 x bfloat>
  %166 = extractvalue { i32, i32, i32, i32 } %163, 1
  %167 = bitcast i32 %166 to <2 x bfloat>
  %168 = extractvalue { i32, i32, i32, i32 } %163, 2
  %169 = bitcast i32 %168 to <2 x bfloat>
  %170 = extractvalue { i32, i32, i32, i32 } %163, 3
  %171 = bitcast i32 %170 to <2 x bfloat>
  %172 = extractelement <2 x bfloat> %165, i32 0
  %173 = extractelement <2 x bfloat> %165, i32 1
  %174 = extractelement <2 x bfloat> %167, i32 0
  %175 = extractelement <2 x bfloat> %167, i32 1
  %176 = extractelement <2 x bfloat> %169, i32 0
  %177 = extractelement <2 x bfloat> %169, i32 1
  %178 = extractelement <2 x bfloat> %171, i32 0
  %179 = extractelement <2 x bfloat> %171, i32 1
  %180 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %162)
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
  %197 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %172)
  %198 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %173)
  %199 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %174)
  %200 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %175)
  %201 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %176)
  %202 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %177)
  %203 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %178)
  %204 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %179)
  %205 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189)
  %206 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190)
  %207 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191)
  %208 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192)
  %209 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193)
  %210 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194)
  %211 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195)
  %212 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %196)
  %213 = getelementptr bfloat, ptr addrspace(1) %4, i64 %105
  %214 = getelementptr bfloat, ptr addrspace(1) %213, i64 %49
  %215 = getelementptr bfloat, ptr addrspace(1) %213, i64 %51
  %216 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %214)
  %217 = extractvalue { i32, i32, i32, i32 } %216, 0
  %218 = bitcast i32 %217 to <2 x bfloat>
  %219 = extractvalue { i32, i32, i32, i32 } %216, 1
  %220 = bitcast i32 %219 to <2 x bfloat>
  %221 = extractvalue { i32, i32, i32, i32 } %216, 2
  %222 = bitcast i32 %221 to <2 x bfloat>
  %223 = extractvalue { i32, i32, i32, i32 } %216, 3
  %224 = bitcast i32 %223 to <2 x bfloat>
  %225 = extractelement <2 x bfloat> %218, i32 0
  %226 = extractelement <2 x bfloat> %218, i32 1
  %227 = extractelement <2 x bfloat> %220, i32 0
  %228 = extractelement <2 x bfloat> %220, i32 1
  %229 = extractelement <2 x bfloat> %222, i32 0
  %230 = extractelement <2 x bfloat> %222, i32 1
  %231 = extractelement <2 x bfloat> %224, i32 0
  %232 = extractelement <2 x bfloat> %224, i32 1
  %233 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %215)
  %234 = extractvalue { i32, i32, i32, i32 } %233, 0
  %235 = bitcast i32 %234 to <2 x bfloat>
  %236 = extractvalue { i32, i32, i32, i32 } %233, 1
  %237 = bitcast i32 %236 to <2 x bfloat>
  %238 = extractvalue { i32, i32, i32, i32 } %233, 2
  %239 = bitcast i32 %238 to <2 x bfloat>
  %240 = extractvalue { i32, i32, i32, i32 } %233, 3
  %241 = bitcast i32 %240 to <2 x bfloat>
  %242 = extractelement <2 x bfloat> %235, i32 0
  %243 = extractelement <2 x bfloat> %235, i32 1
  %244 = extractelement <2 x bfloat> %237, i32 0
  %245 = extractelement <2 x bfloat> %237, i32 1
  %246 = extractelement <2 x bfloat> %239, i32 0
  %247 = extractelement <2 x bfloat> %239, i32 1
  %248 = extractelement <2 x bfloat> %241, i32 0
  %249 = extractelement <2 x bfloat> %241, i32 1
  %250 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %225)
  %251 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %226)
  %252 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %227)
  %253 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %228)
  %254 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %229)
  %255 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %230)
  %256 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %231)
  %257 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %232)
  %258 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242)
  %259 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243)
  %260 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244)
  %261 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245)
  %262 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246)
  %263 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %247)
  %264 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %248)
  %265 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %249)
  %266 = getelementptr float, ptr addrspace(1) %3, i64 %105
  %267 = getelementptr float, ptr addrspace(1) %266, i64 %49
  %268 = getelementptr float, ptr addrspace(1) %266, i64 %50
  %269 = getelementptr float, ptr addrspace(1) %266, i64 %51
  %270 = getelementptr float, ptr addrspace(1) %266, i64 %52
  %271 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %267)
  %272 = extractvalue { i32, i32, i32, i32 } %271, 0
  %273 = bitcast i32 %272 to <1 x float>
  %274 = extractvalue { i32, i32, i32, i32 } %271, 1
  %275 = bitcast i32 %274 to <1 x float>
  %276 = extractvalue { i32, i32, i32, i32 } %271, 2
  %277 = bitcast i32 %276 to <1 x float>
  %278 = extractvalue { i32, i32, i32, i32 } %271, 3
  %279 = bitcast i32 %278 to <1 x float>
  %280 = extractelement <1 x float> %273, i32 0
  %281 = extractelement <1 x float> %275, i32 0
  %282 = extractelement <1 x float> %277, i32 0
  %283 = extractelement <1 x float> %279, i32 0
  %284 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %268)
  %285 = extractvalue { i32, i32, i32, i32 } %284, 0
  %286 = bitcast i32 %285 to <1 x float>
  %287 = extractvalue { i32, i32, i32, i32 } %284, 1
  %288 = bitcast i32 %287 to <1 x float>
  %289 = extractvalue { i32, i32, i32, i32 } %284, 2
  %290 = bitcast i32 %289 to <1 x float>
  %291 = extractvalue { i32, i32, i32, i32 } %284, 3
  %292 = bitcast i32 %291 to <1 x float>
  %293 = extractelement <1 x float> %286, i32 0
  %294 = extractelement <1 x float> %288, i32 0
  %295 = extractelement <1 x float> %290, i32 0
  %296 = extractelement <1 x float> %292, i32 0
  %297 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %269)
  %298 = extractvalue { i32, i32, i32, i32 } %297, 0
  %299 = bitcast i32 %298 to <1 x float>
  %300 = extractvalue { i32, i32, i32, i32 } %297, 1
  %301 = bitcast i32 %300 to <1 x float>
  %302 = extractvalue { i32, i32, i32, i32 } %297, 2
  %303 = bitcast i32 %302 to <1 x float>
  %304 = extractvalue { i32, i32, i32, i32 } %297, 3
  %305 = bitcast i32 %304 to <1 x float>
  %306 = extractelement <1 x float> %299, i32 0
  %307 = extractelement <1 x float> %301, i32 0
  %308 = extractelement <1 x float> %303, i32 0
  %309 = extractelement <1 x float> %305, i32 0
  %310 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %270)
  %311 = extractvalue { i32, i32, i32, i32 } %310, 0
  %312 = bitcast i32 %311 to <1 x float>
  %313 = extractvalue { i32, i32, i32, i32 } %310, 1
  %314 = bitcast i32 %313 to <1 x float>
  %315 = extractvalue { i32, i32, i32, i32 } %310, 2
  %316 = bitcast i32 %315 to <1 x float>
  %317 = extractvalue { i32, i32, i32, i32 } %310, 3
  %318 = bitcast i32 %317 to <1 x float>
  %319 = extractelement <1 x float> %312, i32 0
  %320 = extractelement <1 x float> %314, i32 0
  %321 = extractelement <1 x float> %316, i32 0
  %322 = extractelement <1 x float> %318, i32 0
  %323 = fadd float %250, %280
  %324 = fadd float %251, %281
  %325 = fadd float %252, %282
  %326 = fadd float %253, %283
  %327 = fadd float %254, %293
  %328 = fadd float %255, %294
  %329 = fadd float %256, %295
  %330 = fadd float %257, %296
  %331 = fadd float %258, %306
  %332 = fadd float %259, %307
  %333 = fadd float %260, %308
  %334 = fadd float %261, %309
  %335 = fadd float %262, %319
  %336 = fadd float %263, %320
  %337 = fadd float %264, %321
  %338 = fadd float %265, %322
  %339 = fadd float %197, %323
  %340 = fadd float %198, %324
  %341 = fadd float %199, %325
  %342 = fadd float %200, %326
  %343 = fadd float %201, %327
  %344 = fadd float %202, %328
  %345 = fadd float %203, %329
  %346 = fadd float %204, %330
  %347 = fadd float %205, %331
  %348 = fadd float %206, %332
  %349 = fadd float %207, %333
  %350 = fadd float %208, %334
  %351 = fadd float %209, %335
  %352 = fadd float %210, %336
  %353 = fadd float %211, %337
  %354 = fadd float %212, %338
  %355 = fadd float %143, %339
  %356 = fadd float %144, %340
  %357 = fadd float %145, %341
  %358 = fadd float %146, %342
  %359 = fadd float %147, %343
  %360 = fadd float %148, %344
  %361 = fadd float %149, %345
  %362 = fadd float %150, %346
  %363 = fadd float %151, %347
  %364 = fadd float %152, %348
  %365 = fadd float %153, %349
  %366 = fadd float %154, %350
  %367 = fadd float %155, %351
  %368 = fadd float %156, %352
  %369 = fadd float %157, %353
  %370 = fadd float %158, %354
  %371 = fadd float %89, %355
  %372 = fadd float %90, %356
  %373 = fadd float %91, %357
  %374 = fadd float %92, %358
  %375 = fadd float %93, %359
  %376 = fadd float %94, %360
  %377 = fadd float %95, %361
  %378 = fadd float %96, %362
  %379 = fadd float %97, %363
  %380 = fadd float %98, %364
  %381 = fadd float %99, %365
  %382 = fadd float %100, %366
  %383 = fadd float %101, %367
  %384 = fadd float %102, %368
  %385 = fadd float %103, %369
  %386 = fadd float %104, %370
  %387 = fmul float %371, %371
  %388 = fmul float %372, %372
  %389 = fmul float %373, %373
  %390 = fmul float %374, %374
  %391 = fmul float %375, %375
  %392 = fmul float %376, %376
  %393 = fmul float %377, %377
  %394 = fmul float %378, %378
  %395 = fmul float %379, %379
  %396 = fmul float %380, %380
  %397 = fmul float %381, %381
  %398 = fmul float %382, %382
  %399 = fmul float %383, %383
  %400 = fmul float %384, %384
  %401 = fmul float %385, %385
  %402 = fmul float %386, %386
  %403 = fadd float %387, %388
  %404 = fadd float %403, %389
  %405 = fadd float %404, %390
  %406 = fadd float %405, %391
  %407 = fadd float %406, %392
  %408 = fadd float %407, %393
  %409 = fadd float %408, %394
  %410 = fadd float %409, %395
  %411 = fadd float %410, %396
  %412 = fadd float %411, %397
  %413 = fadd float %412, %398
  %414 = fadd float %413, %399
  %415 = fadd float %414, %400
  %416 = fadd float %415, %401
  %417 = fadd float %416, %402
  %418 = bitcast float %417 to i32
  %419 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %418, i32 16, i32 31)
  %420 = bitcast i32 %419 to float
  %421 = fadd float %417, %420
  %422 = bitcast float %421 to i32
  %423 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %422, i32 8, i32 31)
  %424 = bitcast i32 %423 to float
  %425 = fadd float %421, %424
  %426 = bitcast float %425 to i32
  %427 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %426, i32 4, i32 31)
  %428 = bitcast i32 %427 to float
  %429 = fadd float %425, %428
  %430 = bitcast float %429 to i32
  %431 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %430, i32 2, i32 31)
  %432 = bitcast i32 %431 to float
  %433 = fadd float %429, %432
  %434 = bitcast float %433 to i32
  %435 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %434, i32 1, i32 31)
  %436 = bitcast i32 %435 to float
  %437 = fadd float %433, %436
  %438 = urem i32 %15, 32
  %439 = urem i32 %16, 2
  %440 = icmp eq i32 %438, 0
  %441 = and i1 true, %440
  %442 = add i32 0, %439
  %443 = getelementptr float, ptr addrspace(3) @global_smem, i32 %442
  %444 = insertelement <1 x float> undef, float %437, i32 0
  %445 = extractelement <1 x float> %444, i32 0
  %446 = bitcast float %445 to i32
  %447 = insertelement <1 x i32> undef, i32 %446, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %443, <1 x i32> %447, i1 %441)
  call void @llvm.nvvm.barrier0()
  %448 = icmp slt i32 %14, 2
  %449 = getelementptr float, ptr addrspace(3) @global_smem, i32 %14
  %450 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %449, i1 %448)
  %451 = insertelement <1 x i32> undef, i32 %450, i32 0
  %452 = extractelement <1 x i32> %451, i32 0
  %453 = bitcast i32 %452 to float
  %454 = insertelement <1 x float> undef, float %453, i32 0
  %455 = extractelement <1 x float> %454, i32 0
  %456 = bitcast float %455 to i32
  %457 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %456, i32 1, i32 31)
  %458 = bitcast i32 %457 to float
  %459 = fadd float %455, %458
  %460 = urem i32 %15, 2
  %461 = icmp eq i32 %460, 0
  %462 = and i1 %448, %461
  %463 = insertelement <1 x float> undef, float %459, i32 0
  %464 = extractelement <1 x float> %463, i32 0
  %465 = bitcast float %464 to i32
  %466 = insertelement <1 x i32> undef, i32 %465, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %449, <1 x i32> %466, i1 %462)
  call void @llvm.nvvm.barrier0()
  %467 = load float, ptr addrspace(3) @global_smem, align 4
  %468 = fmul float %467, 0x3F50000000000000
  %469 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %470 = bitcast i32 %469 to <1 x float>
  %471 = extractelement <1 x float> %470, i32 0
  %472 = fadd float %468, %471
  %473 = call float @__nv_rsqrtf(float %472)
  %474 = fmul float %371, %473
  %475 = fmul float %372, %473
  %476 = fmul float %373, %473
  %477 = fmul float %374, %473
  %478 = fmul float %375, %473
  %479 = fmul float %376, %473
  %480 = fmul float %377, %473
  %481 = fmul float %378, %473
  %482 = fmul float %379, %473
  %483 = fmul float %380, %473
  %484 = fmul float %381, %473
  %485 = fmul float %382, %473
  %486 = fmul float %383, %473
  %487 = fmul float %384, %473
  %488 = fmul float %385, %473
  %489 = fmul float %386, %473
  %490 = getelementptr bfloat, ptr addrspace(1) %2, i64 %49
  %491 = getelementptr bfloat, ptr addrspace(1) %2, i64 %51
  %492 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %490)
  %493 = extractvalue { i32, i32, i32, i32 } %492, 0
  %494 = bitcast i32 %493 to <2 x bfloat>
  %495 = extractvalue { i32, i32, i32, i32 } %492, 1
  %496 = bitcast i32 %495 to <2 x bfloat>
  %497 = extractvalue { i32, i32, i32, i32 } %492, 2
  %498 = bitcast i32 %497 to <2 x bfloat>
  %499 = extractvalue { i32, i32, i32, i32 } %492, 3
  %500 = bitcast i32 %499 to <2 x bfloat>
  %501 = extractelement <2 x bfloat> %494, i32 0
  %502 = extractelement <2 x bfloat> %494, i32 1
  %503 = extractelement <2 x bfloat> %496, i32 0
  %504 = extractelement <2 x bfloat> %496, i32 1
  %505 = extractelement <2 x bfloat> %498, i32 0
  %506 = extractelement <2 x bfloat> %498, i32 1
  %507 = extractelement <2 x bfloat> %500, i32 0
  %508 = extractelement <2 x bfloat> %500, i32 1
  %509 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %491)
  %510 = extractvalue { i32, i32, i32, i32 } %509, 0
  %511 = bitcast i32 %510 to <2 x bfloat>
  %512 = extractvalue { i32, i32, i32, i32 } %509, 1
  %513 = bitcast i32 %512 to <2 x bfloat>
  %514 = extractvalue { i32, i32, i32, i32 } %509, 2
  %515 = bitcast i32 %514 to <2 x bfloat>
  %516 = extractvalue { i32, i32, i32, i32 } %509, 3
  %517 = bitcast i32 %516 to <2 x bfloat>
  %518 = extractelement <2 x bfloat> %511, i32 0
  %519 = extractelement <2 x bfloat> %511, i32 1
  %520 = extractelement <2 x bfloat> %513, i32 0
  %521 = extractelement <2 x bfloat> %513, i32 1
  %522 = extractelement <2 x bfloat> %515, i32 0
  %523 = extractelement <2 x bfloat> %515, i32 1
  %524 = extractelement <2 x bfloat> %517, i32 0
  %525 = extractelement <2 x bfloat> %517, i32 1
  %526 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %501)
  %527 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %502)
  %528 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %503)
  %529 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %504)
  %530 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %505)
  %531 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %506)
  %532 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %507)
  %533 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %508)
  %534 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %518)
  %535 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %519)
  %536 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %520)
  %537 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %521)
  %538 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %522)
  %539 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %523)
  %540 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %524)
  %541 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %525)
  %542 = fmul float %474, %526
  %543 = fmul float %475, %527
  %544 = fmul float %476, %528
  %545 = fmul float %477, %529
  %546 = fmul float %478, %530
  %547 = fmul float %479, %531
  %548 = fmul float %480, %532
  %549 = fmul float %481, %533
  %550 = fmul float %482, %534
  %551 = fmul float %483, %535
  %552 = fmul float %484, %536
  %553 = fmul float %485, %537
  %554 = fmul float %486, %538
  %555 = fmul float %487, %539
  %556 = fmul float %488, %540
  %557 = fmul float %489, %541
  %558 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %542)
  %559 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %543)
  %560 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %544)
  %561 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %545)
  %562 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %546)
  %563 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %547)
  %564 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %548)
  %565 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %549)
  %566 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %550)
  %567 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %551)
  %568 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %552)
  %569 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %553)
  %570 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %554)
  %571 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %555)
  %572 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %556)
  %573 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %557)
  %574 = getelementptr bfloat, ptr addrspace(1) %7, i64 %105
  %575 = getelementptr bfloat, ptr addrspace(1) %574, i64 %49
  %576 = getelementptr bfloat, ptr addrspace(1) %574, i64 %51
  %577 = insertelement <2 x bfloat> undef, bfloat %558, i32 0
  %578 = insertelement <2 x bfloat> %577, bfloat %559, i32 1
  %579 = bitcast <2 x bfloat> %578 to i32
  %580 = insertelement <2 x bfloat> undef, bfloat %560, i32 0
  %581 = insertelement <2 x bfloat> %580, bfloat %561, i32 1
  %582 = bitcast <2 x bfloat> %581 to i32
  %583 = insertelement <2 x bfloat> undef, bfloat %562, i32 0
  %584 = insertelement <2 x bfloat> %583, bfloat %563, i32 1
  %585 = bitcast <2 x bfloat> %584 to i32
  %586 = insertelement <2 x bfloat> undef, bfloat %564, i32 0
  %587 = insertelement <2 x bfloat> %586, bfloat %565, i32 1
  %588 = bitcast <2 x bfloat> %587 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %579, i32 %582, i32 %585, i32 %588, ptr addrspace(1) %575)
  %589 = insertelement <2 x bfloat> undef, bfloat %566, i32 0
  %590 = insertelement <2 x bfloat> %589, bfloat %567, i32 1
  %591 = bitcast <2 x bfloat> %590 to i32
  %592 = insertelement <2 x bfloat> undef, bfloat %568, i32 0
  %593 = insertelement <2 x bfloat> %592, bfloat %569, i32 1
  %594 = bitcast <2 x bfloat> %593 to i32
  %595 = insertelement <2 x bfloat> undef, bfloat %570, i32 0
  %596 = insertelement <2 x bfloat> %595, bfloat %571, i32 1
  %597 = bitcast <2 x bfloat> %596 to i32
  %598 = insertelement <2 x bfloat> undef, bfloat %572, i32 0
  %599 = insertelement <2 x bfloat> %598, bfloat %573, i32 1
  %600 = bitcast <2 x bfloat> %599 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %591, i32 %594, i32 %597, i32 %600, ptr addrspace(1) %576)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_164_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_164(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(262144) %arg1, ptr noalias align 128 dereferenceable(3145728) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(524288) %arg4, ptr noalias align 128 dereferenceable(262144) %arg5, ptr noalias align 128 dereferenceable(262144) %arg6, ptr noalias align 128 dereferenceable(262144) %arg7) #6 {
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
  %12 = mul i64 %11, 12288
  %13 = add i64 %12, 3072
  %14 = getelementptr bfloat, ptr addrspace(1) %3, i64 %13
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
  %43 = xor i32 %41, 4
  %44 = xor i32 %41, 512
  %45 = xor i32 %41, 516
  %46 = add i32 %42, 0
  %47 = add i32 %43, 0
  %48 = add i32 %44, 0
  %49 = add i32 %45, 0
  %50 = sext i32 %46 to i64
  %51 = sext i32 %47 to i64
  %52 = sext i32 %48 to i64
  %53 = sext i32 %49 to i64
  %54 = getelementptr bfloat, ptr addrspace(1) %14, i64 %50
  %55 = getelementptr bfloat, ptr addrspace(1) %14, i64 %52
  %56 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %54)
  %57 = extractvalue { i32, i32, i32, i32 } %56, 0
  %58 = bitcast i32 %57 to <2 x bfloat>
  %59 = extractvalue { i32, i32, i32, i32 } %56, 1
  %60 = bitcast i32 %59 to <2 x bfloat>
  %61 = extractvalue { i32, i32, i32, i32 } %56, 2
  %62 = bitcast i32 %61 to <2 x bfloat>
  %63 = extractvalue { i32, i32, i32, i32 } %56, 3
  %64 = bitcast i32 %63 to <2 x bfloat>
  %65 = extractelement <2 x bfloat> %58, i32 0
  %66 = extractelement <2 x bfloat> %58, i32 1
  %67 = extractelement <2 x bfloat> %60, i32 0
  %68 = extractelement <2 x bfloat> %60, i32 1
  %69 = extractelement <2 x bfloat> %62, i32 0
  %70 = extractelement <2 x bfloat> %62, i32 1
  %71 = extractelement <2 x bfloat> %64, i32 0
  %72 = extractelement <2 x bfloat> %64, i32 1
  %73 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %55)
  %74 = extractvalue { i32, i32, i32, i32 } %73, 0
  %75 = bitcast i32 %74 to <2 x bfloat>
  %76 = extractvalue { i32, i32, i32, i32 } %73, 1
  %77 = bitcast i32 %76 to <2 x bfloat>
  %78 = extractvalue { i32, i32, i32, i32 } %73, 2
  %79 = bitcast i32 %78 to <2 x bfloat>
  %80 = extractvalue { i32, i32, i32, i32 } %73, 3
  %81 = bitcast i32 %80 to <2 x bfloat>
  %82 = extractelement <2 x bfloat> %75, i32 0
  %83 = extractelement <2 x bfloat> %75, i32 1
  %84 = extractelement <2 x bfloat> %77, i32 0
  %85 = extractelement <2 x bfloat> %77, i32 1
  %86 = extractelement <2 x bfloat> %79, i32 0
  %87 = extractelement <2 x bfloat> %79, i32 1
  %88 = extractelement <2 x bfloat> %81, i32 0
  %89 = extractelement <2 x bfloat> %81, i32 1
  %90 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %65)
  %91 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %66)
  %92 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %67)
  %93 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %68)
  %94 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %69)
  %95 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %70)
  %96 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %71)
  %97 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %72)
  %98 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82)
  %99 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83)
  %100 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84)
  %101 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85)
  %102 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86)
  %103 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87)
  %104 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88)
  %105 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %89)
  %106 = mul i64 %11, 1024
  %107 = getelementptr bfloat, ptr addrspace(1) %2, i64 %106
  %108 = getelementptr bfloat, ptr addrspace(1) %107, i64 %50
  %109 = getelementptr bfloat, ptr addrspace(1) %107, i64 %52
  %110 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %108)
  %111 = extractvalue { i32, i32, i32, i32 } %110, 0
  %112 = bitcast i32 %111 to <2 x bfloat>
  %113 = extractvalue { i32, i32, i32, i32 } %110, 1
  %114 = bitcast i32 %113 to <2 x bfloat>
  %115 = extractvalue { i32, i32, i32, i32 } %110, 2
  %116 = bitcast i32 %115 to <2 x bfloat>
  %117 = extractvalue { i32, i32, i32, i32 } %110, 3
  %118 = bitcast i32 %117 to <2 x bfloat>
  %119 = extractelement <2 x bfloat> %112, i32 0
  %120 = extractelement <2 x bfloat> %112, i32 1
  %121 = extractelement <2 x bfloat> %114, i32 0
  %122 = extractelement <2 x bfloat> %114, i32 1
  %123 = extractelement <2 x bfloat> %116, i32 0
  %124 = extractelement <2 x bfloat> %116, i32 1
  %125 = extractelement <2 x bfloat> %118, i32 0
  %126 = extractelement <2 x bfloat> %118, i32 1
  %127 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %109)
  %128 = extractvalue { i32, i32, i32, i32 } %127, 0
  %129 = bitcast i32 %128 to <2 x bfloat>
  %130 = extractvalue { i32, i32, i32, i32 } %127, 1
  %131 = bitcast i32 %130 to <2 x bfloat>
  %132 = extractvalue { i32, i32, i32, i32 } %127, 2
  %133 = bitcast i32 %132 to <2 x bfloat>
  %134 = extractvalue { i32, i32, i32, i32 } %127, 3
  %135 = bitcast i32 %134 to <2 x bfloat>
  %136 = extractelement <2 x bfloat> %129, i32 0
  %137 = extractelement <2 x bfloat> %129, i32 1
  %138 = extractelement <2 x bfloat> %131, i32 0
  %139 = extractelement <2 x bfloat> %131, i32 1
  %140 = extractelement <2 x bfloat> %133, i32 0
  %141 = extractelement <2 x bfloat> %133, i32 1
  %142 = extractelement <2 x bfloat> %135, i32 0
  %143 = extractelement <2 x bfloat> %135, i32 1
  %144 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %119)
  %145 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %120)
  %146 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %121)
  %147 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %122)
  %148 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %123)
  %149 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %124)
  %150 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %125)
  %151 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %126)
  %152 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136)
  %153 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137)
  %154 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138)
  %155 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139)
  %156 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140)
  %157 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141)
  %158 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142)
  %159 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %143)
  %160 = add i64 %12, 4096
  %161 = getelementptr bfloat, ptr addrspace(1) %3, i64 %160
  %162 = getelementptr bfloat, ptr addrspace(1) %161, i64 %50
  %163 = getelementptr bfloat, ptr addrspace(1) %161, i64 %52
  %164 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %162)
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
  %181 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %163)
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
  %198 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %173)
  %199 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %174)
  %200 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %175)
  %201 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %176)
  %202 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %177)
  %203 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %178)
  %204 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %179)
  %205 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %180)
  %206 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190)
  %207 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191)
  %208 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192)
  %209 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193)
  %210 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194)
  %211 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195)
  %212 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %196)
  %213 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %197)
  %214 = getelementptr bfloat, ptr addrspace(1) %7, i64 %106
  %215 = getelementptr bfloat, ptr addrspace(1) %214, i64 %50
  %216 = getelementptr bfloat, ptr addrspace(1) %214, i64 %52
  %217 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %215)
  %218 = extractvalue { i32, i32, i32, i32 } %217, 0
  %219 = bitcast i32 %218 to <2 x bfloat>
  %220 = extractvalue { i32, i32, i32, i32 } %217, 1
  %221 = bitcast i32 %220 to <2 x bfloat>
  %222 = extractvalue { i32, i32, i32, i32 } %217, 2
  %223 = bitcast i32 %222 to <2 x bfloat>
  %224 = extractvalue { i32, i32, i32, i32 } %217, 3
  %225 = bitcast i32 %224 to <2 x bfloat>
  %226 = extractelement <2 x bfloat> %219, i32 0
  %227 = extractelement <2 x bfloat> %219, i32 1
  %228 = extractelement <2 x bfloat> %221, i32 0
  %229 = extractelement <2 x bfloat> %221, i32 1
  %230 = extractelement <2 x bfloat> %223, i32 0
  %231 = extractelement <2 x bfloat> %223, i32 1
  %232 = extractelement <2 x bfloat> %225, i32 0
  %233 = extractelement <2 x bfloat> %225, i32 1
  %234 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %216)
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
  %251 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %226)
  %252 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %227)
  %253 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %228)
  %254 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %229)
  %255 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %230)
  %256 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %231)
  %257 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %232)
  %258 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %233)
  %259 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243)
  %260 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244)
  %261 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245)
  %262 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246)
  %263 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %247)
  %264 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %248)
  %265 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %249)
  %266 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %250)
  %267 = add i64 %12, 5120
  %268 = getelementptr bfloat, ptr addrspace(1) %3, i64 %267
  %269 = getelementptr bfloat, ptr addrspace(1) %268, i64 %50
  %270 = getelementptr bfloat, ptr addrspace(1) %268, i64 %52
  %271 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %269)
  %272 = extractvalue { i32, i32, i32, i32 } %271, 0
  %273 = bitcast i32 %272 to <2 x bfloat>
  %274 = extractvalue { i32, i32, i32, i32 } %271, 1
  %275 = bitcast i32 %274 to <2 x bfloat>
  %276 = extractvalue { i32, i32, i32, i32 } %271, 2
  %277 = bitcast i32 %276 to <2 x bfloat>
  %278 = extractvalue { i32, i32, i32, i32 } %271, 3
  %279 = bitcast i32 %278 to <2 x bfloat>
  %280 = extractelement <2 x bfloat> %273, i32 0
  %281 = extractelement <2 x bfloat> %273, i32 1
  %282 = extractelement <2 x bfloat> %275, i32 0
  %283 = extractelement <2 x bfloat> %275, i32 1
  %284 = extractelement <2 x bfloat> %277, i32 0
  %285 = extractelement <2 x bfloat> %277, i32 1
  %286 = extractelement <2 x bfloat> %279, i32 0
  %287 = extractelement <2 x bfloat> %279, i32 1
  %288 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %270)
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
  %305 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %280)
  %306 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %281)
  %307 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %282)
  %308 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %283)
  %309 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %284)
  %310 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %285)
  %311 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %286)
  %312 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %287)
  %313 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297)
  %314 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298)
  %315 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299)
  %316 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300)
  %317 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %301)
  %318 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %302)
  %319 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %303)
  %320 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %304)
  %321 = getelementptr bfloat, ptr addrspace(1) %6, i64 %106
  %322 = getelementptr bfloat, ptr addrspace(1) %321, i64 %50
  %323 = getelementptr bfloat, ptr addrspace(1) %321, i64 %52
  %324 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %322)
  %325 = extractvalue { i32, i32, i32, i32 } %324, 0
  %326 = bitcast i32 %325 to <2 x bfloat>
  %327 = extractvalue { i32, i32, i32, i32 } %324, 1
  %328 = bitcast i32 %327 to <2 x bfloat>
  %329 = extractvalue { i32, i32, i32, i32 } %324, 2
  %330 = bitcast i32 %329 to <2 x bfloat>
  %331 = extractvalue { i32, i32, i32, i32 } %324, 3
  %332 = bitcast i32 %331 to <2 x bfloat>
  %333 = extractelement <2 x bfloat> %326, i32 0
  %334 = extractelement <2 x bfloat> %326, i32 1
  %335 = extractelement <2 x bfloat> %328, i32 0
  %336 = extractelement <2 x bfloat> %328, i32 1
  %337 = extractelement <2 x bfloat> %330, i32 0
  %338 = extractelement <2 x bfloat> %330, i32 1
  %339 = extractelement <2 x bfloat> %332, i32 0
  %340 = extractelement <2 x bfloat> %332, i32 1
  %341 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %323)
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
  %358 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %333)
  %359 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %334)
  %360 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %335)
  %361 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %336)
  %362 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %337)
  %363 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %338)
  %364 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %339)
  %365 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %340)
  %366 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %350)
  %367 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %351)
  %368 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %352)
  %369 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %353)
  %370 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %354)
  %371 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %355)
  %372 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %356)
  %373 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %357)
  %374 = getelementptr float, ptr addrspace(1) %5, i64 %106
  %375 = getelementptr float, ptr addrspace(1) %374, i64 %50
  %376 = getelementptr float, ptr addrspace(1) %374, i64 %51
  %377 = getelementptr float, ptr addrspace(1) %374, i64 %52
  %378 = getelementptr float, ptr addrspace(1) %374, i64 %53
  %379 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %375)
  %380 = extractvalue { i32, i32, i32, i32 } %379, 0
  %381 = bitcast i32 %380 to <1 x float>
  %382 = extractvalue { i32, i32, i32, i32 } %379, 1
  %383 = bitcast i32 %382 to <1 x float>
  %384 = extractvalue { i32, i32, i32, i32 } %379, 2
  %385 = bitcast i32 %384 to <1 x float>
  %386 = extractvalue { i32, i32, i32, i32 } %379, 3
  %387 = bitcast i32 %386 to <1 x float>
  %388 = extractelement <1 x float> %381, i32 0
  %389 = extractelement <1 x float> %383, i32 0
  %390 = extractelement <1 x float> %385, i32 0
  %391 = extractelement <1 x float> %387, i32 0
  %392 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %376)
  %393 = extractvalue { i32, i32, i32, i32 } %392, 0
  %394 = bitcast i32 %393 to <1 x float>
  %395 = extractvalue { i32, i32, i32, i32 } %392, 1
  %396 = bitcast i32 %395 to <1 x float>
  %397 = extractvalue { i32, i32, i32, i32 } %392, 2
  %398 = bitcast i32 %397 to <1 x float>
  %399 = extractvalue { i32, i32, i32, i32 } %392, 3
  %400 = bitcast i32 %399 to <1 x float>
  %401 = extractelement <1 x float> %394, i32 0
  %402 = extractelement <1 x float> %396, i32 0
  %403 = extractelement <1 x float> %398, i32 0
  %404 = extractelement <1 x float> %400, i32 0
  %405 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %377)
  %406 = extractvalue { i32, i32, i32, i32 } %405, 0
  %407 = bitcast i32 %406 to <1 x float>
  %408 = extractvalue { i32, i32, i32, i32 } %405, 1
  %409 = bitcast i32 %408 to <1 x float>
  %410 = extractvalue { i32, i32, i32, i32 } %405, 2
  %411 = bitcast i32 %410 to <1 x float>
  %412 = extractvalue { i32, i32, i32, i32 } %405, 3
  %413 = bitcast i32 %412 to <1 x float>
  %414 = extractelement <1 x float> %407, i32 0
  %415 = extractelement <1 x float> %409, i32 0
  %416 = extractelement <1 x float> %411, i32 0
  %417 = extractelement <1 x float> %413, i32 0
  %418 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %378)
  %419 = extractvalue { i32, i32, i32, i32 } %418, 0
  %420 = bitcast i32 %419 to <1 x float>
  %421 = extractvalue { i32, i32, i32, i32 } %418, 1
  %422 = bitcast i32 %421 to <1 x float>
  %423 = extractvalue { i32, i32, i32, i32 } %418, 2
  %424 = bitcast i32 %423 to <1 x float>
  %425 = extractvalue { i32, i32, i32, i32 } %418, 3
  %426 = bitcast i32 %425 to <1 x float>
  %427 = extractelement <1 x float> %420, i32 0
  %428 = extractelement <1 x float> %422, i32 0
  %429 = extractelement <1 x float> %424, i32 0
  %430 = extractelement <1 x float> %426, i32 0
  %431 = fadd float %358, %388
  %432 = fadd float %359, %389
  %433 = fadd float %360, %390
  %434 = fadd float %361, %391
  %435 = fadd float %362, %401
  %436 = fadd float %363, %402
  %437 = fadd float %364, %403
  %438 = fadd float %365, %404
  %439 = fadd float %366, %414
  %440 = fadd float %367, %415
  %441 = fadd float %368, %416
  %442 = fadd float %369, %417
  %443 = fadd float %370, %427
  %444 = fadd float %371, %428
  %445 = fadd float %372, %429
  %446 = fadd float %373, %430
  %447 = fadd float %305, %431
  %448 = fadd float %306, %432
  %449 = fadd float %307, %433
  %450 = fadd float %308, %434
  %451 = fadd float %309, %435
  %452 = fadd float %310, %436
  %453 = fadd float %311, %437
  %454 = fadd float %312, %438
  %455 = fadd float %313, %439
  %456 = fadd float %314, %440
  %457 = fadd float %315, %441
  %458 = fadd float %316, %442
  %459 = fadd float %317, %443
  %460 = fadd float %318, %444
  %461 = fadd float %319, %445
  %462 = fadd float %320, %446
  %463 = fadd float %251, %447
  %464 = fadd float %252, %448
  %465 = fadd float %253, %449
  %466 = fadd float %254, %450
  %467 = fadd float %255, %451
  %468 = fadd float %256, %452
  %469 = fadd float %257, %453
  %470 = fadd float %258, %454
  %471 = fadd float %259, %455
  %472 = fadd float %260, %456
  %473 = fadd float %261, %457
  %474 = fadd float %262, %458
  %475 = fadd float %263, %459
  %476 = fadd float %264, %460
  %477 = fadd float %265, %461
  %478 = fadd float %266, %462
  %479 = fadd float %198, %463
  %480 = fadd float %199, %464
  %481 = fadd float %200, %465
  %482 = fadd float %201, %466
  %483 = fadd float %202, %467
  %484 = fadd float %203, %468
  %485 = fadd float %204, %469
  %486 = fadd float %205, %470
  %487 = fadd float %206, %471
  %488 = fadd float %207, %472
  %489 = fadd float %208, %473
  %490 = fadd float %209, %474
  %491 = fadd float %210, %475
  %492 = fadd float %211, %476
  %493 = fadd float %212, %477
  %494 = fadd float %213, %478
  %495 = fadd float %144, %479
  %496 = fadd float %145, %480
  %497 = fadd float %146, %481
  %498 = fadd float %147, %482
  %499 = fadd float %148, %483
  %500 = fadd float %149, %484
  %501 = fadd float %150, %485
  %502 = fadd float %151, %486
  %503 = fadd float %152, %487
  %504 = fadd float %153, %488
  %505 = fadd float %154, %489
  %506 = fadd float %155, %490
  %507 = fadd float %156, %491
  %508 = fadd float %157, %492
  %509 = fadd float %158, %493
  %510 = fadd float %159, %494
  %511 = fadd float %90, %495
  %512 = fadd float %91, %496
  %513 = fadd float %92, %497
  %514 = fadd float %93, %498
  %515 = fadd float %94, %499
  %516 = fadd float %95, %500
  %517 = fadd float %96, %501
  %518 = fadd float %97, %502
  %519 = fadd float %98, %503
  %520 = fadd float %99, %504
  %521 = fadd float %100, %505
  %522 = fadd float %101, %506
  %523 = fadd float %102, %507
  %524 = fadd float %103, %508
  %525 = fadd float %104, %509
  %526 = fadd float %105, %510
  %527 = fmul float %511, %511
  %528 = fmul float %512, %512
  %529 = fmul float %513, %513
  %530 = fmul float %514, %514
  %531 = fmul float %515, %515
  %532 = fmul float %516, %516
  %533 = fmul float %517, %517
  %534 = fmul float %518, %518
  %535 = fmul float %519, %519
  %536 = fmul float %520, %520
  %537 = fmul float %521, %521
  %538 = fmul float %522, %522
  %539 = fmul float %523, %523
  %540 = fmul float %524, %524
  %541 = fmul float %525, %525
  %542 = fmul float %526, %526
  %543 = fadd float %527, %528
  %544 = fadd float %543, %529
  %545 = fadd float %544, %530
  %546 = fadd float %545, %531
  %547 = fadd float %546, %532
  %548 = fadd float %547, %533
  %549 = fadd float %548, %534
  %550 = fadd float %549, %535
  %551 = fadd float %550, %536
  %552 = fadd float %551, %537
  %553 = fadd float %552, %538
  %554 = fadd float %553, %539
  %555 = fadd float %554, %540
  %556 = fadd float %555, %541
  %557 = fadd float %556, %542
  %558 = bitcast float %557 to i32
  %559 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %558, i32 16, i32 31)
  %560 = bitcast i32 %559 to float
  %561 = fadd float %557, %560
  %562 = bitcast float %561 to i32
  %563 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %562, i32 8, i32 31)
  %564 = bitcast i32 %563 to float
  %565 = fadd float %561, %564
  %566 = bitcast float %565 to i32
  %567 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %566, i32 4, i32 31)
  %568 = bitcast i32 %567 to float
  %569 = fadd float %565, %568
  %570 = bitcast float %569 to i32
  %571 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %570, i32 2, i32 31)
  %572 = bitcast i32 %571 to float
  %573 = fadd float %569, %572
  %574 = bitcast float %573 to i32
  %575 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %574, i32 1, i32 31)
  %576 = bitcast i32 %575 to float
  %577 = fadd float %573, %576
  %578 = urem i32 %16, 32
  %579 = urem i32 %17, 2
  %580 = icmp eq i32 %578, 0
  %581 = and i1 true, %580
  %582 = add i32 0, %579
  %583 = getelementptr float, ptr addrspace(3) @global_smem, i32 %582
  %584 = insertelement <1 x float> undef, float %577, i32 0
  %585 = extractelement <1 x float> %584, i32 0
  %586 = bitcast float %585 to i32
  %587 = insertelement <1 x i32> undef, i32 %586, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %583, <1 x i32> %587, i1 %581)
  call void @llvm.nvvm.barrier0()
  %588 = icmp slt i32 %15, 2
  %589 = getelementptr float, ptr addrspace(3) @global_smem, i32 %15
  %590 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %589, i1 %588)
  %591 = insertelement <1 x i32> undef, i32 %590, i32 0
  %592 = extractelement <1 x i32> %591, i32 0
  %593 = bitcast i32 %592 to float
  %594 = insertelement <1 x float> undef, float %593, i32 0
  %595 = extractelement <1 x float> %594, i32 0
  %596 = bitcast float %595 to i32
  %597 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %596, i32 1, i32 31)
  %598 = bitcast i32 %597 to float
  %599 = fadd float %595, %598
  %600 = urem i32 %16, 2
  %601 = icmp eq i32 %600, 0
  %602 = and i1 %588, %601
  %603 = insertelement <1 x float> undef, float %599, i32 0
  %604 = extractelement <1 x float> %603, i32 0
  %605 = bitcast float %604 to i32
  %606 = insertelement <1 x i32> undef, i32 %605, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %589, <1 x i32> %606, i1 %602)
  call void @llvm.nvvm.barrier0()
  %607 = load float, ptr addrspace(3) @global_smem, align 4
  %608 = fmul float %607, 0x3F50000000000000
  %609 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %610 = bitcast i32 %609 to <1 x float>
  %611 = extractelement <1 x float> %610, i32 0
  %612 = fadd float %608, %611
  %613 = call float @__nv_rsqrtf(float %612)
  %614 = fmul float %511, %613
  %615 = fmul float %512, %613
  %616 = fmul float %513, %613
  %617 = fmul float %514, %613
  %618 = fmul float %515, %613
  %619 = fmul float %516, %613
  %620 = fmul float %517, %613
  %621 = fmul float %518, %613
  %622 = fmul float %519, %613
  %623 = fmul float %520, %613
  %624 = fmul float %521, %613
  %625 = fmul float %522, %613
  %626 = fmul float %523, %613
  %627 = fmul float %524, %613
  %628 = fmul float %525, %613
  %629 = fmul float %526, %613
  %630 = getelementptr bfloat, ptr addrspace(1) %4, i64 %50
  %631 = getelementptr bfloat, ptr addrspace(1) %4, i64 %52
  %632 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %630)
  %633 = extractvalue { i32, i32, i32, i32 } %632, 0
  %634 = bitcast i32 %633 to <2 x bfloat>
  %635 = extractvalue { i32, i32, i32, i32 } %632, 1
  %636 = bitcast i32 %635 to <2 x bfloat>
  %637 = extractvalue { i32, i32, i32, i32 } %632, 2
  %638 = bitcast i32 %637 to <2 x bfloat>
  %639 = extractvalue { i32, i32, i32, i32 } %632, 3
  %640 = bitcast i32 %639 to <2 x bfloat>
  %641 = extractelement <2 x bfloat> %634, i32 0
  %642 = extractelement <2 x bfloat> %634, i32 1
  %643 = extractelement <2 x bfloat> %636, i32 0
  %644 = extractelement <2 x bfloat> %636, i32 1
  %645 = extractelement <2 x bfloat> %638, i32 0
  %646 = extractelement <2 x bfloat> %638, i32 1
  %647 = extractelement <2 x bfloat> %640, i32 0
  %648 = extractelement <2 x bfloat> %640, i32 1
  %649 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %631)
  %650 = extractvalue { i32, i32, i32, i32 } %649, 0
  %651 = bitcast i32 %650 to <2 x bfloat>
  %652 = extractvalue { i32, i32, i32, i32 } %649, 1
  %653 = bitcast i32 %652 to <2 x bfloat>
  %654 = extractvalue { i32, i32, i32, i32 } %649, 2
  %655 = bitcast i32 %654 to <2 x bfloat>
  %656 = extractvalue { i32, i32, i32, i32 } %649, 3
  %657 = bitcast i32 %656 to <2 x bfloat>
  %658 = extractelement <2 x bfloat> %651, i32 0
  %659 = extractelement <2 x bfloat> %651, i32 1
  %660 = extractelement <2 x bfloat> %653, i32 0
  %661 = extractelement <2 x bfloat> %653, i32 1
  %662 = extractelement <2 x bfloat> %655, i32 0
  %663 = extractelement <2 x bfloat> %655, i32 1
  %664 = extractelement <2 x bfloat> %657, i32 0
  %665 = extractelement <2 x bfloat> %657, i32 1
  %666 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %641)
  %667 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %642)
  %668 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %643)
  %669 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %644)
  %670 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %645)
  %671 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %646)
  %672 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %647)
  %673 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %648)
  %674 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %658)
  %675 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %659)
  %676 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %660)
  %677 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %661)
  %678 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %662)
  %679 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %663)
  %680 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %664)
  %681 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %665)
  %682 = fmul float %614, %666
  %683 = fmul float %615, %667
  %684 = fmul float %616, %668
  %685 = fmul float %617, %669
  %686 = fmul float %618, %670
  %687 = fmul float %619, %671
  %688 = fmul float %620, %672
  %689 = fmul float %621, %673
  %690 = fmul float %622, %674
  %691 = fmul float %623, %675
  %692 = fmul float %624, %676
  %693 = fmul float %625, %677
  %694 = fmul float %626, %678
  %695 = fmul float %627, %679
  %696 = fmul float %628, %680
  %697 = fmul float %629, %681
  %698 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %682)
  %699 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %683)
  %700 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %684)
  %701 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %685)
  %702 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %686)
  %703 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %687)
  %704 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %688)
  %705 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %689)
  %706 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %690)
  %707 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %691)
  %708 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %692)
  %709 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %693)
  %710 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %694)
  %711 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %695)
  %712 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %696)
  %713 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %697)
  %714 = getelementptr bfloat, ptr addrspace(1) %8, i64 %106
  %715 = getelementptr bfloat, ptr addrspace(1) %714, i64 %50
  %716 = getelementptr bfloat, ptr addrspace(1) %714, i64 %52
  %717 = insertelement <2 x bfloat> undef, bfloat %698, i32 0
  %718 = insertelement <2 x bfloat> %717, bfloat %699, i32 1
  %719 = bitcast <2 x bfloat> %718 to i32
  %720 = insertelement <2 x bfloat> undef, bfloat %700, i32 0
  %721 = insertelement <2 x bfloat> %720, bfloat %701, i32 1
  %722 = bitcast <2 x bfloat> %721 to i32
  %723 = insertelement <2 x bfloat> undef, bfloat %702, i32 0
  %724 = insertelement <2 x bfloat> %723, bfloat %703, i32 1
  %725 = bitcast <2 x bfloat> %724 to i32
  %726 = insertelement <2 x bfloat> undef, bfloat %704, i32 0
  %727 = insertelement <2 x bfloat> %726, bfloat %705, i32 1
  %728 = bitcast <2 x bfloat> %727 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %719, i32 %722, i32 %725, i32 %728, ptr addrspace(1) %715)
  %729 = insertelement <2 x bfloat> undef, bfloat %706, i32 0
  %730 = insertelement <2 x bfloat> %729, bfloat %707, i32 1
  %731 = bitcast <2 x bfloat> %730 to i32
  %732 = insertelement <2 x bfloat> undef, bfloat %708, i32 0
  %733 = insertelement <2 x bfloat> %732, bfloat %709, i32 1
  %734 = bitcast <2 x bfloat> %733 to i32
  %735 = insertelement <2 x bfloat> undef, bfloat %710, i32 0
  %736 = insertelement <2 x bfloat> %735, bfloat %711, i32 1
  %737 = bitcast <2 x bfloat> %736 to i32
  %738 = insertelement <2 x bfloat> undef, bfloat %712, i32 0
  %739 = insertelement <2 x bfloat> %738, bfloat %713, i32 1
  %740 = bitcast <2 x bfloat> %739 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %731, i32 %734, i32 %737, i32 %740, ptr addrspace(1) %716)
  ret void

entry:                                            ; No predecessors!
  ret void
}

define ptx_kernel void @loop_add_fusion_2(ptr noalias align 128 dereferenceable(3145728) %0, ptr noalias align 128 dereferenceable(262144) %1, ptr noalias align 128 dereferenceable(262144) %2, ptr noalias align 128 dereferenceable(524288) %3, ptr noalias align 128 dereferenceable(262144) %4, ptr noalias align 128 dereferenceable(262144) %5) #0 {
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %9 = udiv i32 %8, 8
  %10 = urem i32 %8, 8
  %11 = mul i32 %10, 128
  %12 = add i32 %11, %7
  %13 = mul i32 %8, 128
  %14 = add i32 %13, %7
  %15 = getelementptr inbounds bfloat, ptr %4, i32 %14
  %16 = load bfloat, ptr %15, align 2, !invariant.load !3
  %17 = fpext bfloat %16 to float
  %18 = getelementptr inbounds float, ptr %3, i32 %14
  %19 = load float, ptr %18, align 4
  %20 = getelementptr inbounds bfloat, ptr %5, i32 %14
  %21 = load bfloat, ptr %20, align 2, !invariant.load !3
  %22 = add i32 %12, 5120
  %23 = call float @fused_add_2_convert_611_32(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %9, i32 %22)
  %24 = fadd float %17, %19
  %25 = fpext bfloat %21 to float
  %26 = fadd float %23, %24
  %27 = getelementptr inbounds bfloat, ptr %2, i32 %14
  %28 = load bfloat, ptr %27, align 2, !invariant.load !3
  %29 = add i32 %12, 4096
  %30 = call float @fused_add_2_convert_611_32(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %9, i32 %29)
  %31 = fadd float %25, %26
  %32 = fpext bfloat %28 to float
  %33 = fadd float %30, %31
  %34 = getelementptr inbounds bfloat, ptr %1, i32 %14
  %35 = load bfloat, ptr %34, align 2, !invariant.load !3
  %36 = add i32 %12, 3072
  %37 = call float @fused_add_2_convert_611_32(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %9, i32 %36)
  %38 = fadd float %32, %33
  %39 = fpext bfloat %35 to float
  %40 = fadd float %37, %38
  %41 = add i32 %12, 2048
  %42 = call float @fused_add_2_convert_611_32(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %9, i32 %41)
  %43 = fadd float %39, %40
  %44 = fadd float %42, %43
  store float %44, ptr %18, align 4
  ret void
}

define internal float @fused_add_2_convert_611_32(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, i32 %6, i32 %7) {
  %9 = mul i32 %6, 12288
  %10 = add i32 %9, %7
  %11 = getelementptr inbounds bfloat, ptr %0, i32 %10
  %12 = load bfloat, ptr %11, align 2, !invariant.load !3
  %13 = fpext bfloat %12 to float
  ret float %13
}

declare ptx_kernel void @fusion_160_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_160(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(524288) %arg1, ptr noalias align 128 dereferenceable(262144) %arg2, ptr noalias align 128 dereferenceable(3145728) %arg3, ptr noalias align 16 dereferenceable(2048) %arg4, ptr noalias align 128 dereferenceable(262144) %arg5) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %6 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %7 = addrspacecast ptr null to ptr addrspace(1)
  %8 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %9 = sext i32 %8 to i64
  %10 = mul i64 %9, 12288
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
  %41 = xor i32 %39, 4
  %42 = xor i32 %39, 512
  %43 = xor i32 %39, 516
  %44 = add i32 %40, 0
  %45 = add i32 %41, 0
  %46 = add i32 %42, 0
  %47 = add i32 %43, 0
  %48 = sext i32 %44 to i64
  %49 = sext i32 %45 to i64
  %50 = sext i32 %46 to i64
  %51 = sext i32 %47 to i64
  %52 = getelementptr bfloat, ptr addrspace(1) %12, i64 %48
  %53 = getelementptr bfloat, ptr addrspace(1) %12, i64 %50
  %54 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %52)
  %55 = extractvalue { i32, i32, i32, i32 } %54, 0
  %56 = bitcast i32 %55 to <2 x bfloat>
  %57 = extractvalue { i32, i32, i32, i32 } %54, 1
  %58 = bitcast i32 %57 to <2 x bfloat>
  %59 = extractvalue { i32, i32, i32, i32 } %54, 2
  %60 = bitcast i32 %59 to <2 x bfloat>
  %61 = extractvalue { i32, i32, i32, i32 } %54, 3
  %62 = bitcast i32 %61 to <2 x bfloat>
  %63 = extractelement <2 x bfloat> %56, i32 0
  %64 = extractelement <2 x bfloat> %56, i32 1
  %65 = extractelement <2 x bfloat> %58, i32 0
  %66 = extractelement <2 x bfloat> %58, i32 1
  %67 = extractelement <2 x bfloat> %60, i32 0
  %68 = extractelement <2 x bfloat> %60, i32 1
  %69 = extractelement <2 x bfloat> %62, i32 0
  %70 = extractelement <2 x bfloat> %62, i32 1
  %71 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %53)
  %72 = extractvalue { i32, i32, i32, i32 } %71, 0
  %73 = bitcast i32 %72 to <2 x bfloat>
  %74 = extractvalue { i32, i32, i32, i32 } %71, 1
  %75 = bitcast i32 %74 to <2 x bfloat>
  %76 = extractvalue { i32, i32, i32, i32 } %71, 2
  %77 = bitcast i32 %76 to <2 x bfloat>
  %78 = extractvalue { i32, i32, i32, i32 } %71, 3
  %79 = bitcast i32 %78 to <2 x bfloat>
  %80 = extractelement <2 x bfloat> %73, i32 0
  %81 = extractelement <2 x bfloat> %73, i32 1
  %82 = extractelement <2 x bfloat> %75, i32 0
  %83 = extractelement <2 x bfloat> %75, i32 1
  %84 = extractelement <2 x bfloat> %77, i32 0
  %85 = extractelement <2 x bfloat> %77, i32 1
  %86 = extractelement <2 x bfloat> %79, i32 0
  %87 = extractelement <2 x bfloat> %79, i32 1
  %88 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %63)
  %89 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %64)
  %90 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %65)
  %91 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %66)
  %92 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %67)
  %93 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %68)
  %94 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %69)
  %95 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %70)
  %96 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %80)
  %97 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81)
  %98 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82)
  %99 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83)
  %100 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84)
  %101 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85)
  %102 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86)
  %103 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87)
  %104 = mul i64 %9, 1024
  %105 = getelementptr bfloat, ptr addrspace(1) %3, i64 %104
  %106 = getelementptr bfloat, ptr addrspace(1) %105, i64 %48
  %107 = getelementptr bfloat, ptr addrspace(1) %105, i64 %50
  %108 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %106)
  %109 = extractvalue { i32, i32, i32, i32 } %108, 0
  %110 = bitcast i32 %109 to <2 x bfloat>
  %111 = extractvalue { i32, i32, i32, i32 } %108, 1
  %112 = bitcast i32 %111 to <2 x bfloat>
  %113 = extractvalue { i32, i32, i32, i32 } %108, 2
  %114 = bitcast i32 %113 to <2 x bfloat>
  %115 = extractvalue { i32, i32, i32, i32 } %108, 3
  %116 = bitcast i32 %115 to <2 x bfloat>
  %117 = extractelement <2 x bfloat> %110, i32 0
  %118 = extractelement <2 x bfloat> %110, i32 1
  %119 = extractelement <2 x bfloat> %112, i32 0
  %120 = extractelement <2 x bfloat> %112, i32 1
  %121 = extractelement <2 x bfloat> %114, i32 0
  %122 = extractelement <2 x bfloat> %114, i32 1
  %123 = extractelement <2 x bfloat> %116, i32 0
  %124 = extractelement <2 x bfloat> %116, i32 1
  %125 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %107)
  %126 = extractvalue { i32, i32, i32, i32 } %125, 0
  %127 = bitcast i32 %126 to <2 x bfloat>
  %128 = extractvalue { i32, i32, i32, i32 } %125, 1
  %129 = bitcast i32 %128 to <2 x bfloat>
  %130 = extractvalue { i32, i32, i32, i32 } %125, 2
  %131 = bitcast i32 %130 to <2 x bfloat>
  %132 = extractvalue { i32, i32, i32, i32 } %125, 3
  %133 = bitcast i32 %132 to <2 x bfloat>
  %134 = extractelement <2 x bfloat> %127, i32 0
  %135 = extractelement <2 x bfloat> %127, i32 1
  %136 = extractelement <2 x bfloat> %129, i32 0
  %137 = extractelement <2 x bfloat> %129, i32 1
  %138 = extractelement <2 x bfloat> %131, i32 0
  %139 = extractelement <2 x bfloat> %131, i32 1
  %140 = extractelement <2 x bfloat> %133, i32 0
  %141 = extractelement <2 x bfloat> %133, i32 1
  %142 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %117)
  %143 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %118)
  %144 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %119)
  %145 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %120)
  %146 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %121)
  %147 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %122)
  %148 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %123)
  %149 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %124)
  %150 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %134)
  %151 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135)
  %152 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136)
  %153 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137)
  %154 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138)
  %155 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139)
  %156 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140)
  %157 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141)
  %158 = getelementptr float, ptr addrspace(1) %2, i64 %104
  %159 = getelementptr float, ptr addrspace(1) %158, i64 %48
  %160 = getelementptr float, ptr addrspace(1) %158, i64 %49
  %161 = getelementptr float, ptr addrspace(1) %158, i64 %50
  %162 = getelementptr float, ptr addrspace(1) %158, i64 %51
  %163 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %159)
  %164 = extractvalue { i32, i32, i32, i32 } %163, 0
  %165 = bitcast i32 %164 to <1 x float>
  %166 = extractvalue { i32, i32, i32, i32 } %163, 1
  %167 = bitcast i32 %166 to <1 x float>
  %168 = extractvalue { i32, i32, i32, i32 } %163, 2
  %169 = bitcast i32 %168 to <1 x float>
  %170 = extractvalue { i32, i32, i32, i32 } %163, 3
  %171 = bitcast i32 %170 to <1 x float>
  %172 = extractelement <1 x float> %165, i32 0
  %173 = extractelement <1 x float> %167, i32 0
  %174 = extractelement <1 x float> %169, i32 0
  %175 = extractelement <1 x float> %171, i32 0
  %176 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %160)
  %177 = extractvalue { i32, i32, i32, i32 } %176, 0
  %178 = bitcast i32 %177 to <1 x float>
  %179 = extractvalue { i32, i32, i32, i32 } %176, 1
  %180 = bitcast i32 %179 to <1 x float>
  %181 = extractvalue { i32, i32, i32, i32 } %176, 2
  %182 = bitcast i32 %181 to <1 x float>
  %183 = extractvalue { i32, i32, i32, i32 } %176, 3
  %184 = bitcast i32 %183 to <1 x float>
  %185 = extractelement <1 x float> %178, i32 0
  %186 = extractelement <1 x float> %180, i32 0
  %187 = extractelement <1 x float> %182, i32 0
  %188 = extractelement <1 x float> %184, i32 0
  %189 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %161)
  %190 = extractvalue { i32, i32, i32, i32 } %189, 0
  %191 = bitcast i32 %190 to <1 x float>
  %192 = extractvalue { i32, i32, i32, i32 } %189, 1
  %193 = bitcast i32 %192 to <1 x float>
  %194 = extractvalue { i32, i32, i32, i32 } %189, 2
  %195 = bitcast i32 %194 to <1 x float>
  %196 = extractvalue { i32, i32, i32, i32 } %189, 3
  %197 = bitcast i32 %196 to <1 x float>
  %198 = extractelement <1 x float> %191, i32 0
  %199 = extractelement <1 x float> %193, i32 0
  %200 = extractelement <1 x float> %195, i32 0
  %201 = extractelement <1 x float> %197, i32 0
  %202 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %162)
  %203 = extractvalue { i32, i32, i32, i32 } %202, 0
  %204 = bitcast i32 %203 to <1 x float>
  %205 = extractvalue { i32, i32, i32, i32 } %202, 1
  %206 = bitcast i32 %205 to <1 x float>
  %207 = extractvalue { i32, i32, i32, i32 } %202, 2
  %208 = bitcast i32 %207 to <1 x float>
  %209 = extractvalue { i32, i32, i32, i32 } %202, 3
  %210 = bitcast i32 %209 to <1 x float>
  %211 = extractelement <1 x float> %204, i32 0
  %212 = extractelement <1 x float> %206, i32 0
  %213 = extractelement <1 x float> %208, i32 0
  %214 = extractelement <1 x float> %210, i32 0
  %215 = fadd float %142, %172
  %216 = fadd float %143, %173
  %217 = fadd float %144, %174
  %218 = fadd float %145, %175
  %219 = fadd float %146, %185
  %220 = fadd float %147, %186
  %221 = fadd float %148, %187
  %222 = fadd float %149, %188
  %223 = fadd float %150, %198
  %224 = fadd float %151, %199
  %225 = fadd float %152, %200
  %226 = fadd float %153, %201
  %227 = fadd float %154, %211
  %228 = fadd float %155, %212
  %229 = fadd float %156, %213
  %230 = fadd float %157, %214
  %231 = fadd float %88, %215
  %232 = fadd float %89, %216
  %233 = fadd float %90, %217
  %234 = fadd float %91, %218
  %235 = fadd float %92, %219
  %236 = fadd float %93, %220
  %237 = fadd float %94, %221
  %238 = fadd float %95, %222
  %239 = fadd float %96, %223
  %240 = fadd float %97, %224
  %241 = fadd float %98, %225
  %242 = fadd float %99, %226
  %243 = fadd float %100, %227
  %244 = fadd float %101, %228
  %245 = fadd float %102, %229
  %246 = fadd float %103, %230
  %247 = fmul float %231, %231
  %248 = fmul float %232, %232
  %249 = fmul float %233, %233
  %250 = fmul float %234, %234
  %251 = fmul float %235, %235
  %252 = fmul float %236, %236
  %253 = fmul float %237, %237
  %254 = fmul float %238, %238
  %255 = fmul float %239, %239
  %256 = fmul float %240, %240
  %257 = fmul float %241, %241
  %258 = fmul float %242, %242
  %259 = fmul float %243, %243
  %260 = fmul float %244, %244
  %261 = fmul float %245, %245
  %262 = fmul float %246, %246
  %263 = fadd float %247, %248
  %264 = fadd float %263, %249
  %265 = fadd float %264, %250
  %266 = fadd float %265, %251
  %267 = fadd float %266, %252
  %268 = fadd float %267, %253
  %269 = fadd float %268, %254
  %270 = fadd float %269, %255
  %271 = fadd float %270, %256
  %272 = fadd float %271, %257
  %273 = fadd float %272, %258
  %274 = fadd float %273, %259
  %275 = fadd float %274, %260
  %276 = fadd float %275, %261
  %277 = fadd float %276, %262
  %278 = bitcast float %277 to i32
  %279 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %278, i32 16, i32 31)
  %280 = bitcast i32 %279 to float
  %281 = fadd float %277, %280
  %282 = bitcast float %281 to i32
  %283 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %282, i32 8, i32 31)
  %284 = bitcast i32 %283 to float
  %285 = fadd float %281, %284
  %286 = bitcast float %285 to i32
  %287 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %286, i32 4, i32 31)
  %288 = bitcast i32 %287 to float
  %289 = fadd float %285, %288
  %290 = bitcast float %289 to i32
  %291 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %290, i32 2, i32 31)
  %292 = bitcast i32 %291 to float
  %293 = fadd float %289, %292
  %294 = bitcast float %293 to i32
  %295 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %294, i32 1, i32 31)
  %296 = bitcast i32 %295 to float
  %297 = fadd float %293, %296
  %298 = urem i32 %14, 32
  %299 = urem i32 %15, 2
  %300 = icmp eq i32 %298, 0
  %301 = and i1 true, %300
  %302 = add i32 0, %299
  %303 = getelementptr float, ptr addrspace(3) @global_smem, i32 %302
  %304 = insertelement <1 x float> undef, float %297, i32 0
  %305 = extractelement <1 x float> %304, i32 0
  %306 = bitcast float %305 to i32
  %307 = insertelement <1 x i32> undef, i32 %306, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %303, <1 x i32> %307, i1 %301)
  call void @llvm.nvvm.barrier0()
  %308 = icmp slt i32 %13, 2
  %309 = getelementptr float, ptr addrspace(3) @global_smem, i32 %13
  %310 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %309, i1 %308)
  %311 = insertelement <1 x i32> undef, i32 %310, i32 0
  %312 = extractelement <1 x i32> %311, i32 0
  %313 = bitcast i32 %312 to float
  %314 = insertelement <1 x float> undef, float %313, i32 0
  %315 = extractelement <1 x float> %314, i32 0
  %316 = bitcast float %315 to i32
  %317 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %316, i32 1, i32 31)
  %318 = bitcast i32 %317 to float
  %319 = fadd float %315, %318
  %320 = urem i32 %14, 2
  %321 = icmp eq i32 %320, 0
  %322 = and i1 %308, %321
  %323 = insertelement <1 x float> undef, float %319, i32 0
  %324 = extractelement <1 x float> %323, i32 0
  %325 = bitcast float %324 to i32
  %326 = insertelement <1 x i32> undef, i32 %325, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %309, <1 x i32> %326, i1 %322)
  call void @llvm.nvvm.barrier0()
  %327 = load float, ptr addrspace(3) @global_smem, align 4
  %328 = fmul float %327, 0x3F50000000000000
  %329 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %330 = bitcast i32 %329 to <1 x float>
  %331 = extractelement <1 x float> %330, i32 0
  %332 = fadd float %328, %331
  %333 = call float @__nv_rsqrtf(float %332)
  %334 = fmul float %231, %333
  %335 = fmul float %232, %333
  %336 = fmul float %233, %333
  %337 = fmul float %234, %333
  %338 = fmul float %235, %333
  %339 = fmul float %236, %333
  %340 = fmul float %237, %333
  %341 = fmul float %238, %333
  %342 = fmul float %239, %333
  %343 = fmul float %240, %333
  %344 = fmul float %241, %333
  %345 = fmul float %242, %333
  %346 = fmul float %243, %333
  %347 = fmul float %244, %333
  %348 = fmul float %245, %333
  %349 = fmul float %246, %333
  %350 = getelementptr bfloat, ptr addrspace(1) %5, i64 %48
  %351 = getelementptr bfloat, ptr addrspace(1) %5, i64 %50
  %352 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %350)
  %353 = extractvalue { i32, i32, i32, i32 } %352, 0
  %354 = bitcast i32 %353 to <2 x bfloat>
  %355 = extractvalue { i32, i32, i32, i32 } %352, 1
  %356 = bitcast i32 %355 to <2 x bfloat>
  %357 = extractvalue { i32, i32, i32, i32 } %352, 2
  %358 = bitcast i32 %357 to <2 x bfloat>
  %359 = extractvalue { i32, i32, i32, i32 } %352, 3
  %360 = bitcast i32 %359 to <2 x bfloat>
  %361 = extractelement <2 x bfloat> %354, i32 0
  %362 = extractelement <2 x bfloat> %354, i32 1
  %363 = extractelement <2 x bfloat> %356, i32 0
  %364 = extractelement <2 x bfloat> %356, i32 1
  %365 = extractelement <2 x bfloat> %358, i32 0
  %366 = extractelement <2 x bfloat> %358, i32 1
  %367 = extractelement <2 x bfloat> %360, i32 0
  %368 = extractelement <2 x bfloat> %360, i32 1
  %369 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %351)
  %370 = extractvalue { i32, i32, i32, i32 } %369, 0
  %371 = bitcast i32 %370 to <2 x bfloat>
  %372 = extractvalue { i32, i32, i32, i32 } %369, 1
  %373 = bitcast i32 %372 to <2 x bfloat>
  %374 = extractvalue { i32, i32, i32, i32 } %369, 2
  %375 = bitcast i32 %374 to <2 x bfloat>
  %376 = extractvalue { i32, i32, i32, i32 } %369, 3
  %377 = bitcast i32 %376 to <2 x bfloat>
  %378 = extractelement <2 x bfloat> %371, i32 0
  %379 = extractelement <2 x bfloat> %371, i32 1
  %380 = extractelement <2 x bfloat> %373, i32 0
  %381 = extractelement <2 x bfloat> %373, i32 1
  %382 = extractelement <2 x bfloat> %375, i32 0
  %383 = extractelement <2 x bfloat> %375, i32 1
  %384 = extractelement <2 x bfloat> %377, i32 0
  %385 = extractelement <2 x bfloat> %377, i32 1
  %386 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %361)
  %387 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %362)
  %388 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %363)
  %389 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %364)
  %390 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %365)
  %391 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %366)
  %392 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %367)
  %393 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %368)
  %394 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %378)
  %395 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %379)
  %396 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %380)
  %397 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %381)
  %398 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %382)
  %399 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %383)
  %400 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %384)
  %401 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %385)
  %402 = fmul float %334, %386
  %403 = fmul float %335, %387
  %404 = fmul float %336, %388
  %405 = fmul float %337, %389
  %406 = fmul float %338, %390
  %407 = fmul float %339, %391
  %408 = fmul float %340, %392
  %409 = fmul float %341, %393
  %410 = fmul float %342, %394
  %411 = fmul float %343, %395
  %412 = fmul float %344, %396
  %413 = fmul float %345, %397
  %414 = fmul float %346, %398
  %415 = fmul float %347, %399
  %416 = fmul float %348, %400
  %417 = fmul float %349, %401
  %418 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %402)
  %419 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %403)
  %420 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %404)
  %421 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %405)
  %422 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %406)
  %423 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %407)
  %424 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %408)
  %425 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %409)
  %426 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %410)
  %427 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %411)
  %428 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %412)
  %429 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %413)
  %430 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %414)
  %431 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %415)
  %432 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %416)
  %433 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %417)
  %434 = getelementptr bfloat, ptr addrspace(1) %6, i64 %104
  %435 = getelementptr bfloat, ptr addrspace(1) %434, i64 %48
  %436 = getelementptr bfloat, ptr addrspace(1) %434, i64 %50
  %437 = insertelement <2 x bfloat> undef, bfloat %418, i32 0
  %438 = insertelement <2 x bfloat> %437, bfloat %419, i32 1
  %439 = bitcast <2 x bfloat> %438 to i32
  %440 = insertelement <2 x bfloat> undef, bfloat %420, i32 0
  %441 = insertelement <2 x bfloat> %440, bfloat %421, i32 1
  %442 = bitcast <2 x bfloat> %441 to i32
  %443 = insertelement <2 x bfloat> undef, bfloat %422, i32 0
  %444 = insertelement <2 x bfloat> %443, bfloat %423, i32 1
  %445 = bitcast <2 x bfloat> %444 to i32
  %446 = insertelement <2 x bfloat> undef, bfloat %424, i32 0
  %447 = insertelement <2 x bfloat> %446, bfloat %425, i32 1
  %448 = bitcast <2 x bfloat> %447 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %439, i32 %442, i32 %445, i32 %448, ptr addrspace(1) %435)
  %449 = insertelement <2 x bfloat> undef, bfloat %426, i32 0
  %450 = insertelement <2 x bfloat> %449, bfloat %427, i32 1
  %451 = bitcast <2 x bfloat> %450 to i32
  %452 = insertelement <2 x bfloat> undef, bfloat %428, i32 0
  %453 = insertelement <2 x bfloat> %452, bfloat %429, i32 1
  %454 = bitcast <2 x bfloat> %453 to i32
  %455 = insertelement <2 x bfloat> undef, bfloat %430, i32 0
  %456 = insertelement <2 x bfloat> %455, bfloat %431, i32 1
  %457 = bitcast <2 x bfloat> %456 to i32
  %458 = insertelement <2 x bfloat> undef, bfloat %432, i32 0
  %459 = insertelement <2 x bfloat> %458, bfloat %433, i32 1
  %460 = bitcast <2 x bfloat> %459 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %451, i32 %454, i32 %457, i32 %460, ptr addrspace(1) %436)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_158_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_158(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(524288) %arg2, ptr noalias align 128 dereferenceable(262144) %arg3, ptr noalias align 128 dereferenceable(3145728) %arg4, ptr noalias align 128 dereferenceable(262144) %arg5, ptr noalias align 128 dereferenceable(262144) %arg6) #6 {
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
  %11 = mul i64 %10, 12288
  %12 = getelementptr bfloat, ptr addrspace(1) %5, i64 %11
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
  %41 = xor i32 %39, 4
  %42 = xor i32 %39, 512
  %43 = xor i32 %39, 516
  %44 = add i32 %40, 0
  %45 = add i32 %41, 0
  %46 = add i32 %42, 0
  %47 = add i32 %43, 0
  %48 = sext i32 %44 to i64
  %49 = sext i32 %45 to i64
  %50 = sext i32 %46 to i64
  %51 = sext i32 %47 to i64
  %52 = getelementptr bfloat, ptr addrspace(1) %12, i64 %48
  %53 = getelementptr bfloat, ptr addrspace(1) %12, i64 %50
  %54 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %52)
  %55 = extractvalue { i32, i32, i32, i32 } %54, 0
  %56 = bitcast i32 %55 to <2 x bfloat>
  %57 = extractvalue { i32, i32, i32, i32 } %54, 1
  %58 = bitcast i32 %57 to <2 x bfloat>
  %59 = extractvalue { i32, i32, i32, i32 } %54, 2
  %60 = bitcast i32 %59 to <2 x bfloat>
  %61 = extractvalue { i32, i32, i32, i32 } %54, 3
  %62 = bitcast i32 %61 to <2 x bfloat>
  %63 = extractelement <2 x bfloat> %56, i32 0
  %64 = extractelement <2 x bfloat> %56, i32 1
  %65 = extractelement <2 x bfloat> %58, i32 0
  %66 = extractelement <2 x bfloat> %58, i32 1
  %67 = extractelement <2 x bfloat> %60, i32 0
  %68 = extractelement <2 x bfloat> %60, i32 1
  %69 = extractelement <2 x bfloat> %62, i32 0
  %70 = extractelement <2 x bfloat> %62, i32 1
  %71 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %53)
  %72 = extractvalue { i32, i32, i32, i32 } %71, 0
  %73 = bitcast i32 %72 to <2 x bfloat>
  %74 = extractvalue { i32, i32, i32, i32 } %71, 1
  %75 = bitcast i32 %74 to <2 x bfloat>
  %76 = extractvalue { i32, i32, i32, i32 } %71, 2
  %77 = bitcast i32 %76 to <2 x bfloat>
  %78 = extractvalue { i32, i32, i32, i32 } %71, 3
  %79 = bitcast i32 %78 to <2 x bfloat>
  %80 = extractelement <2 x bfloat> %73, i32 0
  %81 = extractelement <2 x bfloat> %73, i32 1
  %82 = extractelement <2 x bfloat> %75, i32 0
  %83 = extractelement <2 x bfloat> %75, i32 1
  %84 = extractelement <2 x bfloat> %77, i32 0
  %85 = extractelement <2 x bfloat> %77, i32 1
  %86 = extractelement <2 x bfloat> %79, i32 0
  %87 = extractelement <2 x bfloat> %79, i32 1
  %88 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %63)
  %89 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %64)
  %90 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %65)
  %91 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %66)
  %92 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %67)
  %93 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %68)
  %94 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %69)
  %95 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %70)
  %96 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %80)
  %97 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81)
  %98 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82)
  %99 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83)
  %100 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84)
  %101 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85)
  %102 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86)
  %103 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87)
  %104 = mul i64 %10, 1024
  %105 = getelementptr bfloat, ptr addrspace(1) %6, i64 %104
  %106 = getelementptr bfloat, ptr addrspace(1) %105, i64 %48
  %107 = getelementptr bfloat, ptr addrspace(1) %105, i64 %50
  %108 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %106)
  %109 = extractvalue { i32, i32, i32, i32 } %108, 0
  %110 = bitcast i32 %109 to <2 x bfloat>
  %111 = extractvalue { i32, i32, i32, i32 } %108, 1
  %112 = bitcast i32 %111 to <2 x bfloat>
  %113 = extractvalue { i32, i32, i32, i32 } %108, 2
  %114 = bitcast i32 %113 to <2 x bfloat>
  %115 = extractvalue { i32, i32, i32, i32 } %108, 3
  %116 = bitcast i32 %115 to <2 x bfloat>
  %117 = extractelement <2 x bfloat> %110, i32 0
  %118 = extractelement <2 x bfloat> %110, i32 1
  %119 = extractelement <2 x bfloat> %112, i32 0
  %120 = extractelement <2 x bfloat> %112, i32 1
  %121 = extractelement <2 x bfloat> %114, i32 0
  %122 = extractelement <2 x bfloat> %114, i32 1
  %123 = extractelement <2 x bfloat> %116, i32 0
  %124 = extractelement <2 x bfloat> %116, i32 1
  %125 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %107)
  %126 = extractvalue { i32, i32, i32, i32 } %125, 0
  %127 = bitcast i32 %126 to <2 x bfloat>
  %128 = extractvalue { i32, i32, i32, i32 } %125, 1
  %129 = bitcast i32 %128 to <2 x bfloat>
  %130 = extractvalue { i32, i32, i32, i32 } %125, 2
  %131 = bitcast i32 %130 to <2 x bfloat>
  %132 = extractvalue { i32, i32, i32, i32 } %125, 3
  %133 = bitcast i32 %132 to <2 x bfloat>
  %134 = extractelement <2 x bfloat> %127, i32 0
  %135 = extractelement <2 x bfloat> %127, i32 1
  %136 = extractelement <2 x bfloat> %129, i32 0
  %137 = extractelement <2 x bfloat> %129, i32 1
  %138 = extractelement <2 x bfloat> %131, i32 0
  %139 = extractelement <2 x bfloat> %131, i32 1
  %140 = extractelement <2 x bfloat> %133, i32 0
  %141 = extractelement <2 x bfloat> %133, i32 1
  %142 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %117)
  %143 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %118)
  %144 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %119)
  %145 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %120)
  %146 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %121)
  %147 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %122)
  %148 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %123)
  %149 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %124)
  %150 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %134)
  %151 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135)
  %152 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136)
  %153 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137)
  %154 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138)
  %155 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139)
  %156 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140)
  %157 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141)
  %158 = add i64 %11, 1024
  %159 = getelementptr bfloat, ptr addrspace(1) %5, i64 %158
  %160 = getelementptr bfloat, ptr addrspace(1) %159, i64 %48
  %161 = getelementptr bfloat, ptr addrspace(1) %159, i64 %50
  %162 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %160)
  %163 = extractvalue { i32, i32, i32, i32 } %162, 0
  %164 = bitcast i32 %163 to <2 x bfloat>
  %165 = extractvalue { i32, i32, i32, i32 } %162, 1
  %166 = bitcast i32 %165 to <2 x bfloat>
  %167 = extractvalue { i32, i32, i32, i32 } %162, 2
  %168 = bitcast i32 %167 to <2 x bfloat>
  %169 = extractvalue { i32, i32, i32, i32 } %162, 3
  %170 = bitcast i32 %169 to <2 x bfloat>
  %171 = extractelement <2 x bfloat> %164, i32 0
  %172 = extractelement <2 x bfloat> %164, i32 1
  %173 = extractelement <2 x bfloat> %166, i32 0
  %174 = extractelement <2 x bfloat> %166, i32 1
  %175 = extractelement <2 x bfloat> %168, i32 0
  %176 = extractelement <2 x bfloat> %168, i32 1
  %177 = extractelement <2 x bfloat> %170, i32 0
  %178 = extractelement <2 x bfloat> %170, i32 1
  %179 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %161)
  %180 = extractvalue { i32, i32, i32, i32 } %179, 0
  %181 = bitcast i32 %180 to <2 x bfloat>
  %182 = extractvalue { i32, i32, i32, i32 } %179, 1
  %183 = bitcast i32 %182 to <2 x bfloat>
  %184 = extractvalue { i32, i32, i32, i32 } %179, 2
  %185 = bitcast i32 %184 to <2 x bfloat>
  %186 = extractvalue { i32, i32, i32, i32 } %179, 3
  %187 = bitcast i32 %186 to <2 x bfloat>
  %188 = extractelement <2 x bfloat> %181, i32 0
  %189 = extractelement <2 x bfloat> %181, i32 1
  %190 = extractelement <2 x bfloat> %183, i32 0
  %191 = extractelement <2 x bfloat> %183, i32 1
  %192 = extractelement <2 x bfloat> %185, i32 0
  %193 = extractelement <2 x bfloat> %185, i32 1
  %194 = extractelement <2 x bfloat> %187, i32 0
  %195 = extractelement <2 x bfloat> %187, i32 1
  %196 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %171)
  %197 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %172)
  %198 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %173)
  %199 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %174)
  %200 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %175)
  %201 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %176)
  %202 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %177)
  %203 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %178)
  %204 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188)
  %205 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189)
  %206 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190)
  %207 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191)
  %208 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192)
  %209 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193)
  %210 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194)
  %211 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195)
  %212 = getelementptr bfloat, ptr addrspace(1) %4, i64 %104
  %213 = getelementptr bfloat, ptr addrspace(1) %212, i64 %48
  %214 = getelementptr bfloat, ptr addrspace(1) %212, i64 %50
  %215 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %213)
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
  %232 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %214)
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
  %249 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %224)
  %250 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %225)
  %251 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %226)
  %252 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %227)
  %253 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %228)
  %254 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %229)
  %255 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %230)
  %256 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %231)
  %257 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %241)
  %258 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242)
  %259 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243)
  %260 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244)
  %261 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245)
  %262 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246)
  %263 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %247)
  %264 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %248)
  %265 = getelementptr float, ptr addrspace(1) %3, i64 %104
  %266 = getelementptr float, ptr addrspace(1) %265, i64 %48
  %267 = getelementptr float, ptr addrspace(1) %265, i64 %49
  %268 = getelementptr float, ptr addrspace(1) %265, i64 %50
  %269 = getelementptr float, ptr addrspace(1) %265, i64 %51
  %270 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %266)
  %271 = extractvalue { i32, i32, i32, i32 } %270, 0
  %272 = bitcast i32 %271 to <1 x float>
  %273 = extractvalue { i32, i32, i32, i32 } %270, 1
  %274 = bitcast i32 %273 to <1 x float>
  %275 = extractvalue { i32, i32, i32, i32 } %270, 2
  %276 = bitcast i32 %275 to <1 x float>
  %277 = extractvalue { i32, i32, i32, i32 } %270, 3
  %278 = bitcast i32 %277 to <1 x float>
  %279 = extractelement <1 x float> %272, i32 0
  %280 = extractelement <1 x float> %274, i32 0
  %281 = extractelement <1 x float> %276, i32 0
  %282 = extractelement <1 x float> %278, i32 0
  %283 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %267)
  %284 = extractvalue { i32, i32, i32, i32 } %283, 0
  %285 = bitcast i32 %284 to <1 x float>
  %286 = extractvalue { i32, i32, i32, i32 } %283, 1
  %287 = bitcast i32 %286 to <1 x float>
  %288 = extractvalue { i32, i32, i32, i32 } %283, 2
  %289 = bitcast i32 %288 to <1 x float>
  %290 = extractvalue { i32, i32, i32, i32 } %283, 3
  %291 = bitcast i32 %290 to <1 x float>
  %292 = extractelement <1 x float> %285, i32 0
  %293 = extractelement <1 x float> %287, i32 0
  %294 = extractelement <1 x float> %289, i32 0
  %295 = extractelement <1 x float> %291, i32 0
  %296 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %268)
  %297 = extractvalue { i32, i32, i32, i32 } %296, 0
  %298 = bitcast i32 %297 to <1 x float>
  %299 = extractvalue { i32, i32, i32, i32 } %296, 1
  %300 = bitcast i32 %299 to <1 x float>
  %301 = extractvalue { i32, i32, i32, i32 } %296, 2
  %302 = bitcast i32 %301 to <1 x float>
  %303 = extractvalue { i32, i32, i32, i32 } %296, 3
  %304 = bitcast i32 %303 to <1 x float>
  %305 = extractelement <1 x float> %298, i32 0
  %306 = extractelement <1 x float> %300, i32 0
  %307 = extractelement <1 x float> %302, i32 0
  %308 = extractelement <1 x float> %304, i32 0
  %309 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %269)
  %310 = extractvalue { i32, i32, i32, i32 } %309, 0
  %311 = bitcast i32 %310 to <1 x float>
  %312 = extractvalue { i32, i32, i32, i32 } %309, 1
  %313 = bitcast i32 %312 to <1 x float>
  %314 = extractvalue { i32, i32, i32, i32 } %309, 2
  %315 = bitcast i32 %314 to <1 x float>
  %316 = extractvalue { i32, i32, i32, i32 } %309, 3
  %317 = bitcast i32 %316 to <1 x float>
  %318 = extractelement <1 x float> %311, i32 0
  %319 = extractelement <1 x float> %313, i32 0
  %320 = extractelement <1 x float> %315, i32 0
  %321 = extractelement <1 x float> %317, i32 0
  %322 = fadd float %249, %279
  %323 = fadd float %250, %280
  %324 = fadd float %251, %281
  %325 = fadd float %252, %282
  %326 = fadd float %253, %292
  %327 = fadd float %254, %293
  %328 = fadd float %255, %294
  %329 = fadd float %256, %295
  %330 = fadd float %257, %305
  %331 = fadd float %258, %306
  %332 = fadd float %259, %307
  %333 = fadd float %260, %308
  %334 = fadd float %261, %318
  %335 = fadd float %262, %319
  %336 = fadd float %263, %320
  %337 = fadd float %264, %321
  %338 = fadd float %196, %322
  %339 = fadd float %197, %323
  %340 = fadd float %198, %324
  %341 = fadd float %199, %325
  %342 = fadd float %200, %326
  %343 = fadd float %201, %327
  %344 = fadd float %202, %328
  %345 = fadd float %203, %329
  %346 = fadd float %204, %330
  %347 = fadd float %205, %331
  %348 = fadd float %206, %332
  %349 = fadd float %207, %333
  %350 = fadd float %208, %334
  %351 = fadd float %209, %335
  %352 = fadd float %210, %336
  %353 = fadd float %211, %337
  %354 = fadd float %142, %338
  %355 = fadd float %143, %339
  %356 = fadd float %144, %340
  %357 = fadd float %145, %341
  %358 = fadd float %146, %342
  %359 = fadd float %147, %343
  %360 = fadd float %148, %344
  %361 = fadd float %149, %345
  %362 = fadd float %150, %346
  %363 = fadd float %151, %347
  %364 = fadd float %152, %348
  %365 = fadd float %153, %349
  %366 = fadd float %154, %350
  %367 = fadd float %155, %351
  %368 = fadd float %156, %352
  %369 = fadd float %157, %353
  %370 = fadd float %88, %354
  %371 = fadd float %89, %355
  %372 = fadd float %90, %356
  %373 = fadd float %91, %357
  %374 = fadd float %92, %358
  %375 = fadd float %93, %359
  %376 = fadd float %94, %360
  %377 = fadd float %95, %361
  %378 = fadd float %96, %362
  %379 = fadd float %97, %363
  %380 = fadd float %98, %364
  %381 = fadd float %99, %365
  %382 = fadd float %100, %366
  %383 = fadd float %101, %367
  %384 = fadd float %102, %368
  %385 = fadd float %103, %369
  %386 = fmul float %370, %370
  %387 = fmul float %371, %371
  %388 = fmul float %372, %372
  %389 = fmul float %373, %373
  %390 = fmul float %374, %374
  %391 = fmul float %375, %375
  %392 = fmul float %376, %376
  %393 = fmul float %377, %377
  %394 = fmul float %378, %378
  %395 = fmul float %379, %379
  %396 = fmul float %380, %380
  %397 = fmul float %381, %381
  %398 = fmul float %382, %382
  %399 = fmul float %383, %383
  %400 = fmul float %384, %384
  %401 = fmul float %385, %385
  %402 = fadd float %386, %387
  %403 = fadd float %402, %388
  %404 = fadd float %403, %389
  %405 = fadd float %404, %390
  %406 = fadd float %405, %391
  %407 = fadd float %406, %392
  %408 = fadd float %407, %393
  %409 = fadd float %408, %394
  %410 = fadd float %409, %395
  %411 = fadd float %410, %396
  %412 = fadd float %411, %397
  %413 = fadd float %412, %398
  %414 = fadd float %413, %399
  %415 = fadd float %414, %400
  %416 = fadd float %415, %401
  %417 = bitcast float %416 to i32
  %418 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %417, i32 16, i32 31)
  %419 = bitcast i32 %418 to float
  %420 = fadd float %416, %419
  %421 = bitcast float %420 to i32
  %422 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %421, i32 8, i32 31)
  %423 = bitcast i32 %422 to float
  %424 = fadd float %420, %423
  %425 = bitcast float %424 to i32
  %426 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %425, i32 4, i32 31)
  %427 = bitcast i32 %426 to float
  %428 = fadd float %424, %427
  %429 = bitcast float %428 to i32
  %430 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %429, i32 2, i32 31)
  %431 = bitcast i32 %430 to float
  %432 = fadd float %428, %431
  %433 = bitcast float %432 to i32
  %434 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %433, i32 1, i32 31)
  %435 = bitcast i32 %434 to float
  %436 = fadd float %432, %435
  %437 = urem i32 %14, 32
  %438 = urem i32 %15, 2
  %439 = icmp eq i32 %437, 0
  %440 = and i1 true, %439
  %441 = add i32 0, %438
  %442 = getelementptr float, ptr addrspace(3) @global_smem, i32 %441
  %443 = insertelement <1 x float> undef, float %436, i32 0
  %444 = extractelement <1 x float> %443, i32 0
  %445 = bitcast float %444 to i32
  %446 = insertelement <1 x i32> undef, i32 %445, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %442, <1 x i32> %446, i1 %440)
  call void @llvm.nvvm.barrier0()
  %447 = icmp slt i32 %13, 2
  %448 = getelementptr float, ptr addrspace(3) @global_smem, i32 %13
  %449 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %448, i1 %447)
  %450 = insertelement <1 x i32> undef, i32 %449, i32 0
  %451 = extractelement <1 x i32> %450, i32 0
  %452 = bitcast i32 %451 to float
  %453 = insertelement <1 x float> undef, float %452, i32 0
  %454 = extractelement <1 x float> %453, i32 0
  %455 = bitcast float %454 to i32
  %456 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %455, i32 1, i32 31)
  %457 = bitcast i32 %456 to float
  %458 = fadd float %454, %457
  %459 = urem i32 %14, 2
  %460 = icmp eq i32 %459, 0
  %461 = and i1 %447, %460
  %462 = insertelement <1 x float> undef, float %458, i32 0
  %463 = extractelement <1 x float> %462, i32 0
  %464 = bitcast float %463 to i32
  %465 = insertelement <1 x i32> undef, i32 %464, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %448, <1 x i32> %465, i1 %461)
  call void @llvm.nvvm.barrier0()
  %466 = load float, ptr addrspace(3) @global_smem, align 4
  %467 = fmul float %466, 0x3F50000000000000
  %468 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %469 = bitcast i32 %468 to <1 x float>
  %470 = extractelement <1 x float> %469, i32 0
  %471 = fadd float %467, %470
  %472 = call float @__nv_rsqrtf(float %471)
  %473 = fmul float %370, %472
  %474 = fmul float %371, %472
  %475 = fmul float %372, %472
  %476 = fmul float %373, %472
  %477 = fmul float %374, %472
  %478 = fmul float %375, %472
  %479 = fmul float %376, %472
  %480 = fmul float %377, %472
  %481 = fmul float %378, %472
  %482 = fmul float %379, %472
  %483 = fmul float %380, %472
  %484 = fmul float %381, %472
  %485 = fmul float %382, %472
  %486 = fmul float %383, %472
  %487 = fmul float %384, %472
  %488 = fmul float %385, %472
  %489 = getelementptr bfloat, ptr addrspace(1) %2, i64 %48
  %490 = getelementptr bfloat, ptr addrspace(1) %2, i64 %50
  %491 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %489)
  %492 = extractvalue { i32, i32, i32, i32 } %491, 0
  %493 = bitcast i32 %492 to <2 x bfloat>
  %494 = extractvalue { i32, i32, i32, i32 } %491, 1
  %495 = bitcast i32 %494 to <2 x bfloat>
  %496 = extractvalue { i32, i32, i32, i32 } %491, 2
  %497 = bitcast i32 %496 to <2 x bfloat>
  %498 = extractvalue { i32, i32, i32, i32 } %491, 3
  %499 = bitcast i32 %498 to <2 x bfloat>
  %500 = extractelement <2 x bfloat> %493, i32 0
  %501 = extractelement <2 x bfloat> %493, i32 1
  %502 = extractelement <2 x bfloat> %495, i32 0
  %503 = extractelement <2 x bfloat> %495, i32 1
  %504 = extractelement <2 x bfloat> %497, i32 0
  %505 = extractelement <2 x bfloat> %497, i32 1
  %506 = extractelement <2 x bfloat> %499, i32 0
  %507 = extractelement <2 x bfloat> %499, i32 1
  %508 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %490)
  %509 = extractvalue { i32, i32, i32, i32 } %508, 0
  %510 = bitcast i32 %509 to <2 x bfloat>
  %511 = extractvalue { i32, i32, i32, i32 } %508, 1
  %512 = bitcast i32 %511 to <2 x bfloat>
  %513 = extractvalue { i32, i32, i32, i32 } %508, 2
  %514 = bitcast i32 %513 to <2 x bfloat>
  %515 = extractvalue { i32, i32, i32, i32 } %508, 3
  %516 = bitcast i32 %515 to <2 x bfloat>
  %517 = extractelement <2 x bfloat> %510, i32 0
  %518 = extractelement <2 x bfloat> %510, i32 1
  %519 = extractelement <2 x bfloat> %512, i32 0
  %520 = extractelement <2 x bfloat> %512, i32 1
  %521 = extractelement <2 x bfloat> %514, i32 0
  %522 = extractelement <2 x bfloat> %514, i32 1
  %523 = extractelement <2 x bfloat> %516, i32 0
  %524 = extractelement <2 x bfloat> %516, i32 1
  %525 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %500)
  %526 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %501)
  %527 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %502)
  %528 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %503)
  %529 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %504)
  %530 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %505)
  %531 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %506)
  %532 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %507)
  %533 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %517)
  %534 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %518)
  %535 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %519)
  %536 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %520)
  %537 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %521)
  %538 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %522)
  %539 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %523)
  %540 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %524)
  %541 = fmul float %473, %525
  %542 = fmul float %474, %526
  %543 = fmul float %475, %527
  %544 = fmul float %476, %528
  %545 = fmul float %477, %529
  %546 = fmul float %478, %530
  %547 = fmul float %479, %531
  %548 = fmul float %480, %532
  %549 = fmul float %481, %533
  %550 = fmul float %482, %534
  %551 = fmul float %483, %535
  %552 = fmul float %484, %536
  %553 = fmul float %485, %537
  %554 = fmul float %486, %538
  %555 = fmul float %487, %539
  %556 = fmul float %488, %540
  %557 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %541)
  %558 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %542)
  %559 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %543)
  %560 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %544)
  %561 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %545)
  %562 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %546)
  %563 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %547)
  %564 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %548)
  %565 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %549)
  %566 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %550)
  %567 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %551)
  %568 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %552)
  %569 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %553)
  %570 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %554)
  %571 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %555)
  %572 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %556)
  %573 = getelementptr bfloat, ptr addrspace(1) %7, i64 %104
  %574 = getelementptr bfloat, ptr addrspace(1) %573, i64 %48
  %575 = getelementptr bfloat, ptr addrspace(1) %573, i64 %50
  %576 = insertelement <2 x bfloat> undef, bfloat %557, i32 0
  %577 = insertelement <2 x bfloat> %576, bfloat %558, i32 1
  %578 = bitcast <2 x bfloat> %577 to i32
  %579 = insertelement <2 x bfloat> undef, bfloat %559, i32 0
  %580 = insertelement <2 x bfloat> %579, bfloat %560, i32 1
  %581 = bitcast <2 x bfloat> %580 to i32
  %582 = insertelement <2 x bfloat> undef, bfloat %561, i32 0
  %583 = insertelement <2 x bfloat> %582, bfloat %562, i32 1
  %584 = bitcast <2 x bfloat> %583 to i32
  %585 = insertelement <2 x bfloat> undef, bfloat %563, i32 0
  %586 = insertelement <2 x bfloat> %585, bfloat %564, i32 1
  %587 = bitcast <2 x bfloat> %586 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %578, i32 %581, i32 %584, i32 %587, ptr addrspace(1) %574)
  %588 = insertelement <2 x bfloat> undef, bfloat %565, i32 0
  %589 = insertelement <2 x bfloat> %588, bfloat %566, i32 1
  %590 = bitcast <2 x bfloat> %589 to i32
  %591 = insertelement <2 x bfloat> undef, bfloat %567, i32 0
  %592 = insertelement <2 x bfloat> %591, bfloat %568, i32 1
  %593 = bitcast <2 x bfloat> %592 to i32
  %594 = insertelement <2 x bfloat> undef, bfloat %569, i32 0
  %595 = insertelement <2 x bfloat> %594, bfloat %570, i32 1
  %596 = bitcast <2 x bfloat> %595 to i32
  %597 = insertelement <2 x bfloat> undef, bfloat %571, i32 0
  %598 = insertelement <2 x bfloat> %597, bfloat %572, i32 1
  %599 = bitcast <2 x bfloat> %598 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %590, i32 %593, i32 %596, i32 %599, ptr addrspace(1) %575)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_156_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_156(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(262144) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(524288) %arg3, ptr noalias align 128 dereferenceable(262144) %arg4, ptr noalias align 128 dereferenceable(3145728) %arg5, ptr noalias align 128 dereferenceable(262144) %arg6, ptr noalias align 128 dereferenceable(262144) %arg7) #6 {
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
  %42 = xor i32 %40, 4
  %43 = xor i32 %40, 512
  %44 = xor i32 %40, 516
  %45 = add i32 %41, 0
  %46 = add i32 %42, 0
  %47 = add i32 %43, 0
  %48 = add i32 %44, 0
  %49 = sext i32 %45 to i64
  %50 = sext i32 %46 to i64
  %51 = sext i32 %47 to i64
  %52 = sext i32 %48 to i64
  %53 = getelementptr bfloat, ptr addrspace(1) %13, i64 %49
  %54 = getelementptr bfloat, ptr addrspace(1) %13, i64 %51
  %55 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %53)
  %56 = extractvalue { i32, i32, i32, i32 } %55, 0
  %57 = bitcast i32 %56 to <2 x bfloat>
  %58 = extractvalue { i32, i32, i32, i32 } %55, 1
  %59 = bitcast i32 %58 to <2 x bfloat>
  %60 = extractvalue { i32, i32, i32, i32 } %55, 2
  %61 = bitcast i32 %60 to <2 x bfloat>
  %62 = extractvalue { i32, i32, i32, i32 } %55, 3
  %63 = bitcast i32 %62 to <2 x bfloat>
  %64 = extractelement <2 x bfloat> %57, i32 0
  %65 = extractelement <2 x bfloat> %57, i32 1
  %66 = extractelement <2 x bfloat> %59, i32 0
  %67 = extractelement <2 x bfloat> %59, i32 1
  %68 = extractelement <2 x bfloat> %61, i32 0
  %69 = extractelement <2 x bfloat> %61, i32 1
  %70 = extractelement <2 x bfloat> %63, i32 0
  %71 = extractelement <2 x bfloat> %63, i32 1
  %72 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %54)
  %73 = extractvalue { i32, i32, i32, i32 } %72, 0
  %74 = bitcast i32 %73 to <2 x bfloat>
  %75 = extractvalue { i32, i32, i32, i32 } %72, 1
  %76 = bitcast i32 %75 to <2 x bfloat>
  %77 = extractvalue { i32, i32, i32, i32 } %72, 2
  %78 = bitcast i32 %77 to <2 x bfloat>
  %79 = extractvalue { i32, i32, i32, i32 } %72, 3
  %80 = bitcast i32 %79 to <2 x bfloat>
  %81 = extractelement <2 x bfloat> %74, i32 0
  %82 = extractelement <2 x bfloat> %74, i32 1
  %83 = extractelement <2 x bfloat> %76, i32 0
  %84 = extractelement <2 x bfloat> %76, i32 1
  %85 = extractelement <2 x bfloat> %78, i32 0
  %86 = extractelement <2 x bfloat> %78, i32 1
  %87 = extractelement <2 x bfloat> %80, i32 0
  %88 = extractelement <2 x bfloat> %80, i32 1
  %89 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %64)
  %90 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %65)
  %91 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %66)
  %92 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %67)
  %93 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %68)
  %94 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %69)
  %95 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %70)
  %96 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %71)
  %97 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81)
  %98 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82)
  %99 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83)
  %100 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84)
  %101 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85)
  %102 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86)
  %103 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87)
  %104 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88)
  %105 = mul i64 %11, 12288
  %106 = getelementptr bfloat, ptr addrspace(1) %6, i64 %105
  %107 = getelementptr bfloat, ptr addrspace(1) %106, i64 %49
  %108 = getelementptr bfloat, ptr addrspace(1) %106, i64 %51
  %109 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %107)
  %110 = extractvalue { i32, i32, i32, i32 } %109, 0
  %111 = bitcast i32 %110 to <2 x bfloat>
  %112 = extractvalue { i32, i32, i32, i32 } %109, 1
  %113 = bitcast i32 %112 to <2 x bfloat>
  %114 = extractvalue { i32, i32, i32, i32 } %109, 2
  %115 = bitcast i32 %114 to <2 x bfloat>
  %116 = extractvalue { i32, i32, i32, i32 } %109, 3
  %117 = bitcast i32 %116 to <2 x bfloat>
  %118 = extractelement <2 x bfloat> %111, i32 0
  %119 = extractelement <2 x bfloat> %111, i32 1
  %120 = extractelement <2 x bfloat> %113, i32 0
  %121 = extractelement <2 x bfloat> %113, i32 1
  %122 = extractelement <2 x bfloat> %115, i32 0
  %123 = extractelement <2 x bfloat> %115, i32 1
  %124 = extractelement <2 x bfloat> %117, i32 0
  %125 = extractelement <2 x bfloat> %117, i32 1
  %126 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %108)
  %127 = extractvalue { i32, i32, i32, i32 } %126, 0
  %128 = bitcast i32 %127 to <2 x bfloat>
  %129 = extractvalue { i32, i32, i32, i32 } %126, 1
  %130 = bitcast i32 %129 to <2 x bfloat>
  %131 = extractvalue { i32, i32, i32, i32 } %126, 2
  %132 = bitcast i32 %131 to <2 x bfloat>
  %133 = extractvalue { i32, i32, i32, i32 } %126, 3
  %134 = bitcast i32 %133 to <2 x bfloat>
  %135 = extractelement <2 x bfloat> %128, i32 0
  %136 = extractelement <2 x bfloat> %128, i32 1
  %137 = extractelement <2 x bfloat> %130, i32 0
  %138 = extractelement <2 x bfloat> %130, i32 1
  %139 = extractelement <2 x bfloat> %132, i32 0
  %140 = extractelement <2 x bfloat> %132, i32 1
  %141 = extractelement <2 x bfloat> %134, i32 0
  %142 = extractelement <2 x bfloat> %134, i32 1
  %143 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %118)
  %144 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %119)
  %145 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %120)
  %146 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %121)
  %147 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %122)
  %148 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %123)
  %149 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %124)
  %150 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %125)
  %151 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135)
  %152 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136)
  %153 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137)
  %154 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138)
  %155 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139)
  %156 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140)
  %157 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141)
  %158 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142)
  %159 = getelementptr bfloat, ptr addrspace(1) %7, i64 %12
  %160 = getelementptr bfloat, ptr addrspace(1) %159, i64 %49
  %161 = getelementptr bfloat, ptr addrspace(1) %159, i64 %51
  %162 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %160)
  %163 = extractvalue { i32, i32, i32, i32 } %162, 0
  %164 = bitcast i32 %163 to <2 x bfloat>
  %165 = extractvalue { i32, i32, i32, i32 } %162, 1
  %166 = bitcast i32 %165 to <2 x bfloat>
  %167 = extractvalue { i32, i32, i32, i32 } %162, 2
  %168 = bitcast i32 %167 to <2 x bfloat>
  %169 = extractvalue { i32, i32, i32, i32 } %162, 3
  %170 = bitcast i32 %169 to <2 x bfloat>
  %171 = extractelement <2 x bfloat> %164, i32 0
  %172 = extractelement <2 x bfloat> %164, i32 1
  %173 = extractelement <2 x bfloat> %166, i32 0
  %174 = extractelement <2 x bfloat> %166, i32 1
  %175 = extractelement <2 x bfloat> %168, i32 0
  %176 = extractelement <2 x bfloat> %168, i32 1
  %177 = extractelement <2 x bfloat> %170, i32 0
  %178 = extractelement <2 x bfloat> %170, i32 1
  %179 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %161)
  %180 = extractvalue { i32, i32, i32, i32 } %179, 0
  %181 = bitcast i32 %180 to <2 x bfloat>
  %182 = extractvalue { i32, i32, i32, i32 } %179, 1
  %183 = bitcast i32 %182 to <2 x bfloat>
  %184 = extractvalue { i32, i32, i32, i32 } %179, 2
  %185 = bitcast i32 %184 to <2 x bfloat>
  %186 = extractvalue { i32, i32, i32, i32 } %179, 3
  %187 = bitcast i32 %186 to <2 x bfloat>
  %188 = extractelement <2 x bfloat> %181, i32 0
  %189 = extractelement <2 x bfloat> %181, i32 1
  %190 = extractelement <2 x bfloat> %183, i32 0
  %191 = extractelement <2 x bfloat> %183, i32 1
  %192 = extractelement <2 x bfloat> %185, i32 0
  %193 = extractelement <2 x bfloat> %185, i32 1
  %194 = extractelement <2 x bfloat> %187, i32 0
  %195 = extractelement <2 x bfloat> %187, i32 1
  %196 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %171)
  %197 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %172)
  %198 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %173)
  %199 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %174)
  %200 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %175)
  %201 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %176)
  %202 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %177)
  %203 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %178)
  %204 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188)
  %205 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189)
  %206 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190)
  %207 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191)
  %208 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192)
  %209 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193)
  %210 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194)
  %211 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195)
  %212 = add i64 %105, 1024
  %213 = getelementptr bfloat, ptr addrspace(1) %6, i64 %212
  %214 = getelementptr bfloat, ptr addrspace(1) %213, i64 %49
  %215 = getelementptr bfloat, ptr addrspace(1) %213, i64 %51
  %216 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %214)
  %217 = extractvalue { i32, i32, i32, i32 } %216, 0
  %218 = bitcast i32 %217 to <2 x bfloat>
  %219 = extractvalue { i32, i32, i32, i32 } %216, 1
  %220 = bitcast i32 %219 to <2 x bfloat>
  %221 = extractvalue { i32, i32, i32, i32 } %216, 2
  %222 = bitcast i32 %221 to <2 x bfloat>
  %223 = extractvalue { i32, i32, i32, i32 } %216, 3
  %224 = bitcast i32 %223 to <2 x bfloat>
  %225 = extractelement <2 x bfloat> %218, i32 0
  %226 = extractelement <2 x bfloat> %218, i32 1
  %227 = extractelement <2 x bfloat> %220, i32 0
  %228 = extractelement <2 x bfloat> %220, i32 1
  %229 = extractelement <2 x bfloat> %222, i32 0
  %230 = extractelement <2 x bfloat> %222, i32 1
  %231 = extractelement <2 x bfloat> %224, i32 0
  %232 = extractelement <2 x bfloat> %224, i32 1
  %233 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %215)
  %234 = extractvalue { i32, i32, i32, i32 } %233, 0
  %235 = bitcast i32 %234 to <2 x bfloat>
  %236 = extractvalue { i32, i32, i32, i32 } %233, 1
  %237 = bitcast i32 %236 to <2 x bfloat>
  %238 = extractvalue { i32, i32, i32, i32 } %233, 2
  %239 = bitcast i32 %238 to <2 x bfloat>
  %240 = extractvalue { i32, i32, i32, i32 } %233, 3
  %241 = bitcast i32 %240 to <2 x bfloat>
  %242 = extractelement <2 x bfloat> %235, i32 0
  %243 = extractelement <2 x bfloat> %235, i32 1
  %244 = extractelement <2 x bfloat> %237, i32 0
  %245 = extractelement <2 x bfloat> %237, i32 1
  %246 = extractelement <2 x bfloat> %239, i32 0
  %247 = extractelement <2 x bfloat> %239, i32 1
  %248 = extractelement <2 x bfloat> %241, i32 0
  %249 = extractelement <2 x bfloat> %241, i32 1
  %250 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %225)
  %251 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %226)
  %252 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %227)
  %253 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %228)
  %254 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %229)
  %255 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %230)
  %256 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %231)
  %257 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %232)
  %258 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242)
  %259 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243)
  %260 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244)
  %261 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245)
  %262 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246)
  %263 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %247)
  %264 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %248)
  %265 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %249)
  %266 = getelementptr bfloat, ptr addrspace(1) %5, i64 %12
  %267 = getelementptr bfloat, ptr addrspace(1) %266, i64 %49
  %268 = getelementptr bfloat, ptr addrspace(1) %266, i64 %51
  %269 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %267)
  %270 = extractvalue { i32, i32, i32, i32 } %269, 0
  %271 = bitcast i32 %270 to <2 x bfloat>
  %272 = extractvalue { i32, i32, i32, i32 } %269, 1
  %273 = bitcast i32 %272 to <2 x bfloat>
  %274 = extractvalue { i32, i32, i32, i32 } %269, 2
  %275 = bitcast i32 %274 to <2 x bfloat>
  %276 = extractvalue { i32, i32, i32, i32 } %269, 3
  %277 = bitcast i32 %276 to <2 x bfloat>
  %278 = extractelement <2 x bfloat> %271, i32 0
  %279 = extractelement <2 x bfloat> %271, i32 1
  %280 = extractelement <2 x bfloat> %273, i32 0
  %281 = extractelement <2 x bfloat> %273, i32 1
  %282 = extractelement <2 x bfloat> %275, i32 0
  %283 = extractelement <2 x bfloat> %275, i32 1
  %284 = extractelement <2 x bfloat> %277, i32 0
  %285 = extractelement <2 x bfloat> %277, i32 1
  %286 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %268)
  %287 = extractvalue { i32, i32, i32, i32 } %286, 0
  %288 = bitcast i32 %287 to <2 x bfloat>
  %289 = extractvalue { i32, i32, i32, i32 } %286, 1
  %290 = bitcast i32 %289 to <2 x bfloat>
  %291 = extractvalue { i32, i32, i32, i32 } %286, 2
  %292 = bitcast i32 %291 to <2 x bfloat>
  %293 = extractvalue { i32, i32, i32, i32 } %286, 3
  %294 = bitcast i32 %293 to <2 x bfloat>
  %295 = extractelement <2 x bfloat> %288, i32 0
  %296 = extractelement <2 x bfloat> %288, i32 1
  %297 = extractelement <2 x bfloat> %290, i32 0
  %298 = extractelement <2 x bfloat> %290, i32 1
  %299 = extractelement <2 x bfloat> %292, i32 0
  %300 = extractelement <2 x bfloat> %292, i32 1
  %301 = extractelement <2 x bfloat> %294, i32 0
  %302 = extractelement <2 x bfloat> %294, i32 1
  %303 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %278)
  %304 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %279)
  %305 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %280)
  %306 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %281)
  %307 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %282)
  %308 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %283)
  %309 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %284)
  %310 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %285)
  %311 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295)
  %312 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296)
  %313 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297)
  %314 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298)
  %315 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299)
  %316 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300)
  %317 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %301)
  %318 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %302)
  %319 = getelementptr float, ptr addrspace(1) %4, i64 %12
  %320 = getelementptr float, ptr addrspace(1) %319, i64 %49
  %321 = getelementptr float, ptr addrspace(1) %319, i64 %50
  %322 = getelementptr float, ptr addrspace(1) %319, i64 %51
  %323 = getelementptr float, ptr addrspace(1) %319, i64 %52
  %324 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %320)
  %325 = extractvalue { i32, i32, i32, i32 } %324, 0
  %326 = bitcast i32 %325 to <1 x float>
  %327 = extractvalue { i32, i32, i32, i32 } %324, 1
  %328 = bitcast i32 %327 to <1 x float>
  %329 = extractvalue { i32, i32, i32, i32 } %324, 2
  %330 = bitcast i32 %329 to <1 x float>
  %331 = extractvalue { i32, i32, i32, i32 } %324, 3
  %332 = bitcast i32 %331 to <1 x float>
  %333 = extractelement <1 x float> %326, i32 0
  %334 = extractelement <1 x float> %328, i32 0
  %335 = extractelement <1 x float> %330, i32 0
  %336 = extractelement <1 x float> %332, i32 0
  %337 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %321)
  %338 = extractvalue { i32, i32, i32, i32 } %337, 0
  %339 = bitcast i32 %338 to <1 x float>
  %340 = extractvalue { i32, i32, i32, i32 } %337, 1
  %341 = bitcast i32 %340 to <1 x float>
  %342 = extractvalue { i32, i32, i32, i32 } %337, 2
  %343 = bitcast i32 %342 to <1 x float>
  %344 = extractvalue { i32, i32, i32, i32 } %337, 3
  %345 = bitcast i32 %344 to <1 x float>
  %346 = extractelement <1 x float> %339, i32 0
  %347 = extractelement <1 x float> %341, i32 0
  %348 = extractelement <1 x float> %343, i32 0
  %349 = extractelement <1 x float> %345, i32 0
  %350 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %322)
  %351 = extractvalue { i32, i32, i32, i32 } %350, 0
  %352 = bitcast i32 %351 to <1 x float>
  %353 = extractvalue { i32, i32, i32, i32 } %350, 1
  %354 = bitcast i32 %353 to <1 x float>
  %355 = extractvalue { i32, i32, i32, i32 } %350, 2
  %356 = bitcast i32 %355 to <1 x float>
  %357 = extractvalue { i32, i32, i32, i32 } %350, 3
  %358 = bitcast i32 %357 to <1 x float>
  %359 = extractelement <1 x float> %352, i32 0
  %360 = extractelement <1 x float> %354, i32 0
  %361 = extractelement <1 x float> %356, i32 0
  %362 = extractelement <1 x float> %358, i32 0
  %363 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %323)
  %364 = extractvalue { i32, i32, i32, i32 } %363, 0
  %365 = bitcast i32 %364 to <1 x float>
  %366 = extractvalue { i32, i32, i32, i32 } %363, 1
  %367 = bitcast i32 %366 to <1 x float>
  %368 = extractvalue { i32, i32, i32, i32 } %363, 2
  %369 = bitcast i32 %368 to <1 x float>
  %370 = extractvalue { i32, i32, i32, i32 } %363, 3
  %371 = bitcast i32 %370 to <1 x float>
  %372 = extractelement <1 x float> %365, i32 0
  %373 = extractelement <1 x float> %367, i32 0
  %374 = extractelement <1 x float> %369, i32 0
  %375 = extractelement <1 x float> %371, i32 0
  %376 = fadd float %303, %333
  %377 = fadd float %304, %334
  %378 = fadd float %305, %335
  %379 = fadd float %306, %336
  %380 = fadd float %307, %346
  %381 = fadd float %308, %347
  %382 = fadd float %309, %348
  %383 = fadd float %310, %349
  %384 = fadd float %311, %359
  %385 = fadd float %312, %360
  %386 = fadd float %313, %361
  %387 = fadd float %314, %362
  %388 = fadd float %315, %372
  %389 = fadd float %316, %373
  %390 = fadd float %317, %374
  %391 = fadd float %318, %375
  %392 = fadd float %250, %376
  %393 = fadd float %251, %377
  %394 = fadd float %252, %378
  %395 = fadd float %253, %379
  %396 = fadd float %254, %380
  %397 = fadd float %255, %381
  %398 = fadd float %256, %382
  %399 = fadd float %257, %383
  %400 = fadd float %258, %384
  %401 = fadd float %259, %385
  %402 = fadd float %260, %386
  %403 = fadd float %261, %387
  %404 = fadd float %262, %388
  %405 = fadd float %263, %389
  %406 = fadd float %264, %390
  %407 = fadd float %265, %391
  %408 = fadd float %196, %392
  %409 = fadd float %197, %393
  %410 = fadd float %198, %394
  %411 = fadd float %199, %395
  %412 = fadd float %200, %396
  %413 = fadd float %201, %397
  %414 = fadd float %202, %398
  %415 = fadd float %203, %399
  %416 = fadd float %204, %400
  %417 = fadd float %205, %401
  %418 = fadd float %206, %402
  %419 = fadd float %207, %403
  %420 = fadd float %208, %404
  %421 = fadd float %209, %405
  %422 = fadd float %210, %406
  %423 = fadd float %211, %407
  %424 = fadd float %143, %408
  %425 = fadd float %144, %409
  %426 = fadd float %145, %410
  %427 = fadd float %146, %411
  %428 = fadd float %147, %412
  %429 = fadd float %148, %413
  %430 = fadd float %149, %414
  %431 = fadd float %150, %415
  %432 = fadd float %151, %416
  %433 = fadd float %152, %417
  %434 = fadd float %153, %418
  %435 = fadd float %154, %419
  %436 = fadd float %155, %420
  %437 = fadd float %156, %421
  %438 = fadd float %157, %422
  %439 = fadd float %158, %423
  %440 = fadd float %89, %424
  %441 = fadd float %90, %425
  %442 = fadd float %91, %426
  %443 = fadd float %92, %427
  %444 = fadd float %93, %428
  %445 = fadd float %94, %429
  %446 = fadd float %95, %430
  %447 = fadd float %96, %431
  %448 = fadd float %97, %432
  %449 = fadd float %98, %433
  %450 = fadd float %99, %434
  %451 = fadd float %100, %435
  %452 = fadd float %101, %436
  %453 = fadd float %102, %437
  %454 = fadd float %103, %438
  %455 = fadd float %104, %439
  %456 = fmul float %440, %440
  %457 = fmul float %441, %441
  %458 = fmul float %442, %442
  %459 = fmul float %443, %443
  %460 = fmul float %444, %444
  %461 = fmul float %445, %445
  %462 = fmul float %446, %446
  %463 = fmul float %447, %447
  %464 = fmul float %448, %448
  %465 = fmul float %449, %449
  %466 = fmul float %450, %450
  %467 = fmul float %451, %451
  %468 = fmul float %452, %452
  %469 = fmul float %453, %453
  %470 = fmul float %454, %454
  %471 = fmul float %455, %455
  %472 = fadd float %456, %457
  %473 = fadd float %472, %458
  %474 = fadd float %473, %459
  %475 = fadd float %474, %460
  %476 = fadd float %475, %461
  %477 = fadd float %476, %462
  %478 = fadd float %477, %463
  %479 = fadd float %478, %464
  %480 = fadd float %479, %465
  %481 = fadd float %480, %466
  %482 = fadd float %481, %467
  %483 = fadd float %482, %468
  %484 = fadd float %483, %469
  %485 = fadd float %484, %470
  %486 = fadd float %485, %471
  %487 = bitcast float %486 to i32
  %488 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %487, i32 16, i32 31)
  %489 = bitcast i32 %488 to float
  %490 = fadd float %486, %489
  %491 = bitcast float %490 to i32
  %492 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %491, i32 8, i32 31)
  %493 = bitcast i32 %492 to float
  %494 = fadd float %490, %493
  %495 = bitcast float %494 to i32
  %496 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %495, i32 4, i32 31)
  %497 = bitcast i32 %496 to float
  %498 = fadd float %494, %497
  %499 = bitcast float %498 to i32
  %500 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %499, i32 2, i32 31)
  %501 = bitcast i32 %500 to float
  %502 = fadd float %498, %501
  %503 = bitcast float %502 to i32
  %504 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %503, i32 1, i32 31)
  %505 = bitcast i32 %504 to float
  %506 = fadd float %502, %505
  %507 = urem i32 %15, 32
  %508 = urem i32 %16, 2
  %509 = icmp eq i32 %507, 0
  %510 = and i1 true, %509
  %511 = add i32 0, %508
  %512 = getelementptr float, ptr addrspace(3) @global_smem, i32 %511
  %513 = insertelement <1 x float> undef, float %506, i32 0
  %514 = extractelement <1 x float> %513, i32 0
  %515 = bitcast float %514 to i32
  %516 = insertelement <1 x i32> undef, i32 %515, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %512, <1 x i32> %516, i1 %510)
  call void @llvm.nvvm.barrier0()
  %517 = icmp slt i32 %14, 2
  %518 = getelementptr float, ptr addrspace(3) @global_smem, i32 %14
  %519 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %518, i1 %517)
  %520 = insertelement <1 x i32> undef, i32 %519, i32 0
  %521 = extractelement <1 x i32> %520, i32 0
  %522 = bitcast i32 %521 to float
  %523 = insertelement <1 x float> undef, float %522, i32 0
  %524 = extractelement <1 x float> %523, i32 0
  %525 = bitcast float %524 to i32
  %526 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %525, i32 1, i32 31)
  %527 = bitcast i32 %526 to float
  %528 = fadd float %524, %527
  %529 = urem i32 %15, 2
  %530 = icmp eq i32 %529, 0
  %531 = and i1 %517, %530
  %532 = insertelement <1 x float> undef, float %528, i32 0
  %533 = extractelement <1 x float> %532, i32 0
  %534 = bitcast float %533 to i32
  %535 = insertelement <1 x i32> undef, i32 %534, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %518, <1 x i32> %535, i1 %531)
  call void @llvm.nvvm.barrier0()
  %536 = load float, ptr addrspace(3) @global_smem, align 4
  %537 = fmul float %536, 0x3F50000000000000
  %538 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %539 = bitcast i32 %538 to <1 x float>
  %540 = extractelement <1 x float> %539, i32 0
  %541 = fadd float %537, %540
  %542 = call float @__nv_rsqrtf(float %541)
  %543 = fmul float %440, %542
  %544 = fmul float %441, %542
  %545 = fmul float %442, %542
  %546 = fmul float %443, %542
  %547 = fmul float %444, %542
  %548 = fmul float %445, %542
  %549 = fmul float %446, %542
  %550 = fmul float %447, %542
  %551 = fmul float %448, %542
  %552 = fmul float %449, %542
  %553 = fmul float %450, %542
  %554 = fmul float %451, %542
  %555 = fmul float %452, %542
  %556 = fmul float %453, %542
  %557 = fmul float %454, %542
  %558 = fmul float %455, %542
  %559 = getelementptr bfloat, ptr addrspace(1) %3, i64 %49
  %560 = getelementptr bfloat, ptr addrspace(1) %3, i64 %51
  %561 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %559)
  %562 = extractvalue { i32, i32, i32, i32 } %561, 0
  %563 = bitcast i32 %562 to <2 x bfloat>
  %564 = extractvalue { i32, i32, i32, i32 } %561, 1
  %565 = bitcast i32 %564 to <2 x bfloat>
  %566 = extractvalue { i32, i32, i32, i32 } %561, 2
  %567 = bitcast i32 %566 to <2 x bfloat>
  %568 = extractvalue { i32, i32, i32, i32 } %561, 3
  %569 = bitcast i32 %568 to <2 x bfloat>
  %570 = extractelement <2 x bfloat> %563, i32 0
  %571 = extractelement <2 x bfloat> %563, i32 1
  %572 = extractelement <2 x bfloat> %565, i32 0
  %573 = extractelement <2 x bfloat> %565, i32 1
  %574 = extractelement <2 x bfloat> %567, i32 0
  %575 = extractelement <2 x bfloat> %567, i32 1
  %576 = extractelement <2 x bfloat> %569, i32 0
  %577 = extractelement <2 x bfloat> %569, i32 1
  %578 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %560)
  %579 = extractvalue { i32, i32, i32, i32 } %578, 0
  %580 = bitcast i32 %579 to <2 x bfloat>
  %581 = extractvalue { i32, i32, i32, i32 } %578, 1
  %582 = bitcast i32 %581 to <2 x bfloat>
  %583 = extractvalue { i32, i32, i32, i32 } %578, 2
  %584 = bitcast i32 %583 to <2 x bfloat>
  %585 = extractvalue { i32, i32, i32, i32 } %578, 3
  %586 = bitcast i32 %585 to <2 x bfloat>
  %587 = extractelement <2 x bfloat> %580, i32 0
  %588 = extractelement <2 x bfloat> %580, i32 1
  %589 = extractelement <2 x bfloat> %582, i32 0
  %590 = extractelement <2 x bfloat> %582, i32 1
  %591 = extractelement <2 x bfloat> %584, i32 0
  %592 = extractelement <2 x bfloat> %584, i32 1
  %593 = extractelement <2 x bfloat> %586, i32 0
  %594 = extractelement <2 x bfloat> %586, i32 1
  %595 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %570)
  %596 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %571)
  %597 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %572)
  %598 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %573)
  %599 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %574)
  %600 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %575)
  %601 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %576)
  %602 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %577)
  %603 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %587)
  %604 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %588)
  %605 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %589)
  %606 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %590)
  %607 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %591)
  %608 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %592)
  %609 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %593)
  %610 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %594)
  %611 = fmul float %543, %595
  %612 = fmul float %544, %596
  %613 = fmul float %545, %597
  %614 = fmul float %546, %598
  %615 = fmul float %547, %599
  %616 = fmul float %548, %600
  %617 = fmul float %549, %601
  %618 = fmul float %550, %602
  %619 = fmul float %551, %603
  %620 = fmul float %552, %604
  %621 = fmul float %553, %605
  %622 = fmul float %554, %606
  %623 = fmul float %555, %607
  %624 = fmul float %556, %608
  %625 = fmul float %557, %609
  %626 = fmul float %558, %610
  %627 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %611)
  %628 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %612)
  %629 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %613)
  %630 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %614)
  %631 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %615)
  %632 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %616)
  %633 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %617)
  %634 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %618)
  %635 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %619)
  %636 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %620)
  %637 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %621)
  %638 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %622)
  %639 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %623)
  %640 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %624)
  %641 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %625)
  %642 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %626)
  %643 = getelementptr bfloat, ptr addrspace(1) %8, i64 %12
  %644 = getelementptr bfloat, ptr addrspace(1) %643, i64 %49
  %645 = getelementptr bfloat, ptr addrspace(1) %643, i64 %51
  %646 = insertelement <2 x bfloat> undef, bfloat %627, i32 0
  %647 = insertelement <2 x bfloat> %646, bfloat %628, i32 1
  %648 = bitcast <2 x bfloat> %647 to i32
  %649 = insertelement <2 x bfloat> undef, bfloat %629, i32 0
  %650 = insertelement <2 x bfloat> %649, bfloat %630, i32 1
  %651 = bitcast <2 x bfloat> %650 to i32
  %652 = insertelement <2 x bfloat> undef, bfloat %631, i32 0
  %653 = insertelement <2 x bfloat> %652, bfloat %632, i32 1
  %654 = bitcast <2 x bfloat> %653 to i32
  %655 = insertelement <2 x bfloat> undef, bfloat %633, i32 0
  %656 = insertelement <2 x bfloat> %655, bfloat %634, i32 1
  %657 = bitcast <2 x bfloat> %656 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %648, i32 %651, i32 %654, i32 %657, ptr addrspace(1) %644)
  %658 = insertelement <2 x bfloat> undef, bfloat %635, i32 0
  %659 = insertelement <2 x bfloat> %658, bfloat %636, i32 1
  %660 = bitcast <2 x bfloat> %659 to i32
  %661 = insertelement <2 x bfloat> undef, bfloat %637, i32 0
  %662 = insertelement <2 x bfloat> %661, bfloat %638, i32 1
  %663 = bitcast <2 x bfloat> %662 to i32
  %664 = insertelement <2 x bfloat> undef, bfloat %639, i32 0
  %665 = insertelement <2 x bfloat> %664, bfloat %640, i32 1
  %666 = bitcast <2 x bfloat> %665 to i32
  %667 = insertelement <2 x bfloat> undef, bfloat %641, i32 0
  %668 = insertelement <2 x bfloat> %667, bfloat %642, i32 1
  %669 = bitcast <2 x bfloat> %668 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %660, i32 %663, i32 %666, i32 %669, ptr addrspace(1) %645)
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

declare ptx_kernel void @triton_softmax_14_0_impl(ptr, ptr, ptr, ptr) #4

define ptx_kernel void @triton_softmax_14_0(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(1048576) %arg1, ptr noalias align 128 dereferenceable(524288) %arg2) #6 {
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
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
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
  %21 = call float @fused_concatenate_convert_788_7(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %9)
  %22 = fmul float %20, %21
  %23 = add i32 %9, 64
  %24 = add i32 %14, 64
  %25 = getelementptr inbounds float, ptr %0, i32 %24
  %26 = load float, ptr %25, align 4, !invariant.load !3
  %27 = getelementptr inbounds bfloat, ptr %1, i32 %23
  %28 = load bfloat, ptr %27, align 2, !invariant.load !3
  %29 = fpext bfloat %28 to float
  %30 = fmul float %26, %29
  %31 = call float @fused_concatenate_convert_788_7(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %23)
  %32 = fmul float %30, %31
  %33 = fsub float %22, %32
  %34 = fptrunc float %33 to bfloat
  %35 = getelementptr inbounds bfloat, ptr %4, i32 %14
  store bfloat %34, ptr %35, align 2
  %36 = load float, ptr %25, align 4, !invariant.load !3
  %37 = load bfloat, ptr %27, align 2, !invariant.load !3
  %38 = fpext bfloat %37 to float
  %39 = fmul float %36, %38
  %40 = call float @fused_concatenate_convert_788_7(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %9)
  %41 = fmul float %39, %40
  %42 = load float, ptr %15, align 4, !invariant.load !3
  %43 = load bfloat, ptr %17, align 2, !invariant.load !3
  %44 = fpext bfloat %43 to float
  %45 = fmul float %42, %44
  %46 = call float @fused_concatenate_convert_788_7(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %23)
  %47 = fmul float %45, %46
  %48 = fadd float %41, %47
  %49 = fptrunc float %48 to bfloat
  %50 = getelementptr inbounds bfloat, ptr %4, i32 %24
  store bfloat %49, ptr %50, align 2
  ret void
}

define internal float @fused_concatenate_convert_788_7(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, i32 %4, i32 %5) {
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
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !7
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
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !7
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
!4 = !{i32 0, i32 196608}
!5 = !{i32 0, i32 768}
!6 = !{i32 0, i32 512}
!7 = !{i32 0, i32 135456}

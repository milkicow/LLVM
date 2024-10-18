; ModuleID = 'app.cpp'
source_filename = "app.cpp"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx14.0.0"

; Function Attrs: mustprogress nofree norecurse nosync nounwind ssp willreturn memory(argmem: read) uwtable(sync)
define noundef i32 @_Z9neighborsPcii(ptr nocapture noundef readonly %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = add nsw i32 %1, -1
  %5 = icmp slt i32 %2, 1
  %6 = icmp ugt i32 %2, 25
  %7 = select i1 %6, i32 -26, i32 -1
  %8 = select i1 %5, i32 24, i32 %7
  %9 = add nsw i32 %8, %2
  %10 = mul nsw i32 %9, 50
  %11 = insertelement <2 x i32> poison, i32 %1, i64 0
  %12 = shufflevector <2 x i32> %11, <2 x i32> poison, <2 x i32> zeroinitializer
  %13 = icmp slt <2 x i32> %12, <i32 1, i32 0>
  %14 = add nsw <2 x i32> %12, <i32 49, i32 50>
  %15 = icmp ugt <2 x i32> %12, <i32 50, i32 49>
  %16 = add nsw <2 x i32> %12, <i32 -51, i32 -50>
  %17 = insertelement <2 x i32> %12, i32 %4, i64 0
  %18 = select <2 x i1> %15, <2 x i32> %16, <2 x i32> %17
  %19 = select <2 x i1> %13, <2 x i32> %14, <2 x i32> %18
  %20 = insertelement <2 x i32> poison, i32 %10, i64 0
  %21 = shufflevector <2 x i32> %20, <2 x i32> poison, <2 x i32> zeroinitializer
  %22 = add nsw <2 x i32> %19, %21
  %23 = extractelement <2 x i32> %22, i64 0
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i8, ptr %0, i64 %24
  %26 = load i8, ptr %25, align 1, !tbaa !5
  %27 = extractelement <2 x i32> %22, i64 1
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i8, ptr %0, i64 %28
  %30 = load i8, ptr %29, align 1, !tbaa !5
  %31 = icmp slt i32 %1, -1
  %32 = icmp sgt i32 %1, 48
  %33 = select i1 %32, i32 -49, i32 1
  %34 = select i1 %31, i32 51, i32 %33
  %35 = add nsw i32 %34, %1
  %36 = add nsw i32 %35, %10
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i8, ptr %0, i64 %37
  %39 = load i8, ptr %38, align 1, !tbaa !5
  %40 = icmp slt i32 %2, 0
  %41 = add nsw i32 %2, 25
  %42 = icmp ugt i32 %2, 24
  %43 = add nsw i32 %2, -25
  %44 = select i1 %42, i32 %43, i32 %2
  %45 = select i1 %40, i32 %41, i32 %44
  %46 = mul nsw i32 %45, 50
  %47 = icmp slt i32 %1, 1
  %48 = add nsw i32 %1, 49
  %49 = icmp ugt i32 %1, 50
  %50 = add nsw i32 %1, -51
  %51 = select i1 %49, i32 %50, i32 %4
  %52 = select i1 %47, i32 %48, i32 %51
  %53 = add nsw i32 %52, %46
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i8, ptr %0, i64 %54
  %56 = load i8, ptr %55, align 1, !tbaa !5
  %57 = icmp slt i32 %1, -1
  %58 = icmp sgt i32 %1, 48
  %59 = select i1 %58, i32 -49, i32 1
  %60 = select i1 %57, i32 51, i32 %59
  %61 = add nsw i32 %60, %1
  %62 = add nsw i32 %61, %46
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i8, ptr %0, i64 %63
  %65 = load i8, ptr %64, align 1, !tbaa !5
  %66 = icmp slt i32 %2, -1
  %67 = icmp sgt i32 %2, 23
  %68 = select i1 %67, i32 -24, i32 1
  %69 = select i1 %66, i32 26, i32 %68
  %70 = add nsw i32 %69, %2
  %71 = mul nsw i32 %70, 50
  %72 = icmp slt i32 %1, 1
  %73 = add nsw i32 %1, 49
  %74 = icmp ugt i32 %1, 50
  %75 = add nsw i32 %1, -51
  %76 = select i1 %74, i32 %75, i32 %4
  %77 = select i1 %72, i32 %73, i32 %76
  %78 = add nsw i32 %77, %71
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i8, ptr %0, i64 %79
  %81 = load i8, ptr %80, align 1, !tbaa !5
  %82 = icmp slt i32 %1, 0
  %83 = add nsw i32 %1, 50
  %84 = icmp ugt i32 %1, 49
  %85 = add nsw i32 %1, -50
  %86 = select i1 %84, i32 %85, i32 %1
  %87 = select i1 %82, i32 %83, i32 %86
  %88 = add nsw i32 %87, %71
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds i8, ptr %0, i64 %89
  %91 = load i8, ptr %90, align 1, !tbaa !5
  %92 = icmp slt i32 %1, -1
  %93 = icmp sgt i32 %1, 48
  %94 = select i1 %93, i32 -49, i32 1
  %95 = select i1 %92, i32 51, i32 %94
  %96 = add nsw i32 %95, %1
  %97 = add nsw i32 %96, %71
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i8, ptr %0, i64 %98
  %100 = load i8, ptr %99, align 1, !tbaa !5
  %101 = sext i8 %26 to i32
  %102 = sext i8 %30 to i32
  %103 = add nsw i32 %101, %102
  %104 = sext i8 %39 to i32
  %105 = add nsw i32 %103, %104
  %106 = sext i8 %56 to i32
  %107 = add nsw i32 %105, %106
  %108 = sext i8 %65 to i32
  %109 = add nsw i32 %107, %108
  %110 = sext i8 %81 to i32
  %111 = add nsw i32 %109, %110
  %112 = sext i8 %91 to i32
  %113 = add nsw i32 %111, %112
  %114 = sext i8 %100 to i32
  %115 = add nsw i32 %113, %114
  ret i32 %115
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind ssp willreturn memory(argmem: readwrite) uwtable(sync)
define void @_Z4swapPPcS0_(ptr nocapture noundef %0, ptr nocapture noundef %1) local_unnamed_addr #2 {
  %3 = load ptr, ptr %0, align 8, !tbaa !8
  %4 = load ptr, ptr %1, align 8, !tbaa !8
  store ptr %4, ptr %0, align 8, !tbaa !8
  store ptr %3, ptr %1, align 8, !tbaa !8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind ssp memory(argmem: readwrite) uwtable(sync)
define void @_Z4stepPcS_(ptr nocapture noundef readonly %0, ptr nocapture noundef writeonly %1) local_unnamed_addr #3 {
  br label %3

3:                                                ; preds = %2, %8
  %4 = phi i64 [ 0, %2 ], [ %9, %8 ]
  %5 = mul nuw nsw i64 %4, 50
  %6 = trunc nuw nsw i64 %4 to i32
  br label %11

7:                                                ; preds = %8
  ret void

8:                                                ; preds = %30
  %9 = add nuw nsw i64 %4, 1
  %10 = icmp eq i64 %9, 25
  br i1 %10, label %7, label %3, !llvm.loop !10

11:                                               ; preds = %3, %30
  %12 = phi i64 [ 0, %3 ], [ %31, %30 ]
  %13 = trunc nuw nsw i64 %12 to i32
  %14 = tail call noundef i32 @_Z9neighborsPcii(ptr noundef %0, i32 noundef %13, i32 noundef %6)
  %15 = add nuw nsw i64 %12, %5
  %16 = getelementptr inbounds i8, ptr %0, i64 %15
  %17 = load i8, ptr %16, align 1, !tbaa !5
  %18 = icmp eq i8 %17, 0
  br i1 %18, label %25, label %19

19:                                               ; preds = %11
  %20 = and i32 %14, -2
  %21 = icmp eq i32 %20, 2
  %22 = getelementptr inbounds i8, ptr %1, i64 %15
  br i1 %21, label %23, label %24

23:                                               ; preds = %19
  store i8 1, ptr %22, align 1, !tbaa !5
  br label %30

24:                                               ; preds = %19
  store i8 0, ptr %22, align 1, !tbaa !5
  br label %30

25:                                               ; preds = %11
  %26 = icmp eq i32 %14, 3
  %27 = getelementptr inbounds i8, ptr %1, i64 %15
  br i1 %26, label %28, label %29

28:                                               ; preds = %25
  store i8 1, ptr %27, align 1, !tbaa !5
  br label %30

29:                                               ; preds = %25
  store i8 0, ptr %27, align 1, !tbaa !5
  br label %30

30:                                               ; preds = %24, %23, %29, %28
  %31 = add nuw nsw i64 %12, 1
  %32 = icmp eq i64 %31, 50
  br i1 %32, label %8, label %11, !llvm.loop !12
}

; Function Attrs: mustprogress ssp uwtable(sync)
define void @_Z3appv() local_unnamed_addr #4 {
  %1 = alloca [1250 x i8], align 1
  %2 = alloca [1250 x i8], align 1
  call void @llvm.lifetime.start.p0(i64 1250, ptr nonnull %1) #7
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 1 dereferenceable(1250) %1, i8 0, i64 1250, i1 false)
  %3 = getelementptr inbounds i8, ptr %1, i64 76
  store i8 1, ptr %3, align 1, !tbaa !5
  %4 = getelementptr inbounds i8, ptr %1, i64 124
  store i8 1, ptr %4, align 1, !tbaa !5
  %5 = getelementptr inbounds i8, ptr %1, i64 126
  store i8 1, ptr %5, align 1, !tbaa !5
  %6 = getelementptr inbounds i8, ptr %1, i64 164
  store i8 1, ptr %6, align 1, !tbaa !5
  %7 = getelementptr inbounds i8, ptr %1, i64 165
  store i8 1, ptr %7, align 1, !tbaa !5
  %8 = getelementptr inbounds i8, ptr %1, i64 172
  store i8 1, ptr %8, align 1, !tbaa !5
  %9 = getelementptr inbounds i8, ptr %1, i64 173
  store i8 1, ptr %9, align 1, !tbaa !5
  %10 = getelementptr inbounds i8, ptr %1, i64 186
  store i8 1, ptr %10, align 1, !tbaa !5
  %11 = getelementptr inbounds i8, ptr %1, i64 187
  store i8 1, ptr %11, align 1, !tbaa !5
  %12 = getelementptr inbounds i8, ptr %1, i64 213
  store i8 1, ptr %12, align 1, !tbaa !5
  %13 = getelementptr inbounds i8, ptr %1, i64 217
  store i8 1, ptr %13, align 1, !tbaa !5
  %14 = getelementptr inbounds i8, ptr %1, i64 222
  store i8 1, ptr %14, align 1, !tbaa !5
  %15 = getelementptr inbounds i8, ptr %1, i64 223
  store i8 1, ptr %15, align 1, !tbaa !5
  %16 = getelementptr inbounds i8, ptr %1, i64 236
  store i8 1, ptr %16, align 1, !tbaa !5
  %17 = getelementptr inbounds i8, ptr %1, i64 237
  store i8 1, ptr %17, align 1, !tbaa !5
  %18 = getelementptr inbounds i8, ptr %1, i64 252
  store i8 1, ptr %18, align 1, !tbaa !5
  %19 = getelementptr inbounds i8, ptr %1, i64 253
  store i8 1, ptr %19, align 1, !tbaa !5
  %20 = getelementptr inbounds i8, ptr %1, i64 262
  store i8 1, ptr %20, align 1, !tbaa !5
  %21 = getelementptr inbounds i8, ptr %1, i64 268
  store i8 1, ptr %21, align 1, !tbaa !5
  %22 = getelementptr inbounds i8, ptr %1, i64 272
  store i8 1, ptr %22, align 1, !tbaa !5
  %23 = getelementptr inbounds i8, ptr %1, i64 273
  store i8 1, ptr %23, align 1, !tbaa !5
  %24 = getelementptr inbounds i8, ptr %1, i64 302
  store i8 1, ptr %24, align 1, !tbaa !5
  %25 = getelementptr inbounds i8, ptr %1, i64 303
  store i8 1, ptr %25, align 1, !tbaa !5
  %26 = getelementptr inbounds i8, ptr %1, i64 312
  store i8 1, ptr %26, align 1, !tbaa !5
  %27 = getelementptr inbounds i8, ptr %1, i64 316
  store i8 1, ptr %27, align 1, !tbaa !5
  %28 = getelementptr inbounds i8, ptr %1, i64 318
  store i8 1, ptr %28, align 1, !tbaa !5
  %29 = getelementptr inbounds i8, ptr %1, i64 319
  store i8 1, ptr %29, align 1, !tbaa !5
  %30 = getelementptr inbounds i8, ptr %1, i64 324
  store i8 1, ptr %30, align 1, !tbaa !5
  %31 = getelementptr inbounds i8, ptr %1, i64 326
  store i8 1, ptr %31, align 1, !tbaa !5
  %32 = getelementptr inbounds i8, ptr %1, i64 362
  store i8 1, ptr %32, align 1, !tbaa !5
  %33 = getelementptr inbounds i8, ptr %1, i64 368
  store i8 1, ptr %33, align 1, !tbaa !5
  %34 = getelementptr inbounds i8, ptr %1, i64 376
  store i8 1, ptr %34, align 1, !tbaa !5
  %35 = getelementptr inbounds i8, ptr %1, i64 413
  store i8 1, ptr %35, align 1, !tbaa !5
  %36 = getelementptr inbounds i8, ptr %1, i64 417
  store i8 1, ptr %36, align 1, !tbaa !5
  %37 = getelementptr inbounds i8, ptr %1, i64 464
  store i8 1, ptr %37, align 1, !tbaa !5
  %38 = getelementptr inbounds i8, ptr %1, i64 465
  store i8 1, ptr %38, align 1, !tbaa !5
  call void @llvm.lifetime.start.p0(i64 1250, ptr nonnull %2) #7
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 1 dereferenceable(1250) %2, i8 0, i64 1250, i1 false)
  br label %39

39:                                               ; preds = %0, %79
  %40 = phi i32 [ 0, %0 ], [ %80, %79 ]
  %41 = phi ptr [ %2, %0 ], [ %42, %79 ]
  %42 = phi ptr [ %1, %0 ], [ %41, %79 ]
  br label %44

43:                                               ; preds = %79
  call void @llvm.lifetime.end.p0(i64 1250, ptr nonnull %2) #7
  call void @llvm.lifetime.end.p0(i64 1250, ptr nonnull %1) #7
  ret void

44:                                               ; preds = %39, %82
  %45 = phi i64 [ 0, %39 ], [ %83, %82 ]
  %46 = mul nuw nsw i64 %45, 50
  %47 = trunc nuw nsw i64 %45 to i32
  %48 = trunc nuw nsw i64 %45 to i32
  br label %85

49:                                               ; preds = %82
  tail call void @simFlush()
  br label %50

50:                                               ; preds = %54, %49
  %51 = phi i64 [ 0, %49 ], [ %55, %54 ]
  %52 = mul nuw nsw i64 %51, 50
  %53 = trunc nuw nsw i64 %51 to i32
  br label %57

54:                                               ; preds = %76
  %55 = add nuw nsw i64 %51, 1
  %56 = icmp eq i64 %55, 25
  br i1 %56, label %79, label %50, !llvm.loop !10

57:                                               ; preds = %76, %50
  %58 = phi i64 [ 0, %50 ], [ %77, %76 ]
  %59 = trunc nuw nsw i64 %58 to i32
  %60 = call noundef i32 @_Z9neighborsPcii(ptr noundef nonnull readonly %42, i32 noundef %59, i32 noundef %53)
  %61 = add nuw nsw i64 %58, %52
  %62 = getelementptr inbounds i8, ptr %42, i64 %61
  %63 = load i8, ptr %62, align 1, !tbaa !5
  %64 = icmp eq i8 %63, 0
  br i1 %64, label %71, label %65

65:                                               ; preds = %57
  %66 = and i32 %60, -2
  %67 = icmp eq i32 %66, 2
  %68 = getelementptr inbounds i8, ptr %41, i64 %61
  br i1 %67, label %69, label %70

69:                                               ; preds = %65
  store i8 1, ptr %68, align 1, !tbaa !5
  br label %76

70:                                               ; preds = %65
  store i8 0, ptr %68, align 1, !tbaa !5
  br label %76

71:                                               ; preds = %57
  %72 = icmp eq i32 %60, 3
  %73 = getelementptr inbounds i8, ptr %41, i64 %61
  br i1 %72, label %74, label %75

74:                                               ; preds = %71
  store i8 1, ptr %73, align 1, !tbaa !5
  br label %76

75:                                               ; preds = %71
  store i8 0, ptr %73, align 1, !tbaa !5
  br label %76

76:                                               ; preds = %75, %74, %70, %69
  %77 = add nuw nsw i64 %58, 1
  %78 = icmp eq i64 %77, 50
  br i1 %78, label %54, label %57, !llvm.loop !12

79:                                               ; preds = %54
  %80 = add nuw nsw i32 %40, 1
  %81 = icmp eq i32 %80, 1000
  br i1 %81, label %43, label %39, !llvm.loop !13

82:                                               ; preds = %94
  %83 = add nuw nsw i64 %45, 1
  %84 = icmp eq i64 %83, 25
  br i1 %84, label %49, label %44, !llvm.loop !14

85:                                               ; preds = %44, %94
  %86 = phi i64 [ 0, %44 ], [ %95, %94 ]
  %87 = add nuw nsw i64 %86, %46
  %88 = getelementptr inbounds i8, ptr %42, i64 %87
  %89 = load i8, ptr %88, align 1, !tbaa !5
  %90 = icmp eq i8 %89, 0
  %91 = trunc nuw nsw i64 %86 to i32
  br i1 %90, label %92, label %93

92:                                               ; preds = %85
  tail call void @simPutDisplayPixel(i32 noundef %91, i32 noundef %48, i32 noundef -1, i32 noundef 40)
  br label %94

93:                                               ; preds = %85
  tail call void @simPutDisplayPixel(i32 noundef %91, i32 noundef %47, i32 noundef -16777216, i32 noundef 40)
  br label %94

94:                                               ; preds = %92, %93
  %95 = add nuw nsw i64 %86, 1
  %96 = icmp eq i64 %95, 50
  br i1 %96, label %82, label %85, !llvm.loop !15
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #5

declare void @simPutDisplayPixel(i32 noundef, i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #6

declare void @simFlush() local_unnamed_addr #6

attributes #0 = { mustprogress nofree norecurse nosync nounwind ssp willreturn memory(argmem: read) uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind ssp willreturn memory(argmem: readwrite) uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #3 = { mustprogress nofree norecurse nosync nounwind ssp memory(argmem: readwrite) uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #4 = { mustprogress ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #5 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #6 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #7 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 1}
!3 = !{i32 7, !"frame-pointer", i32 1}
!4 = !{!"Homebrew clang version 19.1.0"}
!5 = !{!6, !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{!9, !9, i64 0}
!9 = !{!"any pointer", !6, i64 0}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
!13 = distinct !{!13, !11}
!14 = distinct !{!14, !11}
!15 = distinct !{!15, !11}

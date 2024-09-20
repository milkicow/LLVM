; ModuleID = 'app.cpp'
source_filename = "app.cpp"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx14.0.0"

@__const._Z3appv.alive = private unnamed_addr constant <{ [50 x i8], <{ [26 x i8], [24 x i8] }>, <{ [26 x i8], [24 x i8] }>, <{ [37 x i8], [13 x i8] }>, <{ [37 x i8], [13 x i8] }>, <{ [23 x i8], [27 x i8] }>, <{ [26 x i8], [24 x i8] }>, <{ [26 x i8], [24 x i8] }>, <{ [17 x i8], [33 x i8] }>, <{ [15 x i8], [35 x i8] }>, [15 x [50 x i8]] }> <{ [50 x i8] zeroinitializer, <{ [26 x i8], [24 x i8] }> <{ [26 x i8] c"\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01", [24 x i8] zeroinitializer }>, <{ [26 x i8], [24 x i8] }> <{ [26 x i8] c"\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\01", [24 x i8] zeroinitializer }>, <{ [37 x i8], [13 x i8] }> <{ [37 x i8] c"\00\00\00\00\00\00\00\00\00\00\00\00\00\01\01\00\00\00\00\00\00\01\01\00\00\00\00\00\00\00\00\00\00\00\00\01\01", [13 x i8] zeroinitializer }>, <{ [37 x i8], [13 x i8] }> <{ [37 x i8] c"\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\01\00\00\00\00\01\01\00\00\00\00\00\00\00\00\00\00\00\00\01\01", [13 x i8] zeroinitializer }>, <{ [23 x i8], [27 x i8] }> <{ [23 x i8] c"\00\01\01\00\00\00\00\00\00\00\00\01\00\00\00\00\00\01\00\00\00\01\01", [27 x i8] zeroinitializer }>, <{ [26 x i8], [24 x i8] }> <{ [26 x i8] c"\00\01\01\00\00\00\00\00\00\00\00\01\00\00\00\01\00\01\01\00\00\00\00\01\00\01", [24 x i8] zeroinitializer }>, <{ [26 x i8], [24 x i8] }> <{ [26 x i8] c"\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\01\00\00\00\00\00\00\00\01", [24 x i8] zeroinitializer }>, <{ [17 x i8], [33 x i8] }> <{ [17 x i8] c"\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\01", [33 x i8] zeroinitializer }>, <{ [15 x i8], [35 x i8] }> <{ [15 x i8] c"\00\00\00\00\00\00\00\00\00\00\00\00\00\01\01", [35 x i8] zeroinitializer }>, [15 x [50 x i8]] zeroinitializer }>, align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind ssp willreturn memory(argmem: read) uwtable(sync)
define noundef i32 @_Z9neighborsPA50_cii(ptr nocapture noundef readonly %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = add nsw i32 %1, -1
  %5 = icmp slt i32 %2, 1
  %6 = icmp ugt i32 %2, 25
  %7 = select i1 %6, i32 -26, i32 -1
  %8 = select i1 %5, i32 24, i32 %7
  %9 = add nsw i32 %8, %2
  %10 = sext i32 %9 to i64
  %11 = icmp slt i32 %1, 1
  %12 = add nsw i32 %1, 49
  %13 = icmp ugt i32 %1, 50
  %14 = add nsw i32 %1, -51
  %15 = select i1 %13, i32 %14, i32 %4
  %16 = select i1 %11, i32 %12, i32 %15
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [50 x i8], ptr %0, i64 %10, i64 %17
  %19 = load i8, ptr %18, align 1, !tbaa !5
  %20 = icmp slt i32 %1, 0
  %21 = add nsw i32 %1, 50
  %22 = icmp ugt i32 %1, 49
  %23 = add nsw i32 %1, -50
  %24 = select i1 %22, i32 %23, i32 %1
  %25 = select i1 %20, i32 %21, i32 %24
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [50 x i8], ptr %0, i64 %10, i64 %26
  %28 = load i8, ptr %27, align 1, !tbaa !5
  %29 = icmp slt i32 %1, -1
  %30 = icmp sgt i32 %1, 48
  %31 = select i1 %30, i32 -49, i32 1
  %32 = select i1 %29, i32 51, i32 %31
  %33 = add nsw i32 %32, %1
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [50 x i8], ptr %0, i64 %10, i64 %34
  %36 = load i8, ptr %35, align 1, !tbaa !5
  %37 = icmp slt i32 %2, 0
  %38 = add nsw i32 %2, 25
  %39 = icmp ugt i32 %2, 24
  %40 = add nsw i32 %2, -25
  %41 = select i1 %39, i32 %40, i32 %2
  %42 = select i1 %37, i32 %38, i32 %41
  %43 = sext i32 %42 to i64
  %44 = icmp slt i32 %1, 1
  %45 = add nsw i32 %1, 49
  %46 = icmp ugt i32 %1, 50
  %47 = add nsw i32 %1, -51
  %48 = select i1 %46, i32 %47, i32 %4
  %49 = select i1 %44, i32 %45, i32 %48
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [50 x i8], ptr %0, i64 %43, i64 %50
  %52 = load i8, ptr %51, align 1, !tbaa !5
  %53 = icmp slt i32 %1, -1
  %54 = icmp sgt i32 %1, 48
  %55 = select i1 %54, i32 -49, i32 1
  %56 = select i1 %53, i32 51, i32 %55
  %57 = add nsw i32 %56, %1
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [50 x i8], ptr %0, i64 %43, i64 %58
  %60 = load i8, ptr %59, align 1, !tbaa !5
  %61 = icmp slt i32 %2, -1
  %62 = icmp sgt i32 %2, 23
  %63 = select i1 %62, i32 -24, i32 1
  %64 = select i1 %61, i32 26, i32 %63
  %65 = add nsw i32 %64, %2
  %66 = sext i32 %65 to i64
  %67 = icmp slt i32 %1, 1
  %68 = add nsw i32 %1, 49
  %69 = icmp ugt i32 %1, 50
  %70 = add nsw i32 %1, -51
  %71 = select i1 %69, i32 %70, i32 %4
  %72 = select i1 %67, i32 %68, i32 %71
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [50 x i8], ptr %0, i64 %66, i64 %73
  %75 = load i8, ptr %74, align 1, !tbaa !5
  %76 = icmp slt i32 %1, 0
  %77 = add nsw i32 %1, 50
  %78 = icmp ugt i32 %1, 49
  %79 = add nsw i32 %1, -50
  %80 = select i1 %78, i32 %79, i32 %1
  %81 = select i1 %76, i32 %77, i32 %80
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [50 x i8], ptr %0, i64 %66, i64 %82
  %84 = load i8, ptr %83, align 1, !tbaa !5
  %85 = icmp slt i32 %1, -1
  %86 = icmp sgt i32 %1, 48
  %87 = select i1 %86, i32 -49, i32 1
  %88 = select i1 %85, i32 51, i32 %87
  %89 = add nsw i32 %88, %1
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds [50 x i8], ptr %0, i64 %66, i64 %90
  %92 = load i8, ptr %91, align 1, !tbaa !5
  %93 = sext i8 %19 to i32
  %94 = sext i8 %28 to i32
  %95 = add nsw i32 %93, %94
  %96 = sext i8 %36 to i32
  %97 = add nsw i32 %95, %96
  %98 = sext i8 %52 to i32
  %99 = add nsw i32 %97, %98
  %100 = sext i8 %60 to i32
  %101 = add nsw i32 %99, %100
  %102 = sext i8 %75 to i32
  %103 = add nsw i32 %101, %102
  %104 = sext i8 %84 to i32
  %105 = add nsw i32 %103, %104
  %106 = sext i8 %92 to i32
  %107 = add nsw i32 %105, %106
  ret i32 %107
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind ssp memory(argmem: readwrite) uwtable(sync)
define void @_Z4copyPA50_cS0_(ptr nocapture noundef writeonly %0, ptr nocapture noundef %1) local_unnamed_addr #2 {
  %3 = getelementptr i8, ptr %0, i64 1250
  %4 = getelementptr i8, ptr %1, i64 1250
  %5 = icmp ugt ptr %4, %0
  %6 = icmp ugt ptr %3, %1
  %7 = and i1 %5, %6
  br label %8

8:                                                ; preds = %24, %2
  %9 = phi i64 [ 0, %2 ], [ %25, %24 ]
  br i1 %7, label %27, label %10

10:                                               ; preds = %8
  %11 = getelementptr inbounds [50 x i8], ptr %1, i64 %9, i64 0
  %12 = load <16 x i8>, ptr %11, align 1, !tbaa !5, !alias.scope !8
  %13 = getelementptr inbounds [50 x i8], ptr %0, i64 %9, i64 0
  store <16 x i8> %12, ptr %13, align 1, !tbaa !5, !alias.scope !11, !noalias !8
  store <16 x i8> zeroinitializer, ptr %11, align 1, !tbaa !5, !alias.scope !8
  %14 = getelementptr inbounds [50 x i8], ptr %1, i64 %9, i64 16
  %15 = load <16 x i8>, ptr %14, align 1, !tbaa !5, !alias.scope !8
  %16 = getelementptr inbounds [50 x i8], ptr %0, i64 %9, i64 16
  store <16 x i8> %15, ptr %16, align 1, !tbaa !5, !alias.scope !11, !noalias !8
  store <16 x i8> zeroinitializer, ptr %14, align 1, !tbaa !5, !alias.scope !8
  %17 = getelementptr inbounds [50 x i8], ptr %1, i64 %9, i64 32
  %18 = load <16 x i8>, ptr %17, align 1, !tbaa !5, !alias.scope !8
  %19 = getelementptr inbounds [50 x i8], ptr %0, i64 %9, i64 32
  store <16 x i8> %18, ptr %19, align 1, !tbaa !5, !alias.scope !11, !noalias !8
  store <16 x i8> zeroinitializer, ptr %17, align 1, !tbaa !5, !alias.scope !8
  %20 = getelementptr inbounds [50 x i8], ptr %1, i64 %9, i64 48
  %21 = load <2 x i8>, ptr %20, align 1, !tbaa !5, !alias.scope !13
  %22 = getelementptr inbounds [50 x i8], ptr %0, i64 %9, i64 48
  store <2 x i8> %21, ptr %22, align 1, !tbaa !5, !alias.scope !16, !noalias !13
  store <2 x i8> zeroinitializer, ptr %20, align 1, !tbaa !5, !alias.scope !13
  br label %24

23:                                               ; preds = %24
  ret void

24:                                               ; preds = %27, %10
  %25 = add nuw nsw i64 %9, 1
  %26 = icmp eq i64 %25, 25
  br i1 %26, label %23, label %8, !llvm.loop !18

27:                                               ; preds = %8, %27
  %28 = phi i64 [ %32, %27 ], [ 0, %8 ]
  %29 = getelementptr inbounds [50 x i8], ptr %1, i64 %9, i64 %28
  %30 = load i8, ptr %29, align 1, !tbaa !5
  %31 = getelementptr inbounds [50 x i8], ptr %0, i64 %9, i64 %28
  store i8 %30, ptr %31, align 1, !tbaa !5
  store i8 0, ptr %29, align 1, !tbaa !5
  %32 = add nuw nsw i64 %28, 1
  %33 = icmp eq i64 %32, 50
  br i1 %33, label %24, label %27, !llvm.loop !20
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind ssp memory(argmem: readwrite) uwtable(sync)
define void @_Z4stepPA50_cS0_(ptr nocapture noundef %0, ptr nocapture noundef %1) local_unnamed_addr #2 {
  br label %3

3:                                                ; preds = %2, %32
  %4 = phi i64 [ 0, %2 ], [ %33, %32 ]
  %5 = trunc nuw nsw i64 %4 to i32
  br label %41

6:                                                ; preds = %21, %35
  %7 = phi i64 [ %22, %21 ], [ 0, %35 ]
  br i1 %40, label %24, label %8

8:                                                ; preds = %6
  %9 = getelementptr inbounds [50 x i8], ptr %1, i64 %7, i64 0
  %10 = load <16 x i8>, ptr %9, align 1, !tbaa !5, !alias.scope !22
  %11 = getelementptr inbounds [50 x i8], ptr %0, i64 %7, i64 0
  store <16 x i8> %10, ptr %11, align 1, !tbaa !5, !alias.scope !25, !noalias !22
  store <16 x i8> zeroinitializer, ptr %9, align 1, !tbaa !5, !alias.scope !22
  %12 = getelementptr inbounds [50 x i8], ptr %1, i64 %7, i64 16
  %13 = load <16 x i8>, ptr %12, align 1, !tbaa !5, !alias.scope !22
  %14 = getelementptr inbounds [50 x i8], ptr %0, i64 %7, i64 16
  store <16 x i8> %13, ptr %14, align 1, !tbaa !5, !alias.scope !25, !noalias !22
  store <16 x i8> zeroinitializer, ptr %12, align 1, !tbaa !5, !alias.scope !22
  %15 = getelementptr inbounds [50 x i8], ptr %1, i64 %7, i64 32
  %16 = load <16 x i8>, ptr %15, align 1, !tbaa !5, !alias.scope !22
  %17 = getelementptr inbounds [50 x i8], ptr %0, i64 %7, i64 32
  store <16 x i8> %16, ptr %17, align 1, !tbaa !5, !alias.scope !25, !noalias !22
  store <16 x i8> zeroinitializer, ptr %15, align 1, !tbaa !5, !alias.scope !22
  %18 = getelementptr inbounds [50 x i8], ptr %1, i64 %7, i64 48
  %19 = load <2 x i8>, ptr %18, align 1, !tbaa !5, !alias.scope !27
  %20 = getelementptr inbounds [50 x i8], ptr %0, i64 %7, i64 48
  store <2 x i8> %19, ptr %20, align 1, !tbaa !5, !alias.scope !30, !noalias !27
  store <2 x i8> zeroinitializer, ptr %18, align 1, !tbaa !5, !alias.scope !27
  br label %21

21:                                               ; preds = %24, %8
  %22 = add nuw nsw i64 %7, 1
  %23 = icmp eq i64 %22, 25
  br i1 %23, label %31, label %6, !llvm.loop !18

24:                                               ; preds = %6, %24
  %25 = phi i64 [ %29, %24 ], [ 0, %6 ]
  %26 = getelementptr inbounds [50 x i8], ptr %1, i64 %7, i64 %25
  %27 = load i8, ptr %26, align 1, !tbaa !5
  %28 = getelementptr inbounds [50 x i8], ptr %0, i64 %7, i64 %25
  store i8 %27, ptr %28, align 1, !tbaa !5
  store i8 0, ptr %26, align 1, !tbaa !5
  %29 = add nuw nsw i64 %25, 1
  %30 = icmp eq i64 %29, 50
  br i1 %30, label %21, label %24, !llvm.loop !32

31:                                               ; preds = %21
  ret void

32:                                               ; preds = %59
  %33 = add nuw nsw i64 %4, 1
  %34 = icmp eq i64 %33, 25
  br i1 %34, label %35, label %3, !llvm.loop !33

35:                                               ; preds = %32
  %36 = getelementptr i8, ptr %0, i64 1250
  %37 = getelementptr i8, ptr %1, i64 1250
  %38 = icmp ugt ptr %37, %0
  %39 = icmp ugt ptr %36, %1
  %40 = and i1 %38, %39
  br label %6

41:                                               ; preds = %3, %59
  %42 = phi i64 [ 0, %3 ], [ %60, %59 ]
  %43 = trunc nuw nsw i64 %42 to i32
  %44 = tail call noundef i32 @_Z9neighborsPA50_cii(ptr noundef %0, i32 noundef %43, i32 noundef %5)
  %45 = getelementptr inbounds [50 x i8], ptr %0, i64 %4, i64 %42
  %46 = load i8, ptr %45, align 1, !tbaa !5
  %47 = icmp eq i8 %46, 0
  br i1 %47, label %54, label %48

48:                                               ; preds = %41
  %49 = and i32 %44, -2
  %50 = icmp eq i32 %49, 2
  %51 = getelementptr inbounds [50 x i8], ptr %1, i64 %4, i64 %42
  br i1 %50, label %52, label %53

52:                                               ; preds = %48
  store i8 1, ptr %51, align 1, !tbaa !5
  br label %59

53:                                               ; preds = %48
  store i8 0, ptr %51, align 1, !tbaa !5
  br label %59

54:                                               ; preds = %41
  %55 = icmp eq i32 %44, 3
  %56 = getelementptr inbounds [50 x i8], ptr %1, i64 %4, i64 %42
  br i1 %55, label %57, label %58

57:                                               ; preds = %54
  store i8 1, ptr %56, align 1, !tbaa !5
  br label %59

58:                                               ; preds = %54
  store i8 0, ptr %56, align 1, !tbaa !5
  br label %59

59:                                               ; preds = %53, %52, %58, %57
  %60 = add nuw nsw i64 %42, 1
  %61 = icmp eq i64 %60, 50
  br i1 %61, label %32, label %41, !llvm.loop !34
}

; Function Attrs: mustprogress ssp uwtable(sync)
define void @_Z3appv() local_unnamed_addr #3 {
  %1 = alloca [25 x [50 x i8]], align 1
  %2 = alloca [25 x [50 x i8]], align 1
  call void @llvm.lifetime.start.p0(i64 1250, ptr nonnull %1) #7
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 1 dereferenceable(1250) %1, ptr noundef nonnull align 1 dereferenceable(1250) @__const._Z3appv.alive, i64 1250, i1 false)
  call void @llvm.lifetime.start.p0(i64 1250, ptr nonnull %2) #7
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 1 dereferenceable(1250) %2, i8 0, i64 1250, i1 false)
  br label %3

3:                                                ; preds = %0, %54
  %4 = phi i32 [ 0, %0 ], [ %55, %54 ]
  br label %6

5:                                                ; preds = %54
  call void @llvm.lifetime.end.p0(i64 1250, ptr nonnull %2) #7
  call void @llvm.lifetime.end.p0(i64 1250, ptr nonnull %1) #7
  ret void

6:                                                ; preds = %3, %57
  %7 = phi i64 [ 0, %3 ], [ %58, %57 ]
  %8 = trunc nuw nsw i64 %7 to i32
  %9 = trunc nuw nsw i64 %7 to i32
  br label %60

10:                                               ; preds = %57
  tail call void @_Z8simFlushv()
  br label %11

11:                                               ; preds = %30, %10
  %12 = phi i64 [ 0, %10 ], [ %31, %30 ]
  %13 = trunc nuw nsw i64 %12 to i32
  br label %33

14:                                               ; preds = %30, %14
  %15 = phi i64 [ %28, %14 ], [ 0, %30 ]
  %16 = getelementptr inbounds [50 x i8], ptr %2, i64 %15, i64 0
  %17 = load <16 x i8>, ptr %16, align 1, !tbaa !5
  %18 = getelementptr inbounds [50 x i8], ptr %1, i64 %15, i64 0
  store <16 x i8> %17, ptr %18, align 1, !tbaa !5
  store <16 x i8> zeroinitializer, ptr %16, align 1, !tbaa !5
  %19 = getelementptr inbounds [50 x i8], ptr %2, i64 %15, i64 16
  %20 = load <16 x i8>, ptr %19, align 1, !tbaa !5
  %21 = getelementptr inbounds [50 x i8], ptr %1, i64 %15, i64 16
  store <16 x i8> %20, ptr %21, align 1, !tbaa !5
  store <16 x i8> zeroinitializer, ptr %19, align 1, !tbaa !5
  %22 = getelementptr inbounds [50 x i8], ptr %2, i64 %15, i64 32
  %23 = load <16 x i8>, ptr %22, align 1, !tbaa !5
  %24 = getelementptr inbounds [50 x i8], ptr %1, i64 %15, i64 32
  store <16 x i8> %23, ptr %24, align 1, !tbaa !5
  store <16 x i8> zeroinitializer, ptr %22, align 1, !tbaa !5
  %25 = getelementptr inbounds [50 x i8], ptr %2, i64 %15, i64 48
  %26 = load <2 x i8>, ptr %25, align 1, !tbaa !5
  %27 = getelementptr inbounds [50 x i8], ptr %1, i64 %15, i64 48
  store <2 x i8> %26, ptr %27, align 1, !tbaa !5
  store <2 x i8> zeroinitializer, ptr %25, align 1, !tbaa !5
  %28 = add nuw nsw i64 %15, 1
  %29 = icmp eq i64 %28, 25
  br i1 %29, label %54, label %14, !llvm.loop !18

30:                                               ; preds = %51
  %31 = add nuw nsw i64 %12, 1
  %32 = icmp eq i64 %31, 25
  br i1 %32, label %14, label %11, !llvm.loop !33

33:                                               ; preds = %51, %11
  %34 = phi i64 [ 0, %11 ], [ %52, %51 ]
  %35 = trunc nuw nsw i64 %34 to i32
  %36 = call noundef i32 @_Z9neighborsPA50_cii(ptr noundef nonnull %1, i32 noundef %35, i32 noundef %13)
  %37 = getelementptr inbounds [50 x i8], ptr %1, i64 %12, i64 %34
  %38 = load i8, ptr %37, align 1, !tbaa !5
  %39 = icmp eq i8 %38, 0
  br i1 %39, label %46, label %40

40:                                               ; preds = %33
  %41 = and i32 %36, -2
  %42 = icmp eq i32 %41, 2
  %43 = getelementptr inbounds [50 x i8], ptr %2, i64 %12, i64 %34
  br i1 %42, label %44, label %45

44:                                               ; preds = %40
  store i8 1, ptr %43, align 1, !tbaa !5
  br label %51

45:                                               ; preds = %40
  store i8 0, ptr %43, align 1, !tbaa !5
  br label %51

46:                                               ; preds = %33
  %47 = icmp eq i32 %36, 3
  %48 = getelementptr inbounds [50 x i8], ptr %2, i64 %12, i64 %34
  br i1 %47, label %49, label %50

49:                                               ; preds = %46
  store i8 1, ptr %48, align 1, !tbaa !5
  br label %51

50:                                               ; preds = %46
  store i8 0, ptr %48, align 1, !tbaa !5
  br label %51

51:                                               ; preds = %50, %49, %45, %44
  %52 = add nuw nsw i64 %34, 1
  %53 = icmp eq i64 %52, 50
  br i1 %53, label %30, label %33, !llvm.loop !34

54:                                               ; preds = %14
  %55 = add nuw nsw i32 %4, 1
  %56 = icmp eq i32 %55, 1000
  br i1 %56, label %5, label %3, !llvm.loop !35

57:                                               ; preds = %68
  %58 = add nuw nsw i64 %7, 1
  %59 = icmp eq i64 %58, 25
  br i1 %59, label %10, label %6, !llvm.loop !36

60:                                               ; preds = %6, %68
  %61 = phi i64 [ 0, %6 ], [ %69, %68 ]
  %62 = getelementptr inbounds [25 x [50 x i8]], ptr %1, i64 0, i64 %7, i64 %61
  %63 = load i8, ptr %62, align 1, !tbaa !5
  %64 = icmp eq i8 %63, 0
  %65 = trunc nuw nsw i64 %61 to i32
  br i1 %64, label %66, label %67

66:                                               ; preds = %60
  tail call void @_Z18simPutDisplayPixeliiii(i32 noundef %65, i32 noundef %9, i32 noundef -1, i32 noundef 40)
  br label %68

67:                                               ; preds = %60
  tail call void @_Z18simPutDisplayPixeliiii(i32 noundef %65, i32 noundef %8, i32 noundef -16777216, i32 noundef 40)
  br label %68

68:                                               ; preds = %66, %67
  %69 = add nuw nsw i64 %61, 1
  %70 = icmp eq i64 %69, 50
  br i1 %70, label %57, label %60, !llvm.loop !37
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #5

declare void @_Z18simPutDisplayPixeliiii(i32 noundef, i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #6

declare void @_Z8simFlushv() local_unnamed_addr #6

attributes #0 = { mustprogress nofree norecurse nosync nounwind ssp willreturn memory(argmem: read) uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind ssp memory(argmem: readwrite) uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #3 = { mustprogress ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #4 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
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
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = !{!14}
!14 = distinct !{!14, !15}
!15 = distinct !{!15, !"LVerDomain"}
!16 = !{!17}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !19}
!19 = !{!"llvm.loop.mustprogress"}
!20 = distinct !{!20, !19, !21}
!21 = !{!"llvm.loop.isvectorized", i32 1}
!22 = !{!23}
!23 = distinct !{!23, !24}
!24 = distinct !{!24, !"LVerDomain"}
!25 = !{!26}
!26 = distinct !{!26, !24}
!27 = !{!28}
!28 = distinct !{!28, !29}
!29 = distinct !{!29, !"LVerDomain"}
!30 = !{!31}
!31 = distinct !{!31, !29}
!32 = distinct !{!32, !19, !21}
!33 = distinct !{!33, !19}
!34 = distinct !{!34, !19}
!35 = distinct !{!35, !19}
!36 = distinct !{!36, !19}
!37 = distinct !{!37, !19}

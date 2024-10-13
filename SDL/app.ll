; ModuleID = 'app.c'
source_filename = "app.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx14.0.0"

; Function Attrs: argmemonly nofree norecurse nosync nounwind readonly ssp uwtable(sync)
define i32 @neighbors(ptr nocapture noundef readonly %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = icmp slt i32 %2, 1
  %5 = icmp sgt i32 %2, 25
  %6 = select i1 %5, i32 -26, i32 -1
  %7 = select i1 %4, i32 24, i32 %6
  %8 = add nsw i32 %7, %2
  %9 = mul nsw i32 %8, 50
  %10 = icmp slt i32 %1, 1
  %11 = icmp sgt i32 %1, 50
  %12 = select i1 %11, i32 -51, i32 -1
  %13 = select i1 %10, i32 49, i32 %12
  %14 = add nsw i32 %13, %1
  %15 = add nsw i32 %14, %9
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i8, ptr %0, i64 %16
  %18 = load i8, ptr %17, align 1, !tbaa !6
  %19 = icmp slt i32 %1, 0
  %20 = add nsw i32 %1, 50
  %21 = icmp sgt i32 %1, 49
  %22 = add nsw i32 %1, -50
  %23 = select i1 %21, i32 %22, i32 %1
  %24 = select i1 %19, i32 %20, i32 %23
  %25 = add nsw i32 %24, %9
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i8, ptr %0, i64 %26
  %28 = load i8, ptr %27, align 1, !tbaa !6
  %29 = icmp slt i32 %1, -1
  %30 = icmp sgt i32 %1, 48
  %31 = select i1 %30, i32 -49, i32 1
  %32 = select i1 %29, i32 51, i32 %31
  %33 = add nsw i32 %32, %1
  %34 = add nsw i32 %33, %9
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i8, ptr %0, i64 %35
  %37 = load i8, ptr %36, align 1, !tbaa !6
  %38 = icmp slt i32 %2, 0
  %39 = add nsw i32 %2, 25
  %40 = icmp sgt i32 %2, 24
  %41 = add nsw i32 %2, -25
  %42 = select i1 %40, i32 %41, i32 %2
  %43 = select i1 %38, i32 %39, i32 %42
  %44 = mul nsw i32 %43, 50
  %45 = add nsw i32 %14, %44
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i8, ptr %0, i64 %46
  %48 = load i8, ptr %47, align 1, !tbaa !6
  %49 = add nsw i32 %33, %44
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i8, ptr %0, i64 %50
  %52 = load i8, ptr %51, align 1, !tbaa !6
  %53 = icmp slt i32 %2, -1
  %54 = icmp sgt i32 %2, 23
  %55 = select i1 %54, i32 -24, i32 1
  %56 = select i1 %53, i32 26, i32 %55
  %57 = add nsw i32 %56, %2
  %58 = mul nsw i32 %57, 50
  %59 = add nsw i32 %14, %58
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i8, ptr %0, i64 %60
  %62 = load i8, ptr %61, align 1, !tbaa !6
  %63 = add nsw i32 %24, %58
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i8, ptr %0, i64 %64
  %66 = load i8, ptr %65, align 1, !tbaa !6
  %67 = add nsw i32 %33, %58
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i8, ptr %0, i64 %68
  %70 = load i8, ptr %69, align 1, !tbaa !6
  %71 = sext i8 %18 to i32
  %72 = sext i8 %28 to i32
  %73 = add nsw i32 %71, %72
  %74 = sext i8 %37 to i32
  %75 = add nsw i32 %73, %74
  %76 = sext i8 %48 to i32
  %77 = add nsw i32 %75, %76
  %78 = sext i8 %52 to i32
  %79 = add nsw i32 %77, %78
  %80 = sext i8 %62 to i32
  %81 = add nsw i32 %79, %80
  %82 = sext i8 %66 to i32
  %83 = add nsw i32 %81, %82
  %84 = sext i8 %70 to i32
  %85 = add nsw i32 %83, %84
  ret i32 %85
}

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind ssp willreturn uwtable(sync)
define void @swap(ptr nocapture noundef %0, ptr nocapture noundef %1) local_unnamed_addr #2 {
  %3 = load ptr, ptr %0, align 8, !tbaa !9
  %4 = load ptr, ptr %1, align 8, !tbaa !9
  store ptr %4, ptr %0, align 8, !tbaa !9
  store ptr %3, ptr %1, align 8, !tbaa !9
  ret void
}

; Function Attrs: argmemonly nofree norecurse nosync nounwind ssp uwtable(sync)
define void @step(ptr nocapture noundef readonly %0, ptr nocapture noundef writeonly %1) local_unnamed_addr #3 {
  br label %3

3:                                                ; preds = %2, %8
  %4 = phi i64 [ 0, %2 ], [ %9, %8 ]
  %5 = mul nuw nsw i64 %4, 50
  %6 = trunc i64 %4 to i32
  br label %11

7:                                                ; preds = %8
  ret void

8:                                                ; preds = %30
  %9 = add nuw nsw i64 %4, 1
  %10 = icmp eq i64 %9, 25
  br i1 %10, label %7, label %3, !llvm.loop !11

11:                                               ; preds = %3, %30
  %12 = phi i64 [ 0, %3 ], [ %31, %30 ]
  %13 = trunc i64 %12 to i32
  %14 = tail call i32 @neighbors(ptr noundef %0, i32 noundef %13, i32 noundef %6)
  %15 = add nuw nsw i64 %12, %5
  %16 = getelementptr inbounds i8, ptr %0, i64 %15
  %17 = load i8, ptr %16, align 1, !tbaa !6
  %18 = icmp eq i8 %17, 0
  br i1 %18, label %25, label %19

19:                                               ; preds = %11
  %20 = and i32 %14, -2
  %21 = icmp eq i32 %20, 2
  %22 = getelementptr inbounds i8, ptr %1, i64 %15
  br i1 %21, label %23, label %24

23:                                               ; preds = %19
  store i8 1, ptr %22, align 1, !tbaa !6
  br label %30

24:                                               ; preds = %19
  store i8 0, ptr %22, align 1, !tbaa !6
  br label %30

25:                                               ; preds = %11
  %26 = icmp eq i32 %14, 3
  %27 = getelementptr inbounds i8, ptr %1, i64 %15
  br i1 %26, label %28, label %29

28:                                               ; preds = %25
  store i8 1, ptr %27, align 1, !tbaa !6
  br label %30

29:                                               ; preds = %25
  store i8 0, ptr %27, align 1, !tbaa !6
  br label %30

30:                                               ; preds = %24, %23, %29, %28
  %31 = add nuw nsw i64 %12, 1
  %32 = icmp eq i64 %31, 50
  br i1 %32, label %8, label %11, !llvm.loop !13
}

; Function Attrs: nounwind ssp uwtable(sync)
define void @app() local_unnamed_addr #4 {
  %1 = alloca [1250 x i8], align 1
  %2 = alloca [1250 x i8], align 1
  call void @llvm.lifetime.start.p0(i64 1250, ptr nonnull %1) #7
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 1 dereferenceable(1250) %1, i8 0, i64 1250, i1 false)
  %3 = getelementptr inbounds [1250 x i8], ptr %1, i64 0, i64 76
  store i8 1, ptr %3, align 1, !tbaa !6
  %4 = getelementptr inbounds [1250 x i8], ptr %1, i64 0, i64 124
  store i8 1, ptr %4, align 1, !tbaa !6
  %5 = getelementptr inbounds [1250 x i8], ptr %1, i64 0, i64 126
  store i8 1, ptr %5, align 1, !tbaa !6
  %6 = getelementptr inbounds [1250 x i8], ptr %1, i64 0, i64 164
  store i8 1, ptr %6, align 1, !tbaa !6
  %7 = getelementptr inbounds [1250 x i8], ptr %1, i64 0, i64 165
  store i8 1, ptr %7, align 1, !tbaa !6
  %8 = getelementptr inbounds [1250 x i8], ptr %1, i64 0, i64 172
  store i8 1, ptr %8, align 1, !tbaa !6
  %9 = getelementptr inbounds [1250 x i8], ptr %1, i64 0, i64 173
  store i8 1, ptr %9, align 1, !tbaa !6
  %10 = getelementptr inbounds [1250 x i8], ptr %1, i64 0, i64 186
  store i8 1, ptr %10, align 1, !tbaa !6
  %11 = getelementptr inbounds [1250 x i8], ptr %1, i64 0, i64 187
  store i8 1, ptr %11, align 1, !tbaa !6
  %12 = getelementptr inbounds [1250 x i8], ptr %1, i64 0, i64 213
  store i8 1, ptr %12, align 1, !tbaa !6
  %13 = getelementptr inbounds [1250 x i8], ptr %1, i64 0, i64 217
  store i8 1, ptr %13, align 1, !tbaa !6
  %14 = getelementptr inbounds [1250 x i8], ptr %1, i64 0, i64 222
  store i8 1, ptr %14, align 1, !tbaa !6
  %15 = getelementptr inbounds [1250 x i8], ptr %1, i64 0, i64 223
  store i8 1, ptr %15, align 1, !tbaa !6
  %16 = getelementptr inbounds [1250 x i8], ptr %1, i64 0, i64 236
  store i8 1, ptr %16, align 1, !tbaa !6
  %17 = getelementptr inbounds [1250 x i8], ptr %1, i64 0, i64 237
  store i8 1, ptr %17, align 1, !tbaa !6
  %18 = getelementptr inbounds [1250 x i8], ptr %1, i64 0, i64 252
  store i8 1, ptr %18, align 1, !tbaa !6
  %19 = getelementptr inbounds [1250 x i8], ptr %1, i64 0, i64 253
  store i8 1, ptr %19, align 1, !tbaa !6
  %20 = getelementptr inbounds [1250 x i8], ptr %1, i64 0, i64 262
  store i8 1, ptr %20, align 1, !tbaa !6
  %21 = getelementptr inbounds [1250 x i8], ptr %1, i64 0, i64 268
  store i8 1, ptr %21, align 1, !tbaa !6
  %22 = getelementptr inbounds [1250 x i8], ptr %1, i64 0, i64 272
  store i8 1, ptr %22, align 1, !tbaa !6
  %23 = getelementptr inbounds [1250 x i8], ptr %1, i64 0, i64 273
  store i8 1, ptr %23, align 1, !tbaa !6
  %24 = getelementptr inbounds [1250 x i8], ptr %1, i64 0, i64 302
  store i8 1, ptr %24, align 1, !tbaa !6
  %25 = getelementptr inbounds [1250 x i8], ptr %1, i64 0, i64 303
  store i8 1, ptr %25, align 1, !tbaa !6
  %26 = getelementptr inbounds [1250 x i8], ptr %1, i64 0, i64 312
  store i8 1, ptr %26, align 1, !tbaa !6
  %27 = getelementptr inbounds [1250 x i8], ptr %1, i64 0, i64 316
  store i8 1, ptr %27, align 1, !tbaa !6
  %28 = getelementptr inbounds [1250 x i8], ptr %1, i64 0, i64 318
  store i8 1, ptr %28, align 1, !tbaa !6
  %29 = getelementptr inbounds [1250 x i8], ptr %1, i64 0, i64 319
  store i8 1, ptr %29, align 1, !tbaa !6
  %30 = getelementptr inbounds [1250 x i8], ptr %1, i64 0, i64 324
  store i8 1, ptr %30, align 1, !tbaa !6
  %31 = getelementptr inbounds [1250 x i8], ptr %1, i64 0, i64 326
  store i8 1, ptr %31, align 1, !tbaa !6
  %32 = getelementptr inbounds [1250 x i8], ptr %1, i64 0, i64 362
  store i8 1, ptr %32, align 1, !tbaa !6
  %33 = getelementptr inbounds [1250 x i8], ptr %1, i64 0, i64 368
  store i8 1, ptr %33, align 1, !tbaa !6
  %34 = getelementptr inbounds [1250 x i8], ptr %1, i64 0, i64 376
  store i8 1, ptr %34, align 1, !tbaa !6
  %35 = getelementptr inbounds [1250 x i8], ptr %1, i64 0, i64 413
  store i8 1, ptr %35, align 1, !tbaa !6
  %36 = getelementptr inbounds [1250 x i8], ptr %1, i64 0, i64 417
  store i8 1, ptr %36, align 1, !tbaa !6
  %37 = getelementptr inbounds [1250 x i8], ptr %1, i64 0, i64 464
  store i8 1, ptr %37, align 1, !tbaa !6
  %38 = getelementptr inbounds [1250 x i8], ptr %1, i64 0, i64 465
  store i8 1, ptr %38, align 1, !tbaa !6
  call void @llvm.lifetime.start.p0(i64 1250, ptr nonnull %2) #7
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 1 dereferenceable(1250) %2, i8 0, i64 1250, i1 false)
  br label %39

39:                                               ; preds = %0, %78
  %40 = phi i32 [ 0, %0 ], [ %79, %78 ]
  %41 = phi ptr [ %2, %0 ], [ %42, %78 ]
  %42 = phi ptr [ %1, %0 ], [ %41, %78 ]
  br label %44

43:                                               ; preds = %78
  call void @llvm.lifetime.end.p0(i64 1250, ptr nonnull %2) #7
  call void @llvm.lifetime.end.p0(i64 1250, ptr nonnull %1) #7
  ret void

44:                                               ; preds = %39, %81
  %45 = phi i64 [ 0, %39 ], [ %82, %81 ]
  %46 = mul nuw nsw i64 %45, 50
  %47 = trunc i64 %45 to i32
  br label %84

48:                                               ; preds = %81
  tail call void @simFlush() #7
  br label %49

49:                                               ; preds = %53, %48
  %50 = phi i64 [ 0, %48 ], [ %54, %53 ]
  %51 = mul nuw nsw i64 %50, 50
  %52 = trunc i64 %50 to i32
  br label %56

53:                                               ; preds = %75
  %54 = add nuw nsw i64 %50, 1
  %55 = icmp eq i64 %54, 25
  br i1 %55, label %78, label %49, !llvm.loop !11

56:                                               ; preds = %75, %49
  %57 = phi i64 [ 0, %49 ], [ %76, %75 ]
  %58 = trunc i64 %57 to i32
  %59 = call i32 @neighbors(ptr noundef nonnull %42, i32 noundef %58, i32 noundef %52)
  %60 = add nuw nsw i64 %57, %51
  %61 = getelementptr inbounds i8, ptr %42, i64 %60
  %62 = load i8, ptr %61, align 1, !tbaa !6
  %63 = icmp eq i8 %62, 0
  br i1 %63, label %70, label %64

64:                                               ; preds = %56
  %65 = and i32 %59, -2
  %66 = icmp eq i32 %65, 2
  %67 = getelementptr inbounds i8, ptr %41, i64 %60
  br i1 %66, label %68, label %69

68:                                               ; preds = %64
  store i8 1, ptr %67, align 1, !tbaa !6
  br label %75

69:                                               ; preds = %64
  store i8 0, ptr %67, align 1, !tbaa !6
  br label %75

70:                                               ; preds = %56
  %71 = icmp eq i32 %59, 3
  %72 = getelementptr inbounds i8, ptr %41, i64 %60
  br i1 %71, label %73, label %74

73:                                               ; preds = %70
  store i8 1, ptr %72, align 1, !tbaa !6
  br label %75

74:                                               ; preds = %70
  store i8 0, ptr %72, align 1, !tbaa !6
  br label %75

75:                                               ; preds = %74, %73, %69, %68
  %76 = add nuw nsw i64 %57, 1
  %77 = icmp eq i64 %76, 50
  br i1 %77, label %53, label %56, !llvm.loop !13

78:                                               ; preds = %53
  %79 = add nuw nsw i32 %40, 1
  %80 = icmp eq i32 %79, 1000
  br i1 %80, label %43, label %39, !llvm.loop !14

81:                                               ; preds = %84
  %82 = add nuw nsw i64 %45, 1
  %83 = icmp eq i64 %82, 25
  br i1 %83, label %48, label %44, !llvm.loop !15

84:                                               ; preds = %44, %84
  %85 = phi i64 [ 0, %44 ], [ %92, %84 ]
  %86 = add nuw nsw i64 %85, %46
  %87 = getelementptr inbounds i8, ptr %42, i64 %86
  %88 = load i8, ptr %87, align 1, !tbaa !6
  %89 = icmp eq i8 %88, 0
  %90 = trunc i64 %85 to i32
  %91 = select i1 %89, i32 -1, i32 -16777216
  tail call void @simPutDisplayPixel(i32 noundef %90, i32 noundef %47, i32 noundef %91, i32 noundef 40) #7
  %92 = add nuw nsw i64 %85, 1
  %93 = icmp eq i64 %92, 50
  br i1 %93, label %81, label %84, !llvm.loop !16
}

; Function Attrs: argmemonly mustprogress nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #5

declare void @simPutDisplayPixel(i32 noundef, i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #6

declare void @simFlush(...) local_unnamed_addr #6

attributes #0 = { argmemonly nofree norecurse nosync nounwind readonly ssp uwtable(sync) "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree norecurse nosync nounwind ssp willreturn uwtable(sync) "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #3 = { argmemonly nofree norecurse nosync nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #4 = { nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #5 = { argmemonly mustprogress nocallback nofree nounwind willreturn writeonly }
attributes #6 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #7 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 14, i32 4]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"Apple clang version 15.0.0 (clang-1500.3.9.4)"}
!6 = !{!7, !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"any pointer", !7, i64 0}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !12}

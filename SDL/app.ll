; ModuleID = 'app.cpp'
source_filename = "app.cpp"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx14.0.0"

; Function Attrs: mustprogress ssp uwtable(sync)
define void @_Z3appv() local_unnamed_addr #0 {
  %1 = alloca [1250 x i8], align 1
  %2 = alloca [1250 x i8], align 1
  call void @llvm.lifetime.start.p0(i64 1250, ptr nonnull %1) #4
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 1 dereferenceable(1250) %1, i8 0, i64 1250, i1 false)
  %3 = getelementptr inbounds i8, ptr %1, i64 52
  store i8 1, ptr %3, align 1, !tbaa !5
  %4 = getelementptr inbounds i8, ptr %1, i64 103
  store i8 1, ptr %4, align 1, !tbaa !5
  %5 = getelementptr inbounds i8, ptr %1, i64 104
  store i8 1, ptr %5, align 1, !tbaa !5
  %6 = getelementptr inbounds i8, ptr %1, i64 152
  store i8 1, ptr %6, align 1, !tbaa !5
  %7 = getelementptr inbounds i8, ptr %1, i64 153
  store i8 1, ptr %7, align 1, !tbaa !5
  call void @llvm.lifetime.start.p0(i64 1250, ptr nonnull %2) #4
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 1 dereferenceable(1250) %2, i8 0, i64 1250, i1 false)
  br label %8

8:                                                ; preds = %0, %47
  %9 = phi i32 [ 0, %0 ], [ %48, %47 ]
  %10 = phi ptr [ %2, %0 ], [ %11, %47 ]
  %11 = phi ptr [ %1, %0 ], [ %10, %47 ]
  br label %13

12:                                               ; preds = %47
  call void @llvm.lifetime.end.p0(i64 1250, ptr nonnull %2) #4
  call void @llvm.lifetime.end.p0(i64 1250, ptr nonnull %1) #4
  ret void

13:                                               ; preds = %8, %50
  %14 = phi i64 [ 0, %8 ], [ %51, %50 ]
  %15 = mul nuw nsw i64 %14, 50
  %16 = trunc nuw nsw i64 %14 to i32
  br label %53

17:                                               ; preds = %50
  call void @simFlush()
  br label %18

18:                                               ; preds = %22, %17
  %19 = phi i64 [ 0, %17 ], [ %23, %22 ]
  %20 = mul nuw nsw i64 %19, 50
  %21 = trunc nuw nsw i64 %19 to i32
  br label %25

22:                                               ; preds = %44
  %23 = add nuw nsw i64 %19, 1
  %24 = icmp eq i64 %23, 25
  br i1 %24, label %47, label %18, !llvm.loop !8

25:                                               ; preds = %44, %18
  %26 = phi i64 [ 0, %18 ], [ %45, %44 ]
  %27 = trunc nuw nsw i64 %26 to i32
  %28 = call i32 @neighbors(ptr noundef %11, i32 noundef %27, i32 noundef %21)
  %29 = add nuw nsw i64 %26, %20
  %30 = getelementptr inbounds i8, ptr %11, i64 %29
  %31 = load i8, ptr %30, align 1, !tbaa !5
  %32 = icmp eq i8 %31, 0
  br i1 %32, label %39, label %33

33:                                               ; preds = %25
  %34 = and i32 %28, -2
  %35 = icmp eq i32 %34, 2
  %36 = getelementptr inbounds i8, ptr %10, i64 %29
  br i1 %35, label %37, label %38

37:                                               ; preds = %33
  store i8 1, ptr %36, align 1, !tbaa !5
  br label %44

38:                                               ; preds = %33
  store i8 0, ptr %36, align 1, !tbaa !5
  br label %44

39:                                               ; preds = %25
  %40 = icmp eq i32 %28, 3
  %41 = getelementptr inbounds i8, ptr %10, i64 %29
  br i1 %40, label %42, label %43

42:                                               ; preds = %39
  store i8 1, ptr %41, align 1, !tbaa !5
  br label %44

43:                                               ; preds = %39
  store i8 0, ptr %41, align 1, !tbaa !5
  br label %44

44:                                               ; preds = %43, %42, %38, %37
  %45 = add nuw nsw i64 %26, 1
  %46 = icmp eq i64 %45, 50
  br i1 %46, label %22, label %25, !llvm.loop !11

47:                                               ; preds = %22
  %48 = add nuw nsw i32 %9, 1
  %49 = icmp eq i32 %48, 1000
  br i1 %49, label %12, label %8, !llvm.loop !12

50:                                               ; preds = %53
  %51 = add nuw nsw i64 %14, 1
  %52 = icmp eq i64 %51, 25
  br i1 %52, label %17, label %13, !llvm.loop !13

53:                                               ; preds = %13, %53
  %54 = phi i64 [ 0, %13 ], [ %61, %53 ]
  %55 = add nuw nsw i64 %54, %15
  %56 = getelementptr inbounds i8, ptr %11, i64 %55
  %57 = load i8, ptr %56, align 1, !tbaa !5
  %58 = icmp eq i8 %57, 0
  %59 = trunc nuw nsw i64 %54 to i32
  %60 = select i1 %58, i32 -1, i32 -16777216
  call void @simPutDisplayPixel(i32 noundef %59, i32 noundef %16, i32 noundef %60, i32 noundef 40)
  %61 = add nuw nsw i64 %54, 1
  %62 = icmp eq i64 %61, 50
  br i1 %62, label %50, label %53, !llvm.loop !14
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #2

declare void @simPutDisplayPixel(i32 noundef, i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

declare void @simFlush() local_unnamed_addr #3

declare i32 @neighbors(ptr noundef, i32 noundef, i32 noundef) local_unnamed_addr #3

attributes #0 = { mustprogress ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #3 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #4 = { nounwind }

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
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.mustprogress"}
!10 = !{!"llvm.loop.unroll.disable"}
!11 = distinct !{!11, !9, !10}
!12 = distinct !{!12, !9, !10}
!13 = distinct !{!13, !9, !10}
!14 = distinct !{!14, !9, !10}

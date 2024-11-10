; ModuleID = 'app.cpp'
source_filename = "app.cpp"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx14.0.0"

; Function Attrs: mustprogress ssp uwtable(sync)
define void @_Z3appv() local_unnamed_addr #0 {

    ALLOCA X1
  %1 = alloca [1250 x i8], align 1


    ALLOCA X2
  %2 = alloca [1250 x i8], align 1


    LIFETIME_START X1
  call void @llvm.lifetime.start.p0(i64 1250, ptr nonnull %1) #4
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 1 dereferenceable(1250) %1, i8 0, i64 1250, i1 false)
  
    GEP_STORE X1 52 1
  %3 = getelementptr inbounds i8, ptr %1, i64 52
  store i8 1, ptr %3, align 1, !tbaa !5

    GEP_STORE X1 103 1
  %4 = getelementptr inbounds i8, ptr %1, i64 103
  store i8 1, ptr %4, align 1, !tbaa !5

    GEP_STORE X1 104 1
  %5 = getelementptr inbounds i8, ptr %1, i64 104
  store i8 1, ptr %5, align 1, !tbaa !5

    GEP_STORE X1 152 1
  %6 = getelementptr inbounds i8, ptr %1, i64 152
  store i8 1, ptr %6, align 1, !tbaa !5

    GEP_STORE X1 153 1
  %7 = getelementptr inbounds i8, ptr %1, i64 153
  store i8 1, ptr %7, align 1, !tbaa !5

    LIFETIME_START X2
  call void @llvm.lifetime.start.p0(i64 1250, ptr nonnull %2) #4
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 1 dereferenceable(1250) %2, i8 0, i64 1250, i1 false)
  

    XOR X3 X3 X3
    SWAP X1 X2

    BR label_8
  br label %8

8:                                                ; preds = %0, %47

    X3
  %9 = phi i32 [ 0, %0 ], [ %48, %47 ]

    X2
  %10 = phi ptr [ %2, %0 ], [ %11, %47 ]

    X1
  %11 = phi ptr [ %1, %0 ], [ %10, %47 ]

    SWAP X1 X2


    XOR X4 X4 X4

    BR label_13
  br label %13

12:                                               ; preds = %47
    FREE X2
  call void @llvm.lifetime.end.p0(i64 1250, ptr nonnull %2) #4

    FREE X1
  call void @llvm.lifetime.end.p0(i64 1250, ptr nonnull %1) #4

    EXIT
  ret void

13:                                               ; preds = %8, %50
    X4
  %14 = phi i64 [ 0, %8 ], [ %51, %50 ]

    MUL X5 X4 50
  %15 = mul nuw nsw i64 %14, 50

    TRUNC X6 X4
  %16 = trunc nuw nsw i64 %14 to i32


    XOR X22 X22 X22
    BR label_53
  br label %53

17:                                               ; preds = %50

    SIM_FLUSH
  call void @simFlush()

    XOR X7 X7 X7
    BR label_18
  br label %18

18:                                               ; preds = %22, %17

    X7
  %19 = phi i64 [ 0, %17 ], [ %23, %22 ]

    MUL X8 X7 50 
  %20 = mul nuw nsw i64 %19, 50

    TRUNC X9 X7
  %21 = trunc nuw nsw i64 %19 to i32


    XOR X10 X10 X10
    BR label_25
  br label %25

22:                                               ; preds = %44
    ADD_IMM X7 X7 1
  %23 = add nuw nsw i64 %19, 1

    EQ_BR_IMM X7 25 label_47 label_18
  %24 = icmp eq i64 %23, 25
  br i1 %24, label %47, label %18, !llvm.loop !8

25:                                               ; preds = %44, %18
    X10
  %26 = phi i64 [ 0, %18 ], [ %45, %44 ]

    TRUNC X11 X10 
  %27 = trunc nuw nsw i64 %26 to i32

    X12 = NEIGHBORS X1 X11 X9
  %28 = call i32 @neighbors(ptr noundef %11, i32 noundef %27, i32 noundef %21)

    ADD X13 X10 X8
  %29 = add nuw nsw i64 %26, %20

    GEP_LOAD X14 X1 X13 
  %30 = getelementptr inbounds i8, ptr %11, i64 %29
  %31 = load i8, ptr %30, align 1, !tbaa !5

    EQ_BR_IMM X14 0 label_39 label_33
  %32 = icmp eq i8 %31, 0
  br i1 %32, label %39, label %33

33:                                               ; preds = %25
    AND X16 X12 -3
  %34 = and i32 %28, -2

    ICMP_EQ X17 X16 2
  %35 = icmp eq i32 %34, 2

    GEP X18 X2 X13
  %36 = getelementptr inbounds i8, ptr %10, i64 %29

    BR_IF X17 label_37 label_38
  br i1 %35, label %37, label %38

37:                                               ; preds = %33

    STORE X18 1
  store i8 1, ptr %36, align 1, !tbaa !5

    BR label_44
  br label %44

38:                                               ; preds = %33

    STORE X18 0
  store i8 0, ptr %36, align 1, !tbaa !5

    BR label_44
  br label %44

39:                                               ; preds = %25

    ICMP_EQ X19 X12 3
  %40 = icmp eq i32 %28, 3

    GEP X20 X2 X13
  %41 = getelementptr inbounds i8, ptr %10, i64 %29

    BR_IF X19 label_42 label_43
  br i1 %40, label %42, label %43

42:                                               ; preds = %39

    STORE X20 1
  store i8 1, ptr %41, align 1, !tbaa !5

    BR label_44
  br label %44

43:                                               ; preds = %39

    STORE X20 0
  store i8 0, ptr %41, align 1, !tbaa !5

    BR label_44
  br label %44

44:                                               ; preds = %43, %42, %38, %37

    ADD_IMM X10 X10 1
  %45 = add nuw nsw i64 %26, 1

    EQ_BR_IMM X10 50 label_22 label_25
  %46 = icmp eq i64 %45, 50
  br i1 %46, label %22, label %25, !llvm.loop !11

47:                                               ; preds = %22

    ADD_IMM X3 X3 1
  %48 = add nuw nsw i32 %9, 1

    EQ_BR_IMM X3 1000 label_12 label_8
  %49 = icmp eq i32 %48, 1000
  br i1 %49, label %12, label %8, !llvm.loop !12

50:                                               ; preds = %53
    ADD_IMM X4 X4 1
  %51 = add nuw nsw i64 %14, 1

    EQ_BR_IMM X4 25 label_17 label_13
  %52 = icmp eq i64 %51, 25
  br i1 %52, label %17, label %13, !llvm.loop !13

53:                                               ; preds = %13, %53
    X22
  %54 = phi i64 [ 0, %13 ], [ %61, %53 ]

    ADD X23 X22 X5
  %55 = add nuw nsw i64 %54, %15

    GEP_LOAD X24 X1 X23
  %56 = getelementptr inbounds i8, ptr %11, i64 %55
  %57 = load i8, ptr %56, align 1, !tbaa !5

    ICMP_EQ_IMM X25 X24 0
  %58 = icmp eq i8 %57, 0

    TRUNC X26 X22
  %59 = trunc nuw nsw i64 %54 to i32

    SELECT X27 X25 -1 -16777216
  %60 = select i1 %58, i32 -1, i32 -16777216

    SIM_PUT_DISPLAY_PIXEL X26 X6 X27 40
  call void @simPutDisplayPixel(i32 noundef %59, i32 noundef %16, i32 noundef %60, i32 noundef 40)
  
    ADD_IMM X22 X22 1
  %61 = add nuw nsw i64 %54, 1

  EQ_BR_IMM X22 50 label_50 label_53
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

#include "../SDL/sim.hpp"
#include "llvm/ExecutionEngine/ExecutionEngine.h"
#include "llvm/ExecutionEngine/GenericValue.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/TargetSelect.h"
#include "llvm/Support/raw_ostream.h"
using namespace llvm;

int main() {
    LLVMContext context;
    Module *module = new Module("app.cpp", context);
    IRBuilder<> builder(context);

    ArrayRef<Type *> neighborsTypes = {builder.getPtrTy(), Type::getInt32Ty(context),
                                       Type::getInt32Ty(context)};
    FunctionType *neighborsFuncType =
        FunctionType::get(builder.getInt32Ty(), neighborsTypes, false);
    Function *neighborsFunc =
        Function::Create(neighborsFuncType, Function::ExternalLinkage, "neighbors", module);

    // BasicBlocks:
    BasicBlock *neighbors_BB3 = BasicBlock::Create(context, "", neighborsFunc);
    BasicBlock *neighbors_BB6 = BasicBlock::Create(context, "", neighborsFunc);
    BasicBlock *neighbors_BB7 = BasicBlock::Create(context, "", neighborsFunc);
    BasicBlock *neighbors_BB18 = BasicBlock::Create(context, "", neighborsFunc);
    BasicBlock *neighbors_BB21 = BasicBlock::Create(context, "", neighborsFunc);
    BasicBlock *neighbors_BB26 = BasicBlock::Create(context, "", neighborsFunc);
    BasicBlock *neighbors_BB39 = BasicBlock::Create(context, "", neighborsFunc);

    // Neighbours arguments
    Value *nval0 = neighborsFunc->getArg(0);
    Value *nval1 = neighborsFunc->getArg(1);
    Value *nval2 = neighborsFunc->getArg(2);

    builder.SetInsertPoint(neighbors_BB39);
    PHINode *nval40 = builder.CreatePHI(builder.getInt32Ty(), 2);

    // 0:
    builder.SetInsertPoint(neighbors_BB3);
    //   %4 = add nsw i32 %2, -1
    Value *nval4 = builder.CreateNSWAdd(nval2, builder.getInt32(-1));
    //   %5 = add nsw i32 %1, -1
    Value *nval5 = builder.CreateNSWAdd(nval1, builder.getInt32(-1));
    //   br label %7
    builder.CreateBr(neighbors_BB7);
    // 6:                                                ; preds = %18
    builder.SetInsertPoint(neighbors_BB6);
    //   ret i32 %40
    builder.CreateRet(nval40);
    // 7:                                                ; preds = %3, %18
    builder.SetInsertPoint(neighbors_BB7);
    //   %8 = phi i32 [ %4, %3 ], [ %19, %18 ]
    PHINode *nval8 = builder.CreatePHI(builder.getInt32Ty(), 2);
    //   %9 = phi i32 [ 0, %3 ], [ %40, %18 ]
    PHINode *nval9 = builder.CreatePHI(builder.getInt32Ty(), 2);
    //   %10 = icmp eq i32 %8, %2
    Value *nval10 = builder.CreateICmpEQ(nval8, nval2);
    //   %11 = icmp slt i32 %8, 0
    Value *nval11 = builder.CreateICmpSLT(nval8, builder.getInt32(0));
    //   %12 = add nsw i32 %8, 25
    Value *nval12 = builder.CreateNSWAdd(nval8, builder.getInt32(25));
    //   %13 = icmp sgt i32 %8, 24
    Value *nval13 = builder.CreateICmpSGT(nval8, builder.getInt32(24));
    //   %14 = add nsw i32 %8, -25
    Value *nval14 = builder.CreateNSWAdd(nval8, builder.getInt32(-25));
    //   %15 = select i1 %13, i32 %14, i32 %8
    Value *nval15 = builder.CreateSelect(nval13, nval14, nval8);
    //   %16 = select i1 %11, i32 %12, i32 %15
    Value *nval16 = builder.CreateSelect(nval11, nval12, nval15);
    //   %17 = mul nsw i32 %16, 50
    Value *nval17 = builder.CreateNSWMul(nval16, builder.getInt32(50));
    //   br label %21
    builder.CreateBr(neighbors_BB21);

    // 18:                                               ; preds = %39
    builder.SetInsertPoint(neighbors_BB18);
    //   %19 = add nsw i32 %8, 1
    Value *nval19 = builder.CreateNSWAdd(nval8, builder.getInt32(1));
    //   %20 = icmp sgt i32 %8, %2
    Value *nval20 = builder.CreateICmpSGT(nval8, nval2);
    //   br i1 %20, label %6, label %7, !llvm.loop !5
    builder.CreateCondBr(nval20, neighbors_BB6, neighbors_BB7);

    // 21:                                               ; preds = %7, %39
    builder.SetInsertPoint(neighbors_BB21);
    //   %22 = phi i32 [ %5, %7 ], [ %41, %39 ]
    PHINode *nval22 = builder.CreatePHI(builder.getInt32Ty(), 2);
    //   %23 = phi i32 [ %9, %7 ], [ %40, %39 ]
    PHINode *nval23 = builder.CreatePHI(builder.getInt32Ty(), 2);
    //   %24 = icmp eq i32 %22, %1
    Value *nval24 = builder.CreateICmpEQ(nval22, nval1);
    //   %25 = and i1 %10, %24
    Value *nval25 = builder.CreateAnd(nval10, nval24);
    //   br i1 %25, label %39, label %26
    builder.CreateCondBr(nval25, neighbors_BB39, neighbors_BB26);

    // 26:                                               ; preds = %21
    builder.SetInsertPoint(neighbors_BB26);
    //   %27 = icmp slt i32 %22, 0
    Value *nval27 = builder.CreateICmpSLT(nval22, builder.getInt32(0));
    //   %28 = add nsw i32 %22, 50
    Value *nval28 = builder.CreateNSWAdd(nval22, builder.getInt32(50));
    //   %29 = icmp sgt i32 %22, 49
    Value *nval29 = builder.CreateICmpSGT(nval22, builder.getInt32(49));
    //   %30 = add nsw i32 %22, -50
    Value *nval30 = builder.CreateNSWAdd(nval22, builder.getInt32(-50));
    //   %31 = select i1 %29, i32 %30, i32 %22
    Value *nval31 = builder.CreateSelect(nval29, nval30, nval22);
    //   %32 = select i1 %27, i32 %28, i32 %31
    Value *nval32 = builder.CreateSelect(nval27, nval28, nval31);
    //   %33 = add nsw i32 %32, %17
    Value *nval33 = builder.CreateNSWAdd(nval32, nval17);
    //   %34 = sext i32 %33 to i64
    Value *nval34 = builder.CreateSExt(nval33, builder.getInt64Ty());
    //   %35 = getelementptr inbounds i8, ptr %0, i64 %34
    Value *nval35 = builder.CreateGEP(builder.getInt8Ty(), nval0, nval34);
    //   %36 = load i8, ptr %35, align 1, !tbaa !8
    Value *nval36 = builder.CreateLoad(builder.getInt8Ty(), nval35);
    //   %37 = sext i8 %36 to i32
    Value *nval37 = builder.CreateSExt(nval36, builder.getInt32Ty());
    //   %38 = add nsw i32 %23, %37
    Value *nval38 = builder.CreateNSWAdd(nval23, nval37);
    //   br label %39
    builder.CreateBr(neighbors_BB39);

    // 39:                                               ; preds = %21, %26
    builder.SetInsertPoint(neighbors_BB39);
    //   %40 = phi i32 [ %38, %26 ], [ %23, %21 ] // has already created
    //   %41 = add nsw i32 %22, 1
    Value *nval41 = builder.CreateNSWAdd(nval22, builder.getInt32(1));
    //   %42 = icmp sgt i32 %22, %1
    Value *nval42 = builder.CreateICmpSGT(nval22, nval1);
    //   br i1 %42, label %18, label %21, !llvm.loop !11
    builder.CreateCondBr(nval42, neighbors_BB18, neighbors_BB21);
    // }

    //   Link PHINodes
    //   %8 = phi i32 [ %4, %3 ], [ %19, %18 ]
    nval8->addIncoming(nval4, neighbors_BB3);
    nval8->addIncoming(nval19, neighbors_BB18);
    //   %9 = phi i32 [ 0, %3 ], [ %40, %18 ]
    nval9->addIncoming(builder.getInt32(0), neighbors_BB3);
    nval9->addIncoming(nval40, neighbors_BB18);
    //   %22 = phi i32 [ %5, %7 ], [ %41, %39 ]
    nval22->addIncoming(nval5, neighbors_BB7);
    nval22->addIncoming(nval41, neighbors_BB39);
    //   %23 = phi i32 [ %9, %7 ], [ %40, %39 ]
    nval23->addIncoming(nval9, neighbors_BB7);
    nval23->addIncoming(nval40, neighbors_BB39);
    //   %40 = phi i32 [ %38, %26 ], [ %23, %21 ]
    nval40->addIncoming(nval38, neighbors_BB26);
    nval40->addIncoming(nval23, neighbors_BB21);

    Type *voidType = Type::getVoidTy(context);

    // declare void @simFlush() local_unnamed_addr #6
    FunctionType *simFlushType = FunctionType::get(voidType, {voidType}, false);
    FunctionCallee simFlushFunc = module->getOrInsertFunction("simFlush", simFlushType);

    // declare void @simPutDisplayPixel(i32 noundef, i32 noundef, i32 noundef, i32 noundef)
    // local_unnamed_addr #6
    FunctionType *simPutDisplayPixelType =
        FunctionType::get(voidType,
                          {Type::getInt32Ty(context), Type::getInt32Ty(context),
                           Type::getInt32Ty(context), Type::getInt32Ty(context)},
                          false);
    FunctionCallee simPutDisplayPixelFunc =
        module->getOrInsertFunction("simPutDisplayPixel", simPutDisplayPixelType);

    // ; Function Attrs: mustprogress nofree norecurse nosync nounwind ssp willreturn memory(argmem:
    // readwrite) uwtable(sync) define void @_Z4swapPPcS0_(ptr nocapture noundef %0, ptr nocapture
    // noundef %1) local_unnamed_addr #2 {
    ArrayRef<Type *> swapTypes = {builder.getPtrTy(), builder.getPtrTy()};
    FunctionType *swapFuncType = FunctionType::get(voidType, swapTypes, false);
    Function *swapFunc = Function::Create(swapFuncType, Function::ExternalLinkage, "swap", module);

    Value *swap_val0 = swapFunc->getArg(0);
    Value *swap_val1 = swapFunc->getArg(1);

    // BasicBlocks:
    BasicBlock *swap_BB2 = BasicBlock::Create(context, "", swapFunc);

    builder.SetInsertPoint(swap_BB2);
    // %3 = load ptr, ptr %0, align 8, !tbaa !12
    Value *swap_val3 = builder.CreateLoad(builder.getPtrTy(), swap_val0);
    //   %4 = load ptr, ptr %1, align 8, !tbaa !12
    Value *swap_val4 = builder.CreateLoad(builder.getPtrTy(), swap_val1);
    //   store ptr %4, ptr %0, align 8, !tbaa !12
    builder.CreateStore(swap_val4, swap_val0);
    //   store ptr %3, ptr %1, align 8, !tbaa !12
    builder.CreateStore(swap_val3, swap_val1);
    //   ret void
    builder.CreateRetVoid();
    // }

    // ; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem:
    // readwrite) declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1
    ArrayRef<Type *> llvm_lifetime_start_types = {Type::getInt64Ty(context), builder.getPtrTy()};
    FunctionType *llvm_lifetime_start_func_type =
        FunctionType::get(voidType, llvm_lifetime_start_types, false);
    Function *llvm_lifetime_start_func = Function::Create(
        llvm_lifetime_start_func_type, Function::ExternalLinkage, "llvm.lifetime.start.p0", module);

    //     ; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
    //     memory(argmem: readwrite)
    //      declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1
    ArrayRef<Type *> llvm_lifetime_end_types = {Type::getInt64Ty(context), builder.getPtrTy()};
    FunctionType *llvm_lifetime_end_func_type =
        FunctionType::get(voidType, llvm_lifetime_end_types, false);
    Function *llvm_lifetime_end_func = Function::Create(
        llvm_lifetime_end_func_type, Function::ExternalLinkage, "llvm.lifetime.end.p0", module);

    // ; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
    // declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #5
    ArrayRef<Type *> llvm_memset_p0_i64_types = {builder.getPtrTy(), Type::getInt8Ty(context),
                                                 Type::getInt64Ty(context),
                                                 Type::getInt1Ty(context)};
    FunctionType *llvm_memset_p0_i64_func_type =
        FunctionType::get(voidType, llvm_memset_p0_i64_types, false);
    Function *llvm_memset_p0_i64_func = Function::Create(
        llvm_memset_p0_i64_func_type, Function::ExternalLinkage, "llvm.memset.p0.i64", module);

    ArrayRef<Type *> stepTypes = {builder.getPtrTy(), builder.getPtrTy()};
    FunctionType *stepFuncType = FunctionType::get(voidType, stepTypes, false);
    Function *stepFunc = Function::Create(stepFuncType, Function::ExternalLinkage, "step", module);
    // define void @_Z4stepPcS_(ptr nocapture noundef readonly %0, ptr nocapture noundef writeonly
    // %1) local_unnamed_addr #3 {

    // BasicBlocks:
    BasicBlock *step_BB2 = BasicBlock::Create(context, "", stepFunc);
    BasicBlock *step_BB3 = BasicBlock::Create(context, "", stepFunc);
    BasicBlock *step_BB9 = BasicBlock::Create(context, "", stepFunc);
    BasicBlock *step_BB10 = BasicBlock::Create(context, "", stepFunc);
    BasicBlock *step_BB14 = BasicBlock::Create(context, "", stepFunc);
    BasicBlock *step_BB19 = BasicBlock::Create(context, "", stepFunc);
    BasicBlock *step_BB31 = BasicBlock::Create(context, "", stepFunc);
    BasicBlock *step_BB34 = BasicBlock::Create(context, "", stepFunc);
    BasicBlock *step_BB40 = BasicBlock::Create(context, "", stepFunc);
    BasicBlock *step_BB53 = BasicBlock::Create(context, "", stepFunc);
    BasicBlock *step_BB57 = BasicBlock::Create(context, "", stepFunc);
    BasicBlock *step_BB62 = BasicBlock::Create(context, "", stepFunc);
    BasicBlock *step_BB66 = BasicBlock::Create(context, "", stepFunc);
    BasicBlock *step_BB67 = BasicBlock::Create(context, "", stepFunc);
    BasicBlock *step_BB68 = BasicBlock::Create(context, "", stepFunc);
    BasicBlock *step_BB71 = BasicBlock::Create(context, "", stepFunc);
    BasicBlock *step_BB72 = BasicBlock::Create(context, "", stepFunc);
    BasicBlock *step_BB73 = BasicBlock::Create(context, "", stepFunc);

    // Neighbours arguments
    Value *sval0 = stepFunc->getArg(0);
    Value *sval1 = stepFunc->getArg(1);

    builder.SetInsertPoint(step_BB2);
    //   br label %3
    builder.CreateBr(step_BB3);
    // 3:                                                ; preds = %2, %10
    builder.SetInsertPoint(step_BB3);
    //   %4 = phi i64 [ 0, %2 ], [ %11, %10 ]
    PHINode *sval4 = builder.CreatePHI(builder.getInt64Ty(), 2);
    //   %5 = phi i32 [ 2, %2 ], [ %12, %10 ]
    PHINode *sval5 = builder.CreatePHI(builder.getInt32Ty(), 2);
    //   %6 = mul nuw nsw i64 %4, 50
    Value *sval6 = builder.CreateMul(sval4, builder.getInt64(50), "", true, true);
    //   %7 = trunc i64 %4 to i32
    Value *sval7 = builder.CreateTrunc(sval4, builder.getInt32Ty());
    //   %8 = add i32 %7, -1
    Value *sval8 = builder.CreateAdd(sval7, builder.getInt32(-1));
    //   br label %14
    builder.CreateBr(step_BB14);

    // 9:                                                ; preds = %10
    builder.SetInsertPoint(step_BB9);
    //   ret void
    builder.CreateRetVoid();

    // 10:                                               ; preds = %73
    builder.SetInsertPoint(step_BB10);
    //   %11 = add nuw nsw i64 %4, 1
    Value *sval11 = builder.CreateAdd(sval4, builder.getInt64(1), "", true, true);
    //   %12 = add nuw nsw i32 %5, 1
    Value *sval12 = builder.CreateAdd(sval5, builder.getInt32(1), "", true, true);
    //   %13 = icmp eq i64 %11, 25
    Value *sval13 = builder.CreateICmpEQ(sval11, builder.getInt64(25));
    //   br i1 %13, label %9, label %3, !llvm.loop !14
    builder.CreateCondBr(sval13, step_BB9, step_BB3);

    // 14:                                               ; preds = %3, %73
    builder.SetInsertPoint(step_BB14);
    //   %15 = phi i64 [ 0, %3 ], [ %74, %73 ]
    PHINode *sval15 = builder.CreatePHI(builder.getInt64Ty(), 2);
    //   %16 = phi i32 [ 2, %3 ], [ %75, %73 ]
    PHINode *sval16 = builder.CreatePHI(builder.getInt32Ty(), 2);
    //   %17 = trunc i64 %15 to i32
    Value *sval17 = builder.CreateTrunc(sval15, builder.getInt32Ty());
    //   %18 = add i32 %17, -1
    Value *sval18 = builder.CreateAdd(sval17, builder.getInt32(-1));
    //   br label %19
    builder.CreateBr(step_BB19);

    // 19:                                               ; preds = %31, %14
    builder.SetInsertPoint(step_BB19);
    //   %20 = phi i32 [ %8, %14 ], [ %32, %31 ]
    PHINode *sval20 = builder.CreatePHI(builder.getInt32Ty(), 2);
    //   %21 = phi i32 [ 0, %14 ], [ %54, %31 ]
    PHINode *sval21 = builder.CreatePHI(builder.getInt32Ty(), 2);
    //   %22 = zext i32 %20 to i64
    Value *sval22 = builder.CreateZExt(sval20, builder.getInt64Ty());
    //   %23 = icmp eq i64 %4, %22
    Value *sval23 = builder.CreateICmpEQ(sval4, sval22);
    //   %24 = icmp slt i32 %20, 0
    Value *sval24 = builder.CreateICmpSLT(sval20, builder.getInt32(0));
    //   %25 = add nsw i32 %20, 25
    Value *sval25 = builder.CreateNSWAdd(sval20, builder.getInt32(25));
    //   %26 = icmp sgt i32 %20, 24
    Value *sval26 = builder.CreateICmpSGT(sval20, builder.getInt32(24));
    //   %27 = add nsw i32 %20, -25
    Value *sval27 = builder.CreateNSWAdd(sval20, builder.getInt32(-25));
    //   %28 = select i1 %26, i32 %27, i32 %20
    Value *sval28 = builder.CreateSelect(sval26, sval27, sval20);
    //   %29 = select i1 %24, i32 %25, i32 %28
    Value *sval29 = builder.CreateSelect(sval24, sval25, sval28);
    //   %30 = mul nsw i32 %29, 50
    Value *sval30 = builder.CreateNSWMul(sval29, builder.getInt32(50));
    //   br label %34
    builder.CreateBr(step_BB34);

    // 31:                                               ; preds = %53
    builder.SetInsertPoint(step_BB31);
    //   %32 = add nsw i32 %20, 1
    Value *sval32 = builder.CreateNSWAdd(sval20, builder.getInt32(1));
    //   %33 = icmp eq i32 %32, %5
    Value *sval33 = builder.CreateICmpEQ(sval32, sval5);
    //   br i1 %33, label %57, label %19, !llvm.loop !5
    builder.CreateCondBr(sval33, step_BB57, step_BB19);

    // 34:                                               ; preds = %53, %19
    builder.SetInsertPoint(step_BB34);
    //   %35 = phi i32 [ %18, %19 ], [ %55, %53 ]
    PHINode *sval35 = builder.CreatePHI(builder.getInt32Ty(), 2);
    //   %36 = phi i32 [ %21, %19 ], [ %54, %53 ]
    PHINode *sval36 = builder.CreatePHI(builder.getInt32Ty(), 2);
    //   %37 = zext i32 %35 to i64
    Value *sval37 = builder.CreateZExt(sval35, builder.getInt64Ty());
    //   %38 = icmp eq i64 %15, %37
    Value *sval38 = builder.CreateICmpEQ(sval15, sval37);
    //   %39 = and i1 %23, %38
    Value *sval39 = builder.CreateAnd(sval23, sval38);
    //   br i1 %39, label %53, label %40
    builder.CreateCondBr(sval39, step_BB53, step_BB40);

    // 40:                                               ; preds = %34
    builder.SetInsertPoint(step_BB40);
    //   %41 = icmp slt i32 %35, 0
    Value *sval41 = builder.CreateICmpSLT(sval35, builder.getInt32(0));
    //   %42 = add nsw i32 %35, 50
    Value *sval42 = builder.CreateNSWAdd(sval35, builder.getInt32(50));
    //   %43 = icmp sgt i32 %35, 49
    Value *sval43 = builder.CreateICmpSGT(sval35, builder.getInt32(49));
    //   %44 = add nsw i32 %35, -50
    Value *sval44 = builder.CreateNSWAdd(sval35, builder.getInt32(-50));
    //   %45 = select i1 %43, i32 %44, i32 %35
    Value *sval45 = builder.CreateSelect(sval43, sval44, sval35);
    //   %46 = select i1 %41, i32 %42, i32 %45
    Value *sval46 = builder.CreateSelect(sval41, sval42, sval45);
    //   %47 = add nsw i32 %46, %30
    Value *sval47 = builder.CreateNSWAdd(sval46, sval30);
    //   %48 = sext i32 %47 to i64
    Value *sval48 = builder.CreateSExt(sval47, builder.getInt64Ty());
    //   %49 = getelementptr inbounds i8, ptr %0, i64 %48
    Value *sval49 = builder.CreateGEP(builder.getInt8Ty(), sval0, sval48);
    //   %50 = load i8, ptr %49, align 1, !tbaa !8
    Value *sval50 = builder.CreateLoad(builder.getInt8Ty(), sval49);
    //   %51 = sext i8 %50 to i32
    Value *sval51 = builder.CreateSExt(sval50, builder.getInt32Ty());
    //   %52 = add nsw i32 %36, %51
    Value *sval52 = builder.CreateNSWAdd(sval36, sval51);
    //   br label %53
    builder.CreateBr(step_BB53);

    // 53:                                               ; preds = %40, %34
    builder.SetInsertPoint(step_BB53);
    //   %54 = phi i32 [ %52, %40 ], [ %36, %34 ]
    PHINode *sval54 = builder.CreatePHI(builder.getInt32Ty(), 2);
    //   %55 = add nsw i32 %35, 1
    Value *sval55 = builder.CreateNSWAdd(sval35, builder.getInt32(1));
    //   %56 = icmp eq i32 %55, %16
    Value *sval56 = builder.CreateICmpEQ(sval55, sval16);
    //   br i1 %56, label %31, label %34, !llvm.loop !11
    builder.CreateCondBr(sval56, step_BB31, step_BB34);

    // 57:                                               ; preds = %31
    builder.SetInsertPoint(step_BB57);
    //   %58 = add nuw nsw i64 %15, %6
    Value *sval58 = builder.CreateAdd(sval15, sval6, "", true, true);
    //   %59 = getelementptr inbounds i8, ptr %0, i64 %58
    Value *sval59 = builder.CreateGEP(builder.getInt8Ty(), sval0, sval58);
    //   %60 = load i8, ptr %59, align 1, !tbaa !8
    Value *sval60 = builder.CreateLoad(builder.getInt8Ty(), sval59);
    //   %61 = icmp eq i8 %60, 0
    Value *sval61 = builder.CreateICmpEQ(sval60, builder.getInt8(0));
    //   br i1 %61, label %68, label %62
    builder.CreateCondBr(sval61, step_BB68, step_BB62);

    // 62:                                               ; preds = %57
    builder.SetInsertPoint(step_BB62);
    //   %63 = and i32 %54, -2
    Value *sval63 = builder.CreateAnd(sval54, builder.getInt32(-2));
    //   %64 = icmp eq i32 %63, 2
    Value *sval64 = builder.CreateICmpEQ(sval63, builder.getInt32(2));
    //   %65 = getelementptr inbounds i8, ptr %1, i64 %58
    Value *sval65 = builder.CreateGEP(builder.getInt8Ty(), sval1, sval58);
    //   br i1 %64, label %66, label %67
    builder.CreateCondBr(sval64, step_BB66, step_BB67);

    // 66:                                               ; preds = %62
    builder.SetInsertPoint(step_BB66);
    //   store i8 1, ptr %65, align 1, !tbaa !8
    builder.CreateStore(builder.getInt8(1), sval65);
    //   br label %73
    builder.CreateBr(step_BB73);

    // 67:                                               ; preds = %62
    builder.SetInsertPoint(step_BB67);
    //   store i8 0, ptr %65, align 1, !tbaa !8
    builder.CreateStore(builder.getInt8(0), sval65);
    //   br label %73
    builder.CreateBr(step_BB73);

    // 68:                                               ; preds = %57
    builder.SetInsertPoint(step_BB68);
    //   %69 = icmp eq i32 %54, 3
    Value *sval69 = builder.CreateICmpEQ(sval54, builder.getInt32(3));
    //   %70 = getelementptr inbounds i8, ptr %1, i64 %58
    Value *sval70 = builder.CreateGEP(builder.getInt8Ty(), sval1, sval58);
    //   br i1 %69, label %71, label %72
    builder.CreateCondBr(sval69, step_BB71, step_BB72);

    // 71:                                               ; preds = %68
    builder.SetInsertPoint(step_BB71);
    //   store i8 1, ptr %70, align 1, !tbaa !8
    builder.CreateStore(builder.getInt8(1), sval70);
    //   br label %73
    builder.CreateBr(step_BB73);

    // 72:                                               ; preds = %68
    builder.SetInsertPoint(step_BB72);
    //   store i8 0, ptr %70, align 1, !tbaa !8
    builder.CreateStore(builder.getInt8(0), sval70);
    //   br label %73
    builder.CreateBr(step_BB73);

    // 73:                                               ; preds = %67, %66, %72, %71
    builder.SetInsertPoint(step_BB73);
    //   %74 = add nuw nsw i64 %15, 1
    Value *sval74 = builder.CreateAdd(sval15, builder.getInt64(1), "", true, true);
    //   %75 = add nuw nsw i32 %16, 1
    Value *sval75 = builder.CreateAdd(sval16, builder.getInt32(1), "", true, true);
    //   %76 = icmp eq i64 %74, 50
    Value *sval76 = builder.CreateICmpEQ(sval74, builder.getInt64(50));
    //   br i1 %76, label %10, label %14, !llvm.loop !15
    builder.CreateCondBr(sval76, step_BB10, step_BB14);
    // }

    //   Link PHINodes
    //   %4 = phi i64 [ 0, %2 ], [ %11, %10 ]
    sval4->addIncoming(builder.getInt64(0), step_BB2);
    sval4->addIncoming(sval11, step_BB10);
    //   %5 = phi i32 [ 2, %2 ], [ %12, %10 ]
    sval5->addIncoming(builder.getInt32(2), step_BB2);
    sval5->addIncoming(sval12, step_BB10);
    //   %15 = phi i64 [ 0, %3 ], [ %74, %73 ]
    sval15->addIncoming(builder.getInt64(0), step_BB3);
    sval15->addIncoming(sval74, step_BB73);
    //   %16 = phi i32 [ 2, %3 ], [ %75, %73 ]
    sval16->addIncoming(builder.getInt32(2), step_BB3);
    sval16->addIncoming(sval75, step_BB73);
    //   %20 = phi i32 [ %8, %14 ], [ %32, %31 ]
    sval20->addIncoming(sval8, step_BB14);
    sval20->addIncoming(sval32, step_BB31);
    //   %21 = phi i32 [ 0, %14 ], [ %54, %31 ]
    sval21->addIncoming(builder.getInt32(0), step_BB14);
    sval21->addIncoming(sval54, step_BB31);
    //   %35 = phi i32 [ %18, %19 ], [ %55, %53 ]
    sval35->addIncoming(sval18, step_BB19);
    sval35->addIncoming(sval55, step_BB53);
    //   %36 = phi i32 [ %21, %19 ], [ %54, %53 ]
    sval36->addIncoming(sval21, step_BB19);
    sval36->addIncoming(sval54, step_BB53);
    //   %54 = phi i32 [ %52, %40 ], [ %36, %34 ]
    sval54->addIncoming(sval52, step_BB40);
    sval54->addIncoming(sval36, step_BB34);

    FunctionType *appFuncType = FunctionType::get(voidType, {}, false);
    Function *appFunc = Function::Create(appFuncType, Function::ExternalLinkage, "app", module);

    // BasicBlocks:
    BasicBlock *app_BB0 = BasicBlock::Create(context, "", appFunc);
    BasicBlock *app_BB8 = BasicBlock::Create(context, "", appFunc);
    BasicBlock *app_BB12 = BasicBlock::Create(context, "", appFunc);
    BasicBlock *app_BB13 = BasicBlock::Create(context, "", appFunc);
    BasicBlock *app_BB17 = BasicBlock::Create(context, "", appFunc);
    BasicBlock *app_BB18 = BasicBlock::Create(context, "", appFunc);
    BasicBlock *app_BB24 = BasicBlock::Create(context, "", appFunc);
    BasicBlock *app_BB28 = BasicBlock::Create(context, "", appFunc);
    BasicBlock *app_BB33 = BasicBlock::Create(context, "", appFunc);
    BasicBlock *app_BB45 = BasicBlock::Create(context, "", appFunc);
    BasicBlock *app_BB48 = BasicBlock::Create(context, "", appFunc);
    BasicBlock *app_BB54 = BasicBlock::Create(context, "", appFunc);
    BasicBlock *app_BB67 = BasicBlock::Create(context, "", appFunc);
    BasicBlock *app_BB71 = BasicBlock::Create(context, "", appFunc);
    BasicBlock *app_BB76 = BasicBlock::Create(context, "", appFunc);
    BasicBlock *app_BB80 = BasicBlock::Create(context, "", appFunc);
    BasicBlock *app_BB81 = BasicBlock::Create(context, "", appFunc);
    BasicBlock *app_BB82 = BasicBlock::Create(context, "", appFunc);
    BasicBlock *app_BB85 = BasicBlock::Create(context, "", appFunc);
    BasicBlock *app_BB86 = BasicBlock::Create(context, "", appFunc);
    BasicBlock *app_BB87 = BasicBlock::Create(context, "", appFunc);
    BasicBlock *app_BB91 = BasicBlock::Create(context, "", appFunc);
    BasicBlock *app_BB94 = BasicBlock::Create(context, "", appFunc);
    BasicBlock *app_BB97 = BasicBlock::Create(context, "", appFunc);

    ArrayType *ArrayTy = ArrayType::get(IntegerType::get(context, 8), 1250);

    builder.SetInsertPoint(app_BB0);
    //   %1 = alloca [1250 x i8], align 1
    Value *val1 = builder.CreateAlloca(ArrayTy);
    //   %2 = alloca [1250 x i8], align 1
    Value *val2 = builder.CreateAlloca(ArrayTy);
    //   call void @llvm.lifetime.start.p0(i64 1250, ptr nonnull %1) #7
    builder.CreateCall(llvm_lifetime_start_func, {builder.getInt64(1250), val1});
    //   call void @llvm.memset.p0.i64(ptr noundef nonnull align 1 dereferenceable(1250) %1, i8 0,
    //   i64 1250, i1 false)
    builder.CreateCall(llvm_memset_p0_i64_func,
                       {val1, builder.getInt8(0), builder.getInt64(1250), builder.getInt1(0)});
    //   %3 = getelementptr inbounds i8, ptr %1, i64 52
    Value *val3 = builder.CreateGEP(builder.getInt8Ty(), val1, builder.getInt64(52));
    //   store i8 1, ptr %3, align 1, !tbaa !8
    builder.CreateStore(builder.getInt8(1), val3);
    //   %4 = getelementptr inbounds i8, ptr %1, i64 103
    Value *val4 = builder.CreateGEP(builder.getInt8Ty(), val1, builder.getInt64(103));
    //   store i8 1, ptr %4, align 1, !tbaa !8
    builder.CreateStore(builder.getInt8(1), val4);
    //   %5 = getelementptr inbounds i8, ptr %1, i64 104
    Value *val5 = builder.CreateGEP(builder.getInt8Ty(), val1, builder.getInt64(104));
    //   store i8 1, ptr %5, align 1, !tbaa !8
    builder.CreateStore(builder.getInt8(1), val5);
    //   %6 = getelementptr inbounds i8, ptr %1, i64 152
    Value *val6 = builder.CreateGEP(builder.getInt8Ty(), val1, builder.getInt64(152));
    //   store i8 1, ptr %6, align 1, !tbaa !8
    builder.CreateStore(builder.getInt8(1), val6);
    //   %7 = getelementptr inbounds i8, ptr %1, i64 153
    Value *val7 = builder.CreateGEP(builder.getInt8Ty(), val1, builder.getInt64(153));
    //   store i8 1, ptr %7, align 1, !tbaa !8
    builder.CreateStore(builder.getInt8(1), val7);
    //   call void @llvm.lifetime.start.p0(i64 1250, ptr nonnull %2) #7
    builder.CreateCall(llvm_lifetime_start_func, {builder.getInt64(1250), val2});
    //   call void @llvm.memset.p0.i64(ptr noundef nonnull align 1 dereferenceable(1250) %2, i8 0,
    //   i64 1250, i1 false)
    builder.CreateCall(llvm_memset_p0_i64_func,
                       {val2, builder.getInt8(0), builder.getInt64(1250), builder.getInt1(0)});
    //   br label %8
    builder.CreateBr(app_BB8);

    // 8:                                                ; preds = %0, %91
    builder.SetInsertPoint(app_BB8);
    //   %9 = phi i32 [ 0, %0 ], [ %92, %91 ]
    PHINode *val9 = builder.CreatePHI(builder.getInt32Ty(), 2);
    //   %10 = phi ptr [ %2, %0 ], [ %11, %91 ]
    PHINode *val10 = builder.CreatePHI(builder.getPtrTy(), 2);
    //   %11 = phi ptr [ %1, %0 ], [ %10, %91 ]
    PHINode *val11 = builder.CreatePHI(builder.getPtrTy(), 2);
    //   br label %13
    builder.CreateBr(app_BB13);

    // 12:                                               ; preds = %91
    builder.SetInsertPoint(app_BB12);
    //   call void @llvm.lifetime.end.p0(i64 1250, ptr nonnull %2) #7
    builder.CreateCall(llvm_lifetime_end_func, {builder.getInt64(1250), val2});
    //   call void @llvm.lifetime.end.p0(i64 1250, ptr nonnull %1) #7
    builder.CreateCall(llvm_lifetime_end_func, {builder.getInt64(1250), val1});
    //   ret void
    builder.CreateRetVoid();

    // 13:                                               ; preds = %8, %94
    builder.SetInsertPoint(app_BB13);
    //   %14 = phi i64 [ 0, %8 ], [ %95, %94 ]
    PHINode *val14 = builder.CreatePHI(builder.getInt64Ty(), 2);
    //   %15 = mul nuw nsw i64 %14, 50
    Value *val15 = builder.CreateMul(val14, builder.getInt64(50), "", true, true);
    //   %16 = trunc nuw nsw i64 %14 to i32
    Value *val16 = builder.CreateTrunc(val14, builder.getInt32Ty(), "", true, true);
    //   br label %97
    builder.CreateBr(app_BB97);

    // 17:                                               ; preds = %94
    builder.SetInsertPoint(app_BB17);
    //   tail call void @simFlush()
    builder.CreateCall(simFlushFunc);  // TODO
    //   br label %18
    builder.CreateBr(app_BB18);

    // 18:                                               ; preds = %24, %17
    builder.SetInsertPoint(app_BB18);
    //   %19 = phi i64 [ 0, %17 ], [ %25, %24 ]
    PHINode *val19 = builder.CreatePHI(builder.getInt64Ty(), 2);
    //   %20 = phi i32 [ 2, %17 ], [ %26, %24 ]
    PHINode *val20 = builder.CreatePHI(builder.getInt32Ty(), 2);
    //   %21 = mul nuw nsw i64 %19, 50
    Value *val21 = builder.CreateMul(val19, builder.getInt64(50), "", true, true);
    //   %22 = trunc i64 %19 to i32
    Value *val22 = builder.CreateTrunc(val19, builder.getInt32Ty());
    //   %23 = add i32 %22, -1
    Value *val23 = builder.CreateAdd(val22, builder.getInt32(-1));
    //   br label %28
    builder.CreateBr(app_BB28);

    // 24:                                               ; preds = %87
    builder.SetInsertPoint(app_BB24);
    //   %25 = add nuw nsw i64 %19, 1
    Value *val25 = builder.CreateAdd(val19, builder.getInt64(1), "", true, true);
    //   %26 = add nuw nsw i32 %20, 1
    Value *val26 = builder.CreateAdd(val20, builder.getInt32(1), "", true, true);
    //   %27 = icmp eq i64 %25, 25
    Value *val27 = builder.CreateICmpEQ(val25, builder.getInt64(25));
    //   br i1 %27, label %91, label %18, !llvm.loop !14
    builder.CreateCondBr(val27, app_BB91, app_BB18);

    // 28:                                               ; preds = %87, %18
    builder.SetInsertPoint(app_BB28);
    //   %29 = phi i64 [ 0, %18 ], [ %88, %87 ]
    PHINode *val29 = builder.CreatePHI(builder.getInt64Ty(), 2);
    //   %30 = phi i32 [ 2, %18 ], [ %89, %87 ]
    PHINode *val30 = builder.CreatePHI(builder.getInt32Ty(), 2);
    //   %31 = trunc i64 %29 to i32
    Value *val31 = builder.CreateTrunc(val29, builder.getInt32Ty());
    //   %32 = add i32 %31, -1
    Value *val32 = builder.CreateAdd(val31, builder.getInt32(-1));
    //   br label %33
    builder.CreateBr(app_BB33);

    // 33:                                               ; preds = %45, %28
    builder.SetInsertPoint(app_BB33);
    //   %34 = phi i32 [ %23, %28 ], [ %46, %45 ]
    PHINode *val34 = builder.CreatePHI(builder.getInt32Ty(), 2);
    //   %35 = phi i32 [ 0, %28 ], [ %68, %45 ]
    PHINode *val35 = builder.CreatePHI(builder.getInt32Ty(), 2);
    //   %36 = zext i32 %34 to i64
    Value *val36 = builder.CreateZExt(val34, builder.getInt64Ty());
    //   %37 = icmp eq i64 %19, %36
    Value *val37 = builder.CreateICmpEQ(val19, val36);
    //   %38 = icmp slt i32 %34, 0
    Value *val38 = builder.CreateICmpSLT(val34, builder.getInt32(0));
    //   %39 = add nsw i32 %34, 25
    Value *val39 = builder.CreateNSWAdd(val34, builder.getInt32(25));
    //   %40 = icmp sgt i32 %34, 24
    Value *val40 = builder.CreateICmpSGT(val34, builder.getInt32(24));
    //   %41 = add nsw i32 %34, -25
    Value *val41 = builder.CreateNSWAdd(val34, builder.getInt32(-25));
    //   %42 = select i1 %40, i32 %41, i32 %34
    Value *val42 = builder.CreateSelect(val40, val41, val34);
    //   %43 = select i1 %38, i32 %39, i32 %42
    Value *val43 = builder.CreateSelect(val38, val39, val42);
    //   %44 = mul nsw i32 %43, 50
    Value *val44 = builder.CreateNSWMul(val43, builder.getInt32(50));
    //   br label %48
    builder.CreateBr(app_BB48);

    // 45:                                               ; preds = %67
    builder.SetInsertPoint(app_BB45);
    //   %46 = add nsw i32 %34, 1
    Value *val46 = builder.CreateNSWAdd(val34, builder.getInt32(1));
    //   %47 = icmp eq i32 %46, %20
    Value *val47 = builder.CreateICmpEQ(val46, val20);
    //   br i1 %47, label %71, label %33, !llvm.loop !5
    builder.CreateCondBr(val47, app_BB71, app_BB33);

    // 48:                                               ; preds = %67, %33
    builder.SetInsertPoint(app_BB48);
    //   %49 = phi i32 [ %32, %33 ], [ %69, %67 ]
    PHINode *val49 = builder.CreatePHI(builder.getInt32Ty(), 2);
    //   %50 = phi i32 [ %35, %33 ], [ %68, %67 ]
    PHINode *val50 = builder.CreatePHI(builder.getInt32Ty(), 2);
    //   %51 = zext i32 %49 to i64
    Value *val51 = builder.CreateZExt(val49, builder.getInt64Ty());
    //   %52 = icmp eq i64 %29, %51
    Value *val52 = builder.CreateICmpEQ(val29, val51);
    //   %53 = and i1 %37, %52
    Value *val53 = builder.CreateAnd(val37, val52);
    //   br i1 %53, label %67, label %54
    builder.CreateCondBr(val53, app_BB67, app_BB54);

    // 54:                                               ; preds = %48
    builder.SetInsertPoint(app_BB54);
    //   %55 = icmp slt i32 %49, 0
    Value *val55 = builder.CreateICmpSLT(val49, builder.getInt32(0));
    //   %56 = add nsw i32 %49, 50
    Value *val56 = builder.CreateNSWAdd(val49, builder.getInt32(50));
    //   %57 = icmp sgt i32 %49, 49
    Value *val57 = builder.CreateICmpSGT(val49, builder.getInt32(49));
    //   %58 = add nsw i32 %49, -50
    Value *val58 = builder.CreateNSWAdd(val49, builder.getInt32(-50));
    //   %59 = select i1 %57, i32 %58, i32 %49
    Value *val59 = builder.CreateSelect(val57, val58, val49);
    //   %60 = select i1 %55, i32 %56, i32 %59
    Value *val60 = builder.CreateSelect(val55, val56, val59);
    //   %61 = add nsw i32 %60, %44
    Value *val61 = builder.CreateNSWAdd(val60, val44);
    //   %62 = sext i32 %61 to i64
    Value *val62 = builder.CreateSExt(val61, builder.getInt64Ty());
    //   %63 = getelementptr inbounds i8, ptr %11, i64 %62
    Value *val63 = builder.CreateGEP(builder.getInt8Ty(), val11, val62);
    //   %64 = load i8, ptr %63, align 1, !tbaa !8
    Value *val64 = builder.CreateLoad(builder.getInt8Ty(), val63);
    //   %65 = sext i8 %64 to i32
    Value *val65 = builder.CreateSExt(val64, builder.getInt32Ty());
    //   %66 = add nsw i32 %50, %65
    Value *val66 = builder.CreateNSWAdd(val50, val65);
    //   br label %67
    builder.CreateBr(app_BB67);

    // 67:                                               ; preds = %54, %48
    builder.SetInsertPoint(app_BB67);
    //   %68 = phi i32 [ %66, %54 ], [ %50, %48 ]
    PHINode *val68 = builder.CreatePHI(builder.getInt32Ty(), 2);
    //   %69 = add nsw i32 %49, 1
    Value *val69 = builder.CreateNSWAdd(val49, builder.getInt32(1));
    //   %70 = icmp eq i32 %69, %30
    Value *val70 = builder.CreateICmpEQ(val69, val30);
    //   br i1 %70, label %45, label %48, !llvm.loop !11
    builder.CreateCondBr(val70, app_BB45, app_BB48);

    // 71:                                               ; preds = %45
    builder.SetInsertPoint(app_BB71);
    //   %72 = add nuw nsw i64 %29, %21
    Value *val72 = builder.CreateAdd(val29, val21, "", true, true);
    //   %73 = getelementptr inbounds i8, ptr %11, i64 %72
    Value *val73 = builder.CreateGEP(builder.getInt8Ty(), val11, val72);
    //   %74 = load i8, ptr %73, align 1, !tbaa !8
    Value *val74 = builder.CreateLoad(builder.getInt8Ty(), val73);
    //   %75 = icmp eq i8 %74, 0
    Value *val75 = builder.CreateICmpEQ(val74, builder.getInt8(0));
    //   br i1 %75, label %82, label %76
    builder.CreateCondBr(val75, app_BB82, app_BB76);

    // 76:                                               ; preds = %71
    builder.SetInsertPoint(app_BB76);
    //   %77 = and i32 %68, -2
    Value *val77 = builder.CreateAnd(val68, builder.getInt32(-2));
    //   %78 = icmp eq i32 %77, 2
    Value *val78 = builder.CreateICmpEQ(val77, builder.getInt32(2));
    //   %79 = getelementptr inbounds i8, ptr %10, i64 %72
    Value *val79 = builder.CreateGEP(builder.getInt8Ty(), val10, val72);
    //   br i1 %78, label %80, label %81
    builder.CreateCondBr(val78, app_BB80, app_BB81);

    // 80:                                               ; preds = %76
    builder.SetInsertPoint(app_BB80);
    //   store i8 1, ptr %79, align 1, !tbaa !8
    builder.CreateStore(builder.getInt8(1), val79);
    //   br label %87
    builder.CreateBr(app_BB87);

    // 81:                                               ; preds = %76
    builder.SetInsertPoint(app_BB81);
    //   store i8 0, ptr %79, align 1, !tbaa !8
    builder.CreateStore(builder.getInt8(0), val79);
    //   br label %87
    builder.CreateBr(app_BB87);

    // 82:                                               ; preds = %71
    builder.SetInsertPoint(app_BB82);
    //   %83 = icmp eq i32 %68, 3
    Value *val83 = builder.CreateICmpEQ(val68, builder.getInt32(3));
    //   %84 = getelementptr inbounds i8, ptr %10, i64 %72
    Value *val84 = builder.CreateGEP(builder.getInt8Ty(), val10, val72);
    //   br i1 %83, label %85, label %86
    builder.CreateCondBr(val83, app_BB85, app_BB86);

    // 85:                                               ; preds = %82
    builder.SetInsertPoint(app_BB85);
    //   store i8 1, ptr %84, align 1, !tbaa !8
    builder.CreateStore(builder.getInt8(1), val84);
    //   br label %87
    builder.CreateBr(app_BB87);

    // 86:                                               ; preds = %82
    builder.SetInsertPoint(app_BB86);
    //   store i8 0, ptr %84, align 1, !tbaa !8
    builder.CreateStore(builder.getInt8(0), val84);
    //   br label %87
    builder.CreateBr(app_BB87);

    // 87:                                               ; preds = %86, %85, %81, %80
    builder.SetInsertPoint(app_BB87);
    //   %88 = add nuw nsw i64 %29, 1
    Value *val88 = builder.CreateAdd(val29, builder.getInt64(1), "", true, true);
    //   %89 = add nuw nsw i32 %30, 1
    Value *val89 = builder.CreateAdd(val30, builder.getInt32(1), "", true, true);
    //   %90 = icmp eq i64 %88, 50
    Value *val90 = builder.CreateICmpEQ(val88, builder.getInt64(50));
    //   br i1 %90, label %24, label %28, !llvm.loop !15
    builder.CreateCondBr(val90, app_BB24, app_BB28);

    // 91:                                               ; preds = %24
    builder.SetInsertPoint(app_BB91);
    //   %92 = add nuw nsw i32 %9, 1
    Value *val92 = builder.CreateAdd(val9, builder.getInt32(1), "", true, true);
    //   %93 = icmp eq i32 %92, 1000
    Value *val93 = builder.CreateICmpEQ(val92, builder.getInt32(1000));
    //   br i1 %93, label %12, label %8, !llvm.loop !16
    builder.CreateCondBr(val93, app_BB12, app_BB8);

    // 94:                                               ; preds = %97
    builder.SetInsertPoint(app_BB94);
    //   %95 = add nuw nsw i64 %14, 1
    Value *val95 = builder.CreateAdd(val14, builder.getInt64(1), "", true, true);
    //   %96 = icmp eq i64 %95, 25
    Value *val96 = builder.CreateICmpEQ(val95, builder.getInt64(25));
    //   br i1 %96, label %17, label %13, !llvm.loop !17
    builder.CreateCondBr(val96, app_BB17, app_BB13);

    // 97:                                               ; preds = %13, %97
    builder.SetInsertPoint(app_BB97);
    //   %98 = phi i64 [ 0, %13 ], [ %105, %97 ]
    PHINode *val98 = builder.CreatePHI(builder.getInt64Ty(), 2);
    //   %99 = add nuw nsw i64 %98, %15
    Value *val99 = builder.CreateAdd(val98, val15, "", true, true);
    //   %100 = getelementptr inbounds i8, ptr %11, i64 %99
    Value *val100 = builder.CreateGEP(builder.getInt8Ty(), val11, val99);
    //   %101 = load i8, ptr %100, align 1, !tbaa !8
    Value *val101 = builder.CreateLoad(builder.getInt8Ty(), val100);
    //   %102 = icmp eq i8 %101, 0
    Value *val102 = builder.CreateICmpEQ(val101, builder.getInt8(0));
    //   %103 = trunc nuw nsw i64 %98 to i32
    Value *val103 = builder.CreateTrunc(val98, builder.getInt32Ty(), "", true, true);
    //   %104 = select i1 %102, i32 -1, i32 -16777216
    Value *val104 = builder.CreateSelect(val102, builder.getInt32(-1), builder.getInt32(-16777216));
    //   tail call void @simPutDisplayPixel(i32 noundef %103, i32 noundef %16, i32 noundef %104, i32
    //   noundef 40) TODO
    builder.CreateCall(simPutDisplayPixelFunc, {val103, val16, val104, builder.getInt32(40)});
    //   %105 = add nuw nsw i64 %98, 1
    Value *val105 = builder.CreateAdd(val98, builder.getInt64(1), "", true, true);
    //   %106 = icmp eq i64 %105, 50
    Value *val106 = builder.CreateICmpEQ(val105, builder.getInt64(50));
    //   br i1 %106, label %94, label %97, !llvm.loop !18
    builder.CreateCondBr(val106, app_BB94, app_BB97);
    // }

    //   Link PHINodes

    //   %9 = phi i32 [ 0, %0 ], [ %92, %91 ]
    val9->addIncoming(builder.getInt32(0), app_BB0);
    val9->addIncoming(val92, app_BB91);
    //   %10 = phi ptr [ %2, %0 ], [ %11, %91 ]
    val10->addIncoming(val2, app_BB0);
    val10->addIncoming(val11, app_BB91);
    //   %11 = phi ptr [ %1, %0 ], [ %10, %91 ]
    val11->addIncoming(val1, app_BB0);
    val11->addIncoming(val10, app_BB91);
    //   %14 = phi i64 [ 0, %8 ], [ %95, %94 ]
    val14->addIncoming(builder.getInt64(0), app_BB8);
    val14->addIncoming(val95, app_BB94);
    //   %19 = phi i64 [ 0, %17 ], [ %25, %24 ]
    val19->addIncoming(builder.getInt64(0), app_BB17);
    val19->addIncoming(val25, app_BB24);

    //   %20 = phi i32 [ 2, %17 ], [ %26, %24 ]
    val20->addIncoming(builder.getInt32(2), app_BB17);
    val20->addIncoming(val26, app_BB24);

    //   %29 = phi i64 [ 0, %18 ], [ %88, %87 ]
    val29->addIncoming(builder.getInt64(0), app_BB18);
    val29->addIncoming(val88, app_BB87);

    //   %30 = phi i32 [ 2, %18 ], [ %89, %87 ]
    val30->addIncoming(builder.getInt32(2), app_BB18);
    val30->addIncoming(val89, app_BB87);

    //   %34 = phi i32 [ %23, %28 ], [ %46, %45 ]
    val34->addIncoming(val23, app_BB28);
    val34->addIncoming(val46, app_BB45);

    //   %35 = phi i32 [ 0, %28 ], [ %68, %45 ]
    val35->addIncoming(builder.getInt32(0), app_BB28);
    val35->addIncoming(val68, app_BB45);

    //   %49 = phi i32 [ %32, %33 ], [ %69, %67 ]
    val49->addIncoming(val32, app_BB33);
    val49->addIncoming(val69, app_BB67);

    //   %50 = phi i32 [ %35, %33 ], [ %68, %67 ]
    val50->addIncoming(val35, app_BB33);
    val50->addIncoming(val68, app_BB67);

    //   %68 = phi i32 [ %66, %54 ], [ %50, %48 ]
    val68->addIncoming(val66, app_BB54);
    val68->addIncoming(val50, app_BB48);

    //   %98 = phi i64 [ 0, %13 ], [ %105, %97 ]
    val98->addIncoming(builder.getInt64(0), app_BB13);
    val98->addIncoming(val105, app_BB97);

    // Dump LLVM IR
    module->print(outs(), nullptr);

    // Interpreter of LLVM IR
    outs() << "Running code...\n";
    InitializeNativeTarget();
    InitializeNativeTargetAsmPrinter();

    ExecutionEngine *ee = EngineBuilder(std::unique_ptr<Module>(module)).create();
    ee->InstallLazyFunctionCreator([&](const std::string &fnName) -> void * {
        if (fnName == "simPutDisplayPixel") {
            return reinterpret_cast<void *>(simPutDisplayPixel);
        }
        if (fnName == "simFlush") {
            return reinterpret_cast<void *>(simFlush);
        }
        return nullptr;
    });
    ee->finalizeObject();

    simInit();

    ArrayRef<GenericValue> noargs;
    GenericValue v = ee->runFunction(appFunc, noargs);
    outs() << "Code was run.\n";

    // simExit();
    return EXIT_SUCCESS;
}

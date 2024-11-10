#include <assert.h>
#include <stdio.h>

#include <fstream>
#include <iostream>
#include <unordered_map>

#include "../SDL/sim.hpp"
#include "llvm/ExecutionEngine/ExecutionEngine.h"
#include "llvm/ExecutionEngine/GenericValue.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"
#include "llvm/Support/TargetSelect.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

const int REG_FILE_SIZE = 28;
uint64_t REG_FILE[REG_FILE_SIZE];

void do_SIM_PUT_DISPLAY_PIXEL(int arg1, int arg2, int arg3, int arg4) {
    simPutDisplayPixel(REG_FILE[arg1], REG_FILE[arg2], REG_FILE[arg3], arg4);
}

void do_NEIGHBORS(char *arg1, int arg2, int arg3) { neighbors(arg1, arg2, arg3); }

void do_SIM_FLUSH() { simFlush(); }

void do_REG_DUMP(int arg) {
    printf("label_%d\n", arg);
    for (int i = 0; i < REG_FILE_SIZE; ++i) {
        printf("X[%d] = %lld\n", i, REG_FILE[i]);
    }
    printf("\n");
    fflush(stdout);
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        outs() << "[ERROR] Need 1 argument: file with assembler code\n";
        return 1;
    }
    std::ifstream input;
    input.open(argv[1]);
    if (!input.is_open()) {
        outs() << "[ERROR] Can't open " << argv[1] << "\n";
        return 1;
    }

    LLVMContext context;
    // ; ModuleID = 'top'
    // source_filename = "top"
    Module *module = new Module("top", context);
    IRBuilder<> builder(context);

    ArrayType *regFileType = ArrayType::get(builder.getInt64Ty(), REG_FILE_SIZE);
    module->getOrInsertGlobal("regFile", regFileType);
    GlobalVariable *regFile = module->getNamedGlobal("regFile");

    ArrayRef<Type *> Neighbors_ParamTypes = {
        builder.getPtrTy(),
        builder.getInt32Ty(),
        builder.getInt32Ty(),
    };
    FunctionType *NeighborsType =
        FunctionType::get(builder.getInt32Ty(), Neighbors_ParamTypes, false);
    FunctionCallee do_NeighborsFunc = module->getOrInsertFunction("do_NEIGHBORS", NeighborsType);

    // declare void @main()
    FunctionType *funcType = FunctionType::get(builder.getVoidTy(), false);
    Function *mainFunc = Function::Create(funcType, Function::ExternalLinkage, "main", module);

    std::string name;
    std::string arg;
    std::unordered_map<std::string, BasicBlock *> BBMap;

    outs() << "\n#[FILE]:\nBBs:";

    while (input >> name) {
        if (!name.compare("ICMP_SELECT") || !name.compare("SELECT_MUL") ||
            !name.compare("SELECT_ADD")) {
            input >> arg >> arg >> arg >> arg >> arg;
            continue;
        } else if (!name.compare("EQ_BR") || !name.compare("EQ_BR_IMM") ||
                   !name.compare("AND_BR") || !name.compare("SELECT") ||
                   !name.compare("SIM_PUT_DISPLAY_PIXEL") || !name.compare("NEIGHBORS")) {
            input >> arg >> arg >> arg >> arg;
            continue;
        } else if (!name.compare("XOR") || !name.compare("MUL") || !name.compare("GEP_STORE") ||
                   !name.compare("ADD_IMM") || !name.compare("ADD") ||
                   !name.compare("ZEXT_ICMP_EQ") || !name.compare("ICMP_SLT") ||
                   !name.compare("GEP_SEXT_LOAD_SEXT") || !name.compare("GEP_LOAD") ||
                   !name.compare("AND") || !name.compare("ICMP_EQ") || !name.compare("GEP") ||
                   !name.compare("BR_IF")) {
            input >> arg >> arg >> arg;
            continue;
        } else if (!name.compare("SWAP") || !name.compare("TRUNC") || !name.compare("LOAD_SEXT") ||
                   !name.compare("STORE")) {
            input >> arg >> arg;
            continue;
        } else if (!name.compare("ALLOCA") || !name.compare("BR") || !name.compare("FREE") ||
                   (!name.compare("LIFETIME_START")) || (!name.compare("REG_DUMP"))) {
            input >> arg;
            continue;
        } else if (!name.compare("EXIT") || !name.compare("SIM_FLUSH")) {
            continue;
        }

        outs() << name << " ";
        BBMap[name] = BasicBlock::Create(context, name, mainFunc);
    }
    outs() << "\n";
    input.close();
    input.open(argv[1]);

    // Funcions types
    Type *voidType = Type::getVoidTy(context);
    FunctionType *voidFuncType = FunctionType::get(voidType, false);

    ArrayRef<Type *> int32x1Types = {Type::getInt64Ty(context)};
    FunctionType *int32x1FuncType = FunctionType::get(voidType, int32x1Types, false);

    ArrayRef<Type *> int32x2Types = {Type::getInt64Ty(context), Type::getInt64Ty(context)};
    FunctionType *int32x2FuncType = FunctionType::get(voidType, int32x2Types, false);

    ArrayRef<Type *> int32x3Types = {Type::getInt64Ty(context), Type::getInt64Ty(context),
                                     Type::getInt64Ty(context)};
    FunctionType *int32x3FuncType = FunctionType::get(voidType, int32x3Types, false);

    ArrayRef<Type *> int32x4Types = {Type::getInt64Ty(context), Type::getInt64Ty(context),
                                     Type::getInt64Ty(context), Type::getInt64Ty(context)};
    FunctionType *int32x4FuncType = FunctionType::get(voidType, int32x4Types, false);

    FunctionCallee do_SIM_PUT_DISPLAY_PIXELFunc =
        module->getOrInsertFunction("do_SIM_PUT_DISPLAY_PIXEL", int32x4FuncType);

    FunctionCallee do_SIM_FLUSHFunc = module->getOrInsertFunction("do_SIM_FLUSH", voidFuncType);
    FunctionCallee do_REG_DUMPFunc = module->getOrInsertFunction("do_REG_DUMP", int32x1FuncType);

    ArrayType *ArrayTy = ArrayType::get(IntegerType::get(context, 8), 1250);
    PointerType *ArrayTyPtr = PointerType::get(ArrayTy, 0);

    ArrayRef<Type *> llvm_lifetime_start_types = {Type::getInt64Ty(context), builder.getPtrTy()};
    FunctionType *llvm_lifetime_start_func_type =
        FunctionType::get(voidType, llvm_lifetime_start_types, false);
    Function *llvm_lifetime_start_func = Function::Create(
        llvm_lifetime_start_func_type, Function::ExternalLinkage, "llvm.lifetime.start.p0", module);

    ArrayRef<Type *> llvm_lifetime_end_types = {Type::getInt64Ty(context), builder.getPtrTy()};
    FunctionType *llvm_lifetime_end_func_type =
        FunctionType::get(voidType, llvm_lifetime_end_types, false);
    Function *llvm_lifetime_end_func = Function::Create(
        llvm_lifetime_end_func_type, Function::ExternalLinkage, "llvm.lifetime.end.p0", module);

    ArrayRef<Type *> llvm_memset_p0_i64_types = {builder.getPtrTy(), Type::getInt8Ty(context),
                                                 Type::getInt64Ty(context),
                                                 Type::getInt1Ty(context)};
    FunctionType *llvm_memset_p0_i64_func_type =
        FunctionType::get(voidType, llvm_memset_p0_i64_types, false);
    Function *llvm_memset_p0_i64_func = Function::Create(
        llvm_memset_p0_i64_func_type, Function::ExternalLinkage, "llvm.memset.p0.i64", module);

    while (input >> name) {
        if (!name.compare("EXIT")) {
            outs() << "\tEXIT\n";
            builder.CreateRetVoid();
            if (input >> name) {
                outs() << "BB " << name << "\n";
                builder.SetInsertPoint(BBMap[name]);
            }
            continue;
        } else if (!name.compare("FREE")) {
            input >> arg;
            Value *arg1 =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            builder.CreateCall(llvm_lifetime_end_func, {builder.getInt64(1250), arg1});
            continue;
        } else if (!name.compare("LIFETIME_START")) {
            input >> arg;
            Value *arg1 =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            builder.CreateCall(llvm_lifetime_start_func,
                               {builder.getInt64(1250), builder.CreateLoad(ArrayTyPtr, arg1)});
            builder.CreateCall(llvm_memset_p0_i64_func,
                               {builder.CreateLoad(ArrayTyPtr, arg1), builder.getInt8(0),
                                builder.getInt64(1250), builder.getInt1(0)});

            continue;
        } else if (!name.compare("REG_DUMP")) {
            input >> arg;
            builder.CreateCall(do_REG_DUMPFunc, builder.getInt64(std::stoll(arg)));
            continue;
        } else if (!name.compare("NEIGHBORS")) {
            input >> arg;
            Value *res =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            Value *arg1 =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            Value *arg2 =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            Value *arg3 =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            Value *neighbors_args[] = {builder.CreateLoad(builder.getPtrTy(), arg1),
                                       builder.CreateLoad(builder.getInt32Ty(), arg2),
                                       builder.CreateLoad(builder.getInt32Ty(), arg3)};

            Value *neighbors = builder.CreateCall(do_NeighborsFunc, neighbors_args);

            builder.CreateStore(neighbors, res);
            continue;
        } else if (!name.compare("SIM_PUT_DISPLAY_PIXEL")) {
            input >> arg;
            outs() << "\tSIM_PUT_DISPLAY_PIXEL " << arg;
            Value *arg1 = builder.getInt64(std::stoll(arg.substr(1)));
            input >> arg;
            outs() << " " << arg;
            Value *arg2 = builder.getInt64(std::stoll(arg.substr(1)));
            input >> arg;
            outs() << " " << arg;
            Value *arg3 = builder.getInt64(std::stoll(arg.substr(1)));
            input >> arg;
            outs() << " " << arg << "\n";
            Value *arg4 = builder.getInt64(std::stoll(arg));
            Value *args[] = {arg1, arg2, arg3, arg4};
            builder.CreateCall(do_SIM_PUT_DISPLAY_PIXELFunc, args);

            continue;
        } else if (!name.compare("SIM_FLUSH")) {
            outs() << "\tSIM_FLUSH\n";
            builder.CreateCall(do_SIM_FLUSHFunc);

            continue;
        } else if (!name.compare("XOR")) {
            input >> arg;
            outs() << "\t" << arg;
            // res
            Value *res_p =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));
            input >> arg;
            outs() << " = " << arg;
            // arg1
            Value *arg1_p =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));
            input >> arg;
            outs() << " ^ " << arg << "\n";
            // arg2
            Value *arg2_p =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));
            Value *xor_arg1_arg2 =
                builder.CreateXor(builder.CreateLoad(builder.getInt64Ty(), arg1_p),
                                  builder.CreateLoad(builder.getInt64Ty(), arg2_p));
            builder.CreateStore(xor_arg1_arg2, res_p);
            continue;
        } else if (!name.compare("ALLOCA")) {
            input >> arg;
            outs() << "\tALLOCATE: " << arg << "\n";
            // res
            Value *arg1 =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));
            llvm::AllocaInst *alloca =
                builder.CreateAlloca(ArrayType::get(builder.getInt8Ty(), 1250), nullptr);
            alloca->setAlignment(llvm::Align(1));
            builder.CreateStore(alloca, arg1);

            continue;
        } else if (!name.compare("GEP_STORE")) {
            input >> arg;
            outs() << "\tGEP_STORE " << arg;

            Value *arg1 =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            outs() << " " << arg;

            Value *arg2 = builder.getInt64(std::stoll(arg));

            input >> arg;
            outs() << " " << arg << "\n";

            Value *arg3 = builder.getInt8(std::stoll(arg));

            //   %3 = getelementptr inbounds i8, ptr %1, i64 52
            Value *gep_val = builder.CreateInBoundsGEP(builder.getInt8Ty(),
                                                       builder.CreateLoad(ArrayTyPtr, arg1), arg2);
            builder.CreateStore(arg3, gep_val);

            continue;
        } else if (!name.compare("SWAP")) {
            input >> arg;
            // res
            Value *arg2_p =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            // arg1
            Value *arg1_p =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));
            // tmp value
            Value *tmp1 = builder.CreateAdd(builder.CreateLoad(builder.getInt64Ty(), arg1_p),
                                            builder.getInt64(0));

            Value *tmp2 = builder.CreateAdd(builder.CreateLoad(builder.getInt64Ty(), arg2_p),
                                            builder.getInt64(0));

            builder.CreateStore(tmp1, arg2_p);
            builder.CreateStore(tmp2, arg1_p);
            continue;
        } else if (!name.compare("BR")) {
            input >> name;
            outs() << "\tbranch to " << name << "\n";
            builder.CreateBr(BBMap[name]);

            continue;
        } else if (!name.compare("MUL")) {
            input >> arg;
            outs() << "\t" << arg;
            // res
            Value *res_p =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoi(arg.substr(1)));
            input >> arg;
            outs() << " = " << arg;
            // arg1
            Value *arg1_p =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoi(arg.substr(1)));
            input >> arg;
            outs() << " * " << arg << "\n";
            // arg2
            Value *arg2_p = builder.getInt64(std::stoll(arg));
            Value *mul_arg1_arg2 =
                builder.CreateMul(builder.CreateLoad(builder.getInt64Ty(), arg1_p), arg2_p);
            builder.CreateStore(mul_arg1_arg2, res_p);
            continue;
        } else if (!name.compare("TRUNC")) {
            input >> arg;
            outs() << "\t" << arg << " = cast ";
            Value *res_arg =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            outs() << arg << " to i32\n";
            Value *arg1 =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            Value *trunc = builder.CreateTrunc(builder.CreateLoad(builder.getInt64Ty(), arg1),
                                               builder.getInt32Ty());
            builder.CreateStore(trunc, res_arg);

            continue;
        } else if (!name.compare("ADD_IMM")) {
            input >> arg;
            outs() << "\t" << arg << " = ";
            Value *res =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            outs() << arg << " + (";
            Value *arg1 =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            outs() << arg << ")\n";
            Value *arg2 = builder.getInt64(std::stoll(arg));

            Value *add_res =
                builder.CreateAdd(builder.CreateLoad(builder.getInt64Ty(), arg1), arg2);
            builder.CreateStore(add_res, res);

            continue;
        } else if (!name.compare("ADD")) {
            input >> arg;
            outs() << "\t" << arg << " = ";
            Value *res =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            outs() << arg << " + (";
            Value *arg1 =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            outs() << arg << ")\n";
            Value *arg2 =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            Value *add_res = builder.CreateAdd(builder.CreateLoad(builder.getInt64Ty(), arg1),
                                               builder.CreateLoad(builder.getInt64Ty(), arg2));
            builder.CreateStore(add_res, res);

            continue;
        } else if (!name.compare("EQ_BR_IMM")) {
            input >> arg;
            outs() << "\tif (" << arg;
            Value *arg1_ptr =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            outs() << " == " << arg << ") {\n";
            Value *imm = builder.getInt64(std::stoll(arg));

            input >> arg;
            outs() << "\t\tbranch to " << arg << "\n";
            outs() << "\t} else {\n";

            input >> name;
            outs() << "\t\tbranch to " << name << "\n";
            outs() << "\t}\n";

            // %27 = icmp eq i64 %25, 25
            // br i1 %27, label %89, label %18
            Value *icmp_eq_res =
                builder.CreateICmpEQ(builder.CreateLoad(builder.getInt64Ty(), arg1_ptr), imm);
            builder.CreateCondBr(icmp_eq_res, BBMap[arg], BBMap[name]);
            builder.SetInsertPoint(BBMap[arg]);

            continue;
        } else if (!name.compare("EQ_BR")) {
            input >> arg;
            outs() << "\tif (" << arg;

            Value *arg1_ptr =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            outs() << " == " << arg << ") {\n";
            Value *arg2_ptr =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            outs() << "\t\tbranch to " << arg << "\n";
            outs() << "\t} else {\n";

            input >> name;
            outs() << "\t\tbranch to " << name << "\n";
            outs() << "\t}\n";

            Value *icmp_eq_res =
                builder.CreateICmpEQ(builder.CreateLoad(builder.getInt64Ty(), arg1_ptr),
                                     builder.CreateLoad(builder.getInt64Ty(), arg2_ptr));
            builder.CreateCondBr(icmp_eq_res, BBMap[arg], BBMap[name]);
            builder.SetInsertPoint(BBMap[arg]);

            continue;
        } else if (!name.compare("ZEXT_ICMP_EQ")) {
            input >> arg;
            Value *res =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            Value *arg1 =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            Value *arg2 =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            //   %36 = zext i32 %34 to i64
            Value *zext = builder.CreateZExt(builder.CreateLoad(builder.getInt64Ty(), arg1),
                                             builder.getInt64Ty());

            //   %37 = icmp eq i64 %19, %36
            Value *icmp_eq_res =
                builder.CreateICmpEQ(zext, builder.CreateLoad(builder.getInt64Ty(), arg2));
            builder.CreateStore(icmp_eq_res, res);

            continue;
        } else if (!name.compare("ICMP_SLT")) {
            input >> arg;
            Value *res =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            Value *arg1 =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            Value *arg2 = builder.getInt64(std::stoll(arg));

            Value *icmp_res =
                builder.CreateICmpSLT(builder.CreateLoad(builder.getInt64Ty(), arg1), arg2);
            builder.CreateStore(icmp_res, res);

            continue;
        } else if (!name.compare("ICMP_SELECT")) {
            input >> arg;
            Value *res =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            Value *arg_icmp1 =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            Value *arg_icmp2 = builder.getInt64(std::stoll(arg));

            input >> arg;
            Value *arg_select1 = builder.getInt64(std::stoll(arg));

            input >> arg;
            Value *arg_select2 =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            Value *icmp_res = builder.CreateICmpSGT(
                builder.CreateLoad(builder.getInt64Ty(), arg_icmp1), arg_icmp2);
            Value *select_res = builder.CreateSelect(
                icmp_res, arg_select1, builder.CreateLoad(builder.getInt64Ty(), arg_select2));

            builder.CreateStore(select_res, res);

            continue;
        } else if (!name.compare("SELECT_MUL")) {
            input >> arg;
            Value *res =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            Value *arg_select1 =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            Value *arg_select2 =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            Value *arg_select3 =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            Value *arg_mul = builder.getInt64(std::stoll(arg));

            Value *select_res =
                builder.CreateSelect(builder.CreateLoad(builder.getInt1Ty(), arg_select1),
                                     builder.CreateLoad(builder.getInt64Ty(), arg_select2),
                                     builder.CreateLoad(builder.getInt64Ty(), arg_select3));

            Value *mul_res = builder.CreateMul(select_res, arg_mul);

            builder.CreateStore(mul_res, res);
            continue;
        } else if (!name.compare("AND_BR")) {
            input >> arg;
            Value *arg1 =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            Value *arg2 =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            input >> name;

            Value *and_res = builder.CreateAnd(builder.CreateLoad(builder.getInt1Ty(), arg1),
                                               builder.CreateLoad(builder.getInt1Ty(), arg2));
            builder.CreateCondBr(and_res, BBMap[arg], BBMap[name]);
            builder.SetInsertPoint(BBMap[arg]);

            continue;
        } else if (!name.compare("SELECT_ADD")) {
            input >> arg;
            Value *res =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            Value *arg_select1 =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            Value *arg_select2 =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            Value *arg_select3 =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            Value *arg_add =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            Value *select_res =
                builder.CreateSelect(builder.CreateLoad(builder.getInt1Ty(), arg_select1),
                                     builder.CreateLoad(builder.getInt64Ty(), arg_select2),
                                     builder.CreateLoad(builder.getInt64Ty(), arg_select3));

            Value *add_res =
                builder.CreateAdd(select_res, builder.CreateLoad(builder.getInt64Ty(), arg_add));
            builder.CreateStore(add_res, res);

            continue;
        } else if (!name.compare("GEP_SEXT_LOAD_SEXT")) {
            input >> arg;
            Value *res =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            Value *gep_arg =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            Value *sext_arg =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            Value *sext_res = builder.CreateSExt(builder.CreateLoad(builder.getInt64Ty(), sext_arg),
                                                 builder.getInt64Ty());
            Value *gep_res = builder.CreateGEP(builder.getInt8Ty(),
                                               builder.CreateLoad(ArrayTyPtr, gep_arg), sext_res);

            Value *load_res = builder.CreateLoad(builder.getInt8Ty(), gep_res);
            Value *sext_res2 = builder.CreateSExt(load_res, builder.getInt64Ty());

            builder.CreateStore(sext_res2, res);

            continue;
        } else if (!name.compare("GEP_LOAD")) {
            input >> arg;
            Value *res =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            Value *gep_arg1 =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            Value *gep_arg2 =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            Value *gep_res =
                builder.CreateGEP(builder.getInt8Ty(), builder.CreateLoad(ArrayTyPtr, gep_arg1),
                                  builder.CreateLoad(builder.getInt64Ty(), gep_arg2));

            Value *load_res = builder.CreateLoad(builder.getInt8Ty(), gep_res);
            builder.CreateStore(load_res, res);

            continue;
        } else if (!name.compare("ICMP_EQ")) {
            input >> arg;
            Value *res =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            Value *arg1 =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            Value *arg2 = builder.getInt64(std::stoll(arg));

            Value *icmp_eq_res =
                builder.CreateICmpEQ(builder.CreateLoad(builder.getInt64Ty(), arg1), arg2);
            builder.CreateStore(icmp_eq_res, res);

            continue;
        } else if (!name.compare("GEP")) {
            input >> arg;
            Value *res =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            Value *arg1 =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            Value *arg2 =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            Value *gep_res =
                builder.CreateGEP(builder.getInt8Ty(), builder.CreateLoad(ArrayTyPtr, arg1),
                                  builder.CreateLoad(builder.getInt64Ty(), arg2));
            builder.CreateStore(gep_res, res);

            continue;
        } else if (!name.compare("BR_IF")) {
            input >> arg;
            Value *arg_pred =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            input >> name;

            builder.CreateCondBr(builder.CreateLoad(builder.getInt1Ty(), arg_pred), BBMap[arg],
                                 BBMap[name]);
            builder.SetInsertPoint(BBMap[arg]);

            continue;
        } else if (!name.compare("STORE")) {
            input >> arg;
            Value *arg1 =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            Value *arg2 = builder.getInt8(std::stoll(arg));

            builder.CreateStore(arg2,
                                builder.CreateLoad(PointerType::get(builder.getInt8Ty(), 0), arg1));

            continue;
        } else if (!name.compare("SELECT")) {
            input >> arg;
            Value *res =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            Value *arg1 =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            Value *arg2 = builder.getInt64(std::stoll(arg));

            input >> arg;
            Value *arg3 = builder.getInt64(std::stoll(arg));

            Value *select_res =
                builder.CreateSelect(builder.CreateLoad(builder.getInt1Ty(), arg1), arg2, arg3);

            builder.CreateStore(select_res, res);
            continue;
        } else if (!name.compare("AND")) {
            input >> arg;
            Value *res =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            Value *arg1 =
                builder.CreateConstGEP2_64(regFileType, regFile, 0, std::stoll(arg.substr(1)));

            input >> arg;
            Value *arg2 = builder.getInt64(std::stoll(arg));

            Value *and_res =
                builder.CreateAnd(builder.CreateLoad(builder.getInt64Ty(), arg1), arg2);
            builder.CreateStore(and_res, res);
            continue;
        }

        if (builder.GetInsertBlock()) {
            // builder.CreateBr(BBMap[name]);
            // outs() << "\tbranch to " << name << "\n";
        }
        outs() << "BB " << name << "\n";
        builder.SetInsertPoint(BBMap[name]);
    }

    outs() << "\n#[LLVM IR]:\n";
    module->print(outs(), nullptr);
    outs() << "\n";
    bool verif = verifyFunction(*mainFunc, &outs());
    outs() << "[VERIFICATION] " << (!verif ? "OK\n\n" : "FAIL\n\n");

    outs() << "\n#[Running code]\n";
    InitializeNativeTarget();
    InitializeNativeTargetAsmPrinter();

    ExecutionEngine *ee = EngineBuilder(std::unique_ptr<Module>(module)).create();
    ee->InstallLazyFunctionCreator([=](const std::string &fnName) -> void * {
        if (fnName == "_do_SIM_PUT_DISPLAY_PIXEL") {
            return reinterpret_cast<void *>(do_SIM_PUT_DISPLAY_PIXEL);
        } else if (fnName == "_do_SIM_FLUSH") {
            return reinterpret_cast<void *>(do_SIM_FLUSH);
        } else if (fnName == "_do_REG_DUMP") {
            return reinterpret_cast<void *>(do_REG_DUMP);
        } else if (fnName == "_do_NEIGHBORS") {
            return reinterpret_cast<void *>(do_NEIGHBORS);
        } else {
            std::cout << "UNKNOWN FUNCTION: " << fnName << '\n';
            return nullptr;
        }
    });

    ee->addGlobalMapping(regFile, (void *)REG_FILE);
    ee->finalizeObject();

    simInit();

    ArrayRef<GenericValue> noargs;
    ee->runFunction(mainFunc, noargs);
    outs() << "#[Code was run]\n";

    simExit();
    return EXIT_SUCCESS;
}

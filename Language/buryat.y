%{
    #include "../SDL/sim.hpp"

    #include <stdio.h>
    #include <stdlib.h>
    #include <unordered_map>
    #include <string>
    #include <vector>
    #include <assert.h>

    #include "llvm/IR/Module.h"
    #include "llvm/IR/LLVMContext.h"
    #include "llvm/IR/IRBuilder.h"
    #include "llvm/IR/GlobalVariable.h"
    #include "llvm/IR/Value.h"
    #include "llvm/ExecutionEngine/GenericValue.h"
    #include "llvm/ExecutionEngine/ExecutionEngine.h"
    #include "llvm/IR/Verifier.h"
    #include "llvm/Support/TargetSelect.h"

    using namespace llvm;

    #define YYSTYPE llvm::Value*

    int yyparse();
    int yylex();
    void yyerror(char *error) {
        fprintf(stderr, "%s\n", error);
    }

    LLVMContext context;
    llvm::IRBuilder<>* builder;
    llvm::Module* module;
    Function *currentFunction;

    FunctionCallee simPutDisplayPixelFunc;
    FunctionCallee simFlushFunc;

    size_t if_counter = 0;

    struct ValueT {
        llvm::GlobalVariable* llvm;
        int number;
    };

    struct ArrayT {
        llvm::GlobalVariable* llvm;
        int *array;
        size_t size;
    };

    std::unordered_map<std::string, ValueT> Identifiers;
    std::unordered_map<std::string, ArrayT> Arrays;
    std::unordered_map<std::string, llvm::BasicBlock*> BBs;

    std::string convertCyrillic(const char* cyrillic_string);
%}

%token NUMBER
%token IDENTIFIER
%token LESS LESS_EQUAL GREATER GREATER_EQUAL EQUAL NOT_EQUAL
%token MUL DIV
%token PLUS MINUS
%token FUNCTION_BEGIN FUNCTION_END
%token FUNCTION_CALL
%token JUMP
%token IF_BEGIN IF_THEN ELSE
%token PUT_PIXEL FLUSH
%token AND OR

%%


START:    PROGRAM { YYACCEPT; }
;

PROGRAM:    VARIABLE_DECLARATION { outs() << "VARIABLE DECLARATION\n"; }
    |   FUNCTION_DECLARATION { outs() << "FUNCTION DECLARATION\n"; }
    |   PROGRAM VARIABLE_DECLARATION { outs() << "PROGRAM VARIABLE_DECLARATION\n"; }
    |   PROGRAM FUNCTION_DECLARATION { outs() << "PROGRAM FUNCTION_DECLARATION\n"; }
;

VARIABLE_DECLARATION: IDENTIFIER '=' NUMBER ';' {
    outs() << "INT DECLARATION\n";
    module->getOrInsertGlobal((char*) $1, builder->getInt32Ty());
    Identifiers[(char*) $1] = {module->getNamedGlobal((char*) $1), atoi((char*) $3)};
}
|   IDENTIFIER '[' NUMBER ']' ';' {
    outs() << "ARRAY DECLARATION\n";
    size_t array_size = atoi((char*) $3);

    ArrayType *arrayType = ArrayType::get(builder->getInt32Ty(), array_size);
    module->getOrInsertGlobal((char*) $1, arrayType);

    int *array = new int[array_size]();
    Arrays[(char*) $1] = {module->getNamedGlobal((char*) $1), array, array_size};
}
;

FUNCTION_DECLARATION:   FUNCTION_BEGIN IDENTIFIER {
    Function *func = module->getFunction((char*)$2);
    if (func == nullptr) {
        FunctionType *funcType = FunctionType::get(builder->getVoidTy(), false);
        func = Function::Create(funcType, Function::ExternalLinkage, (char*)$2, module);
    }
    currentFunction = func;

    BasicBlock *entryBB = BasicBlock::Create(context, "түрүүшын", currentFunction);
    builder->SetInsertPoint(entryBB);
}
    BODY FUNCTION_END {
    builder->CreateRetVoid();
}
;

BODY:   ASSIGNMENT {}
    | IF_STATEMENT {}
    | LABEL {}
    | JUMP_STATEMENT {}
    | FUNCTION_CALL_STATEMENT {}
    | PUT_PIXEL_STATEMENT {}
    | FLUSH_STATEMENT {}
    | BODY FUNCTION_CALL_STATEMENT {}
    | BODY ASSIGNMENT {}
    | BODY JUMP_STATEMENT {}
    | BODY LABEL {}
    | BODY IF_STATEMENT {}
    | BODY PUT_PIXEL_STATEMENT {}
    | BODY FLUSH_STATEMENT {}
;

ASSIGNMENT: MODIFIABLE_PRIMARY '=' EXPRESSION ';' { builder->CreateStore($3, $1); }
;

JUMP_STATEMENT:   JUMP IDENTIFIER ';' {
    if (!BBs.contains((char*) $2)) {
        BBs.emplace((char*) $2, BasicBlock::Create(context, (char*) $2, currentFunction));
    }
    BasicBlock *BB = BBs[(char*) $2];
    builder->CreateBr(BB);
}
;

LABEL:  IDENTIFIER ':' {
    if (!BBs.contains((char*) $1)) {
        BBs.emplace((char*) $1, BasicBlock::Create(context, (char*) $1, currentFunction));
    }
    BasicBlock *BB = BBs[(char*) $1];
    builder->SetInsertPoint(BB);
}
;

IF_STATEMENT: IF_BEGIN RELATION IF_THEN IDENTIFIER ELSE IDENTIFIER {
    outs() << "IF STATEMENT\n";
    if (!BBs.contains((char*) $4)) {
        BBs.emplace((char*) $4, BasicBlock::Create(context, (char*) $4, currentFunction));
    }

    if (!BBs.contains((char*) $6)) {
        BBs.emplace((char*) $6, BasicBlock::Create(context, (char*) $6, currentFunction));
    }

    Value* cond = builder->CreateICmpNE($2, builder->getInt32(0));
    builder->CreateCondBr(cond, BBs[(char*) $4], BBs[(char*) $6]);
}
;

FUNCTION_CALL_STATEMENT:    FUNCTION_CALL IDENTIFIER ';' {
    Function *func = module->getFunction((char*) $2);
    if (func == nullptr) {
        FunctionType *funcType = FunctionType::get(builder->getVoidTy(), false);
        func = Function::Create(funcType, Function::ExternalLinkage, (char*)$2, module);
    }
    builder->CreateCall(func);
}
;

PUT_PIXEL_STATEMENT:    PUT_PIXEL '(' EXPRESSION ',' EXPRESSION ',' EXPRESSION ',' EXPRESSION ')' ';' {
    outs() << "PUT PIXEL\n";
    Value *args[] = {$3, $5, $7, $9};
    outs() << "TRY TO CALL simPutDisplayPixelFunc\n";
    if (simPutDisplayPixelFunc.getCallee() == nullptr) {
        outs() << "NULL!\n";
        exit(EXIT_FAILURE);
    }
    builder->CreateCall(simPutDisplayPixelFunc, args);
}
;

FLUSH_STATEMENT:    FLUSH ';' {
    outs() << "FLUSH\n";
    builder->CreateCall(simFlushFunc);
}

RELATION: EXPRESSION { outs() << "EXPRESSION\n"; }
    | RELATION AND EXPRESSION { outs() << "AND EXPRESSION\n"; $$ = builder->CreateAnd($1, $3);}
    | RELATION OR EXPRESSION  { $$ = builder->CreateOr($1, $3); }
;

EXPRESSION: SIMPLE { outs() << "SIMPLE EXPRESSION\n"; }
    | EXPRESSION LESS SIMPLE { $$ = builder->CreateZExt(builder->CreateICmpSLT($1, $3), builder->getInt32Ty()); }
    | EXPRESSION LESS_EQUAL SIMPLE { $$ = builder->CreateZExt(builder->CreateICmpSLE($1, $3), builder->getInt32Ty()); }
    | EXPRESSION GREATER SIMPLE { $$ = builder->CreateZExt(builder->CreateICmpSGT($1, $3), builder->getInt32Ty()); }
    | EXPRESSION GREATER_EQUAL SIMPLE { $$ = builder->CreateZExt(builder->CreateICmpSGE($1, $3), builder->getInt32Ty()); }
    | EXPRESSION EQUAL SIMPLE { $$ = builder->CreateZExt(builder->CreateICmpEQ($1, $3), builder->getInt32Ty()); }
    | EXPRESSION NOT_EQUAL SIMPLE { $$ = builder->CreateZExt(builder->CreateICmpNE($1, $3), builder->getInt32Ty()); }
;

SIMPLE: SUMMAND
    | SIMPLE PLUS SUMMAND  { $$ = builder->CreateAdd($1, $3); }
    | SIMPLE MINUS SUMMAND { $$ = builder->CreateSub($1, $3); }
;

SUMMAND: FACTOR
    | SUMMAND MUL FACTOR { $$ = builder->CreateMul($1, $3); }
    | SUMMAND DIV FACTOR { $$ = builder->CreateSDiv($1, $3); }
;

FACTOR: PRIMARY { $$ = $1; }
    | '(' RELATION ')' { $$ = $2; }
    | MINUS PRIMARY { $$ = builder->CreateNeg($2); }
;

PRIMARY: NUMBER {
    outs() << "NUMBER " << atoi((char*) $1) << "\n";
    $$ = builder->getInt32(atoi((char*) $1));
} | MODIFIABLE_PRIMARY { $$ = builder->CreateLoad(builder->getInt32Ty(), $1); }
;

MODIFIABLE_PRIMARY: IDENTIFIER {
    outs() << "IDETIFIER: " << (char*) $1 << "\n";
    $$ = builder->CreateConstGEP1_32(builder->getInt32Ty(), Identifiers[(char*) $1].llvm, 0);
}
| IDENTIFIER '[' EXPRESSION ']' {
    outs() << "IDENTIFIER + EXPRESSION\n";

    auto array = Arrays[(char*) $1];
    ArrayType *arrayType =  ArrayType::get(builder->getInt32Ty(), array.size);

    std::vector<Value*> gepArgs;
    gepArgs.push_back(builder->getInt32(0));
    gepArgs.push_back($3);

    $$ = builder->CreateGEP(arrayType, array.llvm, gepArgs);
}
;

%%

int main(int argc, char **argv)
{
    if (argv[1] == NULL) {
        printf("Need input program\n");
        return EXIT_FAILURE;
    }
    extern FILE *yyin;
    yyin = fopen(argv[1], "r");

    InitializeNativeTarget();
    InitializeNativeTargetAsmPrinter();

    module = new Module("top", context);
    builder = new IRBuilder<> (context);




    Type *voidType = Type::getVoidTy(context);
    ArrayRef<Type *> int32x4Types = {Type::getInt32Ty(context), Type::getInt32Ty(context),
                                     Type::getInt32Ty(context), Type::getInt32Ty(context)};

    FunctionType *voidFuncType = FunctionType::get(voidType, false);
    FunctionType *int32x4FuncType = FunctionType::get(voidType, int32x4Types, false);

    simPutDisplayPixelFunc = module->getOrInsertFunction("simPutDisplayPixel", int32x4FuncType);
    simFlushFunc = module->getOrInsertFunction("simFlush", voidFuncType);

    outs() << "Before yyparse\n";
    yyparse();

    outs() << "[LLVM IR]:\n";
    module->print(outs(), nullptr);
    outs() << "\n";
    bool verif = verifyModule(*module, &outs());
    outs() << "[VERIFICATION] " << (!verif ? "OK\n\n" : "FAIL\n\n");

    // Interpreter of LLVM IR
    outs() << "[EE] Run\n";
	ExecutionEngine *ee = EngineBuilder(std::unique_ptr<Module>(module)).create();

    ee->InstallLazyFunctionCreator([=](const std::string &fnName) -> void * {
        if (fnName == "_simPutDisplayPixel") {
            return reinterpret_cast<void *>(simPutDisplayPixel);
        } else if (fnName == "_simFlush") {
            return reinterpret_cast<void*>(simFlush);
        }
        return nullptr;
    });

    for (auto& value : Identifiers) {
        ee->addGlobalMapping(value.second.llvm, &value.second.number);
    }
    for (auto& array : Arrays) {
        ee->addGlobalMapping(array.second.llvm, array.second.array);
    }

    ee->finalizeObject();

    simInit();

	std::vector<GenericValue> noargs;
    Function *mainFunc = module->getFunction("аба");
    if (mainFunc == nullptr) {
	    outs() << "Can't find main\n";
        return -1;
    }
	ee->runFunction(mainFunc, noargs);
    outs() << "[EE] Done\n";

    for (auto& id : Identifiers) {
        outs() << id.first << " = " <<  id.second.number << "\n";
    }

    outs() << "\n";

    for (auto &array : Arrays) {
        for (size_t i = 0; i < array.second.size; ++i) {
            outs() << array.first << "[" << i << "] = " << array.second.array[i] << "\n";
        }
        outs() << "\n";
        delete [] array.second.array;
    }

    simExit();
    return 0;
}

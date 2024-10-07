#include <string>

#include "llvm/IR/Module.h"
#include "llvm/IR/PassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"

namespace llvm {

class InstructionsInfoPass : public PassInfoMixin<InstructionsInfoPass> {
   public:
    PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM) {
        LLVMContext &Ctx = M.getContext();
        IRBuilder<> builder(Ctx);

        Type *retType = Type::getVoidTy(Ctx);
        ArrayRef<Type *> callParamTypes = {builder.getInt8Ty()->getPointerTo(),
                                           builder.getInt8Ty()->getPointerTo()};
        FunctionType *callLogFuncType = FunctionType::get(retType, callParamTypes, false);

        FunctionCallee callLogFunc = M.getOrInsertFunction("callLogger", callLogFuncType);
        for (auto &F : M) {
            if (F.getName() == "callLogger") {
                continue;
            }
            for (auto &B : F) {
                for (auto &I : B) {
                    if (dyn_cast<PHINode>(&I) != nullptr) {
                        continue;
                    }
                    builder.SetInsertPoint(&I);
                    Value *instrName = builder.CreateGlobalStringPtr(I.getOpcodeName());

                    for (auto &&user = I.user_begin(); user != I.user_end(); ++user) {
                        auto instrUser = cast<Instruction>(*user);
                        Value *instrUserName = builder.CreateGlobalStringPtr(instrUser->getOpcodeName());
                        Value *args[] = {instrName, instrUserName};
                        builder.CreateCall(callLogFunc, args);
                    }
                }
            }
        }
        outs() << "\n";
        return PreservedAnalyses::none();
    }

    static bool isRequired() { return true; }
};

PassPluginLibraryInfo getPassPluginInfo() {
    const auto callback = [](PassBuilder &PB) {
        PB.registerOptimizerLastEPCallback([&](ModulePassManager &MPM, auto) {
            MPM.addPass(InstructionsInfoPass{});
            return true;
        });
    };

    return {LLVM_PLUGIN_API_VERSION, "InstructionsInfoPlugin", "0.0.1", callback};
}

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() {
    return getPassPluginInfo();
}
}  // namespace llvm

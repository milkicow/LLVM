# ASM2IR
Generate LLVM IR from my assembly language

### Run:
```
clang++ $(llvm-config --cppflags --ldflags --libs) ../SDL/sim.cpp asm2ir.cpp -lSDL2 -o asm2ir
./asm2ir app.s > out.txt
```

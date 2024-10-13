# Game of life

Simple graphical application. Benchmark for llvm practice.


## LLVM IR generation
```
clang++ app.cpp -O1 -S -emit-llvm -o app.ll 
```
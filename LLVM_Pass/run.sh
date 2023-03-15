cd llvm-pass-skeleton && cd build
CC=clang-11 CXX=clang++-11 cmake ..
make
cd ../../
clang-11 -Xclang -load -Xclang llvm-pass-skeleton/build/skeleton/libSkeletonPass.so calc.c -emit-llvm -S -o calc.ll
clang-11 -Xclang -load -Xclang llvm-pass-skeleton/build/skeleton/libSkeletonPass.so calc.c
./a.out 

cd llvm-pass-skeleton && cd build
CC=clang-11 CXX=clang++-11 cmake ..
make
cd ../../
clang-11 -Xclang -load -Xclang llvm-pass-skeleton/build/skeleton/libSkeletonPass.so fact.c -emit-llvm -S -o fact.ll
clang-11 -Xclang -load -Xclang llvm-pass-skeleton/build/skeleton/libSkeletonPass.so fact.c log.cpp
./a.out 4

cd llvm-pass-skeleton && cd build
CC=clang-11 CXX=clang++-11 cmake ..
make
cd ../../
clang-11 -Xclang -load -Xclang llvm-pass-skeleton/build/skeleton/libSkeletonPass.so test_progs/fact.c -emit-llvm -S -o fact.ll
clang-11 -Xclang -load -Xclang llvm-pass-skeleton/build/skeleton/libSkeletonPass.so test_progs/fact.c log.cpp
./a.out 4 > info/dynamic_info.txt

cd Connector 
g++ connect_info.cpp -std=c++17 -o connect_info
./connect_info

cd ../info

dot info.dot -T pdf -o info.pdf
open info.pdf

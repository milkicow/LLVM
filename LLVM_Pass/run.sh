test_prog='hello' # write only name without extension
test_prog.c="${test_prog}.c"
test_prog.ll="${test_prog}.ll"

cd llvm-pass-skeleton && cd build
cmake ..
make
cd ../../
clang-11 -Xclang -load -Xclang llvm-pass-skeleton/build/skeleton/libSkeletonPass.so test_progs/$test_prog.c -emit-llvm -S -o $test_prog.ll
clang-11 -Xclang -load -Xclang llvm-pass-skeleton/build/skeleton/libSkeletonPass.so test_progs/$test_prog.c log.cpp
./a.out 4 > info/dynamic_info.txt

cd Connector 
g++ connect_info.cpp -std=c++17 -o connect_info
./connect_info

cd ../info

dot info.dot -T pdf -o info.pdf
#open info.pdf

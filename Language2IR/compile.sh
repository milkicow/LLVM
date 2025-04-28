#!/bin/bash

bison lang.y -d || exit 1
flex lang.lex || exit 1

clang++ -std=c++20 lex.yy.c lang.tab.c ../SDL/sim.cpp $(llvm-config --cppflags --ldflags --libs) -lSDL2 || exit 1

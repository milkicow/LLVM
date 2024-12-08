#!/bin/bash

bison buryat.y -d || exit 1
flex buryat.lex || exit 1

clang++ -std=c++20 lex.yy.c buryat.tab.c ../SDL/sim.cpp $(llvm-config --cppflags --ldflags --libs) -lSDL2 || exit 1

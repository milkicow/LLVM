# Buryat language

The repository contains the language that will be translated into LLVM IR.
It has a similar grammar as my Buryat language, but it does not support Cyrillic, which will help simplify the creation of an IR for debugging - without encoded characters in the names.

### Generate LLVM IR from my language:
```
bash compile.sh
./a.out game_of_life.lang > game_of_life.ll
```

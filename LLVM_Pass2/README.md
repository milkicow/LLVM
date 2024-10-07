# LLVM Pass

This LLVM Pass logs instructions with their users.

### How to use:

Create pass plugin
```
clang++ Pass_collect_instr.cpp -undefined dynamic_lookup -fPIC -shared -I$(llvm-config --includedir) -o libPass.so
```
Apply pass only for app.c file. Statistic will be collected only from this file
```
clang -fpass-plugin=./libPass.so ../SDL/app.c -O2 -c
```
Compile and run application
```
clang ../SDL/main.c ../SDL/sim.c logger.c app.o -lSDL2
./a.out > tmp
```

Collect statistics with python script. Present it in bar chart
```
python3 present.py > instructions_stat.txt
```

![](stat.png)
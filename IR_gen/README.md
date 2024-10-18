# IR generator

This application generates IR of my SDL conwaylife application

### Run:
```
clang++ $(llvm-config --cppflags --ldflags --libs) ../SDL/sim.cpp ir_gen.cpp -lSDL2
```

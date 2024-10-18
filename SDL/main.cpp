#include "sim.hpp"

int main(void) {
    simInit();
    app();
    simExit();
    return 0;
}
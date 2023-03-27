#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int func(int arg1, int arg2) {
    return arg1 + arg2 * 2;
}

int main() {
    return func(3, 4);
}
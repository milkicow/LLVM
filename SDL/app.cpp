#include "sim.hpp"

static void swap(char **arr1, char **arr2) {
    char *tmp = *arr1;
    *arr1 = *arr2;
    *arr2 = tmp;
}

static void step(char *alive, char *alive_next) {
    int alive_neighbors = 0;
    for (int y = 0; y < Y_SIZE; ++y) {
        for (int x = 0; x < X_SIZE; ++x) {
            alive_neighbors = neighbors(alive, x, y);

            if (alive[y * X_SIZE + x]) {
                if (alive_neighbors == 2 || alive_neighbors == 3) {
                    alive_next[y * X_SIZE + x] = 1;
                } else {
                    alive_next[y * X_SIZE + x] = 0;
                }
            } else {
                if (alive_neighbors == 3) {
                    alive_next[y * X_SIZE + x] = 1;
                } else {
                    alive_next[y * X_SIZE + x] = 0;
                }
            }
        }
    }
}

void app() {
    char a[X_SIZE * Y_SIZE] = {};

    a[1 * X_SIZE + 2] = 1;
    a[2 * X_SIZE + 3] = 1;
    a[2 * X_SIZE + 4] = 1;
    a[3 * X_SIZE + 2] = 1;
    a[3 * X_SIZE + 3] = 1;
    // a[1 * X_SIZE + 26] = 1;
    // a[2 * X_SIZE + 24] = 1;
    // a[2 * X_SIZE + 26] = 1;
    // a[3 * X_SIZE + 14] = 1;
    // a[3 * X_SIZE + 15] = 1;
    // a[3 * X_SIZE + 22] = 1;
    // a[3 * X_SIZE + 23] = 1;
    // a[3 * X_SIZE + 36] = 1;
    // a[3 * X_SIZE + 37] = 1;
    // a[4 * X_SIZE + 13] = 1;
    // a[4 * X_SIZE + 17] = 1;
    // a[4 * X_SIZE + 22] = 1;
    // a[4 * X_SIZE + 23] = 1;
    // a[4 * X_SIZE + 36] = 1;
    // a[4 * X_SIZE + 37] = 1;
    // a[5 * X_SIZE + 2] = 1;
    // a[5 * X_SIZE + 3] = 1;
    // a[5 * X_SIZE + 12] = 1;
    // a[5 * X_SIZE + 18] = 1;
    // a[5 * X_SIZE + 22] = 1;
    // a[5 * X_SIZE + 23] = 1;
    // a[6 * X_SIZE + 2] = 1;
    // a[6 * X_SIZE + 3] = 1;
    // a[6 * X_SIZE + 12] = 1;
    // a[6 * X_SIZE + 16] = 1;
    // a[6 * X_SIZE + 18] = 1;
    // a[6 * X_SIZE + 19] = 1;
    // a[6 * X_SIZE + 24] = 1;
    // a[6 * X_SIZE + 26] = 1;
    // a[7 * X_SIZE + 12] = 1;
    // a[7 * X_SIZE + 18] = 1;
    // a[7 * X_SIZE + 26] = 1;
    // a[8 * X_SIZE + 13] = 1;
    // a[8 * X_SIZE + 17] = 1;
    // a[9 * X_SIZE + 14] = 1;
    // a[9 * X_SIZE + 15] = 1;

    char a_next[X_SIZE * Y_SIZE] = {};

    char *alive = a;
    char *alive_next = a_next;

    for (int s = 0; s < 1000; ++s) {
        for (int y = 0; y < Y_SIZE; ++y) {
            for (int x = 0; x < X_SIZE; ++x) {
                if (!alive[y * X_SIZE + x]) {
                    simPutDisplayPixel(x, y, 0xFFFFFFFF, PIXEL_SCALE);
                } else {
                    simPutDisplayPixel(x, y, 0xFF000000, PIXEL_SCALE);
                }
            }
        }
        simFlush();

        step(alive, alive_next);
        swap(&alive, &alive_next);
    }
}

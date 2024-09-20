#include "sim.h"

#define X_SIZE 50
#define Y_SIZE 25

int neighbors(char alive[Y_SIZE][X_SIZE], int cur_x, int cur_y) {
    int n = 0;

    int table_x = 0;
    int table_y = 0;
    for (int y = cur_y - 1; y <= cur_y + 1; ++y) {
        for (int x = cur_x - 1; x <= cur_x + 1; ++x) {
            table_x = x;
            table_y = y;

            if (x < 0) {
                table_x = X_SIZE + x;
            } else if (x >= X_SIZE) {
                table_x = x - X_SIZE;
            }

            if (y < 0) {
                table_y = Y_SIZE + y;
            } else if (y >= Y_SIZE) {
                table_y = y - Y_SIZE;
            }
            if (x == cur_x && y == cur_y) {
                continue;
            }

            n += alive[table_y][table_x];
        }
    }
    return n;
}

void copy(char alive[Y_SIZE][X_SIZE], char alive_next[Y_SIZE][X_SIZE]) {
    for (int y = 0; y < Y_SIZE; ++y) {
        for (int x = 0; x < X_SIZE; ++x) {
            alive[y][x] = alive_next[y][x];
            alive_next[y][x] = 0;
        }
    }
}

void step(char alive[Y_SIZE][X_SIZE], char alive_next[Y_SIZE][X_SIZE]) {
    int alive_neighbors = 0;
    for (int y = 0; y < Y_SIZE; ++y) {
        for (int x = 0; x < X_SIZE; ++x) {
            alive_neighbors = neighbors(alive, x, y);

            if (alive[y][x]) {
                if (alive_neighbors == 2 || alive_neighbors == 3) {
                    alive_next[y][x] = 1;
                } else {
                    alive_next[y][x] = 0;
                }
            } else {
                if (alive_neighbors == 3) {
                    alive_next[y][x] = 1;
                } else {
                    alive_next[y][x] = 0;
                }
            }
        }
    }
    copy(alive, alive_next);
}

void app() {
    char alive[Y_SIZE][X_SIZE] = {
        // // Glider
        // {0, 0, 0, 0, 0},
        // {0, 1, 0, 0, 0},
        // {0, 0, 1, 1, 0},
        // {0, 1, 1, 0, 0},

        // // Heavy-weight spaceship
        // {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0},
        // {0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 1},
        // {0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0},
        // {0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0},

        // Gosper glider gun
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
         0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
         0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
         0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0,
         0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0,
         0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0},
        {0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0,
         0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1,
         0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0,
         0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0,
         0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0,
         0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    };
    char alive_next[Y_SIZE][X_SIZE] = {};

    for (int s = 0; s < 1000; ++s) {
        for (int y = 0; y < Y_SIZE; ++y) {
            for (int x = 0; x < X_SIZE; ++x) {
                if (!alive[y][x]) {
                    simPutDisplayPixel(x, y, 0xFFFFFFFF, 40);
                } else {
                    simPutDisplayPixel(x, y, 0xFF000000, 40);
                }
            }
        }
        simFlush();
        step(alive, alive_next);
    }
}

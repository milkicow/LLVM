#include "sim.h"

#include <SDL2/SDL.h>
#include <assert.h>
#include <stdlib.h>
#include <time.h>

#define FRAME_TICKS 120

static SDL_Renderer *Renderer = NULL;
static SDL_Window *Window = NULL;
static Uint32 Ticks = 0;

void simInit() {
    SDL_Init(SDL_INIT_VIDEO);
    SDL_CreateWindowAndRenderer(SIM_X_SIZE, SIM_Y_SIZE, 0, &Window, &Renderer);
    SDL_SetRenderDrawColor(Renderer, 0, 0, 0, 0);
    SDL_RenderClear(Renderer);
    srand(time(NULL));
    simFlush();
}

void simExit() {
    SDL_Event event;
    while (1) {
        if (SDL_PollEvent(&event) && event.type == SDL_QUIT) break;
    }
    SDL_DestroyRenderer(Renderer);
    SDL_DestroyWindow(Window);
    SDL_Quit();
}

void simFlush() {
    SDL_PumpEvents();
    assert(SDL_TRUE != SDL_HasEvent(SDL_QUIT) && "User-requested quit");
    Uint32 cur_ticks = SDL_GetTicks() - Ticks;
    if (cur_ticks < FRAME_TICKS) {
        SDL_Delay(FRAME_TICKS - cur_ticks);
    }
    SDL_RenderPresent(Renderer);
}

void simPutDisplayPixel(int cur_x, int cur_y, int argb, int scale) {
    assert(0 <= cur_x && cur_x < SIM_X_SIZE && "Out of range");
    assert(0 <= cur_y && cur_y < SIM_Y_SIZE && "Out of range");

    Uint8 a = argb >> 24;
    Uint8 r = (argb >> 16) & 0xFF;
    Uint8 g = (argb >> 8) & 0xFF;
    Uint8 b = argb & 0xFF;

    for (int y = cur_y * scale; y < (cur_y + 1) * scale; ++y) {
        for (int x = cur_x * scale; x < (cur_x + 1) * scale; ++x) {
            SDL_SetRenderDrawColor(Renderer, r, g, b, a);
            SDL_RenderDrawPoint(Renderer, x, y);
        }
    }
}

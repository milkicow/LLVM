#define SIM_X_SIZE 2000
#define SIM_Y_SIZE 1000
#define PIXEL_SCALE 40

#define X_SIZE 50
#define Y_SIZE 25

extern "C" void simFlush();
extern "C" void simPutDisplayPixel(int x, int y, int argb, int scale);
extern "C" int neighbors(char *alive, int cur_x, int cur_y);

extern void simInit();
extern void app();
extern void simExit();

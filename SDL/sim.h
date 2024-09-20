#define SIM_X_SIZE 2000
#define SIM_Y_SIZE 1000

void simFlush();
void simPutDisplayPixel(int x, int y, int argb, int scale);

extern void simInit();
extern void app();
extern void simExit();

#include <stdio.h>

extern "C" void callLogger(const char *instrName, const char *instrUserName){
    printf("%s <- %s\n", instrName, instrUserName);
}
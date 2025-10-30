#include <stdio.h>
#include <math.h>
#include <stdlib.h>

int dec2hex(unsigned long long decimal, int bits) {
    if (bits == 32) {
        printf("%08llX \n", decimal);
        return 0;
    } if (bits == 64) {
        printf("%016llX \n", decimal);
        return 0;
    } else {
        printf("Improper number of bits \n");
        return 1;
    }
}

int main(int argc, char *argv[]) {
    int bits = 32;
    if (argc < 2) {
        printf("Arguments must include decimal, and optionally number of bits (32 or 64) \n");
        return 1;
    }
    if (argc > 2) {
        bits = atoi(argv[2]);
    }
    dec2hex(strtoull(argv[1], NULL, 10), bits);
    return 0;
}
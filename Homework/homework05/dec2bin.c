#include <stdio.h>
#include <math.h>
#include <stdlib.h>


int dec2bin(int decimal) {
    char binary_response[33];
    binary_response[32] = '\0';
    for (int pointer = 31; pointer > -1 ; pointer--) {
        if (decimal % 2 == 1) {
            binary_response[pointer] = '1';
        } else {
            binary_response[pointer] = '0';
        }
        decimal = decimal/2;
    }
    printf("%s \n", binary_response);
    return 0;
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Decimal number must follow file name \n");
        return 1;
    }
    dec2bin(atoi(argv[1]));
    return 0;
}
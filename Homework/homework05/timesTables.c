#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

int timeTables(int n) {
    int length = n - 1;
    int times_table[length];
    for (int i = 0; i <= length; i++) {
        times_table[i] = 1 + i;
    }
    for (int j = 0; j <= length; j++) {
        printf("\n");
        for (int i = 0; i <= length; i++) {
            int item = times_table[j] * times_table[i];
            if (item != 1) {
                printf("%6d",item);
            } else {
                printf("%6s"," ");
            }
        }
    }
    printf("\n");
    return 0;
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Length of timetable must be in argument\n");
        return 1;
    }
    int n = atoi(argv[1]);
    if (n < 2) {
        printf("Length should be greater than 2");
        return 1;
    }
    timeTables(n);
    return 0;
}

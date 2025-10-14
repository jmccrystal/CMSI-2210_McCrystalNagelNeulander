1. AND/OR/NOT X := (B and C) or A, Y := not-A or C

2. JPEG in directory

3.

4.

#include <stdio.h>

int main(void) {
    int N;
    printf("Enter a positive integer (N): ");
    if (scanf("%d", &N) != 1) {
        printf("Error: Invalid input.\n");
        return 1;
    }
    if (N <= 0) {
        printf("N must be greater than zero.\n");
        return 1;
    }
    for (int i = 1; i <= N; i++) {
        if (i % 3 == 0 && i % 5 == 0) {
            printf("fizz-buzz\n");
        } else if (i % 3 == 0) {
            printf("fizz\n");
        } else if (i % 5 == 0) {
            printf("buzz\n");
        } else {
            printf("%d\n", i);
        }
    }
    return 0;
}

5.

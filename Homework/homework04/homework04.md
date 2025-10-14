1. AND/OR/NOT X := (B and C) or A, Y := not-A or C

2. JPEG in directory

3a. Register AND 0xAAAAAAAA

b. Register OR 0x00000007

c. Register AND 0x00000007

d. Register OR 0xFFFFFFFF

e. Register XOR 0xC0000000

f. Regiser AND 0xFFFFFFF8

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
0x0000            JMP     start
0x0001    total:  0
0x0002    limit:  256
0x0003    one:    1
0x0004    start:  LOAD    [total]
0x0005            WRITE   8
0x0006          ADD     [one]
0x0007            STORE   [total]
0x0008            SUB     [limit]
0x0009            JLZ     start
0x000A    end:    JMP     end

6.  
0x0000:  C0000004
0x0001:  00000000
0x0002:  00000100
0x0003:  00000001
0x0004:  00000001
0x0005:  30000008
0x0006:  40000003
0x0007:  10000001
0x0008:  50000002
0x0009:  E0000004
0x000A:  C000000A
7. 

1. AND/OR/NOT X := (B and C) or A, Y := not-A or C
   NAND X := (A NAND A) NAND (B NAND C), Y=: A NAND (C NAND C)

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
    int limit;
    printf("Enter a positive integer: ");
    if (scanf("%d", &limit) != 1) {
        printf("Error: Invalid input.\n");
        return 1;
    }
    if (limit <= 0) {
        printf("Input must be greater than zero.\n");
        return 1;
    }
    for (int i = 1; i <= limit; i++) {
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
        JMP     start
total:  0
limit:  256
one:    1
start:  LOAD    [total]
        WRITE   0x8
        ADD     [one]
        STORE   [total]
        SUB     [limit]
        JLZ     start
end:    JMP     end

6.  
C0000004
00000000
00000100
00000001
00000001
30000008
40000003
10000001
50000002
E0000004
C000000A

7. 
        JMP     start
num1:   0
num2:   0
temp:   0
start:  READ    0x100
        STORE   [num1]
        READ    0x100
        STORE   [num2]
check:  LOAD    [num2]
        JZ      done  
        STORE   [temp]
        LOAD    [num1]
        MOD     [num2]
        STORE   [num2]
        LOAD    [temp]
        STORE   [num1]
        JMP     check
done:   LOAD    [num1]
        WRITE   0x200
end:    JMP     end

8.
temp1:  0
temp2:  0
        STORE   [temp1]
        LOAD    [0x30AA]
        STORE   [temp2]
        LOAD    [temp1]
        STORE   [0x30AA]
        LOAD    [temp2]

9.
JGZ   0x837BBE1
JZ    0x837BBE1

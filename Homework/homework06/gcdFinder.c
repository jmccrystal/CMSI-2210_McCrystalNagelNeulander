#include <stdio.h>
#include <assert.h>

extern long findGCD(long a, long b);

int main() {

    long num1, num2;
    
    //Input format is "num1 num2"
    printf("Enter two numbers (separated by a space) to find their GCD: ");
    if (scanf("%ld %ld", &num1, &num2) == 2) {
        long result = findGCD(num1, num2);
        printf("GCD of %ld and %ld is: %ld\n", num1, num2, result);
    }

    return 0;
}
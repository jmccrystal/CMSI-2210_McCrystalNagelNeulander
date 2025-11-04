#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <time.h>

int holdit() {
    printf("This program will count how long you can hold your breath, press ENTER to begin, and ENTER when you are out of breath: \n");
    char enter;
    scanf("%c",&enter);
    time_t start_time = time(NULL);
    scanf("%c",&enter);
    time_t end_time = time(NULL);
    printf("You lasted %ld seconds \n", end_time-start_time); 
    return 0;
}

int main(int argc, char *argv[]) {
    holdit();
    return 0;
}

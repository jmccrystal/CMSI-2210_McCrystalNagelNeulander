#include <stdio.h>
#include <time.h>

int main() {
    printf("This program will time how long you can hold your breath. Take a deep breath, then press the Enter key. When you absolutely have to exhale, press the enter key again. The duration will be displayed in minutes and seconds.");
    int c;
    while ((c = getchar()) != '\n' && c != EOF) // wait for user to press enter
    ;
    time_t now = time(NULL); // begin timer
    while ((c = getchar()) != '\n' && c != EOF)
    ;
    time_t end = time(NULL);
    printf("You held your breath for %d minutes and %d seconds.\n", (int)(end - now) / 60, (int)(end-now) % 60);
    return 0;
}
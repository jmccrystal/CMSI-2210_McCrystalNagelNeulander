#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

int wordcount(char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error opening file\n");
        return 1;
    }
    int count = 0;
    int word = 0;
    int ch = fgetc(file);
    while (ch != -1) {
        if (isspace(ch) && word == 1) {
            count += 1;
            word = 0;
        } else if (!isspace(ch)) {
            word = 1;
        }
        ch = fgetc(file);
    }
    if (word) {
        count += 1;
    }
    fclose(file);
    printf("%d \n", count);
    return 0;
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Filename must be in command\n");
        return 1;
    }
    wordcount(argv[1]);
    return 0;
}
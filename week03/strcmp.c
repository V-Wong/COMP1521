#include <stdio.h>

int strcmp(char *str1, char *str2);

int main(int argc, char *argv[]) {
    char *str1 = argv[1];
    char *str2 = argv[2];

    if (strcmp(str1, str2) == 0) {
        printf("%s = %s\n", str1, str2);
    } else if (strcmp(str1, str2) < 0) {
        printf("%s > %s\n", str1, str2);
    } else {
        printf("%s < %s\n", str1, str2);
    }
}

int strcmp(char *str1, char *str2) {
    char *a, *b;
    for (a = str1, b = str2; *a != '\0' && *b != '\0'; a++, b++) {
        if (*a > *b) {
            return -1;
        } else if (*a < *b) {
            return 1;
        }
    }

    if (*a == '\0' && *b == '\0') {
        return 0;
    } else if (*a != '\0') {
        return -1;
    } else {
        return 1;
    }
}
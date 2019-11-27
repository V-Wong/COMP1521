#include <stdio.h>

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Please provide one argument\n");
        return 1;
    }

    FILE *f = fopen(argv[1], "w");
    if (!f) {
        perror("fopen");
    } else {
        char line[BUFSIZ];
        fscanf(stdin, "%s", line);
        fprintf(f, "%s", line);
    }
}
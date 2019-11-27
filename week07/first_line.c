#include <stdio.h>

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Please provide one argument\n");
        return 1;
    }

    FILE *f = fopen(argv[1], "r");
    if (!f) {
        perror("fopen");
    } else {
        char line[BUFSIZ];
        fgets(line, BUFSIZ, f);
        fprintf(stdout, "%s", line);
    }
}
#include <stdio.h>
#include <assert.h>
#include <string.h>

void string_match(FILE *stream, char *search_string);

int main(int argc, char *argv[]) {
    char *search_string = argv[1];

    if (argc < 2) {
        fprintf(stderr, "Usage: %s search_string [file1, file2 ...]\n", argv[0]);
    } else if (argc == 2) {
        string_match(stdin, search_string);
    } else {
        for (int i = 2; i < argc; i++) {
            FILE *f = fopen(argv[i], "r");
            if (f == NULL) {
                perror("fopen");
                continue;
            }
            string_match(f, search_string);
            fclose(f);
        }
    }
}

void string_match(FILE *stream, char *search_string) {
    char line[BUFSIZ];

    int i = 1;
    while (fgets(line, BUFSIZ, stream)) {
        if (strstr(line, search_string)) {
            printf("%d: %s\n", i, line);
        }
        i++;
    }
}
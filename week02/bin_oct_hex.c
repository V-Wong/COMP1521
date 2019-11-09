#include <stdio.h>
#include <stdlib.h>

void print_bin(int num);
void print_oct(int num);
void print_hex(int num);

int main(int argc, char *argv[]) {
    print_bin(atoi(argv[1]));
    print_oct(atoi(argv[1]));
    print_hex(atoi(argv[1]));
}

void print_bin(int num) {
    printf("Binary: ");
    for (int i = 7; i >= 0; i--) {
        printf("%d", (num >> i) & 1);
    }
    printf("\n");
}

void print_oct(int num) {
    printf("Octal: ");
    for (int i = 7; i >= 0; i--) {
        printf("%d", (num >> 3 * i) & 7);
    }
    printf("\n");
}

void print_hex(int num) {
    char *hex = "0123456789ABCDEF";

    printf("Hexadecimal: ");
    for (int i = 7; i >= 0; i--) {
        printf("%c", hex[(num >> 4 * i) & 0xf]);
    }
    printf("\n");
}
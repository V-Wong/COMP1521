#include <stdio.h>
#include <stdlib.h>

typedef unsigned int Word;

Word reverseBits(Word w);

int main(int argc, char *argv[]) {
    Word w = atoi(argv[1]);

    printf("Reversed %X\n", reverseBits(w));
}

Word reverseBits(Word w) {
    Word newNum = 0;

    int i = 0;
    int j = 31;
    
    while (j >= 0) {
        Word n = (w >> j) & 1;
        newNum |= (n << i);

        j--;
        i++;
    }

    return newNum;
}
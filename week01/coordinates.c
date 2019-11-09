#include <stdio.h>

typedef struct Coord {
    int x;
    int y;
    int z;
} Coord;

int main(void) {
    Coord coords[10];

    // Initialise coords[] with (1, 2, 3)
    for (Coord *p = coords; p < &coords[10]; p++) {
        p->x = 1;
        p->y = 2;
        p->z = 3;
    }

    for (int i = 0; i < 10; i++) {
        printf("(%d, %d, %d)\n", coords[i].x, coords[i].y, coords[i].z);
    }
}
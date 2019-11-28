#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
    for (int i = 1; i < argc; i++) {
        struct stat s;
        stat(argv[i], &s);

        if (s.st_mode & S_IROTH) {
            chmod(argv[i], s.st_mode ^ S_IROTH);
        }        
    }
}
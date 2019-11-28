#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <spawn.h>
#include <sys/wait.h>

#define C_COMPILER "/usr/local/bin/dcc"

int main(int argc, char *argv[]) {
    extern char **environ;

    for (int i = 1; i < argc; i++) {
        char *cur_file = argv[i];
        char new_file_name[BUFSIZ];
        strcpy(new_file_name, cur_file);
        new_file_name[strlen(new_file_name) - 2] = '\0';

        pid_t pid;
        char *args[5] = {C_COMPILER, argv[i], "-o", new_file_name, NULL};
        posix_spawnp(&pid, C_COMPILER, NULL, NULL, args, environ);

        int error_status;
        if (waitpid(pid, &error_status, 0) == -1) {
            perror("waitpid");
        }
    }
}


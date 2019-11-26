# // print a triangle
# #include <stdio.h>

# int main (void) {
#     for (int i = 1; i <= 10; i++) {
#         for (int j = 0; j < i; j++) {
#             printf("*");
#         }
#         printf("\n");
#     };
#     return 0;
# }

main:
    li $t0, 1

loop1:
    bgt $t0, 10 end_loop1

    li $t1, 0

loop2:
    bge $t1, $t0, end_loop2

    li $v0, 11
    li $a0, '*'
    syscall

    add $t1, $t1, 1

    b loop2

end_loop2:
    li $v0, 11
    li $a0, '\n'
    syscall

    add $t0, $t0, 1

    b loop1

end_loop1:
    jr $ra
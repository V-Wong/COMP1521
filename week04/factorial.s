# // Simple factorial calculator  - without error checking

# #include <stdio.h>

# int main (void) {
#     int n;
#     printf("n  = ");
#     scanf("%d", &n);

#     int fac = 1;
#     for (int i = 1; i <= n; i++) {
#         fac *= i;
#     }

#     printf ("n! = %d\n", fac);
#     return 0;
# }

main:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall

    li $t1, 1
    li $t0, 1

factorial:
    bgt $t0, $v0, end_fact

    mul $t1, $t1, $t0

    add $t0, $t0, 1

    b factorial

end_fact:
    li $v0, 4
    la $a0, answer
    syscall

    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 11
    li $a0, '\n'
    syscall

    jr $ra

.data
prompt:
    .asciiz "n = "
answer:
    .asciiz "n! = "
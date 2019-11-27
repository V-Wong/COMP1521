# #include <stdio.h>

# int main(void) {
#     int i;
#     int numbers[10] = {0};
#
#     i = 0;
#     while (i < 10) {
#         scanf("%d", &numbers[i]);
#         i++;
#     }
#
#     i = 0;
#     while (i < 10) {
#         printf("%d\n", numbers[i]);
#     i++;
#     }
# }

main:
    li $t0, 0

while1:
    bge $t0, 10, end_while1

    li $v0, 5
    syscall

    mul $t1, $t0, 4
    sw $v0, numbers($t1)

    add $t0, $t0, 1

    b while1

end_while1:
    li $t0, 0

while2:
    bge $t0, 10, end_while2

    mul $t1, $t0, 4
    lw $a0, numbers($t1)

    li $v0, 1
    syscall

    add $t0, $t0, 1

    b while2

end_while2:
    li $v0, 11
    li $a0, '\n'
    syscall

    jr $ra

.data
numbers: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
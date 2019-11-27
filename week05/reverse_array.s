# #include <stdio.h>

# int main(void) {
#     int i;
#     int numbers[10] = {0,1,2,3,4,5,6,7,8,9};

#     i = 0;
#     while (i < 5) {
#         int x = numbers[i];
#         int y = numbers[9 - i];
#         numbers[i] = y;
#         numbers[9 - i] = x;
#         i++;
#     }
# }

# x = $t3, y = $t4
main:
    li $t0, 0

while1:
    bge $t0, 5, end_while1

    mul $t1, $t0, 4
    lw $t3, numbers($t1)

    mul $t2, $t0, -4
    add $t2, $t2, 36
    lw $t4, numbers($t2)

    sw $t3, numbers($t2)
    sw $t4, numbers($t1)

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

    li $v0, 11
    li $a0, '\n'
    syscall

    add $t0, $t0, 1

    b while2

end_while2:
    jr $ra

.data
numbers: .word 0, 1, 2, -3, 4, -5, 6, -7, 8, 9
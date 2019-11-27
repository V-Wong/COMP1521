# int main(void) {
#     int i;
#     int numbers[10] = {0,1,2,-3,4,-5,6,-7,8,9};

#     i = 0;
#     while (i < 10) {
#         if (numbers[i] < 0) {
#             numbers[i] += 42;
#         }
#         i++;
#     }
# }

main:
    li $t0, 0

while1:
    bge $t0, 10, end_while1

    mul $t1, $t0, 4
    lw $t2, numbers($t1)

    bge $t2, 0, is_not_negative

    add $t2, $t2, 42
    sw $t2, numbers($t1)

is_not_negative:
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
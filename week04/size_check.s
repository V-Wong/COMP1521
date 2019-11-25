# #include <stdio.h>

# int main(void) {
#     int x;
#     printf("Enter a number: ");
#     scanf("%d", &x);

#     if (x > 100 && x < 1000) {
#         printf("medium\n");
#     } else {
#         printf("small/big\n");
#     }

main:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall

    move $t0, $v0

    ble $t0, 100, not_medium
    bge $t0, 1000, not_medium

is_medium:
    li $v0, 4
    la $a0, medium_message
    syscall

    b end

not_medium:
    li $v0, 4
    la $a0, not_medium_message
    syscall

end:
    li $v0, 0
    jr $ra

.data
prompt:
    .asciiz "Enter a number: "
medium_message:
    .asciiz "medium\n"
not_medium_message:
    .asciiz "small/big\n"
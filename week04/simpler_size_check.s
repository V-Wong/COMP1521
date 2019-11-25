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

    la $a0, not_medium_message
    ble $t0, 100, end
    bge $t0, 1000, end

is_medium:
    la $a0, medium_message

end:
    li $v0, 4
    syscall

    li $v0, 0
    jr $ra

.data
prompt:
    .asciiz "Enter a number: "
medium_message:
    .asciiz "medium\n"
not_medium_message:
    .asciiz "small/big\n"
# // print the square of a number
# #include <stdio.h>

# int main(void) {
#     int x, y;
#     printf("Enter a number: ");
#     scanf("%d", &x);
#     y = x * x;
#     printf("%d\n", y);
#     return 0;
# }

# x = $t0, y = $t1
main:
    # printf("Enter a number: ");
    li $v0, 4
    la $a0, prompt
    syscall

    # scanf("%d", &v0);
    li $v0, 5
    syscall

    # t0 = v0;
    # t1 = t0 * t0;
    move $t0, $v0
    mul $t1, $t0, $t0

    # printf("%d", t1);
    li $v0, 1
    move $a0, $t1
    syscall
    
    # printf("\n");
    li $v0, 11
    li $a0, '\n'
    syscall

    # return 0;
    li $v0, 0
    jr $ra

.data
prompt:
    .asciiz "Enter a number: "
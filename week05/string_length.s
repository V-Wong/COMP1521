# char *string = "....";
# char *s = &string[0];
# int   length = 0;
# while (*s != '\0') {
#    length++;  // increment length
#    s++;       // move to next char
# }

main:
    la $t0, string
    li $t1, 0

while1:
    lb $t2, ($t0) 
    beq $t2, 0, end_while1

    add $t0, $t0, 1
    add $t1, $t1, 1

    b while1

end_while1:
    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 11
    li $a0, '\n'
    syscall

    jr $ra

.data
string:
   .asciiz  "...."
main:
    addi $sp, $sp, 8
    sw   $ra, 4($sp)
    sw   $s0, 0($sp)

    li   $v0, 4
    la   $a0, msg1
    syscall

    li   $v0, 5
    syscall
    
    move $a0, $v0
    jal  pow2
    move $t0, $v0

    li   $v0, 1
    move $a0, $t0
    syscall

    li   $v0, 11
    li   $a0, '\n'
    syscall

    lw   $s0, 0($sp)
    lw   $ra, 4($sp) 
    addi $sp, $sp, 8  

    jr $ra

    .data
msg1: .asciiz "Please enter a number: "

    .text
pow2:
    addi $sp, $sp, -8
    sw   $ra, 4($sp)
    sw   $v0, 0($sp)

    move $s0, $a0

    beq  $s0, 0, base_case
recursion:
    add  $a0, $s0, -1
    jal  pow2
    mul  $t0, $v0, 2
    j pow2_end
base_case:
    li   $t0, 1
pow2_end:
    move $v0, $t0

    lw   $ra, 4($sp)
    lw   $s0, 0($sp)
    addi $sp, $sp, 8

    jr $ra

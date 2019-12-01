main:
    add  $sp, $sp, -8
    sw   $s0, 0($sp)
    sw   $ra, 4($sp)

    li   $v0, 4
    la   $a0, prompt1
    syscall

    li   $v0, 5
    syscall
    move $a1, $v0

    li   $v0, 4
    la   $a0, prompt2
    syscall

    li   $v0, 5
    syscall
    move $a0, $v0

    jal  pow

    move $a0, $v0
    li   $v0, 1
    syscall

    li   $a0, '\n'
    li   $v0, 11
    syscall

    lw   $s0, 0($sp)
    lw   $ra, 4($sp)
    add  $sp, $sp, 8

    jr   $ra

    .data
prompt1: .asciiz "Please enter base: "
prompt2: .asciiz "Please enter power: "

    .text
pow:
    # Create stack frame
    add  $sp, $sp, -8
    sw   $s0, 0($sp)
    sw   $ra, 4($sp)

    # Move argument to local variable
    # This local variable is the one to be saved in the stack
    move $s0, $a0

    beq  $s0, 0, base_case
pow_recursive:
    # pow(n - 1)
    add  $a0, $s0, -1
    jal  pow
    # n * pow(n - 1)
    mul  $t0, $v0, $a1
    j    pow_return

base_case:
    # return 1
    li   $t0, 1

pow_return:
    move $v0, $t0

    lw   $s0, 0($sp)
    lw   $ra, 4($sp)
    add  $sp, $sp, 8
    
    jr $ra
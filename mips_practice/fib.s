main:
    add  $sp, $sp, -4
    sw   $ra, ($sp)

    li   $v0, 5
    syscall
    move $a0, $v0

    jal  fib

    move $a0, $v0
    li   $v0, 1
    syscall

    li   $a0, '\n'
    li   $v0, 11
    syscall

    lw   $ra, ($sp)
    add  $sp, $sp, 4
    
    jr   $ra

# fib(4) = fib(3) + fib(2) = [fib(2) + fib(1)] + [fib(1) + fib(0)]
# = [(fib(1) + fib(0)) + fib(1)] + [fib(1) + fib(0)]

fib:
    add  $sp, $sp, -12
    sw   $ra, ($sp)
    sw   $s0, 4($sp)
    sw   $s1, 8($sp)

    move $s0, $a0

    ble  $s0, 0, base_case0
    beq  $s0, 1, base_case1
recursive_step:
    # fib(n - 1)
    # We use $s1, to hold the return values
    # We store $s1 onto the stack because we need
    # to preserve its values across recursive calls
    add  $a0, $s0, -1
    jal  fib
    move $s1, $v0

    # fib(n - 2)
    add  $a0, $s0, -2
    jal  fib
    
    # fib(n - 1) + fib(n - 2)
    add  $t0, $v0, $s1

    j    fib_return

base_case0:
    li   $t0, 0
    j fib_return

base_case1:
    li   $t0, 1

fib_return:
    move $v0, $t0

    lw   $ra, ($sp)
    lw   $s0, 4($sp)
    lw   $s1, 8($sp)
    add  $sp, $sp, 12

    jr $ra





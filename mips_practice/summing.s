main:
    addi $sp, $sp, -8  # create stack frame
    sw   $ra, 4($sp)   # save return address
    sw   $s0, 0($sp)   # save $s0

    li   $s0, 0
    la   $a0, msg1
    li   $v0, 4
    syscall            # printf(Enter n: ")

    li    $v0, 5
    syscall            # scanf("%d", &n)
    move  $s0, $v0

    move  $a0, $s0     # factorial(n)
    jal   summing      #
    move  $t0, $v0     #

    move  $a0, $s0
    li    $v0, 1
    syscall            # printf ("%d", n)

    la    $a0, msg2
    li    $v0, 4
    syscall            # printf("! = ")

    move  $a0, $t0
    li    $v0, 1
    syscall            # printf ("%d", f)

    li   $a0, '\n'     # printf("%c", '\n');
    li   $v0, 11
    syscall

                       # clean up stack frame
    lw   $s0, 0($sp)   # restore $s0
    lw   $ra, 4($sp)   # restore $ra
    addi $sp, $sp, 8   # restore sp

    li  $v0, 0         # return 0
    jr  $ra

    .data
msg1:   .asciiz "Enter n: "
msg2:   .asciiz "sum(n) = "

    .text
summing:
    # Create stack frame
    # Store return address and current argument
    addi $sp, $sp, -8
    sw   $ra, 4($sp)
    sw   $s0, 0($sp)

    # Move argument into local variable
    # $s0 is saved for the current function call
    move $s0, $a0

    ble  $s0, 1, base_case
recursion:
    addi $a0, $s0, -1
    jal  summing
    add  $t0, $v0, $s0
    j    summing_end
base_case:
    li   $t0, 1
summing_end:
    # Return the calculated value from this function call
    move $v0, $t0
    
    # Load back the return address 
    # and previously saved local variable
    lw   $ra, 4($sp)
    lw   $s0, 0($sp)
    addi $sp, $sp, 8

    # Jump back to saved return address
    # This may continue the recusion from the previous jal
    # or ends the function.
    jr   $ra
    

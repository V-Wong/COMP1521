main:
    # Load only 1/4 bytes
    # In little endian, this is the least signifcant byte
    lb $t0, test

    # Prints -102
    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 11
    li $a0, '\n'
    syscall

    jr $ra

.data
# Store the int 666 in test
test:  .word 666

# Explanation
# 666 is represented as 0x0000029a in hex
# In little endian, we load  the least significant byte: 0x9a
# In binary this byte is represented as 10011010
# Since the most left bit is 1, we sign extend with 1
# This gives the 32 bit quantity 11111111111111111111111110011010
# This is a negative number in 2s complement
# To get the absolute value, we invert the bits and add 1
# This gives 0 ... 01100101 + 1 = 0 ... 01100110 = 102
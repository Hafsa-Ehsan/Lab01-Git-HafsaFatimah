.text 
.globl main 
main:
    addi x10, x0, 5 #n=5
    jal x1, fact 
    add x11, x0, x10 
    addi x10, x0, 1 
    ecall 
    j exit
    fact:
        addi sp, sp, -8 
        sw x1, 4(sp) 
        addi x6, x0, 1 
        addi x5, x0, 1 
        blt x10, x5, BaseCase  # if n < 1, go to base case
    loop:
        mul x6, x6, x10  # x6 = x6 * x10
        addi x10, x10, -1  # x10 = x10 - 1
        bgt x10, x5, loop  # if x10 > 1, continue loop
    BaseCase:
        add x10, x0, x6 
        lw x1, 4(sp) 
        addi sp, sp, 8 #deallocate stack space
        jalr x0, 0(x1) 
    exit: 
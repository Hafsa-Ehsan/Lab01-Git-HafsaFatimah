.text 
.globl main 
main:
    addi x5, x0, 2 # a = 2 to test 
    addi x6, x0, 3 # b = 3 to test
    addi x10, x0, 0x200 # baseaddress for x10
    addi x7, x0, 0  # i = 0 
Loop1:
    bge x7, x5, ExitLoop1 # if i >= a, exit 
    addi x29, x0, 0  # j = 0 
Loop2:
    bge x29, x6, ExitLoop2  # if j >= b, exit
    add x28, x7, x29  # i + j 
    slli x30, x29, 4 #offset 
    add x30, x30, x10 
    sw x28, 0(x30)  # D[4*j] = i + j  
    addi x29, x29, 1 # j++ 
    beq x0, x0, Loop2 
ExitLoop2:
    addi x7, x7, 1 # i++
    beq x0, x0, Loop1
ExitLoop1:

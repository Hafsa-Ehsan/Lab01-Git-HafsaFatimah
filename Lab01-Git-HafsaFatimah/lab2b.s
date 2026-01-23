.text
.globl main
main:
    addi x22, x0, 20 #b
    addi x23, x0, 10 #c
    addi x20, x0, 3

    addi t0, x0, 1 
    beq x20, t0, case1 
    addi t0, x0, 2 
    beq x20, t0, case2
    addi t0, x0, 3
    beq x20, t0, case3 
    addi t0, x0, 4 
    beq x20, t0, case4 
    default:
    add x21, x0, x0  
    beq x0, x0, Exit 
    case1:
    add x21, x22,x23 
    beq x0, x0, Exit 
    case2:
    sub x21, x22, x23
    beq x0, x0, Exit
    case3: 
    addi t1, x0, 2 
    mul x21, x22, t1
    beq x0, x0, Exit
    case4:
    addi t1, x0, 2 
    div x21, x22, t1
    beq x0, x0, Exit
    Exit: 
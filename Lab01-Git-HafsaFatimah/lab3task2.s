.text 
.globl main 
main: 
    addi x10,x0,12 #g
    addi x11, x0, 5 #h
    addi x12, x0, 7 #i
    addi x13, x0, 5 #j 
    jal x1, leaf
        addi x11, x10,0
        li x10, 1
        ecall
    j exit
    leaf:
    addi sp, sp, -12
    sw x18, 8(sp)        
    sw x19, 4(sp)         
    sw x20, 0(sp)       
    add x18, x10, x11 #x18=g+h
    add x19, x12, x13 #x19=i+j 
    sub x20, x18, x19 #x20=x18-x19

    addi x10, x20, 0 
    lw x20, 0(sp)
    lw x19, 4(sp)
    lw x18, 8(sp) 
    addi sp, sp, 12
    jalr x0, 0(x1) 
    exit:
# end:
#     j end
    
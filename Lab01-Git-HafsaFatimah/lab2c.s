.text 
.globl main 
main:
    addi x22,x0,0
    addi x10,x0,0x200 #baseadress
    addi x11,x0,10

Loop1:
    beq x22,x11,EndLoop1
    slli x12,x22,2
    add x12,x12,x10
    sw x22,0(x12)

    addi x22,x22,1
    beq x0,x0,Loop1
EndLoop1:
    
    addi x23,x0,0
    addi x22,x0,0
    addi x11,x0,10

Loop2:
    beq x22,x11,EndLoop2
    slli x12,x22,2
    add x12,x12,x10
    lw x13,0(x12)
    
    add x23,x23,x13
    addi x22,x22,1
    beq  x0,x0,Loop2
EndLoop2:    










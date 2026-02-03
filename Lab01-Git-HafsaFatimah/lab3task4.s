.text
.globl main
main:
    li x10, 0x100    #x
    li x11, 0x200    #y
    li x19, 0        #i=0

    #y = ['h','e','l','l','o'] 
    li x6, 'h'
    sb x6, 0(x11)
    li x29, 'e'
    sb x29, 4(x11)
    li x30, 'l'
    sb x30, 8(x11)
    li x31, 'l'
    sb x31, 12(x11)
    li x5, 'o'
    sb x5, 16(x11)

    addi sp, sp, -12     #3 regs each of 4 bytes
    sw x11, 8(sp)        
    sw x10, 4(sp)        
    sw x19, 0(sp) 
    lw x11, 8(sp)        #restore x11
    lw x10, 4(sp)        #restore x10
    lw x19, 0(sp)        #restore x19
    addi sp, sp, 12      #deallocate stack space       

    loop:
    lb x28, 0(x11)       #loading y[i] into x28
    sb x28, 0(x10)       #(x[i]=y[i])
    beq x28, x0, exit   #if x28 is null terminator, exit
    addi x10, x10, 4     #next element 
    addi x11, x11, 4     #next element
    addi x19, x19, 1     #i=i+1
    j loop               #jump to loop

    exit:
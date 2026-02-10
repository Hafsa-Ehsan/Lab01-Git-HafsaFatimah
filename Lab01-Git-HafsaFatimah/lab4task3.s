.text 
.globl main 
main:
    li x10, 0x100
    #initialize array c
    li t0, 2
    sw t0, 0(x10) ## c[0]=2
    li t0, 1
    sw t0, 4(x10) ## i=1
    li t0, 5
    sw t0, 8(x10) ## i=2
    li t0, 4
    sw t0, 12(x10) ## i=3
    li t0, 9 
    sw t0, 16(x10) ## i=4
    li t0, 7 
    sw t0, 20(x10) ## i=5
    li t0, 6 
    sw t0, 24(x10) ## i=6
    li t0, 3 
    sw t0, 28(x10) ## i=7
    li t0, 8
    sw t0, 32(x10) ## i=8
    li t0, 0 
    sw t0, 36(x10) ## i=9
    addi x11, x0, 10 #len = 10

    beq x10, x0, end ## check if null
    beq x11, x0, end ##check if length is zero

    addi x5, x0, 0  # i = 0
outerloop:
    bge x5, x11, end # if i >= len
    
    add x6, x5, x0  # j = i
innerloop: 
    bge x6, x11, end_inner # if j >= len
    
    slli x28, x5, 2  
    add x28, x10, x28
    lw x8, 0(x28)    # a[i]
    
    slli x29, x6, 2  
    add x29, x10, x29
    lw x9, 0(x29)    # a[j]
    
    bge x8, x9, dont_swap # if a[i] >= a[j]
    
    # swap
    sw x9, 0(x28)    # a[i] = a[j]
    sw x8, 0(x29)    # a[j] = a[i]
    
dont_swap:
    addi x6, x6, 1   # j++
    j innerloop 
    
end_inner:
    addi x5, x5, 1   # i++
    j outerloop
    
end: 
    j end 
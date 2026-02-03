.text
.globl main 
main: 
    addi x10, x0, 2 # n = 2
    jal x1, ntri  
    add x11, x0, x10      
    addi x10, x0, 1       
    ecall                 
    j exit 
    ntri: 
        addi sp, sp, -8       
        sw x1, 0(sp)          
        sw x10, 4(sp)        
        addi x5, x0, 1  # x5 = 1 
        ble x10, x5, BaseCase 
        addi x10, x10, -1   # n = n-1
        jal x1, ntri  
        lw x6, 4(sp)   
        add x10, x10, x6  # x10 = n + ntri(n-1)
        j end_ntri
    BaseCase:
        addi x10, x0, 1  
    end_ntri:     
        lw x1, 0(sp)          
        addi sp, sp, 8        
        jalr x0, 0(x1)     
    exit:



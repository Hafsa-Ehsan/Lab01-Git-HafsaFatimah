.text 
.globl main 
main:
    li x18, 5 #a=5
    add x19, x0,x0 #b=0+0
    addi x18,x19,32 #a=b+32
    add x5,x18,x19 #(a+b)
    li x6,5
    sub x20,x5,x6 #d=(a+b)-5
    sub x5,x18,x20 # u=(a-d)
    sub x6,x19,x18 # v=(b-a)
    add x28, x5, x6 # w= u+v
    add x21, x28, x20 # e =  w + d --> e = (((a - d) + (b - a)) + d)
    add x21, x21, x18 # e = e + a 
    add x21, x21, x19 # e = e+a+b
    add x21, x21, x20 # e = a + b + d + e
end:
    j end
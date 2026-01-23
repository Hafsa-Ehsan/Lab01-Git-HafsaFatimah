.text 
.globl main 
main:
    li x10,0x100
    li x11,0x200
    li x12,0x300

    #initialize array a
    li t0,1
    sb t0,0(x10) #a[0]=1
    li t0,2
    sb t0,1(x10) #a[1]=2
    li t0,3
    sb t0,2(x10) #a[2]=3
    li t0,4
    sb t0,3(x10) #a[3]=4

    #initialize array b
    li t1,10
    sh t1,0(x11) #b[0]=10
    li t1,20
    sh t1,2(x11) #b[1]=20
    li t1,30
    sh t1,4(x11) #b[2]=30
    li t1,40
    sh t1,6(x11) #b[3]=40

    #c[i] = a[i] + b[i]
    lb x5,0(x10)
    lh x6,0(x11)
    add x7,x5,x6 # x7=a[0]+b[0]
    sw x7 , 0(x12) #c[0]

    lb x5,1(x10)
    lh x6,2(x11)
    add x7,x5,x6 # x7=a[1]+b[1]
    sw x7 , 4(x12) # c[1]

    lb x5,2(x10)
    lh x6,4(x11)
    add x7,x5,x6 # x7=a[2]+b[2]
    sw x7 ,8(x12) # c[2]

    lb x5,3(x10)
    lh x6,8(x11)
    add x7,x5,x6 #x7=a[3]+b[3]
    sw x7 , 12(x12) # c[3]

end:
    j end



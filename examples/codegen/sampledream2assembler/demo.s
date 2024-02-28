# prog.dream
# This sample was hand-coded in class -- who knows if it is correct! :)

.data

# line 2: x: int
.comm _x, 4, 4

# line 3: y: int
.comm _y, 4, 4

#line 4: start() is
.text
.global main
main:

#line 6: x := 3
    pushl $3    # 3
    popl  _x
    
#line 7: y := 5 + x
    pushl $5
    pushl _x
    popl %ebx
    popl %ecx
    addl %ebx, %ecx
    pushl %ecx
    popl _y
    
#line 8: out.writeint(y-x)
    pushl _y
    pushl _x
    popl %ebx
    popl %ecx
    subl %ecx, %ebx
    pushl %ebx
    call writeint
    addl $4, %esp
    
#line 9
    pushl $0
    call exit
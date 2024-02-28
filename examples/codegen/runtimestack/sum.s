sum:
    pushl %ebp
    movl %esp, %ebp
    subl $8, %esp
    
# c := in.readint()
    call readint
    movl %eax, -8(%ebp)
    
# sum := a + b + c
    pushl 8(%ebp)
    pushl 12(%ebp)
    popl %ebx
    popl %eax
    addl %eax, %ebx
    pushl %ebx
    
    pushl -8(%ebp)
    popl %ebx
    popl %eax
    addl %eax, %ebx
    pushl %ebx

    popl %eax
    movl %eax, -4(%ebp)
    
    # standard "postlude"
    movl -4(%ebp),%eax
    movl %ebp,%esp
    popl %ebp
    ret
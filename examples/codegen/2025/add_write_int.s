# int x = 6;
# int y = 3;
# char z = x + y;
# writeint(z);

.globl    main               # main function (global)
main:                        # standard function prologue:
    leal    4(%esp), %ecx    # store sp+4, sp, bp, bx, sp+4
    pushl   -4(%ecx)
    pushl   %ebp
    movl    %esp, %ebp
    pushl   %ebx
    pushl   %ecx
    movl    $6, -20(%ebp)    # put 6 in cx
    movl    -20(%ebp), %ecx    
    movl    $3, -16(%ebp)    # put 3 in dx
    movl    -16(%ebp), %edx    
    addl    %ecx, %edx       # add 6 to 3
    movl    %edx, -24(%ebp)  # store sum
    subl    $12, %esp        # subtract padding so that parameter + padding is a multiple of 16.
    pushl   %edx             # push parameter
    call    writeint@PLT     # call stub for writeint.
    addl    $16, %esp        # clean off stack after call (always a multiple of 16).
    movl    $0, %eax         # zero out return value.
    leal    -8(%ebp), %esp   # restore sp+4, bx, bp, sp
    popl    %ecx
    popl    %ebx
    popl    %ebp
    leal    -4(%ecx), %esp
    ret
    .section .note.GNU-stack,"",@progbits # security feature to allow a non-executable stack 

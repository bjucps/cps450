# read and add 2 integers

.globl    main               # main function (global)
main:                        # standard function prologue:
    leal    4(%esp), %ecx    # store sp+4, sp, bp, bx, sp+4
    pushl   -4(%ecx)           
    pushl   %ebp  
    movl    %esp, %ebp          
    pushl   %ebx
    pushl   %ecx  
    call    readint@PLT      # call stub for readint.
    pushl   %eax             # store first int
    call    readint@PLT      # call stub for readint.
    popl    %edx             # retrieve first int
    addl    %eax, %edx       # add second int to the first
    subl    $12, %esp        # subtract padding so that parameter + padding is a multiple of 16.
    pushl   %edx             # push sum as parameter
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

# read and add 2 integers

    .globl  main
main:
    pushl   %ebp             # store the original bp.
    movl    %esp, %ebp       # set bp.
    pushl   %edx             # store original dx (at bp-4); local variables begin at bp-8.
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
    leal    -4(%ebp), %esp   # set sp to bp-num_regs_pushed*4.
    popl    %edx             # restore dx
    leave                    # equal to mov %ebp, %esp; pop %ebp.
    ret
    .section .note.GNU-stack,"",@progbits # security feature to allow a non-executable stack 

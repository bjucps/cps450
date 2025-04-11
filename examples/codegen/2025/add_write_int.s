# int x = 6;
# int y = 3;
# char z = x + y;
# writeint(z);

.globl    main
main:
    pushl   %ebp             # store the original bp.
    movl    %esp, %ebp       # set bp; local variables begin at bp-16.
    pushl   %ebx             # store original bx (at bp-4)
    pushl   %ecx             # store original cx (at bp-8).
    pushl   %edx             # store original dx (at bp-12).
    movl    $6, -16(%ebp)    # put 6 in x (bp-16)
    movl    -16(%ebp), %ecx
    movl    $3, -20(%ebp)    # put 3 in y (bp-20)
    movl    -20(%ebp), %edx
    addl    %ecx, %edx       # add 6 to 3
    movl    %edx, -24(%ebp)  # store sum in z (bp-24)
    subl    $12, %esp        # subtract padding so that parameter + padding is a multiple of 16.
    pushl   %edx             # push sum as parameter
    call    writeint@PLT     # call stub for writeint.
    addl    $16, %esp        # clean off stack after call (always a multiple of 16).
    movl    $0, %eax         # zero out return value.
    leal    -12(%ebp), %esp  # set sp to bp-num_regs_pushed*4.
    popl    %edx             # restore dx
    popl    %ecx             # restore cx
    popl    %ebx             # restore bx
    leave                    # equal to mov %ebp, %esp; pop %ebp.
    ret
    .section .note.GNU-stack,"",@progbits # security feature to allow a non-executable stack 

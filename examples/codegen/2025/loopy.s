# Compile: gcc -m32 loopy.s stdlib.o
# dream source
# class loopy is
#   x: int  
#   start() is
#   begin
#     x := 3
#     if (x > 0) then
#       loop while x > 0
#         out.writeint(x)
#         x := x - 1
#       end loop
#     else
#       out.writeint(999)  
#     end if
#   end start
# end loopy

.globl    main                                # main function (global)
main:                                         # standard function prologue:
    leal    4(%esp), %ecx                     # store sp+4, sp, bp, bx, sp+4
    pushl   -4(%ecx)
    pushl   %ebp
    movl    %esp, %ebp
    pushl   %ebx
    pushl   %ecx
    movl    $3, -16(%ebp)                     # x := 3
                                              # if (x > 0) then
    cmpl    $0, -16(%ebp)                     # Compare 0 with x (bp-8)
    jle     ELSE                              # if x <= 0, jump to ELSE

LOOP:                                         # loop while x > 0
    cmpl    $0, -16(%ebp)                     # Compare 0 with x (bp-8)
    jle     ENDIF                             # when x <= 0, jump to ENDIF
                                              # out.writeint(x)
    subl    $12, %esp                         # subtract padding so that parameter + padding is a multiple of 16.
    movl    -16(%ebp), %eax                   # push parameter (x)
    pushl   %eax                              
    call    writeint@PLT                      # call stub for write
    addl    $16, %esp                         # clean off stack after call (always a multiple of 16).
    subl    $1, -16(%ebp)                     # x := x - 1
    jmp     LOOP
ELSE:                                         # out.writeint(999)
    subl    $12, %esp                         # subtract padding so that parameter + padding is a multiple of 16.
    movl    $999, %eax                        # push parameter
    pushl   %eax                              #    (continued)
    call    writeint@PLT                      # call stub for write
    addl    $16, %esp                         # clean off stack after call (always a multiple of 16).
ENDIF:
    movl    $0, %eax                          # zero out return value.
    leal    -8(%ebp), %esp                    # restore sp+4, bx, bp, sp
    popl    %ecx
    popl    %ebx
    popl    %ebp
    leal    -4(%ecx), %esp
    ret
    .section .note.GNU-stack,"",@progbits # security feature to allow a non-executable stack 

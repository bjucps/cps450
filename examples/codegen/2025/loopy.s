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
    leal    4(%esp), %ecx                     # store address sp+4 in cx as the starting point for this program.
    pushl   -4(%ecx)                          # push sp
    pushl   %ebp                              # push bp
    movl    %esp, %ebp                        # store updated sp in bp.
    pushl   %ebx                              # push bx
    pushl   %ecx                              # push sp+4
    subl    $32, %esp                         # reserve space on the stack. Stack grows down.
    call    __x86.get_pc_thunk.ax             # put ip in ax. See https://courses.cs.vt.edu/cs3214/spring2022/questions/pcmaterialization        
    addl    $_GLOBAL_OFFSET_TABLE_, %eax      # set ax to _GLOBAL_OFFSET_TABLE_ + ip of <main+23>
    movl    $3, -16(%ebp)                     # x := 3
                                              # if (x > 0) then
    cmpl    $0, -16(%ebp)                     # Compare 0 with x (bp-8)
    jle     ELSE                              # if x <= 0, jump to ELSE

LOOP:                                         # loop while x > 0
    cmpl    $0, -16(%ebp)                     # Compare 0 with x (bp-8)
    jle     ENDIF                             # when x <= 0, jump to ENDIF
                                              # out.writeint(x)
    subl    $4, %esp                          # prep for call
    movl    -16(%ebp), %eax                   # push parameter (x)
    pushl   %eax                              #    (continued)
    call    writeint@PLT                      # call stub for write
    addl    $8, %esp                          # clear parameters back off stack
    subl    $1, -16(%ebp)                     # x := x - 1
    jmp     LOOP
ELSE:                                         # out.writeint(999)
    subl    $4, %esp                          # prep for call
    movl    $999, %eax                        # push parameter
    pushl   %eax                              #    (continued)
    call    writeint@PLT                      # call stub for write
    addl    $8, %esp                          # clear parameters back off stack
ENDIF:
                                              # standard function epilogue:
    movl    $0, %eax                          # zero out return value.
    leal    -8(%ebp), %esp                    # restore original sp+4 to sp
    popl    %ecx                              # retrieve sp + 4 (see ln 9)
    popl    %ebx                              # restore bx (see ln 8)
    popl    %ebp                              # restore bp (see ln 6)
    leal    -4(%ecx), %esp                    # restore sp (see ln 4)
    ret                                       # function exit
    .section  .note.GNU-stack,"",@progbits    # security feature to allow a non-executable stack 

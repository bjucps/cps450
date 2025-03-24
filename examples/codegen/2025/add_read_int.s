# read and add 2 integers

.globl    main                               # main function (global)
main:                                        # standard function prologue:
    leal    4(%esp), %ecx                    # store address sp+4 in cx as the starting point for this program.
    pushl    -4(%ecx)                        # push sp
    pushl    %ebp                            # push bp
    movl    %esp, %ebp                       # store updated sp in bp.
    pushl    %ebx                            # push bx
    pushl    %ecx                            # push sp+4
    subl    $24, %esp                        # reserve space on the stack. Stack grows down.
    call    __x86.get_pc_thunk.bx            # put ip in bx. See https://courses.cs.vt.edu/cs3214/spring2022/questions/pcmaterialization        
    addl    $_GLOBAL_OFFSET_TABLE_, %ebx     # set bx to _GLOBAL_OFFSET_TABLE_ + ip of <main+23>
    call    readint@PLT                      # call stub for readint.
    pushl   %eax                             # store first int
    call    readint@PLT                      # call stub for readint.
    popl    %edx                             # retrieve first int
    addl    %eax, %edx                       # add second int to the first
    pushl   %edx                             # push sum as parameter
    call    writeint@PLT                     # call stub for writeint.
    movl    $0, %eax                         # zero out return value.
    leal    -8(%ebp), %esp                   # restore original sp+4 to sp
    popl    %ecx                             # retrieve sp + 4 (see ln 9)
    popl    %ebx                             # restore bx (see ln 8)
    popl    %ebp                             # restore bp (see ln 6)
    leal    -4(%ecx), %esp                   # restore sp (see ln 4)
    ret                                      # function exit
    .section .note.GNU-stack,"",@progbits    # security feature to allow a non-executable stack 

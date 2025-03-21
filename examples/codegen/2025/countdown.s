    .comm x, 4, 4                          # allocate 4 bytes for x with 4-byte alignment
STDOUT: .long 1                            # create a long named STDOUT initialized to 1
SIZE: .long 10                             # create a long named SIZE initialized to 10
    blastoff:                              # create a long named SIZE initialized to 10
    .string    "Blastoff!\n"               # create a string named blastoff
    .globl    main                         # main function (global)
main:                                      # standard function prologue:
    leal    4(%esp), %ecx                  # store address sp+4 in cx
    pushl   -4(%ecx)                       # push sp
    pushl   %ebp                           # push bp
    movl    %esp, %ebp                     # store updated sp in bp.
    pushl   %ebx                           # push bx
    pushl   %ecx                           # push sp+4
    subl    $32, %esp                      # reserve space on the stack. Stack grows down.
    call    __x86.get_pc_thunk.bx          # put ip in bx. See https://courses.cs.vt.edu/cs3214/spring2022/questions/pcmaterialization        
    addl    $_GLOBAL_OFFSET_TABLE_, %ebx   # set bx to _GLOBAL_OFFSET_TABLE_ + ip of <main+23>
    movl    $10, x@GOTOFF(%ebx)            # x := 10
LOOP:                                      # loop while _x > 0
    cmpl    $0, x@GOTOFF(%ebx)             # Compare 0 with x   
    jle     ENDLOOP                        # if x <= 0, jump to ENDIF
    movl    x@GOTOFF(%ebx), %eax           # push parameter x
    pushl   %eax                           #    (continued)
    call    writeint@PLT                   # call stub for writeint
    addl    $4, %esp                       # clear parameter back off stack
    subl    $1, x@GOTOFF(%ebx)             # x := x - 1 
    jmp     LOOP
ENDLOOP:    
    pushl   SIZE@GOTOFF(%ebx)              # 1) push parameter SIZE
    leal    blastoff@GOTOFF(%ebx), %eax    # 2) push parameter blastoff string
    pushl   %eax                           #    (continued)
    pushl   STDOUT@GOTOFF(%ebx)            # 3) push parameter STDOUT
    call    write@PLT                      # call stub for write
    addl    $12, %esp                      # clear parameters back off stack
    movl    $0, %eax                       # zero out return value.
                                           # standard function epilogue:
    leal    -8(%ebp), %esp                 # restore original sp+4 to sp  
    popl    %ecx                           # retrieve sp + 4 (see ln 13) 
    popl    %ebx                           # restore bx (see ln 12)
    popl    %ebp                           # restore bp (see ln 10)
    leal    -4(%ecx), %esp                 # restore sp (see ln 9)
    ret                                    # function exit
    .section  .note.GNU-stack,"",@progbits # security feature to allow a non-executable stack 

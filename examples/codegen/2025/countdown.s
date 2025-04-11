    .comm x, 4, 4                         # allocate 4 bytes for x with 4-byte alignment
STDOUT: .long 1                           # create a long named STDOUT initialized to 1
SIZE: .long 10                            # create a long named SIZE initialized to 10
    blastoff:                             
    .string    "Blastoff!\n"              # create a string named blastoff
    .globl    main                        # main function (global)
main:                                     # standard function prologue:
    pushl   %ebp                          # store the original bp.
    movl    %esp, %ebp                    # set bp.
    pushl   %ebx                          # store original bx (at bp-4); local variables begin at bp-8.
    call    __x86.get_pc_thunk.bx         # put ip in bx. See https://courses.cs.vt.edu/cs3214/spring2022/questions/pcmaterialization        
    addl    $_GLOBAL_OFFSET_TABLE_, %ebx  # set bx to _GLOBAL_OFFSET_TABLE_ + ip of <main+something>
    movl    $10, x@GOTOFF(%ebx)           # x := 10
LOOP:                                     # loop while _x > 0
    cmpl    $0, x@GOTOFF(%ebx)            # Compare 0 with x   
    jle     ENDLOOP                       # if x <= 0, jump to ENDIF
    subl    $12, %esp                     # subtract padding so that parameter + padding is a multiple of 16.
    movl    x@GOTOFF(%ebx), %eax          # push parameter x
    pushl   %eax                           
    call    writeint@PLT                  # call stub for writeint
    addl    $16, %esp                     # clean off stack after call (always a multiple of 16).
    subl    $1, x@GOTOFF(%ebx)            # x := x - 1 
    jmp     LOOP
ENDLOOP:    
    subl    $4, %esp                      # subtract padding so that parameter + padding is a multiple of 16.
    pushl   SIZE@GOTOFF(%ebx)             # 1) push parameter SIZE
    leal    blastoff@GOTOFF(%ebx), %eax   # 2) push parameter blastoff string
    pushl   %eax                          #    (continued)
    pushl   STDOUT@GOTOFF(%ebx)           # 3) push parameter STDOUT
    call    write@PLT                     # call stub for write
    addl    $16, %esp                     # clean off stack after call (always a multiple of 16).
    movl    $0, %eax                      # zero out return value.
    leal    -4(%ebp), %esp                # set sp to bp-num_regs_pushed*4.
    popl    %ebx                          # restore bx
    leave                                 # equal to mov %ebp, %esp; pop %ebp.
    ret
    .section .note.GNU-stack,"",@progbits # security feature to allow a non-executable stack 

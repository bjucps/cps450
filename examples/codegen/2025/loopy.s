    .globl  main
main:
    pushl   %ebp            #    store the original bp.
    movl    %esp, %ebp      #    set bp.
    movl    $3, -4(%ebp)    #  4: "x := 3"
                            #  5: "if (x > 0) then"
    cmpl    $0, -4(%ebp)    # 
    jle     ELSE            #    if x <= 0, jump to ELSE
LOOP:                       
    cmpl    $0, -4(%ebp)    #  6: "while (x > 0) {"
    jle     ENDIF           #    when x <= 0, jump to ENDIF

    subl    $12, %esp       #    pre-call padding
    movl    -4(%ebp), %eax  #    push parameter (x)
    pushl   %eax                              
    call    writeint@PLT    #  7: "writeint(x)"
    addl    $16, %esp       #    clean off stack after call (always a multiple of 16).
    subl    $1, -4(%ebp)    #  8: "--x;"
    jmp     LOOP            #  9: "}"
ELSE:                       # 10: "} else {"
    subl    $12, %esp       #    pre-call
    movl    $999, %eax      #    arg num: 999
    pushl   %eax
    call    writeint@PLT    # 11: "writeint(999);"
    addl    $16, %esp       #    clean off stack after call (always a multiple of 16).
                            # 12: "}"
ENDIF:
    movl    $0, %eax        #    zero out return value.
    leave                   #    equal to mov %ebp, %esp; pop %ebp.
    ret                     # 13: "}"
    .section .note.GNU-stack,"",@progbits # security feature to allow a non-executable stack 

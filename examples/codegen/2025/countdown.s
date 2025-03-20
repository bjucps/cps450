    .comm x, 4, 4
    .align 4
STDOUT: .long 1
SIZE: .long 10
    blastoff:
    .string    "Blastoff!\n"
    .globl    main
main:
    leal    4(%esp), %ecx    
    pushl   -4(%ecx)    
    pushl   %ebp    
    movl    %esp, %ebp    
    pushl   %ebx    
    pushl   %ecx    
    subl    $32, %esp    
    call    __x86.get_pc_thunk.bx    
    addl    $_GLOBAL_OFFSET_TABLE_, %ebx    
    movl    $5, x@GOTOFF(%ebx)    
LOOP:    
    cmpl    $0, x@GOTOFF(%ebx)    
    jle     ENDLOOP    
    subl    $4, %esp    
    movl    x@GOTOFF(%ebx), %eax    
    pushl   %eax    
    call    writeint@PLT    
    addl    $8, %esp    
    subl    $1, x@GOTOFF(%ebx)    
    jmp     LOOP
ENDLOOP:    
    subl    $4, %esp    
    pushl   SIZE@GOTOFF(%ebx)
    leal    blastoff@GOTOFF(%ebx), %eax  
    pushl   %eax
    pushl   STDOUT@GOTOFF(%ebx)
    call    write@PLT    
    addl    $16, %esp
    leal    -8(%ebp), %esp    
    popl    %ecx    
    popl    %ebx    
    popl    %ebp    
    leal    -4(%ecx), %esp    
    ret    
    .section  .note.GNU-stack,"",@progbits    

.section .data                              #    Data section for variables/constants/VFTs.
                                            #       Allows relocation.
VFTOyd:                                     #    Base class
    .long   0
    .long   Oyd_toString

VFTParent:                                  #  1: "class Parent is"
    .long   VFTOyd
    .long   Oyd_toString
    .long   Parent_initP
    .long   Parent_foo
    .long   Parent_getX

VFTChild:                                   # 22: "class Child inherits from Parent is"
    .long   VFTParent
    .long   Oyd_toString
    .long   Parent_initP
    .long   Child_foo
    .long   Parent_getX
    .long   Child_initC
    .long   Child_getY

Oyd_string:
    .string "none"
.text                                       #    Read-only code section

Oyd_toString:                               #    implicit toString for base class
    pushl   %ebp                            #    me: bp+8
    movl    %esp, %ebp
    movl    Oyd_toString@GOTOFF(%ebx), %eax #    toString := "none"
    leave
    ret

Parent_initP:                               #  4: "init(newX: int): Parent is"
    pushl   %ebp                            #    me: bp+8, me.x: me+8, newX: bp+12
    movl    %esp, %ebp                      #  5: "begin"
    pushl   %ebx
    movl    8(%ebp), %eax
    movl    12(%ebp), %ebx
    movl    %ebx, 8(%eax)                   #  6: "x := newX"
                                            #  7: "initP := me" already in ax
    popl    %ebx
    leave
    ret                                     #  8: "end init"

Parent_foo:                                 # 10: "foo() is"
    pushl   %ebp                            #    me in bp+8, newX in bp+12
    movl    %esp, %ebp                      # 11: "begin"
    pushl   %ebx

    subl    $12, %esp                       #    pre-call padding
    movl    8(%ebp), %eax                   #    num arg: "x"
    push    8(%eax)
    call    writeint@PLT                    # 12: "out.writeint(x)"
    addl    $16, %esp                       #    clear stack after call

    popl    %ebx
    leave
    ret                                     # 13: "end foo"

Parent_getX:                                # 15: "getX(): int is"
    pushl   %ebp                            #    me in bp+8
    movl    %esp, %ebp                      # 16: "begin"
    pushl   %ebx
    movl    8(%ebp), %ebx                   # 17: "getX := x"
    movl    8(%ebx), %eax
    popl    %ebx
    leave
    ret                                     # 18: "end getX"

Child_initC:                                # 25: "initC(newX: int, newY: int): Child is"
    pushl   %ebp                            #    me: bp+8, me.x: me+8, me.y: me+12, newX: bp+12, newY: bp+16
    movl    %esp, %ebp                      # 26: "begin"
    pushl   %ebx
    pushl   %ecx
    
    movl    8(%ebp), %eax                   #    retrieve me
    subl    $8, %esp                        #    pre-call padding
    movl    12(%ebp), %ecx                  #    newX arg: "newX"
    pushl   %ecx
    pushl   %eax                            #    me arg: "me"
    movl    (%eax), %ecx                    #    load VFTChild "Parent_initP"
    call    *8(%ecx)                        # 27: "initP(newX)"
    addl    $16, %esp                       #    post-call stack clearing

    movl    8(%ebp), %eax                   #    retrieve "me"
    movl    16(%ebp), %ecx                  #    retrieve "newY"
    movl    %ecx, 12(%eax)                  # 28: "y = newY"
                                            # 29: "initP := me" (already in ax)
    popl    %ecx
    popl    %ebx
    leave
    ret                                     # 30: "end init"

Child_getY:                                 # 32: "getY(): int is"
    pushl   %ebp                            #    me in bp+8, me.x: me+8, me.y: me+12
    movl    %esp, %ebp                      # 33: "begin"
    pushl   %ebx
    movl    8(%ebp), %ebx
    movl    12(%ebx), %eax                  # 34: "getY := y"
    popl    %ebx
    leave
    ret                                     # 35: "end getY"

Child_foo:                                  # 38: "foo() is"
    pushl   %ebp                            #    me in bp+8, newX in bp+12
    movl    %esp, %ebp                      # 39: "begin"
    pushl   %ebx
    pushl   %ecx
    pushl   %edx

    movl    8(%ebp), %edx                   #    retrieve me
    subl    $12, %esp                       #    pre-call padding
    pushl   %edx                            #    me arg: "me"
    movl    (%edx), %ecx                    #    load VFTChild "Parent_getX"
    call    *16(%ecx)                       #    "getX()"
    addl    $16, %esp                       #    clear stack after call

    addl    12(%edx), %eax                  #    "getX()+y"

    subl    $12, %esp                       #    pre-call padding
    push    %eax                            #    num arg: "getX()+y"
    call    writeint@PLT                    # 40: "out.writeint(getX()+y)"
    addl    $16, %esp                       #    clear stack after call

    popl    %edx
    popl    %ecx
    popl    %ebx
    leave
    ret                                     # 41: "end foo"

    .globl  main_start                      # 47: "start() is"
main_start:                                 #    me in bp+8, a in bp-8
                                            # 48: "begin"
    pushl   %ebp                            #    store original bp.
    movl    %esp, %ebp                      #    set bp.
    pushl   %ecx                            #    store original cx.
    pushl   %edx                            #    store original dx.

    subl    $8, %esp                        #    pre-call padding
    pushl   $16                             #    size arg: 16 (8 bytes reserved and 8 bytes for x and y)
    pushl   $1                              #    number arg: 1
    call    calloc@PLT                      #    "(new Child)"
    addl    $16, %esp                       #    post-call stack clearing
    pushl   %eax                            #    leave pointer returned from calloc on stack
    leal    VFTChild@GOTOFF(%ebx), %ecx     #    initialize pointer to VFT for Child
    movl    %ecx, (%eax)

    subl    $4, %esp                        #    pre-call padding
    pushl   $5                              #    inY arg: 5
    pushl   $2                              #    inX arg: 2
    pushl   %eax                            #    me arg: "new Child"
    movl    (%eax), %ecx                    #    load VFTChild "initC"
    call    *20(%ecx)                       #    "(new Child).initC(2, 5)"
    addl    $16, %esp                       #    clear stack after call
    movl    8(%ebp), %edx                   #    copying main.me to ecx
    movl    %eax, 8(%edx)                   # 49: "child := (new Child).initC(2, 5)"

    subl    $12, %esp                       #    pre-call padding
    pushl   8(%edx)                         #    me arg: "child"
    call    *12(%ecx)                       # 50: "child.foo()"
    addl    $16, %esp                       #    clear stack after call
    popl    %edx                            #    restore dx.
    popl    %ecx                            #    restore cx.
    leave
    ret                                     # 51: "end start"

    .globl    main_destructor               #    "main.delete()" (implicit)
main_destructor :                           #    me in bp+8
    pushl   %ebp                            #    store original bp.
    movl    %esp, %ebp                      #    set bp.
    pushl   %ecx                            #    store original cx.

    # free
    subl    $12, %esp                       #    pre-call padding
    movl    8(%ebp), %ecx                   #    get "me"
    movl    8(%ecx), %eax                   #    get "me.child"
    pushl   %eax                            #    ptr arg: "me.child"
    call    free@PLT                        #    free "me.child"
    addl    $16, %esp                       #    post-call stack clearing

    # free
    subl    $12, %esp                       #    pre-call padding
    movl    8(%ebp), %eax                   #    get "me"
    pushl   %eax                            #    ptr arg: "me"
    call    free@PLT                        #    free "me"
    addl    $16, %esp                       #    post-call stack clearing
    leal    -4(%ebp), %esp                  #    set sp to bp-num_regs_pushed*4.
    popl    %ecx
    leave
    ret                                     #    end main.delete

    .globl  main                            #    assembly main
main:                                       #    local main object at bp-12 (implicit)
    pushl   %ebp                            #    store the original bp.
    movl    %esp, %ebp                      #    set bp.
    pushl   %ebx                            #    store original bx (at bp-4).
    pushl   %ecx                            #    store original cx (at bp-8); local variables begin at bp-12.
    subl    $16, %esp                       #    reserve space on the stack for the global offset table.
    call    __x86.get_pc_thunk.bx           #    for function calls and named variables
    addl    $_GLOBAL_OFFSET_TABLE_, %ebx    #    do not overwrite bx.

    # calloc
    subl    $8, %esp                        #    pre-call padding
    pushl   $12                             #    size arg: 12 (8 bytes reserved and 4 bytes for child)
    pushl   $1                              #    number arg: 1
    call    calloc@PLT                      #    "new Main()" (implicit)
    addl    $16, %esp                       #    post-call stack clearing
    movl    %eax, -12(%ebp)                 #    "main = new Main()" (implicit)

    # main_start
    subl    $12, %esp                       #    pre-call padding
    pushl   -12(%ebp)                       #    me argument: "main"
    call    main_start@PLT                  #    "start()"
    addl    $16, %esp                       #    post-call stack clearing

    # main_destructor (optional)
    subl    $12, %esp                       #    pre-call padding
    movl    -12(%ebp), %ecx                 #    get "main" local variable
    pushl   %ecx                            #    me arg: "main"
    call    main_destructor@PLT             #    "main.delete()" (implicit and optional)
    addl    $16, %esp                       #    post-call stack clearing

    movl    $0, %eax                        #    return value: no errors

    leal    -8(%ebp), %esp                  #    set sp to bp-num_regs_pushed*4.
    popl    %ecx                            #    restore cx
    popl    %ebx                            #    restore bx
    leave                                   #     equal to mov %ebp, %esp; pop %ebp.
    ret                                     # 52: "end Main"
    .section .note.GNU-stack,"",@progbits   #    allow a non-executable stack

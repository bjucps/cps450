    .globl  Point_init                    # 4: "init(inX: int; inY: int): Point is"
Point_init:                               #    me: bp+______(a), me.x: me+______(x), me.y: me+______(y)
                                          #    inX: bp+______(b), intY: bp+______(c)
                                          # 5: "begin"
    pushl   %ebp                          #    function prologue
    movl    %esp, %ebp
    pushl   %ebx

    movl    ______(a)(%ebp), %eax
    movl    ______(b)(%ebp), %ebx
    movl    %ebx, ______(x)(%eax)         # 6: "me.x = inX"
    movl    ______(c)(%ebp), %ebx
    movl    %ebx, ______(y)(%eax)         # 7: "me.y = inY"
                                          # 8: "init := me" already in ax
    popl    %ebx
    leave
    ret                                   # 9: "end init"
    .globl  Point_getX                    # 10: "getX(): int is"
Point_getX:                               #    me in bp+______(a)
                                          # 11: "begin"
    pushl   %ebp                          #    function prologue
    movl    %esp, %ebp
    pushl   %ebx

    movl    ______(a)(%ebp), %ebx         # 12: "getX := x"
    movl    ______(x)(%ebx), %eax

    popl    %ebx
    leave
    ret                                   # 13: "end getX"

    .globl  Point_setX                    # 14: "setX(int newX) is"
Point_setX:                               #    me in bp+______(a), newX in bp+______(b)
                                          # 15: "begin"
    pushl   %ebp                          #    function prologue
    movl    %esp, %ebp
    pushl   %ebx

    movl    ______(a)(%ebp), %eax         # 16: "x := newX"
    movl    ______(b)(%ebp), %ebx
    movl    %ebx, ______(x)(%eax)

    popl    %ebx
    leave
    ret                                   # 17: "end setX"

    .globl  Main_foo                      # 22: "foo(a: int; b: int): int is" me->bp+______(a),
Main_foo:                                 #    a->bp+______(b), b->bp+______(c), x->bp-______(p)
                                          # 24: "begin"
    pushl   %ebp                          #    store the original bp.
    movl    %esp, %ebp                    #    set bp.
    pushl   %ecx                          #    using cx, not bx (_GLOBAL_OFFSET_TABLE_)
    movl    ______(a)(%ebp), %ecx         #    put "me.loc" in ax
    movl    ______(x)(%ecx), %eax

    subl    $______(t), %esp              #    pre-call padding
    pushl   %eax                          #    me arg: "loc"
    call    Point_getX@PLT                #    "loc.getX()"
    addl    $16, %esp                     #    clear stack after call
    
    movl    %eax, -______(p)(%ebp)        # 25: "x := loc.getX()"
    addl    ______(c)(%ebp), %eax         #    "b + x"
    addl    ______(b)(%ebp), %eax         # 26: "foo := a + (b + x)"
    pushl   %eax                          #     push "foo" to preserve it.

    subl    $______(t), %esp              #    pre-call padding
    pushl   -______(p)(%ebp)              #    num arg: "x"
    call    writeint@PLT                  # 27: "out.writeint(x)"
    addl    $16, %esp                     #    clear stack after call

    leal    -4(%ebp), %esp                #    set sp to bp-num_regs_pushed*4.
    popl    %eax                          #    pop "foo" as return value
    popl    %ecx
    leave
    ret                                   # 28: "end foo"

    .globl  main_start                    # 29: "start() is"
main_start:                               #    me in bp+______(a), a in bp-______(p)
                                          # 31: "begin"
    pushl   %ebp                          #    store original bp.
    movl    %esp, %ebp                    #    set bp.
    pushl   %ecx                          #    store original cx. locals vars start at bp-______(p).

    subl    $______(u), %esp              #    pre-call padding
    pushl   $16                           #    size arg: 16 (8 bytes reserved and 8 bytes for x and y)
    pushl   $1                            #    number arg: 1
    call    calloc@PLT                    #    "(new Point)"
    addl    $16, %esp                     #    post-call stack clearing

    subl    $______(v), %esp              #    pre-call padding
    pushl   $5                            #    inY arg: 5
    pushl   $2                            #    inX arg: 2
    pushl   %eax                          #    me arg: "new Point"
    call    Point_init@PLT                #    "init(2, 5)"
    addl    $16, %esp                     #    clear stack after call
    movl    ______(a)(%ebp), %ecx         #    copying main.me to ecx
    movl    %eax, ______(x)(%ecx)         # 32: "loc := (new Point).init(2, 5)"

    subl    $______(u), %esp              #    pre-call padding
    pushl   $3                            #    newX arg: 3
    pushl   8(%ecx)                       #    me arg: "loc"
    call    Point_setX@PLT                # 33: "loc.setX(3)"
    addl    $16, %esp                     #    clear stack after call

    subl    $______(v), %esp              #    pre-call padding
    pushl   $5                            #    b arg: 5
    pushl   $9                            #    a arg: 9
    pushl   ______(a)(%ebp)               #    me arg: "me"
    call    Main_foo@PLT                  #    "foo(9, 5)"
    addl    $16, %esp                     #    clear stack after call

    movl    %eax, -______(p)(%ebp)        # 34: "a := foo(9, 5)"
    leal    -4(%ebp), %esp                #    set sp to bp-num_regs_pushed*4.
    popl    %ecx                          #    restore cx.
    leave
    ret                                   # 35: "end start"

    .globl    main_destructor             #    "main.delete()" (implicit)
main_destructor :                         #    me in bp+______(a)
    pushl   %ebp                          #    store original bp.
    movl    %esp, %ebp                    #    set bp.
    pushl   %ecx                          #    store original cx.

    # free
    subl    $______(t), %esp              #    pre-call padding
    movl    ______(a)(%ebp), %ecx         #    get "me"
    movl    8(%ecx), %eax                 #    get "me.loc"
    pushl   %eax                          #    ptr arg: "me.loc"
    call    free@PLT                      #    free "me.loc"
    addl    $16, %esp                     #    post-call stack clearing

    # free
    subl    $______(t), %esp              #    pre-call padding
    movl    ______(a)(%ebp), %eax         #    get "me"
    pushl   %eax                          #    ptr arg: "me"
    call    free@PLT                      #    free "me"
    addl    $16, %esp                     #    post-call stack clearing
    leal    -4(%ebp), %esp                #    set sp to bp-num_regs_pushed*4.
    popl    %ecx
    leave
    ret                                   #    end main.delete

    .globl  main                          #    assembly main
main:                                     #    local main object at bp-______(q) (implicit)
    pushl   %ebp                          #    store the original bp.
    movl    %esp, %ebp                    #    set bp.
    pushl   %ebx                          #    store original bx (at bp-4)
    pushl   %ecx                          #    store original cx (at bp-8).
 
    subl    $16, %esp                     #    reserve space on the stack for the global offset table.
    call    __x86.get_pc_thunk.bx         #    for function calls and named variables
    addl    $_GLOBAL_OFFSET_TABLE_, %ebx  #    do not overwrite bx.

    # calloc
    subl    $______(u), %esp              #    pre-call padding
    pushl   $12                           #    size arg: 12 (8 bytes reserved and 4 bytes for loc)
    pushl   $1                            #    number arg: 1
    call    calloc@PLT                    #    "new Main()" (implicit)
    addl    $16, %esp                     #    post-call stack clearing
    movl    %eax, -______(q)(%ebp)        #    "main = new Main()" (implicit)

    # main_start
    subl    $______(t), %esp              #    pre-call padding
    pushl   -______(q)(%ebp)              #    me argument: "main"
    call    main_start@PLT                #    "start()"
    addl    $16, %esp                     #    post-call stack clearing

    # main_destructor (optional)
    subl    $______(t), %esp              #    pre-call padding
    movl    -______(q)(%ebp), %ecx        #    get "main" local variable
    pushl   %ecx                          #    me arg: "main"
    call    main_destructor@PLT           #    "main.delete()" (implicit and optional)
    addl    $16, %esp                     #    post-call stack clearing

    movl    $0, %eax                      #    return value: no errors

    leal    -______(j)(%ebp), %esp        #    clear the stack of everything after cx.
    popl    %ecx                          #    restore cx
    popl    %ebx                          #    restore bx
    leave                                 #     equal to mov %ebp, %esp; pop %ebp.
    ret                                   # 36: "end Main"
    .section .note.GNU-stack,"",@progbits #    allow a non-executable stack

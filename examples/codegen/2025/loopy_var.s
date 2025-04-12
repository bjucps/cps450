 # Compile: gcc -m32 loopy_var.s stdlib.o
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
    .comm x, 4, 4                         # allocate 4 bytes for x with 4-byte alignment

    .globl  main
main:
    pushl   %ebp                          # store the original bp.
    movl    %esp, %ebp                    # set bp.
    pushl   %ebx                          # store original bx (at bp-4)
    subl    $16, %esp                     # reserve space on the stack for the global offset table.
    call    __x86.get_pc_thunk.bx         # put ip in bx. See https://courses.cs.vt.edu/cs3214/spring2022/questions/pcmaterialization        
    addl    $_GLOBAL_OFFSET_TABLE_, %ebx  # set bx to _GLOBAL_OFFSET_TABLE_ + ip of <main+something>
    movl    $3, x@GOTOFF(%ebx)            # x := 3
                                          # if (x > 0) then
    cmpl    $0, x@GOTOFF(%ebx)            # Compare 0 with x (bp-8)
    jle     ELSE                          # if x <= 0, jump to ELSE

LOOP:                                     # loop while x > 0
    cmpl    $0, x@GOTOFF(%ebx)            # Compare 0 with x
    jle     ENDIF                         # when x <= 0, jump to ENDIF
                                          # out.writeint(_x)
    subl    $12, %esp                     # pre-call padding
    movl    x@GOTOFF(%ebx), %eax          # push parameter (_x)
    pushl   %eax                         
    call    writeint@PLT                  # call stub for writeint
    addl    $16, %esp                     # post-call stack clearing
    subl    $1, x@GOTOFF(%ebx)            # x := x - 1
    jmp     LOOP
ELSE:                                     # out.writeint(999)
    subl    $12, %esp                     # pre-call padding
    movl    $999, %eax                    # push parameter
    pushl   %eax                         
    call    writeint@PLT                  # call stub for write
    addl    $16, %esp                     # post-call stack clearing
ENDIF:
    movl    $0, %eax                      # zero out return value.
    leal    -4(%ebp), %esp                # set sp to bp-num_regs_pushed*4.
    popl    %ebx                          # restore bx
    leave                                 # equal to mov %ebp, %esp; pop %ebp.
    ret
    .section .note.GNU-stack,"",@progbits # security feature to allow a non-executable stack 

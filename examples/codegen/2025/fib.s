# void writeint(int num);
# int fib(int x) {
#     int result = 1;
#     if (x > 2) {
#         result = fib(x-1) + fib(x-2);
#         writeint(result);
#     }
#     return result;
# }

# int main(int argc, char **argv) {
#     writeint(fib(5));
# }

    .globl    fib
fib:
    pushl   %ebp            # store the original bp.
    movl    %esp, %ebp      # set bp.
    pushl   %ebx            # store original bx (at bp-4); local variables begin at bp-8.
    pushl   %ecx            # backup cx (at bp-8); locals vars at bp-12.
    
    movl    $1, -12(%ebp)   # set result (bp-12) to 1
    cmpl    $2, 8(%ebp)     # compare x (bp+8) to 2
    jle     ENDING          # jump to ending if x is 2 or less.

    movl    8(%ebp), %eax   # fib(x-1): 
    subl    $1, %eax        #    a) subtract 1 from x
    subl    $12, %esp       #    b) subtract enough bytes so that the space allocated is a multiple of 16.
    pushl   %eax            #    c) set x-1 to be the argument
    call    fib             #    d) call fib
    addl    $16, %esp       # clean off stack after call (always a multiple of 16).
    movl    %eax, %ecx      # store return value from fib(x-1) in si

    movl    8(%ebp), %eax   # fib(x-2): 
    subl    $2, %eax        #    a) subtract 2 from x
    pushl   %eax            #    b) set the argument
    call    fib             #    c) call fib
    addl    $4, %esp
    addl    %ecx, %eax      # add fib(x-1) to fib(x-2)
	
    movl    %eax, -12(%ebp) # store sum in result (bp-12)
    subl    $12, %esp       # subtract padding so that parameter + padding is a multiple of 16.
    pushl   -12(%ebp)       # push result as paramter
    call    writeint@PLT
    addl    $16, %esp       # clean off stack after call (always a multiple of 16).
ENDING:
    movl    -12(%ebp), %eax # put return value in ax.
    leal    -8(%ebp), %esp  # set sp to bp-num_regs_pushed*4.
    popl    %ecx            # restore cx
    popl    %ebx            # restore bx
    leave                   # equal to mov %ebp, %esp; pop %ebp.
    ret


    .globl    main
main:
    pushl   %ebp            # store the original bp.
    movl    %esp, %ebp      # set bp.

    pushl    $10            # call fib(...)
    call    fib
    addl    $4, %esp        # clear stack after call

    subl    $12, %esp       # subtract padding (keep writeint from overwriting stack.)
    pushl    %eax           # push value returned from fib(...)
    call    writeint@PLT    # call stub for writeint.
    addl    $16, %esp       # clean off stack after call (always a multiple of 16).

    movl    $0, %eax        # zero out return value.
    leave                   # equal to mov %ebp, %esp; pop %ebp.
    ret
    .section .note.GNU-stack,"",@progbits # security feature to allow a non-executable stack 

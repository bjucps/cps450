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
    pushl    %ebp            # backup bp, sp, si, bx
    movl    %esp, %ebp            
    pushl    %esi
    pushl    %ebx

    movl    $1, -12(%ebp)    # set result (bp-12) to 1
    cmpl    $2, 8(%ebp)      # compare x (bp+8) to 2
    jle     ENDING           # jump to ending if x is 2 or less.

    movl    8(%ebp), %eax    # fib(x-1): 
    subl    $1, %eax         #    a) subtract 1 from x
    subl    $12, %esp        #    b) subtract enough bytes so that the space allocated is a multiple of 16.
    pushl   %eax             #    c) set x-1 to be the argument
    call    fib              #    d) call fib
    addl    $16, %esp        # clean off stack after call (always a multiple of 16).
    movl    %eax, %esi       # store return value from fib(x-1) in si

    movl    8(%ebp), %eax    # fib(x-2): 
    subl    $2, %eax         #    a) subtract 2 from x
    pushl   %eax             #    b) set the argument
    call    fib              #    c) call fib
    addl    $4, %esp
    addl    %esi, %eax       # add fib(x-1) to fib(x-2)
	
    movl    %eax, -12(%ebp)  # store sum in result (bp-12)
    subl    $12, %esp        # subtract padding so that parameter + padding is a multiple of 16.
    pushl   -12(%ebp)        # push result as paramter
    call    writeint@PLT
    addl    $16, %esp        # clean off stack after call (always a multiple of 16).
ENDING:
    movl    -12(%ebp), %eax  # put return value in ax.
    leal    -8(%ebp), %esp   # restore sp, bx, si, bp.
    popl    %ebx
    popl    %esi
    popl    %ebp
    ret


    .globl    main
main:
    leal    4(%esp), %ecx    # store sp+4, sp, bp, bx, sp+4
    pushl   -4(%ecx)			
    pushl   %ebp
    movl    %esp, %ebp
    pushl   %ebx
    pushl   %ecx

    pushl    $10             # call fib(...)
    call    fib
    addl    $4, %esp         # clear stack after call

    subl    $12, %esp        # subtract padding (keep writeint from overwriting stack.)
    pushl    %eax            # push value returned from fib(...)
    call    writeint@PLT     # call stub for writeint.
    addl    $16, %esp        # clean off stack after call (always a multiple of 16).
    movl    $0, %eax         # zero out return value.
    leal    -8(%ebp), %esp   # restore sp+4, bx, bp, sp
    popl    %ecx
    popl    %ebx
    popl    %ebp
    leal    -4(%ecx), %esp
    ret
    .section .note.GNU-stack,"",@progbits # security feature to allow a non-executable stack 

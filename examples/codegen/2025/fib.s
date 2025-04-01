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
    pushl    %ebp                 # backup bp, sp, si, bx
    movl    %esp, %ebp            
    pushl    %esi
    pushl    %ebx

    movl    $1, -12(%ebp)         # set result (bp-12) to 1
    cmpl    $2, 8(%ebp)           # compare x (bp-8) to 2
    jle     ENDING                # jump to ending if x is 2 or less.

    movl    8(%ebp), %eax         # fib(x-1): 
    subl    $1, %eax              #    a) subtract 1 from x
    subl    $12, %esp             # pad space to keep fib from overwriting (bp-12).
	pushl   %eax                  #    b) set x-1 to be the argument
    call    fib                   #    c) call fib
    addl    $16, %esp             # cleanup stack after call
    movl    %eax, %esi            # store return value from fib(x-1) in si

    movl    8(%ebp), %eax         # fib(x-2): 
    subl    $2, %eax              #    a) subtract 2 from x
    pushl   %eax                  #    b) set the argument
    call    fib                   #    c) call fib
    addl    $4, %esp
    addl    %esi, %eax            # add fib(x-1) to fib(x-2)
	
    movl    %eax, -12(%ebp)       # store sum in result (bp-12)
    subl    $12, %esp             # pad space to keep writeint from overwriting (bp-12).
    pushl   -12(%ebp)             # print result
    call    writeint@PLT
    addl    $16, %esp             # cleanup stack after call
ENDING:
    movl    -12(%ebp), %eax       # put return value in ax.
    leal    -8(%ebp), %esp        # restore sp, bx, si, bp.
    popl    %ebx
    popl    %esi
    popl    %ebp
    ret


    .globl    main
main:
    leal    4(%esp), %ecx		  # backup sp-4, bp, bx, cx
    pushl   -4(%ecx)			
    pushl   %ebp
    movl    %esp, %ebp
    pushl   %ebx
    pushl   %ecx

    pushl    $5                   # call fib(5)
    call    fib
    addl    $4, %esp
    pushl    %eax
    call    writeint@PLT
    addl    $4, %esp
    movl    $0, %eax

    leal    -8(%ebp), %esp     	  # restore cx, bx, bp, sp-4
    popl    %ecx
    popl    %ebx
    popl    %ebp
    leal    -4(%ecx), %esp
    ret
    .section .note.GNU-stack,"",@progbits    # security feature to allow a non-executable stack 

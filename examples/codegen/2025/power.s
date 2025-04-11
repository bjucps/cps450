# void writeint(int num);
# int power(int num, int exp) {
#     int result = 1;
#     if (exp > 0) {
#         result = num * power(num, exp-1);
#     }
#     return result;
# }
# int main(int argc, char **argv) {
#     writeint(power(2, 8));
# }

    .globl    power
power:                       # standard function prologue:
    pushl   %ebp             # backup bp, sp
    movl    %esp, %ebp
    pushl   %edx
    movl    $1, -12(%ebp)    # set result (bp-12) to 1
    cmpl    $0, 12(%ebp)     # compare exp (bp+12) to 0
    jle     ENDING           # jump to ending if exp is 0 or less.
    movl    12(%ebp), %eax   # power (num, exp-1)
    subl    $1, %eax         #    a) subtract 1 from exp
    subl    $8, %esp         #    b) subtract enough bytes so that the space allocated is a multiple of 16.
    pushl   %eax             #    c) push 2nd parameter: exp-1
    pushl   8(%ebp)          #    d) push 1st parameter: num (bp+8)
    call    power            #    e) call power
    addl    $16, %esp        # clean off stack after call (always a multiple of 16).
    movl    8(%ebp), %edx    # multiply num (bp+8) by result of power(num, exp-1)
    imull    %edx, %eax
    movl    %eax, -12(%ebp)  # store product in result (bp-12)
ENDING:
    movl    -12(%ebp), %eax  # set result as return value (in ax).
    leal    -4(%ebp), %esp   # set sp to bp-num_regs_pushed*4.
    popl    %edx             # restore dx
    leave                    # equal to mov %ebp, %esp; pop %ebp.
    ret
    .globl  main
main:
    pushl   %ebp             # store the original bp.
    movl    %esp, %ebp       # set bp.
    pushl   %ebx             # store original bx (at bp-4)
    pushl   %ecx             # store original cx (at bp-8); local variables begin at bp-12.
    pushl   $8               # push second parameter (exponent)
    pushl   $2               # push first parameter (number)
    call    power            # call power(...)
    addl    $8, %esp         # clean off stack after call.
    subl    $12, %esp        # subtract padding so that parameter + padding is a multiple of 16.
    pushl   %eax             # push value returned from power(...) as parameter
    call    writeint@PLT     # call stub for writeint.
    addl    $16, %esp        # clean off stack after call (always a multiple of 16).
    movl    $0, %eax         # zero out return value.
    leal    -8(%ebp), %esp   # set sp to bp-num_regs_pushed*4.
    popl    %ecx             # restore cx
    popl    %ebx             # restore bx
    leave                    # equal to mov %ebp, %esp; pop %ebp.
    ret
    .section .note.GNU-stack,"",@progbits # security feature to allow a non-executable stack 

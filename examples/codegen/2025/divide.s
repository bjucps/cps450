# C source
# int main () {
#    int x = 37;
#    int y = 5;
#    int a = x / y;
# }

    .globl  main
main:
    pushl   %ebp            # store the original bp.
    movl    %esp, %ebp      # set bp.
    pushl   %edx            # store original dx (at bp-4); local variables begin at bp-8.
    movl    $37, -16(%ebp)  # Put 37 in x  (bp-16)
    movl    $5, -12(%ebp)   # Put 5 in y (bp-12)
    movl    -16(%ebp), %eax # Put x (bp-16) in ax
    cltd                    # sign extends eax into edx:eax
    idivl   -12(%ebp)       # divde by y
    movl    %eax, -8(%ebp)  # put quotient in a (bp-8)
    movl    $0, %eax        # zero out ax
    leal    -4(%ebp), %esp  # set sp to bp-num_regs_pushed*4.
    popl    %edx            # restore dx
    leave                   # equal to mov %ebp, %esp; pop %ebp.
    ret
    .section .note.GNU-stack,"",@progbits # security feature to allow a non-executable stack 

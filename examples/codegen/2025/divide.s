# C source
# int main () {
#    int x = 37;
#    int y = 5;
#    int a = x / y;
# }

    .globl    main                        # main function (global)
main:                                     # standard function prologue:
    pushl   %ebp                          # push bp
    movl    %esp, %ebp                    # store updated sp in bp.
    movl    $37, -12(%ebp)                # Put 37 in x  (bp-12)
    movl    $5, -8(%ebp)                  # Put 5 in y (bp-8)
    movl    -12(%ebp), %eax               # Put x (bp-12) in ax
    cltd                                  # sign extends eax into edx:eax
    idivl   -8(%ebp)                      # divde by y
    movl    %eax, -4(%ebp)                # put quotient in a (bp-4)
    movl    $0, %eax                      # zero out ax
    leave                                 # i.e.,    mov    %ebp, %esp
                                          #        pop    %ebp
    ret
    .section .note.GNU-stack,"",@progbits # security feature to allow a non-executable stack 

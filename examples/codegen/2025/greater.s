# C source
# int main () {
#     int x = 37;
#     int y = 5;
#     int z = y;
#     if (x > y) {
#         z = x;
#     }
# }
    .globl    main                       # main function (global)
main:                                    # standard function prologue:
    pushl   %ebp                         # push bp
    movl    %esp, %ebp                   # store updated sp in bp.
    movl    $37, -12(%ebp)               # Put 37 in x  (bp-12)
    movl    $5, -8(%ebp)                 # Put 5 in y (bp-8)
    movl    -8(%ebp), %eax               # Put y in z (bp-4)
    movl    %eax, -4(%ebp)               
    movl    -12(%ebp), %eax              # Put x in ax
    cmpl    -8(%ebp), %eax               # Compare y (bp-8) with x (ax)
    jle     ENDIF                        # if x <= y, jump to ENDIF
    movl    -12(%ebp), %eax              # Put x in z (bp-4)
    movl    %eax, -4(%ebp)               
ENDIF:
    movl    $0, %eax                     # zero out return value.
    leave                                # equivalent to  mov    %ebp, %esp; pop    %ebp
    ret
    .section .note.GNU-stack,"",@progbits # security feature to allow a non-executable stack 

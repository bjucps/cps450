# C source
# int main () {
#     int x = 37;
#     int y = 5;
#     int a = x - y;
# }
.globl    main              # main function (global)
main:
    pushl   %ebp            # push bp
    movl    %esp, %ebp      # store updated sp in bp.
    movl    $37, -12(%ebp)  # Put 37 in x  (bp-12)
    movl    $5, -8(%ebp)    # Put 5 in y (bp-8)
    movl    -12(%ebp), %eax # Put x (bp-12) in ax
    subl    -8(%ebp), %eax  # Subtract y from x.
    movl    %eax, -4(%ebp)  # put difference in a (bp-4)
    movl    $0, %eax        # zero out ax
    leave                   # equal to mov %ebp, %esp, pop    %ebp
    ret
    .section .note.GNU-stack,"",@progbits # security feature to allow a non-executable stack 

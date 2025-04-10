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

    movl    $0, %eax                      # zero out ax
    leave                                 # i.e.,    mov    %ebp, %esp
                                          #        pop    %ebp
    ret
    .section .note.GNU-stack,"",@progbits # security feature to allow a non-executable stack 

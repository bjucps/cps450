# C source
# int main () {
#     int x = 37;
#     int y = 5;
#     int z = y;
#     if (x > y) {
#         z = x;
#     }
# }
    .globl    main                           # main function (global)
main:                                        # standard function prologue:
    pushl   %ebp                             # push bp
    movl    %esp, %ebp                       # store updated sp in bp.
    subl    $16, %esp                        # reserve space on the stack. 
    call    __x86.get_pc_thunk.ax            # put ip in ax. See https://courses.cs.vt.edu/cs3214/spring2022/questions/pcmaterialization        
    addl    $_GLOBAL_OFFSET_TABLE_, %eax     # set ax to _GLOBAL_OFFSET_TABLE_ + ip of <main+23>
    movl    $37, -12(%ebp)                   # Put 37 in x  (bp-12)
    movl    $5, -8(%ebp)                     # Put 5 in y (bp-8)
    movl    -8(%ebp), %eax                   # Put y in z (bp-4)
    movl    %eax, -4(%ebp)                   #     (continued)
    movl    -12(%ebp), %eax                  # Put x in ax
    cmpl    -8(%ebp), %eax                   # Compare y (bp-8) with x (ax)
    jle     ENDIF                            # if x <= y, jump to ENDIF
    movl    -12(%ebp), %eax                  # Put x in z (bp-4)
    movl    %eax, -4(%ebp)                   #     (continued)
ENDIF:
    movl    $0, %eax                         # zero out ax
    leave                                    # i.e.,    mov    %ebp, %esp
                                             #        pop    %ebp
    ret                                      # function exit
    .section    .note.GNU-stack,"",@progbits # security feature to allow a non-executable stack 

# C source
# #include <unistd.h>
# int main(int argc, char **argv) {
#     int x = 6;
#     int y = 3;
#     char c = x + y + '0'; // 48 is the unicode value, 0x30 in hex 
#     write(1, &c, 1);
# }

STDOUT = 1
.globl    main
main:
    pushl   %ebp                          # store the original bp.
    movl    %esp, %ebp                    # set bp.
    pushl   %ebx                          # store original bx (at bp-4)
    pushl   %ecx                          # store original cx (at bp-8).
    pushl   %edx                          # store original dx (at bp-12); local variables begin at bp-16.
                                          # _GLOBAL_OFFSET_TABLE needed for write function call.
    call    __x86.get_pc_thunk.ax         # put ip in ax. See https://courses.cs.vt.edu/cs3214/spring2022/questions/pcmaterialization        
    addl    $_GLOBAL_OFFSET_TABLE_, %eax  # set ax to _GLOBAL_OFFSET_TABLE_ + ip of <main+something>
    movl    $6, -16(%ebp)                 # x (bp-16)= 6
    movl    -16(%ebp), %ecx               
    movl    $3, -20(%ebp)                 # y (bp-20)= 3
    movl    -20(%ebp), %edx               
    addl    %ecx, %edx                    # add 6 to 3
    addl    $48, %edx                     # add '0' to sum
    movl    %edx, -24(%ebp)               # c (bp-24) = sum
    subl    $4, %esp                      # subtract padding so that parameter + padding is a multiple of 16.
                                          # parameters:
    pushl   $1                            #    3) 1 (number of bytes to write)
    leal    -24(%ebp), %edx               #    2) Address of '9'
    pushl   %edx                          #         (continued)
    pushl   $STDOUT                       #    1) STDOUT
    movl    %eax, %ebx                    # backup ax
    call    write@PLT                     # call stub for write:
                                          #     Return value in ax.
                                          #     Address of string in cx.
    addl    $16, %esp                     # clean off stack after call (always a multiple of 16).
    movl    $0, %eax                      # zero out return value.
    leal    -12(%ebp), %esp               # set sp to bp-num_regs_pushed*4.
    popl    %edx                          # restore dx
    popl    %ecx                          # restore cx
    popl    %ebx                          # restore bx
    leave                                 # equal to mov %ebp, %esp; pop %ebp.
    ret                                   
    .section .note.GNU-stack,"",@progbits # security feature to allow a non-executable stack 

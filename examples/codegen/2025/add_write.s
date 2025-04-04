# C source
# #include <unistd.h>
# int main(int argc, char **argv) {
#     int x = 6;
#     int y = 3;
#     char c = x + y + '0'; // 48 is the unicode value, 0x30 in hex 
#     write(1, &c, 1);
# }

STDOUT = 1
.globl    main                            # main function (global)
main:                                     # standard function prologue:
    leal    4(%esp), %ecx                 # store sp+4, sp, bp, bx, sp+4
    andl	$-16, %esp                    # Necessary for calling write function.
    pushl   -4(%ecx)
    pushl   %ebp
    movl    %esp, %ebp
    pushl   %ebx
    pushl   %ecx
                                          # _GLOBAL_OFFSET_TABLE needed for write function call.
    call    __x86.get_pc_thunk.ax         # put ip in ax. See https://courses.cs.vt.edu/cs3214/spring2022/questions/pcmaterialization        
    addl    $_GLOBAL_OFFSET_TABLE_, %eax  # set ax to _GLOBAL_OFFSET_TABLE_ + ip of <main+23>
    movl    $6, -20(%ebp)                 # put 6 in cx
    movl    -20(%ebp), %ecx               
    movl    $3, -16(%ebp)                 # put 3 in dx
    movl    -16(%ebp), %edx               
    addl    %ecx, %edx                    # add 6 to 3
    addl    $48, %edx                     # add '0' to sum
    movl    %edx, -24(%ebp)               # store sum
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
    leal    -8(%ebp), %esp                # restore sp+4, bx, bp, sp
    popl    %ecx                          
    popl    %ebx                          
    popl    %ebp                          
    leal    -4(%ecx), %esp                
    ret                                   
    .section .note.GNU-stack,"",@progbits # security feature to allow a non-executable stack 

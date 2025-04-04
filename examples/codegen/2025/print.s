# C source
# #include <unistd.h>
# int main (int argc, char **argv) {
#     write(1, "42\n", 3);
# }

STDOUT = 1
hello:
    .string    "42\n"
    .globl    main                        # main function (global)
main:                                     # standard function prologue:
    leal    4(%esp), %ecx                 # store sp+4, sp, bp, bx, sp+4
    andl	$-16, %esp                    # Necessary for calling write function.
    pushl   -4(%ecx)
    pushl   %ebp
    movl    %esp, %ebp
    pushl   %ebx
    pushl   %ecx
    call    __x86.get_pc_thunk.ax         # put ip in ax. See https://courses.cs.vt.edu/cs3214/spring2022/questions/pcmaterialization        
    addl    $_GLOBAL_OFFSET_TABLE_, %eax  # set ax to _GLOBAL_OFFSET_TABLE_ + ip of <main+23>
                                          # parameters:
    subl    $4, %esp                      # subtract padding so that parameter + padding is a multiple of 16.
    pushl   $3                            # 3) 3  (number of bytes to write)
    leal    hello@GOTOFF(%eax), %edx      # 2) Address of hello
    pushl   %edx                         
    pushl   $STDOUT                       # 1) STDOUT            
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

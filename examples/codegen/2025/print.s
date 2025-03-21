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
    leal    4(%esp), %ecx                 # store address sp+4 in cx as the starting point for this program.
    pushl    -4(%ecx)                     # push sp
    pushl    %ebp                         # push bp
    movl    %esp, %ebp                    # store updated sp in bp.
    pushl    %ebx                         # push bx
    pushl    %ecx                         # push sp+4
    call    __x86.get_pc_thunk.ax         # put ip in ax. See https://courses.cs.vt.edu/cs3214/spring2022/questions/pcmaterialization        
    addl    $_GLOBAL_OFFSET_TABLE_, %eax  # set ax to _GLOBAL_OFFSET_TABLE_ + ip of <main+23>
                                          # parameters:
    pushl    $3                           # 3) 3  (number of bytes to write)
    leal    hello@GOTOFF(%eax), %edx      # 2) Address of hello
    pushl    %edx                         #        (continued)
    pushl    $STDOUT                      #     1) STDOUT            
    movl    %eax, %ebx                    # backup ax
    call    write@PLT                     # call stub for write:
                                          #     Return value in ax.
                                          #     Address of string in cx.
    addl    $12, %esp                     # clear parameters back off stack
    movl    $0, %eax                      # zero out return value.
    leal    -8(%ebp), %esp                # restore original sp+4 to sp
    popl    %ecx                          # retrieve sp + 4 (see ln 9)
    popl    %ebx                          # restore bx (see ln 8)
    popl    %ebp                          # restore bp (see ln 6)
    leal    -4(%ecx), %esp                # restore sp (see ln 4)
    ret                                   # function exit
    .section .note.GNU-stack,"",@progbits # security feature to allow a non-executable stack 

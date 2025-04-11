# C source
# #include <unistd.h>
# int main (int argc, char **argv) {
#     write(1, "42\n", 3);
# }

STDOUT = 1
hello:
    .string    "42\n"
    .globl  main
main:
    pushl   %ebp                          # store the original bp.
    movl    %esp, %ebp                    # set bp.
    pushl   %ebx                          # store original bx (at bp-4)
    pushl   %ecx                          # store original cx (at bp-8); local variables begin at bp-12.
    call    __x86.get_pc_thunk.bx         # put ip in bx. See https://courses.cs.vt.edu/cs3214/spring2022/questions/pcmaterialization        
    addl    $_GLOBAL_OFFSET_TABLE_, %ebx  # set bx to _GLOBAL_OFFSET_TABLE_ + ip of <main+something>
                                          # parameters:
    subl    $4, %esp                      # subtract padding so that parameter + padding is a multiple of 16.
    pushl   $3                            # 3) 3  (number of bytes to write)
    leal    hello@GOTOFF(%ebx), %ecx      # 2) Address of hello
    pushl   %ecx                         
    pushl   $STDOUT                       # 1) STDOUT            
    call    write@PLT                     # call stub for write:
                                          #     Return value in ax.
                                          #     Address of string in cx.
    addl    $16, %esp                     # clean off stack after call (always a multiple of 16).
    movl    $0, %eax                      # zero out return value.
    leal    -8(%ebp), %esp                # set sp to bp-num_regs_pushed*4.
    popl    %ecx                          # restore cx
    popl    %ebx                          # restore bx
    leave                                 # equal to mov %ebp, %esp; pop %ebp.
    ret
    .section .note.GNU-stack,"",@progbits # security feature to allow a non-executable stack 

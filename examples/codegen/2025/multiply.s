# C source
# int main () {
#    int x = 37;
#    int y = 5;
#    int a = x * y;
# }

    .globl  main                           # main function (global)
main:                                      # standard function prologue:
    pushl   %ebp                           # push bp
    movl    %esp, %ebp                     # store updated sp in bp.
    subl    $16, %esp                      # reserve space on the stack.
    call    __x86.get_pc_thunk.ax          # put ip in ax. See https://courses.cs.vt.edu/cs3214/spring2022/questions/pcmaterialization        
    addl    $_GLOBAL_OFFSET_TABLE_, %eax   # set ax to _GLOBAL_OFFSET_TABLE_ + ip of <main+23>
    movl    $37, -12(%ebp)                 # Put 37 in x  (bp-12)
    movl    $5, -8(%ebp)                   # Put 5 in y (bp-8)
    movl    -12(%ebp), %eax                # Put x (bp-12) in ax
    imull   -8(%ebp), %eax                 # Multiply y by x.
    movl    %eax, -4(%ebp)                 # put product in a (bp-4)
    movl    $0, %eax                       # zero out ax
    leave                                  # i.e.,    mov    %ebp, %esp
                                           #        pop    %ebp
    ret                                    # function exit
    .section  .note.GNU-stack,"",@progbits # security feature to allow a non-executable stack 

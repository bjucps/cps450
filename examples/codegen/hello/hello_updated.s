.file	"hello.c"
.data         # data segment
STDOUT = 1    # define a constant
hello:
        .string	"hello world\n"
        .globl	main
	.type	main, @function
.text           # code segment
main:
        pushl   %ebp
        movl    %esp, %ebp
        subl    $8, %esp
        andl	$-16, %esp
        xorl    %eax, %eax
        movl    %eax, -4(%ebp)
        movl    -4(%ebp), %eax
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	subl	$4, %esp
        # Call write(STDOUT, "hello world\n", 12)
	pushl	$12
	leal	hello@GOTOFF(%eax), %edx
	pushl	%edx
	pushl	$STDOUT
	movl	%eax, %ebx
	call	write@PLT
	addl	$12, %esp
    movl    $0, %eax
    leave
    ret
.section	.note.GNU-stack,"",@progbits

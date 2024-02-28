	.file	"lib.c"
	.text
.globl sub
	.type	sub, @function
sub:
	pushl	%ebp
	movl	%esp, %ebp
	movl	12(%ebp), %edx
	movl	8(%ebp), %eax
	subl	%edx, %eax
	leave
	ret
	.size	sub, .-sub
.globl mywrite
	.type	mywrite, @function
mywrite:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	subl	$4, %esp
	subl	$8, %esp
	pushl	8(%ebp)
	call	strlen
	addl	$12, %esp
	pushl	%eax
	pushl	8(%ebp)
	pushl	$0
	call	write
	addl	$16, %esp
	leave
	ret
	.size	mywrite, .-mywrite
	.section	.note.GNU-stack,"",@progbits
	.ident	"GCC: (GNU) 3.3.3 20040412 (Red Hat Linux 3.3.3-7)"

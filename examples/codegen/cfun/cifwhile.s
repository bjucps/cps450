	.file	"cifwhile.c"
	.text
.globl main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	andl	$-16, %esp
	movl	$0, %eax
	subl	%eax, %esp
	cmpl	$4, x
	jg	.L2
	incl	x
	jmp	.L3
.L2:
	subl	$5, x
.L3:
	nop
.L4:
	cmpl	$4, x
	jle	.L6
	jmp	.L5
.L6:
	incl	x
	jmp	.L4
.L5:
	leave
	ret
	.size	main, .-main
	.comm	x,4,4
	.comm	y,4,4
	.section	.note.GNU-stack,"",@progbits
	.ident	"GCC: (GNU) 3.3.3 20040412 (Red Hat Linux 3.3.3-7)"

	.file	"cdemo.c"
.globl x
	.data
	.align 4
	.type	x, @object
	.size	x, 4
x:
	.long	5
.globl y
	.align 4
	.type	y, @object
	.size	y, 4
y:
	.long	10
	.comm	z,4,4
	.text
.globl main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	movl	x, %edx
	movl	y, %eax
	cmpl	%eax, %edx
	setl	%al
	movzbl	%al, %eax
	movl	%eax, z
	popl	%ebp
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.4.3-4ubuntu5) 4.4.3"
	.section	.note.GNU-stack,"",@progbits

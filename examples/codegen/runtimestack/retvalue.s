	.file	"retvalue.c"
.globl x
	.bss
	.align 4
	.type	x, @object
	.size	x, 4
x:
	.zero	4
.globl y
	.data
	.align 4
	.type	y, @object
	.size	y, 4
y:
	.long	5
.globl z
	.align 4
	.type	z, @object
	.size	z, 4
z:
	.long	10
	.text
.globl g
	.type	g, @function
g:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$12, %esp
	movl	$3, -4(%ebp)
	movl	$5, -8(%ebp)
	movl	$7, -12(%ebp)
	movl	-8(%ebp), %eax
	addl	-4(%ebp), %eax
	addl	-12(%ebp), %eax
	addl	8(%ebp), %eax
	addl	12(%ebp), %eax
	addl	16(%ebp), %eax
	leave
	ret
	.size	g, .-g
.globl main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	andl	$-16, %esp
	movl	$0, %eax
	subl	%eax, %esp
	subl	$4, %esp
	pushl	z
	pushl	y
	pushl	x
	call	g
	addl	$16, %esp
	movl	%eax, -4(%ebp)
	movl	$0, %eax
	leave
	ret
	.size	main, .-main
	.section	.note.GNU-stack,"",@progbits
	.ident	"GCC: (GNU) 3.3.3 20040412 (Red Hat Linux 3.3.3-7)"

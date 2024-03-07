	.file	"simple.c"
	.stabs	"simple.c",100,0,2,.Ltext0
	.text
.Ltext0:
	.stabs	"gcc2_compiled.",60,0,0,0
	.globl	x
	.bss
	.align 4
	.type	x, @object
	.size	x, 4
x:
	.zero	4
	.stabs	"x:G(0,1)=r(0,1);-2147483648;2147483647;",32,0,0,0
	.stabs	"int:t(0,1)",128,0,0,0
	.globl	y
	.align 4
	.type	y, @object
	.size	y, 4
y:
	.zero	4
	.stabs	"y:G(0,1)",32,0,0,0
	.section	.rodata
.LC0:
	.string	"%d %d\n"
	.text
	.stabs	"main:F(0,1)",36,0,0,main
	.globl	main
	.type	main, @function
main:
	.stabn	68,0,6,.LM0-.LFBB1
.LM0:
.LFBB1:
.LFB0:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	movl	%esp, %ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x7c,0x6
	subl	$20, %esp
	.stabn	68,0,7,.LM1-.LFBB1
.LM1:
	movl	$10, -20(%ebp)
	.stabn	68,0,8,.LM2-.LFBB1
.LM2:
	movl	$9, -16(%ebp)
	.stabn	68,0,9,.LM3-.LFBB1
.LM3:
	movl	$8, -12(%ebp)
	.stabn	68,0,11,.LM4-.LFBB1
.LM4:
	movl	$5, x
	.stabn	68,0,12,.LM5-.LFBB1
.LM5:
	movl	$10, y
	.stabn	68,0,14,.LM6-.LFBB1
.LM6:
	movl	x, %eax
	subl	$4, %esp
	pushl	-20(%ebp)
	pushl	%eax
	pushl	$.LC0
	call	printf
	addl	$16, %esp
	.stabs	"<built-in>",132,0,0,.Ltext1
.Ltext1:
	.stabn	68,0,0,.LM7-.LFBB1
.LM7:
	movl	$0, %eax
	.stabs	"simple.c",132,0,0,.Ltext2
.Ltext2:
	.stabn	68,0,15,.LM8-.LFBB1
.LM8:
	movl	-4(%ebp), %ecx
	.cfi_def_cfa 1, 0
	leave
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.stabs	"quebec:(0,1)",128,0,0,-20
	.stabs	"awk:(0,1)",128,0,0,-16
	.stabs	"hmmm:(0,1)",128,0,0,-12
	.stabn	192,0,0,.LFBB1-.LFBB1
	.stabn	224,0,0,.Lscope1-.LFBB1
.Lscope1:
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits

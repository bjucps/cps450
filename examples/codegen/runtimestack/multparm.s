	.file	"multparm.c"
	.stabs	"multparm.c",100,0,2,.Ltext0
	.text
.Ltext0:
	.stabs	"gcc2_compiled.",60,0,0,0
	.stabs	"int:t(0,1)=r(0,1);-2147483648;2147483647;",128,0,0,0
	.stabs	"char:t(0,2)=r(0,2);0;127;",128,0,0,0
	.stabs	"long int:t(0,3)=r(0,3);-2147483648;2147483647;",128,0,0,0
	.stabs	"unsigned int:t(0,4)=r(0,4);0;-1;",128,0,0,0
	.stabs	"long unsigned int:t(0,5)=r(0,5);0;-1;",128,0,0,0
	.stabs	"long long int:t(0,6)=r(0,6);0;-1;",128,0,0,0
	.stabs	"long long unsigned int:t(0,7)=r(0,7);0;-1;",128,0,0,0
	.stabs	"short int:t(0,8)=r(0,8);-32768;32767;",128,0,0,0
	.stabs	"short unsigned int:t(0,9)=r(0,9);0;65535;",128,0,0,0
	.stabs	"signed char:t(0,10)=r(0,10);-128;127;",128,0,0,0
	.stabs	"unsigned char:t(0,11)=r(0,11);0;255;",128,0,0,0
	.stabs	"float:t(0,12)=r(0,1);4;0;",128,0,0,0
	.stabs	"double:t(0,13)=r(0,1);8;0;",128,0,0,0
	.stabs	"long double:t(0,14)=r(0,1);12;0;",128,0,0,0
	.stabs	"void:t(0,15)=(0,15)",128,0,0,0
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
	.stabs	"g:F(0,15)",36,0,0,g
	.stabs	"i:p(0,1)",160,0,0,8
	.stabs	"j:p(0,1)",160,0,0,12
	.stabs	"k:p(0,1)",160,0,0,16
.globl g
	.type	g, @function
g:
	.stabn	68,0,5,.LM0-g
.LM0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	.stabn	68,0,6,.LM1-g
.LM1:
	movl	$3, -12(%ebp)
	.stabn	68,0,7,.LM2-g
.LM2:
	movl	$5, -8(%ebp)
	.stabn	68,0,8,.LM3-g
.LM3:
	movl	$7, -4(%ebp)
	.stabn	68,0,10,.LM4-g
.LM4:
	movl	8(%ebp), %eax
	addl	$3, %eax
	movl	%eax, -12(%ebp)
	.stabn	68,0,11,.LM5-g
.LM5:
	movl	12(%ebp), %eax
	incl	%eax
	movl	%eax, -8(%ebp)
	.stabn	68,0,12,.LM6-g
.LM6:
	movl	16(%ebp), %eax
	sall	%eax
	movl	%eax, -4(%ebp)
	.stabn	68,0,13,.LM7-g
.LM7:
	leave
	ret
	.size	g, .-g
	.stabs	"a:(0,1)",128,0,0,-12
	.stabs	"b:(0,1)",128,0,0,-8
	.stabs	"c:(0,1)",128,0,0,-4
	.stabn	192,0,0,g-g
	.stabn	224,0,0,.Lscope0-g
.Lscope0:
	.stabs	"main:F(0,1)",36,0,0,main
	.stabs	"argc:p(0,1)",160,0,0,8
	.stabs	"argv:p(0,16)=*(0,17)=*(0,2)",160,0,0,12
.globl main
	.type	main, @function
main:
	.stabn	68,0,16,.LM8-main
.LM8:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	andl	$-16, %esp
	movl	$0, %eax
	addl	$15, %eax
	addl	$15, %eax
	shrl	$4, %eax
	sall	$4, %eax
	subl	%eax, %esp
	.stabn	68,0,17,.LM9-main
.LM9:
	movl	z, %eax
	movl	y, %edx
	movl	x, %ecx
	pushl	%eax
	pushl	%edx
	pushl	%ecx
	call	g
	addl	$12, %esp
	.stabn	68,0,18,.LM10-main
.LM10:
	movl	$0, %eax
	.stabn	68,0,19,.LM11-main
.LM11:
	leave
	ret
	.size	main, .-main
.Lscope1:
	.stabs	"x:G(0,1)",32,0,0,0
	.stabs	"y:G(0,1)",32,0,0,0
	.stabs	"z:G(0,1)",32,0,0,0
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 4.0.2 20051125 (Red Hat 4.0.2-8)"
	.section	.note.GNU-stack,"",@progbits

	.file	"lib.floyd"
	.stabs	"lib.floyd",100,0,2,.Ltext0
	.text
.Ltext0:
	.stabs	"gcc2_compiled.",60,0,0,0
	.stabs	"int:t(0,1)=r(0,1);-2147483648;2147483647;",128,0,0,0
	.stabs	"char:t(0,2)=r(0,2);0;127;",128,0,0,0
	.stabs	"long int:t(0,3)=r(0,3);-2147483648;2147483647;",128,0,0,0
	.stabs	"unsigned int:t(0,4)=r(0,4);0;4294967295;",128,0,0,0
	.stabs	"long unsigned int:t(0,5)=r(0,5);0;4294967295;",128,0,0,0
	.stabs	"long long int:t(0,6)=r(0,6);-0;4294967295;",128,0,0,0
	.stabs	"long long unsigned int:t(0,7)=r(0,7);0;-1;",128,0,0,0
	.stabs	"short int:t(0,8)=r(0,8);-32768;32767;",128,0,0,0
	.stabs	"short unsigned int:t(0,9)=r(0,9);0;65535;",128,0,0,0
	.stabs	"signed char:t(0,10)=r(0,10);-128;127;",128,0,0,0
	.stabs	"unsigned char:t(0,11)=r(0,11);0;255;",128,0,0,0
	.stabs	"float:t(0,12)=r(0,1);4;0;",128,0,0,0
	.stabs	"double:t(0,13)=r(0,1);8;0;",128,0,0,0
	.stabs	"long double:t(0,14)=r(0,1);12;0;",128,0,0,0
	.stabs	"_Decimal32:t(0,15)=r(0,1);4;0;",128,0,0,0
	.stabs	"_Decimal64:t(0,16)=r(0,1);8;0;",128,0,0,0
	.stabs	"_Decimal128:t(0,17)=r(0,1);16;0;",128,0,0,0
	.stabs	"void:t(0,18)=(0,18)",128,0,0,0
	.stabs	"sub:F(0,1)",36,0,0,sub
	.stabs	"num1:p(0,1)",160,0,0,8
	.stabs	"num2:p(0,1)",160,0,0,12
.globl sub
	.type	sub, @function
sub:
	.stabn	68,0,3,.LM0-.LFBB1
.LM0:
.LFBB1:
	pushl	%ebp
	movl	%esp, %ebp
	.stabn	68,0,4,.LM1-.LFBB1
.LM1:
	movl	12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	.stabn	68,0,5,.LM2-.LFBB1
.LM2:
	popl	%ebp
	ret
	.size	sub, .-sub
.Lscope1:
	.stabs	"writeint:F(0,18)",36,0,0,writeint
	.stabs	"num:p(0,1)",160,0,0,8
.globl writeint
	.type	writeint, @function
writeint:
	.stabn	68,0,7,.LM3-.LFBB2
.LM3:
.LFBB2:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$88, %esp
	.stabn	68,0,7,.LM4-.LFBB2
.LM4:
	movl	%gs:20, %eax
	movl	%eax, -12(%ebp)
	xorl	%eax, %eax
	.stabn	68,0,9,.LM5-.LFBB2
.LM5:
	movl	$2608, -52(%ebp)
	movl	$0, -48(%ebp)
	movl	$0, -44(%ebp)
	movl	$0, -40(%ebp)
	movl	$0, -36(%ebp)
	.stabn	68,0,10,.LM6-.LFBB2
.LM6:
	leal	-32(%ebp), %eax
	movl	%eax, -56(%ebp)
	.stabn	68,0,11,.LM7-.LFBB2
.LM7:
	leal	-52(%ebp), %eax
	movl	%eax, -60(%ebp)
	.stabn	68,0,15,.LM8-.LFBB2
.LM8:
	cmpl	$0, 8(%ebp)
	jns	.L3
	.stabn	68,0,16,.LM9-.LFBB2
.LM9:
	movl	-60(%ebp), %eax
	movb	$45, (%eax)
	addl	$1, -60(%ebp)
	.stabn	68,0,17,.LM10-.LFBB2
.LM10:
	negl	8(%ebp)
.L3:
	.stabn	68,0,20,.LM11-.LFBB2
.LM11:
	cmpl	$0, 8(%ebp)
	jle	.L4
	.stabn	68,0,23,.LM12-.LFBB2
.LM12:
	jmp	.L5
.L6:
	.stabn	68,0,24,.LM13-.LFBB2
.LM13:
	movl	8(%ebp), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%ecx, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	addl	$48, %eax
	movl	%eax, %edx
	movl	-56(%ebp), %eax
	movb	%dl, (%eax)
	addl	$1, -56(%ebp)
	.stabn	68,0,25,.LM14-.LFBB2
.LM14:
	movl	8(%ebp), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, 8(%ebp)
.L5:
	.stabn	68,0,23,.LM15-.LFBB2
.LM15:
	cmpl	$0, 8(%ebp)
	jg	.L6
	.stabn	68,0,27,.LM16-.LFBB2
.LM16:
	subl	$1, -56(%ebp)
	.stabn	68,0,30,.LM17-.LFBB2
.LM17:
	jmp	.L7
.L8:
	.stabn	68,0,31,.LM18-.LFBB2
.LM18:
	movl	-56(%ebp), %eax
	movzbl	(%eax), %edx
	movl	-60(%ebp), %eax
	movb	%dl, (%eax)
	addl	$1, -60(%ebp)
	subl	$1, -56(%ebp)
.L7:
	.stabn	68,0,30,.LM19-.LFBB2
.LM19:
	leal	-32(%ebp), %eax
	cmpl	%eax, -56(%ebp)
	ja	.L8
	.stabn	68,0,33,.LM20-.LFBB2
.LM20:
	movl	-56(%ebp), %eax
	movzbl	(%eax), %edx
	movl	-60(%ebp), %eax
	movb	%dl, (%eax)
	addl	$1, -60(%ebp)
	.stabn	68,0,34,.LM21-.LFBB2
.LM21:
	movl	-60(%ebp), %eax
	movb	$10, (%eax)
	addl	$1, -60(%ebp)
	.stabn	68,0,35,.LM22-.LFBB2
.LM22:
	movl	-60(%ebp), %eax
	movb	$0, (%eax)
	addl	$1, -60(%ebp)
.L4:
	.stabn	68,0,38,.LM23-.LFBB2
.LM23:
	movl	-60(%ebp), %edx
	leal	-52(%ebp), %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	subl	$1, %eax
	movl	%eax, 8(%esp)
	leal	-52(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$1, (%esp)
	call	write
	.stabn	68,0,40,.LM24-.LFBB2
.LM24:
	movl	-12(%ebp), %eax
	xorl	%gs:20, %eax
	je	.L9
	call	__stack_chk_fail
.L9:
	leave
	ret
	.size	writeint, .-writeint
	.stabs	"buf:(0,19)=ar(0,20)=r(0,20);0;-1;;0;19;(0,2)",128,0,0,-32
	.stabs	"result:(0,19)",128,0,0,-52
	.stabs	"pos:(0,21)=*(0,2)",128,0,0,-56
	.stabs	"writeptr:(0,21)",128,0,0,-60
	.stabn	192,0,0,.LFBB2-.LFBB2
	.stabn	224,0,0,.Lscope2-.LFBB2
.Lscope2:
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (Ubuntu/Linaro 4.5.2-8ubuntu4) 4.5.2"
	.section	.note.GNU-stack,"",@progbits

	.file	"objdemo.cpp"
	.stabs	"objdemo.cpp",100,0,4,.Ltext0
	.text
.Ltext0:
	.stabs	"gcc2_compiled.",60,0,0,0
	.stabs	"__builtin_va_list:t(0,1)=*(0,2)=r(0,2);0;127;",128,0,0,0
	.stabs	"complex long double:t(0,3)=R3;24;0;",128,0,0,0
	.stabs	"complex double:t(0,4)=R3;16;0;",128,0,0,0
	.stabs	"complex float:t(0,5)=R3;8;0;",128,0,0,0
	.stabs	"complex int:t(0,6)=s8real:(0,7)=r(0,7);-2147483648;2147483647;,0,32;imag:(0,7),32,32;;",128,0,0,0
	.stabs	"long long unsigned int:t(0,8)=r(0,8);0;-1;",128,0,0,0
	.stabs	"unsigned int:t(0,9)=r(0,9);0;-1;",128,0,0,0
	.stabs	"short unsigned int:t(0,10)=r(0,10);0;65535;",128,0,0,0
	.stabs	"unsigned char:t(0,11)=r(0,11);0;255;",128,0,0,0
	.stabs	"long long int:t(0,12)=r(0,12);0;-1;",128,0,0,0
	.stabs	"int:t(0,7)",128,0,0,0
	.stabs	"short int:t(0,13)=r(0,13);-32768;32767;",128,0,0,0
	.stabs	"signed char:t(0,14)=r(0,14);-128;127;",128,0,0,0
	.stabs	"char:t(0,2)",128,0,0,0
	.stabs	"signed:t(0,7)",128,0,0,0
	.stabs	"long int:t(0,15)=r(0,15);-2147483648;2147483647;",128,0,0,0
	.stabs	"long unsigned int:t(0,16)=r(0,16);0;-1;",128,0,0,0
	.stabs	"unsigned long:t(0,16)",128,0,0,0
	.stabs	"long long unsigned:t(0,8)",128,0,0,0
	.stabs	"unsigned short:t(0,10)",128,0,0,0
	.stabs	"float:t(0,17)=r(0,7);4;0;",128,0,0,0
	.stabs	"double:t(0,18)=r(0,7);8;0;",128,0,0,0
	.stabs	"long double:t(0,19)=r(0,7);12;0;",128,0,0,0
	.stabs	"void:t(0,20)=(0,20)",128,0,0,0
	.stabs	"wchar_t:t(0,21)=r(0,21);-2147483648;2147483647;",128,0,0,0
	.stabs	"bool:t(0,22)=eFalse:0,True:1,;",128,0,0,0
	.stabs	"__vtbl_ptr_type:t(0,23)=*(0,24)=f(0,7)",128,0,0,0
	.stabs	"Point:T(0,25)=s8x:(0,7),0,32;y:(0,7),32,32;;",128,0,0,0
	.stabs	"Point:t(0,25)",128,0,0,0
	.align 2
	.stabs	"_ZN5Point4setXEi:F(0,20)",36,0,0,_ZN5Point4setXEi
	.stabs	"this:p(0,26)=*(0,25)",160,0,0,8
	.stabs	"newX:p(0,7)",160,0,0,12
.globl _ZN5Point4setXEi
	.type	_ZN5Point4setXEi, @function
_ZN5Point4setXEi:
	.stabn	68,0,14,.LM0-_ZN5Point4setXEi
.LM0:
.LFB2:
	# basic block 0
	pushl	%ebp
.LCFI0:
	movl	%esp, %ebp
.LCFI1:
	.stabn	68,0,15,.LM1-_ZN5Point4setXEi
.LM1:
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	movl	%eax, (%edx)
	.stabn	68,0,16,.LM2-_ZN5Point4setXEi
.LM2:
	popl	%ebp
	ret
.LFE2:
	.size	_ZN5Point4setXEi, .-_ZN5Point4setXEi
.globl __gxx_personality_v0
.Lscope0:
	.align 2
	.stabs	"_ZN5Point4getXEv:F(0,7)",36,0,0,_ZN5Point4getXEv
	.stabs	"this:p(0,26)",160,0,0,8
.globl _ZN5Point4getXEv
	.type	_ZN5Point4getXEv, @function
_ZN5Point4getXEv:
	.stabn	68,0,18,.LM3-_ZN5Point4getXEv
.LM3:
.LFB3:
	# basic block 0
	pushl	%ebp
.LCFI2:
	movl	%esp, %ebp
.LCFI3:
	.stabn	68,0,19,.LM4-_ZN5Point4getXEv
.LM4:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	.stabn	68,0,20,.LM5-_ZN5Point4getXEv
.LM5:
	popl	%ebp
	ret
.LFE3:
	.size	_ZN5Point4getXEv, .-_ZN5Point4getXEv
.Lscope1:
	.align 2
	.stabs	"_ZN5Point4setYEi:F(0,20)",36,0,0,_ZN5Point4setYEi
	.stabs	"this:p(0,26)",160,0,0,8
	.stabs	"newY:p(0,7)",160,0,0,12
.globl _ZN5Point4setYEi
	.type	_ZN5Point4setYEi, @function
_ZN5Point4setYEi:
	.stabn	68,0,22,.LM6-_ZN5Point4setYEi
.LM6:
.LFB4:
	# basic block 0
	pushl	%ebp
.LCFI4:
	movl	%esp, %ebp
.LCFI5:
	.stabn	68,0,23,.LM7-_ZN5Point4setYEi
.LM7:
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	movl	%eax, 4(%edx)
	.stabn	68,0,24,.LM8-_ZN5Point4setYEi
.LM8:
	popl	%ebp
	ret
.LFE4:
	.size	_ZN5Point4setYEi, .-_ZN5Point4setYEi
.Lscope2:
	.align 2
	.stabs	"_ZN5Point4getYEv:F(0,7)",36,0,0,_ZN5Point4getYEv
	.stabs	"this:p(0,26)",160,0,0,8
.globl _ZN5Point4getYEv
	.type	_ZN5Point4getYEv, @function
_ZN5Point4getYEv:
	.stabn	68,0,26,.LM9-_ZN5Point4getYEv
.LM9:
.LFB5:
	# basic block 0
	pushl	%ebp
.LCFI6:
	movl	%esp, %ebp
.LCFI7:
	.stabn	68,0,27,.LM10-_ZN5Point4getYEv
.LM10:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	.stabn	68,0,28,.LM11-_ZN5Point4getYEv
.LM11:
	popl	%ebp
	ret
.LFE5:
	.size	_ZN5Point4getYEv, .-_ZN5Point4getYEv
.Lscope3:
	.align 2
	.stabs	"main:F(0,7)",36,0,0,main
.globl main
	.type	main, @function
main:
	.stabn	68,0,31,.LM12-main
.LM12:
.LFB6:
	# basic block 0
	leal	4(%esp), %ecx
.LCFI8:
	andl	$-16, %esp
	pushl	-4(%ecx)
.LCFI9:
	pushl	%ebp
.LCFI10:
	movl	%esp, %ebp
.LCFI11:
	pushl	%ecx
.LCFI12:
	subl	$36, %esp
.LCFI13:
.LBB2:
	.stabn	68,0,33,.LM13-main
.LM13:
	movl	$8, (%esp)
	call	_Znwj
	movl	$0, (%eax)
	movl	$0, 4(%eax)
	movl	%eax, -12(%ebp)
	.stabn	68,0,34,.LM14-main
.LM14:
	movl	$8, (%esp)
	call	_Znwj
	movl	$0, (%eax)
	movl	$0, 4(%eax)
	movl	%eax, -8(%ebp)
	.stabn	68,0,36,.LM15-main
.LM15:
	movl	$25, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_ZN5Point4setXEi
	.stabn	68,0,37,.LM16-main
.LM16:
	movl	$35, 4(%esp)
	movl	-8(%ebp), %eax
	movl	%eax, (%esp)
	call	_ZN5Point4setXEi
.LBE2:
	movl	$0, %eax
	.stabn	68,0,39,.LM17-main
.LM17:
	addl	$36, %esp
	popl	%ecx
	popl	%ebp
	leal	-4(%ecx), %esp
	ret
.LFE6:
	.size	main, .-main
	.stabs	"a:(0,26)",128,0,0,-12
	.stabs	"b:(0,26)",128,0,0,-8
	.stabn	192,0,0,.LBB2-main
	.stabn	224,0,0,.LBE2-main
.Lscope4:
#APP
	.section	.eh_frame,"a",@progbits
.Lframe1:
	.long	.LECIE1-.LSCIE1	# Length of Common Information Entry
.LSCIE1:
	.long	0x0	# CIE Identifier Tag
	.byte	0x1	# CIE Version
	.ascii "zP\0"	# CIE Augmentation
	.uleb128 0x1	# CIE Code Alignment Factor
	.sleb128 -4	# CIE Data Alignment Factor
	.byte	0x8	# CIE RA Column
	.uleb128 0x5	# Augmentation size
	.byte	0x0	# Personality (absolute)
	.long	__gxx_personality_v0
	.byte	0xc	# DW_CFA_def_cfa
	.uleb128 0x4
	.uleb128 0x4
	.byte	0x88	# DW_CFA_offset, column 0x8
	.uleb128 0x1
	.align 4
.LECIE1:
.LSFDE9:
	.long	.LEFDE9-.LASFDE9	# FDE Length
.LASFDE9:
	.long	.LASFDE9-.Lframe1	# FDE CIE offset
	.long	.LFB6	# FDE initial location
	.long	.LFE6-.LFB6	# FDE address range
	.uleb128 0x0	# Augmentation size
	.byte	0x4	# DW_CFA_advance_loc4
	.long	.LCFI8-.LFB6
	.byte	0xc	# DW_CFA_def_cfa
	.uleb128 0x1
	.uleb128 0x0
	.byte	0x9	# DW_CFA_register
	.uleb128 0x4
	.uleb128 0x1
	.byte	0x4	# DW_CFA_advance_loc4
	.long	.LCFI9-.LCFI8
	.byte	0xc	# DW_CFA_def_cfa
	.uleb128 0x4
	.uleb128 0x4
	.byte	0x4	# DW_CFA_advance_loc4
	.long	.LCFI10-.LCFI9
	.byte	0xe	# DW_CFA_def_cfa_offset
	.uleb128 0x8
	.byte	0x85	# DW_CFA_offset, column 0x5
	.uleb128 0x2
	.byte	0x4	# DW_CFA_advance_loc4
	.long	.LCFI11-.LCFI10
	.byte	0xd	# DW_CFA_def_cfa_register
	.uleb128 0x5
	.byte	0x4	# DW_CFA_advance_loc4
	.long	.LCFI12-.LCFI11
	.byte	0x84	# DW_CFA_offset, column 0x4
	.uleb128 0x3
	.align 4
.LEFDE9:
#NO_APP
	.text
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 4.1.1 20061011 (Red Hat 4.1.1-30)"
	.section	.note.GNU-stack,"",@progbits

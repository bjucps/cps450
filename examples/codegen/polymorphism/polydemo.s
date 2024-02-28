	.file	"polydemo.cpp"
	.text
	.align 2
.globl _ZN6Parent5initPEi
	.type	_ZN6Parent5initPEi, @function
_ZN6Parent5initPEi:
.LFB2:
	pushl	%ebp
.LCFI0:
	movl	%esp, %ebp
.LCFI1:
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	movl	%eax, 4(%edx)
	movl	8(%ebp), %eax
	popl	%ebp
	ret
.LFE2:
	.size	_ZN6Parent5initPEi, .-_ZN6Parent5initPEi
.globl __gxx_personality_v0
	.align 2
.globl _ZN6Parent4getXEv
	.type	_ZN6Parent4getXEv, @function
_ZN6Parent4getXEv:
.LFB4:
	pushl	%ebp
.LCFI2:
	movl	%esp, %ebp
.LCFI3:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	popl	%ebp
	ret
.LFE4:
	.size	_ZN6Parent4getXEv, .-_ZN6Parent4getXEv
	.align 2
.globl _ZN5Child5initCEii
	.type	_ZN5Child5initCEii, @function
_ZN5Child5initCEii:
.LFB5:
	pushl	%ebp
.LCFI4:
	movl	%esp, %ebp
.LCFI5:
	subl	$8, %esp
.LCFI6:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	(%eax), %ecx
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	*%ecx
	movl	8(%ebp), %edx
	movl	16(%ebp), %eax
	movl	%eax, 8(%edx)
	movl	8(%ebp), %eax
	leave
	ret
.LFE5:
	.size	_ZN5Child5initCEii, .-_ZN5Child5initCEii
	.align 2
.globl _ZN5Child4getYEv
	.type	_ZN5Child4getYEv, @function
_ZN5Child4getYEv:
.LFB6:
	pushl	%ebp
.LCFI7:
	movl	%esp, %ebp
.LCFI8:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	popl	%ebp
	ret
.LFE6:
	.size	_ZN5Child4getYEv, .-_ZN5Child4getYEv
	.align 2
.globl _Z5doFooP6Parent
	.type	_Z5doFooP6Parent, @function
_Z5doFooP6Parent:
.LFB8:
	pushl	%ebp
.LCFI9:
	movl	%esp, %ebp
.LCFI10:
	subl	$8, %esp
.LCFI11:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	addl	$4, %eax
	movl	(%eax), %edx
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	*%edx
	leave
	ret
.LFE8:
	.size	_Z5doFooP6Parent, .-_Z5doFooP6Parent
	.section	.gnu.linkonce.t._ZN6ParentC2Ev,"ax",@progbits
	.align 2
	.weak	_ZN6ParentC2Ev
	.type	_ZN6ParentC2Ev, @function
_ZN6ParentC2Ev:
.LFB11:
	pushl	%ebp
.LCFI12:
	movl	%esp, %ebp
.LCFI13:
	movl	$_ZTV6Parent+8, %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	popl	%ebp
	ret
.LFE11:
	.size	_ZN6ParentC2Ev, .-_ZN6ParentC2Ev
	.section	.gnu.linkonce.t._ZN6ParentC1Ev,"ax",@progbits
	.align 2
	.weak	_ZN6ParentC1Ev
	.type	_ZN6ParentC1Ev, @function
_ZN6ParentC1Ev:
.LFB12:
	pushl	%ebp
.LCFI14:
	movl	%esp, %ebp
.LCFI15:
	movl	$_ZTV6Parent+8, %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	popl	%ebp
	ret
.LFE12:
	.size	_ZN6ParentC1Ev, .-_ZN6ParentC1Ev
	.section	.gnu.linkonce.t._ZN5ChildC1Ev,"ax",@progbits
	.align 2
	.weak	_ZN5ChildC1Ev
	.type	_ZN5ChildC1Ev, @function
_ZN5ChildC1Ev:
.LFB15:
	pushl	%ebp
.LCFI16:
	movl	%esp, %ebp
.LCFI17:
	subl	$8, %esp
.LCFI18:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_ZN6ParentC2Ev
	movl	$_ZTV5Child+8, %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	leave
	ret
.LFE15:
	.size	_ZN5ChildC1Ev, .-_ZN5ChildC1Ev
	.text
	.align 2
.globl main
	.type	main, @function
main:
.LFB9:
	leal	4(%esp), %ecx
.LCFI19:
	andl	$-16, %esp
	pushl	-4(%ecx)
.LCFI20:
	pushl	%ebp
.LCFI21:
	movl	%esp, %ebp
.LCFI22:
	pushl	%ebx
.LCFI23:
	pushl	%ecx
.LCFI24:
	subl	$16, %esp
.LCFI25:
	movl	$8, (%esp)
	call	_Znwj
	movl	%eax, %ebx
	movl	%ebx, (%esp)
	call	_ZN6ParentC1Ev
	movl	%ebx, p
	movl	p, %eax
	movl	(%eax), %eax
	movl	(%eax), %edx
	movl	p, %eax
	movl	$5, 4(%esp)
	movl	%eax, (%esp)
	call	*%edx
	movl	$12, (%esp)
	call	_Znwj
	movl	%eax, %ebx
	movl	%ebx, (%esp)
	call	_ZN5ChildC1Ev
	movl	%ebx, c
	movl	c, %eax
	movl	(%eax), %eax
	addl	$12, %eax
	movl	(%eax), %edx
	movl	c, %eax
	movl	$20, 8(%esp)
	movl	$10, 4(%esp)
	movl	%eax, (%esp)
	call	*%edx
	movl	p, %eax
	movl	%eax, (%esp)
	call	_Z5doFooP6Parent
	movl	c, %eax
	movl	%eax, (%esp)
	call	_Z5doFooP6Parent
	movl	$0, %eax
	addl	$16, %esp
	popl	%ecx
	popl	%ebx
	popl	%ebp
	leal	-4(%ecx), %esp
	ret
.LFE9:
	.size	main, .-main
	.section	.rodata
.LC0:
	.string	"%d\n"
	.text
	.align 2
.globl _ZN5Child3fooEv
	.type	_ZN5Child3fooEv, @function
_ZN5Child3fooEv:
.LFB7:
	pushl	%ebp
.LCFI26:
	movl	%esp, %ebp
.LCFI27:
	subl	$8, %esp
.LCFI28:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	addl	$8, %eax
	movl	(%eax), %edx
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	*%edx
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	leal	(%edx,%eax), %eax
	movl	%eax, 4(%esp)
	movl	$.LC0, (%esp)
	call	printf
	leave
	ret
.LFE7:
	.size	_ZN5Child3fooEv, .-_ZN5Child3fooEv
	.align 2
.globl _ZN6Parent3fooEv
	.type	_ZN6Parent3fooEv, @function
_ZN6Parent3fooEv:
.LFB3:
	pushl	%ebp
.LCFI29:
	movl	%esp, %ebp
.LCFI30:
	subl	$8, %esp
.LCFI31:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$.LC0, (%esp)
	call	printf
	leave
	ret
.LFE3:
	.size	_ZN6Parent3fooEv, .-_ZN6Parent3fooEv
.globl p
	.bss
	.align 4
	.type	p, @object
	.size	p, 4
p:
	.zero	4
.globl c
	.align 4
	.type	c, @object
	.size	c, 4
c:
	.zero	4
	.weak	_ZTV5Child
	.section	.gnu.linkonce.r._ZTV5Child,"a",@progbits
	.align 8
	.type	_ZTV5Child, @object
	.size	_ZTV5Child, 28
_ZTV5Child:
	.long	0
	.long	_ZTI5Child
	.long	_ZN6Parent5initPEi
	.long	_ZN5Child3fooEv
	.long	_ZN6Parent4getXEv
	.long	_ZN5Child5initCEii
	.long	_ZN5Child4getYEv
	.weak	_ZTV6Parent
	.section	.gnu.linkonce.r._ZTV6Parent,"a",@progbits
	.align 8
	.type	_ZTV6Parent, @object
	.size	_ZTV6Parent, 20
_ZTV6Parent:
	.long	0
	.long	_ZTI6Parent
	.long	_ZN6Parent5initPEi
	.long	_ZN6Parent3fooEv
	.long	_ZN6Parent4getXEv
	.weak	_ZTS5Child
	.section	.gnu.linkonce.r._ZTS5Child,"a",@progbits
	.type	_ZTS5Child, @object
	.size	_ZTS5Child, 7
_ZTS5Child:
	.string	"5Child"
	.weak	_ZTI5Child
	.section	.gnu.linkonce.r._ZTI5Child,"a",@progbits
	.align 4
	.type	_ZTI5Child, @object
	.size	_ZTI5Child, 12
_ZTI5Child:
	.long	_ZTVN10__cxxabiv120__si_class_type_infoE+8
	.long	_ZTS5Child
	.long	_ZTI6Parent
	.weak	_ZTS6Parent
	.section	.gnu.linkonce.r._ZTS6Parent,"a",@progbits
	.type	_ZTS6Parent, @object
	.size	_ZTS6Parent, 8
_ZTS6Parent:
	.string	"6Parent"
	.weak	_ZTI6Parent
	.section	.gnu.linkonce.r._ZTI6Parent,"a",@progbits
	.align 4
	.type	_ZTI6Parent, @object
	.size	_ZTI6Parent, 8
_ZTI6Parent:
	.long	_ZTVN10__cxxabiv117__class_type_infoE+8
	.long	_ZTS6Parent
	.section	.eh_frame,"a",@progbits
.Lframe1:
	.long	.LECIE1-.LSCIE1
.LSCIE1:
	.long	0x0
	.byte	0x1
	.string	"zP"
	.uleb128 0x1
	.sleb128 -4
	.byte	0x8
	.uleb128 0x5
	.byte	0x0
	.long	__gxx_personality_v0
	.byte	0xc
	.uleb128 0x4
	.uleb128 0x4
	.byte	0x88
	.uleb128 0x1
	.align 4
.LECIE1:
.LSFDE5:
	.long	.LEFDE5-.LASFDE5
.LASFDE5:
	.long	.LASFDE5-.Lframe1
	.long	.LFB5
	.long	.LFE5-.LFB5
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI4-.LFB5
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI5-.LCFI4
	.byte	0xd
	.uleb128 0x5
	.align 4
.LEFDE5:
.LSFDE9:
	.long	.LEFDE9-.LASFDE9
.LASFDE9:
	.long	.LASFDE9-.Lframe1
	.long	.LFB8
	.long	.LFE8-.LFB8
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI9-.LFB8
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI10-.LCFI9
	.byte	0xd
	.uleb128 0x5
	.align 4
.LEFDE9:
.LSFDE17:
	.long	.LEFDE17-.LASFDE17
.LASFDE17:
	.long	.LASFDE17-.Lframe1
	.long	.LFB9
	.long	.LFE9-.LFB9
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI19-.LFB9
	.byte	0xc
	.uleb128 0x1
	.uleb128 0x0
	.byte	0x9
	.uleb128 0x4
	.uleb128 0x1
	.byte	0x4
	.long	.LCFI20-.LCFI19
	.byte	0xc
	.uleb128 0x4
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI21-.LCFI20
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI22-.LCFI21
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	.LCFI24-.LCFI22
	.byte	0x84
	.uleb128 0x4
	.byte	0x83
	.uleb128 0x3
	.align 4
.LEFDE17:
.LSFDE19:
	.long	.LEFDE19-.LASFDE19
.LASFDE19:
	.long	.LASFDE19-.Lframe1
	.long	.LFB7
	.long	.LFE7-.LFB7
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI26-.LFB7
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI27-.LCFI26
	.byte	0xd
	.uleb128 0x5
	.align 4
.LEFDE19:
.LSFDE21:
	.long	.LEFDE21-.LASFDE21
.LASFDE21:
	.long	.LASFDE21-.Lframe1
	.long	.LFB3
	.long	.LFE3-.LFB3
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI29-.LFB3
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI30-.LCFI29
	.byte	0xd
	.uleb128 0x5
	.align 4
.LEFDE21:
	.ident	"GCC: (GNU) 4.1.1 20061011 (Red Hat 4.1.1-30)"
	.section	.note.GNU-stack,"",@progbits

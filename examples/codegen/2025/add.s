# C source
# #include <unistd.h>
# int main(int argc, char **argv) {
#     int x = 6;
#     int y = 3;
#     char c = x + y + '0'; // 48 is the unicode value, 0x30 in hex 
#     write(1, &c, 1);
# }

STDOUT = 1
.globl	main				# main function (global)
main:						# standard function prologue:
	leal	4(%esp), %ecx	# store address sp+4 in cx as the starting point for this program.
	pushl	-4(%ecx)		# push sp
	pushl	%ebp			# push bp
	movl	%esp, %ebp		# store updated sp in bp.
	pushl	%ebx			# push bx
	pushl	%ecx			# push sp+4
	subl	$24, %esp						# reserve space on the stack. Stack grows down.
	call	__x86.get_pc_thunk.ax			# put ip in ax. See https://courses.cs.vt.edu/cs3214/spring2022/questions/pcmaterialization		
	addl	$_GLOBAL_OFFSET_TABLE_, %eax	# set ax to _GLOBAL_OFFSET_TABLE_ + ip of <main+23>
	movl	$6, -20(%ebp)					# put 6 in cx
	movl	-20(%ebp), %ecx					# (continued)
	movl	$3, -16(%ebp)		# put 3 in dx
	movl	-16(%ebp), %edx		# (continued)
	addl	%ecx, %edx			# add 6 to 3
	addl	$48, %edx			# add '0' to sum
	movl	%edx, -24(%ebp)		# store sum
								# parameters:
	pushl	$1					#	3) 1 (number of bytes to write)
	leal	-24(%ebp), %edx		#	2) Address of '9'
	pushl	%edx				# 		(continued)
	pushl	$STDOUT				# 	1) STDOUT
	movl	%eax, %ebx			# backup ax
	call	write@PLT			# call stub for write:
								#	 Return value in ax.
								#	 Address of string in cx.
	addl	$12, %esp			# remove allocated 24 bytes of stack space -4 for 3 pushes. (12)
	movl	$0, %eax			# zero out return value.
	leal	-8(%ebp), %esp		# restore original sp+4 to sp
	popl	%ecx				# retrieve sp + 4 (see ln 9)
	popl	%ebx				# restore bx (see ln 8)
	popl	%ebp				# restore bp (see ln 6)
	leal	-4(%ecx), %esp		# restore sp (see ln 4)
	ret							# function exit
	.section	.note.GNU-stack,"",@progbits	# security feature to allow a non-executable stack 

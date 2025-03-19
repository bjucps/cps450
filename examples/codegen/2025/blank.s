# C source
# int main () {
# }
.globl	main				# main function (global)
main:						# standard function prologue:
	pushl	%ebp			# push bp
	movl	%esp, %ebp		# store updated sp in bp.
	call	__x86.get_pc_thunk.ax			# put ip in ax. See https://courses.cs.vt.edu/cs3214/spring2022/questions/pcmaterialization		
	addl	$_GLOBAL_OFFSET_TABLE_, %eax	# set ax to _GLOBAL_OFFSET_TABLE_ + ip of <main+23>
	movl	$0, %eax						# zero out return value.
	popl	%ebp							# restore bp (see ln 6)
	ret										# function exit
	.section	.note.GNU-stack,"",@progbits	# security feature to allow a non-executable stack 

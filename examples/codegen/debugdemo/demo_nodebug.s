	.comm	x,4,4
	.comm	y,4,4
	
# Line 5: start()
.global	main
main:

# Line 7: x := 5
	pushl	$5
	popl	%eax
	movl	%eax, x

# Line 8: y := 3 - x
	pushl	$3
	pushl	x
	popl	%eax
	popl	%ebx
	addl	%eax, %ebx
	pushl	%ebx
	# perform assignment
	popl	%eax
	movl	%eax, y

# Line 9: out.writeint(x)
	pushl	x
	call	writeint
	addl	$4, %esp
			
# Line 10: end start
			
			
# Call exit(0)
        movl  	$1, %eax  
        movl  	$0, %ebx
        int     $0x80
	

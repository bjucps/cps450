	
# Line 2: x: int
	.comm	x,4,4

# Line 3: x: int
	.comm	y,4,4
	
	.text
# -----------------------------------------
# Line 5: start()
# -----------------------------------------
.global	main
main:

# -----------------------------------------
# Line 7: x := 5
# -----------------------------------------
	# Evaluate RHS ...
        pushl   $5
	# Now, do the assignment...
        popl    x

# -----------------------------------------
# Line 8: y := 3 + x
# -----------------------------------------
	# Evaluate RHS ...
	pushl	$3
	pushl	x
        popl    %ebx
        popl    %eax
	addl	%eax, %ebx
	pushl   %ebx
	# Now, do the assignment...
	popl    y

# -----------------------------------------
# Line 9: out.writeint(x) 
# -----------------------------------------
        pushl  x
        call   writeint
        addl  $4, %esp

# -----------------------------------------
# Line 10: end start
# -----------------------------------------
        pushl $0
        call  exit



	.file	"floydDemo.floyd"
	.stabs	"floydDemo.floyd",100,0,2,.Ltext0
	.text
.Ltext0:
	.stabs	"int:t(0,1)=r(0,1);-2147483648;2147483647;",128,0,0,0
	
# -----------------------------------------
# Line 2: x: int
# -----------------------------------------
	.comm	x,4,4
  .stabs  "x:G(0,1)",32,0,0,0  

# -----------------------------------------
# Line 3: y: int
# -----------------------------------------
	.comm	y,4,4
  .stabs  "y:G(0,1)",32,0,0,0  
	
# -----------------------------------------
# Line 5: start()
# -----------------------------------------
.global	main
	.stabs	"main:F",36,0,0,main
#	.type	main, @function
main:

# -----------------------------------------
# Line 7: x := 5
# -----------------------------------------
	.stabn 68,0,7,.line7-main
.line7:
	# Evaluate RHS ...
        pushl   $5
	# Now, do the assignment...
        popl    x

# -----------------------------------------
# Line 8: y := 3 + x
# -----------------------------------------
	.stabn 68,0,8,.line8-main
.line8:
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
	.stabn 68,0,9,.line9-main
.line9:
        pushl  x
        call   writeint
        addl  $4, %esp

# -----------------------------------------
# Line 10: end start
# -----------------------------------------
	.stabn 68,0,10,.line10-main
.line10:
        pushl $0
        call  exit

	
	.size	main, .-main

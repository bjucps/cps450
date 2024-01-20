.data

	# Line 6: x: int
	.comm _x, 4, 4

	# Line 7: y: int
	.comm _y, 4, 4

	# Line 8: z: int
	.comm _z, 4, 4

	# Line 9: b1: boolean
	.comm _b1, 4, 4

	# Line 10: b2: boolean
	.comm _b2, 4, 4

.text
.global main
main:
	call   start 

	# Line 30: Exit call
	pushl  $0    
	call   exit  



.global start
start:

	# Line 14: x := 5
	pushl  $5    
	popl   _x    

	# Line 15: y := x * (8 - x)
	pushl  _x    
	pushl  $8    
	pushl  _x    
	popl   %ebx  
	popl   %eax  
	subl   %ebx,  %eax  
	pushl  %eax  
	popl   %ebx  
	popl   %eax  
	imull  %ebx,  %eax  
	pushl  %eax  
	popl   _y    

	# Line 17: b1 := true
	pushl  $1    
	popl   _b1   

	# Line 18: b2 := not false
	pushl  $0    
	popl   %eax  
	xorl   $1,    %eax  
	pushl  %eax  
	popl   _b2   

	# Line 19: b2 := not (not b2 or b1)
	pushl  _b2   
	popl   %eax  
	xorl   $1,    %eax  
	pushl  %eax  
	pushl  _b1   
	popl   %ebx  
	popl   %eax  
	orl    %ebx,  %eax  
	pushl  %eax  
	popl   %eax  
	xorl   $1,    %eax  
	pushl  %eax  
	popl   _b2   

	# Line 21: out.writeint(y)              ~ 15
	pushl  _y    
	call   writeint
	addl   $4,    %esp  

	# Line 22: out.writeint(x / 2)          ~ 2
	pushl  _x    
	pushl  $2    
	popl   %ebx  
	popl   %eax  
	movl   $0,    %edx  
	idivl  %ebx  
	pushl  %eax  
	call   writeint
	addl   $4,    %esp  

	# Line 24: y := y - x
	pushl  _y    
	pushl  _x    
	popl   %ebx  
	popl   %eax  
	subl   %ebx,  %eax  
	pushl  %eax  
	popl   _y    

	# Line 25: out.writeint(y + 4)          ~ 14
	pushl  _y    
	pushl  $4    
	popl   %ebx  
	popl   %eax  
	addl   %ebx,  %eax  
	pushl  %eax  
	call   writeint
	addl   $4,    %esp  

	# Line 26: out.writeint(-(9 - 5))       ~ -4
	pushl  $9    
	pushl  $5    
	popl   %ebx  
	popl   %eax  
	subl   %ebx,  %eax  
	pushl  %eax  
	popl   %eax  
	negl   %eax  
	pushl  %eax  
	call   writeint
	addl   $4,    %esp  

	# Line 27: out.writeint(5 - 2 * 3 + 1)  ~ 0
	pushl  $5    
	pushl  $2    
	pushl  $3    
	popl   %ebx  
	popl   %eax  
	imull  %ebx,  %eax  
	pushl  %eax  
	popl   %ebx  
	popl   %eax  
	subl   %ebx,  %eax  
	pushl  %eax  
	pushl  $1    
	popl   %ebx  
	popl   %eax  
	addl   %ebx,  %eax  
	pushl  %eax  
	call   writeint
	addl   $4,    %esp  
	ret          


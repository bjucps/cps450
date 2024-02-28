SYS_write = 4

.global write
	.type	write, @function
write:
	pushl	%ebp
	movl	%esp, %ebp
        
        movl	$SYS_write,%eax    
	movl	8(%ebp),%ebx
	movl	12(%ebp),%ecx
	movl	16(%ebp),%edx
	int	$0x80
        	
	movl %ebp, %esp
        popl  %ebp
	ret
        
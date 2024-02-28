SYS_exit = 1

.data
hello:
	.string "hello world\n"

.global	main
main:
        // Call sub(5, 3)
	pushl	$3
	pushl	$5
	call	sub
	addl	$8, %esp

    // Call writeint()
        pushl %eax
        call   writeint
        addl  $4, %esp

        // Call exit(0)
        movl  $SYS_exit, %eax  
        movl  $0, %ebx
        int     $0x80

	

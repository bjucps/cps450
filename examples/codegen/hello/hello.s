# hello.s -- Hello World in Linux Assembler

STDOUT = 1    # define a constant

.data
hello:
	.string "hello world\n"

.text
.global	main
main:
        # Call write(STDOUT, "hello world\n", 12)
        pushl $12
        pushl $hello
        pushl $STDOUT
        call  write
        addl  $12, %esp

        # Call exit(0)
        pushl $0
        call  exit  # no return...

	# or ...
        #movl  $1, %eax    # 1 is the number of the exit system call
        #movl  $0, %ebx    # 0 is the parameter for exit
        #int     $0x80
        
	

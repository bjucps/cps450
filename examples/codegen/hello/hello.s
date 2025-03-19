# sample_min.s -- Hello World in Linux Assembler

STDOUT = 1    # define a constant
hello:
        .string	"hello world\n"
.globl	main
main:
        # Call write(STDOUT, "hello world\n", 12)
        pushl	$12
        pushl $hello

        pushl	$STDOUT
        call	write
        addl  $12, %esp

        # Call exit(0)
        pushl $0
        call  exit  # no return...
	

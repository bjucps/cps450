gcc -m32 -g -c  stdlib.c -o bin/stdlib.o
gcc -m32 teststdlib.c bin/stdlib.o -obin/teststdlib


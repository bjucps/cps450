#!/bin/sh

# Look at C compiler's STABS output
gcc -gstabs -S -m32 simple.c

# Compile C library with debug info
gcc -g -c -m32 lib.c -o bin/lib.o

# Compile Assembly without STABS debugging info
# Note: Need -g switch in the following command
gcc -g -m32 dreamDemo_nosourcedebug.s bin/lib.o -obin/demo_asmsource

# Compile Assembly containing STABS debugging info for source-level debug
# Note: NO -g switch in the following command
gcc -m32 dreamDemo_sourcedebug.s bin/lib.o -obin/demo_dreamsource


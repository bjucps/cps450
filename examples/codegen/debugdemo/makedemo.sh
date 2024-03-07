#!/bin/sh

# Look at C compiler's STABS output
gcc -gstabs -S -m32 -fno-pic simple.c

# Compile C library with debug info
gcc -g -c -m32 lib.c -o lib.o

# Compile Assembly without STABS debugging info
# Note: Need -g switch in the following command
gcc -g -m32 demo_nostabs.s lib.o -odemo_nostabs

# Compile Assembly containing STABS debugging info for source-level debug
# Note: NO -g switch in the following command
gcc -m32 demo_stabs.s lib.o -odemo_stabs


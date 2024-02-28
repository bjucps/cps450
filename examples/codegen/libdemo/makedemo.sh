#!/bin/sh

gcc -m32 -g -c lib.c -o bin/lib.o
gcc -m32 -g cmain.c bin/lib.o -obin/ctest
gcc -m32 -g -c asmmain.s -o bin/asmmain.o
gcc -m32 -g bin/asmmain.o bin/lib.o -obin/asmtest


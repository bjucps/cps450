#include <stdio.h>
// Reminder of C function pointers.
int add(int x, int y) {
    return x + y;
}

int main () {
    int (*f)(int, int) = add;
    printf("%d\n", f(3, 4));
}
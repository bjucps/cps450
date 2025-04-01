void writeint(int num);
int fib(int x) {
    int result = 1;
    if (x > 2) {
        result = fib(x-1) + fib(x-2);
        writeint(result);
    }
    return result;
}

int main(int argc, char **argv) {
    writeint(fib(5));
}

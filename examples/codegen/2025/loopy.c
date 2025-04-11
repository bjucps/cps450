void writeint(int num);

int main(int argc, char **argv) {
    int x = 3;
    if (x > 0) {
        while (x > 0) {
            writeint(x);
            --x;
        }
    } else {
        writeint(999);
    }
}

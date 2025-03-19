#include <unistd.h>
int main(int argc, char **argv) {
    int x = 3;
    if (x > 0) {
        while (x > 0) {
            char c = x + '0';
            write(1, &c, 1);
            --x;
        }
    } else {
        char c = '9';
        write(1, &c, 1);
    }
    
}

#include <stdio.h>

class Parent {
private:
    int x;

public:
     Parent *initP(int newX);
     void foo();
     int getX();
};

class Child: public Parent {
private:
    int y;
    
public:
     Child *initC(int newX, int newY);
     int getY();
     void foo();
};

Parent *Parent::initP(int newX) {
    x = newX;
    return this;
}

void Parent::foo() {
    printf("%d\n", x);
}

int Parent::getX() {
    return x;
}

Child *Child::initC(int newX, int newY) {
    initP(newX);
    y = newY;
    return this;
}

int Child::getY() {
    return y;
}

void Child::foo() {
    printf("%d\n", getX() + y);
    
}

void doFoo(Parent *p) {
    p->foo();
}

Parent *p;
Child *c;

int main() {
    p = new Parent();
    p->initP(5);
    c = new Child();
    c->initC(10, 20);
    
    doFoo(p);
    doFoo(c);
    
}

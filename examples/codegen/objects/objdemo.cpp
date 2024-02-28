class Point {
private:
    int x, y;

public:
    void setX(int newX);    
    int getX();
    
    void setY(int newY);
    int getY();
    
};

void Point::setX(int newX) {
        x = newX;
}

int Point::getX() { 
    return x; 
}

void Point::setY(int newY) {
        y = newY;
}

int Point::getY() { 
    return y; 
}


int main()
{
    Point *a = new Point();
    Point *b = new Point();
    
    a->setX(25);
    b->setX(35);
    
}


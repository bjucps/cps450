struct Point {
    int x, y;
}

void Point_setX(struct Point* this, int newX) {
    this->x = newX;
}

int Point_getX(struct Point* this) {
    return this->x;
}

main() {
    Point *a = malloc(sizeof(Point));
    Point_setX(a, 10);
}
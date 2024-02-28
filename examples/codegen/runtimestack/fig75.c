int x = 0;

void g(int);

void f(int n)
{
  static int x = 1;
  g(n);
  x--;
}

void g(int m)
{
  volatile int y = m - 1;
  if (y > 0) {
    f(y);
    x--;
    g(y);
  }
}

main()
{
  g(x);
  return 0;
}
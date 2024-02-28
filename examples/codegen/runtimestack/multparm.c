int x = 0, y = 5, z = 10;


void g(int i, int j, int k)
{
  int a = 3;
  int b = 5;
  int c = 7;
  
  a = i + 3;
  b = j + 1;
  c = k * 2;
}

main(int argc, char **argv)
{
  g(x, y, z);
  return 0;
}


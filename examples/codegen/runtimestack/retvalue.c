int x = 0, y = 5, z = 10;


int g(int i, int j, int k)
{
  int a = 3;
  int b = 5;
  int c = 7;
  
  return a + b + c + i + j + k;
}

main(int argc, char **argv)
{
  int result;
  
  result = g(x, y, z);
  return 0;
}


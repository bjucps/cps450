int x, y;

int main()
{
  
  if (x < 5) {
    x = x + 1;
  } else {
    x = x - 5;
    if ( y > x ) {
      out.writeint(y);      
    } else {
      x = in.readint();
    }
    
  }
  
  while (x < 5) {
    x = x + 1;
  }
}

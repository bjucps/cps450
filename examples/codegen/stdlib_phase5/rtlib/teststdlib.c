//---------------------------------------------------------------------------
// testrt.c
// - Tests runtime library routines
//---------------------------------------------------------------------------

#define NULL 0
#include "stdlib.h"

void printstring(struct String *s)
{
   struct CharNode *c = s->list;
     
   while (c) {
     Writer_io_write(NULL, c->ch);
     c = c->next;
   }
  
}

int main(int argc, char* argv[])
{
        int c;
        struct String *s;
          
        s = string_fromlit("Type some data and press enter: ");
        printstring(s);

        while ((c = Reader_io_read(NULL)) != '\n') {
          Writer_io_write(NULL, c);
        }

        return 0;
}
//---------------------------------------------------------------------------
 

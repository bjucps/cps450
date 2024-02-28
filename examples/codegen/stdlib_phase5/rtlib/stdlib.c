// ----------------------------------------------------------------------
// File: stdlib.c
// Runtime support library
// ----------------------------------------------------------------------

#include <stdlib.h>
#include <unistd.h>
#include "stdlib.h"

// ----------------------------------------------------------------------
// I/O Management Functions
// ----------------------------------------------------------------------

// writes <ch> to standard output (<out> is the predefined Writer object)
void Writer_io_write(void *out, int ch) {
  char c = ch;
  
  write(1, &c, 1);  
}

// reads a character from stdin and returns it (<in> is the predefined Reader object)
int Reader_io_read(void *in) {
  char c;

  read(0, &c, 1);

  return c;
}

// ----------------------------------------------------------------------
// String Management Functions
// ----------------------------------------------------------------------

// Constructs and returns a String using chars in <lit>, which must be null terminated
struct String *string_fromlit(char *lit)
{
  struct String *newstr = (struct String *)calloc(sizeof(struct String), 1);
  struct CharNode *cur = NULL;
  while (*lit) {
    struct CharNode *node = (struct CharNode *)calloc(sizeof(struct CharNode), 1);
    node->ch = *lit;
    if (cur == NULL) {
      newstr->list = node;
    } else {
      cur->next = node;
    }
    cur = node;
    lit++;
  }
  return newstr; 
}


#include <stdlib.h>
#include <stdio.h>
#include "hash.h"

hashtable_t *hashtable;
extern FILE *yyin;

void initMe(void)
{
    hashtable = ht_create( 65535 );
}

void yyerror (char const *s) {
   fprintf (stderr, "%s\n", s);
   printf("Line number: %d", getLineNumber());
   exit(3);
}

int yywrap()
{
  return(1);
}

int main (int argc, char *argv[])
{
    initMe();
   
    FILE *fp;
    fp = fopen(argv[1], "r");

    yyin = fp;
    yyparse();

    fclose(fp);
    return 0;
}
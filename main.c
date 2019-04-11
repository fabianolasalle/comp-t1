#include <stdlib.h>
#include <stdio.h>
#include "hash.h"

hashtable_t *hashtable;
extern FILE *yyin;

void initMe(void)
{
    hashtable = ht_create( 65535 );
}

int main (int argc, char *argv[])
{
    initMe();
   
    FILE *fp;
    fp = fopen(argv[1], "r");

    yyin = fp;
    yylex();

    fclose(fp);
    return 0;
}
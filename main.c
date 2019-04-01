#include <stdlib.h>
#include <stdio.h>
//#include "lex.yy.c"
#include "hash.h"
#include "tokens.h"

int main (int argc, char *argv[])
{
    hashtable_t *hashtab = ht_create( 65536 );

    ht_set(hashtab, "$abc", 208);

    printf("%d", ht_get(hashtab, "$abc"));

    /*
    FILE *fp;
    fp = fopen(argv[1], "r");

    yyin = fp;
    yylex();

    fclose(fp);
    
    */
    return 0;
}
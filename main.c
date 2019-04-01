#include <stdlib.h>
#include <stdio.h>
#include "hash.h"
// #include "tokens.h"

hashtable_t *hashtable;
extern FILE *yyin;

int main (int argc, char *argv[])
{
    hashtable = ht_create( 65536 );
    /*
    int *line = 20;
    char *charline = "$abc";

    char buf[12];
    sprintf(buf, "%s%d", charline, line);
    //printf("%s", buf);
    
    ht_set(hashtab, buf, TK_IDENTIFIER);

    printf("%d", ht_get(hashtab, buf));
    */
   
    FILE *fp;
    fp = fopen(argv[1], "r");

    yyin = fp;
    yylex();

    fclose(fp);
    return 0;
}

// sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtab, buf, TK_IDENTIFIER);
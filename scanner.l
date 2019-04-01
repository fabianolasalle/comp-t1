%{
#include <stdio.h>
#include <stdlib.h>
#include "tokens.h"
#include "hash.h"

hashtable_t *hashtab;
int line_number = 1;
%}

%%
$[a-zA-Z][a-zA-Z0-9]*   {  ht_set(hashtab, yytext, TK_IDENTIFIER); }
[ \t]+                  /* ignore whitespace */;
%%

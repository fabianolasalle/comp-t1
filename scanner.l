%{
#include <stdio.h>
#include <stdlib.h>
#include "tokens.h"
#include "hash.h"

char buf[12];
int num_lines = 0;
%}

%%
\n { ++num_lines; }
[a-zA-Z][a-zA-Z0-9]*   { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, TK_IDENTIFIER); printf("%d", ht_get(hashtable, buf)); }
[ \t]+                  /* ignore whitespace */;
%%
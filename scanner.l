%{
#include <stdio.h>
#include <stdlib.h>
#include "tokens.h"
#include "hash.h"

char buf[48];
int num_lines = 0;
%}

%%


\n { ++num_lines; }
int { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, KW_INT); }
real { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, KW_REAL); }
bool { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, KW_BOOL); }
char { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, KW_CHAR); }
if { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, KW_IF); }
else { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, KW_ELSE); }
loop { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, KW_LOOP); }
input { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, KW_INPUT); }
output { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, KW_OUTPUT); }
return { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, KW_RETURN); }

[\,\;\:\(\)\[\]\{\}\+\-\*\/\<\>\=\!\&\$] { sprintf(buf, "%d%d", yytext[0], num_lines); ht_set(hashtable, buf, yytext[0]); }

\<\= { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, OP_LE); }
\>\= { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, OP_GE); }
\=\= { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, OP_EQ); }
\!\= { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, OP_NE); }
\&\& { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, OP_AND); }
\|\| { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, OP_OR); }

FALSE { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, LIT_FALSE); }
TRUE { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, LIT_TRUE); }

'[a-zA-Z]' { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, LIT_CHAR); }

[a-zA-Z]* { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, TK_IDENTIFIER); }
[0-9]* { sprintf(buf, "%d%d", yytext, num_lines); ht_set(hashtable, buf, LIT_INTEGER); }


[ \t]+   /* ignore whitespace */
\/\/.+   /* Ignore single line */


%%

int getLineNumber() {
    return num_lines;
}
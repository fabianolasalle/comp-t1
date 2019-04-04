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
int { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, KW_INT); printf("%d\n", KW_INT); printf("%s\n", yytext); }
real { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, KW_REAL); printf("%d\n", KW_REAL); }
bool { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, KW_BOOL); printf("%d\n", KW_BOOL); }
char { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, KW_CHAR); printf("%d\n", KW_CHAR); }
if { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, KW_IF); printf("%d\n", KW_IF); }
else { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, KW_ELSE); printf("%d\n", KW_ELSE); }
loop { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, KW_LOOP); printf("%d\n", KW_LOOP); }
input { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, KW_INPUT); printf("%d\n", KW_INPUT); }
output { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, KW_OUTPUT); printf("%d\n", KW_OUTPUT); }
return { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, KW_RETURN); printf("%d\n", KW_RETURN); }

[\,\;\:\(\)\[\]\{\}\+\-\*\/\<\>\=\!\&\$] { sprintf(buf, "%d%d", yytext[0], num_lines); ht_set(hashtable, buf, yytext[0]); printf("%d\n", yytext[0]); printf("%s\n", yytext); }

\<\= { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, OP_LE); printf("%d\n", OP_LE); }
\>\= { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, OP_GE); printf("%d\n", OP_GE); }
\=\= { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, OP_EQ); printf("%d\n", OP_EQ); }
\!\= { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, OP_NE); printf("%d\n", OP_NE); }
\&\& { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, OP_AND); printf("%d\n", OP_AND); }
\|\| { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, OP_OR); printf("%d\n", OP_OR); }

FALSE { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, LIT_FALSE); printf("%d\n", LIT_FALSE); }
TRUE { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, LIT_TRUE); printf("%d\n", LIT_TRUE); }

'[a-zA-Z]' { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, LIT_CHAR); printf("%d\n", LIT_CHAR); }

\".+\" { printf("Is a String: %s", yytext); }

[a-zA-Z]* { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, TK_IDENTIFIER); printf("%d\n", TK_IDENTIFIER); printf("%s\n", yytext); }
[0-9]* { sprintf(buf, "%d%d", yytext, num_lines); ht_set(hashtable, buf, LIT_INTEGER); printf("%d\n", LIT_INTEGER); }


[ \t]+                  /* ignore whitespace */
\/\/.+  { printf("will ignore. Single lines"); } /* Ignore single line */


%%

int getLineNumber() {
    return num_lines;
}
%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
#include "hash.h"

extern YYSTYPE yylval;
char buf[48];
int num_lines = 1;
%}

%%

\n { ++num_lines; }
int { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, KW_INT); print_token(yytext); return KW_INT; }
real { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, KW_REAL); print_token(yytext); return KW_REAL; }
bool { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, KW_BOOL); print_token(yytext); return KW_BOOL; }
char { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, KW_CHAR); print_token(yytext); return KW_CHAR; }
if { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, KW_IF); print_token(yytext); return KW_IF; }
else { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, KW_ELSE); print_token(yytext); return KW_ELSE; }
loop { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, KW_LOOP); print_token(yytext); return KW_LOOP; }
input { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, KW_INPUT); print_token(yytext); return KW_INPUT; }
output { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, KW_OUTPUT); print_token(yytext); return KW_OUTPUT; }
return { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, KW_RETURN); print_token(yytext); return KW_RETURN; }

[\;?\:?\[?\]?\{?\}?\-?\*?\/?\<?\>?\=?\!?\&?] { sprintf(buf, "%d%d", yytext[0], num_lines); ht_set(hashtable, buf, yytext[0]); return yytext[0]; }
\( { sprintf(buf, "%d%d", yytext[0], num_lines); ht_set(hashtable, buf, yytext[0]);  return yytext[0]; }
\) { sprintf(buf, "%d%d", yytext[0], num_lines); ht_set(hashtable, buf, yytext[0]);  return yytext[0]; }
\(\) { return yytext[0]; }
\++ { sprintf(buf, "%d%d", yytext[0], num_lines); ht_set(hashtable, buf, PLUSPLUS);  return PLUSPLUS; }
\, { sprintf(buf, "%d%d", yytext[0], num_lines); ht_set(hashtable, buf, yytext[0]); return yytext[0]; }
\$ { sprintf(buf, "%d%d", yytext[0], num_lines); ht_set(hashtable, buf, yytext[0]); return yytext[0]; }

\<\= { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, OP_LE); print_token(yytext); return OP_LE; }
\>\= { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, OP_GE); print_token(yytext); return OP_GE; }
\=\= { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, OP_EQ); print_token(yytext); return OP_EQ; }
\!\= { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, OP_NE); print_token(yytext); return OP_NE; }
\&\& { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, OP_AND); print_token(yytext); return OP_AND; }
\|\| { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, OP_OR); print_token(yytext); return OP_OR; }

FALSE { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, LIT_FALSE); print_token(yytext); return LIT_FALSE; }
TRUE { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, LIT_TRUE); print_token(yytext); return LIT_TRUE; }
\"[a-zA-Z].+\" { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, LIT_CHAR); print_token(yytext); return LIT_CHAR; }
\$?[a-zA-Z]* { sprintf(buf, "%s%d", yytext, num_lines); ht_set(hashtable, buf, TK_IDENTIFIER); print_token(yytext); return TK_IDENTIFIER; }
[0-9]* { sprintf(buf, "%d%d", yytext, num_lines); ht_set(hashtable, buf, LIT_INTEGER); print_token(yytext); return LIT_INTEGER; }

[ \t]+   /* ignore whitespace */
\/\/.+   /* Ignore single line */

. { yyerror("Invalid Character"); }

%%

void print_token(char *yytext) {
    printf("Token: %s\n", yytext);
}

int getLineNumber() {
    return num_lines;
}
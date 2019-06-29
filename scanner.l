%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"

extern YYSTYPE yylval;
%}

%%

int { print_token(yytext); return KW_INT; }
real { print_token(yytext); return KW_REAL; }
bool { print_token(yytext); return KW_BOOL; }
char { print_token(yytext); return KW_CHAR; }
if { print_token(yytext); return KW_IF; }
else { print_token(yytext); return KW_ELSE; }
loop { print_token(yytext); return KW_LOOP; }
input { print_token(yytext); return KW_INPUT; }
output { print_token(yytext); return KW_OUTPUT; }
return { print_token(yytext); return KW_RETURN; }

[\;?\:?\[?\]?\{?\}?\-?\*?\/?\<?\>?\=?\!?\&?\$?] { return yytext[0]; }
\( { return yytext[0]; }
\) { return yytext[0]; }
\(\) { return yytext[0]; }
\++ { return PLUSPLUS; }
\, { return yytext[0]; }

\<\= { print_token(yytext); return OP_LE; }
\>\= { print_token(yytext); return OP_GE; }
\=\= { print_token(yytext); return OP_EQ; }
\!\= { print_token(yytext); return OP_NE; }
\&\& { print_token(yytext); return OP_AND; }
\|\| { print_token(yytext); return OP_OR; }

FALSE { print_token(yytext); return LIT_FALSE; }
TRUE { print_token(yytext); return LIT_TRUE; }
\"[a-zA-Z].+\" { print_token(yytext); return LIT_CHAR; }
\$?[a-zA-Z]* { print_token(yytext); return TK_IDENTIFIER; }
[0-9]* { print_token(yytext); return LIT_INTEGER; }

[ \t]+   /* ignore whitespace */
\/\/.+   /* Ignore single line */

%%

void print_token(char *yytext) {
    printf("Token: %s\n", yytext);
}
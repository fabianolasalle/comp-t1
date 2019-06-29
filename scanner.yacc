%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"
%}

%start file

%token TK_IDENTIFIER KW_INT KW_REAL KW_BOOL KW_CHAR KW_IF KW_ELSE KW_LOOP KW_INPUT KW_OUTPUT KW_RETURN OP_LE OP_GE OP_EQ OP_NE OP_AND OP_OR LIT_FALSE LIT_TRUE LIT_CHAR LIT_INTEGER DEFINITION

%%

file: stmt
    | file stmt

stmt: expr ':' { printf("\nFound: Variable attribution START;\n"); }
    | expr ';' { printf("\nFound: Variable attribution FINISH;\n"); }
    | expr ',' 
    | expr ')' 
    | expr
    ;

expr: TK_IDENTIFIER { printf("found IDENTIFIER\n"); }
    | LIT_INTEGER { printf("found INT\n"); }
    | expr '[' expr ']' { printf("\nFound: Variable attribution is ARRAY;\n"); }
    | expr '()' { printf("\nFound: Defining empty METHOD ;\n"); }
    | expr '(' stmt { printf("\nFound: Defining METHOD;\n"); }
    ;
%%

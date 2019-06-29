%define parse.trace
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

stmt: expr
    | stmt expr
    | output
    ;

expr: TK_IDENTIFIER { printf("found IDENTIFIER\n"); }
    | LIT_INTEGER { printf("found VALUE INT\n"); }
    | LIT_FALSE { printf("found VALUE FALSE\n"); }
    | LIT_TRUE { printf("found VALUE TRUE\n"); }
    | KW_RETURN { printf("found RETURN\n"); }
    | KW_INT { printf("found INT\n"); }
    | KW_REAL { printf("found REAL\n"); }
    | KW_BOOL { printf("found BOOL\n"); }
    | KW_CHAR { printf("found CHAR\n"); }
    | KW_IF { printf("found IF\n"); }
    | KW_ELSE { printf("found ELSE\n"); }
    | KW_LOOP { printf("found LOOP\n"); }
    | KW_INPUT { printf("found INPUT\n"); }
    | expr '[' expr ']' { printf("\nFound: Variable attribution is ARRAY;\n"); }
    | expr '(' { printf("\nFound: Defining METHOD;\n"); }
    | expr ':' { printf("\nFound: Variable attribution START;\n"); }
    | expr ';' { printf("\nFound: Variable attribution FINISH;\n"); }
    | expr ',' 
    | expr ')'
    | expr '+' expr
    | expr '<' expr
    | expr '>' expr
    | expr '=' expr
    | expr ';' expr
    | "++" expr
    | '{'
    | '}'
    ;

output: LIT_CHAR { printf("found VALUE CHAR\n"); }
    | "output" output
    ;
%%

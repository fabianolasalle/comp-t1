%{
#include <stdio.h>

%}

%start stat

%token LIT_INTEGER TK_IDENTIFIER

%%

list: stat
        //  |
        // list stat '\n'
        //  |
        // list error '\n'
        //  {
        //    yyerrok;
        //  }
         ;

stat:    'word'
         {
           printf("Foo de nega preta\n");
         }
         ;
%%
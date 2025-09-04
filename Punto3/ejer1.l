%{
#include "ejer1.tab.h"
#include <stdlib.h>
%}

%%

[ \t\r]+           ;                
"cbrt"             return CBRT;    
"("                return LPAREN;
")"                return RPAREN;
[0-9]+(\.[0-9]+)?  { yylval.num = atof(yytext); return NUM; }
\n                 return NEWLINE;
.                  ;     

%%
int yywrap(void){ return 1; }


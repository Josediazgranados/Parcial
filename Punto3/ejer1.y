%{
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
void yyerror(const char *s);
int yylex(void);
%}

%union {
  double num;
}

%token <num> NUM
%token CBRT LPAREN RPAREN NEWLINE
%type  <num> expr

%%

input:
    /* vacío */
  | input line
  ;

line:
    CBRT LPAREN expr RPAREN NEWLINE   { printf("cbrt(%g) = %g\n", $3, cbrt($3)); }
  | expr NEWLINE                      { printf("cbrt(%g) = %g\n", $1, cbrt($1)); }
  ;

expr:
    NUM
  ;

%%

void yyerror(const char *s){
  fprintf(stderr, "Error: %s\n", s);
}

int main(int argc, char** argv){
  if(argc > 1){
    FILE* f = fopen(argv[1], "r");
    if(!f){ perror("fopen"); return 1; }
    extern FILE* yyin;
    yyin = f;
  }
  return yyparse();
}


grammar Calcpru;

prog:   stat+ ;

stat:   expr NEWLINE                # printExpr
    |   ID '=' expr NEWLINE         # assign
    |   'maclaurin' '(' 'x=' expr ',' 'n=' INT ')' NEWLINE  # maclaurinExpr
    |   NEWLINE                     # blank
    ;

expr:   expr op=('*'|'/') expr      # MulDiv
    |   expr op=('+'|'-') expr      # AddSub
    |   INT                         # int
    |   FLOAT                       # float
    |   ID                          # id
    |   '(' expr ')'                # parens
    ;

MUL : '*' ;
DIV : '/' ;
ADD : '+' ;
SUB : '-' ;

ID  : [a-zA-Z]+ ;
INT : [0-9]+ ;
FLOAT : [0-9]+'.'[0-9]+ ;

NEWLINE:'\r'? '\n' ;
WS  : [ \t]+ -> skip ;


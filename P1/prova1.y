%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
extern int yyparse();
void yyerror(const char *msg);

%}

%token EOL 0
%token CONCATT
%token LENGTHT
%token PRINTT
%token IDT
%token STRINGT
%token NUM
%token PLUS
%token MINUS
%token TIMES
%token DIV
%token ABREP
%token FECHAP
%token ATRIBUICAO
%token ERROR

%start program

%left PLUS MINUS
%left TIMES DIV

%%

/* programa */
program
: stmt_list 
;

stmt_list
: stmt
| stmt_list stmt
;

stmt
: IDT ATRIBUICAO expr
| PRINTT ABREP exprlist FECHAP
| CONCATT ABREP exprlist FECHAP
| LENGTHT ABREP expr FECHAP
| expr
;

exprlist
: expr "," expr
| expr

expr
: expr PLUS expr
| expr MINUS expr
| expr TIMES expr
| expr DIV expr
| ABREP expr FECHAP
| STRINGT
| IDT
| NUM
;

%%


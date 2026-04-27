%{
#include "prova1.tab.h"
#include <stdlib.h>
#include <string.h>

char yylval_type;

void yyerror(const char *msg);
int yylex();
%}

%option noyywrap

DIGITO          [0-9]
LETRA           [a-zA-Z]
DECIMAL         {DIGITO}+
REAL            {DECIMAL}"."{DECIMAL}
ID              {LETRA}({LETRA}|{DIGITO}|"_")*
STRING          """({LETRA}|{DIGITO})+"""

%%

[ \t]+ ;

"//".*          {}

"concat"        {return CONCATT;}
"length"        {return LENGTHT;}
"print"         {return PRINTT;}

{REAL}          {yylval_type = 'F'; return NUM;}
{DECIMAL}       {yylval_type = 'I'; return NUM;}
{ID}            {return IDT;}
{STRING}        {return STRINGT;}

"+"             {return PLUS;}
"-"             {return MINUS;}
"*"             {return TIMES;}
"/"             {return DIV;}
"("		        {return ABREP;}	
")"		        {return FECHAP;}
"="             {return ATRIBUICAO;}
\n              {return EOL;}
.               {return ERROR;}

%%

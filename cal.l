%{
#include "cal.tab.h"
int yylex(void);
int yyerror(char* s);
%}

%%
[0-9]+ {yylval = atoi(yytext); return Tnb;}
[()-+*/] {return yytext[0];}
[ \n\t]+ {;}
. yyerror("Invalid input character");
%%

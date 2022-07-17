%{
#include <stdio.h>
int yylex(void);
int yyerror(char* s);
%}

%token Tnb
%start S

%%
S : E {printf("1\n");}
    | S E {printf("2\n");}
    ;

E : T {printf("3\n");}
    | E '+' T {printf("4\n");}
    | E '-' T {printf("5\n");}
    ;

T : F {printf("6\n");}
    | T '*' F {printf("7\n");}
    | T '/' F {printf("8\n");}
    ;

F : Tnb {printf("9\n");}
    | '(' E ')' {printf("10\n");}
    ;
%%

int yyerror(char *s){
    fprintf(stderr," Syntaxe incorrecte : %s\n",s);
    return 0;
}
int yywrap(){
return 1;
}
int main(void)
{
yyparse();
}

%{
#include<stdio.h>
int cwc = 0;
%}

%%
[A-Z]+[ \t\n] { printf("%s", yytext); cwc++; }
.|\n {}
%%

int main()
{
    printf("Enter a string: ");
    yylex();
    printf("\nNumber of capital words are: %d\n", cwc);
    return 0;
}
int yywrap()
{
    return 1;
}



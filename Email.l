%{
#include <stdio.h>
int invalidEmail = 0;
%}

%%
[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,} { printf("Valid Email: %s\n", yytext); exit(0); }
.|\n { if(!invalidEmail) { printf("Invalid Email\n"); invalidEmail = 1; } }
%%

int main() {
    printf("Enter an email address: ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}


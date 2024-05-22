%{
#include <stdio.h>
int validURL = 1; // Assume the URL is valid by default
%}

%%
(http|https):\/\/[^\s]+ { printf("Valid URL\n"); }
.|\n { printf("Invalid URL\n"); validURL = 0; }
%%

int main() {
    printf("Enter an HTTP/HTTPS address: ");
    yylex();

    if (!validURL) {
        printf("Invalid URL\n");
    }

    return 0;
}

int yywrap() {
    return 1;
}


%{
#include <stdio.h>
int invalidIP = 0; // Assume the IP is valid by default
%}

%%
([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]) { printf("Valid IP: %s\n", yytext);exit(0); }
.|\n { printf("Invalid IP\n"); invalidIP = 1;exit(0); }
%%

int main() {
    printf("Enter an IP address: ");
    yylex();
    if (invalidIP) {
        printf("Invalid IP\n");
    }
    return 0;
}

int yywrap() {
    return 1;
}


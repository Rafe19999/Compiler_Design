%{
#include<stdio.h>
int tc = 0;
%}

%%
"auto" | "break" | "case" | "char" | "const" | "continue" | "default" | "do" | "double" | "else" | "enum" | "extern" | "float" | "for" | "goto" | "if" | "int" | "long" | "register" | "return" | "short" | "signed" | "sizeof" | "static" | "struct" | "switch" | "typedef" | "union" | "unsigned" | "void" | "volatile" | "while" {tc++;}
[a-zA-Z_][a-zA-Z0-9_]* {tc++;}
"("|")"|"{"|"}"|"["|"]"|"," {tc++;}
"+"|"-"|"*"|"/"|"%"|"++"|"--"|"=="|"!="|"<"|">"|"<="|">="|"&&"|"|"|"!" {tc++;}
[0-9]+ {tc++;}
[0-9]+"."[0-9]+ {tc++;}
"$"|"_" {tc++;}
"//".*  /* Single line comment */
"/*".*?"*/" /* Multi-line comment */
[ \t\n]   /* Whitespace */
"\".*?\"" {tc++;} /* String literals */
"'.*?'" {tc++;} /* Character constants */
%%

int main()
{
    printf("Enter the text: ");
    yylex();
    printf("Token count is: %d",tc);
    return 0;
}

int yywrap(){
    return -1;
}


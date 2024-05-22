%{
#include<stdio.h>
int nc = 0;
%}

%%
"/*"[a-zA-Z0-9\n\t ]*"*/" {nc++;}      /* multiple line comment */
"//"[a-zA-Z0-9\t ]*"\n" {nc++;}       // Single line comment
%%

int main(){
    printf("Enter the text: ");
    yylex();
         //comment count
    printf("Comment count is: %d ",nc);    
}
int yywrap(){
return -1;
}

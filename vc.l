%{
#include<stdio.h>
int vc=0,cc=0;
%}

%%
[' '\t\n] ;
[AEIOUaeiou] {vc++;}
[^AEIOUaeiou] {cc++;}

%%

int main()
{
printf("Enter the text:");
yylex();
printf("No of vowels :%d\n", vc);
printf("No of consonants : %d\n", cc);
}
int yywrap()
{
return 1;
}

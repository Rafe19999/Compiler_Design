/* Lex program to recognize valid arithmetic expression 
        and identify the identifiers and operators */
%{  
#include <stdio.h>  
#include <string.h>  
    int operators_count = 0, operands_count = 0, valid = 1, top = -1, l = 0, j = 0;  
    char operands[10][10], operators[10][10], stack[100];  
%}  
%% 
"(" {  
    top++;  
    stack[top] = '(';  
}  
"{" { 
    top++;  
    stack[top] = '{';  
}  
"[" {  
    top++;  
    stack[top] = '[';  
}  
")" {  
    if (stack[top] != '(') {  
        valid = 0;      
    }  
    else if(operands_count>0 && (operands_count-operators_count)!=1){ 
        valid=0; 
    } 
    else{ 
        top--; 
        operands_count=1; 
        operators_count=0; 
    }  
}  
"}" {  
    if (stack[top] != '{') {  
        valid = 0;      
    }  
    else if(operands_count>0 && (operands_count-operators_count)!=1){ 
        valid=0; 
    } 
    else{ 
        top--; 
        operands_count=1; 
        operators_count=0; 
    }  
}  
"]" {  
    if (stack[top] != '[') {  
        valid = 0;  
    }  
    else if(operands_count>0 && (operands_count-operators_count)!=1){ 
        valid=0; 
    } 
    else{ 
        top--; 
        operands_count=1; 
        operators_count=0; 
    }  
          
}  
"+"|"-"|"*"|"/" {  
    operators_count++;  
    strcpy(operators[l], yytext);  
    l++;  
}  
[a-zA-Z] {  
    operands_count++;  
    strcpy(operands[j], yytext);  
    j++;  
}  
%%  
  
  
int yywrap()  
{  
    return 1;  
}  
int main()  
{  
    int k;  
    printf("Enter the arithmetic expression: ");  
    yylex();  
    
    if(operands_count>0 && (operands_count-operators_count)!=1){
    valid=0;
    }
    
    if (valid == 1 && top == -1) {  
        printf("\nValid Expression\n");  
        
	printf("\n Number of operands are:\n");
     for(k=0;k<=4;k++)
     {
        puts(operands[k]);
     }
	 printf("\n Number of operators are:\n");
     for(k=0;k<=4;k++)
     {
        puts(operators[k]);
     } 
    }
    
	else
	{
        printf("\nInvalid Expression\n"); 
    }
     
    return 0; 
}  

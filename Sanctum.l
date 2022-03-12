%{ 
  #include <stdlib.h>
  #include <stdio.h>
  #include <string.h>

 #define     IDENTIFIER 1
 #define     EQUAL 2
 #define     INTEGER 3
 #define     SEMICOLON 4
 #define     PLUS 5
 #define     LEFTPARENT 6
 #define     RIGHTPARENT 7
 #define     RIGHTCURLY 8
 #define     LEFTCURLY 9
 #define     PERCENT 10
 #define     LOWER 11
 #define     GREATER 12
 #define     COMMA 13
 #define     COLON 14
 #define     DIVIDE 15
 #define     MULTIPLY 16
 #define     MINUS 17
 #define     DOUBLE 18
 #define     QUOTATION 19
 #define     FOR 20
 #define     WHILE 21
 #define     IF 22
 #define     ELSE 23
 #define     PRINTF 24
 #define     ISPRIME 25
 #define     COMMENT 26
 #define     TRUE 27
 #define     FALSE 28
 #define     BOOLEAN 29
 #define     DEFINE 30
 #define     NOTEQUAL 31
 #define     EXIT 32

 #define DEFINETOKENS char  *text[]={NULL,"IDENTIFIER","EQUAL","INTEGER","SEMICOLON","PLUS","LEFTPARENT","RIGHTPARENT","RIGHTCURLY","LEFTCURLY","PERCENT","LOWER","GREATER","COMMA","COLON","DIVIDE","MULTIPLY","MINUS","DOUBLE","QUOTATION","FOR","WHILE","IF","ELSE","PRINTF","ISPRIME","COMMENT", "TRUE","FALSE","BOOLEAN", "DEFINE", "NOTEQUAL", "EXIT"};

 



%}




%%
"=="                    return EQUAL;
":"                     return COLON;
";"                     return SEMICOLON;
"="                     return DEFINE;
"("                     return LEFTPARENT;   
")"                     return RIGHTPARENT;
"{"                     return RIGHTCURLY;
"}"                     return LEFTCURLY;
"%"                     return PERCENT;
"<"                     return LOWER;
">"                     return GREATER;
","                     return COMMA;
"!="                    return NOTEQUAL;
"\""                    return QUOTATION;
[-]?[0-9]+              return INTEGER;
[-]?[0-9]+\.[0-9]+      return DOUBLE;
"+"                     return PLUS;
"-"                     return MINUS;
"/"                     return DIVIDE;
"*"                     return MULTIPLY;
"for"                   return FOR;
"while"                 return WHILE;
"printf"                return PRINTF;
"if"                    return IF; 
"else"                  return ELSE;
"isPrime"               return ISPRIME;
"//".*                  return COMMENT;
"EXIT"                  return EXIT;
"\n"                    {yylineno++;}                  
[a-zA-Z][_a-zA-Z0-9]*	return IDENTIFIER;
[ \t\n]                 ;
.                    {printf("Error!Undefined Token");}


%%

extern int yylex();
extern int yylineno;
extern char* yytext;

DEFINETOKENS

int main(void) {
   int token = yylex();
    while(token) {
       printf("yytext: %-15s\ttoken: %-15s\tlineno: %-15d\n", yytext, text[token], yylineno);
       token=yylex();
   }
   return 0;
}
int yywrap(void){
    return 1;
}
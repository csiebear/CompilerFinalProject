/*

The Lex structure

definition ＆rules ＆user code



definition

%%//separate by this

rules

%%

user code



*/
%option yylineno
%option noyywrap
%option noinput
%option nounput

%{
	#include <stdio.h>
	#include <iostream>
	#include <string>
	
	extern int yylex();
	extern int yylineno;
	extern void yyerror(const char *msg);
%}

Number [0-9]+

Identifier (id)[A-Z][a-z0-9]*

%%
[ \t]*	{}
[\n]	{printf("\n%2d ",yylineno);}
{Identifier}	{printf("ID ");}
int	{printf("INT ");}
char	{printf("CHAR ");}
return	{printf("RETURN ");}
if	{printf("IF ");}
else	{printf("ELSE ");}
break	{printf("BREAK ");}
while	{printf("WHILE ");}
print	{printf("PRINT ");}
read	{printf("READ ");}

"="	{printf("ASSIGN ");}
"!"	{printf("NOT ");}

"+"	{printf("PLUS ");}
"-"	{printf("MINUS ");}
"*"	{printf("MUL ");}
"/"	{printf("DIV ");}

"["	{printf("LCHAV ");}
"]"	{printf("RCHAV ");}
"("	{printf("LPARE ");}
")"	{printf("RPARE ");}
"{"	{printf("LBRAC ");}
"}"	{printf("RBRAC ");}
";"	{printf("SEMI ");}
","	{printf("COMMA ");}

"=="	{printf("EQUAL ");}
"!="	{printf("NOTEQ ");}
"<"	{printf("SMALL ");}
"<="	{printf("SMAEQ ");}
">"	{printf("BIG ");}
">="	{printf("BIGEQ ");}
"&&"	{printf("AND ");}
"||"	{printf("OR ");}

Number	{printf("NUM ");}


"//".* {
}

. {
}

%%
int main (){
	printf("%2d ",yylineno);
	yylex();
	return 0;
}


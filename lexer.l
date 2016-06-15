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
	#include "y.tab.h"
	
	extern int yylineno;
	extern void yyerror(const char *msg);

%}
DIGIT [0-9]
NOTZERO [1-9]
Number {NOTZERO}*{DIGIT}+

Identifier (id)[A-Z][a-z0-9]*

%%
[ \t]*	{}
[\n]	{}
{Identifier}	{yylval.str = (char*)malloc(strlen(yytext)+1);strcpy(yylval.str, yytext);return ID;}
{Number}	{yylval.int_val = atoi(yytext); return NUM;}


int	{yylval.str = (char*)malloc(strlen(yytext)+1);strcpy(yylval.str, yytext);return INT;}
char	{yylval.str = (char*)malloc(strlen(yytext)+1);strcpy(yylval.str, yytext);return CHAR;}
return	{yylval.str = (char*)malloc(strlen(yytext)+1);strcpy(yylval.str, yytext);return RETURN;}
if	{yylval.str = (char*)malloc(strlen(yytext)+1);strcpy(yylval.str, yytext);return IF;}
else	{yylval.str = (char*)malloc(strlen(yytext)+1);strcpy(yylval.str, yytext);return ELSE;}
break	{yylval.str = (char*)malloc(strlen(yytext)+1);strcpy(yylval.str, yytext);return BREAK;}
while	{yylval.str = (char*)malloc(strlen(yytext)+1);strcpy(yylval.str, yytext);return WHILE;}
print	{yylval.str = (char*)malloc(strlen(yytext)+1);strcpy(yylval.str, yytext);return PRINT;}
read	{yylval.str = (char*)malloc(strlen(yytext)+1);strcpy(yylval.str, yytext);return READ;}

"="	{yylval.str = (char*)malloc(strlen(yytext)+1);strcpy(yylval.str, yytext);return ASSIGN;}
"!"	{yylval.str = (char*)malloc(strlen(yytext)+1);strcpy(yylval.str, yytext);return NOT;}

"+"	{yylval.str = (char*)malloc(strlen(yytext)+1);strcpy(yylval.str, yytext);return PLUS;}
"-"	{yylval.str = (char*)malloc(strlen(yytext)+1);strcpy(yylval.str, yytext);return MINUS;}
"*"	{yylval.str = (char*)malloc(strlen(yytext)+1);strcpy(yylval.str, yytext);return MUL;}
"/"	{yylval.str = (char*)malloc(strlen(yytext)+1);strcpy(yylval.str, yytext);return DIV;}

"["	{yylval.str = (char*)malloc(strlen(yytext)+1);strcpy(yylval.str, yytext);return LCHAV;}
"]"	{yylval.str = (char*)malloc(strlen(yytext)+1);strcpy(yylval.str, yytext);return RCHAV;}
"("	{yylval.str = (char*)malloc(strlen(yytext)+1);strcpy(yylval.str, yytext);return LPARE;}
")"	{yylval.str = (char*)malloc(strlen(yytext)+1);strcpy(yylval.str, yytext);return RPARE;}
"{"	{yylval.str = (char*)malloc(strlen(yytext)+1);strcpy(yylval.str, yytext);return LBRAC;}
"}"	{yylval.str = (char*)malloc(strlen(yytext)+1);strcpy(yylval.str, yytext);return RBRAC;}
";"	{yylval.str = (char*)malloc(strlen(yytext)+1);strcpy(yylval.str, yytext);return SEMI;}
","	{yylval.str = (char*)malloc(strlen(yytext)+1);strcpy(yylval.str, yytext);return COMMA;}

"=="	{yylval.str = (char*)malloc(strlen(yytext)+1);strcpy(yylval.str, yytext);return EQUAL;}
"!="	{yylval.str = (char*)malloc(strlen(yytext)+1);strcpy(yylval.str, yytext);return NOTEQ;}
"<"	{yylval.str = (char*)malloc(strlen(yytext)+1);strcpy(yylval.str, yytext);return SMALL;}
"<="	{yylval.str = (char*)malloc(strlen(yytext)+1);strcpy(yylval.str, yytext);return SMAEQ;}
">"	{yylval.str = (char*)malloc(strlen(yytext)+1);strcpy(yylval.str, yytext);return BIG;}
">="	{yylval.str = (char*)malloc(strlen(yytext)+1);strcpy(yylval.str, yytext);return BIGEQ;}
"&&"	{yylval.str = (char*)malloc(strlen(yytext)+1);strcpy(yylval.str, yytext);return AND;}
"||"	{yylval.str = (char*)malloc(strlen(yytext)+1);strcpy(yylval.str, yytext);return OR;}

"//".* {
}

. {
}

%%



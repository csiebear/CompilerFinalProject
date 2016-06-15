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
	#include "y.tab.h"

	extern int yylineno;
	extern void yyerror(const char *msg);
%}

Number [0-9]+

Identifier (id)[A-Z][a-z0-9]*

%%
[ \t]*	{}
[\n]	{	yylineno++;}
{Identifier}	{yylval.str = new std::string(yytext);return ID;}


int	{yylval.str=new std::string(yytext);return INT;}
char	{yylval.str = new std::string(yytext);return CHAR;}
return	{yylval.str = new std::string(yytext);return RETURN;}
if	{yylval.str = new std::string(yytext);return IF;}
else	{yylval.str = new std::string(yytext);return ELSE;}
break	{yylval.str = new std::string(yytext);return BREAK;}
while	{yylval.str = new std::string(yytext);return WHILE;}
print	{yylval.str = new std::string(yytext);return PRINT;}
read	{yylval.str = new std::string(yytext);return READ;}

"="	{yylval.str = new std::string(yytext);return ASSIGN;}
"!"	{yylval.str = new std::string(yytext);return NOT;}

"+"	{yylval.str = new std::string(yytext);return PLUS;}
"-"	{yylval.str = new std::string(yytext);return MINUS;}
"*"	{yylval.str = new std::string(yytext);return MUL;}
"/"	{yylval.str = new std::string(yytext);return DIV;}

"["	{yylval.str = new std::string(yytext);return LCHAV;}
"]"	{yylval.str = new std::string(yytext);return RCHAV;}
"("	{yylval.str = new std::string(yytext);return LPARE;}
")"	{yylval.str = new std::string(yytext);return RPARE;}
"{"	{yylval.str = new std::string(yytext);return LBRAC;}
"}"	{yylval.str = new std::string(yytext);return RBRAC;}
";"	{yylval.str = new std::string(yytext);return SEMI;}
","	{yylval.str = new std::string(yytext);return COMMA;}

"=="	{yylval.str = new std::string(yytext);return EQUAL;}
"!="	{yylval.str = new std::string(yytext);return NOTEQ;}
"<"	{yylval.str = new std::string(yytext);return SMALL;}
"<="	{yylval.str = new std::string(yytext);return SMAEQ;}
">"	{yylval.str = new std::string(yytext);return BIG;}
">="	{yylval.str = new std::string(yytext);return BIGEQ;}
"&&"	{yylval.str = new std::string(yytext);return AND;}
"||"	{yylval.str = new std::string(yytext);return OR;}

Number	{yylval.str = new std::string(yytext); return NUM;}


"//".* {
}

. {
	return yytext[0];
}

%%



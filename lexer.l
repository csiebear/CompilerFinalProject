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

%option noinput

%option nounput

%{
	#include <stdio.h>
	#include "y.tab.h"
	extern int yylex();
	extern void yyerror(const char *msg);
%}

Number [0-9]+

Identifier (id)[A-Z][a-z0-9]*

%%

\n {
}
Identifier	{return	ID;}


"int"	{return INT;}
"char"	{return CHAR;}
"return"	{return RETURN;}
"if"	{return IF;}
"else"	{return ELSE;}
"break"	{return BREAK;}
"while"	{return WHILE;}
"print"	{return PRINT;}
"read"	{return READ;}

"="	{return '=';}
"!"	{return '!';}

"+"	{return '+';}
"-"	{return '-';}
"*"	{return '*';}
"/"	{return '/';}

"["	{return '[';}
"]"	{return ']';}
"("	{return '(';}
")"	{return ')';}
"{"	{return '{';}
"}"	{return '}';}
";"	{return ';';}
","	{return ',';}

"=="	{return EQUAL;}
"!="	{return NOTEQ;}
"<"	{return SMALL;}
"<="	{return SMAEQ;}
">"	{return BIG;}
">="	{return BIGEQ;}
"&&"	{return AND;}
"||"	{return OR;}

Number	{sscanf(yytext,"%d",&yylval);	return NUM;}


"//".* {
	/*consume//-comment*/
}

. {
	return yytext[0];
}

%%



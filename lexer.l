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
Identifier	{yylval.str = new std::string(yytext);return ID;}


"int"	{yylval.str=new std::string(yytext);return INT;}
"char"	{yylval.str = new std::string(yytext);return CHAR;}
"return"	{yylval.str = new std::string(yytext);return RETURN;}
"if"	{yylval.str = new std::string(yytext);return IF;}
"else"	{yylval.str = new std::string(yytext);return ELSE;}
"break"	{yylval.str = new std::string(yytext);return BREAK;}
"while"	{yylval.str = new std::string(yytext);return WHILE;}
"print"	{yylval.str = new std::string(yytext);return PRINT;}
"read"	{yylval.str = new std::string(yytext);return READ;}

"="	{yylval.str = new std::string(yytext);return '=';}
"!"	{yylval.str = new std::string(yytext);return '!';}

"+"	{yylval.str = new std::string(yytext);return '+';}
"-"	{yylval.str = new std::string(yytext);return '-';}
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

Number	{yylval.int_val = atoi(yytext); return NUM;}


"//".* {
	/*consume//-comment*/
}

. {
	return yytext[0];
}

%%



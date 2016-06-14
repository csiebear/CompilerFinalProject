%{
	#include <stdio.h>
	#include <iostream>
	#include <string>

	using namespace std;

	extern int yylineno;
	extern void yyerror(const char *msg);
	extern int yylex();
%}


%union {
	int int_val;
	char *string_val;
	std::string* str;
}

%start Program
%token <str> ID
%token <str> EQUAL
%token <str> NOTEQ
%token <str> BIG
%token <str> BIGEQ
%token <str> SMALL
%token <str> SMAEQ
%token <str> AND
%token <str> OR
%token <str> INT
%token <str> CHAR
%token <str> RETURN
%token <str> BREAK
%token <str> WHILE
%token <str> IF
%token <str> ELSE
%token <str> BLOCK
%token <str> PRINT
%token <str> READ
%token <int> NUM
%token <str> ASSIGN
%token <str> NOT
%token <str> PLUS
%token <str> MINUS
%token <str> MUL
%token <str> DIV
%token <str> LPARE
%token <str> RPARE
%token <str> LCHAV
%token <str> RCHAV
%token <str> LBRAC
%token <str> RBRAC
%token <str> COMMA
%token <str> DOT
%token <str> SEMI

%token <str> epsilon


%type <str> Program
%type <str> DeclList
%type <str> DeclList2
%type <str> Type
%type <str> Decl
%type <str> FunDecl
%type <str> VarDecl
%type <str> VarDecl2
%type <str> ParamDeclList
%type <str> VarDeclList
%type <str> ParamDeclListTail
%type <str> ParamDeclListTail2
%type <str> ParamDecl
%type <str> ParamDecl2
%type <str> StmtList
%type <str> StmtList2
%type <str> Stmt
%type <str> Expr
%type <str> ExprIdTail
%type <str> ExprArrayTail
%type <str> Expr2
%type <str> ExprList
%type <str> ExprListTail
%type <str> ExprListTail2
%type <str> UnaryOp
%type <str> BinOp

%%

Program
	:DeclList
	;
DeclList
	:DeclList2 DeclList
	|epsilon
	;
DeclList2
	:Type ID Decl
Decl
	:VarDecl2
	|FunDecl
	;
VarDecl
	:Type ID VarDecl2
VarDecl2
	:SEMI
	|LCHAV NUM RCHAV SEMI
FunDecl
	:LPARE ParamDeclList RPARE Block
	;
VarDeclList
	:VarDecl VarDeclList
	|epsilon
	;
ParamDeclList
	:ParamDeclListTail
	|epsilon
	;
ParamDeclListTail
	:ParamDecl ParamDeclListTail2
ParamDeclListTail2
	:COMMA ParamDeclListTail
	|epsilon
	;
ParamDecl
	:Type ID ParamDecl2
	;
ParamDecl2
	:LCHAV RCHAV
	|epsilon
	;
Block
	:LBRAC VarDeclList StmtList RBRAC
Type
	:INT
	|CHAR
	;
StmtList
	:Stmt StmtList2
	;
StmtList2
	:StmtList
	|epsilon
	;
Stmt
	:SEMI
	|Expr SEMI
	|RETURN Expr SEMI
	|BREAK SEMI
	|IF LPARE Expr RPARE Stmt ELSE Stmt
	|WHILE LPARE Expr RPARE Stmt
	|BLOCK
	|PRINT ID SEMI 
	|READ ID SEMI
	;
Expr
	:UnaryOp Expr
	|NUM Expr2
	|LPARE Expr RPARE Expr2
	|ID ExprIdTail
	;
ExprIdTail
	:Expr2
	|LPARE ExprList RPARE Expr2
	|LCHAV Expr RCHAV ExprArrayTail
	|ASSIGN Expr
	;
ExprArrayTail
	:Expr2
	|ASSIGN Expr
	;
Expr2
	:BinOp Expr
	|epsilon
	;
ExprList
	:ExprListTail
	|epsilon
	;
ExprListTail
	:Expr ExprListTail2
	;
ExprListTail2
	:COMMA ExprListTail
	|epsilon
	;
UnaryOp
	:MINUS
	|NOT
	;
BinOp
	:PLUS
	|MINUS
	|MUL
	|DIV
	|EQUAL
	|NOTEQ
	|SMALL
	|SMAEQ
	|BIG
	|BIGEQ
	|AND
	|OR
	;
%%
#include <stdio.h>

void yyerror(const char *msg){
	printf("Line %d:error: %s\n", yylineno, msg);
}
int yywrap(){return 1;}

int main(int argc,char **argv){
	return yyparse();
}


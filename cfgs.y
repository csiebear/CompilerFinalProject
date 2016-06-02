%{
	extern int yylineno;
	extern void yyerror(const char *msg);
	extern int yylex();
%}

%start Program
%token ID EQUAL NOTEQ BIG BIGEQ SMALL SMAEQ AND OR
%token INT CHAR
%token RETURN BREAK WHILE IF ELSE BLOCK PRINT READ
%token NUM epsilon

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
	:';'
	|'[' NUM ']' ';'
FunDecl
	:'(' ParamDeclList ')' Block
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
	:',' ParamDeclListTail
	|epsilon
	;
ParamDecl
	:Type ID ParamDecl2
	;
ParamDecl2
	:'[' ']'
	|epsilon
	;
Block
	:'{' VarDeclList StmtList '}'
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
	:';'
	|Expr ';'
	|RETURN Expr ';'
	|BREAK ';'
	|IF '(' Expr ')' Stmt ELSE Stmt
	|WHILE '(' Expr ')' Stmt
	|BLOCK
	|PRINT ID ';' 
	|READ ID ';'
	;
Expr
	:UnaryOp Expr
	|NUM Expr2
	|'(' Expr ')' Expr2
	|ID ExprIdTail
	;
ExprIdTail
	:Expr2
	|'(' ExprList ')' Expr2
	|'[' Expr ']' ExprArrayTail
	|'=' Expr
	;
ExprArrayTail
	:Expr2
	|'=' Expr
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
	:',' ExprListTail
	|epsilon
	;
UnaryOp
	:'-'
	|'!'
	;
BinOp
	:'+'
	|'-'
	|'*'
	|'/'
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

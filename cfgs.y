%{
	#include <stdio.h>
	#include <iostream>
	using namespace std;

	extern int yylineno;
	extern void yyerror(const char *msg);
	extern int yylex();
%}


%union {
	int int_val;
	char *str;
}
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
%token <str> PRINT
%token <str> READ
%token <int_val> NUM
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
%type <str> Block

%%

Program
	:DeclList
	;
DeclList
	:DeclList2 DeclList
	|/*empyt*/{}
	;
DeclList2
	:Type ID Decl{printf("%s\n",$2);}
Decl
	:VarDecl2
	|FunDecl
	;
VarDecl
	:Type ID VarDecl2
	;
VarDecl2
	:SEMI
	| LCHAV NUM RCHAV SEMI{cout<<$2<<endl;}
	;
FunDecl
	:LPARE ParamDeclList RPARE Block
	;
VarDeclList
	:VarDecl VarDeclList
	|/*empty*/{}
	;
ParamDeclList
	:ParamDeclListTail
	|/*empty*/{}
	;
ParamDeclListTail
	:ParamDecl ParamDeclListTail2
	;
ParamDeclListTail2
	:COMMA ParamDeclListTail
	|/*empty*/{}
	;
ParamDecl
	:Type ID ParamDecl2
	;
ParamDecl2
	:LCHAV RCHAV
	|/*empty*/{}
	;
Block
	:LBRAC VarDeclList StmtList RBRAC
	;
Type
	:INT
	|CHAR
	;
StmtList
	:Stmt StmtList2
	;
StmtList2
	:StmtList
	|/*empty*/{}
	;
Stmt
	:SEMI
	|Expr SEMI
	|RETURN Expr SEMI
	|BREAK SEMI
	|IF LPARE Expr RPARE Stmt ELSE Stmt
	|WHILE LPARE Expr RPARE Stmt
	|Block
	|PRINT ID SEMI 
	|READ ID SEMI
	;
Expr
	:UnaryOp Expr
	|NUM Expr2{}
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
	|/*empty*/{}
	;
ExprList
	:ExprListTail
	|/*empty*/{}
	;
ExprListTail
	:Expr ExprListTail2
	;
ExprListTail2
	:COMMA ExprListTail
	|/*empty*/{}
	;
UnaryOp
	:MINUS
	|NOT
	;
BinOp
	:PLUS{cout<<"add"<<endl;}
	|MINUS{cout<<"sub"<<endl;}
	|MUL{cout<<"mul"<<endl;}
	|DIV{cout<<"div"<<endl;}
	|EQUAL{cout<<"seq"<<endl;}
	|NOTEQ{cout<<"sne"<<endl;}
	|SMALL{cout<<"slt"<<endl;}
	|SMAEQ{cout<<"sle"<<endl;}
	|BIG{cout<<"sgt"<<endl;}
	|BIGEQ{cout<<"sge"<<endl;}
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
	printf("	.text\n");
	printf("	.global main\n");
	printf("main:\n");
	return yyparse();
}


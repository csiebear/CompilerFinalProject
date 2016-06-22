%{
	#include <stdio.h>
	#include <iostream>
	#include <string.h>
	#include <vector>
	using namespace std;
	
	extern int yylineno;
	extern void yyerror(const char *msg);
	extern int yylex();
	vector <char*> idStack;
	vector <int> idNum;
	int position=0;
	int match_pos=0;
	int temp_result=0;
	void match(char* inputid);

%}


%union {
//	int int_val;
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
%token <str> NUM
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
%type <str> ExprArrayTail
%type <str> ExprList
%type <str> ExprListTail
%type <str> ExprListTail2
%type <str> UnaryOp
%type <str> BinOp
%type <str> Block

%%

Program
	:DeclList{
	}
	;
DeclList
	:DeclList2 DeclList
	|/*empyt*/{}
	;
DeclList2
	:Type ID Decl{/*printf("Main:\n");*/}
	;
Decl
	:VarDecl2
	|FunDecl
	;
VarDecl
	:Type ID VarDecl2
	{	idStack.push_back($2);/*place id into idstack*/
		idNum.push_back(0);/*initialize as zero*/
		/*printf("the ID pushback in vector %s=%d\n",idStack[position],idNum[position]);*/
		position++;
	}
	;
VarDecl2
	:SEMI
	| LCHAV NUM RCHAV SEMI{}
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
	{/*	char str[]="idMain";
		int compare=1;
		compare=strcmp($2,str);
		if(compare==0)
			printf("Main:\n");
		else printf("%s:\n",$2);
	*/
	 }
	;
ParamDecl2
	:LCHAV RCHAV
	|/*empty*/{}
	;
Block
	:LBRAC VarDeclList StmtList RBRAC
	;
Type
	:INT	{/*printf("%s",$$);$$=$1;printf("%s",$$);*/}
	|CHAR	{/*printf("%s",$$);$$=$1;printf("%s",$$);*/}
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
	|RETURN Expr SEMI{
		printf("	li $v0, 10\n	syscall\n");
	}
	|BREAK SEMI
	|IF LPARE Expr RPARE Stmt ELSE Stmt
	|WHILE LPARE Expr RPARE Stmt
	|Block
	|PRINT ID SEMI
	{
		match($2);
		int temp_num=idNum[match_pos];
		printf("	move $a0,$t%d\n	li $v0,1\n	syscall\n",temp_num);
	} 
	|READ ID SEMI
	{
		/*printf("%s    ",$1);*/
		/*if(strcmp($1,"print")==0) printf("print"); else printf("hihihi");*/
		match($2);
		printf("	li $v0,5\n	syscall\n");/*read in the user input,and store it in the $v0*/
		printf("	move $t%d, $v0\n",match_pos);
	}
	;
Expr
	:UnaryOp Expr
	|NUM{}	
	|NUM BinOp Expr{
		/*printf("%s%s%s",$1,$2,$3);*/
	}
	|LPARE Expr RPARE
	|LPARE Expr RPARE BinOp Expr
	|ID /*empty*/{}
	|ID BinOp Expr{
		if(strcmp($2,"+")==0){
			match($1);
			int i=match_pos;
			temp_result=0;
			temp_result=idNum[match_pos]+atoi($3);
			printf("	add $v0, $t%d, %s\n",i,$3);
		}else if(strcmp($2,"-")==0){
                        match($1);
                        int i=match_pos;
			temp_result=0;
                        temp_result=idNum[match_pos]-atoi($3);
                        printf("        sub $v0, $t%d, %s\n",i,$3);
		}else if(strcmp($2,"*")==0){
                        match($1);
                        int i=match_pos;
			temp_result=0;
                        temp_result=idNum[match_pos]*atoi($3);
                        printf("        mul $v0, $t%d, %s\n",i,$3);
		}else if(strcmp($2,"/")==0){
                        match($1);
                        int i=match_pos;
			temp_result=0;
                        temp_result=idNum[match_pos]/atoi($3);
                        printf("        div $v0, $t%d, %s\n",i,$3);
		}	
	}
	|ID LPARE ExprList RPARE
	|ID LPARE ExprList RPARE BinOp Expr
	|ID LCHAV Expr RCHAV ExprArrayTail
	|ID ASSIGN Expr{
		match($1);
		int i=match_pos;
		idNum[match_pos]=temp_result;
		printf("	move $t%d, $v0\n",idNum[i]);
	}
	;
ExprArrayTail
	:BinOp Expr
	|/*empty*/{}
	|ASSIGN Expr{}
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
	:PLUS{$$=$1;}
	|MINUS{$$=$1;}
	|MUL{$$=$1;}
	|DIV{$$=$1;}
	|EQUAL{$$=$1;}
	|NOTEQ{$$=$1;}
	|SMALL{$$=$1;}
	|SMAEQ{$$=$1;}
	|BIG{$$=$1;}
	|BIGEQ{$$=$1;}
	|AND{$$=$1;}
	|OR{$$=$1;}
	;
%%
#include <stdio.h>

void yyerror(const char *msg){
	printf("Line %d:error: %s\n", yylineno, msg);
}

void match (char* inputid){
	/*
	printf("match1	%s",inputid);
	printf("match2	%s",idStack[1]);
	*/
	for (int i=0;i<=1;i++){
		if(strcmp(inputid,idStack[i])==0){
			match_pos=i;
			/*printf("the same %s,%s",inputid,idStack[i]);*/
		}
	}
}


int yywrap(){return 1;}

int main(int argc,char **argv){
	printf("	.text\n");
	printf("	.globl Main\n");
	printf("Main:\n");
	return yyparse();
}


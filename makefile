Main:lexer parser
	
lexer:lexer.l
	flex lexer.l
	gcc lex.yy.c -ll

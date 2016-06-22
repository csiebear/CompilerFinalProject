Based on the Token Format we know the set of the token should be identified.
I used the lexer_test.l for checking the definition of token is true of flase.
And then we can go forward to the next step.

The second step is reading the grammar(in the file named grammar.txt) specification,
classifying the nonterminal symbols and terminal symbols.
After doing that,we can get the following conclusion.

The start symbol is "Program".
Terminals:
	epsilon
	id
	num
	int
	char
	return
	break
	if else
	while
	print
	read
	- ! (the unary operator)
	+ - * / == != < <= > >= && || (the binary operator)
	[ ] ( )
Nonterminals:
	Program
	DeclList
	DeclList'
	Decl
	Type
	VarDecl
	VarDecl'
	FunDecl
	ParamDecl
	Block
	VarDeclList...and so on

Now we should modify the lexer based on the terminals definition.

The file name lexer_test2.l is used to test the lexer is correct or not.
(flex lexer_test2.l	g++ lex.yy.c -ll	./a.out <test.c >lexerresult

In the parser, I just process the simple arithmetic and the I/O(READ/PRINT).
I use the $t0 and $t7 to store the variable, so if we declare to many variable may error(modify later).
I arithemetic use the $v0 for store the temporary result,if assign the result will store.


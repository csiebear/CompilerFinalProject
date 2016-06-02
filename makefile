y.tab.c y.tab.h:cfgs.y
	bison -dy -v cfgs.y
lex.yy.c: lexer.l y.tab.h
	flex -l lexer.l
	gcc -c lex.yy.c
compiler:y.tab.c y.tab.h lex.yy.c
	gcc -o compiler y.tab.c lex.yy.c -lm -ll

clean:
	rm *.o

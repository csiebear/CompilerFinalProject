/*

The Lex structure

definition ＆rules ＆user code



definition

%%//separate by this

rules

%%

user code



*/

%{

        int num_line=1;

%}

Keywords int|char|return|if|else|while|break|print|read

Number [0-9]+

Idold [a-zA-Z_][a-zA-Z0-9_]*

Identifier (id)[A-Z][a-z]*

Operators \=|\!|\+|\-|\*|\/|\==|\!=|\<|\>|\<=|\>=|\"&&"|\"||"

Special \{|\}|\(|\)|\;|\,|\[|\]

Error [~] 

%%

\n {
	num_line++;
        printf("Line %d\n",num_line);
}

{Keywords} {

        printf("	<Keyword>               %s\n",yytext);

}



{Number} {

        printf("	<Number>                %s\n",yytext );

}

{Identifier} {

        printf("	<Identifier>            %s\n",yytext);

}

{Operators} {

        printf("	<Operator>              %s\n",yytext);

}

{Special} {

        printf("	<Special Symbol>        %s\n",yytext);

}

{Error} {

        printf("	<Error>                 %s\n",yytext);

}

%%

main()

{

        printf("Line 1\n");

        yylex();

        return 0;

}


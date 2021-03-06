/* A Bison parser, made by GNU Bison 3.0.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2013 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    ID = 258,
    EQUAL = 259,
    NOTEQ = 260,
    BIG = 261,
    BIGEQ = 262,
    SMALL = 263,
    SMAEQ = 264,
    AND = 265,
    OR = 266,
    INT = 267,
    CHAR = 268,
    RETURN = 269,
    BREAK = 270,
    WHILE = 271,
    IF = 272,
    ELSE = 273,
    PRINT = 274,
    READ = 275,
    NUM = 276,
    ASSIGN = 277,
    NOT = 278,
    PLUS = 279,
    MINUS = 280,
    MUL = 281,
    DIV = 282,
    LPARE = 283,
    RPARE = 284,
    LCHAV = 285,
    RCHAV = 286,
    LBRAC = 287,
    RBRAC = 288,
    COMMA = 289,
    DOT = 290,
    SEMI = 291
  };
#endif
/* Tokens.  */
#define ID 258
#define EQUAL 259
#define NOTEQ 260
#define BIG 261
#define BIGEQ 262
#define SMALL 263
#define SMAEQ 264
#define AND 265
#define OR 266
#define INT 267
#define CHAR 268
#define RETURN 269
#define BREAK 270
#define WHILE 271
#define IF 272
#define ELSE 273
#define PRINT 274
#define READ 275
#define NUM 276
#define ASSIGN 277
#define NOT 278
#define PLUS 279
#define MINUS 280
#define MUL 281
#define DIV 282
#define LPARE 283
#define RPARE 284
#define LCHAV 285
#define RCHAV 286
#define LBRAC 287
#define RBRAC 288
#define COMMA 289
#define DOT 290
#define SEMI 291

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE YYSTYPE;
union YYSTYPE
{
#line 21 "cfgs.y" /* yacc.c:1909  */

//	int int_val;
	char *str;

#line 131 "y.tab.h" /* yacc.c:1909  */
};
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */

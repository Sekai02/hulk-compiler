/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

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

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     FUNCTION = 258,
     FOR = 259,
     WHILE = 260,
     TYPE = 261,
     INHERITS = 262,
     NEW = 263,
     LET = 264,
     IN = 265,
     IF = 266,
     ELIF = 267,
     ELSE = 268,
     TRUE = 269,
     FALSE = 270,
     PI = 271,
     E = 272,
     ASSIGN = 273,
     PLUS = 274,
     MINUS = 275,
     TIMES = 276,
     DIVIDE = 277,
     POWER = 278,
     POW = 279,
     CONCAT = 280,
     DCONCAT = 281,
     EQ = 282,
     NEQ = 283,
     LT = 284,
     GT = 285,
     LEQ = 286,
     GEQ = 287,
     AND = 288,
     OR = 289,
     NOT = 290,
     D_ASSIGN = 291,
     ARROW = 292,
     SEMICOLON = 293,
     COMMA = 294,
     LPAREN = 295,
     RPAREN = 296,
     LBRACE = 297,
     RBRACE = 298,
     IDENTIFIER = 299,
     STRING_LIT = 300,
     NUMBER = 301
   };
#endif
/* Tokens.  */
#define FUNCTION 258
#define FOR 259
#define WHILE 260
#define TYPE 261
#define INHERITS 262
#define NEW 263
#define LET 264
#define IN 265
#define IF 266
#define ELIF 267
#define ELSE 268
#define TRUE 269
#define FALSE 270
#define PI 271
#define E 272
#define ASSIGN 273
#define PLUS 274
#define MINUS 275
#define TIMES 276
#define DIVIDE 277
#define POWER 278
#define POW 279
#define CONCAT 280
#define DCONCAT 281
#define EQ 282
#define NEQ 283
#define LT 284
#define GT 285
#define LEQ 286
#define GEQ 287
#define AND 288
#define OR 289
#define NOT 290
#define D_ASSIGN 291
#define ARROW 292
#define SEMICOLON 293
#define COMMA 294
#define LPAREN 295
#define RPAREN 296
#define LBRACE 297
#define RBRACE 298
#define IDENTIFIER 299
#define STRING_LIT 300
#define NUMBER 301




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 13 "src/parser.y"
{
    char* str_val;
    double num_val;
}
/* Line 1529 of yacc.c.  */
#line 146 "build/parser.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;


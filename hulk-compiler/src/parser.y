%{
#include <iostream>
#include <cstdio>
#include "../include/tokens.hh"
using namespace std;

extern int yylex();
extern int yyparse();
extern FILE* yyin;
void yyerror(const char* s);
%}

%union {
    char* str_val;
    double num_val;
}

%token FUNCTION FOR WHILE TYPE INHERITS NEW LET IN
%token IF ELIF ELSE TRUE FALSE PI E
%token ASSIGN PLUS MINUS TIMES DIVIDE POWER POW
%token CONCAT DCONCAT EQ NEQ LT GT LEQ GEQ AND OR NOT
%token D_ASSIGN ARROW SEMICOLON COMMA
%token LPAREN RPAREN LBRACE RBRACE
%token <str_val> IDENTIFIER STRING_LIT
%token <num_val> NUMBER

%start program

%%

program:
    /* empty */
    | program statement
;

statement:
    expression SEMICOLON
    | declaration SEMICOLON
    | control_structure
    | function_decl
    | type_decl
;

expression:
    IDENTIFIER ASSIGN expression
    | expression PLUS expression
    | expression MINUS expression
    | expression TIMES expression
    | expression DIVIDE expression
    | expression POWER expression
    | expression POW expression
    | expression CONCAT expression
    | expression DCONCAT expression
    | expression EQ expression
    | expression NEQ expression
    | expression LT expression
    | expression GT expression
    | expression LEQ expression
    | expression GEQ expression
    | expression AND expression
    | expression OR expression
    | NOT expression
    | LPAREN expression RPAREN
    | NUMBER
    | STRING_LIT
    | IDENTIFIER
    | function_call
;

function_call:
    IDENTIFIER LPAREN arguments RPAREN
;

arguments:
    /* empty */
    | expression
    | arguments COMMA expression
;

declaration:
    LET IDENTIFIER ASSIGN expression
;

control_structure:
    if_statement
    | for_loop
    | while_loop
;

if_statement:
    IF LPAREN expression RPAREN LBRACE program RBRACE
    | IF LPAREN expression RPAREN LBRACE program RBRACE ELSE LBRACE program RBRACE
    | IF LPAREN expression RPAREN LBRACE program RBRACE elif_clauses ELSE LBRACE program RBRACE
;

elif_clauses:
    ELIF LPAREN expression RPAREN LBRACE program RBRACE
    | elif_clauses ELIF LPAREN expression RPAREN LBRACE program RBRACE
;

for_loop:
    FOR LPAREN declaration SEMICOLON expression SEMICOLON expression RPAREN LBRACE program RBRACE
;

while_loop:
    WHILE LPAREN expression RPAREN LBRACE program RBRACE
;

function_decl:
    FUNCTION IDENTIFIER LPAREN parameters RPAREN LBRACE program RBRACE
;

parameters:
    /* empty */
    | IDENTIFIER
    | parameters COMMA IDENTIFIER
;

type_decl:
    TYPE IDENTIFIER LBRACE members RBRACE
    | TYPE IDENTIFIER INHERITS IDENTIFIER LBRACE members RBRACE
;

members:
    /* empty */
    | members declaration SEMICOLON
;

%%

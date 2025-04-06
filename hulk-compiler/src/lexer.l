%{
#include <iostream>
#include "parser.tab.h"
#include "../include/tokens.hh"
using namespace std;
%}

%option c++
%option noyywrap

DIGIT     [0-9]
LETTER    [a-zA-Z]
ID        {LETTER}({LETTER}|{DIGIT}|_)*
NUMBER    ({DIGIT}+(\.{DIGIT}*)?)|(\.{DIGIT}+)
STRING    \"([^"\\]|\\.)*\"
COMMENT   #.*\n
WS        [ \t\n]

%%

"function"      { cout << "FUNCTION" << endl; return token_FUNCTION; }
"for"           { cout << "FOR" << endl; return token_FOR; }
"while"         { cout << "WHILE" << endl; return token_WHILE; }
"type"          { cout << "TYPE" << endl; return token_TYPE; }
"inherits"      { cout << "INHERITS" << endl; return token_INHERITS; }
"new"           { cout << "NEW" << endl; return token_NEW; }
"let"           { cout << "LET" << endl; return token_LET; }
"in"            { cout << "IN" << endl; return token_IN; }
"if"            { cout << "IF" << endl; return token_IF; }
"elif"          { cout << "ELIF" << endl; return token_ELIF; }
"else"          { cout << "ELSE" << endl; return token_ELSE; }
"true"          { cout << "TRUE" << endl; return token_TRUE; }
"false"         { cout << "FALSE" << endl; return token_FALSE; }
"PI"            { cout << "PI" << endl; return token_PI; }
"E"             { cout << "E" << endl; return token_E; }

"="             { cout << "ASSIGN" << endl; return token_ASSIGN; }
"+"             { cout << "PLUS" << endl; return token_PLUS; }
"-"             { cout << "MINUS" << endl; return token_MINUS; }
"*"             { cout << "TIMES" << endl; return token_TIMES; }
"/"             { cout << "DIVIDE" << endl; return token_DIVIDE; }
"**"            { cout << "POWER" << endl; return token_POWER; }
"^"             { cout << "POW" << endl; return token_POW; }
"@"             { cout << "CONCAT" << endl; return token_CONCAT; }
"@@"            { cout << "DCONCAT" << endl; return token_DCONCAT; }
"=="            { cout << "EQ" << endl; return token_EQ; }
"!="            { cout << "NEQ" << endl; return token_NEQ; }
"<"             { cout << "LT" << endl; return token_LT; }
">"             { cout << "GT" << endl; return token_GT; }
"<="            { cout << "LEQ" << endl; return token_LEQ; }
">="            { cout << "GEQ" << endl; return token_GEQ; }
"&"             { cout << "AND" << endl; return token_AND; }
"|"             { cout << "OR" << endl; return token_OR; }
"!"             { cout << "NOT" << endl; return token_NOT; }
":="            { cout << "D_ASSIGN" << endl; return token_D_ASSIGN; }
"=>"            { cout << "ARROW" << endl; return token_ARROW; }

";"             { cout << "SEMICOLON" << endl; return token_SEMICOLON; }
","             { cout << "COMMA" << endl; return token_COMMA; }
"("             { cout << "LPAREN" << endl; return token_LPAREN; }
")"             { cout << "RPAREN" << endl; return token_RPAREN; }
"{"             { cout << "LBRACE" << endl; return token_LBRACE; }
"}"             { cout << "RBRACE" << endl; return token_RBRACE; }

{ID}            { cout << "IDENTIFIER: " << yytext << endl; return token_IDENTIFIER; }
{NUMBER}        { cout << "NUMBER: " << yytext << endl; return token_NUMBER; }
{STRING}        { cout << "STRING_LIT: " << yytext << endl; return token_STRING_LIT; }
{COMMENT}       { /* Skip comments */ }
{WS}            { /* Skip whitespace */ }

.         { cerr << "Invalid token: " << yytext << endl; exit(1); }

<<EOF>>   { return 0; }

%%

int main() {
    yyFlexLexer lexer;
    lexer.set_debug(1);
    while (lexer.yylex() != 0) {}
    cout << "END_OF_FILE" << endl;
    return 0;
}

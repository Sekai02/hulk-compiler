%{
#include <iostream>
using namespace std;

enum Token {
    NUMBER = 1,
    PLUS,
    MINUS,
    MULTIPLY,
    DIVIDE,
    LPAREN,
    RPAREN,
    END_OF_FILE
};

%}

%option c++
%option noyywrap

DIGIT     [0-9]
NUMBER    ({DIGIT}+(\.{DIGIT}*)?)|(\.{DIGIT}+)
WS        [ \t\n]

%%

{NUMBER}  { cout << "NUMBER: " << yytext << endl; return NUMBER; }
"+"       { cout << "PLUS" << endl; return PLUS; }
"-"       { cout << "MINUS" << endl; return MINUS; }
"*"       { cout << "MULTIPLY" << endl; return MULTIPLY; }
"/"       { cout << "DIVIDE" << endl; return DIVIDE; }
"("       { cout << "LPAREN" << endl; return LPAREN; }
")"       { cout << "RPAREN" << endl; return RPAREN; }
{WS}      { /* Skip whitespace */ }
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
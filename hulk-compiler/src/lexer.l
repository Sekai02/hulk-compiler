%{
#include <iostream>
using namespace std;

enum Token {
    FUNCTION = 1,
    FOR,
    WHILE,
    TYPE,
    INHERITS,
    NEW,
    LET,
    IN,
    IF,
    ELIF,
    ELSE,
    TRUE,
    FALSE,
    PI,
    E,
    PLUS,
    MINUS,
    TIMES,
    DIVIDE,
    POWER,
    POW,
    CONCAT,
    DCONCAT,
    EQ,
    NEQ,
    LT,
    GT,
    LEQ,
    GEQ,
    AND,
    OR,
    NOT,
    ASSIGN,
    ARROW,
    SEMICOLON,
    COMMA,
    LPAREN,
    RPAREN,
    LBRACE,
    RBRACE,
    IDENTIFIER,
    NUMBER,
    STRING_LIT,
    END_OF_FILE
};

%}

%option c++
%option noyywrap
%option debug

DIGIT     [0-9]
LETTER    [a-zA-Z]
ID        {LETTER}({LETTER}|{DIGIT}|_)*
NUMBER    ({DIGIT}+(\.{DIGIT}*)?)|(\.{DIGIT}+)
STRING    \"([^"\\]|\\.)*\"
COMMENT   #.*\n
WS        [ \t\n]

%%

"function"      { cout << "FUNCTION" << endl; return FUNCTION; }
"for"           { cout << "FOR" << endl; return FOR; }
"while"         { cout << "WHILE" << endl; return WHILE; }
"type"          { cout << "TYPE" << endl; return TYPE; }
"inherits"      { cout << "INHERITS" << endl; return INHERITS; }
"new"           { cout << "NEW" << endl; return NEW; }
"let"           { cout << "LET" << endl; return LET; }
"in"            { cout << "IN" << endl; return IN; }
"if"            { cout << "IF" << endl; return IF; }
"elif"          { cout << "ELIF" << endl; return ELIF; }
"else"          { cout << "ELSE" << endl; return ELSE; }
"true"          { cout << "TRUE" << endl; return TRUE; }
"false"         { cout << "FALSE" << endl; return FALSE; }
"PI"            { cout << "PI" << endl; return PI; }
"E"             { cout << "E" << endl; return E; }

"+"             { cout << "PLUS" << endl; return PLUS; }
"-"             { cout << "MINUS" << endl; return MINUS; }
"*"             { cout << "TIMES" << endl; return TIMES; }
"/"             { cout << "DIVIDE" << endl; return DIVIDE; }
"**"            { cout << "POWER" << endl; return POWER; }
"^"             { cout << "POW" << endl; return POW; }
"@"             { cout << "CONCAT" << endl; return CONCAT; }
"@@"            { cout << "DCONCAT" << endl; return DCONCAT; }
"=="            { cout << "EQ" << endl; return EQ; }
"!="            { cout << "NEQ" << endl; return NEQ; }
"<"             { cout << "LT" << endl; return LT; }
">"             { cout << "GT" << endl; return GT; }
"<="            { cout << "LEQ" << endl; return LEQ; }
">="            { cout << "GEQ" << endl; return GEQ; }
"&"             { cout << "AND" << endl; return AND; }
"|"             { cout << "OR" << endl; return OR; }
"!"             { cout << "NOT" << endl; return NOT; }
":="            { cout << "ASSIGN" << endl; return ASSIGN; }
"=>"            { cout << "ARROW" << endl; return ARROW; }

";"             { cout << "SEMICOLON" << endl; return SEMICOLON; }
","             { cout << "COMMA" << endl; return COMMA; }
"("             { cout << "LPAREN" << endl; return LPAREN; }
")"             { cout << "RPAREN" << endl; return RPAREN; }
"{"             { cout << "LBRACE" << endl; return LBRACE; }
"}"             { cout << "RBRACE" << endl; return RBRACE; }

{ID}            { cout << "IDENTIFIER: " << yytext << endl; return IDENTIFIER; }
{NUMBER}        { cout << "NUMBER: " << yytext << endl; return NUMBER; }
{STRING}        { cout << "STRING_LIT: " << yytext << endl; return STRING_LIT; }
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

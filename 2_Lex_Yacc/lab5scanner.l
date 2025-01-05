%{
#include "lab5parser.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

%}

ID [_a-zA-Z][_a-zA-Z0-9]*
CONSTANT [0-9]+
FLOAT -?[0-9]*\.?[0-9]+([eE]-?[0-9]+)?
STRING \"[^\"]*\"
WHITESPACE [ \t]+
NEWLINE \n


%%
"#"                 { printf("Line %d: Token: HASH, Text: %s\n", yylineno, yytext); return HASH; }
"include"           { printf("Line %d: Token: INCLUDE, Text: %s\n", yylineno, yytext); return INCLUDE; }
"stdio.h"           { printf("Line %d: Token: STDIOH, Text: %s\n", yylineno, yytext); return STDIOH; }
"stdlib.h"          { printf("Line %d: Token: STDLIB, Text: %s\n", yylineno, yytext); return STDLIB; }
"using"             { printf("Line %d: Token: USING, Text: %s\n", yylineno, yytext); return USING; }
"namespace"         { printf("Line %d: Token: NAMESPACE, Text: %s\n", yylineno, yytext); return NAMESPACE; }
"int"               { printf("Line %d: Token: INT, Text: %s\n", yylineno, yytext); return INT; }
"float"             { printf("Line %d: Token: FLOAT, Text: %s\n", yylineno, yytext); return FLOAT; }
"main"              { printf("Line %d: Token: MAIN, Text: %s\n", yylineno, yytext); return MAIN; }
"struct"            { printf("Line %d: Token: STRUCT, Text: %s\n", yylineno, yytext); return STRUCT; }
"if"                { printf("Line %d: Token: IF, Text: %s\n", yylineno, yytext); return IF; }
"else"              { printf("Line %d: Token: ELSE, Text: %s\n", yylineno, yytext); return ELSE; }
"while"             { printf("Line %d: Token: WHILE, Text: %s\n", yylineno, yytext); return WHILE; }
"cin"               { printf("Line %d: Token: CIN, Text: %s\n", yylineno, yytext); return CIN; }
"cout"              { printf("Line %d: Token: COUT, Text: %s\n", yylineno, yytext); return COUT; }
"return"            { printf("Line %d: Token: RETURN, Text: %s\n", yylineno, yytext); return RETURN; }
"true"              { printf("Line %d: Token: TRUE, Text: %s\n", yylineno, yytext); return TRUE; }
"false"             { printf("Line %d: Token: FALSE, Text: %s\n", yylineno, yytext); return FALSE; }
"std"               { printf("Line %d: Token: STD, Text: %s\n", yylineno, yytext); return STD; }

">>"                { printf("Line %d: Token: RARROWS, Text: %s\n", yylineno, yytext); return RARROWS; }
"<<"                { printf("Line %d: Token: LARROWS, Text: %s\n", yylineno, yytext); return LARROWS; }
"<="                { printf("Line %d: Token: LE, Text: %s\n", yylineno, yytext); return LE; }
">="                { printf("Line %d: Token: GE, Text: %s\n", yylineno, yytext); return GE; }
"=="                { printf("Line %d: Token: EQ, Text: %s\n", yylineno, yytext); return EQ; }
"!="                { printf("Line %d: Token: NEQ, Text: %s\n", yylineno, yytext); return NEQ; }
"<"                 { printf("Line %d: Token: LT, Text: %s\n", yylineno, yytext); return LT; }
">"                 { printf("Line %d: Token: GT, Text: %s\n", yylineno, yytext); return GT; }
"+"                 { printf("Line %d: Token: PLUS, Text: %s\n", yylineno, yytext); return PLUS; }
"-"                 { printf("Line %d: Token: MINUS, Text: %s\n", yylineno, yytext); return MINUS; }
"*"                 { printf("Line %d: Token: TIMES, Text: %s\n", yylineno, yytext); return TIMES; }
"/"                 { printf("Line %d: Token: DIVIDE, Text: %s\n", yylineno, yytext); return DIVIDE; }
"="                 { printf("Line %d: Token: ASSIGN, Text: %s\n", yylineno, yytext); return ASSIGN; }

"{"                 { printf("Line %d: Token: LBRACE, Text: %s\n", yylineno, yytext); return LBRACE; }
"}"                 { printf("Line %d: Token: RBRACE, Text: %s\n", yylineno, yytext); return RBRACE; }
";"                 { printf("Line %d: Token: SEMICOLON, Text: %s\n", yylineno, yytext); return SEMICOLON; }
"("                 { printf("Line %d: Token: LPAREN, Text: %s\n", yylineno, yytext); return LPAREN; }
")"                 { printf("Line %d: Token: RPAREN, Text: %s\n", yylineno, yytext); return RPAREN; }
","                 { printf("Line %d: Token: COMMA, Text: %s\n", yylineno, yytext); return COMMA; }
"."                 { printf("Line %d: Token: DOT, Text: %s\n", yylineno, yytext); return DOT; }

{ID}                { printf("Line %d: Token: ID, Text: %s\n", yylineno, yytext); return ID; }
{CONSTANT}          { printf("Line %d: Token: CONSTANT, Text: %s\n", yylineno, yytext); return CONSTANT; }
{FLOAT}             { printf("Line %d: Token: FLOAT, Text: %s\n", yylineno, yytext); return FLOAT; }
{STRING}            { printf("Line %d: Token: STRING, Text: %s\n", yylineno, yytext); return STRING; }

{WHITESPACE}        { /* Ignore whitespace */ }
{NEWLINE}           { yylineno++; }

"//".*              { /* Ignore single-line comments */ }
"/*"[^*]*"*/"       { /* Ignore multi-line comments */ }
.                   { /* Ignore all other characters */ }
%%

int yywrap() { return 1; }
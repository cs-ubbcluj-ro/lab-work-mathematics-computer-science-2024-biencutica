%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);

int production = 0;
void incr_production() { production++; }
%}

//TOKENS

%token HASH INCLUDE STDLIB STDIOH VOID USING NAMESPACE STD TRUE FALSE STRUCT INT MAIN IF WHILE CIN COUT RETURN ELSE
%token ID CONSTANT FLOAT STRING WHITESPACE NEWLINE
%token LE GE LT GT ASSIGN EQ NEQ
%token LBRACE RBRACE SEMICOLON LPAREN RPAREN COMMA DOT LARROWS RARROWS

%left PLUS MINUS
%left TIMES DIVIDE

//GRAMMAR RULES

%%
program:
    headers USING NAMESPACE STD SEMICOLON before_main main_function
    { 
        incr_production();
        printf("Production index: %d\n", production);
    }
;

headers:
    HASH INCLUDE LT library GT
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
;

library:
    STDIOH
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
    | STDLIB
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
;

before_main:
    /* empty */
    | before_main before_main_construct
    { 
        incr_production();
        printf("Production index: %d\n", production);
    }
;



before_main_construct:
    structdecl
    { 
        incr_production();
        printf("Production index: %d\n", production);
    }
;

structdecl:
    STRUCT ID LBRACE structmemberdecls RBRACE SEMICOLON
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
;

structmemberdecls:
    structdeclaration
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
    | structdeclaration structmemberdecls
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
;

structdeclaration:
    type_specifier structidentifier_list SEMICOLON
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
;

type_specifier:
    INT
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
    | FLOAT
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
    | VOID
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
;

structidentifier_list:
    ID
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
    | ID COMMA structidentifier_list
    { 
        incr_production();
        printf("Production index: %d\n", production);
    }
;

main_function:
    INT MAIN LPAREN RPAREN LBRACE declarations stmt_list returnstmt RBRACE
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
;

declarations:
    declaration
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
    | declaration declarations
    { 
        incr_production();
        printf("Production index: %d\n", production);
    }
;

declaration:
    type_specifier identifier_list SEMICOLON
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
;

identifier_list:
    ID
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
    | ID COMMA identifier_list
    { 
        incr_production();
        printf("Production index: %d\n", production);
    }
;

stmt_list:
    stmt_list stmt
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
    | /* empty */
;

stmt:
    assignstmt SEMICOLON
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
    | iostmt SEMICOLON
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
    | compoundstmt 
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
    | returnstmt
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
;

returnstmt:
    RETURN expression SEMICOLON
    {
        incr_production();
        printf("Production index: %d\n", production);
    }
;


assignstmt:
    ID ASSIGN expression
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
    | ID DOT ID ASSIGN expression
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
;

expression:
    expression PLUS term
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
    | expression MINUS term
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
    | term
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
;

term:
    term TIMES factor
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
    | term DIVIDE factor
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
    | factor
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
;

factor:
    LPAREN expression RPAREN
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
    | ID
    | FLOAT
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
    | CONSTANT
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
;

iostmt:
    CIN RARROWS ID
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
    | COUT LARROWS expression
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
;

compoundstmt:
    ifstmt
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
    | whilestmt
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
;

ifstmt:
    IF LPAREN condition RPAREN LBRACE stmt_list RBRACE
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
    | IF LPAREN condition RPAREN LBRACE stmt_list RBRACE ELSE LBRACE stmt_list RBRACE
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
;

whilestmt:
    WHILE LPAREN condition RPAREN LBRACE stmt_list RBRACE
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
;

condition:
    expression RELATION expression
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
;

RELATION:
    LT
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
    | LE
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
    | EQ
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
    | NEQ
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
    | GE
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
    | GT
    { 
        incr_production();
        printf("Production index: %d\n", production); 
    }
;

%%

void yyerror(const char *s) {
    extern int yylineno;
    fprintf(stderr, "Error: %s at production %d, line %d\n", s, production, yylineno);
}

int main() {
    if (yyparse() == 0) {
        printf("Program syntactic correct.\n");
    }
    return 0;
}

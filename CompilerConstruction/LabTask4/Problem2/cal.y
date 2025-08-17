%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *s);
int yylex(void);
%}

%union {
    int ival;
    char *sval;
}

%token <ival> INT_NUM
%token <sval> ID

%token INT FLOAT IF ELSE WHILE FOR PRINT
%token ASSIGN ADD SUB MUL DIV
%token EQ NEQ LT GT LE GE
%token LPAREN RPAREN LBRACE RBRACE COMMA SEMI

%type <ival> expr

%start program

%%

program:
    stmts
    ;

stmts:
    stmts stmt
    | stmt
    ;

stmt:
      decl_stmt
    | assign_stmt
    | print_stmt
    | if_stmt
    | while_stmt
    | for_stmt
    | block
    ;

decl_stmt:
      type ID SEMI
    | type ID ASSIGN expr SEMI
    ;

type:
    INT
    | FLOAT
    ;

assign_stmt:
    ID ASSIGN expr SEMI
    ;

print_stmt:
    PRINT LPAREN ID RPAREN SEMI
    ;

if_stmt:
    IF LPAREN expr RPAREN stmt
    | IF LPAREN expr RPAREN stmt ELSE stmt
    ;

while_stmt:
    WHILE LPAREN expr RPAREN stmt
    ;

for_stmt:
    FOR LPAREN assign_stmt expr SEMI assign_stmt RPAREN stmt
    ;

block:
    LBRACE stmts RBRACE
    ;

expr:
      expr ADD expr
    | expr SUB expr
    | expr MUL expr
    | expr DIV expr
    | expr EQ expr
    | expr NEQ expr
    | expr LT expr
    | expr GT expr
    | expr LE expr
    | expr GE expr
    | LPAREN expr RPAREN
    | ID
    | INT_NUM
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Syntax error: %s\n", s);
}

int main(void) {
    return yyparse();
}

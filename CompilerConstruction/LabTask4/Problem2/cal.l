%option noyywrap

%{
#include "cal.tab.h"
#include <stdlib.h>
#include <string.h>
%}

digit   [0-9]+
id      [a-zA-Z_][a-zA-Z0-9_]*

%%

[ \t\n]                     ;
"int"                       return INT;
"float"                     return FLOAT;
"if"                        return IF;
"else"                      return ELSE;
"while"                     return WHILE;
"for"                       return FOR;
"print"                     return PRINT;

"=="                        return EQ;
"!="                        return NEQ;
"<="                        return LE;
">="                        return GE;
"<"                         return LT;
">"                         return GT;

"="                         return ASSIGN;
";"                         return SEMI;
","                         return COMMA;
"("                         return LPAREN;
")"                         return RPAREN;
"{"                         return LBRACE;
"}"                         return RBRACE;
"+"                         return ADD;
"-"                         return SUB;
"*"                         return MUL;
"/"                         return DIV;

{digit}                     { yylval.ival = atoi(yytext); return INT_NUM; }
{id}                        { yylval.sval = strdup(yytext); return ID; }

.                           { return yytext[0]; }

%%

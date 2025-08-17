%option noyywrap main

%{
#include <stdio.h>
%}

digit   [0-9]
letter  [a-zA-Z]
ident   {letter}({letter}|{digit})*

%%

"int"       { printf("%s -> KEYWORD\n", yytext); }
"double"    { printf("%s -> KEYWORD\n", yytext); }
"while"     { printf("%s -> KEYWORD\n", yytext); }
"printf"    { printf("%s -> KEYWORD\n", yytext); }
"return"    { printf("%s -> KEYWORD\n", yytext); }

"+"         { printf("%s -> ADD\n", yytext); }
"="         { printf("%s -> ASSIGN\n", yytext); }
"<"         { printf("%s -> LT\n", yytext); }
"++"        { printf("%s -> INC\n", yytext); }
";"         { printf("%s -> SEMI\n", yytext); }
","         { printf("%s -> COMMA\n", yytext); }
"("         { printf("%s -> LPAREN\n", yytext); }
")"         { printf("%s -> RPAREN\n", yytext); }
"{"         { printf("%s -> LBRACE\n", yytext); }
"}"         { printf("%s -> RBRACE\n", yytext); }

{digit}+(\.{digit}+)?([eE][-+]?{digit}+)?   { printf("%s -> NUMBER\n", yytext); }
\"([^\\\"]|\\.)*\"      { printf("%s -> STRING\n", yytext); }

{ident}     { printf("%s -> ID\n", yytext); }

[ \t\n]+    { /* Ignore whitespace and newlines */ }

.           { printf("%s -> UNKNOWN\n", yytext); }

%%
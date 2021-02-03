/* simplest version of calculator */

%{
#  include <stdio.h>
#define YYDEBUG 1

int yylex();
int yyerror(char *);
%}

/* declare tokens */
%token NUMBER
%token ADD SUB MUL DIV ABS
%token OP CP
%token EOL

%%

calclist: NUMBER

%%

main()
{
  printf("> "); 
  yyparse();
}

yyerror(char *s)
{
  fprintf(stderr, "error: %s\n", s);
}

%option nodefault noyywrap yylineno
%x COMMENT
%{
# include <stdlib.h>
# include "parser.tab.h"
%}

%%

"+"    { return ADD; }
"-"    { return SUB; }
"*"    { return MUL; }
"/"    { return DIV; }
"|"    { return ABS; }
"("    { return OP;  }
")"    { return CP;  }

[0-9]+ { yylval = atoi(yytext); return NUMBER; }
0x[a-f0-9]+ { yylval = strtol(yytext, NULL, 16); printf("input hex num: 0x%x\n", yylval); return NUMBER; }

\n     { return EOL; }
[ \t]  { /* ignore whitespace */ }
"//".*\n { printf("comment1: %s\n", yytext); } /* ignore comment */

"/*"          { BEGIN(COMMENT); }
<COMMENT>"*/" { BEGIN(INITIAL); }
<COMMENT>([^*]|\n)+|. { printf("comment2: %s\n", yytext); }
<COMMENT><<EOF>> { printf("%d: Unterminated comment\n"); return 0; }
.      { printf("Mystery character %c\n", *yytext); }

%%

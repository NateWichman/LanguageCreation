%option noyywrap
%{
  #include <stdio.h>
  #include <stdlib.h>
  #include "lang.tab.h"
	int num_lines = 0;
%}

%%

END {return END;}
\; {return END_STATEMENT;}
POINT {return POINT;}
LINE {return LINE;}
CIRCLE {return CIRCLE;}
RECTANGLE {return RECTANGLE;}
SET_COLOR {return SET_COLOR;}
[0-9]+\.+[0-9]+ { yylval.fval= atoi(yytext); return FLOAT;}
[0-9]+ { yylval.ival = atoi(yytext); return INT;}
[\n\r] {num_lines++;}
[ \t] ; 
[\s] ;
.+ {printf("ERROR, invalid lexeme at line %d\n", num_lines);}

%%

/*int main(int *argc, char **argv){
	return 0;
} */

%{
	#include <stdio.h>
	int yylex();
	int yyerror(char *errmsg){
		printf("%s\n", errmsg);
	}
%}
%union {int ival; float fval;}
%token END
%token END_STATEMENT
%token LINE
%token POINT
%token CIRCLE
%token RECTANGLE
%token SET_COLOR
%token INT
%token FLOAT
%type <ival>INT
%type <ival>FLOAT
%%

program: statement_list END
       ;
statement_list: statement END_STATEMENT
	      | statement END_STATEMENT statement_list
;
statement: LINE INT INT INT INT {printf("Trying to make a line");}
	 | POINT INT INT {printf("Trying to make a point");}
	 | CIRCLE INT INT INT {printf("Trying to make a Circle");}
	 | RECTANGLE INT INT INT INT {printf("Trying to make a Rectangle");}
	 | SET_COLOR INT INT INT {printf("Trying to set the color");}
;

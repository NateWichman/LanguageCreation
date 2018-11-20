%{
	#include <stdio.h>
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
statement: LINE INT INT INT INT
	 | POINT INT INT
	 | CIRCLE INT INT INT
	 | RECTANGLE INT INT INT INT
	 | SET_COLOR INT INT INT
;

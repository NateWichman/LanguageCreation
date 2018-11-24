%{
	#include <stdio.h>
	#include "zoomjoystrong.h"
	int yylex(void);
	void yyerror(const char*);
	int yyparse(void);
%}

%error-verbose

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
statement: LINE INT INT INT INT {printf("Trying to make a line"); line($2, $3, $4, $5);}
	 | POINT INT INT {printf("Trying to make a point");point($2, $3);}
	 | CIRCLE INT INT INT {printf("Trying to make a Circle");circle($2, $3, $4);}
	 | RECTANGLE INT INT INT INT {printf("Trying to make a Rectangle");rectangle($2,$3,$4,$5);}
	 | SET_COLOR INT INT INT {printf("Trying to set the color");set_color($2,$3,$4);}


%%

void yyerror(const char *s){
	printf("yyerror, could not parse:  %s\n", s);
}

int yywrap(void){}

int main(void){
	setup();
	yyparse();
}

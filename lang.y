%{
	#include <stdio.h>
	#include <SDL2/SDL.h>
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
statement: LINE INT INT INT INT {
				 printf("Trying to make a line");
	 			 int valid = 1;
				 printf("SKJDF: %s\n", $2);
				 if($2 > HEIGHT || $2 > WIDTH || $2 < 0){
					valid = 0;
				 }
				 if($3 > HEIGHT || $3 > WIDTH || $3 < 0){
					valid = 0;
				 }
				 if($4 > HEIGHT || $4 > WIDTH || $4 < 0){
					valid = 0;
				 }
				 if($5 > HEIGHT || $5 > WIDTH || $5 < 0){
					valid = 0;
				 }
			         if(valid == 1){
			                line($2, $3, $4, $5);
				 }
				 if(valid == 0){
					printf("INVALID DIMENSIONS");
				 }
			}
	 | POINT INT INT {       
	 			 printf("Trying to make a point");
	 		         int valid = 1;
				 if($2 > HEIGHT || $2 > WIDTH || $2 < 0){
					valid = 0;
				 }
				 if($3 > HEIGHT || $3 > WIDTH || $2 < 0){
					valid = 0;
				 }
			         if(valid == 1){
			                point($2, $3);
				 }
				 if(valid == 0){
					printf("INVALID DIMENSIONS");
				 }
		          }
	 | CIRCLE INT INT INT {
	 			 printf("Trying to make a Circle");
	 			 int valid = 1;
				 if($2 > HEIGHT || $2 > WIDTH || $2 < 0){
					valid = 0;
				 }
				 if($3 > HEIGHT || $3 > WIDTH || $3 < 0){
					valid = 0;
				 }
				 if($4 > HEIGHT || $4 > WIDTH || $4 < 0){
					valid = 0;
				 }
				 if(valid == 1){
			                circle($2, $3, $4);
				 }
				 if(valid == 0){
					printf("INVALID DIMENSIONS");
				 }
			       }
	 | RECTANGLE INT INT INT INT {
	 			 printf("Trying to make a Rectangle");
	 			 int valid = 1;
				 if($2 > HEIGHT || $2 > WIDTH || $2 < 0){
					valid = 0;
				 }
				 if($3 > HEIGHT || $3 > WIDTH || $3 < 0){
					valid = 0;
				 }
				 if($4 > HEIGHT || $4 > WIDTH || $4 < 0){
					valid = 0;
				 }
				 if($5 > HEIGHT || $5 > WIDTH || $5 < 0){
					valid = 0;
				 }
				 if(valid == 1){
			                rectangle($2,$3,$4,$5);
				 }
				 if(valid == 0){
					printf("INVALID DIMENSIONS");
				 }
			}
	 | SET_COLOR INT INT INT {
	 			 printf("Trying to set the color");
	 			 int valid = 1;
	 			 if($2 > 255 || $2 < 0){
				 	valid = 0;
				 }
				 if($3 > 255 || $3 < 0){
					valid = 0;
				 }
				 if($4 > 255 || $4 < 0){
					valid = 0;
				 }if(valid == 1){
			                set_color($2,$3,$4);
				 }
				 if(valid == 0){
					printf("INVALID DIMENSIONS");
				 }
			}


%%

void yyerror(const char *s){
	printf("yyerror, could not parse:  %s\n", s);
}

int yywrap(void){}

int main(void){
	setup();
	yyparse();
}

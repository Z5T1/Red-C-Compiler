/* Example Scanner */

 /* General Identifiers */
DIGIT		"-"?[0-9]
ID		[a-zA-Z_][a-zA-Z0-9_]*
OPERATOR	"++"|"--"|"+"|"-"|"*"|"/"|"%"|"&"|"|"|"!"|"="|"+="|"-="|"*="|"/="|"%="|"&="|"|="|"!="
COMPARATOR	"=="|"!="|"<"|"<="|">"|">="
BLOCK		"("|")"|"{"|"}"|"["|"]"|";"|","
POINTER		"$"|"@"

 /* Reserved Words */
TYPE		"static"|"int"|"void"|"register"
CONTROL		"if"|"else"|"while"|"return"

%%

 /* Comments */
"//".*\n	/* Online Comment */

"/*"(.|\n)*"*/"	/* Block Comment */

 /* Reserved Words */
{TYPE}		printf("TYPE %s\n", yytext);

{CONTROL}	printf("CONTROL %s\n", yytext);

 /* General Identifiers */ 
{DIGIT}+	printf("int %i\n", atoi(yytext));

{ID}		printf("identifier %s\n", yytext);

{OPERATOR}	printf("operator %s\n", yytext);

{COMPARATOR}	printf("comparator %s\n", yytext);

{BLOCK}		printf("block %s\n", yytext);

{POINTER}	printf("pointer %s\n", yytext);

[ \t\n]		/* Whitespace */


%%

int main(int argc, char** argv) {
	if (argc > 0) {
		yyin = fopen(argv[1], "r");
	}
	else {
		yyin = stdin;
	}
	yylex();
	return 0;
}

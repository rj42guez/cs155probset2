/* 
 * Sample Scanner1: 
 * Description: Replace the string "username" from standard input 
 *              with the user's login name (e.g. lgao)
 * Usage: (1) $ flex sample1.lex
 *        (2a on Mac OS X) $ gcc lex.yy.c -ll 
 *        (2b on Linux)    $ gcc lex.yy.c -lfl
 *        (3) $ ./a.out
 *            stdin> username
 *	      stdin> Ctrl-D
 * Question: What is the purpose of '%{' and '%}'?
 *           What else could be included in this section?
 */

%{
/* need this for the call to getlogin() below */
#include <unistd.h>

%}

%%
[" "]   {printf("<WHITESPACE, >\n", yytext);}
[+]     {printf("<ARITH_OPS,+>\n", yytext);}
[-]     {printf("<ARITH_OPS,->\n", yytext);}
[/]     {printf("<ARITH_OPS,/>\n", yytext);}
[×]     {printf("<ARITH_OPS,×>\n", yytext);}
"^"     {printf("<ARITH_OPS,^>\n", yytext);}
"go"    	{printf("<KEYWORDS,'go'>\n");}
"to"    	{printf("<KEYWORDS,'to'>\n");}
"exit"    	{printf("<KEYWORDS,'exit'>\n");}
"if"	  	{printf("<KEYWORDS,'if'>\n");}
"then"    	{printf("<KEYWORDS,'then'>\n");}
"else"    	{printf("<KEYWORDS,'else'>\n");}
"else if" 	{printf("<KEYWORDS,'else if'>\n");}
"case"    	{printf("<KEYWORDS,'case'>\n");}
"endcase"    	{printf("<KEYWORDS,endcase'>\n");}
"while"    		{printf("<KEYWORDS,'while'>\n");}
"do"    		{printf("<KEYWORDS,'do'>\n");}
"endwhile"    		{printf("<KEYWORDS,'endwhile'>\n");}
"repeat-until"    	{printf("<KEYWORDS,'repeat-until'>\n");}
"repeat"    		{printf("<KEYWORDS,'repeat'>\n");}
"until"    		{printf("<KEYWORDS,'until'>\n");}
"loop-forever"    	{printf("<KEYWORDS,'loop-forever'>\n");}
"loop"    		{printf("<KEYWORDS,'loop'>\n");}
"forever"    		{printf("<KEYWORDS,'forever'>\n");}
"for"    		{printf("<KEYWORDS,'for'>\n");}
"by"    		{printf("<KEYWORDS,'by'>\n");}
"endfor" 		{printf("<KEYWORDS,'endfor'>\n");}
"input"    		{printf("<KEYWORDS,'input'>\n");}
"output"    		{printf("<KEYWORDS,'output'>\n");}
"array"    		{printf("<KEYWORDS,'array'>\n");}
"node"    		{printf("<KEYWORDS,'node'>\n");}
"call"    		{printf("<KEYWORDS,'call'>\n");}
"return"    		{printf("<KEYWORDS,'return'>\n");}
"stop"    		{printf("<KEYWORDS,'stop'>\n");}
"end"    		{printf("<KEYWORDS,'end'>\n");}
"procedure"    		{printf("<KEYWORDS,'procedure'>\n");}
"mod"				{printf("<MATH_FUNCT,%s>\n", yytext);}
"and"				{printf("<LOGIC_OPS,%s>\n", yytext);}
"or"				{printf("<LOGIC_OPS,%s>\n", yytext);}
"not"     			{printf("<LOGIC_OPS,%s>\n", yytext);}
"true"			    	{printf("<BOOL,%s>\n", yytext);}
"false"			    	{printf("<BOOL,%s>\n", yytext);}
['][a-zA-Z0-9_`~!@#$%^&*()-+=][a-zA-Z0-9 _`~!@#$%^&*()-+=]*[']    	{printf("<STRING,%s>\n", yytext);}
[a-zA-Z_][0-9a-zA-Z_]*    	{printf("<IDENTIFIERS,%s>\n", yytext);}
[1-9]*[0-9]    			{printf("<INTEGERS,%s>\n", yytext);}
"<="				{printf("<RELAT_OPS,%s>\n", yytext);}
">="				{printf("<RELAT_OPS,%s>\n", yytext);}
"<"				{printf("<RELAT_OPS,%s>\n", yytext);}
">"				{printf("<RELAT_OPS,%s>\n", yytext);}
"="				{printf("<RELAT_OPS,%s>\n", yytext);}
"!="				{printf("<RELAT_OPS,%s>\n", yytext);}
"%"				{printf("<RELAT_OPS,%s>\n", yytext);}
"("		{printf("<DELIMITERS,%s>\n", yytext);}
")"		{printf("<DELIMITERS,%s>\n", yytext);}
"["		{printf("<DELIMITERS,%s>\n", yytext);}
"]"		{printf("<DELIMITERS,%s>\n", yytext);}
"{"		{printf("<DELIMITERS,%s>\n", yytext);}
"}"		{printf("<DELIMITERS,%s>\n", yytext);}
"."		{printf("<DELIMITERS,%s>\n", yytext);}
":"		{printf("<DELIMITERS,%s>\n", yytext);}
","		{printf("<DELIMITERS,%s>\n", yytext);}
";"		{printf("<DELIMITERS,%s>\n", yytext);}
"‘"		{printf("<DELIMITERS,%s>\n", yytext);}
"’" 		{printf("<DELIMITERS,%s>\n", yytext);}
.				{printf("%s", yytext);}
%%

int yywrap(){}
int main()
{

FILE *fp;
char filename[50];
printf("Enter the filename: \n");
scanf("%s",filename);
fp = fopen(filename,"r");
yyin = fp;

yylex();
}


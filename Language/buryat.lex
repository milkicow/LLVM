%{
    #define YYSTYPE void*
    #include "buryat.tab.h"
%}


%option noyywrap
%option yylineno

comments        [#].*\n
whitespaces     [ \n\t]

word            [A-Za-z_]+
number          [0-9]+

less            [<]
greater         [>]

less_equal      [<][=]
greater_equal   [>][=]
equal           [=][=]
not_equal       [!][=]

mul             [*]
div             [/]
plus            [+]
minus           [-]


%%
{comments}|{whitespaces} {}

"jump"  { return JUMP; }

"if"    { return IF_BEGIN; }
"then"  { return IF_THEN; }
"else"  { return ELSE; }

"put"   { return PUT_PIXEL; }
"flush" { return FLUSH; }

"&&"    { return AND; }
"||"    { return OR; }

{word} {
    yylval = strdup(yytext);
    return IDENTIFIER;
}

{number} {
    yylval = strdup(yytext);
    return NUMBER;
}

{less} { return LESS; }
{less_equal} { return LESS_EQUAL; }

{greater} { return GREATER; }
{greater_equal} { return GREATER_EQUAL; }

{equal} { return EQUAL; }
{not_equal} { return NOT_EQUAL; }

{mul} { return MUL; }
{div} { return DIV; }

{plus} { return PLUS; }
{minus} { return MINUS; }

"routine begin" { return FUNCTION_BEGIN; }
"routine end"   { return FUNCTION_END; }

"call routine"  { return FUNCTION_CALL; }

. {
    return *yytext;
}

%%

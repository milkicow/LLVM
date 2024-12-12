%{
    #define YYSTYPE void*
    #include "buryat.tab.h"
%}


%option noyywrap
%option yylineno

comments        [#].*\n
whitespaces     [ \n\t]

word            [A-Za-z_]+
cyrillic_word   [АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя_үө]+

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

"урагша"  { return JUMP; }

"haa"       { return IF_BEGIN; }
"тиихэдээ"  { return IF_THEN; }
"ондоогоор" { return ELSE; }

"зураха"    { return PUT_PIXEL; }
"сэбэр"     { return FLUSH; }

"&&"    { return AND; }
"||"    { return OR; }

{word}|{cyrillic_word} {
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

"журам эхилхэ"      { return FUNCTION_BEGIN; }
"журам түгэсхэл"    { return FUNCTION_END; }

"дуудалгануудай журам"  { return FUNCTION_CALL; }

. {
    return *yytext;
}

%%

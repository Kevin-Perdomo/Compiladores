%%

%standalone

%class Exemplo2

%line

Numero = [0-9]
Letra = [a-zA-Z]
Alfa = [a-zA-Z0-9]

%%
int { System.out.println("tipo int"); }
[=] { System.out.println("atribuicao"); }
{Numero}+ { System.out.println("Numero inteiro "+ yytext() + " na linha " + yyline); }
{Letra}+{Alfa}* { System.out.println("identificador de variavel "+ yytext()); }
[ \n\t\r] { /* ignora estes simbolos */ }
. {  /* ignora qualquer outro simbolo */ }

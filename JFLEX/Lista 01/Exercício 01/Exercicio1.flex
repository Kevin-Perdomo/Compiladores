%% 

%standalone

%class Exercicio1

Vogal = [aeiouAEIOU]
Numero = [0-9]

%%
{Vogal}+  { System.out.println("Vogal "+ yytext() + " na linha " + yyline); }
{Numero}+ { System.out.println("Numero inteiro "+ yytext() + " na linha " + yyline); }
[ \n\t\r] { /* ignora estes simbolos */ }
. { /* ignora qualquer outro simbolo */ }
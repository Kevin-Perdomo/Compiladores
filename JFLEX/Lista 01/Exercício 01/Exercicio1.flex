%% <<- Inicio das pré-definições
%standalone

%class Exercicio1

%line
%eof{
System.out.println("Acabooouuuuuuu");
%eof}

Vogal = [aeiouAEIOU]
Numero = [0-9]

%% <<- Inicio das regras da linguagem
{Vogal}+  { System.out.println("Vogal "+ yytext() + " na linha " + yyline); }
{Numero}+ { System.out.println("Numero inteiro "+ yytext() + " na linha " + yyline); }
[ \n\t\r] { /* ignora estes simbolos */ }
. { /* ignora qualquer outro simbolo */ }
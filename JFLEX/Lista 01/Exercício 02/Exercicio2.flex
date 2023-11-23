%% <<- Inicio das pré-definições
%standalone

%class Exercicio2

%{
int contdata = 0;
%}

%eof{
System.out.println("Quantidade de datas: " +contdata);
%eof}

%% <<- Inicio das regras da linguagem
[0-2][1-9][/][0][0-9][/][0-9]{1,4} {contdata++; System.out.println(yytext());}
[0-2][1-9][/][1][0-2][/][0-9]{1,4} {contdata++; System.out.println(yytext());}
[3][0-1][/][0][0-9][/][0-9]{1,4}   {contdata++; System.out.println(yytext());}
[3][0-1][/][1][0-2][/][0-9]{1,4}   {contdata++; System.out.println(yytext());}
[ \n\t\r] { /* ignora estes simbolos */ }
. { /* ignora qualquer outro simbolo */ }
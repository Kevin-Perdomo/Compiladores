%% <-- Indica o inicio das pre-definicoes

%standalone

%class Exercicio3

%{
int inteiros=0;
int reais=0;
int strings=0;
int palavrasReservadas=0;
%}

%eof{
System.out.println("\na) Quantidade de inteiros: "+inteiros);
System.out.println("b) Quantidade de reais: "+reais);
System.out.println("c) Quantidade de strings: "+strings);
System.out.println("d) Quantidade de palavras reservadas: "+palavrasReservadas);
%eof}

%% <-- Aqui comecam as regras da linguagem...

[0-9]+ { inteiros++; System.out.println(yytext());}
[0-9]+[\.][0-9]+ { reais++; System.out.println(yytext());}
[\-][0-9]+[\.][0-9]+ { reais++; System.out.println(yytext());}
int { palavrasReservadas++; System.out.println(yytext());}
char { palavrasReservadas++; System.out.println(yytext());}
for { palavrasReservadas++; System.out.println(yytext());}
while { palavrasReservadas++; System.out.println(yytext());}
[a-zA-Z]+ { strings++; System.out.println(yytext());}
[ \n\t\r] { }
. { /* ignora qualquer outro simbolo */ }
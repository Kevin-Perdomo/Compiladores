%% <<- Indica o inicio das pre definicoes

%standalone

%class Exemplo1

%{
int contador_letra_A = 0;
%}

%eof{
System.out.println("Quantidade de letras A's = " + contador_letra_A);
%eof}

%% <<- Aqui comecam as regras da linguagem...
[a|A] { contador_letra_A++; System.out.println("A"); }
[0|1]+ { System.out.println("Numero binario"); }
[ \n\t\r] {  }
. {  }

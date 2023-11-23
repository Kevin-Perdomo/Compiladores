%%

%standalone
%class Exercicio4

%{
      StringBuffer string = new StringBuffer();
%}

Numero = [0-9]
Letra = [a-zA-Z]
Alfa = [a-zA-Z0-9]

%state STRING

%%
<YYINITIAL> {
{Numero}+ { System.out.println("Numero inteiro "+ yytext()); }
[-]{Numero}+ { System.out.println("Numero inteiro "+ yytext()); }
{Numero}+[.]{Numero}+ { System.out.println("Numero real "+ yytext()); }
[-]{Numero}+[.]{Numero}+ { System.out.println("Numero real "+ yytext()); }
\" { string.setLength(0); yybegin(STRING); }
int { System.out.println("tipo int"); }
float { System.out.println("tipo float"); }
if { System.out.println("comando if"); }
else { System.out.println("comando else"); }
[=] { System.out.println("atribuicao"); }
[{] { System.out.println("abre bloco de comandos"); }
[}] { System.out.println("fecha bloco de comandos"); }
{Letra}+{Alfa}* { System.out.println("identificador de variavel "+ yytext()); }
[ \n\t\r] {  }
}

<STRING> {
\"                             { System.out.println("String "+string.toString()); yybegin(YYINITIAL); }
[^\n\r\"\\]+                   { string.append( yytext() ); }
\\t                            { string.append('\t'); }
\\n                            { string.append('\n'); }
\\r                            { string.append('\r'); }
 \\\"                          { string.append('\"'); }
 \\                            { string.append('\\'); }
 }

. {  /* ignora qualquer outro simbolo */ }
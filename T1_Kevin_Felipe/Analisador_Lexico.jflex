import java_cup.runtime.*;
/*Essa biblioteca fornece classes e estruturas de dados que são necessárias 
para o funcionamento do analisador gerado. Importar todas as classes usando 
import java_cup.runtime.*; simplifica o código, pois permite que você use as 
classes da biblioteca sem ter que especificar cada uma delas separadamente.*/

%%

%class scanner
%unicode
%cup
%line
%column
//Declarações iniciais que especificam configurações para o gerador JFlex

%{
    StringBuffer string = new StringBuffer();
    //é uma classe do java que fornece o tipo string para poder ser usado
%}

%{
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
    //ambas criam um novo objeto privado que auxilia na hora de chamar os tokens
%}
//%{ ... %} contém código Java que será incluído diretamente no código gerado pelo JFlex

%eof{ 
  System.out.println("Welcome to the Jungle!!"); 
%eof}
/*A parte comentada %eof{ ... %eof} em um arquivo JFlex 
está relacionada ao tratamento de fim de arquivo (End Of File)*/

identifier = [:jletter:] ([:jletter:]|[:jletterdigit:])*
//jleter(um caracter qualquer), jletterdigit(um caracter ou numero qualquer)
boolean = true | false
float = [:digit:]* "." [:digit:]+;
char = ([:jletter:] | [digit]); 
inteiro = [0-9][0-9]*
//inteir negativo = 0 | ("(-)" [1-9][0-9]*) | [1-9][0-9]*

%state STRING
//O estado <STRING> é usado para lidar com strings e inclui regras para escape de caracteres

%%

<YYINITIAL> {
    [\n] {}

    //tipos
    "int" { return symbol(sym.INTEIRO_RESERVADO); }
    "float" { return symbol(sym.DECIMAL_RESERVADO); }
    "char" { return symbol(sym.CARACTER_RESERVADO); }
    "boolean" { return symbol(sym.BOOLEANO_RESERVADO); }

    //operadores logicos
    "=" { return symbol(sym.ATRIBUICAO); }
    "==" {return symbol(sym.EQUIVALENCIA);}
    "&&" {return symbol(sym.E);}
    "||" {return symbol(sym.OU);}
    "^" {return symbol(sym.OU_EXCLUSIVO);}
    "!" {return symbol(sym.NEGACAO);}

    //operadores aritmeticos
    "+" { return symbol(sym.MAIS); }
    "-" { return symbol(sym.MENOS); }
    "*" { return symbol(sym.MULTIPLICACAO); }
    "/" { return symbol(sym.DIVISAO); }
    "%" { return symbol(sym.RESTO); }
    ">" {return symbol(sym.MAIOR_QUE);}
    "<" {return symbol(sym.MENOR_QUE);}

    //simbolos
    "guns" { return symbol(sym.ABRE_BLOCO); }
    "roses" { return symbol(sym.FECHA_BLOCO); }
    "(" { return symbol(sym.ABRE_PARENTESES); }
    ")" { return symbol(sym.FECHA_PARENTESES); }
    "[" {return symbol(sym.ABRE_COLCHETE);}
    "]" {return symbol(sym.FECHA_COLCHETE);}
    ";" { return symbol(sym.FECHA_COMANDO); }
    "," {return symbol(sym.VIRGULA);}

    //estruturas
    if { return symbol(sym.SE); }
    else { return symbol(sym.SE_NAO); }
    while {return symbol(sym.ENQUANTO);}
    for {return symbol(sym.PARA);}
    print {return symbol(sym.ESCREVA);}
    scan {return symbol(sym.GUARDA);}

    //tirado da documentação do jflex
    \" { string.setLength(0); yybegin(STRING); }
    {boolean} {return symbol(sym.BOOLEANO, yytext());}
    {inteiro} { return symbol(sym.INTEIRO, yytext()); }
    {float} { return symbol(sym.DECIMAL, yytext()); }
    "'"{char}"'" {return symbol(sym.CARACTER, yytext());}
    {identifier} {return symbol(sym.IDENTIFICADOR, yytext());}
    [\t\r] { }
}

<STRING> {
    "\\\""        { yybegin(YYINITIAL); return symbol(sym.STRING, string.toString()); }
    "\t"          { string.append('\t'); }
    "\n"          { string.append('\n'); }
    "\r"          { string.append('\r'); }
    "\\"          { string.append('\\'); }
    [^\n\r\"\\]+  { string.append(yytext()); }
}

. { }
//A regra . é um curinga que corresponde a qualquer caractere não abrangido pelas regras anteriores

[^] { throw new Error("Breakdown <"+yytext()+">"); }
//A regra [^] trata de qualquer caractere que não corresponde a nada e lança um erro.
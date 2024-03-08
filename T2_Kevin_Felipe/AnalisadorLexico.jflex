/*
Esse código especifica como os tokens são reconhecidos em nossa linguagem de programação e
como eles são convertidos em símbolos que podem ser processados pelo analisador sintático.
*/

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
/*necessário para o analizador sintatico conseguir indicar onde esta o erro*/
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
inteiro = 0 | [1-9][0-9]*

%state STRING

%%

<YYINITIAL> {
    [\n] {}

    //types
    "int" "eger"? {return symbol(sym.INTEGER_KEYWORD);}
    "bool" "ean"? {return symbol(sym.BOOLEAN_KEYWORD);}
    "char" {return symbol(sym.CHARACTER_KEYWORD);}
    "float" {return symbol(sym.FLOAT_KEYWORD);}

    //logical operators
    "=" {return symbol(sym.EQ);}
    "==" {return symbol(sym.EQEQ);}
    "&&" {return symbol(sym.AND);}
    "||" {return symbol(sym.OR);}
    "^" {return symbol(sym.XOR);}
    "!" {return symbol(sym.NOT);}

    //aritmatic operators
    "+" {return symbol(sym.ADDITION);}
    "-" {return symbol(sym.SUBTRACTION);}
    "*" {return symbol(sym.MULTIPLICATION);}
    "/" {return symbol(sym.DIVISION);}
    ">" {return symbol(sym.GREATER_THAN);}
    "<" {return symbol(sym.LESS_THAN);}

    //symbols
    "," {return symbol(sym.COMMA);}
    ";" {return symbol(sym.SEMICOLON);}
    "(" {return symbol(sym.PARENTHESES_OPEN);}
    ")" {return symbol(sym.PARENTHESES_CLOSE);}
    "guns" {return symbol(sym.CURLY_BRACKET_OPEN);}
    "roses" {return symbol(sym.CURLY_BRACKET_CLOSE);}

    //keywords
    if {return symbol(sym.IF);}
    else {return symbol(sym.ELSE);}
    while {return symbol(sym.WHILE);}
    for {return symbol(sym.FOR);}
    print {return symbol(sym.PRINT);}
    scan {return symbol(sym.SCAN);}

    //tirado da documentação do jflex
    \" { string.setLength(0); yybegin(STRING); }
    {boolean} {return symbol(sym.BOOLEAN, yytext());}
    {inteiro} { return symbol(sym.INTEGER, yytext()); }
    {float} { return symbol(sym.FLOAT, yytext()); }
    "'"{char}"'" {return symbol(sym.CHAR, yytext());}
    {identifier} {return symbol(sym.IDENTIFIER, yytext());}
    [\t\r] { }
}

<STRING> {
    \"                             { yybegin(YYINITIAL); return symbol(sym.STRING, string.toString()); }
    [^\n\r\"\\]+                   { string.append( yytext() ); }
    \\t                            { string.append('\t'); }
    \\n                            { string.append('\n'); }

    \\r                            { string.append('\r'); }
    \\\"                           { string.append('\"'); }
    \\                             { string.append('\\'); }
}

. { }
//A regra . é um curinga que corresponde a qualquer caractere não abrangido pelas regras anteriores

[^] { throw new Error("Breakdown <"+yytext()+">"); }
//A regra [^] trata de qualquer caractere que não corresponde a nada e lança um erro.
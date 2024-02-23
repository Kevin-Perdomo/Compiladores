import java_cup.runtime.Symbol;

%%
%class scanner
%unicode

%cup
%line
%column

%{
private Symbol symbol(int type) {
return new Symbol(type, yyline, yycolumn);
}


private Symbol symbol(int type, Object value) {
return new Symbol(type, yyline, yycolumn, value);
}
%}

WhiteSpace = [ \t\f\r\n]

Number = [0-9]+
FloatNumber = ([0-9]*\.[0-9]+|[0-9]+)
Character = \".\" 
STRING = \"([^\\\"]|\\.)*\"

IDENT = [A-Za-z_][A-Za-z_0-9]*


%%
"+"      { return symbol(sym.PLUS); }
"-"      { return symbol(sym.MINUS); }
"*"      { return symbol(sym.TIMES); }
"/"      { return symbol(sym.DIVIDE); }
"%"      { return symbol(sym.MOD); }
"="      { return symbol(sym.ASSIGN); }
"("      { return symbol(sym.LPR); }
")"      { return symbol(sym.RPR); }
"{"      { return symbol(sym.LBR); }
"}"      { return symbol(sym.RBR); }
";"      { return symbol(sym.SEMI); }

"int"    { return symbol(sym.INT); }
"char"   { return symbol(sym.CHAR); }
"str"    { return symbol(sym.STR); }
"float"  { return symbol(sym.FLOAT); }

"printf" { return symbol(sym.PRINTF); }
"scanf"  { return symbol(sym.SCANF);}

"if"     { return symbol(sym.IF);}
"else"   { return symbol(sym.ELSE);}

"while"  { return symbol(sym.WHILE); }
"for"    { return symbol(sym.FOR); }

"program" {return symbol (sym.PROGRAM);}
"end" {return symbol(sym.END);}

"=="     { return symbol(sym.EQ); }
"<="     { return symbol(sym.LEQ); }
">="     { return symbol(sym.GEQ); }
">"      { return symbol(sym.GRAT); }
"<"      { return symbol(sym.LESS); }
"!="     { return symbol(sym.NEQ); }


{Number}      { return symbol(sym.NUMBER, new Integer(yytext())); }
{FloatNumber} { return symbol(sym.FLOATNUMBER, new Float(yytext())); } 
{Character}   { return symbol(sym.CHARACTER, new String(yytext())); }
{STRING}      { return symbol(sym.STRING, new String(yytext())); } 

{IDENT}       { return symbol(sym.IDENT, new String(yytext()));}


{WhiteSpace}  { /* ignore */ }
.             { return symbol(sym.error, yytext()); }

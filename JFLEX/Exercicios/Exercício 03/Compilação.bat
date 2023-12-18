@echo off
echo Compilar Analizador lexico
pause
call jflex Exercicio3.flex
pause
call javac Exercicio3.java
pause
call java Exercicio3 codigo_fonte_Exercicio3.txt
pause
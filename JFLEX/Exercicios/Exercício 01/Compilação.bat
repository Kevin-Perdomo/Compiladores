@echo off
echo Compilar Analizador lexico
pause
call jflex Exercicio1.flex
pause
call javac Exercicio1.java
pause
call java Exercicio1 codigo_fonte_Exercicio1.txt
pause
@echo off
echo Compilar Analizador lexico
pause
call jflex Exercicio2.flex
pause
call javac Exercicio2.java
pause
call java Exercicio2 codigo_fonte_Exercicio2.txt
pause
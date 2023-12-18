@echo off
echo Compilar Analizador lexico
pause
call jflex Exercicio4.flex
pause
call javac Exercicio4.java
pause
call java Exercicio4 codigo_fonte_Exercicio4.txt
pause
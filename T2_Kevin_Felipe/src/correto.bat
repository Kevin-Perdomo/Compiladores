@echo off
set /p resposta="Digite o numero do teste: "
call java -cp .;java-cup-11b-runtime.jar Main correto%resposta%.txt
pause
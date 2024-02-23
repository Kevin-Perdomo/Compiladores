set /p resposta="Digite o numero do teste:"

call java -cp .;java-cup-11b-runtime.jar Main codigo_fonte%resposta%.txt
pause
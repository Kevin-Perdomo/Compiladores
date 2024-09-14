# Compiladores - Linguagem Fictícia

Este repositório contém o trabalho desenvolvido para a disciplina de **Compiladores**, onde foi implementado um compilador para uma linguagem fictícia chamada de **Guns N` Roses**, utilizando as ferramentas **JFLEX** e **CUP**. O projeto é dividido em duas fases: a construção de analisadores léxico e sintático e a implementação de verificações semânticas e geração de código intermediário.

## Fase 1 - Analisador Léxico e Sintático

### Objetivos:
1. **Especificação da Gramática**: Definição de uma gramática para a linguagem fictícia utilizando notação **BNF** ou **BNF Estendida**. A linguagem inclui:
   - Tipos de dados: inteiro, real, caracter, string.
   - Declaração e atribuição de variáveis.
   - Expressões aritméticas e lógicas.
   - Comandos básicos: `printf`, `scanf`, `if else`, `for`, `while`.
   - Identificadores de início e fim de bloco de comandos.

2. **Analisador Léxico**: Criado com o **JFLEX**, responsável por identificar os tokens da linguagem.

3. **Analisador Sintático**: Implementado com o **CUP**, baseado na gramática especificada, para validar a estrutura dos códigos-fontes.

4. **Casos de Teste**: Foram desenvolvidos 3 códigos-fontes "corretos" e 3 códigos "com erros de sintaxe". O compilador exibe mensagens específicas indicando a linha dos erros.

## Fase 2 - Verificação Semântica e Geração de Código

### Objetivos:
1. **Ações Semânticas**: Verificação de pelo menos três tipos de erros semânticos, como:
   - Variável utilizada sem declaração.
   - Compatibilidade de tipos nas atribuições.
   - Análise de escopo de variáveis.

   Para isso, foram implementadas classes em Java:
   - **Analisador Semântico**: Responsável pela verificação dos erros semânticos.
   - **Tabela de Símbolos**: Representa as variáveis e suas informações associadas.

2. **Geração de Código**: Implementação da geração de código intermediário ou Assembly para dois comandos da linguagem fictícia, como `printf`, `scanf`, `if-else`, `for`, ou `while`.

## Requisitos

- **JFLEX**: Para a construção do analisador léxico.
- **CUP**: Para a construção do analisador sintático.
- **Java**: Para a execução dos analisadores e das verificações semânticas.

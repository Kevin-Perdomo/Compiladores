/*
Este código Java representa a classe principal de um analisador sintático gerado pelo JavaCUP. 
Ele lê um arquivo de entrada, realiza a análise sintática e imprime a árvore de análise resultante.
 */

import java.io.FileNotFoundException;
import java.io.FileReader;
import java_cup.runtime.*;

class Main {

  static boolean do_debug_parse = false;

  static public void main(String[] args) throws java.io.IOException {

    /* create a parsing object */
    Parser parser_obj = new Parser(new scanner(new FileReader(args[0])));

    /* open input files, etc. here */
    Symbol parse_tree = null;

    try {
      if (do_debug_parse)
        parse_tree = parser_obj.debug_parse();
      else
        parse_tree = parser_obj.parse();
    } catch (Exception e) {

      /*
       * System.out.println(e.getCause());
       * for (StackTraceElement stackElement : e.getStackTrace()) {
       * System.out.println(stackElement.getFileName() + "  "
       * +stackElement.getMethodName()
       * + "  " + stackElement.getLineNumber());
       * }
       */

    } finally {
      /* do close out here */
    }
  }
}
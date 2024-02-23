import java.util.*;

public class Analisadorsemantico {
	private Hashtable tabelaSimbolos = new Hashtable();
	
	public boolean verificar_atribuicao(Object variavel, Object valor) {
	boolean erro = false;
	if(tabelaSimbolos.get(variavel)==null) {
		System.out.println("Erro: Variavel '" + variavel + "' nao declarada.");
		erro = true;
	}else{
		String id = tabelaSimbolos.get(variavel).toString();

		if(id.equals("inteiro") && valor.toString().contains(".")) {
			System.out.println("Erro: Variavel '" + variavel + "' eh do tipo inteiro");
			erro = true;
		}
		else if((id.equals("float") || id.equals("inteiro")) && valor.toString().contains("\"")) {
			System.out.println("Erro: Variavel '" + variavel + "' deve ter um valor numerico");
			erro = true;
		}
		else if((id.equals("string") || id.equals("char")) && !valor.toString().contains("\"")) {
			System.out.println("Erro: Variavel '" + variavel + "' nao pode receber valor numerico");
			erro = true;
		}
		else if(id.equals("char") && valor.toString().length()>3) {
			System.out.println("Erro: Variavel '" + variavel + "' eh do tipo char");
			erro = true;
		}
	}
	return erro;
}
	
	public void inserir_simbolo(Object identificador, Object tipo) {
		tabelaSimbolos.put(identificador, tipo);
	}
	
	
}

package cps450;

import java.util.List;

public class SymbolTable {
	
	int currentScope;
	
	List<Symbol> symbols;

	public SymbolTable() {
		// TODO Auto-generated constructor stub
	}
	
	public void beginScope()
	{
		++currentScope;
	}
	

	public int getCurrentScope() {
		return currentScope;
	}

	public void setCurrentScope(int currentScope) {
		this.currentScope = currentScope;
	}

	public List<Symbol> getSymbols() {
		return symbols;
	}

	public void setSymbols(List<Symbol> symbols) {
		this.symbols = symbols;
	}


}

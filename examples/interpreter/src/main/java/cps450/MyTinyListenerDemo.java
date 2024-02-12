package cps450;

import org.antlr.v4.runtime.Token;

import cps450.TinyParser.Assign_stmtContext;
import cps450.TinyParser.StmtContext;

public class MyTinyListenerDemo extends TinyBaseListener {
	

	@Override
	public void enterStmt(StmtContext ctx) {
		System.out.println("Entered statement: " + ctx.getText());
	}

	@Override
	public void enterAssign_stmt(Assign_stmtContext ctx) {
		System.out.println("Entered assignment statement: " + ctx.getText());
		Token idToken = ctx.ID().getSymbol();
		System.out.println(idToken.getLine() + ":" + idToken.getText());
	}
	
}

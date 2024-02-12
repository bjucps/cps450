package cps450;

import java.util.HashMap;
import java.util.Scanner;

import org.antlr.v4.runtime.Token;

import cps450.TinyParser.AddExprContext;
import cps450.TinyParser.Assign_stmtContext;
import cps450.TinyParser.ExprContext;
import cps450.TinyParser.IdTermContext;
import cps450.TinyParser.IntTermContext;
import cps450.TinyParser.MulExprContext;
import cps450.TinyParser.ParTermContext;
import cps450.TinyParser.Read_stmtContext;
import cps450.TinyParser.StmtContext;
import cps450.TinyParser.TermExprContext;
import cps450.TinyParser.Write_stmtContext;

public class TinyInterpreter extends TinyBaseListener {
	
	Scanner scanner = new Scanner(System.in);
	
	HashMap<String, Double> variables = new HashMap<>();

	@Override
	public void enterStmt(StmtContext ctx) {
		System.out.println("Entered statement: " + ctx.getText());
	}

	@Override
	public void exitWrite_stmt(Write_stmtContext ctx) {
		for (ExprContext expr : ctx.expr_list().exprs) {
			System.out.println(expr.getText() + " = " + expr.value);
		}
	}

	@Override
	public void exitRead_stmt(Read_stmtContext ctx) {
		for (Token idTok : ctx.id_list().ids) {
			String id = idTok.getText();
			System.out.print("Enter value for " + id + ":");
			
			String value = scanner.nextLine();
			variables.put(id, new Double(value));
		}
	}

	@Override
	public void exitAssign_stmt(Assign_stmtContext ctx) {
		Double value = ctx.expr().value;
		assert value != null;
		String id = ctx.ID().getText();
		variables.put(id,  value);
	}

	@Override
	public void exitParTerm(ParTermContext ctx) {
		ctx.value = ctx.expr().value;
	}

	@Override
	public void exitIdTerm(IdTermContext ctx) {
		String id = ctx.ID().getText();
		Double value = variables.get(id);
		if (value == null) {
			Token tok = (Token) ctx.ID().getPayload();
			System.out.println("** WARNING: Undefined identifier " + id + " on Line " + tok.getLine());
			value = new Double(0);
		}
		ctx.value = value;
	}
	
	@Override
	public void exitIntTerm(IntTermContext ctx) {
		ctx.value = new Double(ctx.integer().getText());
	}
	

	@Override
	public void exitMulExpr(MulExprContext ctx) {
		Double value1 = ctx.e1.value;
		Double value2 = ctx.e2.value;
		ctx.value = value1 * value2;
	}

	@Override
	public void exitAddExpr(AddExprContext ctx) {
		Double value1 = ctx.e1.value;
		Double value2 = ctx.e2.value;
		if (ctx.add_op().getText().equals("+")) {			
			ctx.value = value1 + value2;
		} else if (ctx.add_op().getText().equals("-")) {
			ctx.value = value1 - value2;
		} else {
			throw new RuntimeException("Unknown operator type: " + ctx.add_op().getText());
		}
	}

	@Override
	public void exitTermExpr(TermExprContext ctx) {
		ctx.value = ctx.term().value;
	}

	
	
	
	
	
	
	
	

}

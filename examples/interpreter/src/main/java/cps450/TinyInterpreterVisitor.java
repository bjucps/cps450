package cps450;

import java.util.HashMap;

import cps450.TinyParser.AddExprContext;
import cps450.TinyParser.Assign_stmtContext;
import cps450.TinyParser.ExprContext;
import cps450.TinyParser.IdTermContext;
import cps450.TinyParser.IntegerContext;
import cps450.TinyParser.MulExprContext;
import cps450.TinyParser.Write_stmtContext;

public class TinyInterpreterVisitor extends TinyBaseVisitor<Double> {
	
	HashMap<String, Double> variables = new HashMap<>();

	@Override
	public Double visitWrite_stmt(Write_stmtContext ctx) {
		for (ExprContext expr : ctx.expr_list().exprs) {
			Double result = visit(expr);
			System.out.println(expr.getText() + " = " + result);
		}
		return null;
	}

	@Override
	public Double visitAssign_stmt(Assign_stmtContext ctx) {
		String id = ctx.ID().getText();
		Double value = visit(ctx.expr());
		assert value != null;
		variables.put(id,  value);
		return null;
	}

	@Override
	public Double visitMulExpr(MulExprContext ctx) {
		Double v1 = visit(ctx.e1);
		Double v2 = visit(ctx.e2);
		if (ctx.mul_op().getText().equals("*")) {
			return v1 * v2;
		} else {
			return v1 / v2;
		}
	}

	@Override
	public Double visitAddExpr(AddExprContext ctx) {
		Double v1 = visit(ctx.e1);
		Double v2 = visit(ctx.e2);
		if (ctx.add_op().getText().equals("+")) {
			return v1 + v2;
		} else {
			return v1 - v2;
		}
	}


	@Override
	public Double visitInteger(IntegerContext ctx) {
		return new Double(ctx.getText());
	}


	@Override
	public Double visitIdTerm(IdTermContext ctx) {
		String id = ctx.ID().getText();
		Double value = variables.get(id);
		if (value == null) {
			value = 0.0;
		}
		return value;
	}
	
}

package cps450;

import java.util.List;

import cps450.TinyParser.AddExprContext;
import cps450.TinyParser.AsmtStmtContext;
import cps450.TinyParser.Assign_stmtContext;
import cps450.TinyParser.ExprContext;
import cps450.TinyParser.IdTermContext;
import cps450.TinyParser.IntTermContext;
import cps450.TinyParser.MulExprContext;
import cps450.TinyParser.ProgramContext;
import cps450.TinyParser.StmtContext;
import cps450.TinyParser.TermContext;
import cps450.TinyParser.TermExprContext;
import cps450.TinyParser.WriteStmtContext;
import cps450.TinyParser.Write_stmtContext;

public class PythonCodeGenerator {
	
    public void traverse(ProgramContext program) {
        List<StmtContext> stmts = program.stmt_list().stmt();
        for (var stmt : stmts) {
            if (stmt instanceof AsmtStmtContext) {
                visitAssign_stmt(((AsmtStmtContext)stmt).assign_stmt());
			} else if (stmt instanceof WriteStmtContext) {
				visitWrite_stmt(((WriteStmtContext)stmt).write_stmt());
			}
		}
    }

	public void visitAssign_stmt(Assign_stmtContext ctx) {
		System.out.print(ctx.ID().getText() + " = ");
		visitExpr(ctx.expr());
		System.out.println();
	}

	
	public void visitWrite_stmt(Write_stmtContext ctx) {

		System.out.print("print(");
		for (int i = 0; i < ctx.expr_list().exprs.size(); ++i) {
			ExprContext expr = ctx.expr_list().exprs.get(i);
			visitExpr(expr);
			if (i != ctx.expr_list().exprs.size() - 1) {
				System.out.print(", ");
			}
		}
		System.out.println(")");
	}

	// Expressions

    public void visitExpr(ExprContext node) {
		if (node instanceof MulExprContext) {
		} else if (node instanceof AddExprContext) {
			System.out.print("(");
            visitExpr(((AddExprContext)node).e1);
			System.out.print((((AddExprContext)node).add_op()).getText());
            visitExpr(((AddExprContext)node).e2);
			System.out.print(")");
        } else {
            visitTerm(((TermExprContext)node).term());
        }
    }

	public void visitTerm(TermContext node) {
		if (node instanceof IdTermContext) {
			System.out.print(((IdTermContext)node).ID().getText());
		} else if (node instanceof IntTermContext) {
			System.out.print(((IntTermContext)node).integer().getText());

		}
	}

	public void visitAddExpr(AddExprContext ctx) {
		System.out.print("(");
		visitExpr(ctx.e1);
		System.out.print(" " + ctx.add_op().getText() + " ");
		visitExpr(ctx.e2);
		System.out.print(")");
	}

	public void visitIntTerm(IntTermContext ctx) {
		System.out.print(ctx.integer().getText());
	}	
		
}


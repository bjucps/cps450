package cps450;

import java.util.HashMap;
import java.util.List;

import cps450.TinyParser.AddExprContext;
import cps450.TinyParser.AsmtStmtContext;
import cps450.TinyParser.Assign_stmtContext;
import cps450.TinyParser.ExprContext;
import cps450.TinyParser.IdTermContext;
import cps450.TinyParser.IntTermContext;
import cps450.TinyParser.IntegerContext;
import cps450.TinyParser.MulExprContext;
import cps450.TinyParser.ParTermContext;
import cps450.TinyParser.ProgramContext;
import cps450.TinyParser.StmtContext;
import cps450.TinyParser.TermContext;
import cps450.TinyParser.TermExprContext;

public class TinyInterpreter {
    HashMap<String, Double> symbolTable = new HashMap<>();

    public void traverse(ProgramContext program) {
        List<StmtContext> stmts = program.stmt_list().stmt();
        for (var stmt : stmts) {
            if (stmt instanceof AsmtStmtContext asmtStmtContext) {
                traverse(asmtStmtContext.assign_stmt());
            }
        }
    }

    public void traverse(Assign_stmtContext node) {
        double val = evaluate(node.expr());
        symbolTable.put(node.ID().getText(), val);
        System.out.println(node.ID() + ":" + val);
    }

    public double evaluate(ExprContext node) {
        if (node instanceof MulExprContext mulExprContext) {
            double val1 = evaluate(mulExprContext.e1);
            double val2 = evaluate(mulExprContext.e2);
            return val1 * val2;
        } else if (node instanceof AddExprContext addExprContext) {
            double val1 = evaluate(addExprContext.e1);
            double val2 = evaluate(addExprContext.e2);
            return val1 + val2;
        } else if (node != null) {
            return evaluate(((TermExprContext)node).term());
        } else {
            return 0.0;
        }
    }

    public double evaluate(TermContext node) {
        if (node instanceof IdTermContext idTermContext) {
            // get value of the ID
            Double value = symbolTable.get(idTermContext.ID().getText());
            if (value == null) {
                // Undefined variables have the value 0
                return 0;
            }
            return value;
        } else if (node instanceof IntTermContext intTermContext) {
            IntegerContext numNode =  intTermContext.integer();
            if (numNode.getChildCount() == 2) {
                // There is a leading minus sign
                return  - Double.parseDouble(numNode.NUMBER().getText());
            } else {
                return Double.parseDouble(numNode.NUMBER().getText());
            }
        } else if (node != null){
            return evaluate(((ParTermContext)node).expr());
        } else {
            return 0.0;
        }
    }
}

package cps450;

import java.util.List;

import org.antlr.v4.runtime.tree.TerminalNode;

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
import java.util.HashMap;

public class TinyInterpreter {
    HashMap<String, Double> symbolTable = new HashMap<String, Double>();

    public void traverse(ProgramContext program) {
        List<StmtContext> stmts = program.stmt_list().stmt();
        for (var stmt : stmts) {
            if (stmt instanceof AsmtStmtContext) {
                traverse(((AsmtStmtContext)stmt).assign_stmt());
            }
        }
    }

    public void traverse(Assign_stmtContext node) {
        double val = evaluate(node.expr());
        symbolTable.put(node.ID().getText(), val);
        System.out.println(node.ID() + ":" + val);
    }

    public double evaluate(ExprContext node) {
        if (node instanceof MulExprContext) {
            double val1 = evaluate(((MulExprContext)node).e1);
            double val2 = evaluate(((MulExprContext)node).e2);
            return val1 * val2;
        } else if (node instanceof AddExprContext) {
            double val1 = evaluate(((AddExprContext)node).e1);
            double val2 = evaluate(((AddExprContext)node).e2);
            return val1 + val2;
        } else {
            return evaluate(((TermExprContext)node).term());
        }
    }

    public double evaluate(TermContext node) {
        if (node instanceof IdTermContext) {
            // get value of the ID
            Double value = symbolTable.get(((IdTermContext)node).ID().getText());
            if (value == null) {
                // Undefined variables have the value 0
                return 0;
            }
            return value;
        } else if (node instanceof IntTermContext) {
            IntegerContext numNode =  ((IntTermContext)node).integer();
            if (numNode.getChildCount() == 2) {
                // There is a leading minus sign
                return  - Double.valueOf(numNode.NUMBER().getText());
            } else {
                return Double.valueOf(numNode.NUMBER().getText());
            }
        } else {
            return evaluate(((ParTermContext)node).expr());
        }
    }
}

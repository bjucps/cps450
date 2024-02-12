// Main.java

package cps450;
import java.io.IOException;

import org.antlr.v4.gui.Trees;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.ConsoleErrorListener;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;


public class Main
{
    public static void main(String[] arguments) throws IOException {
        if(arguments.length == 0)
        {
            System.out.println("usage:");
            System.out.println("  interpreter -ds -dp <filename>");
            System.exit(1);
        }
        
        boolean debugScanner = false;
        boolean debugParser = false;
        String filename = null;
        for (String arg: arguments) {
        	if (arg.equals("-ds"))
        		debugScanner = true;
        	else if (arg.equals("-dp"))
        		debugParser = true;
        	else
        		filename = arg;
        }

        
        if (filename == null) {
        	System.err.println("You must supply a filename to parse.");
        	System.exit(1);
        }

        CharStream input = CharStreams.fromFileName(filename);
        MyTinyLexer lexer = new MyTinyLexer(input, debugScanner);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        TinyParser parser = new TinyParser(tokens);
        
        //parser.setErrorHandler(new TinyErrorHandler());
        // Suppress default error messages
        parser.removeErrorListener(ConsoleErrorListener.INSTANCE);
        // Register my own error handler
        parser.addErrorListener(new MyTinyErrorListener());
        
        ParseTree tree = parser.program();
                
        if (parser.getNumberOfSyntaxErrors() > 0)        
        	System.out.println(parser.getNumberOfSyntaxErrors() + " syntax error(s)");
        else {
        	System.out.println("Walking tree with MyTinyListenerDemo...");
        	ParseTreeWalker.DEFAULT.walk(new MyTinyListenerDemo(), tree);
        	System.out.println("Walking tree with TinyInterpreter...");
        	ParseTreeWalker.DEFAULT.walk(new TinyInterpreter(), tree);
        	System.out.println("Walking tree with TinyInterpreterVisitor...");
        	new TinyInterpreterVisitor().visit(tree);
        }
        
        if (debugParser)
        	Trees.inspect(tree, parser);

    }

}


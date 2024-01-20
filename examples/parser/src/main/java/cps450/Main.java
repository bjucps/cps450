// Main.java

package cps450;
import java.io.IOException;

import org.antlr.v4.gui.Trees;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.ConsoleErrorListener;
import org.antlr.v4.runtime.tree.ParseTree;


public class Main
{
    public static void main(String[] arguments) throws IOException {
        if(arguments.length == 0)
        {
            System.out.println("usage:");
            System.out.println("  parser -ds -dp <filename>");
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
        
        if (debugParser)
        	// Display graphical tree
        	Trees.inspect(tree, parser);
        
        System.out.println(parser.getNumberOfSyntaxErrors() + " syntax error(s)");
        
    }

}


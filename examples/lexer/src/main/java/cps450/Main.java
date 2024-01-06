// Main.java

package cps450;
import java.io.IOException;

import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.Token;


public class Main
{
    public static void main(String[] arguments) throws IOException {
        if(arguments.length != 1)
        {
            System.out.println("usage:");
            System.out.println("  lexer <filename>");
            System.exit(1);
        }

        System.out.println();

        CharStream input = CharStreams.fromFileName(arguments[0]);
        ArithmeticLexer lexer = new ArithmeticLexer(input);
        
        // Read tokens from lexer
        Token t = lexer.nextToken();
        while (t.getType() != ArithmeticLexer.EOF) {
          System.out.println(arguments[0] + ":" + t.getLine() + ":" + t.getText());
          t = lexer.nextToken();

        }
    }

}


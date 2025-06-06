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
            System.out.println("  dream <filename>");
            System.exit(1);
        }

        System.out.println();

        var stream = (new Main()).getClass().getResourceAsStream(arguments[0]);
        CharStream input = CharStreams.fromStream(stream);
        ArithmeticLexer lexer = new ArithmeticLexer(input);
        
        // Read tokens from lexer
        Token t = lexer.nextToken();
        while (t.getType() != ArithmeticLexer.EOF) {
          System.out.println(arguments[0] + ":" + t.getLine() + ":" + t.getText());
          t = lexer.nextToken();

        }
    }

}


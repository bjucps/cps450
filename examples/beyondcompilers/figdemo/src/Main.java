import java.io.BufferedReader;
import java.io.FileReader;
import java.io.PushbackReader;
import java.util.ArrayList;

import figlang.lexer.Lexer;
import figlang.node.Start;
import figlang.parser.Parser;

public class Main {
	
	public static ArrayList<Figure> drawing = new ArrayList<Figure>();

	/**
	 * @param args
	 */
	public static void main(String[] args) throws Exception {
		FileReader rd = new FileReader("figure.txt");
		
		Parser p = new Parser(new Lexer(new PushbackReader(new BufferedReader(rd))));
		Start s = p.parse();
		
		FiguresReader figrd = new FiguresReader();
		s.apply(figrd);
		
		System.out.println(drawing);
		
		
		
	}

}

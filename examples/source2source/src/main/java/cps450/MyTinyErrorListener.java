package cps450;

import org.antlr.v4.runtime.ConsoleErrorListener;
import org.antlr.v4.runtime.RecognitionException;
import org.antlr.v4.runtime.Recognizer;

public class MyTinyErrorListener extends ConsoleErrorListener {

	@Override
	public void syntaxError(Recognizer<?, ?> recognizer,
							Object offendingSymbol,
							int line,
							int charPositionInLine,
							String msg,
							RecognitionException e)
	{
		System.err.println("UH OH! At " + line + ":" + charPositionInLine + " -> " + msg);
		if (e != null)
			e.printStackTrace();
	}
}

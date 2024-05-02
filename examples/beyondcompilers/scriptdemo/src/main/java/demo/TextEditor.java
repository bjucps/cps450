package demo;

import java.io.BufferedReader;
import java.io.FileReader;

import javax.swing.JTextArea;

public class TextEditor {
	private JTextArea txtBuffer;
	
	public TextEditor(JTextArea txtBuffer) {
		this.txtBuffer = txtBuffer;
	}

	public void loadFile(String filename) throws Exception {
		BufferedReader rd = new BufferedReader(new FileReader(filename));
		String buffer = "";
		String line = rd.readLine();
		while (line != null) {
			buffer += line + "\n";
			line = rd.readLine();
		}
		rd.close();
		txtBuffer.setText(buffer);
	}
	
	public void append(String text) {
		txtBuffer.setText(txtBuffer.getText() + text);
	}

	
}

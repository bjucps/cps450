package demo;

import java.awt.Rectangle;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

public class Demo extends JFrame {

	private static final long serialVersionUID = 1L;
	private JPanel jContentPane = null;
	private JButton btnLoad = null;
	private JButton btnSave = null;
	
	private TextEditor editor;  //  @jve:decl-index=0:
	private JScrollPane jScrollPane = null;
	private JTextArea txtBuffer = null;
	private JButton btnRun = null;
	
	public static void main(String[] args) {
		javax.swing.SwingUtilities.invokeLater(new Runnable() {
            public void run() {
                new Demo().setVisible(true);
            }
        });
	} 

	/**
	 * This is the default constructor
	 */
	public Demo() {
		super();
		initialize();
	}

	/**
	 * This method initializes this
	 * 
	 * @return void
	 */
	private void initialize() {
		this.setSize(525, 415);
		this.setContentPane(getJContentPane());
		this.setTitle("Editor Demo");
	}

	/**
	 * This method initializes jContentPane
	 * 
	 * @return javax.swing.JPanel
	 */
	private JPanel getJContentPane() {
		if (jContentPane == null) {
			jContentPane = new JPanel();
			jContentPane.setLayout(null);
			jContentPane.add(getBtnLoad(), null);
			jContentPane.add(getBtnSave(), null);
			jContentPane.add(getJScrollPane(), null);
			jContentPane.add(getBtnRun(), null);
		}
		return jContentPane;
	}

	/**
	 * This method initializes btnLoad	
	 * 	
	 * @return javax.swing.JButton	
	 */
	private JButton getBtnLoad() {
		if (btnLoad == null) {
			btnLoad = new JButton();
			btnLoad.setBounds(new Rectangle(21, 14, 90, 25));
			btnLoad.setText("Load");
			btnLoad.addActionListener(new java.awt.event.ActionListener() {
				public void actionPerformed(java.awt.event.ActionEvent e) {
					JFileChooser fc = new JFileChooser();
					
					//In response to a button click:
					int returnVal = fc.showOpenDialog(Demo.this);
					 if (returnVal == JFileChooser.APPROVE_OPTION) {
				            File file = fc.getSelectedFile();
				            String filename = file.getAbsolutePath();
				            try {
								editor.loadFile(filename);
							} catch (Exception e1) {
								JOptionPane.showMessageDialog(Demo.this, e1.getMessage());
							}
					 }
				}
			});
		}
		return btnLoad;
	}

	/**
	 * This method initializes btnSave	
	 * 	
	 * @return javax.swing.JButton	
	 */
	private JButton getBtnSave() {
		if (btnSave == null) {
			btnSave = new JButton();
			btnSave.setBounds(new Rectangle(133, 14, 62, 26));
			btnSave.setText("Save");
		}
		return btnSave;
	}

	/**
	 * This method initializes jScrollPane	
	 * 	
	 * @return javax.swing.JScrollPane	
	 */
	private JScrollPane getJScrollPane() {
		if (jScrollPane == null) {
			jScrollPane = new JScrollPane();
			jScrollPane.setBounds(new Rectangle(24, 67, 459, 291));
			jScrollPane.setViewportView(getTxtBuffer());
		}
		return jScrollPane;
	}

	/**
	 * This method initializes txtBuffer	
	 * 	
	 * @return javax.swing.JTextArea	
	 */
	private JTextArea getTxtBuffer() {
		if (txtBuffer == null) {
			txtBuffer = new JTextArea();
		}
		editor = new TextEditor(txtBuffer);
		return txtBuffer;
	}

	/**
	 * This method initializes btnRun	
	 * 	
	 * @return javax.swing.JButton	
	 */
	private JButton getBtnRun() {
		if (btnRun == null) {
			btnRun = new JButton();
			btnRun.setBounds(new Rectangle(256, 19, 102, 25));
			btnRun.setText("Run Script");
			btnRun.addActionListener(new java.awt.event.ActionListener() {
				public void actionPerformed(java.awt.event.ActionEvent e) {
					runScript();
				}
			});
		}
		return btnRun;
	}
	
	void runScript() {

		JFileChooser fc = new JFileChooser();
		int returnVal = fc.showOpenDialog(Demo.this);
		 if (returnVal == JFileChooser.APPROVE_OPTION) {
	            File file = fc.getSelectedFile();
	            String filename = file.getAbsolutePath();
	            String buffer = "";
	            try {
	            	BufferedReader rd = new BufferedReader(new FileReader(filename));
	        		
	        		String line = rd.readLine();
	        		while (line != null) {
	        			buffer += line + "\n";
	        			line = rd.readLine();
	        		}
	        		rd.close();
				} catch (Exception e1) {
					JOptionPane.showMessageDialog(this, e1.getMessage());
					return;
				}
	            ScriptEngineManager factory = new ScriptEngineManager();
		        ScriptEngine engine = factory.getEngineByName("JavaScript");
		        engine.put("editor", editor);
		        
		        try {
					engine.eval(buffer);
				} catch (ScriptException e1) {
					JOptionPane.showMessageDialog(this, e1.getMessage());
				}
		 }
	}

}  //  @jve:decl-index=0:visual-constraint="10,10"

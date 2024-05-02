import java.util.HashMap;

import figlang.analysis.DepthFirstAdapter;
import figlang.node.AAttribute;
import figlang.node.AFigure;

public class FiguresReader extends DepthFirstAdapter {
	private Figure currentFigure;
	
	@Override
	public void inAFigure(AFigure node) {
		currentFigure = new Figure();
		currentFigure.figType = node.getId().getText();
	}

	@Override
	public void outAAttribute(AAttribute node) {
		currentFigure.info.put(node.getId().getText(), node.getLiteral().toString());
	}

	@Override
	public void outAFigure(AFigure node) {
		Main.drawing.add(currentFigure);
	}
	
	

}

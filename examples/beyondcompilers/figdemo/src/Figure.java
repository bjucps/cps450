import java.util.HashMap;

public class Figure {
	public String figType;
	public HashMap<String, Object> info = new HashMap<String, Object>();

	public String toString() {
		return figType + ": " + info;
	}
}

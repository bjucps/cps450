package cps450;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class SymbolTableTest {

	@Test
	public void testSymbolTable() {
		SymbolTable table = new SymbolTable();
		assertTrue(table.getCurrentScope() == 0);
		table.beginScope();
		assertTrue(table.getCurrentScope() == 1);
	}

}

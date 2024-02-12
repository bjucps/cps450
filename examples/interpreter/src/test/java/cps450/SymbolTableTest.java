package cps450;

import static org.junit.Assert.*;

import org.junit.Test;

public class SymbolTableTest {

	@Test
	public void testSymbolTable() {
		SymbolTable table = new SymbolTable();
		assertTrue(table.getCurrentScope() == 0);
		table.beginScope();
		assertTrue(table.getCurrentScope() == 0);
	}

}

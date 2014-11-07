package com.junit.householdChores;

import static org.junit.Assert.*;
import com.householdChores.JDBCConnection;
import org.junit.Test;

public class DBConnectTest {

	JDBCConnection jdbcConnection = new JDBCConnection();

	@Test
	public void dbConectionTest() {
		
		assertNotNull("JDBC Connection Test",jdbcConnection.makeConnection());
	}

}

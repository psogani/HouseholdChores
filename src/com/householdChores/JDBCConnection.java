package com.householdChores;

import java.sql.*;
/**
 * 
 * Class that is responsible for estabishing a JDBC link to the database
 *
 */
public class JDBCConnection 
{
	// JDBC driver name and database URL
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	static final String DB_URL = "jdbc:mysql://localhost/householdchores";

	//  Database credentials
	static final String USER = "root";
	static final String PASS = "password";


	public Connection makeConnection()
	{
		Connection conn=null;
		try
		{
			// Register JDBC driver
			Class.forName("com.mysql.jdbc.Driver");

			// Open a connection
			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return conn;
	}
}

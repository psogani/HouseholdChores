package com.householdChores;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Map;

public class RegisterDataAccess {
	
	Map<String,String> params;
	JDBCConnection jdbc;
	Connection conn;
	
	public RegisterDataAccess(Map<String, String> params) {
		
		this.params = params;
	}
	
	
	boolean doesUserExist(){
		
		boolean doesUserExist = false;
		
		jdbc = new JDBCConnection();
		conn = jdbc.makeConnection();

		if(conn!=null)
		{
			Statement stmt = null;
			ResultSet rs = null;

			try
			{
				//System.out.println("Creating statement...");
				stmt = conn.createStatement();

				String sql;
				sql = "SELECT * FROM users where userId ='" + params.get("userId");
				rs = stmt.executeQuery(sql);
				
				if (rs.next()) 
				{
					doesUserExist = true;
				}

				rs.close();
				stmt.close();
				conn.close();
				
			}
			catch(Exception e)
			{
				System.out.print(e);
			}
		}

		return doesUserExist;
	}
	
	boolean registerUser(){
		
		boolean inserted = false;
		
		jdbc = new JDBCConnection();
		conn = jdbc.makeConnection();

		if(conn != null)
		{
			Statement stmt = null;
			ResultSet rs = null;

			try
			{
				//System.out.println("Creating statement...");
				stmt = conn.createStatement();

				String sql;
				sql = "";
				rs = stmt.executeQuery(sql);
				
				if (rs.next()) 
				{
					inserted = true;
				}

				rs.close();
				stmt.close();
				conn.close();
				
			}
			catch(Exception e)
			{
				System.out.print(e);
			}
		}

		return inserted;
	}
}
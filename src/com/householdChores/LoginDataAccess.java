package com.householdChores;

import java.sql.*;

public class LoginDataAccess 
{
	public boolean getUser(String userId,String password)
	{
		boolean isuserValid=false;
		JDBCConnection jdbc =new JDBCConnection();
		Connection conn = jdbc.makeConnection();
		if(conn!=null)
		{

			Statement stmt = null;
			ResultSet rs=null;

			try
			{
				//Execute a query
				System.out.println("Creating statement...");
				stmt = conn.createStatement();

				String sql;
				sql = "SELECT * FROM users where userId ='" + userId+ "' and password = '" + password + "'";
				rs = stmt.executeQuery(sql);
				
				if (rs.next()) 
				{
					isuserValid=true;
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

		return isuserValid;
	}

}

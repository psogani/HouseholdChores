package com.householdChores;

import java.sql.*;

public class LoginDataAccess 
{
	public String getUser(String userName,String password)
	{
		JDBCConnection jdbc =new JDBCConnection();
		Connection conn = jdbc.makeConnection();
		String userId=null;
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
				sql = "SELECT * FROM users where userId ='" + userName+ "' and password = '" + password + "'";
				rs = stmt.executeQuery(sql);
				
				while(rs.next())
				{
					userId=rs.getString("uid");
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

		return userId;
	}

}

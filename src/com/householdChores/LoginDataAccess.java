package com.householdChores;

import java.sql.*;

import javax.servlet.http.HttpServletRequest;

/**
 * 
 * Class that communicates with the database for user login
 *
 */
public class LoginDataAccess 
{
	/**
	 * Method to Authenticate the user
	 * @param userName
	 * @param password
	 * @param request
	 * @return
	 */
	public String getUser(String userName,String password, HttpServletRequest request)
	{
		//estabilish connection
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
					String fname = rs.getString("fname");
					String lname = rs.getString("lname");
					request.getSession().setAttribute("username", fname+" "+lname);
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

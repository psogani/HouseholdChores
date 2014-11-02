package com.householdChores;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;

import com.mysql.jdbc.PreparedStatement;

public class RegisterDataInsert {
	
	Map<String,String> params;
	JDBCConnection jdbc;
	Connection conn;
	
	String firstName;
	String lastName;
	String email;
	String userId;
	String password;
	
	public RegisterDataInsert(Map<String, String> params) {
		
		this.params = params;
		this.firstName = params.get("firstName");
		this.lastName = params.get("lastName");
		this.email = params.get("email");
		this.userId = params.get("userId");
		this.password = params.get("password");
		
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
				stmt = conn.createStatement();

				String sql;
				sql = "SELECT * FROM users where userId ='" + params.get("userId") + "'";
				rs = stmt.executeQuery(sql);
				
				if (rs.next()) 
				{
					doesUserExist = true;
					System.out.println("Does not exist");
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
		
		//System.out.println("In register user");
		
		boolean inserted = false;
		
		jdbc = new JDBCConnection();
		conn = jdbc.makeConnection();

		if(conn != null)
		{
			try
			{
				String sql;
				sql = "INSERT INTO users(fname,lname,email,userId,password) VALUES(?,?,?,?,?)";
				
				PreparedStatement pst =(PreparedStatement) conn.prepareStatement(sql); 

				pst.setString(1,firstName);  
				pst.setString(2,lastName);        
				pst.setString(3,email);
				pst.setString(4,userId);
				pst.setString(5,password);
				
				int pstStatusCode = pst.executeUpdate();
				
				if(pstStatusCode != 0)
				{	
					inserted = true;
					System.out.println("Inserted");
				}  
				
				pst.close();
				conn.close();
				
			}
			catch(Exception e)
			{
				System.out.print(e);
			}
		}

		return inserted;
	}
	
	ArrayList<User> getAllUsers()
	{
		ArrayList<User> userList = new ArrayList<User>();
		
		jdbc = new JDBCConnection();
		conn = jdbc.makeConnection();

		if(conn!=null)
		{
			Statement stmt = null;
			ResultSet rs = null;

			try
			{
				stmt = conn.createStatement();

				String sql;
				sql = "SELECT * FROM users";
				rs = stmt.executeQuery(sql);
				
				while (rs.next() != false) 
				{
					User user = new User();
					user.setUid(rs.getString("uid"));
					user.setfName(rs.getString("fName"));
					user.setlName(rs.getString("lName"));
					user.setEmail(rs.getString("email"));
					user.setUserId(rs.getString("userId"));
					
					userList.add(user);
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
		return userList;
	}
}
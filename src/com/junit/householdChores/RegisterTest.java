package com.junit.householdChores;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.springframework.web.servlet.ModelAndView;

import com.householdChores.JDBCConnection;
import com.householdChores.RegisterController;
import com.householdChores.RegisterDataInsert;
import com.householdChores.User;
import com.mysql.jdbc.PreparedStatement;

import java.sql.*;

public class RegisterTest {

Map<String,String> params;
	
	RegisterDataInsert registerDataInsertWithParams;
	RegisterDataInsert registerDataInsertWithoutParams;
	RegisterController registerController;

	@Before
	public void setUp()
	{
		params = new HashMap<String, String>();
		
		params.put("firstname","TestFName");
		params.put("lastname","TestLName");
		params.put("email","test@test.com");
		params.put("userid","jUnitTest");
		params.put("password","junit123");
		
		registerDataInsertWithParams = new RegisterDataInsert(params);
		registerDataInsertWithoutParams = new RegisterDataInsert();
		registerController = new RegisterController();
	}
	
	
	@Test
	public void userExistanceTest() {
		
		registerDataInsertWithoutParams.setUserId("psogani");
		assertTrue("User Existance Check", registerDataInsertWithoutParams.doesUserExist());
	}
	
	@Test
	public void userDoesNotExistTest() {
		
		registerDataInsertWithoutParams.setUserId("abcdef12");
		assertFalse("User Does Not Exist Check", registerDataInsertWithoutParams.doesUserExist());
		
	}
	
	@Test
	public void correctRegistrationTest() {
		
		boolean inserted = registerDataInsertWithParams.registerUser();
		boolean deleted = false;
		
		if(inserted)
		{
			System.out.println("DELETE");
			
			JDBCConnection jdbcConnection = new JDBCConnection();
			Connection conn = jdbcConnection.makeConnection();
			
			if(conn != null)
			{
				try
				{
					String sql;
					sql = "DELETE FROM users WHERE userId = ?";
					
					PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql); 

					st.setString(1,"jUnitTest");  
					
					int pstStatusCode = st.executeUpdate();
					
					if(pstStatusCode != 0)
					{	
						deleted = true;
					} 
					
					st.close();
					conn.close();
					
				}
				catch(Exception e)
				{
					System.out.print(e);
				}
			}
			
		}
		
		
		assertTrue("Correct Registration Test", inserted && deleted);

		
	}
	
	@Test
	public void inCorrectRegistrationTest() {
		
		registerDataInsertWithoutParams.setUserId("");
		assertFalse("All Null Value Test", registerDataInsertWithoutParams.registerUser());

		
	}
	
	
	@Test
	public void retrieveAllUsersTest() {
		
		ArrayList<User> testUserList = registerDataInsertWithoutParams.getAllUsers();
		assertTrue("Retrieve Rows from Users Table Test", testUserList != null);
		
	}
	

	@Test
	public void getRegisterPageTest() {
		
		ModelAndView model = registerController.getAdmissionForm();
		assertNotNull("Get Register Page Test", model);
	}

}

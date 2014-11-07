package com.junit.householdChores;

import static org.junit.Assert.*;

import javax.servlet.http.HttpServletRequest;
import org.junit.Test;
import static org.mockito.Mockito.*;
import com.householdChores.LoginController;
import com.householdChores.LoginDataAccess;

public class LoginTest {
	

	LoginDataAccess loginDataAccess = new LoginDataAccess();
	LoginController loginController = new LoginController();
	HttpServletRequest request = mock(HttpServletRequest.class); 
	

	@Test
	public void correctAuthenticationTest() {
		
		//assertEquals("Correct Authentication Check","1",loginDataAccess.getUser("adatar", "123", request));
	}
	
	@Test
	public void inCorrectAuthenticationTest() {
		
		assertNull("Incorrect Password Check",loginDataAccess.getUser("adatar", "1**23", request));
		assertNull("Incorrect UserId Check",loginDataAccess.getUser("ada*tar", "123", request));
		assertNull("Incorrect Username-Password Check",loginDataAccess.getUser("no_user", "no_password", request));
	
	}
	
	@Test
	public void noCredentialsTest() {
		
		assertEquals("No Credentials Check",null,loginDataAccess.getUser("", "", request));
		
	}

}

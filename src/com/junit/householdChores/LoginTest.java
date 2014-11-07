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
		
		assertEquals("Correct Authentication Check","1",loginDataAccess.getUser("adatar", "123", request));
	}
	
	@Test
	public void inCorrectAuthenticationTest() {
		
		assertEquals("Incorrect Password Check",null,loginDataAccess.getUser("adatar", "1**23", request));
		assertEquals("Incorrect UserId Check",null,loginDataAccess.getUser("ada*tar", "123", request));
		assertEquals("Incorrect Username-Password Check",null,loginDataAccess.getUser("no_user", "no_password", request));
	
	}
	
	@Test
	public void noCredentialsTest() {
		assertEquals("No Credentials Check",null,loginDataAccess.getUser("", "", request));
	}

}

package com.householdChores;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

	@RequestMapping(value="/Login", method = RequestMethod.GET)
	public ModelAndView getAdmissionForm() 
	{
		ModelAndView model = new ModelAndView("Login");
		return model;
	}
	

	@RequestMapping(value="/Home.html", method = RequestMethod.POST)
	public ModelAndView submitAdmissionForm(@RequestParam("userId") String userId,@RequestParam("password") String password) 
	{
		LoginDataAccess lad=new LoginDataAccess();
		boolean isUserValid=lad.getUser(userId, password);
		ModelAndView model;
		if(isUserValid)
		{
			model = new ModelAndView("Home");
			model.addObject("msg","Details submitted by you:: Name: "+userId+ ", Hobby: " + password);
		}
		else
		{
			model = new ModelAndView("Login");
			model.addObject("msg","Details submitted by you:: Name: "+userId+ ", Hobby: " + password);
		}
		

		return model;
	}
}
package com.householdChores;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class RegisterController {
	
	@RequestMapping(value="/Register", method = RequestMethod.GET)
	public ModelAndView getAdmissionForm() 
	{
		ModelAndView model = new ModelAndView("Register");
		return model;
	}
	
	@RequestMapping(value="/Register", method = RequestMethod.POST)
	public ModelAndView submitAdmissionForm(@RequestParam Map<String, String> params) 
	{
		
		RegisterDataInsert rda = new RegisterDataInsert(params);
		
		boolean doesUserExist = rda.doesUserExist();
		ModelAndView model;
		
		if(!doesUserExist)
		{
			if(rda.registerUser())
			{
				model = new ModelAndView("Login");
				model.addObject("fname",params.get("firstName"));
			}
			else
			{
				model = new ModelAndView("Register");
				model.addObject("msg","Oops. We are getting a lot of traffic. Please try again in sometime.");
				//Could not add. Try again later
			}
			
		}
		else
		{
			model = new ModelAndView("Register");
			model.addObject("msg","Username already exists.");
		}
		return model;
	}

}

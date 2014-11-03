package com.householdChores;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
public class RegisterController {
	
	@RequestMapping(value="/Register", method = RequestMethod.GET)
	public ModelAndView getAdmissionForm() 
	{
		ModelAndView model = new ModelAndView("Register");
		return model;
	}
	
	@RequestMapping(value="/RegisterSubmit", method = RequestMethod.POST)
	public ModelAndView submitAdmissionForm(@RequestParam Map<String, String> params, final RedirectAttributes redirectAttributes) 
	{
		
		RegisterDataInsert rda = new RegisterDataInsert(params);
		
		boolean doesUserExist = rda.doesUserExist();
		ModelAndView model = null;
		
		if(!doesUserExist)
		{
			if(rda.registerUser())
			{
				//model = new ModelAndView("Login");
				//model.addObject("fname",params.get("firstName"));
				model = new ModelAndView("redirect:Login");
				redirectAttributes.addFlashAttribute("msg", "Registration successfull! Go ahead and Log in");
				//return model; 
			}
			else
			{
				model = new ModelAndView("Register");
				model.addObject("msg","Oops. We are getting a lot of traffic. Please try again in sometime.");
				//Could not add. Try again later
			}
			
		}
		else if(doesUserExist)
		{
			model = new ModelAndView("Register");
			model.addObject("msg","Username already exists!!");
		}
		return model;
	}

}

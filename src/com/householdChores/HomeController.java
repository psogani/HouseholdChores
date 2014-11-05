package com.householdChores;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


public class HomeController 
{
	@RequestMapping(value="/Home.html", method = RequestMethod.GET)
	public ModelAndView getHomePageData(HttpServletRequest request) 
	{
		ModelAndView model = null;
		System.out.println("Home Controller");
		model = new ModelAndView("Home");
		
		return model;
	}
}

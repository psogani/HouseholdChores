package com.householdChores;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

	@RequestMapping(value="/Login", method = RequestMethod.GET)
	public ModelAndView getLoginData(ModelAndView m) 
	{
		if(m.isEmpty())
			m = new ModelAndView("Login");
		return m;
	}
	

	@RequestMapping(value="/Home.html", method = RequestMethod.POST)
	public ModelAndView processLoginForm(@RequestParam("username") String userId,@RequestParam("password") String password) 
	{
		LoginDataAccess lad=new LoginDataAccess();
		String userIdFromTable =lad.getUser(userId, password);
		ModelAndView model;
		if(userIdFromTable!=null)
		{
			model = new ModelAndView("Home");
			CurrentUserTaskDataAccess userTaskData=new CurrentUserTaskDataAccess();
			ArrayList<UserTasks> tasks=userTaskData.getCurrentUserTask(userIdFromTable);
			model.addObject("currentTasks",tasks);
			model.addObject("headerMessage",userId);
		}
		else
		{
			model = new ModelAndView("Login");
			model.addObject("msg","Details submitted by you:: Name: "+userId+ ", Hobby: " + password);
		}
		

		return model;
	}
}
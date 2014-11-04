package com.householdChores;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class LoginController {

	@RequestMapping(value="/Login", method = RequestMethod.GET)
	public ModelAndView getLoginData(ModelAndView m) 
	{
		if(m.isEmpty())
			m = new ModelAndView("Login");
		return m;
	}
	

	@RequestMapping(value="/Home.html", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView processLoginForm(final RedirectAttributes redirectAttributes,HttpServletRequest request) 
	{
		ModelAndView model = null;
		if(request.getMethod().equals("GET")){
			System.out.println("here");
			model = new ModelAndView("Home");
		}
		
		else if(request.getMethod().equals("POST")){
			LoginDataAccess lad=new LoginDataAccess();
			String userId = request.getParameter("username");
			String password = request.getParameter("password");
			String userIdFromTable =lad.getUser(userId, password);
			RegisterDataInsert rd = new RegisterDataInsert();
			
			//@RequestParam("username") String userId,@RequestParam("password") String password,
			rd.setUserId(userId);
			if(!rd.doesUserExist()){
				model = new ModelAndView("redirect:Login");
				redirectAttributes.addFlashAttribute("msg", "Invalid credentials!!");
				return model;
			}
			
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
				model.addObject("msg","Invalid credentials!!");
			}
			
		}
		
		return model;
	}
}
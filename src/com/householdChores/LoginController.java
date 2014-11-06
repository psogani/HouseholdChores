package com.householdChores;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
/**
 * 
 * Controller for the login page that authenticates the user and fetches required data for the dashboard
 *
 */
@Controller
public class LoginController {
	/**
	 * Function that gets thedata for the login page
	 * @param m
	 * @return
	 */
	@RequestMapping(value="/Login", method = RequestMethod.GET)
	public ModelAndView getLoginData(ModelAndView m) 
	{
		if(m.isEmpty())
			m = new ModelAndView("Login");
		return m;
	}
	
	/**
	 * Function to process data coming in from the login page
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/Home.html", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView processLoginForm(final RedirectAttributes redirectAttributes,HttpServletRequest request) 
	{
		ModelAndView model = null;
		//if the method is get
		if(request.getMethod().equals("GET"))
		{
			//get user id from the session
			String uid=(String)request.getSession().getAttribute("session_userId");
			System.out.println("Getting the data for home page");
			model = new ModelAndView("Home");
			
			//get data required for the dashboard
			CurrentUserTaskDataAccess userTaskData=new CurrentUserTaskDataAccess();
			ArrayList<UserTasks> tasks=userTaskData.getCurrentUserTask(uid);
			model.addObject("currentTasks",tasks);
			int points=userTaskData.getCurrentPoints(tasks);
			model.addObject("currentPoints",points);
			
		}
		//if the method is post
		else if(request.getMethod().equals("POST")){
			
			//get the data from login page
			LoginDataAccess lad=new LoginDataAccess();
			String userId = request.getParameter("username");
			String password = request.getParameter("password");
			
			//authenticate the user
			String userIdFromTable =lad.getUser(userId, password, request);
			
			if(userIdFromTable!=null)
			{
				model = new ModelAndView("Home");
				CurrentUserTaskDataAccess userTaskData=new CurrentUserTaskDataAccess();
				request.getSession().setAttribute("session_userId", userIdFromTable);
				ArrayList<UserTasks> tasks=userTaskData.getCurrentUserTask(userIdFromTable);
				int points=userTaskData.getCurrentPoints(tasks);
				model.addObject("currentPoints",points);
				model.addObject("currentTasks",tasks);
				model.addObject("headerMessage",userId);
			}
			//if not a valid user then return back to login with appropriate messages
			else
			{
				model = new ModelAndView("redirect:Login");
				redirectAttributes.addFlashAttribute("msg", "Invalid credentials!!");
				return model;
			}
			
		}
		
		return model;
	}
}

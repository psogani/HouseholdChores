package com.householdChores;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class AllocateTasksController {
	
	@RequestMapping(value="/AllocateTasks", method = RequestMethod.GET)
	public ModelAndView getAdmissionForm() 
	{
		AllocateTasksDataRetrieveAndInsert atra = new AllocateTasksDataRetrieveAndInsert();
		
		RegisterDataInsert rd = new RegisterDataInsert();
		
		ArrayList<UserTasks> utList = atra.getTaskData();
		
		ModelAndView model = new ModelAndView("AllocateTasks");
		model.addObject("taskList", utList);
		model.addObject("userList", rd.getAllUsers());
		return model;
	}
	
	@RequestMapping(value="/Home", method = RequestMethod.POST)
	public ModelAndView submitAdmissionForm(@RequestParam String[] users, String[] tasks) 
	{
		AllocateTasksDataRetrieveAndInsert atra = new AllocateTasksDataRetrieveAndInsert(tasks,users);
		boolean updated = atra.assignTasks();
		ModelAndView model;
		
		if(updated)
		{
			model = new ModelAndView("redirect:Home.html");
			model.addObject("msg","Tasks Assigned.");
		}
		else
		{
			model = new ModelAndView("AllocateTasks");
			model.addObject("msg","Could not assign, please try again.");
		}
		return model;
	}


}

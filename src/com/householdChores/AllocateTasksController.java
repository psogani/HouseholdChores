package com.householdChores;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * 
 * Controller for allocating the task
 *
 */
@Controller
public class AllocateTasksController {
	
	@RequestMapping(value="/AllocateTasks", method = RequestMethod.GET)
	public ModelAndView getTaskData() 
	{
		//create object for class interacting with database
		AllocateTasksDataRetrieveAndInsert atra = new AllocateTasksDataRetrieveAndInsert();
		
		RegisterDataInsert rd = new RegisterDataInsert();
		
		//get the task data
		ArrayList<UserTasks> utList = atra.getTaskData();
		
		//populate required paramaters in the model
		ModelAndView model = new ModelAndView("AllocateTasks");
		model.addObject("taskList", utList);
		model.addObject("userList", rd.getAllUsers());
		return model;
	}
	
	@RequestMapping(value="/Home", method = RequestMethod.POST)
	public ModelAndView processTaskData(@RequestParam String[] users, String[] tasks, final RedirectAttributes redirectAttributes) 
	{
		//create objects and make appropriate calls to classes interacting with the database
		AllocateTasksDataRetrieveAndInsert atra = new AllocateTasksDataRetrieveAndInsert(tasks,users);
		boolean updated = atra.assignTasks();
		ModelAndView model;
		
		//redirect depending on the result of interaction with the database
		if(updated)
		{
			model = new ModelAndView("redirect:Home.html");
			redirectAttributes.addFlashAttribute("msg","Tasks Assigned");
		}
		else
		{
			model = new ModelAndView("AllocateTasks");
			model.addObject("msg","Could not assign, please try again.");
		}
		return model;
	}


}

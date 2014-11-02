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
		ArrayList<UserTasks> utList = atra.getTaskData();
		
		ModelAndView model = new ModelAndView("AllocateTasks");
		model.addObject("taskList", utList);
		return model;
	}
	
	@RequestMapping(value="/Home", method = RequestMethod.POST)
	public ModelAndView submitAdmissionForm(@RequestParam Map<String, String> params) 
	{
		AllocateTasksDataRetrieveAndInsert atra = new AllocateTasksDataRetrieveAndInsert(params);
		
		boolean updated = atra.assignTasks();
		ModelAndView model;
		
		if(updated)
		{
				model = new ModelAndView("Home");
				model.addObject("msg","Tasks Assigned.");	
		}
		else
		{
			model = new ModelAndView("AssignTasks");
			model.addObject("msg","Could not assign, please try again.");
		}
		return model;
	}


}

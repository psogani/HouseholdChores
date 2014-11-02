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
	public ModelAndView getAllocateTaskPage() 
	{
		AllocateTasksDataRetrieveAndInsert atra = new AllocateTasksDataRetrieveAndInsert();
		System.out.println("Hello");
		RegisterDataInsert rd = new RegisterDataInsert(null);
		rd.getAllUsers();
		
		ArrayList<UserTasks> utList = atra.getTaskData();
		//System.out.println("hhhhhhhh" + utList.size());
		
		ModelAndView model = new ModelAndView("AllocateTasks");
		model.addObject("taskList", utList);
		model.addObject("userList", rd.getAllUsers());
		return model;
	}
	
	@RequestMapping(value="/Home", method = RequestMethod.POST)
	public ModelAndView submitAllocateTaskPage(@RequestParam String[] users, String[] tasks) 
	{
		AllocateTasksDataRetrieveAndInsert atra = new AllocateTasksDataRetrieveAndInsert(tasks,users);
		boolean updated = atra.assignTasks();
		ModelAndView model;
		
		if(updated)
		{
			model = new ModelAndView("Home");
			//TODO: "ADDDD CURRENT TASK LIST DEPENDING UPON THE CURRENT USER" SESSION? 
			CurrentUserTaskDataAccess cutd = new CurrentUserTaskDataAccess();
			ArrayList<UserTasks> taskList = cutd.getCurrentUserTask("1");
			model.addObject("currentTasks", taskList);
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

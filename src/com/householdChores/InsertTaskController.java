package com.householdChores;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
/**
 * 
 * This class is the controller which co-ordinates inserting task data
 *
 */
@Controller
public class InsertTaskController 
{
	/**
	 * Function that gets the data for the task page
	 * @return
	 */
	@RequestMapping(value="/CreateTask", method = RequestMethod.GET)
	public ModelAndView getTaskPage() 
	{
		ModelAndView model = new ModelAndView("CreateTasks");
		return model;
	}
	
	/**
	 * Function that gets the date for which the task needs to be created
	 * @param date
	 * @return
	 */
	@RequestMapping(value="/CreateTaskForDate", method = RequestMethod.POST)
	public ModelAndView processTaskPage(@RequestParam("startDate") String date) 
	{
		ModelAndView model = new ModelAndView("CreateTaskForSelectedDate");
		System.out.println("Date"+date);
		model.addObject("selectedDate", date);
		return model;
	}
	/**
	 * Function that processes the input task date
	 * @param date
	 * @param taskName
	 * @param pointValue
	 * @param recurring
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value="/processTaskInput", method = RequestMethod.POST)
	public ModelAndView processTaskInput(@RequestParam("startDate") String date,@RequestParam("taskName") String[] taskName,@RequestParam("pointValue") String[] pointValue,@RequestParam("recurring") String[] recurring, final RedirectAttributes redirectAttributes) 
	{
		ModelAndView model = null;
		//get recurring tasks
		boolean[] isTaskRecurring=new boolean[taskName.length];
		for(int i=0;i<recurring.length;i++)
		{
			isTaskRecurring[Integer.parseInt(recurring[i])-1]=true;
		}
		
		//insert the tasks in the database
		TaskDataInsert tdi=new TaskDataInsert();
		if(tdi.insertTaskData(taskName, pointValue, isTaskRecurring, date)){
			model = new ModelAndView("CreateTaskForSelectedDate");
			model.addObject("msg", "Task successfully created");
			model.addObject("selectedDate", date);
		}
		//model.addObject("selectedDate", date);
		return model;
	}

}

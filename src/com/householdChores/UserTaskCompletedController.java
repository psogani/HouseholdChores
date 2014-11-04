package com.householdChores;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserTaskCompletedController {
	@RequestMapping(value="/TaskComplete", method = RequestMethod.GET)
	public ModelAndView getAdmissionForm(HttpServletRequest request) 
	{
		ModelAndView model = new ModelAndView("TaskComplete");
		CurrentUserTaskDataAccess userTaskData=new CurrentUserTaskDataAccess();
		String uId = (String) request.getSession().getAttribute("session_uId");
		ArrayList<UserTasks> tasks=userTaskData.getCurrentUserTask(uId);
		model.addObject("userTasks",tasks);
		return model;
	}
	
	@RequestMapping(value="/markComplete", method = RequestMethod.POST)
	public ModelAndView markCompleteInDatabase(@RequestParam("markComplete") String[] checkBoxValues ){
		ModelAndView model = null;
		TaskCompleteUpdateDone updateDb = new TaskCompleteUpdateDone();
		updateDb.setCheckBoxValues(checkBoxValues);
		boolean status = updateDb.updateDoneColumnDb();
		if( status == true){
			model = new ModelAndView("redirect:Home.html");
			model.addObject("msg","Your selected task/s has/have been marked as complete successfully");
		}
		return model;
		
	}

}

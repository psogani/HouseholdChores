package com.householdChores;
import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserTaskCompletedController {
	@RequestMapping(value="/TaskComplete", method = RequestMethod.GET)
	public ModelAndView getAdmissionForm() 
	{
		ModelAndView model = new ModelAndView("TaskComplete");
		CurrentUserTaskDataAccess userTaskData=new CurrentUserTaskDataAccess();
		ArrayList<UserTasks> tasks=userTaskData.getCurrentUserTask("1");
		model.addObject("userTasks",tasks);
		return model;
	}

}

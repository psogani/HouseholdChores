package com.maincontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@SuppressWarnings("unused")

@Controller
public class MainController {
	@RequestMapping("/home")
	public ModelAndView homePageLoad() {
		ModelAndView model = new ModelAndView("login");
		return model;
	}

}

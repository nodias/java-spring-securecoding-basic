package kr.co.openeg.lab.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelloController {

	@RequestMapping(value = "/welcome.do")
	public ModelAndView welcomePage() {
		System.out.println("********************");
		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Hello World");
		model.addObject("message", "This is welcome page!");
		model.setViewName("/test/hello");
		System.out.println("/test/hello");
		return model;

	}

	@RequestMapping(value = "/admin.do", method = RequestMethod.GET)
	public ModelAndView adminPage() {
		System.out.println("-------------------------------------");
		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Hello World");
		model.addObject("message", "This is protected page!");
		model.setViewName("/test/admin");
		System.out.println("/test/admin");

		return model;

	}

}
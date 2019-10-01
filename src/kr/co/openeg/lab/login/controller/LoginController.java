package kr.co.openeg.lab.login.controller;

import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.openeg.lab.login.model.LoginSessionModel;
import kr.co.openeg.lab.login.service.LoginService;
import kr.co.openeg.lab.login.service.LoginValidator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class LoginController {
	 
	@Resource(name="loginService")
	private LoginService service;
	
	@RequestMapping("/login.do")
	public String login() {		
		
		return "/board/login";
	}
	
	@RequestMapping(value="/login.do", method = RequestMethod.POST)
	public ModelAndView loginProc(@ModelAttribute("LoginModel") LoginSessionModel loginModel, 
			   BindingResult result, HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		

		// form validation
		new LoginValidator().validate(loginModel, result);
		if(result.hasErrors()){
			mav.setViewName("/board/login");
			return mav;
		}
		
		String userId = loginModel.getUserId();
		String userPw = loginModel.getUserPw();
		LoginSessionModel loginCheckResult = service.checkUserId(userId,userPw);
		
		//check joined user
		if(loginCheckResult == null){
			mav.addObject("userId", userId);
			mav.addObject("errCode", 1);	// not exist userId in database
			mav.setViewName("/board/login");			
			return mav; 
		}else {
			session.setAttribute("userId", userId);
			session.setAttribute("userName", loginCheckResult.getUserName());
			session.setAttribute("CSRF_TOKEN", UUID.randomUUID().toString());
			mav.setViewName("redirect:/board/main.do");
			return mav;
		}
		
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:login.do";
	}
}

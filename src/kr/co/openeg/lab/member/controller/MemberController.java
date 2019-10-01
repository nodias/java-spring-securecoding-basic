package kr.co.openeg.lab.member.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.openeg.lab.login.service.LoginService;
import kr.co.openeg.lab.member.model.MemberModel;
import kr.co.openeg.lab.member.service.MemberService;
import kr.co.openeg.lab.member.service.MemberValidatior;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Resource(name="memberService")
	private MemberService service;
	
	@Resource(name="loginService")
	private LoginService loginService;
	
	@RequestMapping("/join.do")
	public String memberJoin(){
		return "/board/join";
	}
	
	@RequestMapping("/modify.do")	
	public ModelAndView memberModify(HttpSession session){
		ModelAndView mav=new ModelAndView();
		System.out.println("member_modify.do GET Request");
		String userId=(String)session.getAttribute("userId");
		System.out.println("session userid: "+userId);
		MemberModel m =service.findMember(userId);
		mav.addObject("member", m);
		mav.setViewName("/board/member_modify");	
		return mav;
	}
	
	@RequestMapping(value="/modify.do", method = RequestMethod.POST)	
	public ModelAndView memberModifyProcess(@ModelAttribute("MemberModel") MemberModel memberModel, 
			 BindingResult result, HttpServletRequest request, HttpSession session){
		ModelAndView mav=new ModelAndView();
		String userId=(String)session.getAttribute("userId");
		String passwd=request.getParameter("oldUserPw");
		System.out.println("passwd: "+memberModel.getUserPw());
		
		if ( loginService.checkUserId(userId, passwd) == null ) {
			mav.addObject("errCode", 1);
			mav.addObject("member",memberModel);
			mav.setViewName("/board/member_modify");
			return mav;
		} 
		
		if ( service.modifyMember(memberModel) ) {
		    mav.setViewName("redirect:/board/list.do");
		    session.setAttribute("userName", memberModel.getUserName());
		    return mav;	 
		} else {
			mav.addObject("errCode", 2);
			mav.setViewName("/board/member_modify");
			return mav;
		}
	}

	
	@RequestMapping(value="/join.do", method = RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("MemberModel") MemberModel memberModel, BindingResult result){
		ModelAndView mav = new ModelAndView();
		new MemberValidatior().validate(memberModel, result);
		if(result.hasErrors()){
			mav.setViewName("/board/join");
			return mav;
		}
		
		int errCode=service.addMember(memberModel);
	
		switch(errCode) {
		case 1:
			mav.addObject("errCode", 1); // userId already exist 
			mav.setViewName("/board/join");
			break;
		case 2: 
			mav.addObject("errCode", 2); // failed to add new member
			mav.setViewName("/board/join");
			break;
		case 3:
			mav.addObject("errCode", 3);
			mav.setViewName("/board/member_join_success"); // success to add new member; move to login page
			break;
		}
		return mav;
	
	}
}

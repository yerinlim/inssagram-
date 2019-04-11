package com.sts.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sts.domain.User_;
import com.sts.service.User_Service;

@Controller
public class LoginController {
	
	@Resource(name="user_Service")
	private User_Service user_Service;
	
	//로그인 페이지 
	@RequestMapping(value= {"/index","/login"})
	public String index() {
		return "login";
	}
	
	//로그인 실패 페이지 
	@RequestMapping("/loginFail")
	public String loginFail() {
		return "loginFail";
	}
	
	//로그인 액션
	@RequestMapping("/user/login")
	public String login(HttpSession session, User_ u) {
		String url = "redirect:/loginFail";
		User_ userSession = this.user_Service.login(u);
		if(userSession !=null) {
			session.setAttribute("userSession", userSession);
			//한시간 
			session.setMaxInactiveInterval(60*60);
			url ="redirect:/timeLine";
		}
		return url;
	}
}

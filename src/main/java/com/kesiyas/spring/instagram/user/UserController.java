package com.kesiyas.spring.instagram.user;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

	@GetMapping("/signin/view")
	public String signin() {
		return "user/signin";
	}
	
	@GetMapping("/signup/view")
	public String signup() {
		return "user/signup";
	}
	
	@GetMapping("/signout")
	public String signout(HttpServletRequest request)	{
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("userId");
		session.removeAttribute("loginId");
		
		return "redirect:/user/signin/view";
	}
	
	@GetMapping("/findId/view")
	public String findId() {
		return "user/findId";
	}
	
}

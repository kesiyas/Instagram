package com.kesiyas.spring.instagram.user;

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
	
}
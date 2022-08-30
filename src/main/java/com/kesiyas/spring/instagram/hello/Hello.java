package com.kesiyas.spring.instagram.hello;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class Hello {

	@ResponseBody
	@RequestMapping("/instagram/hello")
	public String helloHorld() {
		
		return "Hello world!";
	}
}

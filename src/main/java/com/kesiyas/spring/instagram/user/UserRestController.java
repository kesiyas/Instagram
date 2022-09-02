package com.kesiyas.spring.instagram.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kesiyas.spring.instagram.user.bo.UserBO;
import com.kesiyas.spring.instagram.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	UserBO userBO;

	@PostMapping("/signup")
	public Map<String, String> signup(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, @RequestParam("name") String name
			, @RequestParam("nickname") String nickname
			, @RequestParam("phoneNumber") String phoneNumber){
		
		Map<String, String> map = new HashMap<>();
		
		int count = userBO.addUser(loginId, password, name, nickname, phoneNumber);
		
		if(count == 1) {
			map.put("result", "success");
		} else {
			map.put("result", "fail");
		}
		
		return map;
	}
	
	@PostMapping("/is_duplicate")
	public Map<String, Boolean> isDuplicate(@RequestParam("loginId") String loginId){
		
		Map<String, Boolean> map = new HashMap<>();
		
		if(userBO.isDuplicate(loginId)) {
			map.put("result", true);
		} else {
			map.put("result", false);
		}
		
		return map;
	}
	
	@PostMapping("/signin")
	public Map<String, String> signin(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, HttpServletRequest request)	{
		
		Map<String, String> map = new HashMap<>();
		
		User user = userBO.getUser(loginId, password);
		
		if(user != null) {
			map.put("result", "success");
			
			HttpSession session = request.getSession();
			
			session.setAttribute("userId", user.getId());
			session.setAttribute("loginId", user.getLoginId());

		} else {
			map.put("result", "fail");
		}
		
		return map;
	}
	
}

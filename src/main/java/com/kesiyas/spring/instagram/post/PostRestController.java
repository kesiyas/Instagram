package com.kesiyas.spring.instagram.post;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.kesiyas.spring.instagram.post.bo.PostBO;
import com.kesiyas.spring.instagram.user.model.User;

@RestController
@RequestMapping("/post")
public class PostRestController {
	@Autowired
	private PostBO postBO;

	@PostMapping("/create")
	public Map<String, String> addPost(
			@RequestParam("content") String content
			, @RequestParam(value = "file", required=false) MultipartFile file
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int userId  = (Integer)session.getAttribute("userId");
		
		int count = postBO.addPost(content, file, userId);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@GetMapping("/search")
	public Map<String, String> searchUser(@RequestParam("loginId") String loginId) {
		
		List<User> user = postBO.searchUser(loginId);
		
		Map<String, String> result = new HashMap<>();
		
		if(user != null) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
		
	}
	
	
}

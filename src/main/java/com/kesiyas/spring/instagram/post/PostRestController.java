package com.kesiyas.spring.instagram.post;

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
	
	// 사용자 검색 기능
	@GetMapping("/search")
	public Map<String, Integer> searchUser(@RequestParam("loginId") String loginId) {		
			
		User user = postBO.searchUser(loginId);	
		
		int id = user.getId();
		
		Map<String, Integer> result = new HashMap<>();
		
		if(user != null) {
			result.put("id", id);
			
		}  else {
			result.put("id", null);
		}		
		return result;				
	}
	
	
}

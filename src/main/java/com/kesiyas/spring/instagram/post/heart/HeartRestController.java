package com.kesiyas.spring.instagram.post.heart;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kesiyas.spring.instagram.post.heart.bo.HeartBO;
import com.kesiyas.spring.instagram.post.heart.model.Heart;

@RestController
@RequestMapping("/post")
public class HeartRestController {
	
	@Autowired
	private HeartBO heartBO;

	@GetMapping("/like")
	public Map<String, String> like(@RequestParam("postId") int postId, HttpServletRequest request) {
	
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
				
		Map<String, String> result = new HashMap<>();
		
		int count = heartBO.like(postId, userId);		
				
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
					
		return result;
	}
	
	@GetMapping("/unlike")
	public Map<String, String> unLike(@RequestParam("postId") int postId, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		Map<String, String> result = new HashMap<>();
		
		int count = heartBO.unLike(postId, userId);
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
					
		return result;
		
	}
}

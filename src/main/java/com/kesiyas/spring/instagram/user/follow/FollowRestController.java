package com.kesiyas.spring.instagram.user.follow;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kesiyas.spring.instagram.user.follow.bo.FollowBO;

@RestController
@RequestMapping("/user")
public class FollowRestController {
	
	@Autowired
	private FollowBO followBO;
	
	@GetMapping("/follow")
	public Map<String, String> addFollow(
			@RequestParam("followeeId") int followeeId
			, HttpServletRequest request) {
		
			HttpSession session = request.getSession();
			
			int followerId = (Integer)session.getAttribute("userId");
			
			int count = followBO.addFollow(followeeId, followerId);
					
			Map<String, String> result = new HashMap<>();
			
			if(count == 1) {
				result.put("result", "success");
			} else {
				result.put("result", "fail");
			}
			
			return result;
	}

}

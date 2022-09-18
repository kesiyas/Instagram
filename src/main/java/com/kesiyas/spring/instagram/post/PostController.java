package com.kesiyas.spring.instagram.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kesiyas.spring.instagram.post.bo.PostBO;
import com.kesiyas.spring.instagram.post.model.Post;

@Controller
@RequestMapping("/post")
public class PostController {
	@Autowired
	private PostBO postBO;
	
	@GetMapping("/create/view")
	public String create() {
		return "post/create";
	}
	
	@GetMapping("/list/view")
	public String timeLine(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId  = (Integer)session.getAttribute("userId");
		
		List<Post> post = postBO.getTimeLine(userId);
		
		model.addAttribute("timeLine", post);
		
		return "post/list";
	}
	
	@GetMapping("/delete")
	public String deletePost(@RequestParam("id") int id, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId  = (Integer)session.getAttribute("userId");
		
		int count = postBO.deletePost(id, userId);
		
		if(count == 1) {
			return "redirect:/post/list/view";
		} else {
			return "";
		}	
	}
	
	@GetMapping("/search")
	public String searchUser(@RequestParam("loginId") String loginId) {
		
		return "";
	}
	
	@GetMapping("/detail/view")
	public String userDetailPage(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		
		List<Post> imgList = postBO.userImgList(userId);
		
		model.addAttribute("imgList", imgList);
		
		return "post/detail";
	}
		
	
}

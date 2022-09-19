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
import com.kesiyas.spring.instagram.user.model.User;

@Controller
@RequestMapping("/post")
public class PostController {
	@Autowired
	private PostBO postBO;
	
	@GetMapping("/create/view")
	public String create() {
		return "post/create";
	}
	
	// 타임라인 정보 가져오기
	@GetMapping("/list/view")
	public String timeLine(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId  = (Integer)session.getAttribute("userId");
		
		List<Post> post = postBO.getPostList(userId);
		
		model.addAttribute("timeLine", post);
		
		return "post/list";
	}
	
	// 게시글 삭제
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
	
	// 사용자 페이지로 이동
	@GetMapping("/detail/view") 
	public String userDetailPage(Model model, @RequestParam("userId") int userId) {
		
		User user = postBO.getUserData(userId);
		
		List<Post> list = postBO.getPostList(userId);
		
		model.addAttribute("list", list);
		model.addAttribute("user", user);
		
		return "post/detail";
		
	}
	
	
				
	
}
